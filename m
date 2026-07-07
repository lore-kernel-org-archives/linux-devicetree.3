Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1723F8886
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428832; cv=none; b=pkqM8xffGes4+x6Bo4+Y0PrwSSaMO9nAvPpa0aND5aow8i4LfFeoEXY8LMTvUbWinUYJfOYelur6WHG0y+xaoVSDAMrUO7Or5f3uUG2k60g3+tXML0d04gzcPHr4Z1wWx6kZvop8xYYgKyzUAuRlyAPeyjb8ZkuaA8D57aMlNJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428832; c=relaxed/simple;
	bh=TtlRd6av43xWr0OSRZ67ub9qAuhFOW7oSsbbFqq32RU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WL91oF1IPeTEWFqK5qRMu60voiP8w7rMuurhd7j4rGlmy21tSCTzeVPQu1ItEMp1QqDLFlnawMVXPf1cR4K2yI0Cx2KolJVuDx1tAbaT8qAPtipV2viEfOXk0D5XLXLB2IibIQW478LUAJKJYxYMBJ3Z2uuU/s6JWpOJTsbqHaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=ku+jmE8P; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="ku+jmE8P"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so4701309a91.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1783428831; x=1784033631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DkaFB1lX+WNiI+Ftr/9ULdZic6GxfO7x0K9dBqqL3LM=;
        b=ku+jmE8P6Yg9TQaVfsViJ/n3pxpO0ccdBba27zbz/1B10mujbu0R8Dez4XsLk4d4k/
         d9Kg+jNWFWG06X5Jk1j9oFe5+xMl3Kqm506kmGKxKvfnj0+tjVwK7Itt/Pc6vpiroW9C
         WUQDmrExlQppoHcgohpVaCMpfKIgewaah+/uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428831; x=1784033631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkaFB1lX+WNiI+Ftr/9ULdZic6GxfO7x0K9dBqqL3LM=;
        b=kgQ8NqwJsqs+OHySc6RD15t09lq3H9NS+exUBR40idvL1YoWHp/04nGZ3/7B7B5jyS
         +/9OAqLiRFkEoBZdqnNq1Eh6TyTS23XX+XxlHsNCzOZ9z3l9AEo1U9ELrIoQ6r6JCzTF
         d5RSOTtuU1Uq9KKGyViB+KAXyZx+q7geaYwcUzGxS7u/58+Pq5MinQJsd4EeyNCBkJn2
         sysZvRMxa+7ssBeFQUnc/gp89mXTkbXGaT8LlVAKmG24a2PrrSzIXZIPDVXkXYpJQxel
         bJX4IjE4dDWXyOIveJVfdtkBQHOaZG0inJrfiXMR8L7SAnaiOzbgooNKLZwIN/C2OHbL
         vUDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRc7XEZZHG+3mZBbNL636ZaWsu0lovX17mLgsTEoMSXTH2l+v9m1mZiOSoA+C0wOTYSg6g0vjYsP7u@vger.kernel.org
X-Gm-Message-State: AOJu0YyYzaFcGaouJ2jXv1uMLUstjvEijQ6w0GN1UccXKtM1fafmV7E/
	ULZ9kMFryhNa/VwXID7aCQNvEBxuo7gbl846JbdJOgRTslXnJDPl8IvsMoXQ5Do8NYE=
X-Gm-Gg: AfdE7cmT43lQ8rlD5GuXzb7L3gdNgdLVMZhL79m+5bNV4L4BsVkEiCQJoiOQxI7AVUe
	mSY50XaMylhfNLFiBzzLuJvYny062tmItChSHaWBvotk1rTt1ONWx8O9GoaPFXcynNZ/PvMH0ID
	2c0T8TiQ4JBejfxlcZOQ8RxZ1xyGBZbKsqJ0SKaAxA7UwEflkidXVrkhY9MUjDJcFkqgK8aHmT3
	GKqX/h54qW0ywA52pgmKTYAERJRd2yWE7t22uEJZXsmRsR0AH4EcfPgi8GQ3w7PQNH3G++uF+NN
	vtqxhg24R8cZpZJCHEUgx38LwqqkUiPN2FNs4wYJJtoAa/4AWDCZYMMXq3Cw3iJVwG1C1CGFNM7
	oEqi5DUVGw3dBJ6gc2RwzQ5ltU/WXXBjm9ym6AL6ZtxWcN3Ze0qHIUQEHHyToFp7dud4BGMB3W5
	F7dnHzRjFfat5z9hKnKc9ZofKSf6I8uX6MFWBoPERkB8xlYmzmVeMu/cC1utBvMFrP/wAr25T4H
	A2C0NI8w8bY5LfDXwYLu54wgxDERw1m25uog0rWiE4olrYHmwLbR4zo
X-Received: by 2002:a05:6300:6186:b0:3bf:6c08:2841 with SMTP id adf61e73a8af0-3c08eebab41mr6159349637.48.1783428830820;
        Tue, 07 Jul 2026 05:53:50 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm7945671c88.15.2026.07.07.05.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:53:49 -0700 (PDT)
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
Subject: [PATCH v16 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Tue,  7 Jul 2026 18:23:07 +0530
Message-Id: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
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

  v14->v15 changes:
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
 drivers/crypto/dwc-spacc/Makefile             |    8 +
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  981 +++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2553 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  859 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  293 ++
 drivers/crypto/dwc-spacc/spacc_device.h       |  242 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  385 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  113 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  328 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  653 +++++
 14 files changed, 6550 insertions(+)
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


base-commit: e264401ce4776a288524e5b87593d4d864147115
--
2.25.1

