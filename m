Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346ED30C177
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949420; cv=none; b=AVJ1I4348PUzW4maW/pojjfycJyXWOddqe6GFfjigx6+t2q6ziTu6olSmhG9lQnrEINcsjM5eAbwMrHOnC6ZDel0N7KGGJwWJ+fIFi1ZeTWmfvfLQuJn5CGcCNYjxCpdC2U7C4ZmmZ9qYn2qXucQsHHyPXSztloFRMi4mpZawcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949420; c=relaxed/simple;
	bh=2ciiCgHveT66NRYA4uJZHxLUAaMfXPcI+51s7oiWsTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KR+VL/uLFg7M6M1MiQvi2ujp+FtFbZph/qp2nO+kayo5i7hp6crbauBjN2nmUTVPqw4tJOD8fbBDePEjGqfJTXXiQf5zWC7mT8eE0eVdD9g67XrTRB31bMLf5aeelmG1Tl6/Jr9M/YFO8b5K7uuEMoS1nZdTRw0VS7TWn5WZucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcyFEYQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcyFEYQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A641F000E9;
	Wed,  5 Aug 2026 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785949419;
	bh=O4OfVHWGlgVcCrk33K2yJdZcBqzi9cOw77TQEf2YvhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LcyFEYQlmKTaUHiCB/GlhBNzixpl0n5oMGl6lhpzO0tFqwPmH4lZgN9mL4TVePXlV
	 1xy7V8B6rxfs/xk4bfaySgYdF1LoAzgqfg4Hz8QWXavS6wOqtPAS2I50JVAk9/NGfV
	 tqLMBCQGYQcPeA2ySqgj27v2LMNUjQGPAMiRdqWMTUcWzbnEcGXrJoeaYuVGFktKeg
	 Q7ClLvR/0VporV2oIa/n/NVpZvhDS1+QwZqBrgX4IVyL5PPCcEIEYwEh3ZL+5F6SrY
	 g88X7/olI6hYdyrWeMq9ul4KvNTzvCACbRGgZBp4CXRm61FfniDaOEXwEgx0D5KHnC
	 mR685EF8ECjpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805164815.249328-3-pavitrakumarm@vayavyalabs.com>
References: <20260805164815.249328-1-pavitrakumarm@vayavyalabs.com>
 <20260805164815.249328-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 17:03:38 +0000
Message-Id: <20260805170338.D5A641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Invalid SPAcc hardware error codes silently inherit the error code=
 of the previous job.
- [High] The driver destroys `priv->hash_pool` before flushing `priv->spacc=
_wq`, causing a use-after-free and NULL pointer dereference.
- [High] Device unbind does not abort active hardware DMA operations before=
 freeing memory pools.
- [High] The bounds check for `max_msg_size` evaluates a stale `job->post_a=
ad_sz` before it is initialized for the current request.
- [Low] Mixing `goto`-based error handling with `guard()` cleanup declarati=
ons in the same function.
--

--- Patch [2]: [PATCH v20 2/4] crypto: spacc - Add SPAcc ahash support ---
commit cb79dfbdb65681100404de73653add59ebf089c3
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

