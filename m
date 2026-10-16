Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7C04825D4
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168754; cv=none; b=BFT89kYgi6bOVy25+uwUAnsr5e5XErINqX44Apikv4hNGnbrGMGzBV4RQnnhoABF5B2agiLDz5Cu4Gle/QCGGO35ZcqVdcTnCbFpcnD8C1ZBrNR8fGzTUN7oCSapDORnKfnblJkEPZPyo/tz/Eg5zxa3b5VbQap1XA+UIP1QPuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168754; c=relaxed/simple;
	bh=epQt/E98GTYEskX4PyjS7jICG/eZycLiTH28xa0X2N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MckgYDS+lQwme3j5aNR1NgfQK+GeAeKN5X4sweF/Agmyolo5lv2VzhuzZtSHamBZ9+BmV/HeMZOuP2aDDpPV2Bcsdh+WWnOUj00j9FRRY55rO5g2HMrfMsytsduzJNnSUHK3XuYVrS0xQXvY6ILyd8dLzeKwRAK/qOnlInbYd/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyr+cnhg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyr+cnhg"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a706146559so150218a91.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168751; x=1792773551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJWlli0kiLSD2GIUGWe0mxltnuBg0ha7PrEGOS3Fz9U=;
        b=iyr+cnhgLwHyHUrRFkiyQj+tr+cEUaBVwtZEX285zRTLOsOECmy1BydPRwr/UbPOer
         vQLW50jObhv4qCyq7EvXc+Dvz4650tLcwP6Po8wAXPrLS5Su6o5wj7eylFxH6GMSWhLP
         o3ypHl/8PCFxwhk6S1K0N4m3LxpoowgqLJJvej6dPu7cjd7ac57zZ7eZeImTd2g5NYyR
         AXwO45+kQOnFXMBcZED6GIaLQlZP1iMXe05hTASmZ2jC2yG7xWgwtf38aiM7DGmZvKZi
         OgumhdAFiNi3selojvWyskpv+rGUo/k15Kw3MkLAKhrhEMDRT6mxOCxxt1hcctIvgLi+
         /4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168751; x=1792773551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJWlli0kiLSD2GIUGWe0mxltnuBg0ha7PrEGOS3Fz9U=;
        b=SBShiplANGjEia3ZW9yOcnJ9dAebKn4pDmdacr4S6berTW9VY6fFBLR8uK7py1q40c
         NLuX4bkXn9HmvC/KdNvDZCrOz5BXuQH+msl41nWz05E1+3K++5Hd9j5c5XEZpgPnvmrw
         ml0NqM6NueIdUmb/FANPa2n8EJ7oJXUA85UT7oF8gY+HhaFiN3v/fyFlwTLOBts6Lq9F
         bo/8NwIH06yLsDOmVgvIkGbP2HCUnwaYcbwyhuNWkdMYkByAWSCz/ZEbzBldUYM+UN98
         FCwbzmNt4+ioj3JjaTIIh9g9ob52JWcKN0qboNQx5ny/BkuIfoHpfyQ2hes/6t7wjU7j
         AE9A==
X-Forwarded-Encrypted: i=1; AKwUvBy3gY+cHbZ14zDFtRkdAal+DSNE3egshTHdi0anI/mmC4IcsV84jc0M8Fa9A1+gF0RtIkCJ04t78It4@vger.kernel.org
X-Gm-Message-State: AFq9FYJx85ySq+yaZUlEX1rbQTgv43IBBQ1p1SvAXdFb4XmoiphULCA5
	l44Mq8Shhi1aVKYNuqS6+cOHoPJrRLJsY4c9tz9szRcZ8tR7te4czgKm
X-Gm-Gg: AYBFou1tjQ7O9ULNPjMgCEUH/wOKtFkHROaP+BstVEhocuGB/1xyrXZ8UdwGJxGDBXy
	NW70Vxtkyl8aS/IC3Ua3nvGGLXGUtVMy9zWTs5xmqc/FOkt+1psNyz7dy48i1zQByTECiAQjkmq
	zd1pya5lg9xDDYShmAGQyd2gOOQ6Tm2n/XvwMnQqDIOUxwkPFmEcM6vGSPPpGxJUHFny1n58SaK
	QFZxO+ZMdjWP5Sa3BinVWr6xZeI8nB2WKfXJCysiMK+bQC/b6JUGos+uiM1OXitHtFUSWQuJBAH
	hefFxz98JvHlPDRBqBV9dnVz9x0EBQuC+qjTGi4yP0WS0+pebBQ8sLymKag1kwRBSMO1lsQ5xKN
	AneI2FtkyZlT6yx+n1EpLBQMZI/kgSpF4PB3Cs3x9N4CnJfXr1cQ1Jlmk4rkxKBAMZNIaqkpGkO
	ChPphqt5ZHH4aflYK8ThYpvowiBiZiArwkf/sruK5JGSgcTvXtxs/6IthdP/zTtBvlds4=
