Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6D3A5436
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457222; cv=pass; b=JqoMGK/VaIbCAebweoXMYRVNALm02Tl/1/x7GV1ptXHX1OXuzu3DzQSzqcCadjtOXF6Y7xNs0nyI3k0kBafVk4igw92AnwwCR0wOdM3DwPnUzuQOvyBIS0+kGqhCwYVF1NGa7997H+MLQqXSPr1siiNxViPTjHokGdLE22AEf7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457222; c=relaxed/simple;
	bh=NrVwbnRf59unhOsrXCIyeiRUOR0BJBLn9nWOON7xPhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fl0dhYiTHAAEHf3LrfnijkY8CmQdmwzsIuEODTxP+g8eNJPuroNdGmDRCAy45pM55Uu8jbsLmnM/CVy68JaCzIFib0r1yaNrsyhRFwlx5iIbh0AcfiT8cGAZUf0QOZdnGyGKC66UpW7crO78wMMZ03DcjX/TVr5tgQ8RY/dXlfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=RVCPbJgX; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="RVCPbJgX"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8eab809593cso1089703885a.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777457218; cv=none;
        d=google.com; s=arc-20240605;
        b=Hc1URfzCSKHHGl/UD5SZTfkoVGJP+xX0MQiOWqWwq9oAV51ucJsN7dkBNFrAT+vG58
         hp0l0hW90H3auqm0HRvhx3dCE1F3AZy/KTN5JGjjrdo4vOdVR6+SLaeSAufbVRcUqrCX
         WVxwr96/FQvpTL9Aj6v0v6Cx4ClXBNwjuCdzWZJvwgUFL3Qp96Q76YmPKfoZlvTbejGc
         QyrRyku8YTBGKfbsQgoaOMMIZFEJLGjVFG1SDzOq5cSJyTFrwrs3hSD4zFT3te9bYRs5
         BBfvef44nz6Rxd5MG8IzNgeszBfJMLaXWTLUCi7R6G9DwQgTu5o4QpM40IFPVja/qg2j
         I/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4DO/tfjkPqU+ktY8J5E0GpaarX806hi+MGfXwfnc8Pg=;
        fh=YZiL4juPMt3Lge3p6P9GflP/tSmJunGxoAgGif37TbM=;
        b=jUdaW9EGHWq1Ls+1Ud8eG4Dnd39J2LkKqzyYVoTtB5P+TRTHMrCWJ1EyPOdx7g5aXR
         79PUqyLVOgcNGzbpyMtdXnbtMbnpaguAmzjifTqaEVzqsuE45XtelwICOFKfh59YzR5V
         aa0BQZttcA39GifiYYj2o8mKmqrQtfSBkX0XUNllZijWZHiKFJltwrmuupTfcRJ2e4IE
         o3uXOaKWcG85/HrrIrZXTcTSv2fOw+8tuLnvPIfl8Z+5mDOk4CrElUJYyseIUeijqmOj
         S3IW3yWBy4SMxmwl1C/Z9+BuxM45NnxbyTIFcAwlW8xQ7y0gjBFNlzAwqhQPznM2OME/
         DKWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1777457218; x=1778062018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DO/tfjkPqU+ktY8J5E0GpaarX806hi+MGfXwfnc8Pg=;
        b=RVCPbJgXzAvll+B+U8HDxSwedMFYJeUg7ETOJ0RB5mdKVyaUNAyJGCsSVWjD67lQnJ
         wsKNqfREitQXnwpDllANHEzvUKn+rNSSC2JDdzcqn36beaoNBK+G/TXf8rLBD3bDi3RE
         Y2IMcgeP8sPmBOwaLjl79eK4a4LKayPNlwLzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457218; x=1778062018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4DO/tfjkPqU+ktY8J5E0GpaarX806hi+MGfXwfnc8Pg=;
        b=BLO9arTFjdSDXaFEWdKSzUlU3+zntd4qgZCEYrefHKzRT2NNUQkTWSkrrGGPC4a5Eo
         8S8yY2qsWIQVAbj3KmMX5ZyILs/IKjcWff1Xo0W17/jyMWV4eh9EQAhM4wJsT8JVmSHW
         cgQHY4J8YLcVwB/o4k+SdFLJgdi+wSEbISGl+234NHXtKVpYzQGrAyCuOJvQ49TXRHx+
         EqgcM8ebVcXWgQzcNolaxSGCAPtmWaHiqvuGMPn10CnYihmUh2eP9oefCrOiQeuWYknC
         nxOzFSpQ1uObB7z/PwziiCEqwIYA+HLJkIgLGU8VsNJ+BR4I9BJYhN6uPUIrbhUQR19j
         +n1g==
