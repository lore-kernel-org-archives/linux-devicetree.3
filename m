Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9713E5A10
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525055; cv=none; b=rClIHGQ0KPr8olLAdQu8h5zUjCr5oZRDCM8dSg6Gpy8JY7ON3ViUrhJqUnXu6tcBIo/8c/8pMQXQPHc+NMHBQ4ttiVj34xPmdkCAEaY6Z59Ad4A6ChiJXhL2LsyEdJuxBuvJ8s6g8Isy9lxJrPg+WPSp3+4y8RAhSz3GbNeMQ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525055; c=relaxed/simple;
	bh=PoZENPoFpelQPToGedaF1Qw1CDV54r0klXwF9Vpvzyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CgaodjNnyd6NEJmzzD+jNn/MqIhGWXmLUT9ExZLVjufxYcqUuSITSURp+lIDPh9OUSDrG2tg47g2DG82Z+XMVq5earZ1Cono/u3YniwMIQqegOiuvyQ/2kU/JiK2nW2MmL7sxd1nuxohTQ27Poiju1iDq6CeQRaUQfr14DLKKW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=VJIW+hB1; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="VJIW+hB1"
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260615120357abb87f5965000207d9
        for <devicetree@vger.kernel.org>;
        Mon, 15 Jun 2026 14:03:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=lCOoc1nkAj9LM105Jbsd+SDj6HDskDfhiImH70CCtpM=;
 b=VJIW+hB1r1v2BVNgjuHpz6m0c3XuTFAuC/jxb2JCOs91V5KqN1/rIudfcyLJzmwMVZcyu3
 k4kYp6CZ1PwOIxG8TelhNFFt1GTde3wxRMv4THGZFLSHEZPVkh9//BGZYZEJC8VNJAIP6Nwf
 2UXdbonCtfumlbbYGnB9IGuA0Q3MU7iDYLL0bM1BwnLn7HZkhBsLlmKC1fg9QaSxtWhcz8lx
 S37v3jWBHhxulH3QQHqvux22KJSG5S5EokxDK3y2mDzJ1CVmuLXKEi+beE4JKcnLLynlU0IE
 STyI2qoMO+ZTrxK7VvWSSCMZ1mgkLnIetYx98tLDOYi2spHtQ8KPIelQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 0/3] Convert LP8864 LED driver to backlight class
Date: Mon, 15 Jun 2026 14:03:46 +0200
Message-ID: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

This series converts the TI LP8864/LP8866 driver from a pure LED class
driver to a backlight class driver, while preserving backward-compatible
LED class device registration.

The motivation is a use case on a hot-pluggable segment of an I2C bus.
The generic led-backlight driver (drivers/video/backlight/led_bl.c) is
a platform driver and thus inherently non-hotpluggable -- it cannot react
to dynamic appearance/disappearance of the underlying I2C device. By
making the LP8864 driver directly register a backlight class device, it
becomes a self-contained I2C driver that properly supports hot-plug/unplug
events without depending on a separate platform device for backlight
functionality.

The LED class device registration is retained for backward compatibility:
if the "led" child node is present in the device-tree, an LED class device
is registered in addition to the backlight device.

No in-tree device-trees reference this driver, so there is no mainline
impact. Out-of-tree users who previously relied on the LP8864 as a backend
for the generic led-backlight platform driver will notice a backlight class
device appearing directly.

Alexander Sverdlin (3):
  dt-bindings: backlight: ti,lp8864: Add backlight class properties
  leds: lp8864: Rename struct lp8864_led and local variables
  backlight: lp8864: Convert from LED to backlight class driver

 .../bindings/leds/backlight/ti,lp8864.yaml    |  16 +-
 MAINTAINERS                                   |   2 +-
 drivers/leds/Kconfig                          |  12 --
 drivers/leds/Makefile                         |   1 -
 drivers/video/backlight/Kconfig               |  15 ++
 drivers/video/backlight/Makefile              |   1 +
 .../backlight/lp8864_bl.c}                    | 169 ++++++++++++------
 7 files changed, 147 insertions(+), 69 deletions(-)
 rename drivers/{leds/leds-lp8864.c => video/backlight/lp8864_bl.c} (55%)

-- 
2.54.0

