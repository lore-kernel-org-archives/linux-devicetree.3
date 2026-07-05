Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B29225413
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 03:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783221741; cv=none; b=HLFkD399B0WQw1nfd+XbpEF19yR/zf7F7EekTruVdp0OuzIokDl32O7MtUm9PEn2V6UymR63keqaxWIaqGtHBa/R1BJwALUOeRFxaWRn2P6Qekf1OSBAjNCDVwjgrysQjtc/8CaSLNPDHd2doBSQ+zPEmlZY+dDd9VjwZWGR2ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783221741; c=relaxed/simple;
	bh=UogHHflNA8CqOvLE8GVFWsBMej3ynkGYFHrDq7WWrCs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IaIdyvOAYMRYz9yCz/K/Jc+BR6NC+AcuyZRD0rsVQRbBIsUTDAEpadzDxTGSSSNtiFC/W+AXUKirLU2YVhQWKkC5lzm6rN2geLq7b/OGksJ+NJ65NcyM64+RF2gy4PeRMPid2cEZnBd15m0E10oGlYU5kHgZqrJ2fxxzsJpYhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYvf/jML; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYvf/jML"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c89636920a3so774336a12.1
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 20:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783221740; x=1783826540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YUyL1bFxWaS+QQi3YcGBfEFUpX7LDZmNQCwyRpxcohU=;
        b=ZYvf/jMLQQwLklQMe/lN99JNbXvDcHG18uTPb5hSiyS98CZDCa1sNo9Z+5O/ACgAV2
         jextvb5+2Yu8Gh5FPaS++jBsqlZzpse5rlKDOXNC/XRqZYMS4VoP2yu3EYPPyq3Eim56
         ykI3cIwTziIetbiokjksBD49YLOUACzZw0LGfz3m3fYmufSA+5A/BoF5l5ivTuRimPAr
         inpe6whAPcA+kzUEW/oVvZ9AHN3TuYDWqliBvx277uYPbxQufwcGUL4KYFKqEGlZiYJ2
         BWRsqo9l+HgdK+OZ+bqO13tL6AoGoQj8f1J++/GLhTU8EmSpxAZXOANpb7VE/4kV+JFT
         QqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783221740; x=1783826540;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YUyL1bFxWaS+QQi3YcGBfEFUpX7LDZmNQCwyRpxcohU=;
        b=MHdTFIk4N/mT5aPsrh5zdofTxGdOkMSrLkHFAHVVF4AXPxbyMU5uSlnEjZpB9OUUSF
         7G0roFewEc3H++0RYYZqE0HVaWjYL8riYSnIdwNxX9Eyr25f6cB+wxL2BUcBdp1X+Tl7
         +Wfl5OqHJS6KiuNx2daiZ72Dkk7gAqJEJlgD+3TdhSBDGN14RXMD1c0TBvILbmqsyPv9
         Pd0mnCAOu7luLPOwUA02bz31VEINHJJO3VkC2YTtFpv+PwC4UrQRSwg4tq6vBFESlIVj
         SkUNr6bGZV602oQkugibhh5PyWe4rQjsFarPJ96YADw0Yp0aODTx7N8w9OzjhpqWQ8en
         hoGg==
X-Forwarded-Encrypted: i=1; AHgh+RpWOUqtXIl6ufsixXOww/phbEJR+zvx14AeFK2QeAnIpgf/l2J8hkXSKEaSxpJDgbwPh8FgyELigfN2@vger.kernel.org
X-Gm-Message-State: AOJu0YytKEhMjUywPk65jjaZJlgyUy41kMKpJ+S0oAndZqrQQtsXTNIH
	YZg9+qLrP9Ylv336X4OzZnUFV4mHu2JIQBgvXIx85AuHmCo4EcshtnFm
X-Gm-Gg: AfdE7clBdo3u5+9mrmW+KXi6yeL6Z/VjpQGWv1LkXU835vn7q5pyLgbLTvkiHtXuMBn
	mHaBeP/4Iift70TMJ/G4s39UqVFIjwE/2InbfuPxPX2Y/YgjPxxpv2cBS+K87QxgCI7EowBimCR
	oI9ZVq3UyVVx86OU8Wms/Mu3QAkelHYs4d5sNOfOPJ1hya1hoplkcVodPSk6wVrJxaYckYINS3Q
	30UCUfEkQ+sOUdplizQzt5Vc0strB6luFJlCkGojOrAbWW+HqDbt6wSr5Sb+riGMxSnXtGrmpY4
	w0GGDL0xahBgLMj/nHWFe+NwHwRybu7MQ7NU3ay44I6VpXPj+Rqb0DeYByKBQ738FRPAxDTcHBs
	HaouWdCqQ55Vr4TJ9KhIFR0guVWhS7HjpH5s+J2NyMpJl2qn/ZT6DDYemXKC7gy8xEGbQR7Pg87
	r/zus4ZL62hAlSgl6F
X-Received: by 2002:a17:90b:1d50:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-383f52bd657mr4188451a91.10.1783221739665;
        Sat, 04 Jul 2026 20:22:19 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8900:e54d:68b:5bba:3eab:6b41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813c4dsm35139723eec.7.2026.07.04.20.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:22:19 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v4 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Sun, 05 Jul 2026 08:43:33 +0530
