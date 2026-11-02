Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610442;
	b=5FFQa5TxV8fbswkbcH6WL2xvVYnMEDrf4ZxJoBN0nI49EKXg41fScARLOoNgAFvBCLGN
	 3UhRjXCSxU2hijAFGicfk43tSOzGQHpyahQ2zuHOJOzbKUs2NKB3CiVHUqMKk9VDxCa/b
	 sJ1aV6gAVELeDRqKUkNZ4e3dMLrAU2+w9Yx0CHlHximbcf6uHvy2doVds4SXw6B2s5ydb
	 54+lcEPRc15QrnGDUAFGBcW2g3CsK84DvfTgT/7+swYiWJcEIljsSdrlqWi72lZus8KuF
	 8ii+SsDpMzsOcMJOReqt9TkSHWbwxn/GPlynzcTWuZGua0IFt/V3j0pOhscKPD6rl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=;
	b=CvsOCqeA9fDD39uojrgSsJsEMzIUmFdQfiTuPOsMYxHY/FV49tD36kTggZeA703MlOOo
	 9xOJD78Nre4tGic71fENk9zVNKO2yg4ZHS9d1onNI0uX8r6J1cwIwuN15mR0LOhXzc7Xn
	 7uZ/O30DXGgOP8/DvlNLMsljBAOnJyxY2poUk3eSvom69gayIc3Su7cfXF6iumWUxbGeT
	 op7VwbypYA289RP9P5R965N53cCPF6L4DyA7jCKGQ0BwO+E7a76wpcFzEdtOR1gzh4OcB
	 K4yCztxAx4lv+25cjvTzZwQsaJADUvQwoclCfmuRUbM4mKsYyvvfpPMJND0YAx+3CWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GB+m30p9;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98D606A330
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D98D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GB+m30p9
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1302667f8f.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610440; x=1794215240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=;
        b=GB+m30p96zaoLLUhCVQVQwRMVqd2MHv1F+TOUvPM2VnbGWdRVJ7uLFKQ9fBLvAtR02
         k8S5eAGIqffL3cRcmXbWBHjeElNoQeM46fpBus83My0MyqslxbQ4qBwKvPoufPnqWLOF
         rDDy7nLtNJH16oKAHlkLQoBWVh/cEfSv4bzzB3o4+GenUl5CA+UgbxRdsc/T5CmahkhM
         uEwOVLCRgejcygLSj8hVBU5nmE2ilD0A96C/il9Rzbk0pMQSL8JjZ5RoBLdCD8mTx5lS
         JNSudX9WGJMj6Axab+pCIw1W/CTn78f2DttOjIniMaH8O4oH/MRWh4HC1VT0cUZj/oVr
         vvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610440; x=1794215240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=;
        b=g3MdkK1rclphvCRPemUe57FvF7Dz7eo1E/raMB7t2gxFI+1Kmp1mRv6o7ad6p/t95W
         zJ772nJL2yGjgkmOoqvC6XKMPe3d+tuainguiMvcAQR6Z+cEocLpb2WDrDFjoFQGxF6h
         JASGTkNRRwEfe4XRkq5qhq3QLcvrUH+TIvVmDbZccP4rTTwdR8echS+/x1kkUTw5mvxN
         zJYVQj1woofPk59766tTzUdR/UHo+tvVGsgneIxNVGGgtmocn/VgSdw/gU0EQeIRxqX4
         CEgflnj/ELw0SX80XCQ3t4u58r4Jxf4Z4X5J88ofy/6Iq0npvRqLDExInhsj1IR0/zvN
         9Xqw==
X-Forwarded-Encrypted: i=1; AKwUvBxhU+CMAKs4gWVcqMXHxDUoFFqrYsw7ZXuOBHlbD2UubykvLoghScTtqD1TGk9G5vQcGW1eNQKJfTgO@vger.kernel.org
X-Gm-Message-State: AFq9FYJdHNG7EfQG+TNEX0M/PXDn10YGnRRA+hEgWw//hMfjkNTdyO9y
	k7wOm17lRdRlr+Wjy7s+sVDkoFLFCwQC8/x7OzdUjCpHb9DEk9qQqDTi
X-Gm-Gg: AYBFou0XZeE6raluoffEYrD2zvprKoyOKvMxJ5G97uzZxrW2tfUJwtx5dFeVh+LJ93n
	rX5XqHbwsIh+g3RwXmkpt06PLDEZcxaAafUudmZ3k6jgHuhXglnshiEWgYdbRGtHuG2ougMsYhC
	sXfe+/a5Z8FvIHGvHuninVRmjfhItyZCruHmEzxSxPwBmmfOtS36EBRRyVHFFwMrupEEjvwx05f
	VrK9zvg4XRo6XVzgJw5kV6bsypfW8zOVs0SKFGp4tr7vMQ8v8/Rf7D/PaBg6uFMrQoqiqx1KPRt
	FS+k0rHFq9CYe4j8e+yvqSxdlbNHE1cTL9PoYRNJ5zGQcqYvpwlL+IXP02pOkqBBCO/Gfy2et00
	4SOU3cqDGyWds3Tbc3jsRRP60Uu7iLtnA2QnCZag760ItJCu17x58E7+oNcosIwIq2NHqHE3FNR
	Kwnel3YjQb9QOzrsmX2YY+kFQ492rEG4FrRekdGk8Ys+X13KKxjC9VnzBftn27J7+vLxnXci8lF
	6dWX8fT2ZG/2GpHoAA+wDpu7GSSMmjCrT/R4kXI9MOMnCM92SiIYLUC98+ePnI4+QswKjBEWHSy
	or2wo66X709QcyQEOG8tt/4vk+oWu0hj7TKydOkpXJfYZE7Q0ASkjSTL6PVWCLGHaaxExuHFBOu
	GHwER7e2HkbitcRqQJfMx2UW/o1YI+ecPqSisBSJi7EDaNg+eXSRUB48iuC1lvUUAzKVka/ZjUS
	m7Hx+LobqwyiVw
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ac182dbb5emr203556405e9.33.1793610440331;
        Mon, 02 Nov 2026 01:07:20 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:19 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
Date: Mon,  2 Nov 2026 09:06:50 +0000
Message-ID: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
that support 40-bit DMA4 channels so add support so this works upstream.

The first patch updates the bindings, them patches 2-5 do some
refactoring and add the support for the newer SoCs.

Finally patches 6 and 7 add the nodes to the base device tree and
patches 8 and 9 enable it and configure HDMI audio to use them as
per the down stream device trees.

The series was assisted considerably by Claude Opus 5.5 based on the
various downstream Raspberry Pi patches and tested on a number of
RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
and dtbs_check pass clean.

Peter Robinson (9):
  dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
  dmaengine: bcm2835: Refactor control block handling
  dmaengine: bcm2835: Support controllers split across several nodes
  dmaengine: bcm2835: Add BCM2711 40-bit channel support
  dmaengine: bcm2835: Add BCM2712 support
  ARM: dts: bcm2711: Add 40-bit DMA controller
  ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
  arm64: dts: broadcom: bcm2712: Add DMA controllers
  arm64: dts: broadcom: bcm2712-rpi-5-b: Enable HDMI audio

 .../bindings/dma/brcm,bcm2835-dma.yaml        |  31 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |   8 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi       |  16 +
 .../boot/dts/broadcom/bcm2712-d-rpi-5-b.dts   |   8 +
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  10 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  40 ++
 drivers/dma/bcm2835-dma.c                     | 496 +++++++++++++++---
 7 files changed, 534 insertions(+), 75 deletions(-)

-- 
2.56.0

