Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF90480321
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512604; cv=none; b=PCVchde3w32LDhL8SVfCWow7da+SwGcuQxfjKx/SuuypliykGkVH01VHr/Wx0waky8X9JV/TXZsBF7iQJDO1MwGcND6ku7cWz5OzPUb9k/zThvyBNOoOVhUgxIa5/NmWhc4pneRjYPKgc5jrbhomt6W0MseNSQ+32b918yxlKWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512604; c=relaxed/simple;
	bh=3FrcsQlVziUdeKI/N9eYaCs4RJmRsrcZLsIz3cZSFq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqQFIywJAloywKUxrnAvsKtCRc7l+erECqAK8CPvvAMdRg/Af3GWrgTgTifbo3w97UFmIZWtUlfZIt6QY0FvtxnTHVkqF/8vpjRcVkhqXwJIu8ono9+Kq344MBifgqeDvRt3Nf4DW6Nur1W4Z8RMgQvMyLW5ie23uEpDptQ64kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAtM4dH+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAtM4dH+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf20f6be6bso36034095ad.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512603; x=1781117403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk0PkavUtmrtR763X7Xl8KGOaAn01gQsV9JDZDG7T1A=;
        b=cAtM4dH+jUXGOCPp8gH4t2OYkCT6gxfYFDuquYsvqFzbRonXuYyiGLx35PxuRsfo9e
         HCdfQBS4iLF0IsNsViisHqeiM8QyCpHDqWeJ8lBu29tUF9a7ttel3uHF2YfhKb3l9Wq4
         QJMjGR11dnyUGyRdceWLQu8rWn/rk80x+mWXDjLjpJqKKOrwvJPlFmuD9eULMiXHsvV6
         wABNdebnVnE2pV0fhOkjGsoj0+nSARU1Jn16PEzsYxIVtzGNSt7bZd87YIWiDLWLNMkl
         XArZ+Tf9snr+ahJtxOlYq8iHTzIyqHc1McxnKFIG6Lwg0l7QiRXQ++t/CYnD3DS3r97J
         1Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512603; x=1781117403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uk0PkavUtmrtR763X7Xl8KGOaAn01gQsV9JDZDG7T1A=;
        b=EZShRDaed8rHUezsmZPBj/OfXK4vOGbzJ/vQbivubF4jfghgdz7CF9DjJSz4JjGKIB
         zGLx6VpTzpQn6kY3eLqPxdb4u7iY34imH0X57MLty7riWdtw77bkUkdecoGEp3JYRFyV
         zIsvO4yFa3KW5cIYPIgP+iHKOy0HBBORNz7JOpKMITpcKQTGcI4za4lM5bkSJ+Dx9A3w
         ulcNUys3qE7b3Xtyk2gqudtqtmU9ZYctbKFANLUWSNRTScGRJ9CZ9KdK9zUEnR2y0Jq5
         fUpx6AVHxikV3CEaUb04eXcAprsvhzmRg0zQYzl6a1bbR3GfI5TTFrUDlU+YOaFg8nUa
         osjg==
X-Forwarded-Encrypted: i=1; AFNElJ8rtVxF1xLroPfqdSyigULV9wer8s62z4L2fusRr/G2XZcJjW9nm/HoYCa9/qZKEccukt6SIjpv1vRv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0uEA6NR+/DpOIgWRKrihmD3nG1k1TefcuERGSR1qLn/2gAKFr
	2zwNQ5lwxq0IJSs3aPrbMuTZRKzLAASZNKyIThOpCgYRvAygjUApiaRF
X-Gm-Gg: Acq92OErdsNrqyC7HC7fqHuUqwyn51wjtpU5fQeS3qDLKlZ7xfesHVopSADUlDhNFgr
	FeSRZEea+Mg5hd+yrTGHreOc9RzyOs7QlbNWyoY+FNGaOVF8y0hhiaH9kyGigolSmU0edZ1/sks
	k5w0jgJc3OYwg8O28Ut/csVoIsCg5fNXrPnCtyv3KywIEAuD33H0RvoyXEEARh64cPfKYKqBlMB
	o3qe4g7FNfXaKZUV9gDGqqqP1mfC6ViyahhBdOX6fOURv3EiMnGhYhCVAVcEYR9XzQBt1rNymDK
	yYd0P1hPs4UzWcgH/qEKy/cjR1hukf1E1xSMQcQld9BFEsmLfgxM8kGvgDOKHcQdKScuXm0c6H/
	WGbI1NpOlo4Ty9SF9Scb9LVL2+AeDQgz3Pjfmu/jw8S2qFZRfpTOiDbH2MI42q+sLFovcB04eS+
	+F1fG+JYqN65bt1lUh7jci0htAfz9nHq94paFQaoDYDybsvgBe1yzGHmUtGdAv0fi18KQgJ0WsE
	2qAeEGNbGCEYoexAO/gIsX+Lz9DLhSTnIH7PG8bS86Q5lrvWpqAww==
X-Received: by 2002:a17:902:cccd:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1644ab4dcmr44586685ad.24.1780512602733;
        Wed, 03 Jun 2026 11:50:02 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2409:40c1:4015:6e6f:ee79:7998:9a6f:65e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d59csm32139675ad.4.2026.06.03.11.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:50:02 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v11 10/11] iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
Date: Thu,  4 Jun 2026 00:18:58 +0530
Message-ID: <20260603184859.89693-11-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603184859.89693-1-piyushpatle228@gmail.com>
References: <20260603184859.89693-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change hx711_reset_read() to accept the channel descriptor directly and
update its callers accordingly.

Split the existing HX711 channel-selection work into a small helper so a
later variant-specific change can add a matching helper without growing
hx711_reset_read() further.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index e5d842853b71..fde95758b9a0 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -268,7 +268,23 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 	return 0;
 }
 
-static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
+static int hx711_set_hx711_channel(struct hx711_data *hx711_data,
+				   const struct iio_chan_spec *chan,
+				   int *trailing_pulses)
+{
+	int ret;
+
+	ret = hx711_set_gain_for_channel(hx711_data, chan->channel);
+	if (ret < 0)
+		return ret;
+
+	*trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
+
+	return 0;
+}
+
+static int hx711_reset_read(struct hx711_data *hx711_data,
+			    const struct iio_chan_spec *chan)
 {
 	int trailing_pulses;
 	int ret;
@@ -282,11 +298,10 @@ static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 		return -EIO;
 	}
 
-	ret = hx711_set_gain_for_channel(hx711_data, chan);
+	ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
 	if (ret < 0)
 		return ret;
 
-	trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
 	return hx711_read(hx711_data, trailing_pulses);
 }
 
@@ -300,7 +315,7 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		mutex_lock(&hx711_data->lock);
 
-		*val = hx711_reset_read(hx711_data, chan->channel);
+		*val = hx711_reset_read(hx711_data, chan);
 
 		mutex_unlock(&hx711_data->lock);
 
@@ -390,8 +405,8 @@ static irqreturn_t hx711_trigger(int irq, void *p)
 	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
 
 	iio_for_each_active_channel(indio_dev, i) {
-		hx711_data->buffer.channel[j] = hx711_reset_read(hx711_data,
-					indio_dev->channels[i].channel);
+		hx711_data->buffer.channel[j] =
+			hx711_reset_read(hx711_data, &indio_dev->channels[i]);
 		j++;
 	}
 
-- 
2.43.0