X-Received: by 2002:a17:90a:fc48:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3acef1042aemr403629a91.10.1792168751457;
        Fri, 16 Oct 2026 09:39:11 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm4899797a91.3.2026.10.16.09.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:39:11 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v6 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Fri, 16 Oct 2026 11:38:57 -0500
Message-ID: <20261016163859.1070138-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

This series adds support for the magnetic pogo-pin smart keyboards of
the OnePlus Pad 3 Pro / Pad 4 and the OPPO Pad 5 Pro.  The keyboard is
built around a Tinno MCU attached to a tablet UART.  Both sides share a
single data wire, so the host gates its transmission onto the bus with a
PMIC GPIO for the duration of a frame, and every host frame is echoed
back on RX.

The MCU speaks a framed "one wire bus" protocol over the half-duplex
921600 8N1 UART: 8x 0x55 preamble, 0xF1, src/dst addresses, command,
length, payload, CRC16-IBM (poly 0x8005, init 0xC596), 0xFE and 4x 0xAA.
The protocol was reverse engineered from the vendor kernel driver; this
is a clean-room serdev reimplementation that replaces the downstream
platform driver, which depends on a private msm_geni_serial callback and
a user-space held tty fd.

The core protocol (framing, keys, touchpad, sync/heartbeat) has been
carried unchanged across four SoC generations of these keyboards, from
the sm8550 era to the sm8850 ones covered here; only the 0x3A general
sub-commands grew over time.  Patch 1 adds the DT binding, patch 2 the
driver.

Changes in v6:

- disclose the AI assistance in preparing the binding documentation
  with an Assisted-by trailer; no functional change.

Changes in v5, addressing Rob Herring's comments on the binding:

- dropped the block scalar from the top-level description;

- rewrapped the descriptions to stay within 75 columns;

- restored the serial parent node in the example.

Changes in v4, after Krzysztof Kozlowski's comment that the binding
describes the keyboard rather than the MCU (wording only, no functional
change):

- the binding description and the commit messages now describe the
  keyboard (built around the Tinno MCU) instead of the MCU itself, and
  spell out that a keyboard is a fixed physical device, so the touchpad
  geometry and the product names are per-compatible constants in the
  driver.

Changes in v3:

- the compatible names the tablet project the pogo port belongs to
  (oneplus,caihong- / erhai- / iceland-pogo-keyboard, the codenames
  used by the vendor trees), and the driver carries a per-project
  description in the OF match data: feature flags gate each 0x3A
  general sub-command (caihong, sm8650 era, has no wake notification
  and no backlight; erhai, sm8750 era, adds the wake notification;
  iceland, sm8850 era, adds the keyboard backlight), while the touchpad
  geometry and the per-brand product names are per-project constants -
  the wake notification is skipped and the backlight LED only
  registered where supported;

- the touchpad geometry and product names are no longer DT properties:
  they are fixed per project and live in the driver; the common
  touchscreen properties (touchscreen-size-x/y, touchscreen-x-mm/y-mm)
  remain as an optional override, parsed with
  touchscreen_parse_properties(), for the unlikely case of a variant.

Changes in v2:

- dropped the redundant "binding" from the dt-bindings subject;

- replaced the custom oneplus,touchpad-xy-max/-resolution properties
  with the common touchscreen properties;

- dropped the serial wrapper node from the binding example;

- the MAINTAINERS entry added with the binding references only the
  binding file; the driver F: line is added together with the driver
  patch.

Tested on the OnePlus Pad 4 (iceland) running Linux 7.2.0-sm8850
(v7.2-based iceland tree).

The binding documentation was prepared with the assistance of an AI
agent; the technical content was reviewed, adjusted and validated by
the author.

Assisted-by: Z.ai:GLM-5.3

Yibo Wang (2):
  dt-bindings: input: add OnePlus pogo-pin keyboard
  Input: add OnePlus/OPPO Pad pogo-pin keyboard serdev driver

 .../bindings/input/oneplus,pogo-keyboard.yaml |   76 +
 MAINTAINERS                                   |    7 +
 drivers/input/keyboard/Kconfig                |   13 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1263 +++++++++++++++++
 5 files changed, 1360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
 create mode 100644 drivers/input/keyboard/oneplus-pogo-kbd.c

-- 
2.53.0

