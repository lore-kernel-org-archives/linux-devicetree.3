Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0353DF008;
	Fri, 26 Jun 2026 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459312; cv=none; b=s1xrFcxU88CBKoANOCbu9V2TDqrGfX/4mibE66WUsWZoQZdLWhWOZKhB5mYVTmBJkzTcq/zMNSflsQdSrKRxAvjJuxpE7mbFehBXz/JUe/YYWiGbPmBmHHvfAuUjLN/rfE13tUbPDSKzUzwSKJfXaRbg9IBCPBMCcw/uRywHntM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459312; c=relaxed/simple;
	bh=c/QrJu/c2JdN8x7ZF3z4GlXwCTUZSadQRyVg7QFrW4I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EwKkArr7Hdcmz+3ZwxeslxuoYGEsJesnSBt1wmTUd/cRwkjVFlJDABaZjVXMugcEadwOh1ubyTpr48K2lg5yFSJRBDXn0QGYvMwjwRHG9VNIqSkqfPkg9wYodp6OpLQveYQOZlU8EgSQ1qTFAM5pjzLas3iLhYWsxCM8qFJbP7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lSQFQ8wg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CGCswwCU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lSQFQ8wg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CGCswwCU"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782459308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9GRuIO419e5m6wb0FB48wW5pogsLj5pIdchxBZ3+u2o=;
	b=lSQFQ8wgCFPKuNfr8GpEUoBucUfSL/T+1FCR0GCQ7+5vWG9HWYBmQAt7lncQEMuiuFRYjE
	6A10cSl+vMhG+kDIckX8yJXv/Eo84cTPldCPTtZ9dvpHaPy4AwWApejYTcVFxeMNXQmdCz
	uPIdR6MuIQtFgMqbBocosCjTRJu70HLik90703JcIzH4c6H9rXCGASrd8i8SeX89Eih7HA
	eeVDmPRLP8BLO2p5k+2/Siu6EeCr6YKx6do+zJw5Zv5qBWfIublMC4E5u+XnrGsx0IE6jb
	cdlH/QJlOF36nOa20fVoSjOsRhFVnoNINGcNLmmiebS1RfI7cCrs2D9FQVWWnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782459308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9GRuIO419e5m6wb0FB48wW5pogsLj5pIdchxBZ3+u2o=;
	b=CGCswwCU2AG0fPG5BVi5e2+QUucOTc/Gzu8p+U4hQeAZAvLwaAgXqOI52kMyDDlXAYqkoP
	5qFQVMtwZL/W4DAw==
Subject: [PATCH 0/4] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Fri, 26 Jun 2026 09:35:03 +0200
Message-Id: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKgrPmoC/yXMMQ6DMAxA0asgz0QKLgKFqyAGEtzWHRLkBARC3
 L0Bxjf8f0AkYYrQFQcIrRw5+IyqLMB9R/8hxVM2oMZGN/hSMrNKstsQkqrRoDNodYst5GIWevN
 23/rhcVzsj1y6FnCef29/kw1vAAAA
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
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782459308; l=1368;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=c/QrJu/c2JdN8x7ZF3z4GlXwCTUZSadQRyVg7QFrW4I=;
 b=R7tnq4yZgYV09EtDGuFaZnbfnR7oEs4eul28Buu89lakJuHyPhZL+jk+1zQB+h2VbSsokAsXy
 lTaFiQX+YXiBMVAtmbPwoUyFH2aDeOupWjX/Czcba8nnNjYH1+nPhZG
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
Gregor Herburger (4):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  5 ++++-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  1 +
 drivers/firmware/raspberrypi.c                     | 25 ++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++++++---------
 5 files changed, 44 insertions(+), 11 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

