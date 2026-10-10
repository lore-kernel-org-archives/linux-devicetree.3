Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C974A37B023
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643129; cv=none; b=EaxFrNeCuURv55dgDEqf2TG4hKi/q0Rt4iPCQslbgygVulYhdDMmYWzoXKYKfWOIcNzBdOaaWAgEfCjVbrQfjxhYcZBUwSe/EzOyBiDdxi1VlI2++qZavhuduYfmrYdl7Rz4bshzmJZEoOu6yiv0H6j9bHEH4G2Dpz/xsb4I6zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643129; c=relaxed/simple;
	bh=XIR+F21hTFTrNd71D+I8BNEbEsbcq5OR1jCOUmmpFGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omZB1mnRlDXwLQxnxpkaIZB9tkStR50guZmEdV+9ZTwytKd3dBlH1zoKpN4ZFh3m2VSZFfiyEL/eK1I0grZ0TEkV0uBA/3mFW+6JzOBuHvu+OrmscFLRP36hj1UKoba3ewYFDf9fGJp7FST0hiyJe/TeSr1dH7tJcl0v7MrFKic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F92XmAwm; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F92XmAwm"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so1749244a91.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643128; x=1792247928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4yObmjORIUS+HdWEYUQPrVnB688dbLM+egsRNt/fx4=;
        b=F92XmAwmtZn2Lh2CCa2mCJuL6bgJgXWSi68pzSJuTIiZTXQ6tHLKEtltsIxKvGIqVS
         1BSMeGF+KQpSNJFq7r0oRItJcJ7Bmpyv5HUYiFo+0bHLVGTRnpFc8T7KsdROJsuU2oJx
         FBSkmuP7a+Q0DapoXpa5PqaGTuGQ6Si3vpFS6NkNf3JMbvX4/fSdDGfjXrAZeXI6ZHG4
         57dtA7LWcCTjUP3YNRWDplzZXobQPtNthWF3PBd+oYjkKse5H7jeKT57IxE97cjc8DRw
         2MBtkLYGYKKQWaU7BgLf38F/l2w3UaQc+MJ2CkDEV9Vju3OXkzUPzr+m7VZZj8+DuYcl
         wCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643128; x=1792247928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4yObmjORIUS+HdWEYUQPrVnB688dbLM+egsRNt/fx4=;
        b=lL2DQXn8bWkU3MQPNt5HTghdbGJT83otfcnuMCQUenlkpOU4JU6RcJFqxAa/h+FDoe
         oFUQnk2cUQWRk/RcFVp1I3V2CzvMh9Eh+WG5MLLdN+7HlDzgwQg7DwrLmGvdvFhdnzQ2
         85zTkUIAugVR0p1p8Hw3UF7pEut4T6baK3XMWdtG5Ncg3xm8eXXtBQ6MZTbuce91c2/q
         pBCR7nCEZqm/cjYqC+lpwiTk8WQMkc3Un3yempzBW2K2HhZRAD7iCAoCxvjPA6wrKenx
         1E5p7DPL8tS1KpWWRX/+QUGLlCWU51jw2zzSZbysTDu+73En3XeqNZptIcNY7Qhatzng
         acLQ==
X-Forwarded-Encrypted: i=1; AKwUvByTktfITiXO3ZOab8YNpsOXLyMlDux68z7pxj6SJBLf0J0CfO7nk8dcqFX2ZgQcWxM5r8B/m5btaiRD@vger.kernel.org
X-Gm-Message-State: AFq9FYKgJILiziOTTwIVk6qpIFk7IWuHuRJI84vbGom9vN2TVyG4HerC
	gTEgldEZnJGrKRw7kl/XTIvVnd4APW0Lzyyp6W4N8DAo9TxY12X+Q9gwrfFp1hP5vFm3xA==
X-Gm-Gg: AYBFou0n//QjgsiVNRYLiXPGlwC21xG7BMmaeKuRBda4hyt2njV3Uwjg1av1PPblnl/
	/w75wnjNAv7sMgY1DsmdsO1J2znUAySJKy1GHo9dzpXnbb8lYVldmHdO3d7nrHIccam4puNeZMI
	rCA/9eGpKnCqDKQckmHFD+NqCne0pWJWjam+MH9UmSRmOKeZG0+WqYiv6ENaobZ+po9rZ457fyB
	f212XCq4pvwrkKGLEd+nMQtsu53aCKAaG1I24QuhhMDm/49w7NPy9CY6NFKouRRb/nVklaP5GCq
	VRFxtZSbh4eDBrnrf/UNPZNzFkA5iVU/MCvalJzJFSD0zxOwkPnafLubdQ0tLEGhdta8R/2V8/T
	yAqEqHeb++6SMbae5HIAmW7SCj1xKI/CUHmyTqS91w4rByWI4oks/dYhAzfaaPS4AAPcHvc/OF9
	2Vnko/DIYnzWh8HsuUU03Ei0hgr9dpvZniGZmk1S7st4jgyNASXHbCCWcfZRLLF+tzpG8A
X-Received: by 2002:a17:90a:d44d:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ab3a09d2e0mr3194676a91.0.1791643128050;
        Sat, 10 Oct 2026 07:38:48 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f2f866sm10821859a91.10.2026.10.10.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:38:47 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v2 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Sat, 10 Oct 2026 09:38:34 -0500
Message-ID: <20261010143836.173883-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009122046.551915-1-wyibo6109@gmail.com>
References: <20261009122046.551915-1-wyibo6109@gmail.com>
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

Patch 1 adds the DT binding for the "oneplus,pogo-keyboard" device,
describing the supply, TX-gate and wake GPIOs, with a MAINTAINERS entry.

Patch 2 adds the driver: keyboard matrix, touchpad, function and URL
keys, caps-lock LED, attach detection through the wake GPIO plus a
100 ms heartbeat timeout, and the keyboard backlight as a
"pogo-keyboard::kbd_backlight" LED class device so UPower and the
desktop keyboard-backlight controls drive it through the standard
interface (the level is cached while detached and restored on
re-attach).  A sysfs battery level is exported for the keyboards that
carry a battery.

Changes in v2, addressing Krzysztof Kozlowski's review of the binding:

- dropped the redundant "binding" from the dt-bindings subject;

- replaced the custom oneplus,touchpad-xy-max/-resolution properties
  with the common touchscreen properties touchscreen-size-x/y and
  touchscreen-x-mm/y-mm, parsed with touchscreen_parse_properties() in
  the driver: the MCU protocol has no way to query the touchpad
  geometry and the same MCU is shipped in keyboards with different
  touchpad matrices, so the geometry stays in DT but uses the common
  schema instead of vendor properties;

- dropped the serial wrapper node from the binding example;

- the MAINTAINERS entry added with the binding references only the
  binding file; the driver F: line is added together with the driver
  patch.

Tested on the OnePlus Pad 4 (iceland) running Linux 7.2.0-sm8850
(v7.2-based iceland tree).

Yibo Wang (2):
  dt-bindings: input: add OnePlus pogo-pin keyboard
  Input: add OnePlus/OPPO Pad pogo-pin keyboard serdev driver

 .../bindings/input/oneplus,pogo-keyboard.yaml |   66 +
 MAINTAINERS                                   |    7 +
 drivers/input/keyboard/Kconfig                |   13 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1196 +++++++++++++++++
 5 files changed, 1283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
 create mode 100644 drivers/input/keyboard/oneplus-pogo-kbd.c

-- 
2.53.0

