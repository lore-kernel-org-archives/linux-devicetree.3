Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ADF32AAAB
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 04:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775189418; cv=pass; b=JkbUuGfHv/1hBkY9RJW1xoZNMrGzGlNgmnS613JLnfDRV+a9ujV48Eq6j1D3Q58cX7jbG5oOc9JzFnaDjQJH7JwvYMj1IGqijC2TKglTkQ3pkiLWdoVxVs8o4jcNWFHlsxFP3yl3LSJfvJpVUp5+XbpGgbabTJKGN4pc/qoUaBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775189418; c=relaxed/simple;
	bh=8ppiMXufLA/kFWXI+XW0edobmt25DPORQ9//T8zMYiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBQdGvi0nSbdRAoIq0cgwFKV1EQcIObwaiDeGKBw1SyLfRcwAe/7RIkxITz5BnDuMBTyh95iCLZzw5XTYTq3OfPXI8UdOqZyIFdCPVlAlzZ1L8e5l4YU7U3zfx0a2ywfTFYQvvdZYAthm4YjIaS693jG/MoCisKTjW/2XQnMOo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWQQ+elv; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWQQ+elv"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66e52d8ab73so92246a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 21:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775189415; cv=none;
        d=google.com; s=arc-20240605;
        b=WYdX1G1vdWb/klU+Ry2LSkYlFeyBlr6oNjsZ3Mz/Xw0Y9qodp6wAu1juD8LjCqElIi
         2jB/ClCQVMaP1a+INQYfxQ2U0ZuXFjkt0Q3c+e8UFm613Hu1RTHrbqZuB4gaU8tvmWGX
         G4TRS85gzuV71YIhhFVb1fl8YsuzA+cCmnlETsLc66qw+2icu/vR1OUPhzvPeB7fFlYV
         7fP+UHrH5tzxNRYWLqQ3yVdi5R6b1h594gDd1Rd1n3GBzDqnJA2H8TdXkk2Lcze32yD4
         9TiMuhpVn70K4a8BYpJrQnM4cFvhnl1sRmmg0SdLjDxYOlujP/43ujukbiOxPGU1Rn9/
         CQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MQSjk0t+ENDTZIZmtMaYlDzt00D+esO1IY7w8JmAigY=;
        fh=yeFEZEMHkEI0EKMK4UlVMWSSqvhpqeBgftdm3L2cP14=;
        b=YNLzY7IdTzXRbUOg6NBWHsKccomLqxH6u+U4zwC2e7opZtSK0APXVewWAcQtiWETUs
         5h4XjMZl+ms+wDPlJ+udgWbCLmpHr/dTI7K2mKk5QYiUJaVND+Wl+3MMEn9uWlFEwvyw
         BRfzDWwIMOsSTngPDsZ5y8SnDYSQZnvGrmYHfL8LultW2fnAR9Q9s+5gH1UUsznJ0Cwq
         Bk1rA7WA6nn53BDwa9RssO2wGsSZh6+7MdLc+ZX7bQ6bAjmaUH3RauJygs0oPrGTbbZY
         HVaK1F6dl+opeY+qwburGSr3sQpviVsuJxjePK2ATThbjMnenzGrA28tEMHWzduBh65n
         1Pcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775189415; x=1775794215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQSjk0t+ENDTZIZmtMaYlDzt00D+esO1IY7w8JmAigY=;
        b=hWQQ+elvv/uont9fh6Iyj+yI2QduYtFYYwHAfLua2QXsKNpA/v9TROWY1KCBNOWSoQ
         mZDdBrMzr7fjArIxZ0bBeplZg9YfRPFHBtpUctkypx1oV8YwcNLIKRjJlAnuTbS9krld
         U+SPBFAdsGqu75Ne20XAOU5QO6gBdfE2okqMFjTPnfRn1nKmYhk7/2ds4+GC3nmbSjBn
         OcyZDZrIZfXKC3KgRQJsPgOhnks3oqhT22DKwpk1rn07oUi1704PDbqp3G+H1frQb2+3
         GUiT65FUigXxaZdt/Zkfy0xRvCCo+AJtB2TQodBraYxzBZZGUsNyO5dDW4hl5zSAs/Fn
         Qpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775189415; x=1775794215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQSjk0t+ENDTZIZmtMaYlDzt00D+esO1IY7w8JmAigY=;
        b=qYslwQVFmJ0iO8CDPECgUKowOZbIOiANV0nQfwSj8g1E+s2snQI8APZLAnLeqLo1vg
         eVztXR1YPLZCjK6zkvVbCKOYfsRmQw3hgeBD3K5Aj48pGT0jH0ig8LzdTqUymy10o+1W
         ousGijsyB/sjVT0Tclwn73iRFsS0U+MCuK8xqZpUdPseje00ta/tLUPZzL6QcMyjjGSs
         17txB5c52/UXSM6X1BHf5wdiAX2GgmMFzsLlebS2RdIa5TSYP4VcIOPIVt76yHkdCdWk
         kYtwzsvIvZRek5c1hKDIPQDVoop1eytTrD1rYKsJosdbd1qJ8Xu4AveM/iVkR/VJd1GK
         oMVA==
