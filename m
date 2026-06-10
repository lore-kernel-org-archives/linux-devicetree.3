Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261DB33CE8A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060654; cv=none; b=azFT3Zk0QaWWB9aCfxRghW11IdhLlnz+stGODP5WSYjTrrLvuqQnAuJKh9o42LLRRI4IyBctUMR9cz+YYB+tnLeVhuGZOl/RNcN1qMYn8NySt71PPqx3xUWQScQ4PyHcHTNExWzzKhB6J8022jMVHoRgbuXR5uIy/BkEWF29Nec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060654; c=relaxed/simple;
	bh=htNF8eueg3Mn/3D5su9idQmcI9VgZFrt/5LRaQPDiJk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cKtWxeXe47CfdNYkE3f4X99/M/oMkQwBNJmr54aM8+FI0VIhnv99NR7dflEshaWixeUeAP3P/6Vd2jXMXhsR8WEDDTm4oX9CXCyvUr1U6DZiJTRrSKcO5l9T9Re72zx2A/bm1wlQCc097+m1LfMTA0HlUoQFmEGYa+bHhjYlanY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNyad0LH; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNyad0LH"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85a2ca7bf7so2288371a12.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 20:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060652; x=1781665452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1xEqocq617yA3Nhtp5XMsU0wUBI4nxN63OSaZK9x2k=;
        b=dNyad0LHKEqVJzUvnHWyCciLMxrEsab/vzCR1cqnEEet80xodzdBrfardNIiNTDYsJ
         ClRZIOewDtqEJ7PC5KtMXHCNc13b4CNaP6pb90hi4pJ7cMF1h5W5E2jA1+lfhRq/Ml4n
         sSHdIUSdqVMygnOu4s2U9OCTMWUkCGgsQUQE4oEYUukIHlXchToSgPTWj4wct4c0ALUg
         Niw2rh0EcscKvF6orI5FGK+RyXs4bGHZiIjU1ArHY8ecqIuKXiKdOxXc3Hh36JkeuD15
         3jV57LTlIgVr9vRhLLuLzenS1SnUmY9sEMk4qnrSdcEKkLGJ9WcH2Cu2S5/fClnMXW2A
         9ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060652; x=1781665452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1xEqocq617yA3Nhtp5XMsU0wUBI4nxN63OSaZK9x2k=;
        b=qnjE3Hd+NAW61MsKZsqqrMC1unn8TFb4g5ZD0MrkI7iNxH/Un6NhNO3rj3mskepbKI
         EK1sv/LMBLM4od9w8NrOyxIQ2bCynyXhKo2AkE3IkKF1mZuOWtSvxZHgFV2KXMBKqU26
         a+U3MGEY9KFNVzQjLIEzf59MkZXAq03PQ3E9TU0EJj/NCAi1wLJjQpnSnX4P6DfmIIpZ
         rh/MMhMFlJv4mRUUkHjHQcq69AvgHQH74SHdyuyYsG3ZoTLNYeUhs4wi1rQdrt6Ur1gF
         HGLOEFrglAxwdd3+Z+CpQCXut3R2rpGhkYiPAyIdD1YhKFQU2hITM/visjLvNjCcECQS
         m2ew==
X-Forwarded-Encrypted: i=1; AFNElJ9CFuNz+J5X02VDEbL69AXGX5dn5ceeUpvpyPwQaGU22ETz01MVvBTb5doSgRsCxicOZJ699CvCc1f2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5K4uiBxEUyQMQFvT9cNjKbXC7cqdqVz3N5+krrs5kfDr3sMc
	qQ/ksI0Q17ivUPDiiwZ85kSz6Fb8Gkmu/+bdrdYnChGKkS1LsCiZHTEh
X-Gm-Gg: Acq92OGD4/fhPrNJK+uHQ4yr0Mq7McbdxjVfATJYoMNXVk6yQmBQN+ttWcU15Brb7Z+
	kORlDszqQcIbkexwVMU9EPruHE02ZXW1VqtRDcioVF7XHl/0FJfMpDX4fsaWu1X3iubTOdokIm1
	LStJ/JxCqKl3Dt0eAjp2ggeHekFaewe9V4xBuB+kMsVTJL+FtmK1rQSMWvdGz1de/8JZR+2RHw/
	otWTo3oRWwlmLEiGeOFvIKoFvyXFY1DDKw5DNPnBTHlROuYJJIQObHi6luDWMHk532P96g48LA7
	Hq0E3GcPjGQWR3Pj3cvY0OtKvYDCNfXRDV9b+n93dBY+OZRn3FQkXxlfY4Bd/LmUBHClZ0vWIK2
	OEqsfCrRmKH3wd1L5SciOeTNHcJMKasBVofcqceTn1tu55OrCmlpouEI1Nk2kv8MqShBhptdILl
	LnwBgFXb0DSBw7qsweqbFOmSCHL/AIEfpOnGNrP7wYcrJ8r8ytlZyCnrYmLs1gc8qqPnJrN3gJC
	ghknHP/mumHzF0GP4C2
X-Received: by 2002:a05:6300:6d8b:20b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3b4ccf4051dmr17145756637.24.1781060652242;
        Tue, 09 Jun 2026 20:04:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19927082a12.17.2026.06.09.20.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:04:11 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v4 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Wed, 10 Jun 2026 11:02:05 +0800
Message-Id: <20260610030208.2020275-1-zychennvt@gmail.com>
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

Changes in v4:
  - Patch 1 (dt-bindings):
    - Update example interrupt number.
  - Patch 2 (driver):
    - Remove redundant spinlocks and fix 'irq' type to signed.
    - Fix target address recovery in ma35d1_i2c_reset().
    - Refactor IRQ handler for multi-msg reads and NACK/IGNORE_NAK.
    - Fix timeout UAF via explicit IRQ disabling during recovery.
    - Drop IRQF_SHARED and fix PM paths in probe/unregistration.
    - Limit suspend/resume wakeup logic to target mode only.
  - Patch 3 (dts):
    - Add missing i2c0 node to dtsi.
    - Switch SoM configuration from i2c1 to i2c2 with updated pinctrl.
    - Add nau8822 audio codec node under i2c2 on the SoM board.
    - Drop redundant i2c0 alias and clean up dtsi property ordering.
  v3: https://lore.kernel.org/r/20260512073953.564323-1-zychennvt@gmail.com/

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
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  20 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  72 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 778 ++++++++++++++++++
 6 files changed, 947 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1

