Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CD37BE64
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 21:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779311780; cv=none; b=qCmFliYeay+Yk6lCyY0F5G9Kr05125mAU7LeuAYY3Xipkuelpw/J69bdKfCHqqa6PuErMysFBmq5ePtJcebxxTRpDWbqqxdXhu9MXT5aSx9Li4z8BbwV/pvqgwTr9FSVNV83i6U3THCPHOeNdeISbkQJVakTPgLu6MiQY5WKBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779311780; c=relaxed/simple;
	bh=0hGJnx414ks6nwUw3oxfPjsYYqV/oA3I0VbN9pkikWo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XRCD0L9TNcsoYzhsKJHrWN3+ZUs/eX3fQWQKQfMd18McCcHpQk385Q/akvRL8Dk1qY9Zci1j7bDC+OXZSe+06jTamzwkyOWAWtI0QDPMsysigLFvp5HV0J/+sUmAYDWZ9WfpFs28HZLPM/d2xIxo1eLDtkPXh2pYRMFW/TU7jHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPX/JdKh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPX/JdKh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso35056695e9.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779311776; x=1779916576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dcUtSR108Lq4T327TKANKyIxx6spqSLMjxTKPOxiruw=;
        b=WPX/JdKhe+zHBsPDO1hl4CXEhpRzjzMuDJIWCNTqgN3LsQMeUr+GhExLbtg1UPWRPA
         HC6Dg0bKR3de7AgXgVkLNlvzNHMI94J/FVqBiSvyiVvtfzfgyBSf0XAT9DP9poC+Y0Ru
         KLNwvepuO/mqCVXc7OzvelEOvwOGUyzYjTmQ2qmAMn55JhsjerV+BaYJRifrmIu0rSIF
         pK2gogro82w9uujZGUgn7hDCYivsppb4+ZoCF9ypBSR+Lt9zIEnkoACJu1CtzcJVWtG5
         Euy/PyxzLsUVZPCEMizwEaLHF5CEl2zOaw0lqFGK3HyQq2YMA/vFqv6AZ1liWxc534n6
         BqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779311776; x=1779916576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcUtSR108Lq4T327TKANKyIxx6spqSLMjxTKPOxiruw=;
        b=f3l54k8zqgiFjXFU+R1phdSSaylOdeDxxK0RVua8DC1rm1uqVeShV6Zt0nSkNGL52c
         5Q9vgElezejy36T2BhP7Yx8i2Fxzw/eukszf4Bw3Nj5xAgiQJEsCr67+5iTGw/+3AhBU
         GFyhgzs+OktgmRzAaTWfBFi/pWw/Mte/M8uFjMjM1dol0G7vxsMff1FviwlqCxdmB+6A
         J06LW1j6Wyl8D3R909FmwM+l5SzDdoJpIpnE+6kXGLgrKufdu08F6qOgu06OiP9P0+cL
         9coJgblGwBKPkSiBWngJgZIkX2Dm2z+GtGBLcc5ELwevQqBNE6Hy1WpxJUMAVf9R2yce
         6LkA==
X-Forwarded-Encrypted: i=1; AFNElJ+5L52CXjlIMDPXHKHUZSWLQR2G6jRxPqTWRJe/eo2XEUgHwH1FVu8+fc24alhjkOa+mJxBl3d/R4M3@vger.kernel.org
X-Gm-Message-State: AOJu0YxPG+uuSwJkpaqd4hWR2H3BLCa8Gto5Xx9/1TqACyyfOJgwFjrl
	3unQJO6tGjxfkR+odXvG5JMz4EVSLJDSP2a010cXgAz5ABoA5WYKTqid
X-Gm-Gg: Acq92OGwMJED3VqUH74ULElK2DeZTkgzrp6jwHAT02ze23SNqovrZkRFayC4sdOHy5C
	1YRvxdFi17C09OXvUVH1HgFwD5WakbRkUtSmwi6p5QeGq8ipZTXvz0TMsbJ1I/LFO+PaWs8El1F
	Dcc/RbEQA0UGcOfgY/8uat4apr9e1A0Bvp6KUpcfo506KnhvZrdA9Vad2UdUhtIZjPEUbix6glE
	5RRXzFXwY0JVvtJoCa9bOteyVE/kr1jKPqjdsVk3cELh6GFk8aSjcuGU/AAcNR0b5zfDs00A4FG
	cmE/dKSZfVDANhBnMyywjX8eEhR8Ybnl3dnoFdMrrnWGnOXEzRb9I3LV8+O3l8Nr868GTzieqmh
	tl101TAxkAH1rZ3k/3N2Sg6I3MzG2O4YUOECEh2jVYYrjVhnA+f7FTp14v2VsF6UINcxJ0SmfIR
	ExCFZUa87i8VR8KOHygZEFdvwgerASem6A0bVOvo8ULnaZ3zIldInyUORAo2whwwt0kzX71WRoP
	xpDF7uM05fDSsoEkE74SYDHV6aPRSoAEzqqvRIfZCxFLXzfVk6mCrgsVBbDmvFgVf2cO48kMgV/
	s7ceWgIoM+jMkQTThMfMXhUuXAbajpH/ea6ue41sNjQowEJCPjDBv4AH1KV6MVnG6nSCpS1pTMB
	2X0w=
