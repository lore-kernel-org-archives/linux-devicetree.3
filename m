Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60AD2EEE9F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572787; cv=none; b=gZw1IzsPeNz1I2DVDVThlWGDlsbC147vtMe814Aj2bjY/XQ81WOBv6xnYkCV8JNF0Ixcv4gg1HkWDsWjPR+SOvA2PbeFPh1nB0Nf+ReO+AHUTYuRQZ9b790bESiXoSnKArrDKZYEkjkn1IBepPs7iepuiz6hO6zar4iu323Ga1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572787; c=relaxed/simple;
	bh=uWgOzCk3HJqnimxEvgxG5haMcDkZa8740bZxUMybWwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IE7QkBuHtijA14f2UiP05gdtF9PnqC0fWe+GRXXmmdNM8ApjGJemYCw+sTfYp8UK7M7HFR8E6KZsdaXFxFF05+7yNSjTmp6qQIPFMFG6DTIBa6IIXRO760Z/s7/ggUlqV2eV0umAzpojB6N1PHH8gQqQzZbXWyHCMSYq5O17iqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG6/3R+D; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG6/3R+D"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848595b338cso379578b3a.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572785; x=1784177585; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rss97cjDQSVlLDw4954aQMvhSqBEsq548Tg4wWga1tE=;
        b=VG6/3R+D0BlMpQeBnLqzWG3Djj2VIRDJT55qhPU3cw/Jse/AOp969md1wVDBgXDbw9
         qd0FFClD7eSoYIHxyyzcP3akw8L95LI7L19erJNlVu8kOXQ7vC8VPaPI+0Asj1eFiZd4
         vEurLw0ov47SlJwJsaKCsIJY8mN08S4VvNy12Eiz6HoYZU0U1G1MPqR8+Ej0024nWbcE
         MLgizLwydorThOIPPcQDy7DODKBETCkfOyniGL1oJPNhtPZrmZWD26bJleLFGbAchHzc
         udx50W0q87u+BEYE+qB65uo63lADpsnwqPhCdDMawoPhapht/MKZ2TqxfM+SoIfvCU6I
         i1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572785; x=1784177585;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rss97cjDQSVlLDw4954aQMvhSqBEsq548Tg4wWga1tE=;
        b=XZ0hev7psz4HG/s3YNTQmoHVebjtBB/k9tOGah2rclcs96AuP5mKVNjVJE2YNBJTRt
         JM6JdgufUVhOMvsQTiJXowWqMn+3eWQR4guUY7a/HrHiRmyUyK1i5/Rtw6zl/FY4WFz3
         o24tpaPm18fpaMRIKfyXBA/NqQw+PvWZGmWyouXv22rMqV30sandaUkCKeH8n3ONjIUQ
         GsZqKzara35vVgRpRL0LwuNsYHKDu33I+GverQvUCMxJYHvRc8j7TOITgAFmKMsl6pYR
         zff5q9qcsUUKQEQCBJiDHnhTpeOSzTTxwUeEIjmrKuiHBbrbAFcm1MFmf66W6Nf7pSAc
         oO+g==
X-Forwarded-Encrypted: i=1; AHgh+RpNcQWbdhjQ7P9eEDhTdDhV5JuCvc7zbCdkEP/yg8iG2aTMOMo4aT9n3i6o/W/gAmEV2Nnw2ULUKz+g@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTdhDXy9UoMeap6DES/GTkXOCJUV2yhqnMTxoZOC5+IJW8mQ9
	nVQZIE220OmC7/iZC/osePtLKiwphxOZfbigh7yt6ILqPK4xpgKoYktS
X-Gm-Gg: AfdE7ckCurW4tQyMTN8V8sjWj5FQr74jtPIQ5hfv+qX0Y+Lgn2HaBNYu8RVIzwwO9GE
	mJiYKvh3IJa1lPymyY99Vnasqaec3oHbY2+LrHjqt7K2WAxyV1DgKWCPVogYaBAIUv+3DfHt6K3
	JsPsbzJD0gzdcBJwI1oeDxpL75HkynbAfLWdVXQlvn7XHHDb3u4TeceJ3+fVbTZNJwQycPQ4FQf
	XlmpI8ljA7+hfU3/XeybomGvrQhniGLi1vQogmx2tZl8ZNGdhSdD+A9BNIDA2ze5RwekSSNJ1nY
	uRspPorzl0gOAsIFQ/bwSU+7OXzL67bPc1lpFexqSknigl+/iB/dtmtadG3JtPy7Q8/3bYX7iae
	uvchstpop9kOWAgwoofK8CXFFVSM/sozPk95xm1bNEmwghasM/+QCyn6552qA+uGLTgywtyE/N5
	EX9yKvYsj5sDd/jOkV/cwehivKGKyTIasegE4O3esHYOWduGnk24tclfxlAkPqSvU0/y3KnGJ7g
	UhL
X-Received: by 2002:a05:6a20:431a:b0:3b7:d9d6:9fc9 with SMTP id adf61e73a8af0-3c0bce1895fmr5924516637.2.1783572785059;
        Wed, 08 Jul 2026 21:53:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 00/11] Remove support for platform data from samsung
 keypad
