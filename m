Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF941D4E7
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443979; cv=none; b=HbGSXJULGSCkrK4gV6yyDoRRyztTYp+GA+zfeo6s4E3N/na0Z6sI0BEtm3XvUYlop4YTOPj26hyGYhMMm+p1k0ZwJTjsqku0hCYUqEEWVDulJ71rMUAHEpi95A5uWZvZvk9h3jhhWGvDDJ17YlnRaic2kZ+L2nsiycSus5iNKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443979; c=relaxed/simple;
	bh=XjcantRHqujraCkoG10YtUTCxsHNyNT9YOjAxukf+cw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kAqWLxfjhgS8iCF0QIJoet+Jx6JKSK5rItbaX3CS2cceTnZohgahLJHVz10F5ZpQCxhzv6MVdDZ1gwpSoHQD18JYJCNXt/GYoliRbeJn6snDH2XsB8EGXzgzJYlycOcZGaVy7ztWKo4PkR06+bEUjmzKFd8GP3Zh149spt65cZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=aZNIuQ5f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aZNIuQ5f"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso19446025e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443975; x=1784048775; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5en/aJUKwFqffgmyTdsB0nU4jEKYPOBxxBLBV03iHyI=;
        b=aZNIuQ5fqgUVWN6SIdfAaCXbdGVXMajNBgKCe7Ko6zbcbY8ZwphSBSZf72bVT49lPw
         XWMx4gRKAozzYKwmmdGRZrasbhHiSdNQ7U6fpCUugLe36GWuW3+2Z4uZ7QvRUUA9+Orc
         MFVVNfe6gXNT8NABmUxVql1O9xb5TmNEfQkQCvlJawDj4+ibjtM7ey3Nz7mkCDyniyEa
         pH3FN+5RNOyCEhY2KMkRmvnVSWZ309+PXwjhU4J08FrnXft8IgImu7KVXVmFDiDEaGCt
         f+s/N6+BhUHwxbqWQ0bnRaq5jOogrQ5TIGDGbYIxYHEjSnICZMsCafF2E/LIBoIhPOHC
         5IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443975; x=1784048775;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5en/aJUKwFqffgmyTdsB0nU4jEKYPOBxxBLBV03iHyI=;
        b=ZapQ8MNraJwEfpzAlpZBd/HMP8IHtl8E9z0koaWT7X1eG+p/G3U8/oUWwLAknAOlgZ
         ib23+IsjP7yAaqPI9IKXOfOWiYnadB98OVsei+vwwlMheYMvkRTIyC9Wng45RgVvRy9T
         5cLAS1h8MvECl3+TW9Y+3J/jJEScC5vMdgFAFl7yyZXdhBFDCOqVIXXUcrBAMptxw3Qr
         g8oN5Ei14BwyfrBTS4YYLMLx+Ocj8Le3sQEJbnsJA9uRUMnfDqkI4Mv6qoqv1sKiosO8
         0/wH/TTKXu60J5r366GWYpaacmM6p2o4q7OeT7LAuGv46MndqMG0A9tyvvjXEWlYEc7W
         gUKA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7/56C9MjvjJ3EZwa6vxr0RIpqbbBucwXmr5naezMUPcPHF0CYHNUcfX9LEJ88COpcNg9mw90DySyr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw46elf6cYUfqRCJg8tCPbktjEsOvIBtnIuCxdFoWXn+ExVoybj
	UD7WSZpS6chDW8gkdLA6MdMbN7cq5SCsLzIW8bLpBqovhp3FVFaSSQ/ZH1yP5rKPKn4=
X-Gm-Gg: AfdE7cnwu35SFpCIYh9GNjbuWcZp5EEJQXE3whE9XvGO6r8PrQ6S2RcpCDBqQPfJiPP
	AFfVuNoHmVSnFxAPGM2susd744LiKQ1nf7/RaY/SQosUf36L8cXN5jY1kVwI2RJ5McwxysIjo/+
	fsKEinKHix6PVok2UdvF3nJ2CtLUNdbnUzDYBYBbexb3vegr/VBWSIaBB++1aH7YvNfeLVkDqba
	jl7Sv/UrkWQG4XMQd4HG2jqISKps9wQZlH0qusiBWEo+kzejSgbXDwzOll/x6/X9Cpc08J7KJTK
	r+ywDk3/b0P0wFw2Y6y1bCSP6NO8IPMN2kcUfZdBLMxzxPIeTaO1DGrGQStlpdeZgnH486qI1Ie
	IpFS8uG9BQJr8txBFfwq4CvwO/oOijZ+CKhYPyXbtsGSrOHIAVKLSnt+1SJ7++7/aUaPFg3nM3j
	WqkenRVY2jb6vimbErhFAVdVuay/TE8jdCsADplNE00rqrm3JDQKfsqwiSYhBcOpkP