X-Forwarded-Encrypted: i=1; AJvYcCWbIDMmldweCDzaU3yE5vbfWictFSGeqt10lD6yEPdy0di4Um4lGQgFLg+uV4k39Yi6V+SUU1vlggj5@vger.kernel.org
X-Gm-Message-State: AOJu0YxLCebu9SNLFCcJ9xXjQIiSeS94s5BLg+8z1MW6Rniw7zfd3at1
	zj38ALfQjK9/9HfsPa9agyjeHx2sc+vFjch9b4roW/70c6JX2uQzRJ7FPvjRo1N2DwBstArqkV9
	TPIPdy3vHJs6zAuy9cULadwMgGCdrZ2k=
X-Gm-Gg: AeBDievABCaugREdJ0xe7NfkIYUjZTkfQ2KijzTAjj4r0f2KeTPKC4+vZRa7/B09lQK
	GVOPv2Tm+HIxMiVThd6X+sEftLA8D8Ogf1Gs+dRS+lr5jFbzObD4eMWuoeddX2Uev7S6wYkN6OY
	QcZHbW1Zz/eBLyFgd+EQEhFgGT061ZQzaM/+SeDYvy6T5iIuvK3tYy0e2paFbJVpydxAnv7u48J
	RR2TF2dTKg1xvfH555z68K3J50zLeK2sEcv50pIy2yXGNP1aFl5iTbxe1XvvCA0fRkLg2aViGtN
	HTI/6YFH
X-Received: by 2002:a05:6402:538d:b0:66e:1971:e43b with SMTP id
 4fb4d7f45d1cf-66e3e8b71b8mr666558a12.0.1775189414724; Thu, 02 Apr 2026
 21:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318071808.817074-1-pavitrakumarm@vayavyalabs.com>
In-Reply-To: <20260318071808.817074-1-pavitrakumarm@vayavyalabs.com>
From: Tony He <huangya90@gmail.com>
Date: Fri, 3 Apr 2026 12:10:03 +0800
X-Gm-Features: AQROBzC4X2v1r_d4TJ320nBj-a6NY6jBHZE8x221VtpUZqvaP2bJhZ7gsQyG-AU
Message-ID: <CAAUX2SVmu+_Avs=6ipdJY9iciig4w6DzGNGaH_ZQf+LNqR=KVA@mail.gmail.com>
Subject: Re: [PATCH v11 0/4] crypto: spacc - Add SPAcc Crypto Driver
To: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org, 
	conor+dt@kernel.org, Ruud.Derwig@synopsys.com, 
	manjunath.hadli@vayavyalabs.com, adityak@vayavyalabs.com, 
	navami.telsang@vayavyalabs.com, bhoomikak@vayavyalabs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a question regarding the capabilities of the Synopsys
SPAcc (Security Protocol Accelerator) in this driver series.

From the documentation, SPAcc appears to be more than a generic
crypto engine and is described as supporting protocol-level
acceleration (e.g., IPsec, TLS). I would like to clarify the
exact scope of its offload capabilities, specifically for IPsec
ESP processing.

Is SPAcc capable of handling full ESP packet processing (i.e.,
beyond basic encryption/decryption and authentication)?
For example:

Can it parse ESP packets and perform decapsulation
(removing ESP headers/trailers and returning the inner
payload)?

Does it handle sequence number processing and/or
anti-replay checks?

Or is it limited to crypto operations where the
driver/software stack (e.g., Linux XFRM) must handle all
protocol-level processing such as SA lookup, replay
protection, and packet decapsulation?

In other words, should SPAcc be treated as:

a protocol-aware data-path accelerator for ESP
(with partial packet processing), or

a pure crypto offload engine where all IPsec
semantics remain in software?

Clarifying this would help understand how the driver is
expected to integrate with the Linux IPsec/XFRM framework.

Thanks.

Tony

On Wed, Mar 18, 2026 at 3:22=E2=80=AFPM Pavitrakumar Managutte
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
> Pavitrakumar Managutte (4):
>   dt-bindings: crypto: Document support for SPAcc
>   crypto: spacc - Add SPAcc ahash support
>   Add SPAcc AUTODETECT Support
>   crypto: spacc - Add SPAcc Kconfig and Makefile
>
>  .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
>  drivers/crypto/Kconfig                        |    1 +
>  drivers/crypto/Makefile                       |    1 +
>  drivers/crypto/dwc-spacc/Kconfig              |   88 +
>  drivers/crypto/dwc-spacc/Makefile             |    8 +
>  drivers/crypto/dwc-spacc/spacc_ahash.c        |  886 ++++++
>  drivers/crypto/dwc-spacc/spacc_core.c         | 2413 +++++++++++++++++
>  drivers/crypto/dwc-spacc/spacc_core.h         |  827 ++++++
>  drivers/crypto/dwc-spacc/spacc_device.c       |  276 ++
>  drivers/crypto/dwc-spacc/spacc_device.h       |  236 ++
>  drivers/crypto/dwc-spacc/spacc_hal.c          |  374 +++
>  drivers/crypto/dwc-spacc/spacc_hal.h          |  114 +
>  drivers/crypto/dwc-spacc/spacc_interrupt.c    |  328 +++
>  drivers/crypto/dwc-spacc/spacc_manager.c      |  610 +++++
>  14 files changed, 6212 insertions(+)
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
> base-commit: c708d3fad4217f23421b8496e231b0c5cee617a0
> --
> 2.25.1
>
>
