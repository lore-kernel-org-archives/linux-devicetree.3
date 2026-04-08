Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2700139A07F;
	Wed,  8 Apr 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635231; cv=none; b=O7/rEvNnOBm7mawXLuAz1bmWnf9KElJ/YWMuTYOdODLTXvyPfomxFrkDfTuGHMPnr5QLCRuP+4Uv3Ub6+SCZ+ItWmA08+tm2aqsBNVUUs8MFWcM6oub8Tf8+alzl5WUghk/ZXLAsjE4TGQ7O5XmVJLsDIhHawxz75R5DyD87au4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635231; c=relaxed/simple;
	bh=OfYLblYeyNslABR/aS1zAOJHFFxGSxxMkAhGoDl7lmo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VOU985iPLck+7luG9ZfWuk6R3NZCsC4WgwpAqgISqwCazDP4YHEBOA2F+eGFk325n543oiUsuxtHJ4OKT7yHOGCHHm5PEUgTyJEkrI1FETF3v/+C67hsWPupU4sUhkhoQvq9wI2oW+hgilB11DFQ0XwxYsnhVpuXtYf+I8aRt6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HHD9p4/Y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YPJui6NT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HHD9p4/Y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YPJui6NT"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775635221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6A1h+9HC3APqXR8UyMvptWkzVFlPkLKI2m9Sq4M6ItE=;
	b=HHD9p4/YljX+Nv72eDIr4whEyLFsGzpAEu7Zno5uvZBpPttPzv6yFMPVMoM8wrO5mun8Ac
	IV2Lw+LWC/ZyQvZAAZrqKkufR78VQ9OuyYYCzLVpIk0heV6EyUWwhGOcku0xaVzhZgmjKD
	JF/qvzEn021yY08ph7hd5V9FSGCdh1VDr4X9tV6ZftfnvUugVHi/e4VOV4WpVk7xd7I8/I
	TU6Axtn/zK/MU9eMdauHe7MoPvHbtRx0nJg/GwX7tWhw0QTXAkgpeET9GgZpzc80rOZahy
	5FwflC6laG9mWJLMncIFQB9QhJLCtxwWNUU78XCDNbkzVGeemZDuYc1sXjLgVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775635221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6A1h+9HC3APqXR8UyMvptWkzVFlPkLKI2m9Sq4M6ItE=;
	b=YPJui6NTFrG3D7LStPcQ4nxiFkZwUmSdP9gFxVCOGI7YJTBZowqez+Ee9NESpTqgbfp8lN
	DEKm4qpjjfxhSBCQ==
Subject: [PATCH 0/3] nvmem: Add Raspberry Pi OTP nvmem driver
Date: Wed, 08 Apr 2026 10:00:14 +0200
Message-Id: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4L1mkC/yXMTQ5AMBBA4avIrE1S4i+uIha0U8aCZkojEXdXL
 L/Fexd4EiYPbXKBUGDP2xqRpQnoeVgnQjbRkKu8UoVqUBzjtjs0woEE69Jqyoy2tjYQIydk+fy
 GXf/bH+NCen8vcN8PVLHlbnIAAAA=
X-Change-ID: 20260408-rpi-otp-driver-75fce1dcff7d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775635221; l=1157;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=OfYLblYeyNslABR/aS1zAOJHFFxGSxxMkAhGoDl7lmo=;
 b=wYmm7rugDanR1TnYH18EPD02sRhItxIwqClGGnnJmOKGKgJMjVFfKr4xsTryLjRTjha0Rxn+l
 yykyei0JQlLDqmaSgMeTj42Hw7a4Of/PAixxFj8SHRHf+jnnAxQtPQP
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

Hi,

This series adds support for the Raspberry Pis OTP registers. The
Raspberry Pi has one or more OTP regions. These registers are accessible
through the firmware. Add a driver for it and add the corresponding
devicetree scheme.

I also added the devicetree nodes for the Raspberry Pi as I tested the
series on it.

---
Gregor Herburger (3):
      dt-bindings: nvmem: Add a binding for the RPi Firmware OTP register
      nvmem: Add the Raspberry Pi OTP driver
      arm64: dts: broadcom: bcm2712: Add the otp nodes to firmware

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  18 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   8 ++
 drivers/nvmem/Kconfig                              |  12 ++
 drivers/nvmem/Makefile                             |   1 +
 drivers/nvmem/raspberrypi-otp.c                    | 159 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |   2 +
 6 files changed, 200 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-rpi-otp-driver-75fce1dcff7d

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

