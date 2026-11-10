Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309271;
	b=KgGy4GTSpo5P+neqkXvbv9LWAEn4zNi4L4DYEISNzTZ43rrrxtsB7MVk9eL3Yn9SZ5yQ
	 5JLcLEKY14raifZA7mjhJ0XhXgRO+5ri3LfzQ6KiCqvPuC52PMR+6mOmd/kKP1iKFE9Pm
	 wPOzUSle+jd9gBL7XHEKnJFuyMenaCiVOp06oMYljCz+jkpwnbbrW+J7i4UCplAu1hTTS
	 1sFTIpfuqy246XApMI2rRUJWHoKxRDnPOcKStESfWAGgjrbBCCFSa1+KPayaZHO9mBv1s
	 ejFNJ+tISDX+tnL4CwTaLwXdjuLGuJxT639mFbCrznU0JZKfuEEpL/308cvbZcfXmUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=;
	b=nG9lDiX/cWkVBQtiMM456uO5EonctKId/AwrER3ehvREHCjbT5Oc1ViFdO8DHcWaf+DA
	 NXWN5+uUYRqJDDj6+0pvYpuMJ7gy3e2loUvBiiyMLT8eenqYz/rr6HhMlvRXuwJbqK/VL
	 d14GK6f2SiHDYCv5+EaJySc7hBR7ISN3j0TsOF116Bc085dCRE8EWTKxMcNed95xYHmoi
	 FPmc8RHUbah1jbd7ZdEtvTPj7RHGI6B0MFtZ0FISJEAT4L1rPe3gcXPVYz4YVlVleZwu/
	 q5vJidIbTN+5BTTXZSam6YeRbxG4EHDFboTrnssmmtuGZWcnCDOXvSBC7Pt65PzlCgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnQ5viNa;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360F606A336
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0360F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnQ5viNa
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so801777a12.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309270; x=1794914070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=;
        b=cnQ5viNavJtinjD66Zek1dq5x4qv7/KFnNkmYWNlyX7UNhyA8mn8TK81Ik6mo2yu11
         ApDPAtfhCQk1UJ4xAtuRVQMA4FQyuov3uAndKeGhlHbc3jxjE3ocCJfJqBu4rsDIyfuU
         /p22qH8dByEzeD3V9QDpE34dYC9Mh41cB/Rzb0Y12zePViya3mO9/Mgc1ys7pSRMegwF
         vTOb7uhvOitYQ1iP3W9J755jcTnmuRdlv0dQXLU6KOP/+C1oqJ59SF1nmWTA3Yv70Od4
         tMs8gOdLJdDGIdyLdK4INREhRqxKKNrhAC+1ESKGlecbMDWJzfCDdNVM0tRYkUkJJzNA
         kwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309270; x=1794914070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=;
        b=kHJ0mK/ILv2K1397YLvvED2zSfuE92JA5yHukeLSzjOuxUbr+DiIsU1ZO61xenDHaJ
         iw+/jHkZbSC/6z9gsm0FqURe30yKKHQlLhuXPH8s9qtBMz0pAVC06pWkRLAZvuRp128x
         RV9En5ugeuWF3Arzk+IU64npwEd8emsu86iA33WGxyNxQXs965G3WKYLwcm7y5o93m5j
         X50XIAxQ59HmjkEx+qoqh76SUjJK9PmMSJ0RVFDxWwUEW4S1j7scRBvRKM1smv7TwlOX
         SeuffOLoBphU4Sym+RXTxQK9Xmw/3gjsMvlWDsSJpfaoUkIFmOyl0S1Cl9qtFhQ2stUV
         g0AQ==
X-Forwarded-Encrypted: i=1; AL+hErFpy3UpbIjs/2Yb6Kw/APIeA8FaXR+FVq4CP7v7eKpiI7gnxl8wT9teQIvBnVxB5yiLVHWi+o8+uF3W@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZcipF6Gq4BnLAQ66hhKlnS8coWmB5MiNv6AUajx8VGouaC98u
	Uw67PvQrN6rrwHy4Szge2+6wss98sJ4vnub8hDwWP54d6//YVPVC3bv7F+9HfvIAjQ8=
X-Gm-Gg: AYBFou2+VHn5HPNaswH7RAzF3Wo/T76ffeptDfbhPoiKaRVkG49jad3IrNAc6I+agvO
	169xOvS/GvJSoGInUqaDXdhC6b7SpsuCliKgtbVcbXTYVGGXo6LOItDW2B1eMquyV317upYqKCO
	zZtubUByskFAWnL/Pu0jxWO4z7v2XxB6SAcDAdSg6C0JihijM07cwmR5nnE24ex0PHxUApyidjj
	C0QQdi8tL8QUS9C8HnLo4d1c+Mxz/19rRi3Q1Cjewe9NMfcd4K8gYujz1iE1Br48KYsNiREcYQT
	1VIg0krU0hFZHaV0tLQ7wYXFQojFeq+3Pa6TMqfHgCt5LUE13dE0uBSIMSaag1J+p20hcnLIL2M
	b7k5/7jqiQBNFKJqGh7pHoikGlfOQ+k6NSgQasws5HuKlnsknO8cE2spdOO93ShylYVrzSrH/qh
	BElkbU40ZTSdkLByCfODuBzoco5mt14qdD4M485OVRspkTxxuLhSJXtilTcZvPODFCC3xIknFP0
	81SKeWtZXIIXsE0GJo7yuj3XSCwD+4lp5Gh7iS1zgKsaTJlWsCdY6B5aIUNa+T6PImmra3IhZ4U
	ctGx8nLkogIUkTj8mTJenUjOMq8B57SnIOuy0sydqeca6a0d7ZSJc4M1QdB7zQAo+ktbbJp1vWs
	hA06SeCpPzqIAWc60e8W/Xd23lA==
X-Received: by 2002:a17:90b:1fc8:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3b166ca1c22mr2280914a91.8.1794309270279;
        Tue, 10 Nov 2026 03:14:30 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm3556684a91.5.2026.11.10.03.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:29 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Subject: [PATCH v1 0/2] Input: Add Nuvoton MA35D1 keypad support
Date: Tue, 10 Nov 2026 19:14:17 +0800
Message-ID: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Nuvoton MA35D1 hardware
matrix keypad controller.

The controller supports up to eight rows and eight columns.
It provides key press and release event registers, which
the driver handles through the Linux input subsystem.

The driver uses the common clock framework and configures
the controller's scanning and debounce parameters using
fixed register settings.

The series consists of:
- A device tree binding for the MA35D1 keypad controller.
- An input driver with Kconfig and Makefile integration.

Tested on a Nuvoton MA35D1 board with a 4x1 keypad
configuration and a 1 MHz KPI clock.

Tests performed:
- Key press and release events verified using evtest.
- Input device open and close verified using evtest.

An earlier MA35D1 keypad driver was submitted by Ming-jen Chen. This series is a separate v1 submission with a revised implementation, focusing on simpler clock management and hardware event handling

Feng-Yi Hsueh (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad controller
  Input: keyboard: Add Nuvoton MA35D1 keypad driver

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  73 ++++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 405 ++++++++++++++++++
 4 files changed, 490 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.43.0

