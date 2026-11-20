Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180475;
	b=eaxHDIqz2w+R4bVmRFAaer9efDY9qO8poYP85HYPdNffZPEl8wHtZ+aaatXARh2jeb1d
	 cz+705e1d/HpPvYVWvOzv0o3+xncJwSiWjoiCqvPdGRJt0wQYHpLlZpEAIntVyBmE56yY
	 X8/ejCmWvB3aX0weeJWl3taAmshjNf85jCstrU/A/+CGnxvfbHcZoS43C7rFbt60yk1oB
	 DWrsg9XrWFo8Ya6tdd9P4SO/0tyWOvyeTXzPHKdC9PmMIIHQ5vJhD5LikEDx3aoyktANc
	 /HhUxG2Pc1m3vd5ZMEyWa2dKxoG96WMgN67ryR+QK24vFJ/gzEv1bNhQxj2/20ob2vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hjx74QNy+MSSsM7cOslayY0WHKegLjGzo68YRxpsEY8=;
	b=EmT8XFvXhg83r6CJDIgCfNxYW3iXrPuMmd7K2tQF38Njv0nSDMsuUghdgBakXwI42NEZ
	 A+7f0hy737DdlxUWn1WucWFSPp08jb/rUA+C46NfQcD/qmM67VDZ0eqZDFiAGTd5w1DQL
	 lsPDbR2PP+dn/BtagTWnrpScr1CvLtBrATlG1Bif6puvd9Smsdhj+Y0f7ObG9yvA1Vd3f
	 m4eU2N29V46aCQbkJMw4eseGSPPnqwY9iSKJ9JznI4cR3MXHre6SJlPrZ1Uwdm6jr1LiN
	 87P1gJsYCE99yxDr2TTrzZGZn7l6jIedsSWtQEkxlFRp3FVreTsisYsSsB5EI8VVB7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=nn7eVHwe;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D2606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=nn7eVHwe
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382f4710a17so1406794eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1795180474; x=1795785274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjx74QNy+MSSsM7cOslayY0WHKegLjGzo68YRxpsEY8=;
        b=nn7eVHweC7R5E4OUvSfI6YzB3MDRANV4gkrXAH2warTDTrW36vOXlgRkzAjkIzHRdE
         bIWYuBXD4xlmccodtq2NlbLynIrCkrcOpnVOQbANmHXv+/7oiBUKpCjdUG8n5/te1nCq
         87EWjHg+Wtv3SOravmSeqGmde1f/i8iGuBU4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180474; x=1795785274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjx74QNy+MSSsM7cOslayY0WHKegLjGzo68YRxpsEY8=;
        b=AQGHjSBdurZ6L1530VzTii7MzIQsp6sVkYLp7k2I9N2C33PL9pNNF8v5BKEM9wiWse
         s7Y4ps3GepFGZwiarrle9MsiLIuIpcjY8mKtjFELb5zgLqonZhaegfMuR7y+8AEv2R4R
         cVCNSZXV29V9DPJZYe31ihZ1OriA6mKaP6wuuwuiR2drfFDrN8NPOcoPJ2oes/6DD2zW
         IAXz9Z2EAqlGf6h1Asc/mSr3fk8SEKpBlQLWEkRsxGeWxvnfDKZiwNQ9aIoRGX9wWrZq
         Tkx3UU7gVhD+sBpS8AH67auUKug6xKpQBofzFkavYbUUVNdMHArUU8GDCNRSeoHT+Ayr
         rD2Q==
X-Forwarded-Encrypted: i=1; AL+hErEDXJ6qnXW8MUPyMxqfx26fgCrFEyt/2jraqxOtVHiHJNhxs4eicDWU14ruuczjP+/Y8/bTWddbZufw@vger.kernel.org
X-Gm-Message-State: APuU4Z+V2czmbs6LUTmW2r4XFd71kQjZofPDQBOHkrpLKFvI/v/kBAUf
	FVQgVvqRwNQXQ5hcWIRaIPFsUqdwD2L9jT5lszFUdGjqHmUj/tV7aM7akoGgkOARVpI=
X-Gm-Gg: AYBFou3a6A3oT0sTozCOxVBIjlh49aNM8otcVWEy+L+EwLfnjQ1fw2+Bqn9HDkTZoFz
	CKe/JuhsvTNZ6E9ZBlO8s2/iW5//IyEkPlotS+kaQzBN9FnhbvnEs2nYhyDQgUEFj+QxHU98CUW
	CRKZQapdO3D1frior/tSsBmmhj/lIHkGpi78dekIiyvBFT7Hy6acCE+XLkceMnA79jZVXfsywgb
	UcloGtzcnbpZrfpa+ymVHvxlmkcLLfCNWsbzDEIZLQ+gSNk/YODy3lJEdWpEx8OQfJ4dk2DSRbp
	8Ag7D3LhuXyPnKpQPpEQ65dgZ8CjkBblNPIfIRlOCpWFNjxTqLOSm/CP1Lxr4wjwOtb0w1WhzQj
	UgIej4t+OzE8pD1W+hah2cRAi0CKeDeKfYJ5o2HPjJnwSvGaZ/3OXR4Qeoc8mBE6g/fTQ32+d/x
	uMgNDWONfXfudKsgOic4p+mUSj+PS94HrzSyTe3XICybjARM8bq6hI5Nh2w6tnm6lc6aZMwBA84
	vnPR+3tkuRPqFJPw6qzy825iWh+v+/XedWW0lOHMy5GpZUTwGEwPeNrkHhdS11QSH6TzjzU+epU
	4njlHXJfGnPMJFv5Ess0SQ0jSe+L3VtRu1QLYEWTLmrxiWHBibIBvy4cuw5QEx3BxBYGUX7+DTK
	YR1p3hZ+N7fXUhA2fLDsbd1en3CGHy69jL3i9AOJGzZWUwPVT6EyYr2IB0LkYaESNiPrCoUy4VG
	eSorJA508JEiXqqw==
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr1060801eec.12.1795180474513;
        Fri, 20 Nov 2026 05:14:34 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm8900527eec.22.2026.11.20.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:14:34 -0800 (PST)
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
Subject: [PATCH v31 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Fri, 20 Nov 2026 18:44:00 +0530
Message-Id: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
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

  v30->v31 changes:
    -Added fixe based on the reports by Sashiko

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
 drivers/crypto/dwc-spacc/spacc_core.c         | 2407 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  861 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  340 +++
 drivers/crypto/dwc-spacc/spacc_device.h       |  178 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  349 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  113 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  365 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  641 +++++
 14 files changed, 6183 insertions(+)
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


base-commit: 04cd6899aaaeeab82afb97e58eb8619fde35b47d
--
2.25.1

