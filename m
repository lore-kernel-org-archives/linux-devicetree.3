Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3335F395D8B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557056; cv=none; b=QxCrjF5aWEYBkTrxwWOn8VOF5nsZjSY121q9a4y68qsfI70aqML1DiCov1cEYjuGIlAlTD/sHlQjNUjG6oQPcc4U3caqYcNWNA+CilQ1VKay84WPaYWGJ8lA1Wp76QcjH8GgFdIqvWgEB5l3OfrUWQoHsS0ceAW1mBgR3b7/e8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557056; c=relaxed/simple;
	bh=LYIybXT/A0uaqpcRo0vdSMiljxqc25gCsD62rIW6xO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uhsHIG2L253OCWt3Yf42Ewm22qY60/RCBR2QonzC4HMUGZPP5rjqbnETonVuYJ/Vf1RY6W/nnYZZaUaE7K/UyEFIfulU7dW4J0PpZYq53d4r8XAWfgTe1DtfEh0/CMim2WrhdPZ5ynJmCenNHP8tfe9HoUQQNtULfotvh1xjPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=K1QnUpzn; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="K1QnUpzn"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1079266a12.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1786557054; x=1787161854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ibuzEPrLozk3S2guDQCpsa0Zmqwbs5provsHgkwyYM=;
        b=K1QnUpznZoQ4HAVhwLbaKbgxHZ5Sq4zfX2iYaMjpRaGrSXwbxSQbFo7sip/+hHVkmf
         HxmKgpNlSrjKq5BT8NuszQBq+mMPp/k8tQEQhQ0XrXT8CR3DPKCF5T46r6fXvKWcrsNA
         FHTQIYbtKvC2Hfv7BNJife+4msZ3dzYwp45Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786557054; x=1787161854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ibuzEPrLozk3S2guDQCpsa0Zmqwbs5provsHgkwyYM=;
        b=hwujgIbDfbVHbnaiVMNsLJVyruXBKljEIpAPWyQ1wcUMl8qpLqyeTBnC1JLX/74AvP
         O7dCnQxKJDAWsnz2laYBNTjDGAqgsLGry+19us4BnjadBAGsLqktbQM7xvlK3janhbqG
         eP4KXGHgfvRjhPtJjjIOvM/0ExfpYpYREwy5ExBURIWTcoi5ji+yjt7WIxxsGLv/Md4j
         t+sX8jxBiJpKkxUN8uj+8dptks/GySRmYmdTA5VAssj2mOLzW3yc2Jw3hUtZRAnCdQNr
         JBuaEhEtkQnzAtme3oj0Iq3A+KT8Yr4E3K2DsGWkdcrFhC71st1CPbP+gYIBgMdzleEs
         7MuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpxw86f/Ow03vHOSHBFfV9VQ+dNKpYbwUhkfYkibVHj5Lh+xBOYNTSAWpmh+ZQObr34915YqmtJx3dQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywow+EnymwTRI5O45BVY/naBokK6cNW0zNETMUiSD+bs48mWbJi
	jkobPP4yA/lhM9AITlByhrSU54iSvQxAZzJZijithHYq1HNgf8DTZOIqcmD9VwDIh/0=
X-Gm-Gg: AR+sD13eadNGBVxle51anMsJaxSsYnDQ46E9DbGCNkaqLFoCJ9tYme9cXRLiflrxENn
	PVhS2vpfXt8CclB5MbJVryE2ofnZPy9h4d8IY3tg7ty04kfJ2QmI+bgTckbxB9hSCWlnA+troi9
	+9dsjj0smkAviMa7W1gvJ3bikU4crotjN3vBFvfFgMVsjFs0iZOi66mM6Sr30CcSGA39ybjGBtZ
	8L6JC0HB8lSsMJVXfY5w8nznlJRPpTnZbkXh7G9t0FyBp+W5ywsp8CBgWUvREBoVsxvLMPTrM78
	ngAkh61qJ7BY8lbTPiR+7uj61zsaKU/IUA8PViZXfJkX0LyFfcncuslkhaKLQlqTndOddeGMkaT
	A0Bsn1IRdK7KCzbdCUdqVnmADNWcu/rdfi/+itfTRLSCvo6llKXQYHqVUIiQsWBesX5EVDv+hDZ
	r8YmbI+4jyVtYMAIfmRiDlTboASKViulj8oSbqMfpiEfmfRMzQzObkzKwt0oHqfVYnt9jB/xgbb
	O18SbMVGnDykkWQT/hFpDxoXB6jHSSJ83lItyt8udfn3yr+dgkmNO7ES/3FnvbfOR0xsx0nGdhr
	ouqK8d+M5B7LQ8VVd+2kcNbWsVU4
X-Received: by 2002:a05:6a21:2d8b:b0:3cb:b3fc:510f with SMTP id adf61e73a8af0-3cc552de999mr198773637.24.1786557054513;
        Wed, 12 Aug 2026 10:50:54 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141245540fesm18482258c88.9.2026.08.12.10.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:50:52 -0700 (PDT)
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
Subject: [PATCH v22 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Wed, 12 Aug 2026 23:20:16 +0530
Message-Id: <20260812175020.666558-1-pavitrakumarm@vayavyalabs.com>
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

  v20->v21 changes:
   -Added fixes based on the reports by Sashiko

  v21->v22 changes:
   -Added fixes based on the reports by Sashiko

Pavitrakumar Managutte (4):
  dt-bindings: crypto: Document support for SPAcc
  crypto: spacc - Add SPAcc ahash support
  crypto: spacc - add spacc autodetect support
  crypto: spacc - Add SPAcc Kconfig and Makefile

 .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/dwc-spacc/Kconfig              |   65 +
 drivers/crypto/dwc-spacc/Makefile             |    7 +
 drivers/crypto/dwc-spacc/spacc_ahash.c        | 1025 +++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2544 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  858 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  289 ++
 drivers/crypto/dwc-spacc/spacc_device.h       |  242 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  344 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  118 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  325 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  665 +++++
 14 files changed, 6534 insertions(+)
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


base-commit: 68554337b4aa63d8299edd58f5059d8470bc721b
--
2.25.1

