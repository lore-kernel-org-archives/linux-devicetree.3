Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91536A03A
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841416; cv=none; b=SMoAQxwuW8nT8Sztw8DT5QCCi6LicxaQxcQhw9JO3LNKP0QTzrwKZOCV2hPJSLlMgXyPtlKwzYGpgGy+b9e8sa/sBJm0jRpEiaWW/38oCq9cIkLljj09HqZ4hLANYSP3HA5Q1+L/wqwQG7ZTtTM0eJ1+qyCxCzxJlJpp1QXH7vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841416; c=relaxed/simple;
	bh=hn43hGUeHubAAxxfHt1D/92CcVRX0B2T9HMeJ6SisBc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BSHICD12BTRwyc7PdcyPyUjZmltSiww3ZhS6bWPwHGO0TL5nY9kVqYspX5HUJNFrNHNd/yQ14hkrZ2cQl9wqSpQ+IUu+TWewKJhaOc2WXuM0F0yKIQMmXEIYxzZZZGyTAYMQomYSnkh5KBbpIicise2rf1yHpL9plPo7gdRz+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aC2/Dm1P; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aC2/Dm1P"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-358ed696623so2316344a91.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776841414; x=1777446214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc8hj/fYyFv6f/gblFlvOohyiQz/DHY7gT0SmMXTVYo=;
        b=aC2/Dm1PnAJRIZ4r+errD1PakvGZw5iJAtaP8lWVdjsCyz0OJjGx9rvrciIKT40H9j
         ewC1poq6QbSST19gwUEAPUBg095/l2wTopT2YNMXxAgmXkXIqQol4q0K7WnJEYXheNQJ
         SKR3gGS0v4Ru6xqA1/sR4b+dwmQrG7dSiJzEIeJVVhfX1DbyDdn/cGoXcD5TKjvNMcrc
         rQ7Q/fD8zZw+65iRCZOQz6E3N7z1/pnjSq0FMfBW9EE1mCCDvZhemzUNajFkxvrtucCW
         QiFRoMip/aYLCnpiFVdeiL+s/a0HCgRsXp9cZR8jdMflbRY6+kMMVNe8wcKxhhLSS7MF
         9dPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841414; x=1777446214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc8hj/fYyFv6f/gblFlvOohyiQz/DHY7gT0SmMXTVYo=;
        b=WHfg/6gEvAQk8kyXdH9U0lb6HUksec8OyY5Rc+jAyRG9D59rKR0iYWouvF5e/OrTuQ
         Dw4iGRqeWQqyDTgXr/PkS08dDY95N1RSRvhr+VNlNDnDtd3TJaA6WHctTtlo2t8SkKhr
         QbawaT//NVpAJC/dr0mrhZS2z7Q0/4blEslupNFiikWxU2qbyFs+Dg/1humbNKOoQnER
         AklX/MQjZTlbGBG/XRxyFjEobaqy8QPeMmeWmOLLJjqsuFtlYrvx5+pCq41sDQR4jjWl
         9IXddSbNfaBIxhgPjW79uRc7jqNmKsmHbX1GT4Xnf3WID9Vdqqp9KePIs0x3yMHn46RI
         UaRA==
X-Forwarded-Encrypted: i=1; AFNElJ84fD/+ooVq0qiN4FEHEEY6dcpQKIj/yGUDgu25zpYIggkQoi7fRm3SeU3xFfDU8WCWCt8ulnGshYVp@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWBSrvQZ8/ExSMcn1Jf1RStFK/TP5FyIedPkLWQeAKZRqPjF2
	pKpFKjkJ7HSzE47aAUTM9kmdFKGX3E+xwyPXmoOhzU7/fKZ8IFM1MDgf
