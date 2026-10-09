Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00444E021
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547931; cv=none; b=lR+gzIdeJg7JAxRAMsJ5PmihFRiRjcxP02mCy4OcNKSJkkhPWjciNnhxiv3ovRflTbbGXHMzFGqqu1HPNiTghu0AxPy/Tg3X1z+bZ0Jw5ExE4IODVEMW3BYopNYYBdKJC+VoKbqRtvK1xagwSl3qDxr/0gnbcFx9YRZdE+ZTnzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547931; c=relaxed/simple;
	bh=Cl4LBCNyYjfLcA8M9pFp0MGm50fZVlfvAIPstVNB9dY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMOJHT3ioIT8mWHoGQFMWc0vj2uhTxbfixEvx8SAf18V6/3DCjHHzFwmqOdsmXxDx8g81WHKa6xfC5W8JEJQqG3hBB7nRsT39wFKVO79hurGzsEHoSGLIjoZu5CJKvFpwJ1/zXC9sBoNOdzvf85MhIDhqiWQQJVlIxyVPZFNI0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImrFpvk/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImrFpvk/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88c72646f03so3401874b3a.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 05:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547922; x=1792152722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEWrIzKLR6ifRFKivyWaAxL1i189Pekuk8YqMPtRbiE=;
        b=ImrFpvk/OQZ7GdpERaG1WU9Sxw+6apwn1pKKbhqeZ2mz+QNnHl3YJrZvkfI5xteCrn
         VKvtDLgOJYlfe5UTB7uR3PPabK65y5DhLZ/RC8D8GWPZ2pejLGLTuESFTXtS1vIx7MZk
         x2oQ7onerRrL3sN2XUYnrTh0W+tad0cByq7UW9/RiLUhTc4YkkreEo7DT4yurdJJh1CX
         t2MUHZg1Vym+EvmU28+zgHw27GgXZr3NAnZPKaUewLoH/Dz8v+AJ6+HI6P1hx6CtcwIm
         zCUncBKlY5FnXkZAndhqKNkYYSZ8rUOqlNQaiTl+R4GBmpulTU93ciYPp8dL/bI6Yh6S
         T9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547922; x=1792152722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEWrIzKLR6ifRFKivyWaAxL1i189Pekuk8YqMPtRbiE=;
        b=gAHSHb4Ok/+c7jF0duqnnKMVtRjVhj1qWNtOOCUf5/zcq8tFXD6C+/LvuiBNMYKuUM
         oDxusivHMUb6aI7BypklxXeMuS76jlSeFU0u3ClpqSGEfXFw3iiq5Qx/YtmVCMM6KgJN
         ZFqCdD0o6c+QjoE9QL0fiWsSxizPRTsaVxiarCpm3ehKtmy2l2sRJ0L47N9+iBF6TfuM
         3gS0e/s4/gyuDt/FKHqXu3JBauX9Pm7jDLz7V61XYxhhh/pSzG0n/YJVQBh1CBltkEeb
         CND7BohG1guTPjwjpjMwLZ6chKxRLXGRx3/ZVGli2NBiIP///OGt/WdRZ9/RDdjFN5a1
         wLoQ==
X-Forwarded-Encrypted: i=1; AKwUvByM+YhpPjS7sCYM35K4m1IY05N34qW3jHtb4xW4vZ85F4PjJoEJE94dQ5LKEx+JfMpZ8C1Pj/e6D/pj@vger.kernel.org
X-Gm-Message-State: AFq9FYLYbua1UBp9ulJHXi++2LeBIp35FsjlzCb3wUiKgkJF+RNA225x
	PBVCZarlby9GV6jt2DxfG/JEDhCMvFkkzR8hBv+ZTkSGTiAedQ3cVCNL
X-Gm-Gg: AYBFou2EWyDX/DoXEm4FT8WUzCNhn3WPD/CJf0UtG4IXcXjf3tuexQpI0R8z22Eyt2d
	EzIhmvnqLD4oTTSzfcRgmlxNiPLJ5KZV84aqEj+hTLSuIvWLPe/dS5eNb261UXnJghwN8dxjWit
	FcVBGKEsQAkMXa1R0S0se0GXLYU8TC8lxuyEKYJBB20c0vqGaqPy0+/pBJ1I1g4wnPjmFiE7Ajt
	/k8ostj7L8JV3OW4cNghjG+A/ROSQcJymJcrNQ0YI0XCqu9BpWd0d9MYRQSzRB1MmFMWewcLF5z
	Q0Ccg5dsd8gzY1ok8Q9QxfbbGiNKNV4TS83hnIHQbDe22qL4k54Wqah/L7DodI4m9E0rh6PJCOV
	Xnfl/UCwOLmSC40x3LdcdnjmnzDA3Ul8araS55LHWQIrvP0mHoPmrY9BRmTtsykS1zHQCA+7S4q
	YCDl3mDiUO+/mmBkY0jyTe82eJL6dt8QiROgE1DVCvt35qG8CbemPC163MM3C5UBhcZfBmPW1PQ
	WQ=
X-Received: by 2002:a05:6a00:bb8d:b0:892:2279:1008 with SMTP id d2e1a72fcca58-897c40f1e1fmr1597858b3a.5.1791547922019;
        Fri, 09 Oct 2026 05:12:02 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3eca287sm786243b3a.37.2026.10.09.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:12:01 -0700 (PDT)
From: Yibo Wang <wyibo6109@gmail.com>
X-Google-Original-From: Yibo Wang <2024312277@stu.hit.edu.cn>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Fri,  9 Oct 2026 07:11:41 -0500
Message-ID: <20261009121143.550498-1-2024312277@stu.hit.edu.cn>
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
