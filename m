Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773B421EFB
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329308; cv=none; b=jkuvfaes0E6TVreVeUM0PxHxzKzYHEhKsWm5H50AxQJyS4XNwbe77ttKEwuR9P3kD7L+08Navq9tIOmv63LjE5qj+TH7Gv4H6lvnJyaf0BqqDclH0e95ylmh6vpXGNhTcqsJZjK33HL86sragaMhRzNWymz4WW1xwxCHlD6FdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329308; c=relaxed/simple;
	bh=cLIYaTp8BMdNpvmeNN9IHEGffrelsNbt22peLlfH/xI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TyfkveYa4WURseohmst9rpa7SnoVr7vglV5vfUlfKPfIJTQhJEE2JO81TN/UMTLb1iZvTSuRsmVJG5aC/cM+LuqlszTtrTNon31KQVpPMpB4EPZ+1n5obU1yP/YH1INnrcptwHcLAHO1STF7iEWnjpHpxdtsIzapQMC49s6X0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4ff8QAL; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4ff8QAL"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8478cc93299so3054768b3a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329296; x=1783934096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lr2T/VNgeTFspDjmoHod2aovQh7y4rJk7xKdeAYkRu0=;
        b=Q4ff8QALec9+WokpaavK5eeOuyn0r/RiKH7EFM2+n4nDACmr8DjrmitAlb7TUYax9Y
         P4iulO7RAi9gKgt1bZrpn//mPH9jhInGCyyR6xgGTMm29KZ6EDSucyjcGvE9EdCNm5Fq
         gaVHjYQYKf5KWwqQAhV0Rwq9moWpATbICt9PsL6GkGOLG9dN3RBKmq1pxsBQGBupo2DG
         wswZQ8hN9KDGkNm2KS2yQW+uy8GeYd3K/XiMlX1fD7pDxIMaYd+T5wOKp/khG8vIjd91
         kyW5+vTAhWV5F3I7NaGKn99OUdwQuAhjmoqrrKHdDKnv//gTDwpDM666MQ0DmD6fNbtZ
         pHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329296; x=1783934096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr2T/VNgeTFspDjmoHod2aovQh7y4rJk7xKdeAYkRu0=;
        b=pWzsJxJ0/mx8743Dtk3105sZ4rrR70Dz/Z3I94PRS+rwQY2DUQFZB+q3b+m7316VMy
         AVLstEBPNKJAXLZSfXnjf4+DHhxjEENvyxvOht2IyJQ2yRtNY7schFfHYURcoPJYU3wO
         NCS/vjIh9akzsQpXCDOP+SHZd0H2A6EFml/FbTVaFdNOrCcN1WgI+PP9RTDWLoeYjrh1
         WRTy7SvnQDvfnJpflxC2xIaK5vlDVM3WCrRGbjAcmSU1q1dWxQS5+KCaIsJscu4uDcwt
         vH6R+7EsX1DamyngRV48U4dO4Ci4mjbecXc36uMq939AubUZn36vR9UYn6zOsG6B2mYh
         uifQ==
X-Gm-Message-State: AOJu0YxO0cd7wWiU/DzRBE5Pcsz44QCfMwhl1siFls/wuP2KVbZJFMG8
	gSCr64Mse/Kb+qyU+M/NurKBeZO9jeu0eh/Wipte+0DXMYUTKB1D2FII
X-Gm-Gg: AfdE7clRthgXmvDI9WIu17Jy0iE2nvN49LaoT1mf5IT6Sex9pd32HDnsdv/ARc7YMXW
	CZRu5uk3Y2KEaokIdMLSuARkEzOj6yU5HGln8r//Mt9BBdWlAuzH1o/9xCL2cX1rZ8Kb7dHKR3U
	hXcrSiu4xfBbRRNI6xGVm4fJEJ+cHxN07VLguC6++M3J5a2J6NTmH7b2sDtLSzDxJ+OrHjhmNIV
	Xqzo2cabONAsl1IczjLi2IKcbiZWZ/9rqjGUuac1vH9f2yxdIj2qIJG+Qq3g6JUMRXs4PskyIXz
	e/CGG7DFcxz4WWIqY/pEFFGgpSQHpv/Zg9BhZ2OFwHnnJdkd14ioPE/jcL59tkMIeUpCYvw8SHX
	DkbrVWDKHbp0llmqdJEu1klyTUSOM4wJdfmIFPyDmxGd+6CPRNv/YuHeHyjmpJhmgzUzsCrT8na
	SKycUDJT9TNQA4uaVj+DhVfMqB
