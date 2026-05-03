Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ADC3AF644
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810265; cv=none; b=VGeY/ik/p4E2dK5uVNM3rqzgN/5LJO4cHD90FCRkXwgfsxb7m09kDg60dMLiO0sOJ/COXFnz1AZIBVPrEv35UuL4o+fAwmHnxXPqnaD1MHeBOLNy9YrUpk+mYoahKPf8dPNQG9+nwmI7taBOQFkhdSWd67idrWjTXSc1X+ebUPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810265; c=relaxed/simple;
	bh=/K/3q3bdgdjW52cOpPc+Q8cdwQV9c4yCPujfH8pkPjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFdBonda7A1YTa6kHDbkX/p8Gbav3CB74zZxQEZSFz0jGro9h4CqlfwuL27ORwqkidaqeIUa+Tj1yCQiDOADfG9sbgFuJDVpGWh43Z/s4nlP4RUkKYrk5Vhneqz0FOyZLDi5euc675UZRbjlMZZsh0KvaOhp/dvTuLxe0vIVx8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXhGpm6o; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXhGpm6o"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-835386ff122so619352b3a.3
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 05:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777810263; x=1778415063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5ZGcDGIV6eBL2tESEp+bhDpn4nj603SMEnwICOMNYo=;
        b=oXhGpm6oXF5feMLzzVeKTwz/EejoG5QHDfIeaGOq3DzDxaM8CtE2T0m8V97MNA8qt+
         gG9t2nT+jca5e5zOrwidduDPYo5879hE4Ha9hslh78HzGCKydOFtktwCvn1p1s83esiJ
         GlAcubNy3y+a212O6En3DZDHWNZM+EWIrx19S0wewoXYPPipFtq6Uaoq3Ua49GGV+Zlj
         IPJfHtiqhu4lzKf4vzeeymT7NK9WY7VsPsskns4dYxNR7YZmyesKEvmvL5S752RyC0z4
         rt47FCeUMYcHABKETZGd/ajMtgsv+M7Sb4JnJrEweqAbRlMiqitxVIwLaMiBFtRGB2E5
         cd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777810263; x=1778415063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x5ZGcDGIV6eBL2tESEp+bhDpn4nj603SMEnwICOMNYo=;
        b=hLzwnq3Ad0LT6sc6904wo9y6yAJLFTHkvE5bs4dZKMwuvSzAJCr1pXVNJLu2q3Olvy
         aMNiFZMUNVb6UDZxmfn1ZDPs4NeTdoRRY1mDYlzWEWZjjX685+gpO+B24rcV6PxWUMDc
         vmXOPp95NdQamSWuoVvYuGbGFOH2XCl0STQLN3IQa+dL1txaPUrj2q9lkSO7RpwnP/iw
         Wf2H9/8aFC9WlgOpHBqRGBztNe2mhHXgNs9JL3Ioawwxd27TqlkywdLNWB3sA/dkFIJN
         ZexwZt7Y5za89G8skDrPTK4QEXeyGKMgEHZxjTO7+dsJlP/U6Uz6eSJFBbyBvEUNrlUP
         UpeA==
X-Forwarded-Encrypted: i=1; AFNElJ/mqWQrLPEkARS5N7imABoLGbWpBTjZ7vkRW5DAymz7JdP3ByccJO/KWf8P5c8xNorP8I6RIsgaBFsl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2sw02Y+7o+CsWE7uqbs/l0YC5xGxx1QXW33WhqjHc5xSE2jp5
	r6n5akBgTzWU3697PrVJRQM8Qd2w54N+tfNHLXSd0yb1ykf8y9iUOpX1
X-Gm-Gg: AeBDieuPBfcbPxkDhkHtZ7WknfvQRa0e9yf/+CiGSAwf+JP8YroJ/vBLdfqhqGP78AZ
	4bQsHtznKyceS2hfq/tao1mVtMTBDm3vlVcD5tLzH36pRTi5xyM7IjyK2pchiOlPV7QWVC+5Kjh
	KVYDLhOYjdaNcGat481oKknFYfAaMXOBjaGAgiTT7Vgi3fxHE/pv0K4RuJ8aRtqBkeScp3Gg+/E
	Y/3/YEQ3wR/ko54l0Xg2JJix2sOeLX6CtxCBQNgDZwxE71KYukYC7uVzm+TYUlkz8bo4rBaMZCW
	zWGbzIHnkLI6uWja/EoGAhOpuJNMStc2qzhSh7SyKBkDi5YWur1142uguL/bUPTEXAtO5uHL2n4
	UWT1S8vPlTx9V6Yze26fTpGrEPqPZ/1D4JworbuRPj0SH1oVHHhPDM184JpHA4sQhxjtGqnbrCi
	BdqwulXkoF9dPsjkaiMQCoVEbBAMKUBCNHcf9EojigE1j8LcSxFhzN01hUPZJvn+OwuDyIA9AtV
	7X4CZlxvK54v3fovqbAQeR4kW7lHDdZpUFdlPA0e9x8PROCx1Y9cLo6c7XdzECtP+wlDV4=
X-Received: by 2002:a05:6a00:ab89:b0:82f:b5:8044 with SMTP id d2e1a72fcca58-8352d01357dmr6334200b3a.6.1777810263201;
        Sun, 03 May 2026 05:11:03 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm1474364b3a.9.2026.05.03.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:11:02 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Andreas Klinger <ak@it-klinger.de>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/11] iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
Date: Sun,  3 May 2026 17:39:39 +0530
Message-ID: <20260503120949.80292-11-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503120949.80292-1-piyushpatle228@gmail.com>
References: <20260503120949.80292-1-piyushpatle228@gmail.com>
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
---
 drivers/iio/adc/hx711.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 98fb617ea32b..2229df17f350 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -269,7 +269,22 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
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
+	return 0;
+}
+
+static int hx711_reset_read(struct hx711_data *hx711_data,
+			    const struct iio_chan_spec *chan)
 {
 	int trailing_pulses;
 	int ret;
@@ -283,11 +298,10 @@ static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 		return -EIO;
 	}
 
-	ret = hx711_set_gain_for_channel(hx711_data, chan);
+	ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
 	if (ret < 0)
 		return ret;
 
-	trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
 	return hx711_read(hx711_data, trailing_pulses);
 }
 
@@ -301,7 +315,7 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		mutex_lock(&hx711_data->lock);
 
-		*val = hx711_reset_read(hx711_data, chan->channel);
+		*val = hx711_reset_read(hx711_data, chan);
 
 		mutex_unlock(&hx711_data->lock);
 
@@ -391,8 +405,8 @@ static irqreturn_t hx711_trigger(int irq, void *p)
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

