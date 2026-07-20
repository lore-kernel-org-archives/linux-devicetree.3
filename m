Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05143101A9
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542951; cv=none; b=VnB87MHWYpV/ZQzdZPuUdhPvAYLNCmlufiFtoDfjKfvXeZw1vfPlZ0nge4jW3DND8On3VM+t8F2GGSk6dD2nReppd1iWqqeuop2A0zxBE6+90L+OSpgyZhvuZ+4KYu32N2X2vDEmghE4Q5Pr54U94MEGsTAMG/tUBovlcPKLPWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542951; c=relaxed/simple;
	bh=QF5iBOv9wGUuOcGzk1Jm/Qrwz3EzocGN8yrGEY+udfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VYsBhPPLtA7dMOwzipFwKnrD59alPZQXiN+GgKMLED1amV0YzQ9IWwS0so7sFonrcyMAbVZB3eZccJY7vBRBRsge4IJ6BWAla2QXqPGFfchzmYtHsU7fl1zRsrVpDkxpnhqv/KrHKfWY7ZR/qCVvBKMdWDFN7GJBLLb/HUZeKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZxuyRQF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZxuyRQF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso6050184a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542949; x=1785147749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAmw1oHNGHlX7bZ3goPBDmA/lFIhJInhwupNS3Y8tnY=;
        b=VZxuyRQFbj13BLL+AWOA3VWVTLCgLQu+cXIslssq+UVOWQ2lGmeRaaMY3iXj+knIHw
         ZVpBmMtXRc3IZSr6SoU+UHd3/LmRGWVfehDotgM4DoBxvbLaYWIXTilsBmwg+sm861EL
         BKTEKxy9MyOz6oIyL8kf5gzWNlE1rnjREiS3g0SvCVSXFz16VTFiYrA+f2ZvslRp74cT
         aQgAdL6/zKi5is31ZIO7mBEhaRzesGiA51AHm0KjATlPMgU2hlEiuEDxQkxTT3ESTxZ9
         MvXx1o06DK/jYhEUaQR47NCmFXg73cwl1veysnsKwkdEez9/LjUhWr1J4dCs/vuUbU1T
         L5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542949; x=1785147749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAmw1oHNGHlX7bZ3goPBDmA/lFIhJInhwupNS3Y8tnY=;
        b=rMIfNdUypYwtmn9hs+896xJI3Y7RyX9rmfi0EiPmvR781EQpYzXajyt2rZhkoVSAaQ
         tvt2CaoRQQ0jz319iotZ6aFsOdzFuvLo1H1Ba3392p5SWDha8rnNNVN8iOftF0sT7hzG
         Buc0+5v92QqclVIWKuoSWu7AEKDkCF8vsOWFPSH8zliVEBu7dTpfTNRBkNADM/Y4hJlv
         8bFbK+oaytpKp5GpSF2xg+2aFOhDst0RqOwvBDV9QRMJP/amUMrWVS+5aGasvy087tLB
         M4ndSOgx8PuCk3S0tVp+4wyKsExsZcU1TIeUz5lxsw8wt1P6zQ9v+78vtYtFhp38sTBU
         vzxw==
X-Forwarded-Encrypted: i=1; AHgh+Rqg64AtXWRF6+WTkyLfwe9raScChSBFm736EbOKfvpvf80j15YwD/siMTDWDDqwVrYAmqNgRqvyfXsR@vger.kernel.org
X-Gm-Message-State: AOJu0YzwG9eMmiABYkJGdXYQx/SXSv1KHtZWNBvWYjMzhDQmPGEv2L7q
	iC5OFxiXDDuh4SM1lJHH34HWUz/li+rhqumUwmjfi1K8uxCdbtIvXB/p
X-Gm-Gg: AfdE7ckfGy8AbZ9MJTM0sIuc/suMMxNv9i3BujiN07Kgfu8bOYB/H5wawzkx6M5H8dB
	SbVBxOOFVfst+nGpy8al0tIHn9N8SUKde93rQKTRBhVwnBXC6NexVe7PQoJskG0EuSYi81kIbzO
	BCIFIHpm/gjxIsolCELKowGya5E8v4W/ul7hz/8TP21AALciyXxmqx7PXtTcTNqOBhugomA2ver
	nUbfCBGLvecsj1DafDy98/FQpxwdnReuZdUWap07enOdmwWY8Z1pcjC6BxCeOaoBFum2T0kCaEB
	BGkY4Y5rBFDkNptlp8AGOPvxL8V++eFgBythfdJuKaAbbRw0KY5MbRNFZGjQ8/fqlB4svGi5C69
	s84jBLGva2RKrhEmy0ki2ENkVmm9YkhOndebuHIzM/n2k6jajfBefUtFJGw5WwVfb1vCK9IHfx8
	25+c3C3+QykZ4P9tcCNXOBsInzgy6CIQkI91y0yuvRaOvwwtm3RTSQ7VqQLeeHoMA=
X-Received: by 2002:a17:90b:1d52:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e4b5860f9mr14233192a91.38.1784542949254;
        Mon, 20 Jul 2026 03:22:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5616125a91.13.2026.07.20.03.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:22:28 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon, 20 Jul 2026 18:22:19 +0800
Message-ID: <20260720102222.251179-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v3:

  - dt-bindings: add nuvoton,rcalcode = <7 7> example to illustrate the
    optional resistor calibration property; revert redundant clock example
    change (back to USBD_GATE as in the original binding).

  - driver: handle -ENODEV from usb_role_switch_register() gracefully so
    that probe succeeds when CONFIG_USB_ROLE_SWITCH is not enabled.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 284 +++++++++++++-----
 5 files changed, 389 insertions(+), 76 deletions(-)

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0

