Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D63FE376
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301407; cv=none; b=ShpNkMyPCPf2Yc0IGvieZdh0evcpSrIkmkZ9/CnI5TgYMngRxeoqwRSsiEEU5Vg24EmGqWwwOsg83IREDo78V0yEiQVxd6qve9fNRVdBk5c4GaQyG2ngsAx4YUN8ohBFDmA36VXV4dX3ANboDHj4wylGB1HNf0oJYrpOCjbFGIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301407; c=relaxed/simple;
	bh=OyZE0FTSId5Xw2BLHh/qgzyUvjlvhM+aMzq4+ikPxSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p28yABWHmmilR9wiouB9k5tGkLnzZGLTSo1hfQ0gjHhEab96vsaqlMLmW6wObW01kNZHJlwlwqQHeZ203Mkve4nKl0ppnJf134SFkwe2gRQgHrcPqg4bNehnO+OUBCYlWly2KMRPIZ7ybajLaLKcENcS83tpe4PKOLF2r5e7yzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsaKqcYs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsaKqcYs"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891b0786beso36402955e9.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779301403; x=1779906203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaU/m8RkZFKacQOirk2OKWVZO3CMn2gzTIkZTYwhda4=;
        b=jsaKqcYsz39jWnosGbzDD6+Pimi7MmfIseiAUAM7qhNK/iYBOfXDrbDSaNvazmSOVi
         Myhir/H2zsaA1UYQsqNmBXfEi2P1z0siThGMHxl5ILyTpYDzmFKbUIPPHJbg1danS4n9
         WUL5VSeO7d7HfEzlK7FSDOAHNrQfDEVfZL4UXN1hVdIMSA7+jl0/D1GKExMHaqGJq+xy
         SlfbaInZ764mIvSFA4E52H1Nh0E0dVIWu5M/4Vr8bBstoRKYsTIqUMNt6Sz+0sd3oa9i
         d5ogimLhY3tOQkuEv+XaYeVvIWJlYpT6A+DHoCqz6EoLzR17tGg3miMXbAKxL8UTGg+o
         CHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779301403; x=1779906203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vaU/m8RkZFKacQOirk2OKWVZO3CMn2gzTIkZTYwhda4=;
        b=figRR420oCRhiRpqCpoKOj4/xhW2S0KJ0gJqQ1AG+l9sx6jRFcPxpp+yH5SgvCr+ku
         AxY3YNqvmcQhbY5AKSVPV1gIhg0ToQujqxqbU6UtJwA2ehEKOiluRkBylN+l14sxN/SS
         2oPe1m7VVN/hs/JzR6m/XfoTZjV4zxLXJG1UGStq+ruCKdwhLxmf6lpASW8dBiLbNOd+
         FscaRdFOpmSDwtaA7GhZSCdWXrjSqNtsu3L4kjM9j7aZJyQtpSQjvLsig4oDowW/C5XT
         HkUJiHaoVAQccaS6nBOh5XuXpHjosaxR3G/chap+JhvSoFco0zwHOReyMGfXWBJW7xO3
         3MxA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZNe0cRCz+yZAgvKv8dyP7JtIWXCzcS6ESn19s0W2C2JOwdcBj+thzsRzyt7trwwBmyDnZkVzf2XBl@vger.kernel.org
X-Gm-Message-State: AOJu0YwRrwgeu5k/O4VF0Zh29nkMThYGwVQpdOiGvhqAv4fPJh4FsEhR
	RFl861XBR2yKRcohe9SDi2WmRhgINVNQ5hgniRXcGBkIz4zOm9WMYcf9
X-Gm-Gg: Acq92OH1AKD3RJpl3dbUO48v3dZc09uUaAeA/VNW5FicPj5vMbo/qLbj7HiBbBakjWj
	lFOrEMbam7yQoaBhb969SibZF7LWUoQoYG0pXDzUcNmOeyJOTzTv5CA5SQrZzvhJBQV94hRmYEm
	bxHKHHsJNgOQyJ5mEBErdP8G7dZEsw2KRrDEIDJQ+fI888OUaoK9sKeIuE3m9Bp6vOL4pAKAvUB
	vMROREYNQ5XmDgn2k+RUUQKdfviFqurVK3mYJh+6oRN2BxPqu8/DRdSsq4OhMERFHgXV1ETpbCZ
	SVZOJczlmzu4s2u0KZIucDGF+mpwGnrGDIwU/olTNhbiMsaBdUMCSWFmtGqMFeEJECH95gqzp0k
	vlO2/+tMB2nsbyrJsVh3BLOWOwb/9XCqpwamuoZVdi52bs2NOOjRni7F78DGx6hCPWYcgJIfycc
	20e5OPoBPlAdp17dDeNGAdmV3vQo8DJH3V+Q==
X-Received: by 2002:a05:600c:6383:b0:488:c014:34da with SMTP id 5b1f17b1804b1-48fe651690fmr390912175e9.26.1779301403428;
        Wed, 20 May 2026 11:23:23 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm51297739f8f.11.2026.05.20.11.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:23:23 -0700 (PDT)
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
Subject: [PATCH v6 6/6] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Wed, 20 May 2026 21:21:24 +0300
Message-ID: <20260520182124.117863-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260520182124.117863-1-clamor95@gmail.com>
References: <20260520182124.117863-1-clamor95@gmail.com>
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
index 5b6ca6b81c23..f6198276d266 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -237,7 +237,6 @@ static const struct mfd_cell cpcap_common_devices[] = {
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
-	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
 	MFD_CELL_NAME("cpcap-codec"),
 };
 
@@ -245,6 +244,7 @@ static const struct mfd_cell cpcap_default_devices[] = {
 	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
 	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap-regulator"),
 	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-usb-phy"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
 };
 
 static const struct mfd_cell cpcap_mapphone_devices[] = {
@@ -252,6 +252,18 @@ static const struct mfd_cell cpcap_mapphone_devices[] = {
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
@@ -276,6 +288,10 @@ static int cpcap_probe(struct spi_device *spi)
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
@@ -327,6 +343,7 @@ static int cpcap_probe(struct spi_device *spi)
 static const struct of_device_id cpcap_of_match[] = {
 	{ .compatible = "motorola,cpcap", .data = (void *)CPCAP_DEFAULT },
 	{ .compatible = "motorola,mapphone-cpcap", .data = (void *)CPCAP_MAPPHONE },
+	{ .compatible = "motorola,mot-cpcap", .data = (void *)CPCAP_MOT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
@@ -334,6 +351,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
 static const struct spi_device_id cpcap_spi_ids[] = {
 	{ "cpcap", CPCAP_DEFAULT },
 	{ "mapphone-cpcap", CPCAP_MAPPHONE },
+	{ "mot-cpcap", CPCAP_MOT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
index 1a85b06272c8..bb23363eeccd 100644
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
2.51.0