X-Gm-Gg: AeBDieu7GCjkvQ+/niPLFQhlRMDPDZbSe65aPPngfqET2CqLslnF3O+QUYZXGk06mDH
	iEUqEnzoCQnDqrEeqeSlblDt0yMIST8u921B6artTMB4XF3Azb2h8WwKwq0Ct3oK798b/qFflXx
	L4rozt9/zEQhiOHs2JsyLc5aEqsv9+0bjkSQmpCAiYAm6/NIZoqgKXd6Vz8+KTzMc6mjBFB5sqp
	UaEUGCsHMo1Wv8G4J3DRgHOySKFPPotp+QlJ2tdqU9d1s/MN3kBK3eHU9iSt0tkn2OJ4yOUGUaQ
	TFpEp9hdSjBSiDXJUUVHmAbMtjEG0qa8D0MVVi4C0mlZg2nfpmWHQebghqMUxBlllvDzCekosvx
	buJh7BMgNgHgRgB4fxsRgqV9TRERuGx5kumiQqNtZ+97fnW6oxTk5EPsRoaUpUAkcZo70VZ8Z82
	d9xXkkuDtV8EgZI3W2f/bkkzdHsEToo6P0odG203lPBgAVXs7wtswJwDps
X-Received: by 2002:a17:90b:5383:b0:35f:b7c1:faad with SMTP id 98e67ed59e1d1-361404a727fmr20892356a91.25.1776841413968;
        Wed, 22 Apr 2026 00:03:33 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362b9b6f5b5sm2241209a91.1.2026.04.22.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:03:30 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 157144163B69;
	Wed, 22 Apr 2026 15:03:28 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v9 0/3] mtd: spi-nand: Add support for randomizer feature
Date: Wed, 22 Apr 2026 15:02:00 +0800
Message-Id: <20260422070203.698716-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch series introduces randomizer support for SPI NAND devices.

- Patch 1: add the nand-randomizer property to the generic nand-chip.yaml
           bindings. Instead of using boolean properties, it introduces a
           uint32 enum (0 or 1). If the property is omitted, the driver
           will not interfere and will leave the randomizer in its current
           state.
- Patch 2: add the initialization logic and the set_randomizer callback
           to the core framework. The core will now parse the device tree
           properties and enable or disable the randomizer accordingly
           during spinand_init.
- Patch 3: implement the set_randomizer callback specifically for Macronix
           chips (MX35LF/UF series) to handle the vendor-specific register
           operations.

v9:
* Replaced 'nand-enable-randomizer'/'nand-disable-randomizer'
  boolean properties with a single 'nand-randomizer' uint32 enum.
* Switched to use of_property_read_u32() to align with the new
  binding.

v8:
* dt-bindings: spi-nand: macronix: Remove the chip-specific Application
  Note link from the commit message to keep the binding generic.
* mtd: spi-nand: macronix: Update the broken Application Note link and
  move it here from the dt-binding patch per Miquel's suggestion.

v7:
* Directly return the result in macronix_set_randomizer()

v6:
* Added mutual-exclusive constraints using not with required for
  nand-randomizer-enable and nand-randomizer-disable properties based
  on Krzysztof's feedback.
* Simplified the return path in macronix_set_randomizer() to directly
  return ret; and dropped unrelated formatting changes.

v5:
* Promoted the randomizer configuration to use generic NAND properties
  (nand-randomizer-enable and nand-randomizer-disable) instead of
  vendor-specific bindings.
* Refactored the initialization architecture in core.c. The core framework
  is now responsible for parsing the device tree properties and deciding
  whether to enable or disable the randomizer.

v4:
* Fix a build error in spinand_randomizer_init() where a value was
  returned from a void function. (Reported by kernel test robot)
* Update the return type to int.

v3:
* Revert the device tree property to the vendor-specific
  "mxic,randomizer-enable" to strictly follow vendor-specific bindings.

* Update the 'set_randomizer' callback signature to accept a boolean
  'enable' argument, allowing the feature to be explicitly enabled or
  disabled.

* Switch the implementation to use the standard SET_FEATURE command
  to modify the Configuration Register (0x10), replacing the previous
  special program command method.

v2:
* Create a global NAND DT property

Cheng Ming Lin (3):
  dt-bindings: mtd: nand: Add nand-randomizer property
  mtd: spi-nand: Add support for randomizer
  mtd: spi-nand: macronix: Enable randomizer support

 .../devicetree/bindings/mtd/nand-chip.yaml    |  9 +++++
 drivers/mtd/nand/spi/core.c                   | 20 ++++++++++
 drivers/mtd/nand/spi/macronix.c               | 38 ++++++++++++++-----
 include/linux/mtd/spinand.h                   |  9 +++++
 4 files changed, 66 insertions(+), 10 deletions(-)

-- 
2.25.1

