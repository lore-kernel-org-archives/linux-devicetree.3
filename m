Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63EF425866
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128584; cv=none; b=MjXa/TtF3YoqMJEh04JtpvIKqHKQTISh13Q+t3/4WZZ3mOMhfoqeFDEZURT7fo6SAMW0jwEqgTC/E0d+jdBC+X4hMQ4jinwNfEjNuUuOMPexj2uJT9YQGoyt5aXkoloh32/rPJVATYUUNsTTv+fazdkA4MDqfcd/M4p+/S1jWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128584; c=relaxed/simple;
	bh=3Lf9/ZBYWeL+4/ez2XsKVnoBh3Gb190orge+HRb/NcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LXjEBmy3ePpQr/oevcwZPS0RmFeHTuXk5w0GEul9iHWR3a/Uzi71RgfK0isEs0Nt89PAiOHqJxr0c/qbIDkikla9ef1L1zeSoez5GMsFVrfHr+pVBtNL5H0fUkP+KrtIvFyenVSySPETRyLRMnO13Qjm2WPOiHjfyoF00F0uhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mj0d8GUX; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj0d8GUX"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so283225a91.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128582; x=1787733382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOhYCONyOlLqZ7Th3lMilNB9DV3vW0wUhGS0m5kXWkU=;
        b=Mj0d8GUXP5gh2Kphg6ptrQ0y0ep71TkdtChXWYqV9kH7eo8drg38Rn8p5a+5Ok2CJD
         vmKL6/K42Ang4inn293FfpgWozastgA5HONzSqh4qNtQevy2U5KDjnoc52pN+d1QM4+d
         CLeAvB9evilc8AOfrlguj66adtG9UsSHbWfimK3mvLsVfXKoh9aF9lAmPo+NpjQYhr59
         H2jZiIDzWOB7Xl4ErXXxVAfeX2j/2LbYJr0GqyrWJFByluoHp0K78Qn/udxkEH/yQrG7
         Cm6o4534CilbYMts0NOaKHia9ndHddIlUEPaqOtD251TLAv/ULhf0AVx4VYwWaUM/n7Q
         3LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128582; x=1787733382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOhYCONyOlLqZ7Th3lMilNB9DV3vW0wUhGS0m5kXWkU=;
        b=QkFZx7AKpB1tcHOn/dsVOhDBmYq7dESUiIB0ERMH8Suoyj5Cr2DWEjx5Kr0QHeqls0
         Uo8yEU4cecVYrDz+z3VNjhMnWxBx2hxXT2y25ftI12FV3QPPjgs5AQL4VAlsaBuz5YHI
         as4jc3s7mwH+6gRIb/fELS3z46h+4vNE7JUd+SJ6cAXlJNElERs1VQmOg/f4GNoNOArO
         LPb06iL4DYdQVnI4Or5g6yeMwLuG4UzH+SUqXDuQFE4zheIEhTKApB2y9nYM4A36apKb
         k/lKKQ8zaNb58/S/7UK331lMsg0PSOH0buVpP3/FOA2czQsnKCG8XUVa2V7qFtZgpuXo
         9pZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rprfb4y0+bXGniM0WSk5dS52Bz8fwT0RxKwMopQTYxHmTZlU04G+l2ZI0JfxDgWOXkqRIhw2sMLoG5l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0iLssO/65mQxr4t+BYyPbK+TRFNeuI3Y/AOM/WlyiyigEpOXw
	/D1izTox8nFVjWdguOJCkkPPr3Hd8qVP9+nHRKKNcLE4+Jb1XH55ccSu
X-Gm-Gg: AR+sD10vzR07Bfidf0x9kI3ZzQHZLSHJiEU6gFnwQk0c9tfTurmcP80S7P4uY5+SAGm
	XMhHjARdI1TmHj84Uh2Sy9tCXaJOTbxEvU1aFZBoc7NIhhiPBvJIdcGGtcFjI4jpim7LyjiqSLM
	LOVzyfPwVL1JX/3sGF5r3hk3uQArLJI6sf2J4rlTbfyAKfMCbBEhVQCoHx2WUA620cv67NPbBqt
	vlRU0pFrclWoV84da/fu/iRan3KyI9wIR/dwcLd2bEeBB2/5WNL/LJd1jLO0wv5NDHHXkIAsmo2
	JNVpUZdh7qmwwabHhIa79CsuIeyszy3pBvDjqg6ZFcUtKJdWe0IlSoFvGqaHiV3TKIF/HbYDu7c
	3eZJNHbTNl50xwHwun9GkW9B9sqH/D+11voyWpqErDQb0hLeoWN4YB8gwpyROu+2zl59dYf0sEG
	5ZN6b+QqxXvmaSkGVU/5k4GqBOrARmWQnpf86SFukvmknyp228LHQLaShQ1FyOBOY=