X-Received: by 2002:a05:600c:46d1:b0:493:e451:fb8 with SMTP id 5b1f17b1804b1-493e4510fbcmr21750135e9.21.1783443974589;
        Tue, 07 Jul 2026 10:06:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/20] media/imx355: General code cleanups, and adding
 support for 2 lane operation
Date: Tue, 07 Jul 2026 18:04:32 +0100
Message-Id: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKExTWoC/22OOw7CMBBEr4K2xmgde82n4h6Iwo43sEVIsENEF
 OXumNBSvpHmzcyQOQlnOG1mSDxKlu5RoNpuoL77x42VxMJQYeWQ0KmWo3gl7dsQKW+wocAmcvR
 QKn3iRt6r7nL9ceLnq1iHXwjBZ1Z117YylBWyjT06Y5m183uj9d7GyrOxoSYMkRpLXGL4uu6Sh
 y5N69NRr7L/p0atUDmH7kBo0BKdk8994JSmXnZlG67LsnwAGzJI9foAAAA=
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

This series came about as we had a customer ask about using imx355,
so I had a look at what was going on.

There was significant duplication between the various mode register lists,
unused parameters around, and no support for advertising the crop
rectangles through get_selection. It also wasn't using V4L2_CCI so
had all the boilerplate for writing registers.
The customer also wanted to run the sensor over only 2 CSI2 data lanes
which required some rework of the clock setup so that the MIPI link
frequency could be run at 445MHz instead of the 360MHz used for 4 lane
mode.

V2 has some fairly substantial differences to V1 as I obtained a datasheet.
Whilst some things worked perfectly, the datasheet declared them as
prohibited. This was largely using dual PLL mode in 2 lane mode, and
LLP is restricted to specific values. Link frequencies are therefore now
derived from the PLL configuration, and pixel rate is computed from that.

Being able to refer against the datasheet, I've pulled an updated version
of David Heidelberg's patch for 24MHz clock support into this series.

I've tried to keep it that the earlier patches are largely cleanups or
minor improvements, and then we get adding 2 lane support, and converting
to using subdev state as they are larger patches.

---
Changes in v2:
- Collected Jacopo's R-b tags and implement his review comments.
- Add patches to switch to using the subdev state, clean up colorspace
  (sets RAW), use a define for the exposure offset.
- Added DT binding update to permit 2 CSI2 data lanes.
- Link to v1: https://lore.kernel.org/r/20260506-media-imx355-v1-0-660685030455@raspberrypi.com

---
Dave Stevenson (19):
      dt-bindings: media: imx355: Allow 2 CSI2 data lane output
      media: imx355: Remove duplicated registers from the mode tables
      media: imx355: Remove setting FRM_LENGTH_LINES in the mode regs
      media: imx355: Programmatically set the crop parameters for each mode
      media: imx355: Set register LINE_LENGTH_PCK programmatically
      media: imx355: Set binning mode registers programmatically
      media: imx355: Remove link_freq_index from each mode as ununsed
      media: imx355: pixel_rate never changes, so don't recompute
      media: imx355: Remove redundant fll_min, and implement fixed offset
      media: imx355: Add support for get_selection
      media: imx355: Use pm_runtime autosuspend_delay
      media: imx355: Convert to new CCI register access helpers
      media: imx355: Set the colorspace in the format
      media: imx355: Define the exposure offset, and use that define
      media: imx355: Use NULL ctrl_ops for HBLANK as it is a read-only control
      media: imx355: Compute link frequency from PLL setup
      media: imx355: Support 2 lane readout
      media: imx355: Switch to using the subdev state
      media: imx355: Remove storing cur_mode in the state

David Heidelberg (1):
      media: i2c: imx355: Add support for 24 MHz external clock

 .../devicetree/bindings/media/i2c/sony,imx355.yaml |   11 +-
 drivers/media/i2c/Kconfig                          |    1 +
 drivers/media/i2c/imx355.c                         | 1515 +++++++-------------
 3 files changed, 494 insertions(+), 1033 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-media-imx355-a30f5be3deda

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

