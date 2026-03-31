Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76E3EC2F4;
	Tue, 31 Mar 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948869; cv=none; b=ofRuUUUHWAQL/ZulFaLlxyd4vyPIPQwkaBLKr11/K/Q9J0ifq/rCQiQY5HZqLMPwgvlV3ZNuSvQWamZ0s0t7wocSDy9/prpITJydF/Amb//+VU0/k4H21xdlBHFdAf5BX7H9wIwM4Qp7sCnaaYdG4XTYx0A4lh5XW74ADA4bEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948869; c=relaxed/simple;
	bh=8auKo0foY3kcGVn7VSOPOizNKTzlxVlos0hZrypSWAg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WK1g3KWoU1fMuR+BSIRw9ov9qBpTM1L1Srdvs5dV6FfMukYhzJO44+T4k1OgRSmW9WztjEZgYckqryNSTTYJh9Rkk2erXulqY38ua+s93aZ/hhdvNtjLfldMqjxki2QeNmpXP5V5tTzfFH9SBSiKyhSzcMmd/olJhrGC+avEknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wkjOxjtP; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wkjOxjtP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 469021A30B5;
	Tue, 31 Mar 2026 09:21:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 141046029D;
	Tue, 31 Mar 2026 09:21:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B1F4104507D9;
	Tue, 31 Mar 2026 11:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774948864; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Gd3cQwoOonIHKjewQLZoEnAk9To8U2pkNEL7ZBIpgqY=;
	b=wkjOxjtP7Hxco7hLdLvWEZLLVB2ieHZsqi54OvujhWAG6X1rXePIuqDUWKh3TRXamXIgjq
	e/xzwL6Bbxudc72aUFsuV06jpditHDK4rECwCSlomiMWyUFDBdckOZEqw502wTsUzCKUSf
	DAPfp0Hv/wggtzEhmqQXTcIgTIVs5P7EduubNzNyIKJR4O9zFrl8sRGl0pgmLT2O4avsER
	rdW30nj9i3xXgOtiPWrHMv44Aol8DprCecNxDN+4TouG9r+G9t+ALhC0z44nRDb0Sfafld
	0EyfvIo5072Asday3K4S5Fy2lkNVE8a4LjJJbv9Gk5TsCxJY/uDmY1TP8VSK/Q==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH v3 0/3] misc: ti_fpc202: Add LED support
Date: Tue, 31 Mar 2026 11:20:55 +0200
Message-Id: <20260331-fpc202-leds-v3-0-74b173537d42@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12O0QqDIBSGXyXO9RxqS6urvcfYRepxCS1DQzaid
 58FY7S78/3wfZwFIgaHEdpigYDJRefHDOWpAN134wOJM5mBUy4o44LYSeebDGgiqUqDVmiUFUP
 IxhTQutdeu90z9y7OPrz3eGLb+u3IQycxQgkqQ7VVjW06dlXez4Mbz9o/YSsl/rP53xeJZ1tpe
 akrWYsG6dFe1/UDe2QPcOYAAAA=
X-Change-ID: 20260126-fpc202-leds-53def6ce751e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felix Gu <ustc.gu@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Hi everyone,

This series depends on "misc: ti_fpc202: two small fixes" by Felix Gu:

https://lore.kernel.org/all/20260221-fp202-v1-0-4d28cb8b28fb@gmail.com/

The FPC202 dual port controller features eight special-purpose ports which
are meant to drive LEDs. These support PWM and blink offloading.

This is version three of my series which adds support for these
special-purpose LED ports.

Best Regards,

Romain

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
Changes in v3:
- Described LED line unit adresses in hexadecimal instead of decimal
- Made LED "label" property optional
- Link to v2: https://lore.kernel.org/r/20260226-fpc202-leds-v2-0-bc74857869e0@bootlin.com

Changes in v2:
- Avoided selecting foreign subsystems in Kconfig
- Rebased on conflicting bugfix series
- Link to v1: https://lore.kernel.org/r/20260127-fpc202-leds-v1-0-ebd0cfb9f9a1@bootlin.com

---
Romain Gantois (3):
      misc: ti_fpc202: Depend on GPIOLIB instead of selecting it
      dt-bindings: misc: Describe FPC202 LED features
      misc: ti_fpc202: Support special-purpose GPIO lines with LED features

 .../devicetree/bindings/misc/ti,fpc202.yaml        |  21 ++
 drivers/misc/Kconfig                               |   3 +-
 drivers/misc/ti_fpc202.c                           | 339 ++++++++++++++++++++-
 3 files changed, 349 insertions(+), 14 deletions(-)
---
base-commit: f552b769213459b62c976d3b380e7e0030af1920
change-id: 20260126-fpc202-leds-53def6ce751e

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>