Message-Id: <20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq1pp1DBlfcwLgqdgRoB02KjI
 dzdohvCwuVL5vtnYgG9w8BOu4l5jC64oU8j2+9Y3Zq+Qe5s2gwEaKFlwdtOihK49S6i50YTGGM
 tgZAsmYdHcq9v73L97fCsbliPS2S5aF0YB//+Poxyufu1j0Ju2lFywa2sbCERlKryc9MZdz/UQ
 8eWdoS1hq2GpDMqSenSapMVW63+apV0kZMxR6KMsF7reZ4/f4XhOTgBAAA=
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4009; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=UogHHflNA8CqOvLE8GVFWsBMej3ynkGYFHrDq7WWrCs=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqSc3k1GkujVLkiZMT98E4r1uGr9zKp6xm4+QRU
 b5OjrB+5VGJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCaknN5AAKCRAVlYpeERwF
 3p5sEACn+L2mGVSNQruazQXfFVLK5sUiORgpADVx90ES5MkHppSRn5BZsqsCDXkqXiecO7/9pQl
 xwGUyXcsJagWDRnIC82f9zUo2008Uujb2FcFAPFjKx2VC2Kj3fkClgaewaX/2+O0X7VBu4SL8DM
 OWUt2j47JYYVk13MUPZT9HYQ5m3/xsHrMnMEtR6d51odCA5lscvaKXtoDlHJq4KFmjDvvzuhQTa
 2QPx6dl/FiMRikODkz2DbdPzyKnW/FeX9PLfzL9zGbBhKknS1r2KBj98JuaXvwHVqQy9QTfrhI2
 VkX+GBuiKdXbAhqyXq/5BFWguWCqBKzKp+4GxpHiY6gCZWGznT2LLoLTCgCne6PhpXrKe26XN9Z
 lTuMvZdvcGptiIgRyD9MtqDoQwqnQfSkzAT+wjoi296/kuXIOoJ0HWCj8zcYIY68ZQt6kuvMl+2
 49Cf475WR+ZJf8ZyKs2SdBhAwDhyNUC5zq/KWNL7wm88nRAOGfJDJokgX0+4Y2XzzJnQf9kkY9S
 WimBd+54PgIqpBq7NYrRg5dXPZ7TXQIimzFDocwvCNtp5x3cBPw1KRBDwBuODApGLBeROG0Tldc
 fQYV8meTgxzRtco/ZHwyRHzAMlAKGp18/06Na7rrkt1ZWOaRShqgqXCSCNVIQ3G0TgAhKg4eC0M
 Wzcuxn0Ty+NHkgQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

This adds a V4L2 subdev driver and DT binding for the Himax HM1092, a
1 megapixel monochrome near-infrared image sensor. On laptops it sits
behind the IR camera used for face unlock. It speaks a single MIPI CSI-2
data lane and outputs 10-bit RAW at 560x360.

The driver exposes that one native mode, a test pattern control and the
standard fwnode properties (orientation, rotation). It has been tested on
real hardware (an ASUS Zenbook A14): the sensor probes, streams, and the
on-chip test patterns come through the full CSI-2 pipeline.

The available HM1092 documentation does not describe the test pattern
modes. Their menu names are based on output observed during hardware
testing; the register programming was recovered from the Windows driver.

The sensor driver and its binding are SoC-neutral, so they are sent on
their own through the media tree. The board-level device tree and PHY
work that wires this camera up on the ASUS Zenbook A14 will be sent as
its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
Changes in v4:
- dt-bindings: make data-lanes optional for the fixed single-lane sensor,
  constrain explicit values to <1>, and omit it from the example.
- hm1092: add the copyright notice.
- hm1092: replace the private register representation and write helper
  with CCI register sequences and direct CCI writes.
- hm1092: use descriptive test-pattern names based on hardware captures;
  the available documentation does not identify these modes.
- hm1092: parse fwnode properties before creating controls and set
  read-only flags after validating control creation.
- hm1092: use the generic get_fmt callback for the fixed sensor mode.
- hm1092: initialize endpoint parsing with the fixed one-lane default,
  reject other lane configurations, and remove the redundant endpoint
  presence check.
- hm1092: use fsleep() and null-safe GPIO calls, and apply the requested
  declaration, brace, return-value and error-path formatting cleanups.
- Link to v3: https://patch.msgid.link/20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com

Changes in v3:
- dt-bindings: add the Reviewed-by tag from Conor Dooley.
- hm1092: initialize RAW colorimetry fields in the pad format helper so
  userspace values cannot leak into subdevice state.
- hm1092: return -ENXIO when the required firmware graph endpoint is
  absent instead of deferring probe indefinitely.
- Link to v2: https://patch.msgid.link/20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com

Changes in v2:
- hm1092: use pm_ptr() instead of pm_sleep_ptr() for the dev_pm_ops
  pointer. The ops come from DEFINE_RUNTIME_DEV_PM_OPS(), so gating them
  on CONFIG_PM_SLEEP dropped runtime PM on a CONFIG_PM=y, PM_SLEEP=n
  build.
- hm1092: free the control handler on the error paths in
  hm1092_init_controls(); the fwnode-parse and ctrl_hdlr->error returns
  leaked the handler.
- Link to v1: https://patch.msgid.link/20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com

To: Ramshouriesh R <rshouriesh@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ramshouriesh R (2):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

 .../bindings/media/i2c/himax,hm1092.yaml           | 109 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 728 +++++++++++++++++++++
 5 files changed, 856 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>