X-Received: by 2002:a05:600c:4241:b0:48e:62ec:f264 with SMTP id 5b1f17b1804b1-4903607cfe5mr185055e9.17.1779311776373;
        Wed, 20 May 2026 14:16:16 -0700 (PDT)
Received: from systembl0wer.localdomain (ip-86-49-246-187.bb.vodafone.cz. [86.49.246.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d5987esm16499845e9.12.2026.05.20.14.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 14:16:16 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2 0/2] iio: light: veml3328: add support for new sensor
Date: Wed, 20 May 2026 23:15:36 +0200
Message-Id: <20260520-veml3328-v2-0-a57f0d9e28d4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHgkDmoC/02NwQ6DIBAFf8XsuTQCSrSn/kfjQXTRbUQasKSN8
 d8reulxknnzVgjoCQPcshU8Rgrk5h3EJYNubOcBGfU7g8iFyguhWEQ7SSkqVmpTS1OVvK4Qdv3
 l0dDnSD2ak8NbP7Fb0j4ZI4XF+e/xFXnyzmzJ/7KRs5zxvtBKSRQG5X2wLU3Xzllotm37Abp57
 k2yAAAA
X-Change-ID: 20260426-veml3328-5bf93f85198e
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Rishi Gupta <gupt21@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779311774; l=2391;
 i=joshua.crofts1@gmail.com; s=20260516; h=from:subject:message-id;
 bh=0hGJnx414ks6nwUw3oxfPjsYYqV/oA3I0VbN9pkikWo=;
 b=PiK9S0oEzLkuJxezuyGzXIeitPCmUxAnDGkPQMn5NaPprIrMFuiMC8MHq9WAFMBUfxhu5j9z3
 PPb/KlqkkP1Atv6lo2tqm9JE2pkTRUrBzvbGvZZUCWy5aq9pPLMY2yo
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=d2X8EVKEB2uF4AaPPi3iSSI+IJF3/9kOoDYVVmc+G1o=

This patch series adds support for the Vishay VEML3328 RGBCIR light
sensor. The sensor communicates via I2C (SMBus compatible) and provides
5 types of 16-bit measurements: red, green, blue, clear and infrared.

Reasons for adding a new driver:
- Existing Vishay drivers in the kernel do not cover sensors that
  handle RGBC and IR simultaneously.
- The register map and configuration differ from other Vishay light
  sensors currently supported by IIO.

Testing:
- Tested on a Raspberry Pi 4 using a VEML3328 breakout board.

Datasheet:
https://www.vishay.com/docs/84968/veml3328.pdf

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v2:
- Add additional IIO_LIGHT channel for ambient light sensing
- Remove separate dt binding file and added veml3328 entry to veml6030
  yaml
- Move driver to PM_RUNTIME_ACQUIRE_AUTOSUSPEND() macro
- Add missing headers
- Remov redundant mutex as regmap handles it itself
- Use regmap_set/clear_bits() instead of regmap_update_bits()
- Removed redundant dev pointer
- Edit commit messages
- Various code style cleanups
- Link to v1: https://patch.msgid.link/20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com

To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rishi Gupta <gupt21@gmail.com>
Cc: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Joshua Crofts (2):
      dt-bindings: iio: light: veml6030: add veml3328
      iio: light: veml3328: add support for new device

 .../bindings/iio/light/vishay,veml6030.yaml        |   5 +-
 MAINTAINERS                                        |   5 +
 drivers/iio/light/Kconfig                          |  11 +
 drivers/iio/light/Makefile                         |   1 +
 drivers/iio/light/veml3328.c                       | 416 +++++++++++++++++++++
 5 files changed, 437 insertions(+), 1 deletion(-)
---
base-commit: 74d173f29572951629d1e0b7456b424006e51b87
change-id: 20260426-veml3328-5bf93f85198e

Best regards,
--  
Joshua Crofts <joshua.crofts1@gmail.com>

