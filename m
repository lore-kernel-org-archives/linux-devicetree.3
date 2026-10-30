Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381150;
	b=3jb4MnRFE1POKtwvOdVVQBNs6Uh/orOCtDVWHnTyOlnGjUm2E4G06FeUl72pWx6+xge6
	 BFnVhChtIpDoMNLxEc4jkV439dfAFKzD57YDNEKHm+nw0Es9q5RhHaDs2XSGP0YlA3mwE
	 OGamEl4V/KwQSNKDZSSrfNf8cuRU+T5fS7LcVUGEC2XDcd0OXe45vectgnmxL0eLX0mEI
	 90mQ8f7JCdB0H49dI56a5Xn7bQ0EGhBzRG7G00THuw0o4WiAZGfnkDpVTfARoYgS4zkF2
	 wlhClW+41b15gnuTfpHXCGT20aQ+YZYKpPgAJw2yDEj/kK6wPnKUbdjt6KigStAB/YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bY23m8oqDMUYdoZaW6EqRfZm2SbktefieM9kXqauMu0=;
	b=LEQ4RmWOwexG3/aldiCb6BUA/uyAroLudsCTXIF6i1Vj9+xBvWXfc9tvX1mtbm2mlz3c
	 C6F8DEkxR6U/xALevQiBVc6AhTmjC5uC2Sn6EJ41cxHBPv8wwtEAX/7aYddJEnVg6vyXO
	 XVhrDk/SUEQDCTwVCBRfRT6QGkaKKNUau4O1+HKdEF6sTb43K4TrvhowJHu6Gm6S4WLUS
	 Dsa9kin6+qiv9AYvp7KMR4jq2CggucEUN40+O99gFTxihDuAlvW65Gin5iPP9VnbX/od0
	 aVxAtD1ppJrGsDwmtunFtdtCJpodKtD4sw58CWOlwE2hXTO8nwIeTdb5ucb87DNmClA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b="VDDEhvd/";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B8606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 17:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=VDDEhvd/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a17a332ecso1824755eec.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1793381148; x=1793985948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bY23m8oqDMUYdoZaW6EqRfZm2SbktefieM9kXqauMu0=;
        b=VDDEhvd/OMVT2NQ/bXA4lOCUDTfvdWv8l3EpL/XQ7ARxVAtvqXO69ETX1uM535cm0u
         57GatGEjcRGU9ri2ol17wIEkPXYpcgKnmj1X2/xXV5ZA94ur4grRYrxp5tlviq7+d3Ny
         1FET43C/FJqiTEXHjTkmwRhnaAjh49nTtWW3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381148; x=1793985948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bY23m8oqDMUYdoZaW6EqRfZm2SbktefieM9kXqauMu0=;
        b=LPI4dmVRrT36rXgrNuPMBKHnuzLm78RQgS6gnOsOZN5Cugt2T93xoGSL1ghgjowVx4
         Pdno1hGt+aoDlFcGdLrI8dSOdfngVEgC58d4XiyF7sUtSF7jaGW1ZXoGs5Px3wyqPrD6
         28wQjNWJuOS6guaAED/AMrU93ddw2AJmXuV+FWnkFMOu7B4713R8sPSclFfs7C/SIPW0
         eLI18CbVP+BTk70RZq0TkcXvwYVwh4euyqMcJuWTFRVUZ7MUcSTC93JI8Vhwy9Z13Z7Z
         zs8/lYLiu/JRqj/qJDdZ8yYtoX6Gem2YdNVfaWZZsaRewEpsPu4DZCEfPODSi0ItngKU
         fLdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj23O6dsXOz9ZpvZ2zkaEhPjODMMtflv3jIZQ2QZjaj2dUFoKw5j/tq/R6rozjAs8kAtjn6P+VPOsA@vger.kernel.org
X-Gm-Message-State: AFq9FYIe2Q5s6IcMXWpn9gOhTdKt7DmvQSP0aAb6KqziAHIDf81XZTXL
	EZx+HjBGeEyRQrcVfmM2I/R/HLGH/S4yGUQKGfwLumRLLoNOizV+U5w68E1PuKXiH+M=
X-Gm-Gg: AYBFou0O9ZapuoxG9OSUHSLiO1mT723aRv62b4wFw7p4YkkuZxd5MRdlUI38sFieniH
	XiFIuE1JfVjTPYcdj8rXsjnVb2+336XXLt0/57CfYRoSceRFMqJpliQ+B+sAyUe2RT99VQ1WNV5
	95TIMD3eA8nw7ckGQUMkdRCUXB8/th34Vyy7uwJdn0TTb9Efse94QNHtRSaRfcjPo2SXiD6dOSQ
	DjLINPnFgDv7l2Trh4lzWfA22db0pVEDotsuC8uJz42wNDqDYwAyAHvpMFRK8IIDQvDxLhtZhlj
	4+4y2fd0HA0hyCKaQFuvrYr0hL2tWBryDOsylfXKYbb780KMcjQk/A0zDfibiWdtQ6qLfyCUn7i
	jkNMejlY9UXByO2XuPu9/IUcUHEXx+8TMtQy5zLkGvrJ5aRZFtnkGss6h1xHWVjkBsvl5Swwzes
	r+q3bbQnGua6HRDmNWtpaMkvr5j+6OTSnj7xMylQprxpf6WE/QTOtjGse580EZybyau6c9N3xDx
	3RG+j0P2VgO8GI2ecJQDl3+0ujMJsb4FiMvzmBUs3e9czs16QMwRTyrlqRM/303Fc1fVheofCm0
	Zm/2y9X4pV6t0yarg+YLEAugQLegoqhtVNEBzTMCj2sGDO5qrbCp0nn7FPHNj3fXrw4IRbse5iI
	5MGIagOTt2fWNN4t8zIVrpqy84ULZlTusnJdXuy3YulwmV0kfPH5YMepn3ihU8A6B306U
X-Received: by 2002:a05:7301:4b10:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36a424940d9mr4335669eec.38.1793381148108;
        Fri, 30 Oct 2026 10:25:48 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm7641152eec.10.2026.10.30.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:25:47 -0700 (PDT)
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
Subject: [PATCH v27 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Fri, 30 Oct 2026 22:54:52 +0530
Message-Id: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
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
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  857 ++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2529 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  863 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  324 +++
 drivers/crypto/dwc-spacc/spacc_device.h       |  181 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  349 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  113 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  360 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  657 +++++
 14 files changed, 6356 insertions(+)
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


base-commit: 178aff4cf425b3fc51ff09c571fa1bfbc1eb8ea4
--
2.25.1

