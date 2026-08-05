Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A278356770
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948517; cv=none; b=DoCaM8RJLoBQiLOS+kRh6MeqldApCDXPzhBkJu0klMW6vozMC1Wv5LyjxF1oYbU7o2MPLKKGuTAYTWgWzrSggGdo7tp4phHyRwBaHX4Zy+2JxcRW32bnvlvQlop+ACgpArdTGoY5FtvcY6LFzEqqfi4RB4heUiwWr94+o9ogFGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948517; c=relaxed/simple;
	bh=DaQ1CjBILDpHeF928eixdDszqs0UqrrDWT2IQ6L3lic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GVHWonRXBaBmvekTOfu4182pPhtJsui2KYHpZ+SjqG4eKNduTWfHx8hy5AR2MtpPs6ykSjg4MxwbYqs3XjQlEK3qJXOQd02DO6Vcb8nY0Y0KpGi57CTmuei8OAtYjihbp2d6VJZzRu4HYILmXZ1XPpx2NU3K8cwCPERUg810KYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=oRhBa2ZQ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="oRhBa2ZQ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1331659a91.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1785948515; x=1786553315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCNvPcorb46KiMKQcGCt6fbiMMYVs2ziEQ1e0LPdVZI=;
        b=oRhBa2ZQQz51iJB/tre7YtgVhwt4aQFzwrTTh9QCfIzwLoFU3PubPYv/BzGHVLf+ER
         J6Zhb1hLHeoKo8GhK717ni/oHg/vFa6+K88LqNBkgPM/EG4KZs4lie+nPWlJRcL/aGgy
         dFgYjOTtSxsSNhzT/lQX3ag04YcllVN+LgfzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948515; x=1786553315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCNvPcorb46KiMKQcGCt6fbiMMYVs2ziEQ1e0LPdVZI=;
        b=EZWv4qdh6IWDawocZLk1CYh4nCjT7/KVghBMXsLN7ZYa16X/3N+y40Ysz59UHFenmW
         FoD1DEUj2Jv7kEQLAyJZHyxczC8LPGTDLN+fnCD8gPgyE+yFn7c6pIYEWN0RuxChptHp
         XOsNyqkJGk0zGUsXz/1hYX2C7mRLhCjwSfJGej9r70JeATigLwmiZVAVzzxcNor74Q5P
         hNH1xGwmaOn5XMHXcyAGasclwHwxNrHgoT/AoL77PTMuasuWkT6c3euX/LB/NGOMVf8n
         I8fOYp+RNhkTf8srz+/OykcStpJahiDOvVQmuGe+cNs6i0ce8QelMtRdV8KKEiO7h0jK
         YVEw==
X-Forwarded-Encrypted: i=1; AHgh+RrVQMM5huYkv2LjPd+IYTuAuxbNZtAx+wN24meNSUdFKcD3dAxZzYrw3zSh4goJy6X54liK+1WbVt19@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZYcxl8RD1IDk2BB1X7Bx3KK8c4R4LcpiSyUJ063anyvTgqzk
	FAqomLmgqA0D87rJlwsuQi+MPLBkWuiD5Bm2gNssoi70+jgm+hEe85Ynfy1LqLcgKPs=
X-Gm-Gg: AR+sD12zsiFTAODUuJVpkmT53f4P388hdb0zIhbEyTUw6tIFKkbks58AuQzdFiswOCh
	XcR/IrqjuJFOncs7bEAzjiq+6Oo5w+jbqIOWY2yBiOXL53WL7oAYcaO3t/8cH/00ZcJTzOFULkP
	btKe9s58sGVWk/tdD0R59d5At6SAWyHzzewvmjl/ZpZvl3y/BvKnBz7rHqZecYrQ9yFEcQ+YpUV
	1lZIFc98lW7D5Wd1pGJ9/bnEP2vKnrYeXItCH4n9ycffPkTxoPyuBt3afj7qenlI7SF5Xy/WdGm
	fLXAEhHFMReXo4nth3JEawY+G8S1EficUaITgs8inumUJBcbUeRTYym7tJrh5h4BNMiLsGpv9xH
	hINvUdoUlfwtLivXQrmWrPr+RbUBnVvvp6gStU+4h2JZN+t4fpnqBEOp28qUGC7sctmYWw/xFal
	QZc/XOVKam9xAO5QeTEFyU22IHR1fTofCTLuR4A/5hT5abc5JHHlTpWArq5gPM2nM3L2qoGZ97i
	k1PQTpKdC4bG7YNoQJVi90AKvEK+DCmP0AQBqxJcfX5uz7a2/893ZMGG8l9Dfl4Xld0bKUVlDXQ
	IzXs4xthMHGK21UORlHXzCreg/ls
X-Received: by 2002:a17:90b:3a81:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-3903c634c04mr7213408a91.21.1785948515546;
        Wed, 05 Aug 2026 09:48:35 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d7e4csm18358677eec.31.2026.08.05.09.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:48:34 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v20 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Wed,  5 Aug 2026 22:18:11 +0530
Message-Id: <20260805164815.249328-1-pavitrakumarm@vayavyalabs.com>
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

  v12->v13 changes:
   - Removed all the sleep function from setkey function
   - Added shash implemntation for aes algorthims

  v13->v14 changes:
   -Added fixes based on the reports by Sashiko
   -Removed the spacc_is_mode_keysize_supported call from do_one_request

  v14->v15 changes:
   -Added fixes based on the reports by Sashiko on 19/jun/2026
   -Fixed styling in the Kconfig

  v15->v16 changes:
   -Added fixes based on the reports by Sashiko

  v16->v17 changes:
   -Added fixes based on the reports by Sashiko

  v17->v18 changes:
   -Added fixes based on the reports by Sashiko

  v18->v19 changes:
   -Added fixes based on the reports by Sashiko

  v19->v20 changes:
   -Added fixes based on the reports by Sashiko

Pavitrakumar Managutte (4):
  dt-bindings: crypto: Document support for SPAcc
  crypto: spacc - Add SPAcc ahash support
  crypto: spacc - Add SPAcc AUTODETECT Support
  crypto: spacc - Add SPAcc Kconfig and Makefile

 .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/dwc-spacc/Kconfig              |   64 +
 drivers/crypto/dwc-spacc/Makefile             |    7 +
 drivers/crypto/dwc-spacc/spacc_ahash.c        | 1011 +++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2556 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  859 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  286 ++
 drivers/crypto/dwc-spacc/spacc_device.h       |  242 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  344 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  118 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  324 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  665 +++++
 14 files changed, 6528 insertions(+)
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


base-commit: 947d62c094367ef6064907d570b47612cd579df6
--
2.25.1

