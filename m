Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB694457D2
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833553; cv=none; b=LgKpGqAqExrHOdU//o68exV7aGZGeIhJ5Tiybeh5irgDxLGJPIh0ZIW5pNsq/2eWKqGkorLK+g2Yv0ceuKeSYyKcbPXXYDNqct8muyHb8F5Y78ljoM2Kaf5mNPfAgPw604icoKcL0fn5hsTgEgake2zeJb2vB0GfTBWCNEbVWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833553; c=relaxed/simple;
	bh=AZLLKK2JLXMJ437q0AzZWLhJPqydvuPfLRq4pZPhCmI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UNt9clVgbLH7UJp99c3y8aL53eVoPAgRyF5+hbtVePc7/mPXawVTihLgbSBV5/PTY0jpFmYtwkGOh9EFiGzIMotdBK87l/5rAJlUY7ZFpk8KoNvxfKNtd3O0lcCK9hZrXo5J+Yx6n0PzrRkqhtaMMLgeknias7AlR+EKPgRmEHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXjVDaU2; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXjVDaU2"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1800852a91.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833551; x=1786438351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06KxuYZYGUvdwJLxO6YakdqqJzGpR3ZKZOXLQyVhILY=;
        b=NXjVDaU21KR0S5YS7bIwWMiKwAO/24FIRMljpTL1DS0ovROLVGAzPdOVszHQ1x1lJr
         LpGLRp768Sa3b/82766s4yEpO0GeVeKBmK1QdI5IxtAi3VLFXgEnEbESvhsNI4Qirmav
         zAK2AXSufUXM+IAaQUo5/YYwKSNuxcjXn+EvhzvhsgnONTGMF3HMoPyMYyCGIKx+Wznq
         YHm8NiwlTdWl/8ACBUdDa31y96cA+hQU9rK6PkXYMqjzylIoF4cRSyh8gNxSrYObmQ2a
         2Fcf5q4rvvWrUQAULCgN9vm5Hv6BzKDV9i/EBXTCbVeyhrpImMHVpiWYRWrPjr/6ze7j
         5X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833551; x=1786438351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06KxuYZYGUvdwJLxO6YakdqqJzGpR3ZKZOXLQyVhILY=;
        b=QXeXOCh5f6SRoWEk5eey/36YLi/UfCJmL0xwxKRV7sJNhGaheZhCvm7jGGoPd5Mj0s
         xuYSM9fCC71HfuGQNV4MRpqnkFOmM8z8Bkt3HY/PO3ANkIR/8uV/cSTeSLERR6C+8Ffg
         RsHixUmnlHCvVpEGBk0ZeLgYWMm/LY/qtKR4JF/1OhWRQ9TAfrUV/jXwJFF7XWbaPPic
         UD463GfqaUz9r1V9N0AOm/BnuJCeL+FdyFJ9YIpwhfb2QArk6sj118f1IjN+28DyNUQt
         slYZkqcalp3nrd0Z3plPDw14R62x+++uPX8oG+pH7pjX9KSD7CnLFAQt2tzEMFAR7lSG
         G79w==
X-Forwarded-Encrypted: i=1; AHgh+RouycOy3KVg+RrnWywh5TMvgOZHb5dZESWlx1wazAkzMp483+lLHnIyJGSwmNA6xUQhJWvecKUrH+AR@vger.kernel.org
X-Gm-Message-State: AOJu0YyhOAVg6cKR/wAo5DI6Qi6GCxrwcL+vjks1zrMGY8vTqHQKZw7i
	uCbY/fmHFEssom55nh3Jh/QZHIk/V4pyi9SCSVin6HyFaFmM5eFEy7MK
