Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC165478E42
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627841; cv=none; b=nO0Y7o9GVjm6+ne5jBd1z9XhcDqDYjZifa8rWUWBuMm8UHwTg74NvjDlk2+CLhXp+jd/5/3blg5NBT2Q+sZ0ysqiBWgnnl8B+sy7GVERYdCxrC7rX33JvFhp+b0xWu7Z6fIlnKcdDe6HzcxSMu2wYQmhf5BGit5ZyW32G308kPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627841; c=relaxed/simple;
	bh=T8cRuUBfoBd6FnDrJrzXdMln48s5ROWU7KNnszNI1ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pm+VA1F/+BBHnO8WaR1Qi1je3c8Db5RZZKzaoDhDdbWRh0I53LzfNFbFXzgsFPRLV6skPcTtRpSy6/KGcZmlCiDZg5PqAet0mo8UPPXrVoyF+vnL28WSCsYrqq2eVLPFmRrbczuhPREev4OVC9YDChFddmXeUpthoA3VP7nu3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3dB2snh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3dB2snh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495635a85d2so12391135e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627838; x=1785232638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VItKmHIoH048yfG2CZi3DtSo+yszZwzdjFvqWtlufPc=;
        b=I3dB2snhvwCuI2RXYbVjCpvMtWA3aikJ33hapLFL3ukbenemW/GOzwBI7MLZ1hPveV
         8k+p0QazY+h6i8U4x3TwJH8+iA4noZDp041cGQ9kCGDLIRoEYWq7UOGO9NNSVUkgktsR
         p6Dlpd2cCna29y3K7Bim3VJEBzhX3F0QxGfopNIEI1CSy+xqSaWureJbo9tAmWddi0+o
         8HF1XQHPMXDm2jLFd98Nee6zbmte5uCQE6RhcPlALZl5jKq/x2Ns7N0dlW82E80UrALW
         OlRbHprXCrBYNEHwRCRc29Kf2SSPzPc9ag7jW7eTkLMk3D6Pq3fjv33/h2qM335Beq1V
         OOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627838; x=1785232638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VItKmHIoH048yfG2CZi3DtSo+yszZwzdjFvqWtlufPc=;
        b=nvzDaH1oJXEpUXdKRJsyqT5bA7zFzfE0G+K7tzEcTHAf71sw/Q/BhGyYzsZ8sHrGf6
         mGXe4oV4x6cJq8KUEKIAtxO+fJjR1GXhkbd6Y8FAcuXXczKo0Bj1Hg2L1YiKK3dLt+dW
         4+U/YAzAnJ5lKDV4OSXeLagaxxXBnO7JphRh2Fm4/Zt/4RYIX4qZnzDw4ehDHAGawjtR
         Av1YChacA5uufR5qp1f1bcSz/gg1ZQu1nbP8j3T4xsPIJIoa7yF4b8bLMIlo5uuwfCCL
         PKNlkckTLuDAlU41Asbzm4pcJP8YEJ88+9VB3nmAwcgxXWzuyJ0tHV5Ut+9PIZDaofcr
         oSyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWpcwsZ1SXwbPGc/N8/cMtcL8/+8ASvLi7uANpV8J00IK2ZIl1nU3mU7/ThFjw0DtK375BmpCK+aNx@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ10KsXY5vluvxp8VYq+f2E7XyjrInF6xSiuOwTXzgdYCTp4kv
	9Cw7txe3WA9W+1rVtWn402jaCWzOICsBjqUwB9VtHKxF+PJzoUoRxDsC
X-Gm-Gg: AfdE7cl/aqaSLVUyF7gubczszCj1K98h6vY+oADi/Qxr9bn48GSYQcATlKuqIQ0Mk1G
	JkChfWNcKOahiudWVuku93Gb1WqvM0DRtCyMDiMEND0Mt/FZluh7Z2Q/0yCUuc2Di8ynem2StxE
	nCTbQ2v6ecg9R6FpkW1iF3C0SLDHhT2iTRrakwupJNooUo34JQi38qgwIYfaYyK5AnPNmeemA+g
	T0b/YFK5wVXtUVxzv2nYg9nnLxlHAQ1R8CAlyv3pUoNkUDOy0iAvgtUpB0HnOsdHehHOPdWnB/n
	KNbw1KHySvZTOWyndTmn0P5ZqsZDruhcoCWgSUBZun74uHo7i1gUEo+KGu17XQrihnXFxhTtY8t
	HXLAeRgBcoRJA896wwkuka3ZCiPJxYsksQ3YL6HNd5Spmc8z2AodBjiPn8r5BeRAiAWQ63W61v3
	QR2KpWGBiL/J7MssWhlJtZd48=
