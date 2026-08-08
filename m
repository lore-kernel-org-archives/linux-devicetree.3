Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C53BB113
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786161550; cv=none; b=ZscUoc21YAwwgQ+lyGuRrU3Q6b/tcEiMETpHMNgbFlo3jorS3AkKgdRPv1UdgNL/gs0rCGfzd4vftINnQn1d9vkqkfz95iAmEC6frpE87SAVmNvbeNMnrDDnLY5dGUItv4972LrrjoEEzd4Xg3C7Qes8Z3JFn0LHzLAr/Gi8Pgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786161550; c=relaxed/simple;
	bh=ALPm4wN0XxL4MAFfiFBimkAb2s7JRwqMzky26VfX7JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIdvrKVUSIv2fUWfIApSafa3EE/sjS2j3sm8+9W0CdIduawMd02GEafiP/aNi8oLcXuUfZOLDilISnCUpjEz8qd/z48pLrt2MpWYc11aNndkGluqP/u0Dj/XODCDQZDa4SIQ1IO3Hm5lvkzArlhq1i+OkC5e1hceb4NjgbGP+XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVhbSvW3; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVhbSvW3"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so137525e0c.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 20:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786161547; x=1786766347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Z33c2/VIdQJHXYt//EgpTsqkZyaHvNkSYBF+LRNUwo=;
        b=VVhbSvW33O2Q7jd0o1t2l73Y/OFOskS8IYccyEO6ANNqlqmNv6RxnR93kXC8Rrv+n5
         k9XgSQqlo/NAh1Z/2Qt1pr5px1c+Wwa5fSBsad93nyXw5g3pkBlVxQ+IJDAf0X1IBnC8
         x+jOsk/JfO/sE2Awzo7vfPUT96QvWy1f9jjVZ1tqVV30Z19jshHRwPtK+29jSx2wQ1i9
         aC3wMW0IVLss6icIJ77cFANq/w4S4MTvE4t/JHlZk7I5AAHd5Df3ix16mD/Uqwo3DMMp
         cZLQRdSGwYLDmupGnoQPmWF/dQrKlaIEYBj9aZVhmGKDbttjWwx9lycV4UXmU2eI1BnU
         pgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786161547; x=1786766347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Z33c2/VIdQJHXYt//EgpTsqkZyaHvNkSYBF+LRNUwo=;
        b=po0kWk6GNuXnNmKebAy+G+0oCi8JoiKsEdkPiUG2+E2EWxRN9tRXkf4tf2mct+7aHz
         ZUd4LCe2zIb47pP1NBvTJ7axRT+ftAGnMXb1Uk0GsEZn1hvb4cpbTx9qaKLdw2r8jJOn
         3nRbOH39Xz2FkWBuNguVimUZfh/RRG6UDMke8OFu3ingk3wZDXsl33gudBcIshKmAN3A
         HZI+TB7uWOyx+fuZJzWjWZch4fpECvmURFHn/PuOkO5QuSv4mB1RJAbH8FdK0aQV5Xb1
         CprPK2IEIpwaQhiAGdyC1orq9nEanIPEx85ohPNld+OKrtcrLUrO8Zi4UJjby3wVzM1c
         eisw==
X-Forwarded-Encrypted: i=1; AHgh+RrwoQJtxG/pnOj8wphWQG8CG/ScUjCf+QVIzpOJMcmzyhk8oUb6hbUNgp/P3cO3e31YGzbKcUOkX68N@vger.kernel.org
X-Gm-Message-State: AOJu0YyYO2NDZ57ySOvRXSchBfgmPuFb1NO2tck+Mq1Z9Nxl/sZB2r7V
	8Io/3lVLhEFY8FICi9hN2khaalmHfkSV2uaAms8K0XQp/LIgy8DCr3YC
X-Gm-Gg: AR+sD12JiUd/dL/bsQTwy4PqboWwNcit1D3jLqURO+WkC+ZMS24KGu4xBypiV2M7pou
	yoU6BLjxUd8sZUsBpaxyqp+3c1I+STqoE75FJs8YKTadCA5MuUrMldk3YQmHMprpxG4roj+Q62p
	8j5n+CXUZVpOlovyANCH2WJMJP3xhCMNTazIpg97RcEILYGo2Mf4hgnoaCd8wo3mkGQ9OjIMJ/H
	vw3H9iE/zgf6Smso8GRJISj1kkScsBVyF5D01/dk4ZC6kTGuoFiQXrGMquRU5pOJ96nYL9/1Mb4
	IiVgznvYo7zB76SOnUIBtw6vkS/9WWTIRsT5ojRjSt6Mpj7h7YllwrvPwS+oXHofIe2dapCe0To
	t3/ZoKak/wHEkcI5Mo6w0vvv+cBhJovt+cGElCG/ti+y9wEzyIfKr8VYuWOei4cuOmC2GtOYK7Q
	qRD1Gl6s/AcguUHAoQND3cnwNr4nW1h6jCDTKsWbXkMSDZeUomQY6gCwMkg3oI
X-Received: by 2002:a05:6122:e142:b0:5bf:bb2c:1328 with SMTP id 71dfb90a1353d-5c3d9068a9emr4114304e0c.3.1786161547188;
        Fri, 07 Aug 2026 20:59:07 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b212fa6sm1432936e0c.16.2026.08.07.20.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 20:59:06 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 07 Aug 2026 22:58:31 -0500
Subject: [PATCH v3 9/9] iio: adc: ti-ads1262: support common mode supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-ads126x-v3-9-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
In-Reply-To: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=ALPm4wN0XxL4MAFfiFBimkAb2s7JRwqMzky26VfX7JM=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFllKyv+Bi7cp7Z2Ws4kW07VnctsRJW3+IbVM4j9nBazW
 Ei6USeqo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACbivJuRYeWM5Y9b32dbyz5U
 835veax3o2ybb8nmVZWsf16svJQk9JeRYbXY1eC4ZllZh1OuHVLKgq8MKmM/688WLC+r3/Yjsia
 RHQA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Enable common mode regulators. The usual configuration is to have our
own 'vbias' regulator connected internally as common mode voltage on the
AINCOM pin.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 533574169b04..238d803abc50 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -962,6 +962,27 @@ static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int ads1262_common_mode_setup(struct ads1262 *st)
+{
+	struct device *dev = &st->spi->dev;
+	char name[sizeof("aincom")];
+	int ret;
+
+	for (unsigned int i = 0; i <= ADS1262_INPMUX_AINCOM; i++) {
+		if (i < ADS1262_INPMUX_AINCOM)
+			scnprintf(name, sizeof(name), "ain%u", i);
+		else
+			scnprintf(name, sizeof(name), "aincom");
+
+		ret = devm_regulator_get_enable_optional(dev, name);
+		if (ret < 0 && ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to get common mode supply: %s\n", name);
+	}
+
+	return 0;
+}
+
 static int ads1262_regulator_enable(struct regulator_dev *rdev)
 {
 	struct ads1262 *st = rdev_get_drvdata(rdev);
@@ -1797,6 +1818,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	ret = ads1262_common_mode_setup(st);
+	if (ret)
+		return ret;
+
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 					      iio_pollfunc_store_time,
 					      ads1262_trigger_handler,

-- 
2.55.0