X-Gm-Gg: AR+sD13mNJ9163WUbdR9bOaolsERSuh964DpO3FFVkznF+rBEklA/sa5JVpcMOWSUpP
	9GfQALU5U5U9NvWkNtYNECednmcRzG3lMJXPJKQc/KIUV8hU6dI30oJPGUceQIhw0Pd8V1uIGlK
	huiToumAzKOTS1xFgot0d31Vq94nMhw1BaH/TX2EpR9LRAKDG30u5opVVSVeJN06fyFWOHB5n0n
	cHBLuQ5yd3Q6imHQnP05yavfJomBEzFdXAttNoik+RtsXrRSBzppHssJA4j+OS8YrnlO4qhxt6b
	Fht22x72xCqg73ZOZPfLwv18ukr6JDbYeA5Afg0MCUXnn8Z1E9NhxGdExrxozoFJTwCWPZmkQn2
	3mN/1B0gHBRcPrRgljvYX8qH0kwvJvK0vOJXq5WDEoU9YW5vLvtXhUO1VuhIObHSZIVW6FmDQo2
	KYTZ/vKMeXXwxFn8KA4XsE6EUb4FvtQtt7Ioi1dCjNinplaSlpwzghoGBCW1Ml/+FDwJAajKA2A
	AKlfUgNMhvVQQfi1d5PdzhXJqymLuE0d+gvKSBn7/0auAc=
X-Received: by 2002:a17:90a:e7c4:b0:38f:23d6:b4b4 with SMTP id 98e67ed59e1d1-38fbc5341dcmr12857447a91.22.1785833551137;
        Tue, 04 Aug 2026 01:52:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffb36dsm1012000a91.7.2026.08.04.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:52:30 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v8 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Tue,  4 Aug 2026 16:48:03 +0800
Message-Id: <20260804084806.1846570-1-zychennvt@gmail.com>
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

Changes in v8:
	- Remove rpm_put avoid duplicate processing.
	- Add synchronize_irq wait for interrupt to finish before i2c->target = NULL.
	- Add ma35d1_i2c_restore_idle() to handle bus errors or spurious interrupts.
	- Change return types of TRX helper functions to irqreturn_t, returning
		IRQ_NONE for unhandled status codes.
	v7: https://lore.kernel.org/r/20260727081859.1737223-1-zychennvt@gmail.com/

Changes in v7:
	- Disable IRQ before clearing i2c->msg.
	- Support	CONFIG_PM=n, and simplify runtime PM setup accordingly.
	- Remove redundant register access in runtime suspend/resume callbacks.
	- Defer clearing i2c->target until after pm_runtime_put_sync() in ma35d1_unreg_target().
	- Enable interrupts alongside I2C enable in ma35d1_i2c_reset().
  v6: https://lore.kernel.org/r/20260720030616.1067660-1-zychennvt@gmail.com/

Changes in v6:
  - Patch 2 (driver):
		- Removed dynamic IRQ toggling helpers for simpler interrupt management.
		Based on Sashiko AI Feedback:
		- Added zero-length read quirk.
		- Set i2c->msg to NULL on timeout to avoid use-after-free.
		- Cleared hardware registers on target unregistration to release the bus.
		- Protected suspend-path register writes with a spinlock.
		- Validated clock-frequency to prevent division-by-zero.
		- Removed incorrect I2C_M_IGNORE_NAK handling.
		- Corrected a comment typo in the receive data path.		
  - Patch 3 (dts):
    - use a generic functional name audio-codec@1a
  v5: https://lore.kernel.org/r/20260630012106.3616821-1-zychennvt@gmail.com/

Changes in v5:
  - Patch 2 (driver):
    - Add spinlock protection for MA35_CTL0 register access.
    - Add NULL pointer check for i2c->msg in the ISR.
    - Use devres-managed cleanup (devm_add_action_or_reset) for runtime PM.
    - Use pm_runtime_force_suspend/resume() for Controller mode 
      system sleep.
    - Control I2CEN bit enabling/disabling via runtime PM.
    - Refactor arbitration lost handling in state machines.
    - Remove unsupported I2C_FUNC_PROTOCOL_MANGLING flag.
    - Clean up readl_poll_timeout() parameters, retry loop, and
      unused macros.
  v4: https://lore.kernel.org/r/20260610030208.2020275-1-zychennvt@gmail.com/

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
 drivers/i2c/busses/i2c-ma35d1.c               | 777 ++++++++++++++++++
 6 files changed, 946 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1