This commit adds ahash support to the SPAcc driver. It introduces
implementations for various hash algorithms including cmac, xcbc, hmac, md5,
sha1, sha2, and sha3 families.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> index 0000000000000..4dfe1fd979ede 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
> @@ -201,16 +201,16 @@ static int spacc_hash_setkey(struct crypto_ahash *t=
fm, const u8 *key,
>  	}
> =20
>  	{
>  		guard(mutex)(&tctx->lock);
> =20
>  		/*
>  		 * Key the software fallback that this mode actually uses:
>  		 *  - CMAC/XCBC use tctx->shash_fb (allocated in init_tfm).
>  		 *  - Plain HMAC uses the ahash fallback tfm->fb (provisioned
>  		 *    by the crypto core via NEED_FALLBACK) through
>  		 *    HASH_FBREQ_ON_STACK. It must be keyed here too, or a
>  		 *    request routed to the fallback (e.g. a message larger
>  		 *    than the SPAcc max_msg_size) would run unkeyed and
>  		 *    produce -ENOKEY or an incorrect MAC.
>  		 */
>  		if (tctx->shash_fb) {
>  			ret =3D crypto_shash_setkey(tctx->shash_fb, key, keylen);
>  			if (ret)
>  				goto out;

[Severity: Low]
Can mixing goto-based error handling with guard cleanup declarations in the
same function create confusing ownership semantics? The subsystem patterns
indicate functions should convert all resources to scope-based cleanup or
convert none of them.

[ ... ]

> @@ -264,16 +264,16 @@ static int spacc_hash_do_one_request(struct crypto_=
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
>  			/*
>  			 * spacc_open() acquires ctx_sem which may sleep;
>  			 * do_one_request runs in the crypto_engine workqueue
>  			 * which is a sleepable context, so this is safe.
>  			 */
>  			tctx->handle =3D spacc_open(&priv->spacc,
>  					CRYPTO_MODE_NULL, salg->mode->id,
>  					-1, 0, spacc_digest_cb, reqtfm);
>  			if (tctx->handle < 0) {
>  				dev_dbg(salg->dev,
>  					"context open failed, fallback\n");
>  				goto fallback;

[Severity: Low]
Does jumping to a fallback label outside the guard scope bypass the intended
cleanup mechanism? Similar to the previous instance, mixing goto cleanups a=
nd
guard blocks in the same function breaks expected cleanup ordering.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> index 0000000000000..0c7d58ef9bd9c 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
> @@ -1296,16 +1296,16 @@ int spacc_packet_enqueue_ddt_ex(struct spacc_devi=
ce *spacc, int use_jb,
>  	/*
>  	 * Defensive backstop only: the hash path routes over-size requests
>  	 * to the software fallback before reaching here (see
>  	 * spacc_hash_do_one_request()), so this should not fire for hashes.
>  	 * It remains to stop any caller from silently truncating a length
>  	 * that does not fit PROC_LEN (bit 31 also aliases SPACC_AADCOPY_FLAG
>  	 * in pre_aad_sz, so an oversized pre_aad_sz must be rejected too).
>  	 */
>  	if ((u32)(proc_len - job->post_aad_sz) > spacc->config.max_msg_size)
>  		return -EMSGSIZE;

[Severity: High]
Does this bounds check evaluate a stale job->post_aad_sz before it is
initialized for the current request? Since spacc->job slots are reused,
could an oversized payload bypass the check if the stale value happens
to be small?

> =20
>  	if ((pre_aad_sz & ~SPACC_AADCOPY_FLAG) > spacc->config.max_msg_size)
>  		return -EMSGSIZE;
> =20
>  	if (pre_aad_sz & SPACC_AADCOPY_FLAG) {
>  		job->ctrl  |=3D SPACC_CTRL_MASK(SPACC_CTRL_AAD_COPY);
>  		pre_aad_sz &=3D ~(SPACC_AADCOPY_FLAG);
>  	} else
>  		job->ctrl  &=3D ~SPACC_CTRL_MASK(SPACC_CTRL_AAD_COPY);
> =20
>  	job->pre_aad_sz  =3D pre_aad_sz;
>  	job->post_aad_sz =3D post_aad_sz;

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> index 0000000000000..628b9c81283fa 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
> @@ -201,16 +201,16 @@ static void spacc_crypto_remove(struct platform_dev=
ice *pdev)
>  {
>  	struct spacc_priv *priv =3D platform_get_drvdata(pdev);
> =20
>  	spacc_unregister_algs(priv);
> =20
>  	if (priv->engine)
>  		crypto_engine_exit(priv->engine);
> =20
>  	spacc_irq_glbl_disable(&priv->spacc);
>  	devm_free_irq(&pdev->dev, priv->irq, &pdev->dev);
> =20

[Severity: High]
Does this unbind path need to abort active hardware DMA operations before
freeing memory pools? Since crypto_engine_exit() does not block on active
hardware, could the hardware continue asynchronously performing DMA operati=
ons
into memory that the kernel has already freed?

>  	dma_pool_destroy(priv->hash_pool);
>  	priv->hash_pool =3D NULL;
> =20
>  	if (priv->spacc_wq)
>  		destroy_workqueue(priv->spacc_wq);

[Severity: High]
Can destroying priv->hash_pool before flushing priv->spacc_wq cause a
use-after-free? If there are pending items in spacc_wq during teardown,
destroy_workqueue() will flush them, executing spacc_digest_cb() which
unconditionally calls dma_pool_free() on the destroyed pool:

spacc_digest_cb()
  ...
  dma_pool_free(priv->hash_pool, cb->ctx->digest_buf, cb->ctx->digest_dma);

> diff --git a/drivers/crypto/dwc-spacc/spacc_interrupt.c b/drivers/crypto/=
dwc-spacc/spacc_interrupt.c
> index 0000000000000..7916728c95374 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_interrupt.c
> @@ -52,16 +52,16 @@ static int spacc_pop_packets_ex(struct spacc_device *=
spacc, int *num_popped,
>  			case SPACC_ICVFAIL:
>  				ret =3D -EBADMSG;
>  				break;
>  			case SPACC_MEMERR:
>  				ret =3D -EINVAL;
>  				break;
>  			case SPACC_BLOCKERR:
>  				ret =3D -EINVAL;
>  				break;
>  			case SPACC_SECERR:
>  				ret =3D -EIO;
>  				break;
>  			case SPACC_OK:
>  				ret =3D 0;
>  				break;
>  			default:
>  				dev_err(spacc->dptr, "Invalid SPAcc Error\n");
>  			}
> =20
>  			job->job_err =3D ret;

[Severity: High]
Can an invalid hardware error code silently inherit the error code of the
previous job here? If a hardware error is not recognized in the switch bloc=
k,
ret is not updated in the default case. If the previous loop iteration
succeeded, would the currently failed operation be mistakenly treated as a
success?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805164815.2493=
28-1-pavitrakumarm@vayavyalabs.com?part=3D2
