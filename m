Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B37B3F7AA9
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072538; cv=none; b=FFum1q9gKxsB9s9zOSqTLc4/bwPUJ8B8UpI16n3lFFN1Z8CMY52gWrHTd+z6RnwGZK5AYUVVyqY0/31hkl99nQfY/lIcjPzzYTptePudESDkmbQml9/qin8TVScXubo1O8m06X1FPsIeU21/vgKUoFkyIm532narRjzj9GayV60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072538; c=relaxed/simple;
	bh=O1aeIGOQvGB7/OgikH+dEqEn84w48c8KWaQB1r1M41Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bTD7KoXtmiq9PfxPFh29izvJZR6qCRfRBjlpsRDSlT2+ryfi3Odrg0FwrMW+DOKyn+sIB/BL/rlk7eZo1OnShVPAgIE2g19ZQ9cug1KOVPkwmxfn+8Asei1CCMp8LadLozjvTFF999DNHpPTBUUZWILauHTQ5x+AekXEac/ypak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXv61MAM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXv61MAM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44b052142e1so2739355f8f.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 06:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072530; x=1778677330; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6w/Ct8nuPMBPRpUy8/kJfgTP+J5orD9plu8W5VIflo=;
        b=UXv61MAMuGQ9D4J9v/e04NfgnfUQ2y8lz9rZp9A0F99fp0e5JBvEp/A6ntrmXiOvJN
         +o6oXB5Y9uck72pD90HwYBt7svmNUkEkND9F8mrV0XLAZB9Zj0csO2Zkm/jFwFmkPYWg
         Mtqu8LZ5cNxFaACEdi1a4nSGqDiuY+cDz7qpjba3cvRYU2wCVTtvjEGwEQdJDem/FiCs
         O+PjvA+y3axNHp2RRApTjQP1qhxv7slTrTXtZJeTXRook1AxTAthqmmB8iok+B0T46AL
         /hktqs92nNDHrLAaWOUUCIDOxLmu+R09d+b/CwUCcARIaa2U3Jc5filtusCzGrfzl4PM
         +UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072530; x=1778677330;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6w/Ct8nuPMBPRpUy8/kJfgTP+J5orD9plu8W5VIflo=;
        b=OGdNjYlRt1YpQ/4dVP4NDYojxmvXtusbw5Lx9M1vL0XPJoEJBVpbSrqg8ffee0Fd/U
         WAiWAU/Gfv6pDrQ+NnQB+cSwRPrjYBWNybfVo+aT3g46WWFoo2OrZ5ehFbfMQP2gVx9E
         EGZ9eUfPZEACBS9CmFPyXt7vZLI54do4/yBlkb77kEMvc55atwKtAtIyNo4geG+Pq+a7
         Q2meXBASJcI18xvQp2vcOvzHpnONfAt4wUzUra2HO4hOTlT4vXK5mTWNvCplxuQ9P7JJ
         ApQvln6VgOGcLMZuNLUjyoQJRBh1kZO4r3N0MCQpy38mT7VzYaxKkZpFWdXVLHG3xsHH
         1Gfw==
X-Gm-Message-State: AOJu0YzlJshIcQBOtMvQmnrn97hrbU6Aw4cFoKZoHg5/1z4GsFE6qcMu
	DXayI4JdJcQzeRxtkHrkbaq/roDkj37HPw5wNfHiVjCKo6W3bMDr6FYN
X-Gm-Gg: AeBDievrpEowzLarDtA1L1yvJ9VrTx4wYApQMqO3A4c4YTEfcxQ1CKSBkKQsBiWMttx
	bxmxJuVzQLUUJIliIKZygeowudxouh/4eov59qUDx7W1KeWqdofHIHXNgjyKoOrG9umOJckXogG
	GcjtdPzc2tgLptSzlar5vg2lEYiDfyBA85FCijUFOH30iFZsX3x/cXWr7nBpnT4MPa2cCUznQxz
	KPJpk/+qX4whldaKjosfMuCXqHpLavNG2HERl1MMKYm4e1XhTUEFqeCAvztlL3J+942ZnBm0PO/
	2osjoZoW8syfC9ffuAlmUJOc0BRlil77sPpigpffPNCBKseJXhVyt5WDpIwH/B4tGu6t0VAGyBP
	jCvABr1b1JJq/ZX80JgKNisb/tfBjXQvKjfacJk5ASqHRsO1zZzyCLFtELADcf/WWtmyuC6LPT1
	AbA/EoPTSESM8NM3bRGzvWi6ZqUhjXbJ0+55fxhUglzd5iLC2cP/5BZvixZtb4jcOJgJIhxo3PM
	0Mg5c/jAXIJ2vzwNy0dnXwH8NdNhI1fAlv9FpCJcMA+ZJXvHx33Q+5M1TvBIczvwq+FN4sspTbz
	jcJ4m5Xm8yI=
X-Received: by 2002:a05:6000:268a:b0:451:3b12:9bca with SMTP id ffacd0b85a97d-4515ce1cde3mr5834248f8f.25.1778072528841;
        Wed, 06 May 2026 06:02:08 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12288076f8f.12.2026.05.06.06.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:02:08 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Wed, 06 May 2026 15:01:54 +0200
Message-Id: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMI7+2kC/x3MSwqAMAwA0atI1gbaaAW9irgINmrAb4siiHe3u
 HyLmQeiBJUITfZAkEujbmuCzTPoJ15HQfXJQIYq44xF9h75OHVm1OWuHZZUkKt4KDxZSNkeZND
 7X7bd+34RJCVxYgAAAA==
X-Change-ID: 20260501-add-aquila-imx95-423256af3d21
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Antoine Gouby <antoine.gouby@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.14.3

This patch series adds support for the Toradex Aquila i.MX95 SoM and its
currently available carrier boards: the Aquila Development Board and the
Clover carrier board.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and 
Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
lane DSI or CSI interface, one LVDS interface (one or two channels), and
some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0, 
and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Antoine Gouby (1):
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Franz Schnyder (1):
      dt-bindings: arm: fsl: add Aquila iMX95

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

 Documentation/devicetree/bindings/arm/fsl.yaml     |    8 +
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  294 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  398 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1862 insertions(+)
---
base-commit: ebdfb84ecf7a0bba26d7a04edae98dd600fd4b42
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
-- 
Franz Schnyder <franz.schnyder@toradex.com>

