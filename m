Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE43C81B8
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929686; cv=none; b=dCF1Bv0Mp6xbMU/Zc61bFmPfKgrh8xnxe/GRRY6emHv/z/9S/qUPSxfpCXmzSgK5MtJ3WWASjtKokqjbOUwQSGuuOIHlZ9VMbE1eMDU1cMVkpbJC7OzTy/3qTYwDQ2vPOULmFzOYuWxN1X2h1WR+STxReyjRnBJJ5AVVzMqsg8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929686; c=relaxed/simple;
	bh=+wicVs5ToWL4a54zQqI268Tg5wVEbVHmDLNWn0zdgz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKSSgzgWkwJMxaWzD9YymrJaayCUZ9jSZTP7NEqpflyE03ZNNoOqSLLQCpFtYkZpvpVoRqNbuwQcGOs27u7//6ndX0JwARpRT3pTqh6cM2XL2GmMgv2wEoNT47ognVDsEca433WrFQzeTEm2tVc7VdroQSHBi7RON61TQ/Z9zx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOH9jsRz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOH9jsRz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so2033957f8f.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929684; x=1781534484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9bZC8rw7YmoIyog8z2SdVy+ERoBgDn2wG881TA87OA=;
        b=rOH9jsRzxyke3hngZoB0T4JkXKiSVwvYKXu8tNUE9zl3KBj/d5DrJnrhldbJYNpGb4
         fMYU5srkgyjMUHLsqRPrXvOctPZrS+7ZufLGG99HsOQMRnk5n7YUQlfZ1lRQKgiolYvh
         gqTTyEd9DqKxBtaM8miQMqBUbPYz+7LKnKhSI6EeO/9bmwAuWLOTSCyV9D0+G8Rmd0x/
         GYPtKA0iHM4zefXrNiUvor5ZGugVHPnW3XHcEYlyJKg7ZRT0VIdN7r2k0G/dvjN4megS
         2ODN8WBuNQyb1SdY3mBbD6HQ7CBPAwrADSrpoL6p8quEaDsIWQDG1ZT5QjZ+4hUHFY61
         IkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929684; x=1781534484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9bZC8rw7YmoIyog8z2SdVy+ERoBgDn2wG881TA87OA=;
        b=fwRRDZEkaXH+thvm+QANKa14FqpQ9ATCLZQhC21x9EePFW3MtbKLyTBfOz9x2k2kDc
         Jvlcw4x8q0zyxpjMDX32a86JtJSP/v9wF6Ek4JETp5lUMMcXNjrLhmmkkNbT2w4HiwpY
         qbVIhqcAgiEUvQqOFCS5IASY7wH2NMjVVHRtfU70mSBjkvxmtpIZkkb//JgAMx9Ih6SK
         FwwqxJcm3CD8HKrrlFqRYMiqGjJYXu4KaS96OF9/Fm91CHpbQQkDJVoJrg6CCL8MJU5+
         KH3nYmpARDxreSjJeE/lvtu944XRTYHEW1pse8jaKgYdLHUtJvaaRFBOnDkxXDomjh19
         ZZyw==
X-Forwarded-Encrypted: i=1; AFNElJ9P5cwhfCIl/h0ExA2SXOUxivIYFvDj5pg1XLPQ/Oaq+ogls0cdbI3zTZca57X6H+V8P9l1riULSAVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnzq1duiTsUyzTrs7q9UB3wkvWtIki595hpF/hxYgie0jad0oF
	PiZy/QLyE7u/NPIFYkJCeZls88R1Aves3tC0VUQTvWDQkW7fwzkCLamG
X-Gm-Gg: Acq92OGu7t/sg4LRQP3Zf6CLIKJpQdK35nPvoMJ0SaA5Eq8ResWYgnn2dZVbAoVgAbe
	wbVROFlv0YGv4GIh8JpBlqKc83M6/XoIOG/dOYcQarEDLoZfYRHh6CPWi22vwNC477rUW0mXs+d
	dlXOru1i4mzIkbRQSY5UdedserFqhJWlQ4VNm20gSF24o7nHcW+K1GCm2tkxU+J49HFHNhfp/mD
	AxW7ast8eI22GfGr5G3zfNZvTD26Ugd/jd3DeQp46YVRuWamwwVC7XqjxzXcoIW9jZ7xgNcicwk
	rIFhBCh0oOuS72ANPchTR48HHRpicNIa8Tb+LoO+Swj5jvNbwPVj9l2GkHun5huFFDqRoyqpdgc
	Jn44Wpweg85oR+nqHEWV1vLgU6H4BAmAnNYVWKPOus2kGmvYsjKV8xmWcEkY+nuQN5mnh2LEOkI
	kTcCB1nr3qdzEoQYUeZYlo5ZAPuG2dBIvz1AG7GNjXrF7MJH3iy6yh6Q/kYfzv8rCKaxrail1pP
	SPAVusoyHnrp+16iWX96xDz/2LALJ+YeOORzNw3oY5zUrCwhbHoyVbH6oM=
X-Received: by 2002:a5d:480a:0:b0:45e:f5b6:7bf9 with SMTP id ffacd0b85a97d-46030627a04mr16756707f8f.31.1780929683675;
        Mon, 08 Jun 2026 07:41:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:23 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Mon,  8 Jun 2026 16:41:01 +0200
Message-ID: <cover.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins
 - Remove regulator-always-on and duplicated vddio node

v3->v4:
 - Fixed USB irq edge type
 - Add HDMI HPD support
 - Add pcie reset-gpios instead of deprecated one
 - Fixed eth regulator

v2->v3:
 - Add FlexCAN2 controller support
 - Add FEC controller and MaxLinear MXL86110 PHY support
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (14):
  arm64: dts: imx8mp-var-som-symphony: add input keys
  arm64: dts: imx8mp-var-som-symphony: enable USB support
  arm64: dts: imx8mp-var-som-symphony: add TPM support
  arm64: dts: imx8mp-var-som-symphony: add external RTC
  arm64: dts: imx8mp-var-som-symphony: enable header UARTs
  arm64: dts: imx8mp-var-som-symphony: enable PCIe
  arm64: dts: imx8mp-var-som-symphony: add HDMI support
  arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
  arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
  arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mp-var-som-symphony: enable PWM1
  arm64: dts: imx8mp-var-som-symphony: enable CAN
  arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 389 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 399 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

