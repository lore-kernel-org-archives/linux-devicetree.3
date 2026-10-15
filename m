Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FEC47141E
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062561; cv=none; b=tB2XMB9dkopDQn4o71ymXC2IBeZG3NNkQIQQRFw1G3S2AbqgsKJWVjhyCP1DXXAXB7WPNrrpCxjvudls/XoGR8i8NsaEErCDEwssUTqztcd5Fb2zUpTVJnwYl34vG0k4KqPsDc8NGrL5SLwp5Pku7OvCHhuDBu4SKu7UBhsRGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062561; c=relaxed/simple;
	bh=ojpgcjY1pwWuuRpPbKmm8hQFRw/Oh6diiheiXbsQrJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgQi7i6qtQlHL9SppeX47PNntDD4t7stbDe1kvWE1iMJxWO14JOrqEqsvPQf4/+4EBFFCL8tlzAVoilQfCpOiIEz6tCN551VQ0Fj+u53KrjwgMNQtuoPqqG3VQa9tD+YzMLdMfUKVdyYRSFYeUlT5mJ2j12PFrwbbagNouKGtoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0ri22xv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0ri22xv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db80fcdf8bso29722665ad.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062560; x=1792667360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKpSXWXA/x7f6eIFfKd0wtNKvpm5sMl+0hhmJlcgovQ=;
        b=m0ri22xv3oEFZdWtyKRs5cmI/s9ixbUeSlIbxQaVJT8+qb2C68T6zS29QU2ovh3SQ0
         +gKi9mIf9y+q8pHeOAirVJUTYcJwBy+BuIFD3LO/2GFxU7I/quD9XE0h28eD53KPPJsB
         x/Xl5Mun18ngpQt/TwEMI3w/++3m11CQfkLB33+GSA2fW/3P6UDtl3R/LIEUatS5MJOs
         xQKAQ89PdivUEVrkyNMYU2FqeP8QlX8GDhDnvgw0fwczMChxLFrJGZBjjeaPo5a5p8AE
         4ToVwYo1B6MRCObK3hHg8SMvRkyh3s62oSjeLiCrCBsp0JOCY1WPBXNrO6Zxgnmkrsm6
         WVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062560; x=1792667360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKpSXWXA/x7f6eIFfKd0wtNKvpm5sMl+0hhmJlcgovQ=;
        b=SWI2+Dt/Mn7mlijm4GaFgrDELO0ZkVAiteZ8LbplGGSXAstzAgPcdLdv0Z+UYlJ8EU
         t2hNNkfzd4oDqfl1Q3tneGxR3O8f8Zi8BaYiJM87TbH7N/PJp0wrkqwE7gbJC2xWtAVH
         94iH+5KjscJN3qHkH8uaLM3Sd6m3T0d6S7dfImUaoSCMbM6ZOI2zWTulmrYvNzspvFdl
         MkuEvRvohg055RZqGEYdkZ/X9VhYwH9WQzMocyOB3A5FKnItKZZae3750XDfOLudI1N6
         HWUIeNYeC83FMyIppZEXLZjIKkztz9fBSgNYRg4NavC6bzbZGTLcniEOY8bEnNa5Z2io
         SiFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlXFx6RIUCLzFcw1Ihl37r37tiDEGSRGQywbPMNyovSOlt5uEO74dzFKo8QQIws2Op++CBLVm05E+i@vger.kernel.org
X-Gm-Message-State: AFq9FYImbSztV3wIXbGxY9vXyxs3NJI+hrnNQN8g7vMNlcnAcxJ5Nrcg
	YdpSm5pzv+zuMbytJPetFx3P3tyxsWTj+w5Fh4S9ljU3YFG4o6PstEEk
X-Gm-Gg: AYBFou2BEglCKQSjrHz/8AvQToYbah3O1MxH48RRKxw20Z4PLLl7zppqQhcOeeGNHAQ
	F/e7p5kpNPtoulD6+DhkKRk5dW257oygQWfR3RlxrpZ+47qmDhPzcLis7EMrXnhPJZmBWOX4P2r
	YtUWmxI72wFzs4wxXqMSnyHkbdud9HYSK5TitxKOmQ8ib7Fxc8LtKxqU0PV0SiCeGM/LzQKn19H
	1UPIashuw2iU7Yt2o5OUGH1m6sMhYNNsOb8yMfYPeS9XIIL10uxrBuHF3b09o7fRaL2AUydRm2X
	1KEE0lydAol7L58gJCBmF4fjPb0yVSKdwud2uMcKp5u6EgomAZ8ywzL7vFpQp5a0scWMW2pRwlZ
	Ytg17kTQN9U7Ro5txld29bRbLwJDuhDxDEOC95IHxx0mfOr6dTmXwdpGKcrYauPs+/nLiGaoakP
	opnNGsTHh7nWgKT4ZeNt+v7DrB4QtmbOLgcv69+Wwv7MRkRE+osuW0VVUyo7rVoYmeAddPJg3Z1
	uKM8A==
X-Received: by 2002:a17:902:f786:b0:2e1:2439:57c3 with SMTP id d9443c01a7336-2e842ab7910mr155601255ad.44.1792062559998;
        Thu, 15 Oct 2026 04:09:19 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e93f1d1ea6sm17881585ad.8.2026.10.15.04.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:09:19 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v4 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Thu, 15 Oct 2026 06:08:57 -0500
Message-ID: <20261015110859.203989-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014135251.11234-1-wyibo6109@gmail.com>
References: <20261014135251.11234-1-wyibo6109@gmail.com>
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

Yibo Wang (2):
  dt-bindings: input: add OnePlus pogo-pin keyboard
  Input: add OnePlus/OPPO Pad pogo-pin keyboard serdev driver

 MAINTAINERS                                   |    7 +
 .../bindings/input/oneplus,pogo-keyboard.yaml |   73 +
 drivers/input/keyboard/Kconfig                |   13 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1263 +++++++++++++++++
 5 files changed, 1357 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
 create mode 100644 drivers/input/keyboard/oneplus-pogo-kbd.c

-- 
2.53.0

