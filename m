Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B3480DF0
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492377; cv=none; b=YADGwTBHS3gnCXBSAa3NaPrjm3z9dLoiUzLs8GgbYM6Z5j7CKx4+3oAjbzn9gcXmtIs4q6AaRyyV4CacfbYr2Jy6Y4kc3REFVu2/oT3jMOqeXxVv6OX3bUKUjtJs1a6TU0yLUMxE0O0G5NTIVp+HCmeK7i6iUVyV9ATNJD3Bz6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492377; c=relaxed/simple;
	bh=q6dVCecc3xFS4uYzPfiBGStAnjlKRWR3BwOU/5cBW3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CunP/YmyySvbq46SXATVgoSQdDo8ZiMn3kADQPv1u/fz8IE7GuTZuX7SHpvKuOEY5/Ay2i2gPOrSMPIQx39Us2+YHJ2opNcPjOGfvL1cFMLPSprnWWsVDxkjTSLYbsQAKb6VPGPKB/JAEAhJFmGNTL8yyRHh3eXRslwzawKa6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BV3a1NYt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BV3a1NYt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5244642f8f.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492374; x=1781097174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVpggI6/ihWC+nmbcQ6eFom0q7lhdlvWvI95TJ5lCfk=;
        b=BV3a1NYtoA4IlG6JvMqZ2gOLQXmmN9AmX1bDF9VuxxEolueT1z915ixbSvAfh1ROhF
         Y758C9nRQgL5ru0VL1+jJMN2i28Ow55W7geLBr1Aw8W6ReGA9FUazvjIW3G99iMpGOw8
         BkF3duOkuiyKVHKhYJ49DqoZ+iJjiinu28vp+HaRkNlibdhN6+jAQvXn+Ri2MlkPI/oR
         5Pv4xF47YzddJRS9YiUUFxjiMyvB9nBVkECgclNYX+i93L9NaTqip2vDe0wekJFts/a8
         twMWo76Qzh0eEDgugQPjJGXWnAdX44rezemDLuKY53D8pNxxacrNcvpcmv/il25t+Wz/
         UdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492374; x=1781097174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVpggI6/ihWC+nmbcQ6eFom0q7lhdlvWvI95TJ5lCfk=;
        b=UNiXuRY/qM0aoeEVgF7VxTTRh51YQF9TeNFRhBVxJJkw32jvIrmmi1WpMuoIEUC1bt
         FLrH1xWpY0HciuibT1QtAuBV3b+A8JrAL7iogepX9pdcv45ZOCHsKINoIfFk3zLfKPmA
         684dyOQF8vrAP7Ci7dxsxnO9vA/Ugb9ZZsOCiQol1/bym3Bl4kyvATfz89uEsZlS62R8
         ue5EZU/aLBdeoQErVhjJkb9FmHH+W2Ye28LXhSIYx4+8OitCmfpGPGCvVDiwnB3tTKvU
         gOT6uPIDkHaL83Q1YvXuk4AIjnSMiYkhZyROHHYtXPitf6q6ZNNRaJoxy71FUBAOR6Um
         yXUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/imzNv3NbfMe0J7Yb5vZh4mt4b5p9F4Pd+cuksf1rBJ70eml8M+S+eQULTcPwmK2ZRvkoWI+C/vqyg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5YepnrSpTY+CaFjWzqOAMSp/rqtYm5nwpo1cTTBSOOKua2c0
	zb9CaUkQ0dLnYMGlQ8ANYhWHQ4qPtcxvbUIFKz0jZ2YK+pzQ8OTC7zmI
X-Gm-Gg: Acq92OEGXdJw3607zHUAZKWkI74fRLwhTO9mhBMSEJ237UhlV3aqO7277c4wC0Zrl3N
	kweskpn/5xuYKfukt+qNy+3PJbFC67ss+4jZHXD2RB0YCPKTK0uKQSMeQu0zCTl+Mgt1q1U1cau
	YYXP86/ycCc6/6GiSSvt1yya0/I8E6YWXAXp5Q96kR1bmMSfxYKQAK7Z25ABJ3sAQWVUhtQExRW
	sLtDLc2rPMYom20ZWg6M+seCIgtYbEZbLiethwWJzCEWo4gNPOUOaiYrj7xQs561yNJDonlO6M/
	kgn0gu5cHySuJfkWSelChV3PV26mwDarhQRkqDDNrFYOXJv+s7disMAWOATpqjI050Wj8yms77/
	MItMxmbLomHq0cMrqjGIyKuvwv7SNX9Ufert7amMTYPt/wTmEcxBTNqrpHB9/LCFmKQB8EtAHCv
	RkJRqWUrP/yDUaxeEypgUqrzRbnNBqarJHvPX37o9nkkIuzuSIWqdyq6+6BbRHVec/X9K9vrbJq
	C9gzoPwzRKpZX9cKS1smqSeCecSEZO/ZxUn9QIVpo5aoWuf
X-Received: by 2002:a5d:5710:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46021844ce7mr3696351f8f.25.1780492373927;
        Wed, 03 Jun 2026 06:12:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:53 -0700 (PDT)
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
Subject: [PATCH v2 00/12] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 15:12:38 +0200
Message-ID: <cover.1780492180.git.stefano.r@variscite.com>
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

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (12):
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
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 320 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 330 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

