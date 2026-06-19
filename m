Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F462DB785
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781880385; cv=none; b=chqHGieZ08WbXObMqWfq0pWtp048kGhGcqmCDNrI42a2VWZIWx0ryL/7mmhxmXt5qcycH7JG9o55p3cNkq/Apm/p4L1EvfOJYWYxEiqt0p2N71MrHSZzPfZS34b/gGcNc6zgoEc3ls9C15jMrKY9UWLRQ6hlOcHa5kG4HpSfhKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781880385; c=relaxed/simple;
	bh=3EhpEA6nURQjmwHD2Zqh6iWf/fAUNhpDSWfRhEvMV2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BfqS5v9Y4iYVZRQzWPCybdIn6FxiDJRy6rvBb5evp2ABEJD7DP7hbVxiUwM0+drT9QvjAGP1w7ChmzN/iiSxToaf4cv8uDQ9dYb1j1AOD4BN0jf1hVVQ8+zC2mKCf6v+EHNemGNsm6y25dmLnJoF50YIiL90PAfLL7s5w0iW3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=FpN+TJwL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="FpN+TJwL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c40397e3caso21916495ad.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1781880382; x=1782485182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T18D9mw4DLCXc4Ho867PtqCc74sRM5SOMpvK4hFIC+I=;
        b=FpN+TJwLM5VFXV5Zx99De2JCPhJffMQdg8a3vPrptpd+xea/i3TyOrYJXxOGhnS5wi
         jUpkVYtz1eAqjzAo2p9oI9DOOSn4apOw/vB689R7nt0w9UQMZtMpUxFiLsfMwyyYV15s
         s2JFnhALEJB/BgGXhcxXM/kZZTCHVM2fpfT6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781880382; x=1782485182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T18D9mw4DLCXc4Ho867PtqCc74sRM5SOMpvK4hFIC+I=;
        b=N1vsmXH4Nev0/mDVtGTjGkpdIVtXIXs5pjhbXXmkoEAfB1TP6wkfasdSw1rSDHEvWs
         JKsULUh53A+gwrCMV/nHWHQQLJ0hH9tDbafZPvS4M64EHC589udhH38U3PDp6oD5ZNP7
         SPQqf/v3aOPfXdD2u41I+gykaaza+vzOxz4cbZwmpshxRQ9m/Ahd/jAQW1C1pnb0i9/3
         9ouM+5D2XJXcow6ATjbGphemSofjLaf9Y1/kS9+jtTINg1lbzlQj0zhP/dm2/5Lt3TYQ
         pMxux6aXWIP/PE/FEeuEPIkbYGgl5FYV8tNBtwMgezyNxub7yyVfATp/9H+FBRDRTMU/
         Q20A==
X-Forwarded-Encrypted: i=1; AFNElJ/wkgLpOWXL98fhNeI7GrnsBlNsNM747vDgREA/IfFq39cB4Ur/ecCjcLNOmg5Sy68RrWz4h6KMjJNa@vger.kernel.org
X-Gm-Message-State: AOJu0YyybRJJ2zzadWt4V1h7mp1rqB8EGPYNn5u5QgSRMULcAz/BFmah
	WFLFlEhmzNiQQtLNDaJQeR2dNPY5TQt9EraXaEA1JrgAKspz9cSW0nGeWK5pm8o2ouM=
X-Gm-Gg: AfdE7ckuiSNqR4Su+KGriGVAE5rDBWHJ2qEfyUnMIQ7+aN86q4PHHmgTaVpHhIqInVp
	ZRqQzpZIXvkSpxI8Q1cM4Y3JaoZhMiSdqW39iDq4gfqW5BOglvoe8fjcLgClpXp8MWP0oIu5mjt
	qzJbTPY1wTG6CIA1FJoCvu6zxZpJw5Rn6RAhnUQ4WnIPSZhP3RL/DyeIp6POwb4x6TPX1nKWyUQ
	wO65xUhkopoG9lAEY/KtdJC+ykV0b6wJkyauAIvOMH/+QYbGuGmpaLsUhOlVtYnGJzPBPLAOxLB
	J35x2OnfmZPdvlZO6fJLhwZgw51bhSeQjlGvf7Q2cpEyA9gcdSChK8rZzc+zlCyZJ/IYumloUhp
	yNceTJG7dLltb+9neflMOUP9Lj9XU36w3GY155TNZDtCzbLYEIyRKyfQZFJUagdBmmBsRR6ZI1p
	CjWx0bSaexpPmbg5Dgi7BosWzZv8yD5y2ZfULT0N9a5w4EuFMq6cNYSlQHYHsHL+p2TW1hbUxbO
	0FeG6GtcTP1w845IQeMIhaNGp3/0gyKRnnu3JGyILhy1nqkJ9STQYbT
X-Received: by 2002:a17:903:110c:b0:2c6:bbc8:3a73 with SMTP id d9443c01a7336-2c725d1e9dcmr29753745ad.15.1781880382362;
        Fri, 19 Jun 2026 07:46:22 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720899fe5sm27163595ad.16.2026.06.19.07.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:46:21 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v14 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Fri, 19 Jun 2026 20:15:54 +0530
