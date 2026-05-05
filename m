Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B9426D2A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984064; cv=none; b=o19ynQXrb3spNefm0RrQ/wMsEZRojVH+ybX7x9Xv4dP593lXj3lNevWW0z7Bp5W4ZBNpws+Xn0r/h/TCxdN0ZNJBM9lAZRTcrexLN3uSjS6+cV0FJyWA3ZQX5i8/vPT03NfnWvRJzerL1e8Ty9pgfueZNWkbh8qX1AqNyGrxi9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984064; c=relaxed/simple;
	bh=TcjxIvutvevB74eNkxChY6boBUl3W0xRM40RkukRMNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f1+vZl3tS6Pe7/MikBOtouKfvRRUHhvMzmTBPPiPT3WjOh6KGwoHBJGTMGP4GLNyGkHdSWS+9dOwAKsUKwoSUq4Qdyvcu+4lBw5pWx+wSFmgZquy1niTqEKiNPz1ha8ZzLkO795jX8vbJDyMTFT1PLPTZNLamrC1ya2BHCb8ArU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAtoFDt6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAtoFDt6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2aae4d2d215so3367005ad.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984063; x=1778588863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VkB9fZzeXBdMOAv5MDDWZl0j3iCw0olbI+cJ31NwW94=;
        b=lAtoFDt6rnTDs2CTx25nzfuq+DQtRc74Tp9yfG4BFhPOYLqgWdVRRSCffpZNwaPdqK
         ipyZIZDhGq0FTShso44/PKpmksLUr3SQF3350r4H4fyFiBlpFC2k7jMheGu3dp9iEBAk
         BvYlJOmc8ZexobsWJJyg94nKjOYhINjJNLK7G1jt12ZfEFNUrb3UFct/5tgAdOPVT930
         GYZPkvFLjgXBve/7MgzsbHM/mGVpKm3ReP9awmloEDtVJfOYkJKwNZWohMAVmn69MHxY
         um7omQnAdVSDevaDKBNjiIPfFXSUIT/6/WszYYRiuRUGtGou62G1usmHyLRj+W/r3kjU
         peqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984063; x=1778588863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkB9fZzeXBdMOAv5MDDWZl0j3iCw0olbI+cJ31NwW94=;
        b=K1phzYReA4eEdHHoK+EvAJr0K9q4m2qtxSQqrmwZz70KPX34BzjX0IDecPUAwIeWfo
         hz9ZijwdvICVmQI8gF6yDhDjenGIPxcvxNZw5ajDUDPQBOzs1rhEJiG3WqTSGB/pp67+
         6WeaoqdI2MFqZVcJA72qXFckq09bEQAbiRN0LpBrpPT1HO7LxLXXSm9OIDYP38ln3bF6
         PQDO23XKfcpvi8jzO1oARh6ta8okVoX8eHxXem+oHxUikaxkve4Mb2VBNUC72Vh7aS4e
         o7QqWCSuYhVPc6BsiqjuxxfpLS7xvcqgZdeUGL5ljoNyeuRxs3P6GmEQbU4XLUZDPio1
         pV4Q==
X-Gm-Message-State: AOJu0YyDe3tziCzscR5EEsqVhEUi8PzbzX+Gf+NHFIFtSeaPRYr051RT
	+7X8idYvZvz+/HC6gYoETRQ51sVoy7vrzVxegMqZCOwK7I8EXqmhwDAOWyyT+g==
X-Gm-Gg: AeBDiesvRgZgq6opxHBe+JGFpsYjVk7Z1LMtDns7L534MzVhIYTtV5aKh9scNpJFRJ8
	MQQE0a4mzH04RhWnsutb8yQmFJ+Z3geW5cFE80MnKNbyhzAdZDoWdGZj2FoGxhkTXCsHdxxbSeT
	5hcP7jm2EwlHtJKZ5RvaAk6IoDeYEoz0d8F0u+cJQCI1SKJ9PEp2glndFCz/gJMlXJ0aa9wJBLn
	N/KSZNtKuWoWfBWqvLksWWdDjwPA1X/cbY8ouJcUbrRbLsgUQV8JWvUc8FOyWuV7WrPG90gX+5g
	uvQt6HL7saUnEspskSEJggOqZ2yqWCWMbsoVbQ6s6FimqBdu82zXZgYdWwdbzt8tVGU5VJErfOI
	aZLgI87VhRffb2hJRggeCqeKaMVYxF6GjsXI9QFCVsSORfHA/5mntZtzKOQ26n80odaUUvXWW7L
	uwgV01lgWdq5bulvcpuvdjZ4iD/dJDHpV5
