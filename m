Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2744C4E7
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322251; cv=none; b=hYlIbjpZrOFGmhPDgPxVmvac99RkoKr3Y3zZK2LSDAe/aHJqL037yVxg964/gHYITFFOH9qQMTt781+OunN2XAtl2VllcAAScfWpS/gTczy7bQ2LaOKm36V3oUvdx1Ber8zgl2BE0kBHyhG6/TaxgsSG37PX3kXj30Uhp33Mjx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322251; c=relaxed/simple;
	bh=X3DsB0afFtuot3Vq0UV0v2mYt1FkQrpk2UUnXkuVd48=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q7QfLjU2CvbFjnfAXXQTU37KgE4Imsbw1abEj6OHhldXune4FOekMCsPbAP27WbW0s9WiHnx6t9D1yDUEil2j3Cv8ZRn+A58z3SdvIAwskkNrgp6l7nEjzhP3DPnvpp7i9rG6WW4fAeHWO3j2txdF+tjrH5WISUIJvvEOJTUnTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4Qxgofq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4Qxgofq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D131F00A3A;
	Wed, 29 Jul 2026 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785322248;
	bh=QbXAfkqBu1XolvM54qHXz35AHJlP77fmFRQAcljQBuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W4Qxgofq2FMb+8mobtbjlznfTtkjjk0Xh5gNHTPNFx6koaGBQn3yL9TvyyFer2aoS
	 gGT9RTCDQud3lrOwGSTb+0q3pucJ/4JCnh8XHSbBUL2zS8WPgyf8PzVPKasGL0NVOi
	 jW6glHLPQBxQkCF/tTjefp62THdaIVSobF0EayT+Dcv4Auhyyze1nS/IZi6qD6d8OT
	 uSKlm9tuGtLyXs/njQMPTEc/vh/kVsl9jEzgLlG7JjY0INuFFAnhRVHZlCg0DT2H5X
	 vG5IJjUhn8Z/7myG29qcNXaJhWamBKQptvdbCiq25zB5ZLdpTNXpyOcqqei7W2FHnB
	 66AyFJIaIHDYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729102547.159890-3-pavitrakumarm@vayavyalabs.com>
References: <20260729102547.159890-1-pavitrakumarm@vayavyalabs.com>
 <20260729102547.159890-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:50:47 +0000
Message-Id: <20260729105047.C1D131F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver fails to set the cryptographic key on the software fall=
back TFM for HMAC algorithms, causing fallback operations to compute MACs u=
sing a zeroed (unkeyed) state or fail entirely.
- [High] Watchdog timer configuration is wiped out by `memset` during initi=
alization, programming the hardware watchdog to 0.
- [High] Secret key material is leaked on the stack in the error path of `s=
pacc_hash_setkey`.
- [High] Expanded XCBC key material is not zeroed before freeing in the err=
or path.
- [High] The error cleanup path accesses an uninitialized mutex and list_he=
ad if `dma_pool_create()` fails during hash algorithm probe.
- [High] The driver unconditionally rejects requests with fragmented scatte=
rlists when the hardware is configured for linear DMA (`SPACC_DMA_LINEAR`).
- [Medium] Improper mixing of `goto`-based error cleanup and scope-based `g=
uard()` declaration in `spacc_hash_do_one_request`.
--

--- Patch [2]: [PATCH v19 2/4] crypto: spacc - Add SPAcc ahash support ---
commit 58138bfcd81212e5b689e0ba4bfea94bf1880728
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

Add ahash support to SPAcc driver.
Below are the hash algos supported:
- cmac(aes), xcbc(aes), cmac(sm4), xcbc(sm4), hmac(md5), md5,
hmac(sha1), sha1, sha224, sha256, sha384, sha512, hmac(sha224),
hmac(sha256), hmac(sha384), hmac(sha512), sha3-224, sha3-256,
sha3-384, sha3-512.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c

[ ... ]

