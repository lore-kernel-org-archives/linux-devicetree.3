Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AC44BB806
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 12:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548468; cv=none; b=RWA5n8OUsVgUFEoHnFdIpRjE1d+tsbVdsaKGnpKOFpFkUnLA5ZeHmUH96wI5B3vxn/Q5qpiKnQTT6+UGbK98uvNr063vfbeKLQEsIa5Kx1AbbcpzeEPR7Phyq1Rg//XJJomQy7q0PKJQ5e5/8isEYx3vxTCHa01tKgi9sBc9cdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548468; c=relaxed/simple;
	bh=Cl4LBCNyYjfLcA8M9pFp0MGm50fZVlfvAIPstVNB9dY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJwu9GU/Ktf9b0xVzFz8B8o2SfkMaLT0RkFF/9AWk2J/ANlkLzmxjTWztv78bdlLGYw9uMAoBQj6wI9YiahDBnVXzfVPi1ocBSGkNVkbThDhFKF+PCf5oOl1XecyB2zI+ACHH/14u6ITHcwMCI5LJI80p2WRWx5AV/PU1Y0coQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWD3R2K5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWD3R2K5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8246b13cbso11162435ad.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 05:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548460; x=1792153260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEWrIzKLR6ifRFKivyWaAxL1i189Pekuk8YqMPtRbiE=;
        b=RWD3R2K55OrXY7x3cnfUhdGFsatYiKZk1Ys85Ji/hWfRWbVNLqhgoe4zXbLjChWDPk
         Sv5WGUpsQQ/eBS4+IKwIyrPjNxFwgtm5xZ7v8sUOwfZ05VSzOLzmh5lZnCG4zGPVAGZJ
         GpYlmnT2Sn1REyzZ7+9TqlV5OaRCUCTvS4TDIiX9moSHZ9uBcXqu39lHXEHMzOdKj8sR
         VS4axbhcn50xKS00p3iWLia/CUj4xSVdS+/NTTdjCWOFE35ghk93duMeFLY7VClJ4sVx
         DIizjn0sKIoexSz6Q7esY8R2pJcJDNTiVmaT0X5VDsi1HpJeWBoD5CDTncSWAIP57hvq
         TWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548460; x=1792153260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEWrIzKLR6ifRFKivyWaAxL1i189Pekuk8YqMPtRbiE=;
        b=DIBUtkX+cndJrYWT6Vn8oeYkfEoKAQCq6fs8eUVJakOQCqDRdNKc3aSYICATXZhdeR
         7Yi24AXRHFHLN/36q7wWgDTAIjfJS7WfMxwKxc2Qg7+z4/aVOH4feuD/OvRYD/dQ9Y87
         xhni5qoC6jzMODxIzpD5ZmESID56qceLKr58jFo0ajvu54JaAJnsuJsJeyRYsWFZQKfK
         EA/Ip2mv7bW0vUmbS2ZkO4hqmTl/VaOKS00Qr2FQ8mqC2aVfQSkIwXf5o/+0daAjwQSr
         pQJSx8fz2wjDSymbZAM14NbZXHczUQnqRbFhvi0JsGdtTATAJGIBm1Hah1S7r3NkDwgg
         buXA==
X-Forwarded-Encrypted: i=1; AKwUvBxoBPJgP9qoKifkgjBddVmy966O6v5AiC2fLrrFmpQAB0qUR+AiASPOmauuACxUyl/P+3MLAib+U6A/@vger.kernel.org
X-Gm-Message-State: AFq9FYKxcz47ypZzS65hwcvuDVC5mAqsF5QryIRXHAM8+aBetkmZ0NqX
	71BAIUhKADJ15skcb1lXvd3EeNRqm9eIaZhXAiHwW7W+1jAkBGvSp27o
X-Gm-Gg: AYBFou0g9kolXvzsPkghv0EyZUPTJPcoft7FikhJlzqu+VW7SJHcSDeQzRds9my/bQM
	Xd9OGEqYils93+7l1eoI1hn2I46oMT857E0AVvqAjofxWOAZzvLAGyEwee5H9nsJXwZWGjnPVL9
	2T0vdsy3bvMHOZGbxlfL+AMmNYa+VhkQxztmQzu8H6JrRJQvElHBQR8UYm9x1mz8dblARcH7MKm
	NB5z2XRF2D4vhj4fzDY99Qb9H4mA5FUbzj2XvILOkdeNrOkdX2vSlL0603W8k24IKechx4/PFwB
	T+s6k9PR8s8hVzi3lAm2WTMBs3A6zpkxBQCrXCtAzLZcyvOGmh208ufkeOupif5cfQZtbAL+zJ1
	Q3UNtCFxm7LEqLIr4Lqc+Q3nd8haBzbEieHHb3A87BQ1cQHDqeLEihLSGNQRBHMw6JbXBEfdo4S
	9WWWSNltW/5LTICeBi7dOBvh7pjQQ6K7bddRuNtRXA4Q1D85iC8YCQ+qF0etU4fbAa22g=
X-Received: by 2002:a17:902:f683:b0:2dd:ad74:ac7f with SMTP id d9443c01a7336-2e842aafe0amr16027565ad.26.1791548459661;
        Fri, 09 Oct 2026 05:20:59 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b15f4sm7622505ad.45.2026.10.09.05.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:20:59 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Fri,  9 Oct 2026 07:20:44 -0500
Message-ID: <20261009122046.551915-1-wyibo6109@gmail.com>
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

Patch 1 adds the DT binding for the "oneplus,pogo-keyboard" device,
describing the supply, TX-gate and wake GPIOs and the touchpad geometry,
with a MAINTAINERS entry.

Patch 2 adds the driver: keyboard matrix, touchpad, function and URL
keys, caps-lock LED, attach detection through the wake GPIO plus a
100 ms heartbeat timeout, and the keyboard backlight as a
"pogo-keyboard::kbd_backlight" LED class device so UPower and the
desktop keyboard-backlight controls drive it through the standard
interface (the level is cached while detached and restored on
re-attach).  A sysfs battery level is exported for the keyboards that
carry a battery.

Tested on the OnePlus Pad 4 (iceland) running Linux 7.2.0-sm8850
(v7.2-based iceland tree).

---

 .../bindings/input/oneplus,pogo-keyboard.yaml |   81 ++
 MAINTAINERS                                   |    7 +
 drivers/input/keyboard/Kconfig                |   11 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1109 +++++++++++++++++
 5 files changed, 1209 insertions(+)

-- 
2.53.0
