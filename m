Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B27B179A3
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 02:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777860854; cv=none; b=cn4txKvYnhlY5lD6g+3hshbvkMcb5QRuGlY2YNxFuxUal4BS9apV2IPl7CHEBzYeRX2wS3yz44teqikDm4XS/7skjgqmS2IdPPXHJF8bm4sXsA5j9TG2QqtY1sKXTF20Z6WK58+sHYk+hEvjMg1NAqKJS5h/gFP5EVkcsHhnoJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777860854; c=relaxed/simple;
	bh=D/X8aO33uxsph/wF+tkGQ95Ammm9mqqNhHB81sh8Xgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwLNUaHJyx/LazK3n5VqQvHITlmlsPoC/MugrNVv85O2whzUsGxeEUc9STjtGA6gqnPitaUBip7amLQ9YkbZyahNHjbKv8/kONYd7I0J5cMBnQq9Vx8VbkDAI16qU3s+FoF5DJNX3EzTCXx8ADdRNur2u5MRAMGNllOnj+qZC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NF5dlsJp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NF5dlsJp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-364d13df3ccso521341a91.3
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 19:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777860852; x=1778465652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aGMILBpdA7Z2vP2ImAoYwoEz5ssc9d51Wzjj0viQYI=;
        b=NF5dlsJp+YwawpYWnUlebYcr8dIYW0slo8ldtYGoh5KUpi017N1ssUcvXHVkm2J6VS
         lSMt9nzqQgCUioeMM2eQW5YGqnUW5Wgbw6KdaLUWqG5fzTAT+4f4Gb4Ow0bMwMgPt9PQ
         CTXfHzQ3WLNFnZXrKR+0mwpX1S+/f+H1ANbDfaSWqLYhbW04U/SgVZUTO7vVnW6qeCLY
         x9nMeD02v4Wmwcw7Oa8mOYcJsKA80zxAklFE1iOyKzvcK8/C3RmOmi7YK5Lc34qMrAUK
         oPQcjuZWG6FHMVb0/9BbOSSrhL9+78nJVMaPl7qihz6npKDBrNS7Q6w+nTBMuOnHw0Ny
         BT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777860852; x=1778465652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aGMILBpdA7Z2vP2ImAoYwoEz5ssc9d51Wzjj0viQYI=;
        b=L3WLUkCFYHp321etz5209WahZp5zR46kAGtdkau0+HnJ0fuezZorxG/dGAQEWuASqk
         C5z7nqpNPg1SsNy4rn4oBk4c+bv6Rz5e6Pwc+dM6iAokHlzyP7XzCEq2TASqJfSR2lUQ
         nQby9ULkxckIuKdpScaQw4/9oJcI+FVf+DZJZ1gR7nYDwTg2vG0iKOaqnkChcTzxaF2j
         Cyt0IXyjRaQaKL2UKnLDBTvG43Q93n/okZKGGgCc7u1GavTKn8mFR4ic4S6+SbyQ61AT
         lYks2sKKEYvZvvm318h6K3GUIonDs3rWXQYCHzyfHPjLYl+CoC0RGO/6dpfQ88PUWbRO
         jGqA==
X-Gm-Message-State: AOJu0Yy9mvg20480WKBXXG6rzctuOl7vwWSxSB/MHeHJZ9hmKZGLVght
	1oBptZEUYrzbNXCpUUVklJl0csj5Mzky042jwIHSVX+0pIriNogO/PpcsCvtot5h
X-Gm-Gg: AeBDievJBZfq10W+lkXD5dKwTLuV9qzlbLX1P4HOOeDK/W253ItPOIvi1j/boA57POo
	6o08ndVT1x/O5BcUgSKh5o8+Arft+G0FixKkoz/UTOoWFC0HtY62hLoDDBG8rVSl3qMrRkCQUAY
	mwW4f0iVB+loyy2zhE5p3uBtaNcgRyqtGMQURsmJoLP4/+SLFRw+QM4FQoCpuzYRgDoIfVUqEi5
	KFa70dQzsCReJZ2n/VeENyHNuGSefxhDSuvfe0sV7zWTj6D+nOJDBOLlMUJIRMv5QzUYuFW90kC
	3xpqQCNczNserNdBcIhsWtm6VSmgk9YXMencwjNcKq5vf9zLt/jqtKhsh+FydqhNvTpj3azU3Ym
	vr5mc5Xgzy2AYRE8RpEy/Bfe3JQRJZfMQ9FAN6O6eePknm779xKzsQsBUv9qu1OVAyZvXbWnuD+
	Ub/53EzlnNRpFC46yk1xOsJwa0c3U5ZX7j7FN020FBkhU=
X-Received: by 2002:a17:90b:2b45:b0:364:6f0d:c0fc with SMTP id 98e67ed59e1d1-3650ce8437bmr4116823a91.7.1777860852258;
        Sun, 03 May 2026 19:14:12 -0700 (PDT)
Received: from marchy ([2405:3800:95f:677d:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm9365566a91.2.2026.05.03.19.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 19:14:11 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	Adam Azuddin <azuddinadam@gmail.com>
Subject: [RFC PATCH v1 0/2] Migrate RAiO RA8875 from fbtft to DRM
Date: Mon,  4 May 2026 10:13:49 +0800
Message-ID: <20260504021355.72128-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

