Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4A937F013
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411323; cv=none; b=H4VDQn5ymzRjnuX+Wg3FOry5SuKej2HgWxPMTiiVXPpr7ObDI7s5NQghVdEOrFOGCUPO0ZOwNigECAKBEJbaGvTVvv1ZTFww/AghDRntD3xpcXCPRqZtktmmgM67SljXjY2MaJtHEbML87qq9t4po7xZP/4yVdto09dAjlRDI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411323; c=relaxed/simple;
	bh=VWNSeXLpRAe/celgCxjIoqvqXwbqAv0wT7y/dppOsEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fg4fJwjZ04o7Th9Vcug3tZxqaIOcIegO48204MPW51upUEF0GBM0njkFBzBjXmy+Yds0dtl/Nus8Mpa9fvfC6KM9JM5M3V+5CTIpouGgxdhd89TVYBGGIu1O/YXu7sYxWr42OO6zifmOZLaUL+DNI+vT05oid9rslTQoLLp6OrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQGubsfo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQGubsfo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67c566cb519so6341784a12.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 04:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411319; x=1779016119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1KCdtbuRFFxdaXY/A3Jna+lCae9dBlkmFTwEdkEb4o=;
        b=nQGubsfou3ClYBu3/P4QGarS7yV8KMiiaMc8doQVWYXnu6BKfXgv+VYb3IEgUMXxTQ
         20JcD18wb1Ay2TUg/L3glAKx1wBH+reWA6tFgRELgYKP+FSZTUWrVdMJ+mp1xotEF+EC
         zF/E8/xZJidEv1azSL+rp9GZijFV3rc9CH3kQg2Z63Qyfmo8xDchakDgL1qONWe1RoQQ
         tAPfKqxOdp+dLFSSR8KKZ7x5GNu1ulTHp3qN4R6exZTtgVElhWbNqVHNFFCRG7OBx+jM
         O953MUg9iWU8NRsJ6aEm219F3o05vW3E1/IQlR+WfWymIlCrFaWplSvBxwEODi8RtQkj
         mlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411319; x=1779016119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t1KCdtbuRFFxdaXY/A3Jna+lCae9dBlkmFTwEdkEb4o=;
        b=LGkT+ECSJyzPZ5n3Aus6rnyBLGrCYbkCgabaJpZjbWA1CdbLRciucSvA4r1i3lxPbX
         rpwSRreHVr88tSUY6xQYH/zFz6UIjxeXW+Nh2+v7gFqyRuCWk/142rgJ9nVY6yrrzXby
         VCnlzAHNG4MzsFAc0gOt7rVsucKylVD9PqeJNjZu6svi3TMooY+q3lqd9ArsWq8rdzIL
         4r6w/PBKsoGgALAM69wn7ujItm8O7B62CSPOhF6tdijCoVlIsZWgPgOxNbMv3DLd/0zL
         XYGA34LWS5qRNPz2NVc1zkH5Bok42jZI1e0vWGTr2MQOtbkI9gM7eoN51TfeaO5PiSL0
         Qkiw==
X-Forwarded-Encrypted: i=1; AFNElJ/6DPFjpTLYK/5tPKETmq35SqMzpafnVUrz+k/fcfAV64tjkMdA8HwHFjSJeS4K5zGx+fcxv/LZhvhj@vger.kernel.org
X-Gm-Message-State: AOJu0YzPym3anS9jiCD8/vzderdAOy54fQMoRl1zIvpZPamIycdxifbq
	7WnV6HoQzhmvr64wtpfjH6t8f4oQJsg4Oc3209FPU69Yjv4XIwgUaNmM
X-Gm-Gg: Acq92OEN4YZSJIz2gqy8S1bdKoK/V/s6cIeQZaWrBo2tK6hFFcYZ820YBH3JMQ1/les
	I1zM/ey1zapR7YVrO3lYM3Cn1jvFUfEPyFMNg9FMgdO0CvclfJEs7haYuBgWykW54nnTU3TAkZA
	qYgzyKaSj9gPu42ZjWEtNZkYxwyv8dREKiB3i/P+28n0IuyuB+WrsJqNndc9bgrDSK4rjgZSuW4
	Wg6S1xyWljSqzoU7KsRgMQJ0Dj2N6mzr++pBIxpDM5x/p5qCWMOYgeisnuCReYkrlmgihgtThdZ
	uc0TtkOmEFsoz669wvJGtu/3m3zFFkhl940BuYLtXeZRABdViUZA9Zx9rKZ4ntRyIuO9sVbUPpo
	9sDJiZjo0FKVNn2Z9EACH9Wfrj/lxHFA/Glp3hzJgfHbg6CSLt9TKokSBkD8fdPLUOpA6gSCI5L
	4RKKnoeXYe6MRT
X-Received: by 2002:a17:907:868a:b0:bcb:ea69:39c8 with SMTP id a640c23a62f3a-bcbea694c4fmr319764566b.38.1778411319038;
        Sun, 10 May 2026 04:08:39 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 6/6] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Sun, 10 May 2026 14:08:04 +0300
Message-ID: <20260510110804.33045-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510110804.33045-1-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
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
 drivers/mfd/motorola-cpcap.c       | 30 ++++++++++++++++++++++++++++++
 include/linux/mfd/motorola-cpcap.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index f5a7fdd89dd5..bd9fb0d61ba6 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -270,6 +270,28 @@ static const struct mfd_cell cpcap_mapphone_mfd_devices[] = {
 	MFD_CELL_NAME("cpcap-codec"),
 };
 
+/*
+ * The Mot board features a USB-PHY and charger similar to the ones in
+ * Mapphone; however, because Mot is based on Tegra20, it is incompatible
+ * with the existing implementation, which is tightly interconnected with
+ * the OMAP USB PHY.
+ */
+static const struct mfd_cell cpcap_mot_mfd_devices[] = {
+	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mot-cpcap-adc"),
+	MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
+		    "motorola,cpcap-battery"),
+	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
+		    "motorola,mot-cpcap-regulator"),
+	MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
+	MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
+		    "motorola,cpcap-pwrbutton"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
+	MFD_CELL_NAME("cpcap-codec"),
+};
+
 static int cpcap_probe(struct spi_device *spi)
 {
 	struct cpcap_ddata *cpcap;
@@ -294,6 +316,10 @@ static int cpcap_probe(struct spi_device *spi)
 		cells = cpcap_mapphone_mfd_devices;
 		num_cells = ARRAY_SIZE(cpcap_mapphone_mfd_devices);
 		break;
+	case CPCAP_MOT:
+		cells = cpcap_mot_mfd_devices;
+		num_cells = ARRAY_SIZE(cpcap_mot_mfd_devices);
+		break;
 	default:
 		return dev_err_probe(&spi->dev, -EINVAL,
 				     "Unknown device %d\n", cpcap->variant);
@@ -343,6 +369,9 @@ static const struct of_device_id cpcap_of_match[] = {
 	}, {
 		.compatible = "motorola,mapphone-cpcap",
 		.data = (void *)CPCAP_MAPPHONE
+	}, {
+		.compatible = "motorola,mot-cpcap",
+		.data = (void *)CPCAP_MOT
 	},
 	{ /* sentinel */ }
 };
@@ -351,6 +380,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
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

