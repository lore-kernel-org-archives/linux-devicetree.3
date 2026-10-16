Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FBC30566D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112703; cv=none; b=WexPMxBGnHfn9zl4GtwMKA+KINPF6s1XsdoUSIk2HLft9Tct0I3TrwUArxOfx5d6z2eiX+WBQO3lxaomVNf3+HgPIAfjLelwAYGjz49KXblBljoMrpnDEgEsaF7coqrSiMOBho9LT3B5Rz2bDvVky+Eu5e8ym7wWWJ6QkSLlpi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112703; c=relaxed/simple;
	bh=ymnukeKylAcZafqsNYiiO2UX3W6zv2Eym51b82sqPow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NTvZYiHXmHxAOwKN9i4xkfR7M4jJBXdvHHA3f5PYoJFqAjSgj+RHt7vegFQIFaJPGi+E4LOfi/vW3q800olfETxRTbNGMYE1uS1qcJdO+sdG3aVmOjUTQX+tEpf04nZUklP22cIS10XhSiI/fxmxvmY9lkCMeXaOCrkg0DB8phM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDkM7zee; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDkM7zee"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso265059b3a.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112701; x=1792717501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=syAHkvAn4YNYIcaHBObgsW1JOoqD1UVZ48XNPLhl2Qw=;
        b=KDkM7zeeCssHdMJOlC0EvMCOP0AFhJbGDyzsZZmnZ/SsnfJB7ZLgfrEZmdpQCM9O0y
         Ud/XOtqWp49ALfGbnHM95AUh7zcz75KstMVV5zOJLUc28k3yYj14jfkDPgV081F11/g7
         1MaSj3RivUT7hjzBATuRmWiec60z6aVCSA0Rwg0FsqwCfRbrBdU/THEW61VRPbxAwTK0
         xxA+jJ83vQbTOBsZXDriZ/TJ+Xg772+HRrNGhODR4GnwbGHCIK9DqsDy2mDFYCnLgum1
         hE70cmS+ZJ6yBGLbjs/DTbqfdn12/CzmMCb66+LOucu//bfLGQwyQfJZd9Kl6GUoHXIV
         /cMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112701; x=1792717501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syAHkvAn4YNYIcaHBObgsW1JOoqD1UVZ48XNPLhl2Qw=;
        b=QdTK5pecBtbjsb5XLEhiKr3yHKJQuvqFf97x69xFmLotVGR3TxtoA4PVm2iaDw3CIQ
         JPNpM6bwMBLEuhxUFsg4BIMTHb0z48LPeClB8Dvc7EYUm1EtFqwrdP6IOQutsNWNi0cf
         ASNUi/WO5fSHajVvXeQOyhFkJIkDiSg4UqHAGn8bf50s/mh9CiRUkyV6aqE2fvLMSN7E
         peyZuAYnQ7uJNp+QU1TyNthRNP1UrGb+skntX/udZrm+UJVg7tnLlBkJrHVGeToqSsM8
         M/Lo6z8j0CAFCpBaVbQpNHV3qAQMO4LOdNKvuyu2dNNs0eZm4dJYQlLWXhjOzweQSreO
         nr5w==
X-Forwarded-Encrypted: i=1; AKwUvBw/wvJZt6EdPa2VF36IUQeFPoijDmApp+F4f2Rphq8c6p3C7cfjXlI+9a34cXe6dsP1SnBZ4Bp9H+24@vger.kernel.org
X-Gm-Message-State: AFq9FYJb+BoT8zdAaG3jSCtHpOPP3vDKDWP0hYr9UyPxsUIjA9suoSCo
	gNVUbX3zFyJA1Ifv+cPdUSYSoQVnejD+NKiMSnadFjWP1i9dubneNxO0
X-Gm-Gg: AYBFou2tjwZTwLbh9Srd2obO0mvr3X6gXNlSn/k0cVGUqgd+Ei75LMB5Qlk4f0a5VME
	A5Oczk5gdq/ce1SwIQPzz5F6ci6e6cmwDnIUCX9fuWC8bfWAu5Pzl+5CRmftkS8f3qTsqsW8uBi
	k8mccc7qJOpkhR51XGXJQKq9Hf0l8AqdcQjlBor113734UfWeOlQJDbaPRKWFhV7RFRXCRZ93Cn
	pB8ceLKQsTc32LRh/19bpzI+oGGwyyKxXxkxsp22PBtgDdz4A7kVd1tzZYFd+iM+ZAjF19czhFD
	BpUnpBiW7BfcIIIfoBjx3JoRXMNe96FIIeubxYNtij+0Cp2z6MocAb4XL9aeDKD1k3BW51OO2Z+
	huFp19q9mt23vZhIpnFIObZkmezTOgeqPSs/nJv7T0l+BfqvDNjey8nQY/3z0LUi/D9mxbiV300
	rFSeJD2z+e6+oWaii3y1l4bgH8IGFdh6MojDm6EIxeRKET0MjD6z4TlTl29ftQSxC4+BWwbNvS4
	3xfEPqLycibOmUPbi+/yd16lOOlu7baXERs0OHHSDE7Pz0VmnyipmKj
X-Received: by 2002:a05:6a00:2e95:b0:874:708d:b620 with SMTP id d2e1a72fcca58-897c6e1be95mr18132833b3a.30.1792112700968;
        Thu, 15 Oct 2026 18:05:00 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e513sm302821b3a.27.2026.10.15.18.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:05:00 -0700 (PDT)
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
Subject: [PATCH v11 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Fri, 16 Oct 2026 09:04:45 +0800
Message-Id: <20261016010448.324856-1-zychennvt@gmail.com>
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
Changes in v12:
	- Synchronize IRQs while initializing transfer state and issuing START.
	- Clear wake-up control if enabling IRQ wake fails.
	v11: https://lore.kernel.org/all/20261001075101.489660-1-zychennvt@gmail.com/

Changes in v11:
	According to Andi's comments:
	- Prefix the remaining timeout macros with `MA35_`.
	- Handle errors returned by `i2c_slave_event()` by sending NACK when the
		target driver rejects a request.
	- Use `dev_err_probe()` consistently in probe error paths.
	v10: https://lore.kernel.org/r/20260921083753.1109826-1-zychennvt@gmail.com/

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
 drivers/i2c/busses/i2c-ma35d1.c               | 800 ++++++++++++++++++
 6 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1

