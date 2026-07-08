Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44175437113
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529539; cv=none; b=o5Wih5EkVUhz9WJj7Q65NCkKmMhhUeDgufOcKtLy+I2hM6+sBTxRCqKoRsLG8nzQ+AQYgQOwOW3b7rDBt7JvrmheGPI5VfegnIktF0YFzMwp3GrWfYneBvjIfgFQGSLCLYqVJCBB0vWPaS1WXSBNY3qxp1+HOr81VVD69BisODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529539; c=relaxed/simple;
	bh=Bc+3nUd8JHXptnb6yT5c8317T5N2BuIDDaHFmOya5rY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LcjbkuVV3M6oTiRDbTYiL/Kv27ClsH5zLNRwZDjgBuE2w0ACPiUdLhAIeq1RbBQCUuoaO2l0vgl3zwzyuvtfWBYHMlc6JXuZK54CJ+/lnqZRS5Y/5MJ4kiW9O2tymHalQpgymQi90D2r2EEfAJ8cL9JPzDPgoXMhzAeVWQ5s8v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=B0uYomjy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="B0uYomjy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b27c7451so972785e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783529532; x=1784134332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGtUrkx/TpXSV9KyMxarboRJ5bR8WEDJ79N5wF/Lel0=;
        b=B0uYomjyYNyyPLdEztNUPv0rgDrrApbm6+oZygAZ+S9LmB78b5PPKygfcvVhMoXBlO
         9WImw+huXYMibOG1p8emHJVMmBEG7iAjwigJGPk0Ms4biNJhNg8+ERGOSGbKNdKdKZGh
         Pp8GJG14GvH9EsCOW2VemYhvoAUffV9dfzfBycHOQtsXusxmtWrUh16Bht7TFTyvB3+1
         awh6FolbKAnRt9Fj+H26RsZh8b8j07CK2oZGEcYU4+xWIsUrxlPiUuLrGv/iJU+X68g0
         aO6ypvVBJn5tururPsc+lvWy0VsbIwcqMmTkzoEiZ4gBzqc064ipnerQPf7i/igtw/Ag
         3zuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529532; x=1784134332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGtUrkx/TpXSV9KyMxarboRJ5bR8WEDJ79N5wF/Lel0=;
        b=laV9d/VQLlVt09thbs8HuF5WDEgRGI9yiBj1aHtF3Tp2riyuK6ttKI/C+85V+H92/0
         rqvZ6C2xjTwVlHD3jHwmBOKv5lE8RD16awLnYSUnCFR7pvIlkkndiaP/deUtMKcZIgDm
         L+hTk8xGrcqqQfry+zd9ejAyGMgiX97OPw2m6ymQxaQDbzWCmJ9NN+D2j3ScwByFptiz
         KZpRJAQh0ZHffbqku6hOBja72Bu/S4R99xjXZmX2ViIVkikUSd8hfrCi/hMa967BX0d2
         RrCxNGc1OnusLh3ND48QMRqKzpcgKoQ1BMw39NsPiwfeurhgY+R2swHL6CrQs3LQ7QWS
         JItA==
X-Forwarded-Encrypted: i=1; AHgh+RpZIKeFbl3Kio/Q7aep7tPZKqh/3eXOyO81ujwAUU4yt9NIQnFDHVsTFHgfcLOwKY/+txqGz30Ud2X1@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYr+AqkXLmSZ5s8+ithQfv5MoCOmJ3U4WN65fpV1fxS6834TB
	z8jC3xdPjMA7RRJDEla+VNbSTvhukBYLPr5ujrUfQ+cYZELQfT7dK+a9N3Eoox6UOhs=
X-Gm-Gg: AfdE7cljGzEUOOisBQzxdeZHItwW6CbXuaBLsDlREgsQRiKPnTVKEQaIkY836ILupQZ
	I/uffUcJ7JsmJq+08AOkAq2m9JnYYrhYktecRnHL/SERyrvK1M8pcyH7NHPHbTo6XSAMY20PGl4
	ebzk+fhuqH5EP0S8B9/TmIZShhyxAMlLV20CLVDUrxk3AqPmndEoxCRBg9urk6lASenK+wcCP77
	SqWMDNfntH1ctmiQ6JbBs2qOXqO5/EVQkdTh0q/bd+7GwmzfbyXz3iTferjDWMvcN6rahvF66Ub
	wRVJXDI1alU8OIKBvPuyM3Jk4hiyWnul3nXTy6MV/SDSv0sYDkkbnEb7NE4qGW1X2uckimpCguZ
	B1lI9cZUkorNAXIKzCpytHpKujpaf7TYh5cwVS7OyfrTys6CbelJ/ss14FQsdOqW1jjKbCruGsQ
	zVTb9IG4RmUmjrqJePL5JE48n4wQSrdE6j2V+UewwBYSIoFO9dqQRiZWZb18HSUwZ96MP4kpefO
	aRKxs38magSOXxHDrOaNexM19j70oilK6rZAj/mljo=
X-Received: by 2002:a5d:5885:0:b0:46f:8561:fe60 with SMTP id ffacd0b85a97d-47de9a0e419mr9448965f8f.17.1783529531534;
        Wed, 08 Jul 2026 09:52:11 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm42902679f8f.33.2026.07.08.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:10 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/4] spi: atmel-quadspi: add controller init callback
Date: Wed,  8 Jul 2026 18:51:08 +0200
Message-ID: <20260708165201.624271-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow controller variants to provide a custom initialization callback
through their capability data.

This prepares the driver for variants which require a different hardware
initialization sequence without adding SoC checks to the common path.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/atmel-quadspi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index aaf7f4c46b22..62ea84d234d0 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -256,8 +256,11 @@ static const struct atmel_qspi_pcal pcal[ATMEL_QSPI_PCAL_ARRAY_SIZE] = {
 	{200000000, 7},
 };
 
+struct atmel_qspi;
+
 struct atmel_qspi_caps {
 	u32 max_speed_hz;
+	int (*init)(struct atmel_qspi *aq);
 	bool has_qspick;
 	bool has_gclk;
 	bool has_ricr;
@@ -1156,6 +1159,9 @@ static int atmel_qspi_sama7g5_setup(struct spi_device *spi)
 	/* The controller can communicate with a single peripheral device (target). */
 	aq->target_max_speed_hz = spi->max_speed_hz;
 
+	if (aq->caps->init)
+		return aq->caps->init(aq);
+
 	return atmel_qspi_sama7g5_init(aq);
 }
 
@@ -1570,6 +1576,9 @@ static int __maybe_unused atmel_qspi_resume(struct device *dev)
 		return ret;
 	}
 
+	if (aq->caps->init)
+		return aq->caps->init(aq);
+
 	if (aq->caps->has_gclk)
 		return atmel_qspi_sama7g5_init(aq);
 
-- 
2.55.0

