Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662806;
	b=czxywRyyMUUGiYcxEY4f66szfxNc9Ki2oCkTPbXqFSE1O68O9tBtx1Jv4k4msKumwDZj
	 FTVdGYFPK8jaWldHpqpftv+e+UWaRStU/uewm7l0xvIuV+r/teiYI28NmIaCsB0Bkbhb8
	 IhLXH4N+CU//PXuh9lNtp0kfeFGaoj9XW5S3bxmernEfwkvvuzFte9TBC7tOqOCljEron
	 VQF1aJrgFtChk2dPDXa3x0YnW3H9t5MS4R/sqE9mZtAzDs3XHASytn58lRBo4uj8ZLTDu
	 fFis+aMFa9bI4ZgXAkR2/ER9Qlq/TPa5QJxvEB58baFAGgrgLrUDLERObIYFVfmWr8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wkqW+5Euu+lzjmS0CVjZUfm8oW70hhcplY06jZYK+zQ=;
	b=SbOlCzt2plWckjjsjWx2+tTmoChteXp8HPxEeuv9Bv0Va6lHzCZ2VRt3eXbWOWRszDD2
	 Qw8vdVM98a8ZqZTb6BD0jsQmeQUaDUXtPqlomA92MyX0xWuA9K4+o8mF5J4y2pK5KP8c7
	 qGm7IhmwDPEUc1i80hOHgTQGqGtd9XonXOU+m8B5yQgd+owpdxO2mn6t/jg/KUOd0Gc9e
	 t6U7s7Eu/JQFPjl5vFh7esfJmIfAvJNllEpIJzyDgBCQleBHaVD8k0OcdWccpmrW4OjEv
	 MVnM2ELmgGC7jB/NhkTpI3dHjqHFn2zb3SwaFJTAsY8PNQUXMqs8nvmptgt3yYi39EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b="DXvWpG/o";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3909606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3909606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=DXvWpG/o
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37628596783so3362897eec.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794662805; x=1795267605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wkqW+5Euu+lzjmS0CVjZUfm8oW70hhcplY06jZYK+zQ=;
        b=DXvWpG/oi4wZHGq45MBwFoLCM2dRdgJaaGbx+niU5qz2fELPtPIzb2o/zug4Qph0q3
         Y1hGesWjxXf6WCfY/jtXWuB1Ik/nKYEUpK/yKWma1EP6bsCHY9uWymcN8mUvmO5sQlom
         /A3XLK4z56oRaIRBImH3XVE8366GUMA0rShTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662805; x=1795267605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkqW+5Euu+lzjmS0CVjZUfm8oW70hhcplY06jZYK+zQ=;
        b=ruglnP4Z9Guc5XXSMRsoShIku6Cez4RE8exIQnW9BRVnAR8cBDCe94srrZBnbIqMyo
         f67xI9/8Ejhv1BDyjZg9gZd3XgRT8owpvnVh7vLRP83HLVuJuRlJkK7wuajHMtZhBKqM
         VUigWcr/1DmM1U/A2shqaktzId2Vy+2JEdejFZ4dMFj6pbx42rePMEGkZ+/mBk1rTHkR
         xxxrYk1Exsa3q/UqZzTilpjwlh6WnM98KhZY3cR9/Vo/WWRQNI8c2MavNfFDkolTPcGS
         Sssv+oQRZchEIHVp3MiQ11XcX0l6MtRKHV6eojFM01KbSKB6ofMrnSzr7aZ15sg6ILP1
         a6LQ==
X-Forwarded-Encrypted: i=1; AL+hErGik+DCJ8rW02DJmM7mppSg4MyvG/MJK54J0X1YB0EvXSXQHS/+bcFX344URRsbPCeKpH5umgpvSqgN@vger.kernel.org
X-Gm-Message-State: APuU4Z9wWP6SpLtWKKBABavRYsZahugV26lODxUCfKKBSh8LHfHBNEGk
	cCUa3bYq3f5HrAV8iEbO1OYRBrCcNJBwC5EZU+ypV0CtT2UW6Uh43AlzDH1xFPMhsw3nShVveGr
	Y8/rz
X-Gm-Gg: AYBFou3e58uZduo0niU1SN86tqm7H/DF1h16hOtjQTRLNAHYP1b7c6Lx/p4Du3etJpK
	UEWLge/aPdX9R0Xjy0KKbzj+SzvPD7RAT7VKN0KB5iWGs8qF/TU99dJ2T7xkw5IwH2vz3G3omtS
	WCRoOMbTE/31tAV3+X4CTQSzZiUwy9CVtet0OatdOZPW2zx2r1HMGG8gDfqLlKcUvHPJDhUFAV7
	4NxUw3N4YBiBC5jtnxpAfnK656mPCbtAy2zzHovuzOAtQEayyG5URonJ762QGBdYIJMhBfl2HRp
	RQSmY2RDTP5IdrMQl8BiL0EYIVVdPgVllpP87W7uKnvwHdKQFhE72n822IsSWijXacF98DdD7B2
	ak1xkyS33jPQBWkoybjFW4hwq42iESlVQuztmzcPZkMwrflSEhfsBwxhgprQ8rO9DsPb588tISg
	Hjf23lckJUB7+rTO8jzIFKKEEDVt6kyM5PyBAZAVlphWcjsuMLd26D55rP3pa6cG59FEJ7rcJUm
	JE++WLKnXR3oFTObGB0xBnHFZDkfsa8vgo1t0Lla0nB7kqOJhJL4/hWlVgVamgpmHxqkvsrKVvD
	wGAQ2kZmcJyVHiW/fgTa88uBEKZGFwe3KHcj6/ExS1NrKwzokIVf4U+Z/CwSw2SA0Vo5DXMmzSh
	VDf062qbejYID3iuTPfmwsKMjaupQvu9i8cvT+nFPXPMB0e8uVp0pqAqpGj1znMZF03Au
X-Received: by 2002:a05:701b:4508:20b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b503060401mr5705261c88.5.1794662804586;
        Sat, 14 Nov 2026 05:26:44 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm15712003c88.12.2026.11.14.05.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:26:43 -0800 (PST)
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
Subject: [PATCH v28 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Sat, 14 Nov 2026 18:56:18 +0530
Message-Id: <20261114132622.690129-1-pavitrakumarm@vayavyalabs.com>
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
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  803 ++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2540 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  862 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  340 +++
 drivers/crypto/dwc-spacc/spacc_device.h       |  178 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  349 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  113 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  366 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  657 +++++
 14 files changed, 6331 insertions(+)
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

