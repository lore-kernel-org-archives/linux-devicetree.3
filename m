Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B350C4519AD
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979894; cv=none; b=dQ3PPQGOs7A7P0lr/mrWmIb1+ahBjiKdX9gMWuY2vbt4HBvS8B2sY1DaY6bckmL18/n1T5psejEE3PXvwreASimr0Ttavr/2YZcJZqThmriST8nx34XleUnhDKSVimgROJlTWCGyz1AKNSgbZg1DWsZOil74E9onRLWe0jXJPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979894; c=relaxed/simple;
	bh=9ppgiylzdQ8XOR13ZsEkYbvHKg6Kqma3CrDXroZZGfI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QZWDvOfCdP1iOHJkIr+LXf8azdLDhRNzN2YtlXbgHY179jmX2QgtD6mvP5KRTW4mpFRxU9axTnA9KEw4nYdsrsr2kZrxH4r+Q/ehK43Y265iZAQ7dktK6A43XCwUM+dyOj4ZEPuj7lOKnTVVFE8TWsMtZ0dBwqntbNeX0aWlR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrEhFV6d; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrEhFV6d"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso23440395ad.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789979892; x=1790584692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvmNcp2BGzDYZW5Bhdvt0umZh/KqhVfSHw61I/uVOGs=;
        b=BrEhFV6dzrYma5gZTdA94HMle/+pu8QTwQzX0uuITSRDAt5a7Xoxy+W9mRGuiZabid
         ZIf2i3stRNO8BuycS1DYLML5XLwWxX1p8MsQGxTyb1vMc5MwM/tNjZzVotHOq7GWdIse
         gfJX+ok7YIjjbxEDCedLE7W6PUfgFbkf8MnSIbG/1tRSarut0o0hQxP6CuDT7fRJjhsW
         onJLfIpnxKPP1WfFbMfs2dF/SXiuwa4ZLL/SzcHBDGDfgyc0wO9f3QkgwlxxbjADxx5y
         C2fPq2r1ku5UVEpe/HI9hyG6yIsryeuppW3y89Y9k917P8eykUateBFoKtDwoEtl+p5z
         c8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979892; x=1790584692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvmNcp2BGzDYZW5Bhdvt0umZh/KqhVfSHw61I/uVOGs=;
        b=YBySNzX9qq/tJyp7Ds/Js1bpqD1VVUPfHHlwFTFzgPZ7s+kyZy4BLI/3zmt+AjCkyB
         0fu5UOwJub1VxGd7vrUtYe3LTJ+LRSATH0TYsZkJS/GwOTtnnI3xUyVuNx3G+zSv+ZCZ
         x97P6cyijZisG7jMuyFoC4tVf2xi1TYzRemlOWYV34+PmyajeNDtH7dWT8+KsrVf1awQ
         /24hxVMmYVgHWEoXEj1VW+iWzG4f70cFysoQahJ4basDAq1IUjO1XYvsVUXIYmKfvx3R
         l8hstR8m2fK8owv3dBzSSQyIqWpkfS6KotQe/9WfGH5fEmuALAkGSvcBCcOV+sC3S8nn
         Js9g==
X-Forwarded-Encrypted: i=1; AKwUvBxbLT2G+RKxV3gZtCjWTCYUt8gnPOfxvx7mce0zjxu1DFCtDOa/hU32R5CsdmsDmoiD0EVShOpl2+Qk@vger.kernel.org
X-Gm-Message-State: AFuF++nE/ldHfYVo31lv9AIMuNwQ7VRZ9nWttMezq5k80r05XUiA/vQA
	MWZMAukVRA5bxVdHPz7AaA5VFqrmxWT5B2DYMII++1OP83m5bfRps1vz
X-Gm-Gg: AYBFou0+Tf+O5L9P2TUeMpDeQFuJt31GkFQe+6HILpjmdVGcgLgVapk1oEH6KAuTko+
	zrA/SbvnHC7ehl0TK1hNk0BwhsuivgXIJ0X7FkcB9JZ1hcq05+yHpfK/CCUiIsT4H36RijsN3nL
	gru98LdcNHNiZ/e+fiSm1U1x6w5hmmKVbGR5cnd/v31/4ta30EdshrT9POlBt1Wk5C1BbBlLMbJ
	9iKFgV+92v6g307pelqEZycQ6NW6c/N69iYOhCS//tJfbLxMcBPenjFkNUow4DmSzKz1uTbe9Xc
	+/ubH1pgBwr54aoKd4Fr1g7YyyEv+WB0Zu7dYBSA7BUkJWsR0WmhPjMY01VuuWno+q7CgUwPiAE
	NwBAiHUqhMfIWXzwQNQnP5ZT/91sNmOarYF1utqhlm/CNKRBbGKKn1k1vZLJ8Xbnv4IF56jIfW6
	W6QcdAFHpa1+jzL225vYiay97E/iZZmsglgie5C01rfygjw3hy/5/jgYigB3pt2dCEnGA4uTsuX
	ZkMjQ+6QIYrx/XeHgIZpA1jFAEoRql1qiPLB1p5QC64OGtfqm1Aab57
X-Received: by 2002:a17:90b:17c1:b0:39e:3559:12df with SMTP id 98e67ed59e1d1-39e54aa357amr15593290a91.1.1789979891912;
        Mon, 21 Sep 2026 01:38:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca50694sm15121508a91.2.2026.09.21.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:38:11 -0700 (PDT)
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
Subject: [PATCH v10 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Mon, 21 Sep 2026 16:37:50 +0800
Message-Id: <20260921083753.1109826-1-zychennvt@gmail.com>
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

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
Changes in v10:
	- Handle enable_irq_wake() return value in suspend.
	- Correct clock divider mask and maximum limit to 10-bit.
	v9: https://lore.kernel.org/r/20260807060400.2047517-1-zychennvt@gmail.com/

Changes in v9:
	- Centralize SI handling in the interrupt handler.
	- Fix target mode comments.
	- Initialize the target transmit byte.
	- Add reset_control_deassert() during probe.
	v8: https://lore.kernel.org/r/20260804084806.1846570-1-zychennvt@gmail.com/

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
 drivers/i2c/busses/i2c-ma35d1.c               | 781 ++++++++++++++++++
 6 files changed, 950 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1

