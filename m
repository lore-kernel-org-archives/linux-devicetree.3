Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975272;
	b=jXTqWMIEbjn8Wv24+Ndb68qWacwKxYTQzQusJJY/KlYTR31RVd6Y7r9hVHFMHjIdi0+5
	 r47CtqJiHwnrDq7aGVvE6TTdXFFN7WQ0YKTiznp/iL/1dREsV79dS0XtFj0rRfEHHpieZ
	 17ZiG6oH/7Wu4NEBhkv56/JqhuX+4aNQK1zB8ZM7V8t0NT7j8Btt+2PLsqJVY4xmB2d2B
	 UacotJx356yAYQ/L7Nf/Zj9ji6UlP6t2M4rCqgcT/LXWMgzeETcN10XtWAXLmCRhq3dTv
	 UsyFc2wW41iuhvlRfF9xYyqyHqZtmPr8NzRy+gDIs08y9HZAAZjQDl2RGEMiq0v0iyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
	b=NHWRc8SVMYU9LWaLY66XNfDdWzgtmfDawDlUjXsO/GqjsL6dLql1Buea/+vtZw29MUcg
	 aIEoIqciQZz1pxOcqzi3Av4H6On+pg94Vsw/wcw2LMet24E4FajTw2cgy1MOFu4QiF/1q
	 RPJ3MRlVZAVDx+emAfhjo5M2UKbNttHpSpY2ZOFZKDiQehNX58jlqXcUbEa3kKZSjr22D
	 SvmThlk2ccfktyMirVGa2+1mN7aXkWQUedwFyp45R7ps2LairaMR7RgcsnVkcNX7//OjY
	 9jrn5GJSWFJsD0B6M0dMq8WUxFqRa3wZ2s2T1ez6696lfc+l4X7AG5Rg2w7hCM7OJnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VKx+obQA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC4606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47BC4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VKx+obQA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so7445725e9.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975270; x=1793580070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=VKx+obQAPb5/XrR9/roIFYPRYGDzzDrkDoIp3EMgMBi/JMmvYE/fBNeA1Z1c4kRnb2
         /5FawM3AjVvvX2Vrbh2TeCQRbtjZKXN31fGLMSFHZlpPbp6IvroOUVjulEOZx9U6Wt0R
         vw6XMPJz+4WhSv8rAMrLWA5HDcT33bu6gonFcqDZTJMHo5OqCR7/k65EenzsIYSVHt3K
         X5K9j8DMsvfVEImpHP6pQ5C63OFW9hT5m6zBFUVKsN/rb48+OTqeSmIUI0zrG74dep6K
         VELfJ4YXVWTb93hj7rhxZIB6NR5Vqzki9sivn9wYcT7X5QMTBRK2DCzwDEfHSgibQkoU
         Tc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975270; x=1793580070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=TdrLl1r9L1sLjWJoNP6hzLu0z40QVk02FO7/2bXp7pkUifRaErOavm3yH7PDItuxet
         TyUBzgSJOXIe9vVAkan1Y76MoTqwl2teelZeLnCVNRDP0wI5JhFa2vfybD0IS6FABS0j
         LIc1vI5DkAgCTp0DBLjNKo4qInz5ekzh11MQVeKzzheLfNzMuBU2FyKlmOAm/n4PvvQ8
         DZdjgOsQatrFCmkD/i1OteGBajszYPP2UyswRKT/sjV8UUNfELgKejvr48XPaYh2SJHM
         +pKd7ruUEo9Pw7jOY0Jvj8RRsxw4LdLM/qxDXu8zmQxVvagpwH2hkQ1jSw8Cc/rz9fGc
         Z6oQ==
X-Forwarded-Encrypted: i=1; AKwUvBzATS93/TN0wUtURPJAJNuzgfkR6h8zorW0/PEE5Q68bO+WW5LHI1V3CQ9IMHXMMjpvucQs6jI7VXw2@vger.kernel.org
X-Gm-Message-State: AFq9FYLLn6R3rGyWuHXEguDUTn33wLLk4bZGmLi7Il3WHdDvgCgIrY+2
	yXKCo/F1FxIvLjLsgbl6nwBzLqgSe9GDwsD27NfKTo76iErt/56OsMJN
X-Gm-Gg: AYBFou1BapPGW9yx0BZcLEL7GqONhWmsYCGh1BJc96ifbt7UZkIRHQEMZrvGnbV0aGR
	RXNF9LozTDCUKramas/x1mrU2ukvW7L72rZVMaPGVTBITcvgyjDYORsOHI4dhjQN4Qp99KXEQen
	/L7a6YuDcoxw/6e0U4i01gk0XnemHK8UbI0YZ/7G5o+D3IZYrrvda2j/VLL74Mg6aasLlDRjbHf
	pkTzU9SipabTKQzsQ43dwQLZ4zszxAm1/YbIodUNay01y4C82kcAQk8Qv/6gTgcjizoGDfVu5Lm
	VynRPqAUM/cKEBJ3P3pShOwXuhaZFe3iqOUJpY2lOlI8TU6K53M7uJvkWS8QCrP1AKtWJkw7/UW
	B8B+67LCfcCKF7MZfllzbankbDCnGMlW0EffpVbm5wHxk1pArTx3iuIBsx9+73g/H3o54/qKNDN
	t7SHr/8DidzifIOL8ieamZ2pdhDO1xi34CJca8FwZZOAguI3AT+uW4FP413Z8bsXJs3heKPwucv
	/gKj/KBA3FH8SwI4a6Qyxg2vSzrDC7fJChqLnnxO0g8fo00u0AyDFiQ/kqnXIbubqNmX0oCL7wU
	P9qHBIySk1r+rA==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr101973045e9.0.1792975270272;
        Sun, 25 Oct 2026 17:41:10 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] sy7636a: power the panel only during updates
Date: Mon, 26 Oct 2026 00:39:11 +0000
Message-ID: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature in the regulator driver instead, as the TPS65185
and FP9931 drivers do, and remove the hwmon driver. Boards that relied
on VCOM staying on mark it always-on. The regulator also switches VCOM
with VCOM_EN, gains VCOM voltage control and binds to the I2C device
directly.

Tested on a PocketBook Verse (B288).

Pablo Mazzini (7):
  ARM: dts: imx: keep the SY7636A VCOM on
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good, then switch VCOM_EN
  regulator: sy7636a: report the temperature
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options

 Documentation/hwmon/index.rst                 |   1 -
 Documentation/hwmon/sy7636a-hwmon.rst         |  26 --
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi         |   1 +
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |   1 +
 arch/arm/configs/imx_v6_v7_defconfig          |   2 -
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/Makefile                        |   1 -
 drivers/hwmon/sy7636a-hwmon.c                 | 102 --------
 drivers/mfd/Kconfig                           |  10 -
 drivers/mfd/simple-mfd-i2c.c                  |  11 -
 drivers/regulator/Kconfig                     |   6 +-
 drivers/regulator/sy7636a-regulator.c         | 240 +++++++++++++++---
 include/linux/mfd/sy7636a.h                   |  34 ---
 13 files changed, 205 insertions(+), 240 deletions(-)
 delete mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
 delete mode 100644 drivers/hwmon/sy7636a-hwmon.c
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.52.0

