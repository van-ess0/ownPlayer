#include "QwnImageProvider.h"


QwnImageProvider::QwnImageProvider(QQmlImageProviderBase::ImageType type, QQmlImageProviderBase::Flags flags) :
	QQuickImageProvider(type,flags)
{
}

QwnImageProvider::~QwnImageProvider()
{
}

QImage QwnImageProvider::requestImage(const QString& id, QSize* size, const QSize& requestedSize)
{
	QUrl url(SettingsManager::instance()->getOwnCloudHost() + SettingsManager::instance()->getApiCover() + id + "/cover");
	QNetworkRequest request(url);
	addAuthHeader(&request);

	QNetworkReply* reply = manager.get(request);

	QEventLoop eventLoop;
	QObject::connect(reply, SIGNAL(finished()), &eventLoop, SLOT(quit()));
	eventLoop.exec();
	qDebug() << reply->errorString();
	if (reply->error() != QNetworkReply::NoError) {
		return QImage();
	}

	QImage image = QImage::fromData(reply->readAll());
	size->setWidth(image.width());
	size->setHeight(image.height());
	return image;
}

void QwnImageProvider::addAuthHeader(QNetworkRequest* request)
{
	if (!request) {
		return;
	}

	QString concatenated = SettingsManager::instance()->getUserName()
						   + ":"
						   + SettingsManager::instance()->getUserPassword();
	QByteArray data = concatenated.toLocal8Bit().toBase64();
	QString headerData = "Basic " + data;
	request->setRawHeader("Authorization", headerData.toLocal8Bit());
}