> @@ -288,14 +288,10 @@ static int spacc_hash_setkey(struct crypto_ahash *t=
fm, const u8 *key,
>  		memcpy(keybuf, key, keylen);
>  		klen =3D keylen;
>  	}
> =20
>  	if (!spacc_is_mode_keysize_supported(&priv->spacc, salg->mode->id,
>  				klen, 1)) {
>  		dev_dbg(salg->dev, "keylen %u not supported for mode %d\n",
>  				klen, salg->mode->id);
>  		return -EINVAL;

[Severity: High]
Could this early return leave secret key material exposed on the stack?
The key is copied into the stack-allocated keybuf array earlier in this
function. If the keysize is unsupported, the function returns -EINVAL and
bypasses the memzero_explicit cleanup at the end of the function.

>  	}
> =20
>  	{
>  		guard(mutex)(&tctx->lock);
> =20
>  		/*
>  		 * For CMAC/XCBC the shash fallback also needs the key so that
>  		 * the software path produces correct MACs when the HW
>  		 * context is not yet available.
>  		 */
>  		if (tctx->shash_fb) {
>  			int rc =3D crypto_shash_setkey(tctx->shash_fb, key,
>  						     keylen);

[Severity: High]
Is the software fallback TFM for HMAC missing its key setup here?
The key is forwarded to tctx->shash_fb (used for CMAC/XCBC), but the ahash
fallback (tfm->base.fb) used by HMAC does not receive it. Would this cause
fallback operations to fail with -ENOKEY or compute MACs with an unkeyed
state for large messages?

[ ... ]

> @@ -358,13 +358,11 @@ static int spacc_hash_do_one_request(struct crypto_=
engine *engine, void *areq)
>  	tctx->tmp_sgl =3D kmalloc_array(2, sizeof(*tctx->tmp_sgl), GFP_KERNEL);
> =20
>  	if (!tctx->tmp_sgl)
>  		goto fallback;
> =20
>  	sg_init_table(tctx->tmp_sgl, 2);
>  	tctx->tmp_sgl[0].length =3D 0;
> =20
>  	{
>  		guard(mutex)(&tctx->lock);
> =20
>  		if (tctx->handle < 0 || !tctx->ctx_valid) {

[Severity: Medium]
Is it safe to mix the scope-based guard with goto-based error cleanup?
The function acquires tctx->lock using guard(), but later uses goto
fallback to clean up tctx->tmp_sgl. The kernel cleanup guidelines strongly
recommend against mixing __free/guard declarations with goto labels to
prevent unexpected ownership and lock state issues.

[ ... ]

> @@ -950,11 +950,10 @@ int spacc_probe_hashes(struct platform_device *spac=
c_pdev)
>  	priv->hash_pool =3D dma_pool_create("spacc-digest", &spacc_pdev->dev,
>  			SPACC_MAX_DIGEST_SIZE,
>  			SPACC_DMA_ALIGN, SPACC_DMA_BOUNDARY);
> =20
>  	if (!priv->hash_pool)
>  		return -ENOMEM;
> =20
>  	INIT_LIST_HEAD(&priv->hash_alg_list);
>  	mutex_init(&priv->hash_alg_mutex);

[Severity: High]
Can this early return cause a crash during the error cleanup path?
If dma_pool_create() fails, it returns before initializing hash_alg_mutex
and hash_alg_list. The probe function's error handler will eventually call
spacc_unregister_hash_algs(), which blindly attempts to lock the
uninitialized mutex and iterate the uninitialized list.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c

[ ... ]

> @@ -881,11 +881,10 @@ int spacc_init(void __iomem *baseaddr, struct spacc=
_device *spacc,
>  #ifdef CONFIG_CRYPTO_DEV_SPACC_CONFIG_DEBUG
>  	unsigned long id;
>  	char version_string[3][16]  =3D { "SPACC", "SPACC-PDU" };
>  	char idx_string[2][16]      =3D { "(Normal Port)", "(Secure Port)" };
>  	char dma_type_string[4][16] =3D { "Unknown", "Scattergather", "Linear",
>  					"Unknown" };
>  #endif
> =20
>  	memset(spacc, 0, sizeof(*spacc));

[Severity: High]
Does this unconditional memset clear the watchdog timer configuration?
In spacc_init_device(), the timer is initialized before calling
spacc_init(). Since this memset clears the entire spacc structure, it
appears the user-configured timer value is overwritten. Will this cause
spacc_set_wd_count() to program the hardware watchdog to 0 later?

[ ... ]

> @@ -1189,11 +1189,10 @@ int spacc_compute_xcbc_key(struct spacc_device *s=
pacc, int mode_id,
>  		if (err !=3D 0)
>  			goto xcbc_err;
>  	}
> =20
>  	/* now we can copy the key */
>  	memcpy(xcbc_out, buf, 48);
>  	memzero_explicit(buf, 64);
> =20
>  xcbc_err:
>  	dma_free_coherent(spacc->dptr, 64, buf, bufphys);

[Severity: High]
Could the expanded XCBC key material in buf be leaked to the DMA pool?
If an error occurs after the keys are derived, the buffer is freed via
dma_free_coherent() without a prior memzero_explicit() call. This might
expose sensitive key material to other devices reusing the DMA memory pool.

[ ... ]

> @@ -1336,10 +1336,9 @@ int spacc_packet_enqueue_ddt_ex(struct spacc_devic=
e *spacc, int use_jb,
>  	if (spacc->config.dma_type =3D=3D SPACC_DMA_DDT) {
>  		pdu_io_cached_write(spacc->dptr, spacc->regmap +
>  				SPACC_REG_SRC_PTR, (uint32_t)src_ddt->phys,
>  				&spacc->cache.src_ptr);
>  		pdu_io_cached_write(spacc->dptr, spacc->regmap +
>  				SPACC_REG_DST_PTR, (uint32_t)dst_ddt->phys,
>  				&spacc->cache.dst_ptr);
>  	} else if (spacc->config.dma_type =3D=3D SPACC_DMA_LINEAR) {
>  		if (src_ddt->idx !=3D 1 || dst_ddt->idx !=3D 1)
>  			return -EINVAL;

[Severity: High]
Will this cause unexpected failures for callers providing fragmented memory?
The Crypto API requires drivers to handle standard scatterlists, but this
returns -EINVAL for multi-segment lists when using linear DMA. Should this
use a bounce buffer or drop to a software fallback instead of failing
dynamically?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729102547.1598=
90-1-pavitrakumarm@vayavyalabs.com?part=3D2
