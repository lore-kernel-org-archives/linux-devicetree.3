Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01569433E6D
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005116; cv=none; b=hwQW6bVBy0HmcVgFJkQCkHweD6BnUk9y6o+Lo2vjpnZgmMi7SMuH2aqjgc4mAa4DU0qnCdWYa6T+CfM59SgkNVuWnYJYSDZYwwD1kW7yepppNxpvIz2xb1lmkketi3OoHnBrRWAHPE57oDk0nL9zTT8EnV5c3+sNbH48XJUDtFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005116; c=relaxed/simple;
	bh=vogw8/m1WBs8eRFkl3Qggb0JXZDIM+VoWFUkxzTU9pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/J8oerPgzd0aqE/HQS/2u+UlHvmsr6kn4tSPXC2QIaP2G2M4ZCefQBGdjh1fPeSErGI7NUQ8Dlf3ZC/kK45xUEID20Sffm4Hppz4Sqj58LA4rLW7Fivp+P9reMJHFdLC4XLrYDY6y38L2/b4eqeF3E9PrtNWiqakX6QzwsoioU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMvITVFg; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMvITVFg"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-4489b7aa0e7so130569fac.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005114; x=1783609914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUoKcMNp1i0OsjwBDMTVKkf2BV13qPTJjkx+a7eS6X8=;
        b=IMvITVFgSLf1kCwNe7ytSBw6wFNfDjkTLxrGHdsLQBOuubHnM4IxbSRUMPnuT/XVNU
         W+31jpc/swn8lygg2/6uX28A79/7NsTYNCUzQJbfkuJLIcTuGM+8/pQyvCjUqpv3tkAn
         8mVhzAA1GBwVA3nGZWpewZqU0qbijWpuN4zNKTUPGSxkTn0M0cp3BnqRiBN31hmwT9ON
         hevDemEKkWgk3LSEw6zKoYshIoo+SOm1lFS5dcuAnvrhUNj04hSUnx/fTKGbGx+MPGHM
         MZMO4zlErLjOPNe6NrrQs1Yv2rFGjeRbAe7W5eET+UmbVE8E34cAgI2HZZCVa2QRrpiK
         EHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005114; x=1783609914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUoKcMNp1i0OsjwBDMTVKkf2BV13qPTJjkx+a7eS6X8=;
        b=QbdVpgrMxwK1UkUIOq+uT25zuANgNGXiRJGIXzF1GLFVycqqcC1VnGqxgzu3h8jLNd
         3+eljY9eh0JsFyGLFUGSyGR7nFQ5BjNlyxNB8EjFtIrOuiotHdEkasP/tnLHFlt3TOYI
         ZzEC8tv0dP0XeoPeDsAizApadvrZS6+8SVxky6BWixFefWNEGTc5/okMQehzTTDEQzbt
         pp+Nzfqd1YhocyCfq97XqFNjI+mCwnv1P5tH4aMi4SjbhEa7GYC6xclOuRZCGynsffTE
         UVE5PeBhAyNhpmpHoXY1NyXMVDaKkFKj7nwVFMJZbw88Eubx4DoiAE++hBVIzGCXju1u
         l61Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6JN377pjtSdp8ij2GSVN4DaGu6nRRI1zCxFEfYs8Hc4bR7yVP+/ArENLQydpOTVyznOR0y3Nksuzj@vger.kernel.org
X-Gm-Message-State: AOJu0YzxliqYvR+TPc2ypDRYSCoc9QdWVC96f3+vip4n9UC5Mpsy/sCU
	QJGH+jn4P3qp+idJRS82ulTwmPPr1cGjoJMYxCVzozPgDtnWTjgLiSlc
X-Gm-Gg: AfdE7ckurslEd8zVFkRqhALpEmLHx1M1qI8T3AxcZ3cvn3j6OOkEt6SZ8CmNiMsAjwv
	jAMQv120FqZJ5nfY6mDQCHCtnzJdFOskLxRFkC6/1Flf7AVElst2nz0X9V2Zndmp/NJRm1Gr0q9
	UhxofKS9Yc8Y5HcwNRzx/wBcLM/+1RnmqvY3io59pMvoRIB0WTay3qKO5sk5+9tK2QtLAVmoNgB
	repjY8YBrj0tYoh3nh/gHNuKf6EJwJWcd7wYs315K6gF48PTQcs9w6tQ+MKSznLbxYCvxyyrmTe
	iAau9YuqnPy6psxf3/dv+cwYNxVpKOwN+7uLMRPVmPQtdlULLYV7vCqwr9VJrgaGSyCMe9JNdrH
	u/kb+Is0zmnVm+nsMZHcaERGmL3WLTlJTw5Ngv/64cQ3HPScmb7Ma26N+RgPk5bkjV1+/YmXiMz
	5XqGQ9HMrdutui0jtbeNfbxKO/11sXnXhCHHfuIjcCiZKOVvHn5eC3iHQ=
X-Received: by 2002:a05:6871:d3:b0:447:3be4:44d with SMTP id 586e51a60fabf-44cabc00880mr4009842fac.33.1783005113834;
        Thu, 02 Jul 2026 08:11:53 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbec9a113sm3094561fac.9.2026.07.02.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:11:53 -0700 (PDT)
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
Subject: [PATCH v2 0/3] tee: add MbedTEE driver
Date: Thu,  2 Jul 2026 23:11:12 +0800
Message-ID: <20260702151115.544016-1-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701132514.186953-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
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
Changes in v2:
- 0002: Fix DT binding review comments from Krzysztof Kozlowski:
  - Drop $nodename, "YAML devicetree binding" wording, property descriptions
  - Rename compatible string to mbedtee,tee
  - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
    rpc-r2t-ring -> r2t-ring
  - Add memory-region / memory-region-names to required
  - Simplify allOf constraints (drop redundant else-branch items)
  - Rewrite description to describe hardware/firmware, not the binding or driver
  - Drop all irrelevant platform nodes (gic, cpus, reserved-memory
    containers, reg addresses, riscv wrapper); the ARM example now
    uses bare interrupts (matching arm,sbsa-gwdt.yaml precedent)
    with only phandle-required stubs (imsic, t2r-ring, r2t-ring)
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

 .../bindings/firmware/mbedtee,tee.yaml        | 132 ++++
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
 22 files changed, 3190 insertions(+), 1 deletion(-)
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

