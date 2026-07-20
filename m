Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61EB3B71C5
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532996; cv=none; b=ihsYROWZai7vt5umptiX0n+xOdHpmWz483oZPOjSoBrjkFhR2cRl5QK96j8bUuj1BU21zOUQhG6NBF/aaZ08PAAYi8s+xNW1x1HLtuTOLyhUHN8+x+Lh9INVu79KH+5rcEZSl9lSjc1CWHKsM1IbNEd/lHvNRKel39KM48ms45k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532996; c=relaxed/simple;
	bh=cjKepBcbD9hAekrXOBTw4Wtn0S80W82Ku9Me43dI9mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OeBK3o8SoNbxjABUSJDdyfcF1fpd03DgTEX8OowUTcdD9e4+Dz6sALFgSf0VRnH4F6e4dLW7cVrZLQaVEQPVnmIhA7YaKqeLpDy6V8ZOj/fHoYG/GmoNQojDLTlyAVD2MfH9dKg8YZlf2nulFB4voy76Mixq0Q7rqyfdZCqixAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pH/kEEX2; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pH/kEEX2"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-381086b2ec2so690990a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532994; x=1785137794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSGBn4Ublx73sYl2HPbFN0xtoAs6LbPrdTcJddm5B3g=;
        b=pH/kEEX2Wi58rXvtQv5BaVRGncD5ahD6QvCJMtw6NQS+GtKAnqXNr0oIgyLuI/I8wD
         /1jDx7+9JukGeGMO+gWugfrhNHUBKfaAZQRWPT99RQqav4yXhkz1MFxmD/G6htt0gPxN
         rHhxKVlT2uIIx4kMMu7Dow3iOJRwijTu6L3DQaJ5kSLQjEvQNBdWaPryRFdH0is0n+XB
         lHdL4p+flbz87YXPXOdMKc2jSlkampwuYoWLvfK3tsrZUZOq5YGguvse5ufRglDtm6IW
         K1z2pBALMFVMN8lKGCgUt84AKbCCmgBsISlx++wH48q081BseCGxegUsUOLl66PH0Ien
         E0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532994; x=1785137794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSGBn4Ublx73sYl2HPbFN0xtoAs6LbPrdTcJddm5B3g=;
        b=biyznx8IuvfRVgjQhE23x0VLt5vRVmbcahnX+3KpVmaGvyV/B38HrueaMg09Mz+Pua
         u/Gq/vrEOcZawoPP9fTBNsOfSPEPbmDo9ibR1r/RChUgT+kCgGeP/bI7C3wF6EOU1ZRi
         kWy6WZVYYo3yEkLBG5WI4y+whNMOSvXpkMEFv8KNSWNMT+eCkHfG07DFpEZzB2klIp0Z
         9SUVJ32SepihwAwTc2ldS5KPN5asxhx2d7jrYeoUMQTs8W8/CDyc8V/rHYW3q6sYycw2
         +tZlRheHWOJ8vHgjMoE20NTj0sdzrxctXD3EfvNEmHyALT35ySyJntjFfTVcFONfczuT
         /c/w==
X-Forwarded-Encrypted: i=1; AHgh+RrDof9h2BOuHaCEcBRPymEp7dd7ajKSmiFu33MfBu4d2/BVp05rquFh0NUsjfKkzr8EQSvW+FHHDyfh@vger.kernel.org
X-Gm-Message-State: AOJu0YxwptV+Vb/YsnVnUCy110j0pxuwq0V1sL0yNUuQ3UGuPHPuvquU
	qYf+aORMicR5kw7ol38RD29GiWnzYD/i49pypBfiv6FRbvYfp2ejyMGh
X-Gm-Gg: AfdE7clBBkyigoZ7FZ/VVzrFzHgqrOzbpaXazk9oru5shwTv9uDSomdvz633BRZ+SIa
	3+O2dhg1emIjnE4Ma54oBbKNjnSy5TmDxIszwW39NCetO14Tz6vXnqgq5VRauMrCbGeIkYgNXY7
	MW9k0y/2S+OhhTNI68Rd/hGkVVVH+z63LxD7gofiiV4Pp7AjqKUQKG2MFjtdft2W15kgh1CS31e
	HnqOmM4X8ie5wAFu4guxBvdJzqbO0qqYiBssS4DBfUWNmN+qxJYxnb9VKj0H6YV9L94bexWiuni
	93qWoU0uATW0ZD3a4WXZ3FUefgK4RCt1zlu34F8VuRokejoDYmpUDGiMLwnrFn7Joplpp5nuLpo
	xIw3oUzDAERtDzIu7HYlUDud5Unc4SF4qM/12gYaQCDNXaCjB/f1AVCBGwr559EcvvV6r5DOOAn
	jAATE=
X-Received: by 2002:a05:6a00:2289:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84c28c2daa4mr13302524b3a.32.1784532993870;
        Mon, 20 Jul 2026 00:36:33 -0700 (PDT)