X-Forwarded-Encrypted: i=1; AFNElJ+qLknXHDTIZocEnUnZld2DRM0ycD5krKChrZyH8h3YbzEHdbDIkPJPTyBR6PgM6GgH8NNxJte5aOb7@vger.kernel.org
X-Gm-Message-State: AOJu0YyeLG4TTA0mkLjKzslEoDyemSFDIhtFT3VqGKHOA+sCwRFjSPQt
	mfcyBSEGJOPESjPTvHj1y9IXa0K9OGA3P2Cv4q8rrWkRBX+J1yHeywN/NiY6E9VkJwBKtU7neHy
	e9yS+qmAb4H26Rtc8alR4LI9FkCFnBO0CaAcjsR8aCg==
X-Gm-Gg: AeBDievr3SqL46aAmHHF8KcqZLAp9Ln4opSXv040PdxzuTJEJqdDkKWY/netQHompIx
	eBHt8vdZ8Y0ThlwauhGgQZzE0VtYtqqW24W24Zf71Sy8BVTio1qNaCNl0d7bi26BPY+PvZo8mLZ
	lgnOMaFPF037eXZ9vwG4I/EFeC06ZFGtYAv2BjbBRX+B5FKpd8MSg9EkfdOtQZBhmal8mSiUNTM
	ePHN4xWFJQ48CVeqsFSINB0ACG9VCSpQSAOrkH8KnSeWC3sywk8JB+7DImS+ETd4N0eHIuO2Ag3
	O6+m3NoUJMx/NG8Epry17myYambJsdmwbAR2yHKrpnfqOED8oBy8h4B/xJNo0vGjkbS56omvmQa
	GQHs3kWs0n62aZ6tfaDdbH0cr4vL+7hrvF1z8ygT4uSuKIqCnAnETM4USYoya3/1KjXQ=
X-Received: by 2002:a05:622a:4d4c:b0:50f:b137:3099 with SMTP id
 d75a77b69052e-5100e199ac9mr93918401cf.33.1777457218431; Wed, 29 Apr 2026
 03:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416064451.99886-1-pavitrakumarm@vayavyalabs.com>
In-Reply-To: <20260416064451.99886-1-pavitrakumarm@vayavyalabs.com>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Wed, 29 Apr 2026 15:36:47 +0530
X-Gm-Features: AVHnY4Jp3Grdhenzh7n8H9-weUmlEMcrpSeNpIbOkj0l-M6K9ZDxC4KEKFt44b8
Message-ID: <CALxtO0nQo1YkFWFtP-AptNdoWUJWoEPPtNt8NRUP5myLc6FNHA@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] crypto: spacc - Add SPAcc Crypto Driver
To: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org
Cc: conor+dt@kernel.org, Ruud.Derwig@synopsys.com, 
	manjunath.hadli@vayavyalabs.com, adityak@vayavyalabs.com, 
	navami.telsang@vayavyalabs.com, bhoomikak@vayavyalabs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herbert,
    I have submitted v12 of SPAcc patch series to address the feedback
regarding SM3.

The changes since v11 are minimal and mostly focus on cleanup. I would
appreciate it if you could take a look when you have a moment. Please
let me know if any further changes are required or if this is ready
for your tree.

Thanks & Warm Regards,
PK


On Thu, Apr 16, 2026 at 12:15=E2=80=AFPM Pavitrakumar Managutte
<pavitrakumarm@vayavyalabs.com> wrote:
>
> Add the driver for SPAcc(Security Protocol Accelerator), which is a
> crypto acceleration IP from Synopsys. The SPAcc supports multiple ciphers=
,
> hashes and AEAD algorithms with various modes. The driver currently suppo=
rts
> below
>
> hash:
> - cmac(aes)
> - xcbc(aes)
> - cmac(sm4)
> - xcbc(sm4)
> - hmac(md5)
> - md5
> - hmac(sha1)
> - sha1
> - sha224
> - sha256
> - sha384
> - sha512
> - hmac(sha224)
> - hmac(sha256)
> - hmac(sha384)
> - hmac(sha512)
> - sha3-224
> - sha3-256
> - sha3-384
> - sha3-512
> - hmac(sm3)
> - sm3
> - michael_mic
>
> changelog:
>   v1->v2 changes:
>     - Added local_bh_disable() and local_bh_enable() for the below calls.
>       a. for ciphers skcipher_request_complete()
>       b. for aead aead_request_complete()
>       c. for hash ahash_request_complete()
>     - dt-bindings updates
>       a. removed snps,vspacc-priority and made it into config option
>       b. renamed snps,spacc-wdtimer to snps,spacc-internal-counter
>       c. Added description to all properties
>     - Updated corresponding dt-binding changes to code
>
>   v2->v3 changes:
>     - cra_init and cra_exit replaced with init_tfm and exit_tfm for hashe=
s.
>     - removed mutex_lock/unlock for spacc_skcipher_fallback call
>     - dt-bindings updates
>      a. updated SOC related information
>      b. renamed compatible string as per SOC
>    - Updated corresponding dt-binding changes to code
>
>   v3->v4 changes:
>    - removed snps,vspacc-id from the dt-bindings
>    - removed mutex_lock from ciphers
>    - replaced magic numbers with macros
>    - removed sw_fb variable from struct mode_tab and associated code from=
 the