Message-Id: <20260619144558.1868995-1-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the driver for SPAcc(Security Protocol Accelerator), which is a
crypto acceleration IP from Synopsys. The SPAcc supports multiple ciphers,
hashes and AEAD algorithms with various modes. The driver currently supports
below

hash:
- cmac(aes)
- xcbc(aes)
- cmac(sm4)
- xcbc(sm4)
- hmac(md5)
- md5
- hmac(sha1)
- sha1
- sha224
- sha256
- sha384
- sha512
- hmac(sha224)
- hmac(sha256)
- hmac(sha384)
- hmac(sha512)
- sha3-224
- sha3-256
- sha3-384
- sha3-512
- hmac(sm3)
- sm3
- michael_mic

changelog:
  v1->v2 changes:
    - Added local_bh_disable() and local_bh_enable() for the below calls.
      a. for ciphers skcipher_request_complete()
      b. for aead aead_request_complete()
      c. for hash ahash_request_complete()
    - dt-bindings updates
      a. removed snps,vspacc-priority and made it into config option
      b. renamed snps,spacc-wdtimer to snps,spacc-internal-counter
      c. Added description to all properties
    - Updated corresponding dt-binding changes to code

  v2->v3 changes:
    - cra_init and cra_exit replaced with init_tfm and exit_tfm for hashes.
    - removed mutex_lock/unlock for spacc_skcipher_fallback call
    - dt-bindings updates
     a. updated SOC related information
     b. renamed compatible string as per SOC
   - Updated corresponding dt-binding changes to code

  v3->v4 changes:
   - removed snps,vspacc-id from the dt-bindings
   - removed mutex_lock from ciphers
   - replaced magic numbers with macros
   - removed sw_fb variable from struct mode_tab and associated code from the
     hashes
   - polling code is replaced by wait_event_interruptible

  v4->v5 changes:
   - Updated to register with the crypto-engine
   - Used semaphore to manage SPAcc device hardware context pool
   - This patchset supports Hashes only
   - Dropping the support for Ciphers and AEADs in this patchset
   - Added Reviewed-by tag on the Device tree patch since it was reviewed on
     v4 patch by Krzysztof Kozlowski and Rob Herring (Arm)

  v5->v6 changes:
   - Removed CRYPTO_DEV_SPACC_CIPHER and CRYPTO_DEV_SPACC_AEAD Kconfig options,
     since the cipher and aead support is not part of this patchset
   - Dropped spacc_skcipher.o and spacc_aead.o from Makefile to fix build errors
     reported by kernel test robot
   - Added Reported-by and Closes tags as suggested

  v6->v7 changes:
   - Fixed build error reported by Kernel test robot
   - Added Reported-by and Closes tags as suggested

  v7->v8 changes:
   - Fixed misleading comment: Clarified that only HMAC key pre-processing
     is done in software, while the actual HMAC operation is performed by
     hardware
   - Simplified do_shash() function signature by removing unused parameters
   - Updated all do_shash() call sites to use new simplified signature
   - Fixed commit message formatting by adding "crypto: spacc - <subject>" to
     all patches
   - used __free() for scope based resource management

  v8->v9 changes:
   - Updated the software fallback implementation to use HASH_FBREQ_ON_STACK
   - Corrected dynamic allocation of statesize and reqsize in init_tfm
   - Fixed synchronization issues in the digest request

  v9->v10 changes:
   - Fixed unused variable warning

  v10->v11 changes:
   - Removed the redundant crypto_alloc_ahash in the init_tfm function
   - Removed the redundant crypto_free_ahash in exit_tfm function
   - Removed the redundant crypto_ahash_setkey call in setkey function

  v11->v12 changes:
   - Removed do_shash() and switched to lib/crypto API in spacc_hash_setkey
   - Dropped support for SM3 algorithm
   - Improved multi-device safety by encapsulating handling within priv
   - Added memzero_explicit() in sensitive paths
   - Minor code cleanups and style fixes
   - Algorithm registration cleanups

  v12->v13 chnages:
   - Removed all the sleep function from setkey function
   - Added shash implemntation for aes algorthims

  v13->v14 chnages:
   -Added fixes based on the reports by Sashiko
   -Removed the spacc_is_mode_keysize_supported call from do_one_reques

Pavitrakumar Managutte (4):
  dt-bindings: crypto: Document support for SPAcc
  crypto: spacc - Add SPAcc ahash support
  crypto: spacc - Add SPAcc AUTODETECT Support
  crypto: spacc - Add SPAcc Kconfig and Makefile

 .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/dwc-spacc/Kconfig              |   87 +
 drivers/crypto/dwc-spacc/Makefile             |    8 +
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  904 ++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2464 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  849 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  276 ++
 drivers/crypto/dwc-spacc/spacc_device.h       |  241 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  374 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  114 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  328 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  612 ++++
 14 files changed, 6309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile
 create mode 100644 drivers/crypto/dwc-spacc/spacc_ahash.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_core.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_core.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_device.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_device.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_hal.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_hal.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_interrupt.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_manager.c


base-commit: 6ea0ce3a19f9c37a014099e2b0a46b27fa164564
--
2.25.1