X-Received: by 2002:a05:6a20:a126:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cd011a0cfbmr5624816637.14.1787128581986;
        Wed, 19 Aug 2026 01:36:21 -0700 (PDT)
Received: from ubuntu24.. ([85.149.220.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm332268a12.14.2026.08.19.01.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:36:19 -0700 (PDT)
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
Subject: [PATCH v4 0/3] tee: add MbedTEE driver
Date: Wed, 19 Aug 2026 16:35:56 +0800
Message-ID: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
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
Changes in v4:
- 0002: Move reserved-memory region descriptions into
  memory-region-names property (Rob)
- 0002: Define memory-region-names item order at top level; keep
  per-branch name count constraints (maxItems: 2 / minItems: 3) (Rob)
- 0003: Harden ring and RPC handling against malformed input:
  - Validate both ring indices; bound async ring skip and resync
    the reader on corrupt framing
  - Enforce RPC handler modes (COMPLETE_REE async-only, supplicant
    commands sync-only)
  - Reference-count rpc_call objects; fix use-after-free on
    interrupted calls; abort and free leftover calls at teardown
  - Add XA_FLAGS_LOCK_IRQ to the rpc_calls xarray
  - Fix supp_recv/supp_abort_all race; malformed supp_send unblocks
    the worker instead of hanging it
  - Reject TEE-changed parameter attributes
  - Report the wire error on failed supplicant requests; fail
    oversized requests instead of requeueing them forever
  - Wait for R2T ring space with a bounded backoff; bound
    COMPLETE_TEE retries and stop them at teardown
  - Match the supplicant context when dispatching supp_send
  - Access complete_work_pending under ring_lock
  - Serialize RPC submission against shutdown and reject new
    calls once teardown starts
  - Quiesce all RPC activity before tee_device_unregister() so
    parked waiters cannot deadlock teardown
  - Bound non-interruptible RISC-V waits so a hung TEE cannot
    block ioctls forever
  - Track closing state on sessions; reject concurrent
    close/invoke/cancel races
  - Quarantine TEE-owned call objects at release instead of
    risking a cross-world use-after-free
- Link to v3: https://lore.kernel.org/r/20260720073558.799755-1-xing.xl.loong@gmail.com/

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

 .../bindings/firmware/mbedtee,tee.yaml        | 102 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/tee/index.rst                   |   1 +
 Documentation/tee/mbedtee.rst                 | 155 ++++
 MAINTAINERS                                   |   9 +
 drivers/tee/Kconfig                           |   3 +-
 drivers/tee/Makefile                          |   1 +
 drivers/tee/mbedtee/Kconfig                   |  20 +
 drivers/tee/mbedtee/Makefile                  |  11 +
 drivers/tee/mbedtee/core.c                    | 260 +++++++
 drivers/tee/mbedtee/mbedtee_drv.h             | 289 ++++++++
 drivers/tee/mbedtee/mbedtee_msg.h             | 219 ++++++
 drivers/tee/mbedtee/rpc_callee.c              | 697 ++++++++++++++++++
 drivers/tee/mbedtee/rpc_callee_arm.c          |  91 +++
 drivers/tee/mbedtee/rpc_callee_riscv.c        | 203 +++++
 drivers/tee/mbedtee/rpc_caller.c              | 697 ++++++++++++++++++
 drivers/tee/mbedtee/rpc_caller_arm.c          |  70 ++
 drivers/tee/mbedtee/rpc_caller_riscv.c        | 238 ++++++
 drivers/tee/mbedtee/shm_pool.c                | 105 +++
 drivers/tee/mbedtee/shm_pool.h                |  15 +
 drivers/tee/mbedtee/supp.c                    | 311 ++++++++
 include/uapi/linux/tee.h                      |   1 +
 22 files changed, 3499 insertions(+), 1 deletion(-)
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

