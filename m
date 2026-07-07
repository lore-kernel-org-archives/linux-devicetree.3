Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A042CAED;
	Tue,  7 Jul 2026 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434062; cv=none; b=hsShSJBudgiZeWfg5lav6TaMu82odbapishf5plaKEFrw0P1PEWA0mEjo+zNoff/fT+HA9GrSUHkjrVLteICPIdoxOi0L7bX/EF9hOxCUafwBadIIMAnL7rE9LJNcVeEB5K7aCNUaEt5+CNWezvLP55eVhVt73DC9xwSiADzuLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434062; c=relaxed/simple;
	bh=vQZW0BtvgCjvpoZIDnlMyeKdpdnD//8TJzvJD8ETpjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pr0n77XmyknhX3qiEWuCuGG1sInYo4bPXKq6hESZeV12Jsy+DbC6J1X/2kI28hHCvem1ILYOhxz6BPxxBK0vDADW5/E9zG+lEImlnNQH6jM6rahLw9Z09hfLZ+3zrKhlTpvO+tNsV+kvBoyssme/SeFyRULKHYsIB5n8JCySMjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TWiX4y63; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DWNyPLoP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TWiX4y63";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DWNyPLoP"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783434059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SiJF/LaxE7u8kl1QUtYHqEBKfLUiFz6zaObGXEuJ/0I=;
	b=TWiX4y63STDjst3X2KHTyXTuiYZJKsF7dxC212O3kIa6K0Eb5lbR0pmQDSeJNh04QEvJHv
	BNn4fhjwd0cdHB/4I55JwbDMiOnNNcNGlXu92ANpGFhY3lgqxFI4SSKzMyt7T4rmtcBM7c
	QI9MPoe7SoTH3SwHvQ+PubAhzTQpNlPcyNINw4jZuXC3tVt4s2jJEkhu+2ik3rgBoavOhA
	T8+If1NKwOFlrNwT5ndIjlApB7FZe1qIXvT99yfcJLGKIX3u8prS252by0lXwUzfoi66Ru
	2tKuQAJWeilGYgtUrkZQQvpLhl3C7PQFpzk2MoyrhiZ74PGVJsbSiNgtmiz40g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783434059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SiJF/LaxE7u8kl1QUtYHqEBKfLUiFz6zaObGXEuJ/0I=;
	b=DWNyPLoPMl7JzwPK68SBpwpBNe/uWfD4Wx2w7/kOLXmuBXQwqvBkRxZVQBRIoN0m7oj34I
	c17xGSoio7KXRNBw==
Subject: [PATCH v3 0/4] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Tue, 07 Jul 2026 16:20:53 +0200
Message-Id: <20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEULTWoC/12N0Q6CIBhGX6VxHQ1/GURXvUfrQhDzbw0coNM53
 z20tWWXZ/vO+WYSbUAbyeUwk2AHjOhdhvJ4IKat3MNSrDMTYCCYgJKGDmkKk/Y+UQ4KjALNJEi
 SjS7YBsetdrt/OPb6aU1aE+uixZh8mLa7oVh337LYlYeCMsoV04XhhivJri90fQre4XiqLVnrA
 /z4Jdv7kP1GnGuojagqkP/+sixvWMhJPvwAAAA=
X-Change-ID: 20260623-rpi-tryboot-4292c92b0727
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783434058; l=1871;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=vQZW0BtvgCjvpoZIDnlMyeKdpdnD//8TJzvJD8ETpjE=;
 b=j6IxqAqE0/8UXWRMcWV+NAxn8dbFDEh/GPQoSzRNjSJxrACGkP0uVD3BtRJSQHF+tiOmLSL4C
 3rUbqWAfyA3BaBKPtGf4sUDmEJh7Yw7sWguLYzxpAyX985yCbH4E8/+
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

This adds support for the tryboot mode on Raspberry Pis. As there is no
documentation other than the downstream implementation [0] the
implementation is based on this.

I tested this on Raspberry Pi 5 and therefore I only added the
properties to this devicetree. But afaik this should work on all
Raspberry Pis. I will add it to the correspondings dts if I get some
hardware to test it.

[0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b

---
Changes in v3:
- fix use-after-free error by using devm_add_action_or_reset
- ensure endianness of magic byte
- refactor reboot mode registration into separate function
- Link to v2: https://patch.msgid.link/20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de

Changes in v2:
- Remove unnecessary reboot_mode_unregister().
- dt-binding: restrict to mode-{normal,tryboot} and only allow 32bit value.
- Link to v1: https://patch.msgid.link/20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de

---
Gregor Herburger (4):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  9 +++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  2 ++
 drivers/firmware/raspberrypi.c                     | 40 +++++++++++++++++++---
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++------
 5 files changed, 60 insertions(+), 15 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