>      hashes
>    - polling code is replaced by wait_event_interruptible
>
>   v4->v5 changes:
>    - Updated to register with the crypto-engine
>    - Used semaphore to manage SPAcc device hardware context pool
>    - This patchset supports Hashes only
>    - Dropping the support for Ciphers and AEADs in this patchset
>    - Added Reviewed-by tag on the Device tree patch since it was reviewed=
 on
>      v4 patch by Krzysztof Kozlowski and Rob Herring (Arm)
>
>   v5->v6 changes:
>    - Removed CRYPTO_DEV_SPACC_CIPHER and CRYPTO_DEV_SPACC_AEAD Kconfig op=
tions,
>      since the cipher and aead support is not part of this patchset
>    - Dropped spacc_skcipher.o and spacc_aead.o from Makefile to fix build=
 errors
>      reported by kernel test robot
>    - Added Reported-by and Closes tags as suggested
>
>   v6->v7 changes:
>    - Fixed build error reported by Kernel test robot
>    - Added Reported-by and Closes tags as suggested
>
>   v7->v8 changes:
>    - Fixed misleading comment: Clarified that only HMAC key pre-processin=
g
>      is done in software, while the actual HMAC operation is performed by
>      hardware
>    - Simplified do_shash() function signature by removing unused paramete=
rs
>    - Updated all do_shash() call sites to use new simplified signature
>    - Fixed commit message formatting by adding "crypto: spacc - <subject>=
" to
>      all patches
>    - used __free() for scope based resource management
>
>   v8->v9 changes:
>    - Updated the software fallback implementation to use HASH_FBREQ_ON_ST=
ACK
>    - Corrected dynamic allocation of statesize and reqsize in init_tfm
>    - Fixed synchronization issues in the digest request
>
>   v9->v10 changes:
>    - Fixed unused variable warning
>
>   v10->v11 changes:
>    - Removed the redundant crypto_alloc_ahash in the init_tfm function
>    - Removed the redundant crypto_free_ahash in exit_tfm function
>    - Removed the redundant crypto_ahash_setkey call in setkey function
>
>   v11->v12 changes:
>    - Removed do_shash() and switched to lib/crypto API in spacc_hash_setk=
ey
>    - Dropped support for SM3 algorithm
>    - Improved multi-device safety by encapsulating handling within priv
>    - Added memzero_explicit() in sensitive paths
>    - Minor code cleanups and style fixes
>    - Algorithm registration cleanups
>
> Pavitrakumar Managutte (4):
>   dt-bindings: crypto: Document support for SPAcc
>   crypto: spacc - Add SPAcc ahash support
>   crypto: spacc - Add SPAcc AUTODETECT Support
>   crypto: spacc - Add SPAcc Kconfig and Makefile
>
>  .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
>  drivers/crypto/Kconfig                        |    1 +
>  drivers/crypto/Makefile                       |    1 +
>  drivers/crypto/dwc-spacc/Kconfig              |   88 +
>  drivers/crypto/dwc-spacc/Makefile             |    8 +
>  drivers/crypto/dwc-spacc/spacc_ahash.c        |  821 ++++++
>  drivers/crypto/dwc-spacc/spacc_core.c         | 2413 +++++++++++++++++
>  drivers/crypto/dwc-spacc/spacc_core.h         |  838 ++++++
>  drivers/crypto/dwc-spacc/spacc_device.c       |  275 ++
>  drivers/crypto/dwc-spacc/spacc_device.h       |  236 ++
>  drivers/crypto/dwc-spacc/spacc_hal.c          |  374 +++
>  drivers/crypto/dwc-spacc/spacc_hal.h          |  114 +
>  drivers/crypto/dwc-spacc/spacc_interrupt.c    |  328 +++
>  drivers/crypto/dwc-spacc/spacc_manager.c      |  610 +++++
>  14 files changed, 6157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spa=
cc.yaml
>  create mode 100644 drivers/crypto/dwc-spacc/Kconfig
>  create mode 100644 drivers/crypto/dwc-spacc/Makefile
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_ahash.c
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_core.c
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_core.h
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_device.c
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_device.h
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_hal.c
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_hal.h
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_interrupt.c
>  create mode 100644 drivers/crypto/dwc-spacc/spacc_manager.c
>
>
> base-commit: 8879a3c110cb8ca5a69c937643f226697aa551d9
> --
> 2.25.1
>