X-Received: by 2002:a05:600c:4e88:b0:495:636b:e519 with SMTP id 5b1f17b1804b1-495636bea4dmr62286805e9.21.1784627838034;
        Tue, 21 Jul 2026 02:57:18 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm227476185e9.0.2026.07.21.02.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:57:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v7 6/6] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Tue, 21 Jul 2026 12:56:53 +0300
Message-ID: <20260721095654.429346-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095654.429346-1-clamor95@gmail.com>
References: <20260721095654.429346-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MFD subdevice composition used in Tegra20 based Mot board
(Motorola Atrix 4G and Droid X2).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c       | 20 +++++++++++++++++++-
 include/linux/mfd/motorola-cpcap.h |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index 5feb403f26101..65d5eb18aa004 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -236,7 +236,6 @@ static const struct mfd_cell cpcap_common_devices[] = {
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
-	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
 	MFD_CELL_NAME("cpcap-codec"),
 };
 
@@ -244,6 +243,7 @@ static const struct mfd_cell cpcap_default_devices[] = {
 	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
 	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap-regulator"),
 	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-usb-phy"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
 };
 
 static const struct mfd_cell cpcap_mapphone_devices[] = {
@@ -251,6 +251,18 @@ static const struct mfd_cell cpcap_mapphone_devices[] = {
 	MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-charger"),
 	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-regulator"),
 	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-usb-phy"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
+};
+
+/*
+ * The Mot board features a USB-PHY and charger similar to the ones in
+ * Mapphone; however, because Mot is based on Tegra20, it is incompatible
+ * with the existing implementation, which is tightly interconnected with
+ * the OMAP USB PHY.
+ */
+static const struct mfd_cell cpcap_mot_devices[] = {
+	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mot-cpcap-adc"),
+	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mot-cpcap-regulator"),
 };
 
 static int cpcap_probe(struct spi_device *spi)
@@ -275,6 +287,10 @@ static int cpcap_probe(struct spi_device *spi)
 		cells = cpcap_mapphone_devices;
 		num_cells = ARRAY_SIZE(cpcap_mapphone_devices);
 		break;
+	case CPCAP_MOT:
+		cells = cpcap_mot_devices;
+		num_cells = ARRAY_SIZE(cpcap_mot_devices);
+		break;
 	default:
 		return dev_err_probe(&spi->dev, -ENODEV,
 				     "Unknown device %d\n", cpcap->variant);
@@ -326,6 +342,7 @@ static int cpcap_probe(struct spi_device *spi)
 static const struct of_device_id cpcap_of_match[] = {
 	{ .compatible = "motorola,cpcap", .data = (void *)CPCAP_DEFAULT },
 	{ .compatible = "motorola,mapphone-cpcap", .data = (void *)CPCAP_MAPPHONE },
+	{ .compatible = "motorola,mot-cpcap", .data = (void *)CPCAP_MOT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
@@ -333,6 +350,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
 static const struct spi_device_id cpcap_spi_ids[] = {
 	{ .name = "cpcap", .driver_data = CPCAP_DEFAULT },
 	{ .name = "mapphone-cpcap", .driver_data = CPCAP_MAPPHONE },
+	{ .name = "mot-cpcap", .driver_data = CPCAP_MOT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
index 1a85b06272c8f..bb23363eeccdf 100644
--- a/include/linux/mfd/motorola-cpcap.h
+++ b/include/linux/mfd/motorola-cpcap.h
@@ -28,6 +28,7 @@
 enum cpcap_variant {
 	CPCAP_DEFAULT = 1,
 	CPCAP_MAPPHONE,
+	CPCAP_MOT,
 	CPCAP_MAX
 };
 
-- 
2.53.0

