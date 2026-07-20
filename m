Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA03F58DC
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547508; cv=none; b=BkWUfHp9Z7Fb+TbhB3ai73hJi2QWJ+Y7vvwBQPT96Kv97JvTKtU1EoJ96ypm/+bwL39UfQTsUGusDS3FuwKoHvOgJ0Qb+xqLQ/g0pZ8ohXF4sQTx4yP6zwgDPz1GrjrMnbpFrs+Ysi2rVuEptDkIDPz+EAsT6JZyN7vJZY3mWuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547508; c=relaxed/simple;
	bh=WHSX0CiXkmAHlQDT2B33HSFixaqi64HAtBstuM2LpZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MDRNPmwUMt4wdCVDqa+yw+DG0BkKZOdHQZ/VYwVWJrP+kBGZgXr7SzvbbA3Gi42HCDAQD+3IaCvVszzASAxRv/EkTG8QLoJ0vc095kX8F2tvOm+GhdnWiMWAzJsaj6bL9erkGV5631fZesoYYAQH2+CRLsuybZt0q8+MdaA6SrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=ozau4HFu; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="ozau4HFu"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1827711a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1784547502; x=1785152302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkSnkD30rPlcP9a4liEy5/m8D9pofUFEEKFpFec/ecY=;
        b=ozau4HFuMzxpYz7BuroeKK5kRMUp5KVe5KCS6EUZS/GKs5wwcEsRhkGW4DcrRL1oQL
         Jywi3msklwhjSg0Vbl+bf3IaBrCt0rEr2ty5zBEnwns0kdjIHQLKJe0BZXfJlYUcA+Uv
         fUEY93YKIXXCxrq/pu1ftzJ9OC7dldwPHEcOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547502; x=1785152302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkSnkD30rPlcP9a4liEy5/m8D9pofUFEEKFpFec/ecY=;
        b=bOBIwcJcDqNedrb/GAw9H7YHuRt3lUolhAU/JD8yRELKaWcV/7iY5TbB2PRuMV34Mb
         6X0zDCQ2b4gibBvmuL94ew30ijeCW0F8PpwfPmaREzIXkpy5lIxQL6ZPIrcoek7Qd3bX
         I9JGlfZBjMeA92rRKF5jO8TEnx65/5mtCPPgmU5iznQMTm8mEQdN9hfevdpfI9yWNIh0
         6XbGiWeJMHe8ULUnkjnObGEOjWOaohNBeTefX9ardaVlbIfyCsWhq8ZVCvM9qqa/Dhou
         PD8AspB3XjOuIty2+9Qqq5re4lHiMSmagkNjUdCK5qKcNxKI9m9B4slJTizQ2YTyEeaV
         OdCw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5qquyQDEYQ/QoMFvJS0OefjKB1JoMks/a28XfcJx4TTHN8QbWT2KxJUmdcyQHzCbhtZorcenfFEs8@vger.kernel.org
X-Gm-Message-State: AOJu0YxsxXoD7YZBEBH8UG5dwk/e/1HcE5qaRWRpk895YRDIaiawv7w9
	8RUltOfyXoYkc+QD3Zg/8gIk9TXoU7MSjvSwMjyST1exzwZmrPBpETTXv0a8LUBL8BU=
X-Gm-Gg: AfdE7cn6Ilqye1STW+i1Vg/tuVnAutToyqZ3Q19ntUuGsAfEyBufgEHroE6O3UJdYsy
	REanvuPii3oU5SNa384cqDciJ2UWMyw3IV463LOmoEHIP8wp7PKD+Rc38+wbSwO0h3KQx/8VAxT
	3riNSpNka8LIviRRkV1mOBQu715f34EsdZ5z0/N08MCohLJEXblnQui0X2h9DNbEz2teUErcHhR
	fJvHb53gxebp/kyhQ3NLh8j2yjFsZlBWU5aPE6F70tYRdkEDd+6zQ8mQsvKR8yLljtyb9C3+XDv
	kLrGUBkaXhFqChlg+T1M/Vxl/CettOCZBlJLtVRtvZi2NnF1vZhMQZf7GyS6V1spOI58AhxY7gm
	8kumiRDqYVGhD842MouXD6wMuL9nvh6FbbBOrMhF/aQm9h1zXyTcmrumV3TbdoktH84jGWid56O
	27qD11KhM5szyYXOhiXCNs5Y8oiY2qUYQi97gul3og8s8qRrWY07eo8GDmpImgiEBLCUQU5n4TE
	LKzbViIVNYnRVelDGGGdvm/FTHDkkmQQvxoHPH46M8PIQ==
X-Received: by 2002:a05:6a21:9206:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3c3ad5d4f04mr15063028637.7.1784547502473;
        Mon, 20 Jul 2026 04:38:22 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm61824393eec.21.2026.07.20.04.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:38:22 -0700 (PDT)
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
Subject: [PATCH v17 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Mon, 20 Jul 2026 17:07:36 +0530
Message-Id: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
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
 drivers/crypto/dwc-spacc/spacc_core.c         | 2551 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  857 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  284 ++
 drivers/crypto/dwc-spacc/spacc_device.h       |  242 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  344 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  119 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  330 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  649 +++++
 14 files changed, 6507 insertions(+)
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