Received: from ubuntu24.. ([216.23.123.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm5210536b3a.20.2026.07.20.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:36:33 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v3 0/3] tee: add MbedTEE driver
Date: Mon, 20 Jul 2026 15:35:54 +0800
Message-ID: <20260720073558.799755-1-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a Linux TEE driver for MbedTEE, a Trusted
Execution Environment for embedded systems
(https://github.com/mbedtee).

Two RPC transports are provided for systems where platform
firmware or board configuration has already established the
REE/TEE separation before Linux boots:

  - ARM/ARM64: SMC calls and GIC SPI notifications (TrustZone)
  - RISC-V: shared-memory ring buffers and IMSIC MSI notifications

The driver implements the TEE subsystem interface (tee_driver_ops)
and provides GlobalPlatform TEE Client API support, dynamic shared
memory registration, and tee-supplicant support for REE filesystem
and RPMB operations.

The series is structured as follows:
  [1/3] dt-bindings: vendor-prefixes: add mbedtee
  [2/3] dt-bindings: firmware: add mbedtee,tee binding
  [3/3] tee: add MbedTEE driver

---
Changes in v3:
- 0002: Drop all phandle stub nodes from examples.
- 0002: Remove redundant required: - interrupts from then branch.
- 0002: Simplify title and description.
- Link to v2: https://lore.kernel.org/r/20260702151115.544016-1-xing.xl.loong@gmail.com/
- Link to v1: https://lore.kernel.org/r/20260701132514.186953-1-xing.xl.loong@gmail.com/

Changes in v2:
- 0002: Fix DT binding review comments from Krzysztof Kozlowski:
  - Drop $nodename, "YAML devicetree binding" wording, property descriptions
  - Rename compatible string to mbedtee,tee
  - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
    rpc-r2t-ring -> r2t-ring
  - Add memory-region / memory-region-names to required
  - Simplify allOf constraints (drop redundant else-branch items)
  - Rewrite description to describe hardware/firmware, not the binding or driver
  - Drop all irrelevant platform nodes (gic, cpus, reserved-memory)
  - Add maxItems: 1 constraint to interrupts property (Sashiko AI review)
- 0003:
  - Fix supp_release incorrectly aborting unclaimed requests on close
  - Fix potential tee_shm double-free on supp_recv error path
  - Fix async RPC ring skip leaving orphaned payload bytes
  - Fix COMPLETE_TEE retry to also handle transient -ENOMEM on RISC-V
  - Fix session leak on close_session allocation failure:
    release kernel resources before sending RPC

---

Xing Loong (3):
  dt-bindings: vendor-prefixes: add mbedtee
  dt-bindings: firmware: add mbedtee,tee binding
  tee: add MbedTEE driver

 .../bindings/firmware/mbedtee,tee.yaml        | 109 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/tee/index.rst                   |   1 +
 Documentation/tee/mbedtee.rst                 | 155 +++++
 MAINTAINERS                                   |   9 +
 drivers/tee/Kconfig                           |   3 +-
 drivers/tee/Makefile                          |   1 +
 drivers/tee/mbedtee/Kconfig                   |  20 +
 drivers/tee/mbedtee/Makefile                  |  11 +
 drivers/tee/mbedtee/core.c                    | 236 +++++++
 drivers/tee/mbedtee/mbedtee_drv.h             | 269 ++++++++
 drivers/tee/mbedtee/mbedtee_msg.h             | 219 +++++++
 drivers/tee/mbedtee/rpc_callee.c              | 618 ++++++++++++++++++
 drivers/tee/mbedtee/rpc_callee_arm.c          |  91 +++
 drivers/tee/mbedtee/rpc_callee_riscv.c        | 203 ++++++
 drivers/tee/mbedtee/rpc_caller.c              | 532 +++++++++++++++
 drivers/tee/mbedtee/rpc_caller_arm.c          |  66 ++
 drivers/tee/mbedtee/rpc_caller_riscv.c        | 192 ++++++
 drivers/tee/mbedtee/shm_pool.c                | 105 +++
 drivers/tee/mbedtee/shm_pool.h                |  15 +
 drivers/tee/mbedtee/supp.c                    | 310 +++++++++
 include/uapi/linux/tee.h                      |   1 +
 22 files changed, 3167 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
 create mode 100644 Documentation/tee/mbedtee.rst
 create mode 100644 drivers/tee/mbedtee/Kconfig
 create mode 100644 drivers/tee/mbedtee/Makefile
 create mode 100644 drivers/tee/mbedtee/core.c
 create mode 100644 drivers/tee/mbedtee/mbedtee_drv.h
 create mode 100644 drivers/tee/mbedtee/mbedtee_msg.h
 create mode 100644 drivers/tee/mbedtee/rpc_callee.c
 create mode 100644 drivers/tee/mbedtee/rpc_callee_arm.c
 create mode 100644 drivers/tee/mbedtee/rpc_callee_riscv.c
 create mode 100644 drivers/tee/mbedtee/rpc_caller.c
 create mode 100644 drivers/tee/mbedtee/rpc_caller_arm.c
 create mode 100644 drivers/tee/mbedtee/rpc_caller_riscv.c
 create mode 100644 drivers/tee/mbedtee/shm_pool.c
 create mode 100644 drivers/tee/mbedtee/shm_pool.h
 create mode 100644 drivers/tee/mbedtee/supp.c

base-commit: 03e2778d1f11de9260543f969e9e888a1c2bf830
-- 
2.43.0

