Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1A47DD4D
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808149; cv=none; b=V145ltpHx+9VVYrQI+QJRjRc0Q5DvnhOxV3zQenON5WZvsOkUepoqpDi5AVwGDPW41SXVvBXw5Pe3xOwWSu4NJ2y6FeHkgVhtL7F6DRK95VN/2f+T13tXj+s0Hff5u46mbkdRwz1VG1sFDgbyBdnSSia6n6JXiFUtXtUaQ9tsYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808149; c=relaxed/simple;
	bh=M082/Bc0PcIsg800ItldjwxHDJ1EKUes5ps1OYryoO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GO/FqreyUS9G0+vMF1gg99zRL2qmTF/jZr3MWNaEveKlGDhL6DvccIkIzcal6FFwTnmY40zu7L9/2rXiczTWzdLGyJsZm/xIwKK1qjIcfgw3c6T4PjwOTAPUE10wvgbyoDA9U/NWx75fGrMY7Eeu5vWwcycheTd85lJTukcxFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=a9wz0lOv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="a9wz0lOv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485b358552so525126b3a.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1784808137; x=1785412937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Hf/MAzl+A5kzBUy+aPzvdYE3FXYA0Gg6VzRMyoLwnA=;
        b=a9wz0lOvWe/LV6lRTEtREJCj8GyHJHDB49BeOhXr06IsFod3ok0sYZ+3Ck27bPFow3
         gMFiaP/8VLn43QDiHy3aN15/sfDWv08PyloayeYiNCRfWtllhjUoWI4+Jj+SOCQgbLBj
         83zV7ieuo4Cx1mr15rtXZy9v4KNF7W1P6OyFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808137; x=1785412937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Hf/MAzl+A5kzBUy+aPzvdYE3FXYA0Gg6VzRMyoLwnA=;
        b=rFcHAguedXDOu5SNaipx1IO/ZPXL9DXA7k5YYckcGSNO4GhkE5UIVqhHMnHot3onTN
         lcbMSCTzX7sm2cFX5feqzDavixFHiZq1CeC0Q6wBoiIzs7uzO8Z24DCtD5Y3Qbk7NIuq
         8C8V4tiuSeElyKF/GN4HHXZqc4ZK9A6INN8HZ5hvd+CGmboz4A9c41eyltJHKONAtuuh
         gVs0kGeFyWHVeBtW1EfXH4/97q5Y+o8y+6xuZ5eR93y6xNxVmhp2DrZzkBJMYIFUjBZh
         esWnkQDuANsvVSjYYDN+c++LcxNvDggAoie/1sLUly58k0M2oMwajJghTtaJK2p3geYZ
         Uf0w==
X-Forwarded-Encrypted: i=1; AHgh+RotwHImxg+uti3BBW8+Mf2PDXKdww1pkYrvlZv5XbdCbnFswwzPCWrLzbeP/vIqSGgkiLHFBobL/RYi@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ7wlhK0dqb51xGy9d76Fptj/XULQFwAtLcEcj+GLywEMoHGm7
	s9leaA7+6+J3b5kR86e1Fkbrwb2xICC7f8A2fP0FvwNUHcJnvpNwWFpjbBNfi0eEAD0=
X-Gm-Gg: AR+sD13RgvYS6CNxFF1bjpPkRsHjivorB42eg01hQ5mNeO7ufCHb0wJ+4CVNOOYPQfA
	7BCpr31lD1gzrMoOFjCj/dgKKPMMPYOLzAdBoAfM69/Aqb68Jzr6C1Sl0v36lgig52HWOPfxIWj
	HjkZUwcy3f+xDZ2L0Ng9JjCKwSB+bVlzCCs42FFli4M3KCyS7hMzq/zn14OMpthpuXN+TcE4lzO
	ZzzHBieotSw5xYg3Sn+0g5nTjfn0k1XIJES910ujvnf7Gz6UTYeedn79FVdQNUGTLrZF3Tl1jOo
	cTQif1cheNAt0/1qqxGPuQUBt0OdIGsHuR42cU+YctqtW+74vnzvfCeetThoH3rZ29FX7V4S8SI
	jd8bwJ97Lm+m2CRVBpgShXsAXu8jo0IazbZSZw+36/n55rRTo/bNRJLnBllMypw2Qb/QGA0SRrg
	uW2c35io5c0hUc5kkYA/dhwP1NogDVT1d1CwXE8Cs+m05Iq5nUYBbUWwYXW6/LM7P9CGq/dT0Rm
	tqdHeQAe+x1B9O/GVno+Ng4P0RxDNzTahOcQee8cnNWM05ZeFj8F82h
X-Received: by 2002:a05:6a21:610f:b0:3c3:ac9c:9a6e with SMTP id adf61e73a8af0-3c44b2ae3bemr3089856637.68.1784808134651;
        Thu, 23 Jul 2026 05:02:14 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm19359125eec.15.2026.07.23.05.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:02:13 -0700 (PDT)
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
Subject: [PATCH v18 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Thu, 23 Jul 2026 17:31:52 +0530
Message-Id: <20260723120156.285270-1-pavitrakumarm@vayavyalabs.com>
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

Pavitrakumar Managutte (4):
  dt-bindings: crypto: Document support for SPAcc
  crypto: spacc - Add SPAcc ahash support
  crypto: spacc - Add SPAcc AUTODETECT Support
  crypto: spacc - Add SPAcc Kconfig and Makefile

 .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/dwc-spacc/Kconfig              |   83 +
 drivers/crypto/dwc-spacc/Makefile             |    6 +
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  990 +++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2554 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  857 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  284 ++
 drivers/crypto/dwc-spacc/spacc_device.h       |  242 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  344 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  119 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  330 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  665 +++++
 14 files changed, 6526 insertions(+)
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


base-commit: df373d39c6f038d176af303ae72f02c7c70b953d
--
2.25.1