Date: Wed, 08 Jul 2026 21:52:58 -0700
Message-Id: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACopT2oC/1XMQQ6CMBBA0auQWTukHYuiK+9hXDR0Cg2WkikSD
 eHuNu5cvsX/G2SWwBmu1QbCa8ghTQV0qKAb7NQzBlcMpMioVl8w25hfU4/jjB2zc8aTP5OCEsz
 CPrx/s/uj2EuKuAzC9m+hTNPqY026MSdDqNHFsMinXpKkcUjrrY82POsuRdj3LypkxtKhAAAA
X-Change-ID: 20240819-samsung-kp-ceedd4f2f720
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-b242f

Hi,

This is a reworked and extended version of the series previously posted
to convert the Samsung keypad driver and Cragganmore 6410 board to
generic device properties. The first 8 patches of the original series
(general cleanups) have been merged into mainline, and this version
focuses on the remaining keypad rework and extends the board conversion.

Specifically, we rework the Samsung keypad driver to stop using platform
data and instead rely on generic device properties, and convert the
Cragganmore board to use software nodes for all its peripherals, removing
legacy GPIO lookup tables.

We start by introducing a compact matrix keypad binding and implementing
it in the driver. To support referencing Samsung GPIO chips in board
properties, we add infrastructure to register and attach software nodes
to Samsung gpio_chips. We then switch the Cragganmore keypad to use
software properties and drop platform data support from the driver.

To convert the PMIC DVS regulator on Cragganmore, we add software node
support to the wm831x regulator driver, allowing DVS configuration via
device properties. Once the board is converted, we clean up the driver
by removing legacy DVS platform data fields.

Finally, we convert the remaining peripherals on Cragganmore (GPIO keys,
PMIC, WM1250, SPI0, basic-mmio-gpio, and LEDs) to software properties.
This allows us to eliminate all legacy GPIO lookup tables, which also
fixes incorrect GPIO chip names ("GPIO<N>" vs "GP<N>") from previous
descriptor conversions.

Mark, it would be great if you could give this a spin on Cragganmore.

Thanks!

Changes in v2:
- Patches 1-8 of v1 were merged into mainline, dropping them from this
  series
- Rebased remaining patches (9-14 of v1) onto latest next
- Resolved conflicts in mach-crag6410.c
- Removed redundant "out of memory" error messages from the keypad
  driver
- Added an infrastructure patch to register and attach software nodes
  for Samsung gpio_chips
- Converted basic-mmio-gpio and LEDs on Cragganmore 6410 to software
  properties in a new separate patch
- Addressed DT bindings feedback on the compact binding patch
- Fixed proximity switch event type for GPIO keys
- Added support for software nodes in wm831x regulator driver
- Converted PMIC DVS on Cragganmore 6410 to software properties using
  the new driver support
- Removed legacy DVS platform data fields and cleaned up driver
  fallback.

---
Dmitry Torokhov (11):
      dt-bindings: input: samsung,s3c6410-keypad: introduce compact binding
      Input: samsung-keypad - handle compact binding
      ARM: s3c: register and attach software nodes for Samsung gpio_chips
      ARM: s3c: crag6410: switch keypad device to software properties
      Input: samsung-keypad - remove support for platform data
      ARM: s3c: crag6410: use software nodes/properties to set up GPIO keys
      regulator: wm831x: support software node in platform data
      ARM: s3c: crag6410: convert PMIC to software properties
      regulator: wm831x: remove legacy DVS platform data
      ARM: s3c: crag6410: convert remaining GPIO lookup tables to property entries
      ARM: s3c: crag6410: convert basic-mmio-gpio and LEDs to software properties

 .../bindings/input/samsung,s3c6410-keypad.yaml     |  53 ++-
 arch/arm/mach-s3c/Kconfig                          |   5 -
 arch/arm/mach-s3c/Kconfig.s3c64xx                  |   1 -
 arch/arm/mach-s3c/Makefile.s3c64xx                 |   1 -
 arch/arm/mach-s3c/devs.c                           |  62 ----
 arch/arm/mach-s3c/devs.h                           |   2 -
 arch/arm/mach-s3c/gpio-core.h                      |   3 +
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h           |   5 +
 arch/arm/mach-s3c/gpio-samsung.c                   |  72 +++-
 arch/arm/mach-s3c/keypad.h                         |  27 --
 arch/arm/mach-s3c/mach-crag6410.c                  | 368 +++++++++++++--------
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c           |  20 --
 drivers/input/keyboard/samsung-keypad.c            | 192 ++++-------
 drivers/regulator/wm831x-dcdc.c                    |  24 +-
 include/linux/input/samsung-keypad.h               |  39 ---
 include/linux/mfd/wm831x/pdata.h                   |   5 +-
 16 files changed, 445 insertions(+), 434 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20240819-samsung-kp-ceedd4f2f720

Thanks.

-- 
Dmitry

