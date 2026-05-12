Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C639C47ECFD
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571609; cv=none; b=Vw+lm6WtyHePhDxpiUrfkXowdNhmiTaZ9Qdwks0kUBtEmsKSQWDvQ05fJhB0jcjEbaPk3uPV2inhLT0hpNsr2IFMkr2KNATMNCbBLQrPe5x7IBaB3ZyAgTt1AeJibBz22iXvZOuXesQFoO+SL5nxuu1/K/P1HV1Ioxx7LH3J158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571609; c=relaxed/simple;
	bh=upcmdj2vMH0VCM3eO2ecym89DE4uEFAsF3Yeh5bTV4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AJoBr2IJjZHtymouZPEdHTvIgmUKkPDV5/EGj0OWnSXqcxaDlKYVERwLwtf5DYeotL5V4jUuALsoSQJa1GLG8P8I30vunopKWOezuJy+pTx6xJZtUd4OcyZ+54ZkZQDbtDqyhnEDVcsWZ6/4fcqu/E7qrbBoYSy2XiGXeBOEk3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k319k30e; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k319k30e"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-365e20fe3b8so2944762a91.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571599; x=1779176399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eFg2wB4o8zIZHpJ/y0oO5PL1bzy98ptVsLeFLg87yE=;
        b=k319k30eO1McONiGc6Ho9xsdk8o9CnQ9X8+Zf+SpGTut/5w8meCjJmcRlhRFeumbO4
         FtdiFnSCh8zMqEgplVndbSiKo2e9luZxysg60zrQG3co9Jt1GQmZlWoyL1vpC25VfAs4
         R2bqibrmxoZDo+tLCvD8k7gv3BCDauj5+aB94rGnjmc/4NSDRMr/PwEWR6L7qzBpYfsJ
         Ct8uKD1ApgMnmskY2UlY+XBuQvl6bPZZNlBq9CBo11u/XS/aLbmWZjXIPfGJQmI3Wora
         WFlzxdS+J4yqpN1ElT03OBNRN7foqcDxs1ZXM5Nck4nsZe1af3VPji/G/N9ueUceh7Ns
         dtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571599; x=1779176399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eFg2wB4o8zIZHpJ/y0oO5PL1bzy98ptVsLeFLg87yE=;
        b=o6d7eC0gnde2/5q1d8LU1Mj3FQCNC9A6Xvwqu096sEPwgjDRrO2uKbjh7NysN7uz2q
         mArc7JLuZYRPacFT6bEuwJtEYdwh3WVIH5+tmjorgwcq8PDoWnBv/dGNf/cRFBHlAgbL
         m2kOQLpevOtr9lOBWl7UyXGwY2VbxAruk5upathZrxr6B7Cff6Ptr3oCxwZyjfwnjsUl
         HaeEY40lu4wVCwJWp3fHtzh5clHev5LWczWTQ4pHOIsSzFpsNGarJ+Ffxo6LLQZwB7m5
         tM+R+eKC8L19kFsjtsrIzJL0Z1bqd5qqu2yk2ZIwurfc6Nkoog2NtYJs3W9VVZ80b+v0
         psiw==
X-Forwarded-Encrypted: i=1; AFNElJ8V4dsjZLTWp5fxSvkmbpFV3NBMeL0PCYeGyvTiy7GPFvmA3Oyv+QNjvgsNTP0yo/9g0FCu0WbnjO22@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMrQRtTRQiM05iWDD0rBembe54b8ZCfQJpAC4t8fKPnT9kpbF
	PiaD66bSdt6ZHlsgkm9fWoq1xHSINaPqtplKrOuqDB4MNivsMsjarpY+
X-Gm-Gg: Acq92OEfs5zb0VSviNgeMHRYerm9fmTKLuyRmSEGQNH3kIsYFtNwpITX4GTnqSxFmuh
	xFuBhVUGMuw7xtyWcH/78pAUsAWdQqaxmZewokoAtRnd7UbuYk2OfsV9lA1vBL4dHs2e++cHmM3
	6UTaPxz6LLY5RiLxND7WEyP1kQXwQjt1h/iCy8Q33C9/BNWWvzNugOB72Pl1daD80E0ngqG66fG
	hU4Ddi7ILKwX5e15oq8rDSIUoWDh4P6dugXMuZjL1zUBCPH77+g4uTFa65LW+N45VK8vg80mcsk
	36ibFUdeAie3G19npzCMZeMV0uUJkd5oogfYMq1evhRNmmaQjxUa9C5L2BiL7pihfM+hMuTfPNh
	VK7044QgnbKaNIgIs2VLQZdqQiRQxIfgKqpU1iWahJhvt+H3wuGbZ8U+cIGkomnD3jD7Q2g67Lk
	uLBZB8HtEQBPzsJN3cHXo3xG75xHWT3q2tStKsGdF5YwIbV7wJbQ6pqyxeR7P6N7qgATBOy5jWl
	oreudxDdg==
X-Received: by 2002:a17:90b:53c7:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-3664c8db78emr18615005a91.6.1778571599128;
        Tue, 12 May 2026 00:39:59 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d65ed459sm13264489a91.14.2026.05.12.00.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:39:58 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Tue, 12 May 2026 15:39:50 +0800
Message-Id: <20260512073953.564323-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the I2C controller found in the Nuvoton
MA35D1 SoC. The driver supports controller and optional target mode
and runtime power management.

The implementation has been tested on the Nuvoton MA35D1 SOM board.

Changes in v3:
  - Fix minor DTS formatting issues (whitespace, missing newline)
    
  v2: https://lore.kernel.org/r/20260316063726.41048-1-zychennvt@gmail.com

Changes in v2:
  - Overall:
    - Rebase on linux-i2c/i2c-next
    - Switched terminology from "master/slave" to "controller/target".
      
  - Patch 1 (dt-bindings):
    - Simplified description and fixed 'reg' size in example.

  - Patch 2 (driver):
    - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
    - Optimized power management by moving clock control to runtime PM.
    - Simplified code by removing redundant .remove(), .owner, and inlines.
    - Added dev_err_probe() and default bus frequency handling.
    
  - Patch 3 (dts):
    - Moved i2c aliases to board dts and reordered nodes alphabetically.

  v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com
Zi-Yu Chen (3):
  dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
  i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
  arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  15 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  60 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 792 ++++++++++++++++++
 6 files changed, 944 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1