X-Received: by 2002:a05:6a00:928f:b0:842:80c5:c420 with SMTP id d2e1a72fcca58-847f6ef68camr8193652b3a.40.1783329295132;
        Mon, 06 Jul 2026 02:14:55 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:14:54 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Subject: [PATCH v2 0/5] ARM: rockchip: rv1126: Add support for Alientek
 ATK-DLRV1126
Date: Mon, 06 Jul 2026 17:14:40 +0800
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ML3aIyQ0MjM93EnMzUvJLUbN2UHKhIiqVJYlJKcpqFqYWBElB7QVF
 qWmYF2OjoWAi/uDQpKzW5BGSeUm0tAHxpGmR8AAAA
X-Change-ID: 20260618-rv1126-alientek-dlrv1126-d94abdcf8580
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329286; l=2237;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=cLIYaTp8BMdNpvmeNN9IHEGffrelsNbt22peLlfH/xI=;
 b=n9ZjERAhzjx2V7crs7HJzpo3tqAmQ8t8NqGgffNufU3uJAKs2gRa4YnXgybLrwGB6BscbMpTf
 6R7McTRg+88CmER536i37fi+k30MyFTlhzIpbLcmMPD4KH0VhdznWAN
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=

The ATK-DLRV1126 board consists of a CLRV1126F core module and a
DLRV1126 carrier board. The core module contains the Rockchip RV1126
SoC, eMMC and RK809 PMIC. The carrier board provides Gigabit Ethernet,
SD card, AP6212 WiFi and Bluetooth, PCF8563 RTC, ADC keys, GPIO LEDs and
audio connectors.

This series adds the Alientek vendor prefix and board compatible, updates
the Motorcomm PHY driver to consume an optional external PHY reference
clock, adds missing RV1126 SoC description pieces, and finally adds the
CLRV1126F core module and DLRV1126 carrier board device trees.

The board was tested with Ethernet/NFS boot, eMMC, SD card, SDIO WiFi
enumeration, Bluetooth LE scanning, RTC, ADC keys, GPIO LEDs and RK809
audio card registration.

Changes in v2:
- Model CLK_GMAC_ETHERNET_OUT as an external PHY clock consumed by the
  YT8531 PHY instead of keeping it alive from dwmac-rk.
- Add optional clock enable support to the YT8531 path in the Motorcomm
  PHY driver.
- Use phy-mode = "rgmii-id" for the Alientek DLRV1126 GMAC.
- Keep the PHY reference clock in the ethernet-phy node, following the
  rk3588-tiger.dtsi pattern.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
Yanan He (5):
      dt-bindings: vendor-prefixes: add alientek
      dt-bindings: arm: rockchip: Add Alientek DLRV1126
      net: phy: motorcomm: Enable optional clock for YT8531
      ARM: dts: rockchip: Add RV1126 I2C5
      ARM: dts: rockchip: Add Alientek DLRV1126

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/rockchip/Makefile                |   1 +
 .../dts/rockchip/rv1126-alientek-clrv1126f.dtsi    | 277 +++++++++++++++++++++
 .../boot/dts/rockchip/rv1126-alientek-dlrv1126.dts | 256 +++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi     |  10 +
 arch/arm/boot/dts/rockchip/rv1126.dtsi             |  15 ++
 drivers/net/phy/motorcomm.c                        |   7 +
 8 files changed, 575 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260618-rv1126-alientek-dlrv1126-d94abdcf8580

Best regards,
--  
Yanan He <grumpycat921013@gmail.com>

