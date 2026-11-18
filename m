Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983727;
	b=aZhr1REDx3EcgVWfvQnw8/l7C9sq3DnI61vNdAAIkHkcP7Y8u5XDqfRwiwtgzZQ9LB/b
	 pfjr3DQ56ftoyX9RBEI0ve955iFlsmecEyZjozEV6Pj6IfOvl3ew173WFR2bkTC4htVkD
	 11z7KFyC88l1G9g/VKKnRfbHFM/OEe0PgD1uvigKX3l0ENUFL3BVHjRxNF/SqgtRoJqot
	 PiV4em9mDvrb1WMGUPYihGeNtjHrUjByE42fg9zN66uz8KIRP6B1hBysodi8AH1eVQalY
	 tAhVqWPpJBMmgEy9eVWqrnLUtBg4cIwL3emV8JnqH2D/2SWl4xgqlb3lroeQW+cj0Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Oe7S7ewgDx4+EMlGCDD6QUVkIrPAcGugMFECRzJaPj4=;
	b=UsEgdXgT9TRV4c0oyU4ZBNER618AHo7e0XFCW1IFOtNlTGOf8TJ223fSg8QlDM9BouqR
	 mU6QuM9qbr0DA7FoB8yHKblgl6qbiG1ABONrSxdws2BlZ5Euvi1QZQQHb/lQFuHyG6CH0
	 IFznhNKfh0iVQRC7mQKs0p9LHgdIr5/L1FQWyrTdCi58NlksYQ9nSFMgUfMN7vewIdOc8
	 xtZQD0Cdcqwu1R0oQrYnHEGEU9KjeORhdyzqC61U3zYwEcRQte+UflMybml4zF1zcQfiq
	 WSt4sh1JhNR1DHOWE74JxyQThUKfG9TbQ0mbes4Q22zoZZ4rQiAvp9sKIqu297DxFgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=ZsS5nrkd;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B15606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B15606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=ZsS5nrkd
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso999023eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794983726; x=1795588526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oe7S7ewgDx4+EMlGCDD6QUVkIrPAcGugMFECRzJaPj4=;
        b=ZsS5nrkdaJQhUFul5vCR+HBFYL7RDWhGtjeqcb4VxRDcHA1SHtnkDn217ihQyiz1bp
         LNw510Zfz71nmaHeRnq5p57wESIBkrI9qsmgPJl/JLzc0/JgjJ4iXc2SgRMUaosd5gJo
         quVCCFTvjDwvYJZE59jU2yH7XwFePn+0l6jTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983726; x=1795588526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oe7S7ewgDx4+EMlGCDD6QUVkIrPAcGugMFECRzJaPj4=;
        b=GLZTmAc2OOiPZDgQGisuL3mEuY0QgW4J9k7Wu7lza5wiFjbJ8KEgZGXQ0fjdCTLdiS
         Ds/ytTXjmETN5gNVhNG+ndTIdptbuR5LCONxExCZ3zRhuVO2tMaSwWhIgs8M+XnQ0p+i
         HWNTuVMLwgbKE9vpOSRzdWpa1h+XsMKp6J+guY3/tfaiVXdIlo+ALIxjeHWaS1TznTWF
         Kl0hvNWaKoc8sh1lmNAWnckZaGPpfIU1rn4vTYn52rFyakN5SgF3eQVMTSrr5aDs4E8u
         txztfl9JZqK7/jTFfv9qeB6jrslGYQQdYIfJmSGBRWYBHtUT5jklcJ0W6+qtscpg4Cq5
         SXSw==
X-Forwarded-Encrypted: i=1; AL+hErG4T6uGnPDwLtigAEb1QkH7kGAk76B7sxITa5dMZONWzSlmJa2S8h4kge/Ow5At6/IVyZFnaW3vhBm9@vger.kernel.org
X-Gm-Message-State: APuU4Z+zcmHjlEcDiqF+kE4l1gmESdzgnzIIW55T9iznA2WedH4d8NhY
	pOX6v0rjiZmSibKBcswNOD0lR8314QIxtRSZW2Hyga/+kUihdIB5bn8gwEqiG8KaMVk=
X-Gm-Gg: AZFdTZcgqKkYa28hnefcRyr430BA49cYUdNjSc94ZZWYk+NUPfKO5CMKuAMg3LJrE5q
	zQXZ8hFN5528Nc9khlv0oUSbNJw5bu24X8xnHbWp9eiWiEtqRFaBPDdnHazlot3EaAGOkXVMEUd
	6VZbRRuyOUncDpcqScjkwPLeclsV5YVEx53emai1HZd53KbDMBN82L1966CApo0ahQsERSVDTsD
	e6v9MMOck15X6mnmmaSMvaZcRcG4OwL//tbRFlHSS6tNcmTHcup9AFmGECYk4Ek2lN64M/1/k46
	b79CSV1RRC8m374/xZRqkeYSQGt2MCbKGMK54yvgcVpT5Yztoe0aQFjaup7wSiIIpZl2nqvXqZV
	pvTwFXjxzqPWH8n8zRRmdI6L7XijTBCvi8ufi0vvau0AOqjJXSjjsI13OSkbRqrT8OMWa6Rm2tc
	rEzmzPTeJNMnpNQK95TXHpv+JMb2Zg9iDKaONyoOcqyRcsNP07LAc+SGM5tktjJVv3WQpbQk9zB
	06ZXM/+5JpX7D2Lb5oo+7fn8PgUDm5TAb0lxk4KKErGcxTvJX2SAzWkWoY4dO2g9pCTyW7Sf+9A
	rqCXVAUTv7zNSJxsneC/Zt0fnCDBfOXEfu3WackcOMKFYaAtnT+WBqIBrdGXCn3xiQW8Joljnf9
	HYQ0iGYrKv/VFvXZCmdOuEc+fdOYOq+0vUmARmsZxRwK4Ve8xIL7eTMyfGNNUZE4V8VfW
X-Received: by 2002:a05:7301:e108:b0:375:c862:31c with SMTP id 5a478bee46e88-38281bfbeb3mr1805865eec.40.1794983726208;
        Tue, 17 Nov 2026 22:35:26 -0800 (PST)
Received: from localhost.localdomain ([103.219.60.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm5002338eec.18.2026.11.17.22.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:35:25 -0800 (PST)
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
Subject: [PATCH v30 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Wed, 18 Nov 2026 12:05:00 +0530
Message-Id: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
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

  v29->v30 changes:
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
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  806 ++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2552 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  862 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  340 +++
 drivers/crypto/dwc-spacc/spacc_device.h       |  178 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  349 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  113 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  365 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  659 +++++
 14 files changed, 6347 insertions(+)
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