X-Received: by 2002:a17:903:3545:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b9f283fc3bmr67457505ad.7.1777984062612;
        Tue, 05 May 2026 05:27:42 -0700 (PDT)
Received: from marchy ([2405:3800:88c:d085:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caab231dsm139811825ad.26.2026.05.05.05.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:27:42 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	Adam Azuddin <azuddinadam@gmail.com>
Subject: [RFC PATCH v1 0/2] Migrate RAiO RA8875 from fbtft to DRM
Date: Tue,  5 May 2026 20:26:28 +0800
Message-ID: <20260505122636.11859-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a resend — the original submission on Monday did not go through
as I was not yet subscribed to the list.

This RFC migrates the old fbtft fb_ra8875 (drivers/staging/fbtft/)
to a proper DRM/KMS driver. The RA8875 has a 2D Block Transfer Engine (BTE),
a touch controller, and PWM backlight control. This driver currently
implements only basic display pipe, with BTE and other subsystems as
planned follow-up work.

This driver does not use drm_mipi_dbi. The RA8875 SPI protocol is
structurally incompatible with both Type C options drm_mipi_dbi supports.
Type C1 encodes command/data as a 9th bit within a 9-bit SPI word. The
RA8875 uses a full prefix byte (0x80 = command write, 0x00 = data write,
0x40 = data read, 0xC0 = status read) sent as a separate 8-bit transaction.
These are not the same thing and cannot be mapped to each other.

Type C3 models two transfer types via a D/CX GPIO. The RA8875 has four
transfer cycle types and no D/CX pin. More critically, the GRAM write path
is stateful: an MRWC register-address transaction followed by a streaming
pixel pump under a single CS assertion. There is no way to express this
through the dbi->command() dispatch model without either abusing the
abstraction or reimplementing the transfer layer underneath it anyway.

Other than that, forcing DBI would actively obstruct the BTE
implementation, which requires direct control of the SPI bus at the
transaction level. A direct SPI implementation keeps this path clean.
Any feedback on these would be valuable.

Tested on Raspberry Pi 3B, 5" 800x480 display, kernel 7.0.0-rc3.

Currently placed in drm/tiny for review purposes. The intention is to move
to drivers/gpu/drm/ra8875/ in v2 to accommodate future BTE plane support
and the touch input subsystem on the same SPI device node.

Known limitation: at 25MHz SPI, full-screen throughput for 800x480 RGB565
is physically capped at ~4-5fps. The driver mitigates this with damage
tracking so only dirty regions are transferred. Full-screen animation and
video are not achievable over SPI at this resolution and are not intended
use cases for this hardware.

Some questions:

1. Register writes are currently capped at 1MHz. The datasheet allows
   higher but some boards have signal integrity issues. Should this be
   a DT property or is 1MHz a reasonable default?

2. PLL initialization hardcodes a 20MHz crystal assumption
   (PLLC1=0x0B, PLLC2=0x02). Should this be derived from a clock
   subsystem node or a DT property?

3. Currently using display-timings in the DT binding with
   of_get_videomode(OF_USE_NATIVE_MODE) in the driver. Should this
   use panel-timings instead, or is display-timings the correct
   choice for a controller-level binding like this?

4. Given planned BTE support as a DRM plane, is drm_simple_display_pipe
   the right foundation or should this be a full drm_driver from the
   start? Happy to restructure in v2 if consensus is to go full split now.

Future work: PWM backlight via DRM backlight interface, BTE as a DRM plane
or through drm_rect operations, touchscreen via input subsystem.


Adam Azuddin (2):
  dt-bindings: display: panel: Add RAiO RA8875 display controller
  drm/tiny: Add RAiO RA8875 display controller driver

 .../bindings/display/panel/raio,ra8875.yaml   |  76 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  14 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 681 ++++++++++++++++++
 6 files changed, 780 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.54.0

