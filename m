Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666180;
	b=PBCYGPApXRjRFa6UNAyff6DyGP83KVAA3v+ea4lsyvpjHEYYoReybQbzJfIB6ViiIvdL
	 nrw5jex6rUiD7NoWSovskWiZKona4iuBREP5SBqJ1c0Oun010oRm+Rm8Biyer+xQGSomE
	 qERCwYon4Us1ixgvpyxbA0pUHyciA3uQa2wYqogae6miuIJV0ZwlH+sIq8wyDkMNGw07R
	 pJ0OVMhHwB17BlMALNo8iAi+vACM9V/BYj+FRQJj14yVTk1dBNlnfIsGnyGpxCdX+++0w
	 2QCbA7PblgbnVMPf9Kr7Pf/txlnJlv/Uzodz8JfrstBXXfsIyJnmwdpQ1sW26dtZKgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hle8NLPf1mMQprXQsb5aWA0TQrCEYrxKFq3Zo9FstOw=;
	b=enUzfFUxI7AjSUbeVdpizNMISjp+N5UFoprrZMBCv387d5jf5dJH5TFjlj/iXOjj9n+v
	 2yHDaAOkjH3ML5ZzZDaJ7laAZdd7aqo5HokMfmRhJv7XtZAQMk7ILReilx6qNk559rvzj
	 PTJYPLERMXoZuwpw1b6kb4gF9GyBxnlT3XHFP0dPKblPaXPLp6Siqv1V3HB5P0IpCBhx7
	 J0uZOd75Ubs8Az4cJz0zg1vsbC7bfCAZrn/TDcZjn5s9l20ZJHBlprCsJkeX5k4JaW/rE
	 u6Rh/fVGWHeu7Y3aFDobUAGK1eG6LZfJAgVnIg4NhhJEs9EDDadpfFB0OIkv3KX1HuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=Yin3WM3Z;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA3F606A33A
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA3F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=Yin3WM3Z
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1453346c88.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 06:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794666179; x=1795270979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hle8NLPf1mMQprXQsb5aWA0TQrCEYrxKFq3Zo9FstOw=;
        b=Yin3WM3ZaW4NUCLmk9u6MBoHQYodk2MCXzp636pKAnwb2j7qnoiLW/LnU2NAnhQzkz
         N3+vSHo9PxATzPrHCSMKc1guurSPhqwlmtfrhbSHd+MoGg19v+/omoePwU5+bXajY+y5
         +LSGG0lrgGKpULrbs5y9hhtYbAT/GMM8HZJ7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666179; x=1795270979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hle8NLPf1mMQprXQsb5aWA0TQrCEYrxKFq3Zo9FstOw=;
        b=tLUPP4AVhhcZpbgXQ3WhLoe+I3aBPKeHT2PBZGeGQEo9bGYZozikBxpsZznT8OFYR5
         osRTchdRhR/SPKxrskfAWCE+Q5N+3ktVInM/1rxbthusd++CllrYFMC3G0MrBYHis26b
         qm/okL6AKjO/khMwAF+IWlA7VRfq5zod2jxS0Z/b9jCcPIQ8zs5WHOJmWAzq5AzotrnP
         w6S73YTA0O3PSuAAIccP9WEAeZgLZsvoVRa3z3l9NpuKKkY9Vo/T3l119M8alesrdEjp
         WixWVYfbZW0UZjsGpNBVqPvQopA23LB1nEcmlVCRvww8EJaUw7gNao4skDmunCvcJS6U
         d+3A==
X-Forwarded-Encrypted: i=1; AL+hErGoB600WXdVziZAwHpF6XyeNAqlg69m/BBpZBWB5aWOLZMdUrPb54BeK4SOl9YhFXgtNlqEEM00MYKX@vger.kernel.org
X-Gm-Message-State: APuU4Z9EOE3C1clyei9s+quY6CI/r1dO16a5DmRdi2jqDZIT0MtDt12g
	F3+qPaUi52J8g+TltCFaHDyYeDvf2vmo5HnXrIiLeMm5Zg/QGyucaZ4CSzDh8t46IYE=
