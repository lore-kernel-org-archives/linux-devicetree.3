Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F70A3B6364
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448075; cv=none; b=HU4L65gEGxj6sbrkBogFGVAN0pAuJ0pF9E9Nj/rfzhYYSrkdyL5gPlsu77I7hxN9FzktB2BCirZ2ti24V5PNDTcGDFAKGbmIZl8JuJUA5rFP4cJDcrvSld4hVCCfKw+P2uYz3he/tyaRZP4pUKKQ2ZtQw0lbueNKsupZVgdsGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448075; c=relaxed/simple;
	bh=W9lQ2kPn3Ia7xWlya75pezlrs0li7+8kt49W6nKysE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ipM0VMMOYlqN9yTmBB8qwi7leBIrCg8iEzMyxSXLB8EvLFHD+Yin4f08ABMHSb3qGvtQKgWCL8ePh3dngpN7T2rVJaWTpZKYu18mfiAUWoPagkA2RogW0RGJvJF0Q8qh7ZfY6bFGVnR9/C8OUezfLjDitlSlMZPzyKjAyduq0iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=C0a7MFzl; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="C0a7MFzl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so750880a91.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 04:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1786448073; x=1787052873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KW4s/6Tk8cowyLPsGgWIeA3zdeLpXtV4H7MfVGaJwm0=;
        b=C0a7MFzl/j7Y24BfS+AGdDaPzYydVoR48Gl4sJK/y2fPO6eOEJmFE9C12j/IXoHGUi
         /G03poYKizz8SF90KmrBorfQAxKYzso2DIvK1FWcIfzjMvlzxyEoZDzNtSuVD/trufTq
         D/LHqx6kWxSxlXiKr5oBlpCQRi0y8qypYccKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786448073; x=1787052873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KW4s/6Tk8cowyLPsGgWIeA3zdeLpXtV4H7MfVGaJwm0=;
        b=VtHWYdWQmsG+NEinbEmJkmTpIrEjMp5Pez+29okrBJdYJEBKceKKZCT9Jb7VJEXCgp
         1/fxrWCqytYgRmpUTzFgzc2dEQbl3oQhlq4IU3ni1UOKRhlFGAaT2yEhlFXeiJ22XRzu
         9iDya7P0Z0xM+2xpeXn0V1VzBr0v2IXITS8rn593RnWJZHQnUw+LDVmLESVX0n8f5U1k
         Dk+EALR7XN3vTJZimFnVGtVMhz9C1CHAZppfv+/WeaiELANLiWiESkdx6H8xEDq5hehV
         x0xx5VQc046NHtwYtvNab3JFQtFud8zThii3iGAncIIfvZdULtBR7VxdSPJqijYg7xCa
         FSqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0tpKsv/ld9Aru42eTPc5+LUED+VLPIiU694hB1sAkUcjFWAkchi2AHMuIVZtczqi+vFpYSEkw4Ixk@vger.kernel.org
X-Gm-Message-State: AOJu0YxnoHCcV7MX7lOgI3+YKlQncwny6d4zqH8yWyig4gd7BiEhsauH
	MaXXzZIkcdJAgj/vzBkxZ/d+n9raKhgxcsnTVaMR1cRj2ZIkdtDJ9ndUKeDYlJohyns=
X-Gm-Gg: AR+sD13Pd6/8ViC6JJ2lnnP/zK4poja85houjZ4dRe6n+rgvu6VghAGLHLkcd33wDIU
	2/gpE5pURUTJlnXu40rixb+ScaLU0vrPWhmT7B1z+nC1ZLrW6/Bhs9gwNvBK3zcviItzrjVb3DL
	KGx7JBllXodVjsY1hVPabUTWU4bgEAIFfisnl1kK3YWOtexuLqpjLw6RglX+AY5w7OSr1oP1w7t
	XFLcj8AMGTzFZM95ZNd/7WS5AyalqJSNb4nC9B9w4bRL0fxVAMsxJDY3YfHKGpQHcyYJUzmPVTN
	aCvP5kR3CIwJspQluyRcUEp2QFOLHRmjLNajg9rgH3rc7YJcaLsTmxXTPY+XMQV9VoteYkW0/mO
	8b9iHk1fF+bzKAT/98iVzmq2hxa48qFl+/t069kRERPxA/gZ9yDm5O0N0977xO9MG3S3/tfDA4D
	ilohwCuHLGBrQl/V3mwl1nsaUlrxL6f6D9LTMhydHep+q6S9d0t9bZbur5py/n8Nd/uFx+LsB4a
	KX4ClezDGS2F2h4HWaCZRWKQ/bZcMJ1R6YOpUi8vgvzxApuL07jt0zdktRCj9N6C5Ydi+DeO0+s
	3pk8/olyJFBqKOzizghlbxbL16kS
X-Received: by 2002:a17:90b:3805:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-392ed01a8b1mr1328642a91.1.1786448072789;
        Tue, 11 Aug 2026 04:34:32 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412035e08dsm4983584c88.1.2026.08.11.04.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 04:34:31 -0700 (PDT)
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
Subject: [PATCH v21 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Tue, 11 Aug 2026 17:03:46 +0530
Message-Id: <20260811113350.632737-1-pavitrakumarm@vayavyalabs.com>
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
 drivers/crypto/dwc-spacc/spacc_core.c         | 2553 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  858 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  285 ++
 drivers/crypto/dwc-spacc/spacc_device.h       |  242 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  344 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  118 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  325 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  665 +++++
 14 files changed, 6539 insertions(+)
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