X-Gm-Gg: AYBFou3K4U+gfoWxMLm8ihhJPGUCzmPu3uku7USPfN/zIsA0J4WrxuJX35TsyZ7XnE3
	ssrtoLxtctPYGx1eFJ2sGKhGtwLpjZvQx23v/tkpycrsaldmgeqtybLVnQBE/x4/h50T+eL3LiA
	VNVDWxxU4bb7GiRMO1axyAvqvY7U27XfjmMe/vKJRTwGrItNpVJGGXSKsNFSu93ff1K1gPKbdgY
	rJ2AHHqsOIS4YkSSyxFCPh96HDUyjs7fSlC6Izft4wPux6ehF9jIoV6W8mdAxu7XWf5i1wA8aHp
	hgg2vZyqwq0KGcGI1UiP4rNDOKvO4voyHxLvvAcZ2CUJn4kkcbanDwFVicKANqLit9ORzq9+hJr
	gou/Mm1jDKfLlMckZ8PShrd2PdQqb5P7xNrz5koNgwMVOXG+9Y2TPzFapN0BC78ITqv8tv0UtUz
	vwtvVMIPwfY/iNrbyTbiRFhB/Rb58dx1zZp0VyieYC6XP7GyHi+CbLj0R+NocmDC11e9VpKrzuN
	FP8+dXSxuY2r44VnsfIPiYP0eqmiClyUykU4WQ8W19ecOx6eudMOtLJaiNfGQyr4BBW4kUdCkd2
	pkRTs0aXR+pNE/Jwj16MukQiQXHYMKKfgl6cOKM9siphvnr2GJYMRRQ3gDoKScJ4uy635vz64xK
	yFGhaNSsEwlIRUMbYRmcfl/wL2oqes6j+vrb14vZMKEDtdM9jQHVGNUN0eXn7MAF9YOjT
X-Received: by 2002:a05:7023:e41:10b0:192:a481:361 with SMTP id a92af1059eb24-1b50308a2c0mr4926737c88.7.1794666179144;
        Sat, 14 Nov 2026 06:22:59 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm19376962c88.8.2026.11.14.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:22:58 -0800 (PST)
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
Subject: [PATCH v29 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Sat, 14 Nov 2026 19:52:08 +0530
Message-Id: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the driver for SPAcc(Security Protocol Accelerator), which is a
crypto acceleration IP from Synopsys. The SPAcc supports multiple ciphers,
hashes and AEAD algorithms with various modes. The driver currently supports
below

hash:
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

  v22->v23 changes:
   -Added fixes based on the reports by Sashiko

  v23->v24 changes:
   -Added fixes based on the reports by Sashiko

  v24->v25 changes:
   -Added fixes based on the reports by Sashiko

  v25->v26 changes:
   -Added fixes based on the reports by Sashiko
   -Removed the additional fallback
   -Added the CRYPTO_AHASH_ALG_BLOCK_ONLY flag to the cra_flags
   -Minor code cleanups and style fixes

  v26->v27 changes:
   -Added fixes based on the reports by Sashiko

  v27->v28 changes:
   -Added fixes based on the reports by Sashiko

  v28->v29 changes:
   - Resent with patch 2/4 regenerated; v28 2/4 had a corrupt hunk
     header and failed to apply. No functional changes from v28.

Pavitrakumar Managutte (4):
  dt-bindings: crypto: Document support for SPAcc
  crypto: spacc - Add SPAcc ahash support
  crypto: spacc - add spacc autodetect support
  crypto: spacc - Add SPAcc Kconfig and Makefile

 .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/dwc-spacc/Kconfig              |   64 +
 drivers/crypto/dwc-spacc/Makefile             |    7 +
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  801 ++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2540 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  862 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  340 +++
 drivers/crypto/dwc-spacc/spacc_device.h       |  178 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  349 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  113 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  366 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  657 +++++
 14 files changed, 6329 insertions(+)
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


base-commit: 8ba9044ff0bf4a5789216496019fad614eeafd45
--
2.25.1

