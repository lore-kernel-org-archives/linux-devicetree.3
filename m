Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429412;
	b=THYXQ+X2LeS43B8cKqB0h1LXtFxv9ZYeLcSuWy8YAH32qtwP5TsPkvwaGAXuYdvEZxek
	 xIaGVFQ2odLu9rcrBlo3VXSgz5eZK/lkn+MxJhNA2xglu+pmU4SlcJdCVbAAihebCkmN9
	 /Su+RRskUPkXOUd0KyeWVzNISj7z4sZKJuhvixEPY2b1UlkJnEtGaJLOOTlfq53PhLi3f
	 oIRBexn8unrCrTK9M16oLQUhdOO7MDdMuj1x5qdIVEsRGysv/EY+K4oT8bghCjmRpdyR+
	 FQOvCHA3YNG/keA6DFnL8CORk/Rw4q2ehkTrsSplfI+q3chVrKC849z3E1hAmS3e97Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CUfon1tpZuBCzAXycjnvVEP9PbPAr+tJZgAci0bb2PM=;
	b=G7npr3uZ6YP048G159ZUE4MB+7AjQ8lWnSG4L1ps2uXzBxRIuDKR7wzGGvBmQHBT+r/G
	 T0cNul6+gftysePMX/Qzq2GRvwPeQ17R+NewjC03Vtm0gTP68zqQNHMGW8LobzGz5WuR2
	 JH/T3uiMY5WqyRoXMoi+WKvtIE2aaoIGItnySXqubb2SZpaAbfkq48CwiFrftT98z0TUe
	 w1Sg8VopH2R7e8OVjLh02Pj3iZM3JmGdKU7DSuwcfLZPB2J+LsTFKncpQMJ4fZOC0ybxY
	 Nwk1Rbo3u5GRYe6Rb1ztgKIstTAXRSrqNeDr8saGqLeacaEXxxiEPllAoHbh3aWQGTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mb2PkErS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA242606A324
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mb2PkErS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253BA1F000C4;
	Mon, 19 Oct 2026 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792429411;
	bh=CUfon1tpZuBCzAXycjnvVEP9PbPAr+tJZgAci0bb2PM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mb2PkErSOJW+6Kd0sHGOS2ouCm/ou9LEhBElWrCfdAa26/tzP2WkB1mpSrlAhEWxO
	 2gI1JK4rOhMiTQ2jPoDTo3shINa+2CgZ1DiJLd5sIfHa/q5ONwo6vdNVztYHdSaHfe
	 rP04PQeZQmKSZ+em0DR2r9VoueuVDrOO/ddQxBEVHnXhEnWrzaOh/UOH7OYE2ztqz4
	 lTRWkCNuedWTvVOXFv1nbd0dPQ6seOMCCY8aKkWGpzj8hsh99W9Qltb4gDTc8241BZ
	 pHdQZuG2h/QjyrTjp0GhyOk1gZ/HqrUAwJ4QNgyHvgBIf4sM8Ivjcnr8QTHcxwGXOQ
	 yVgq8DM2qLppA==
Message-ID: <sashiko-outbox-177985@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v26 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019162457.1000115-3-pavitrakumarm@vayavyalabs.com>
References: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
 <20261019162457.1000115-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 17:03:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] crypto: spacc: double free of salg in spacc_probe_hashes() on error
- [High] crypto: spacc: BUG_ON() in spacc_sg_to_ddt() via sg_last() on part=
ial sg
- [High] crypto: spacc: statesize overflow and broken BLOCK_ONLY in spacc_r=
egister_hash()
- [High] crypto: spacc: unconditionally setting CRYPTO_ALG_OPTIONAL_KEY and=
 setkey()
- [High] crypto: spacc: unhandled CMD0 interrupt storm in spacc_process_irq=
()
- [High] crypto: spacc: use-after-free and kthread leak in spacc_crypto_rem=
ove()
- [High] crypto: spacc: premature dma_ref_cnt dec and missing wake in do_on=
e_request()
- [Medium] crypto: spacc: spacc_job_request() treats -EINVAL from spacc_ctx=
_request() as valid
- [Medium] crypto: spacc: out-of-bounds read of version_string[] in spacc_i=
nit()
- [Medium] crypto: spacc: missing acquire barrier in spacc_compute_xcbc_key=
() wait
- [Medium] crypto: spacc: unlocked IRQ state updates and unmasked status in=
 IRQ handler
- [Medium] crypto: spacc - copy digest only on success in spacc_digest_cb()
- [Low] crypto: spacc: missing closing brace in spacc_unregister_hash_algs()
--

commit 13f9355d3fad0b1de2c06505109dd33bc6804ae0
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

This commit adds core SPAcc driver support along with ahash algorithm
implementations for MD5, SHA1, SHA2, SHA3, SM4-CMAC, and SM4-XCBC.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> new file mode 100644
> index 0000000000000..76dd497a0a17a
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c

[ ... ]

> +static int spacc_hash_init_dma(struct device *dev, struct ahash_request =
*req)
> +{
> +	int rc =3D -1;
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct spacc_crypto_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +	struct spacc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	/*
> +	 * do_one_request runs in a sleepable context,
> +	 * so GFP_KERNEL is always safe here.
> +	 */
> +	gfp_t mflags =3D GFP_KERNEL;
> +
> +	ctx->acb.new_handle =3D -1;
> +	ctx->digest_buf =3D dma_pool_alloc(priv->hash_pool, mflags,
> +					 &ctx->digest_dma);

[ ... ]

> +static void spacc_digest_cb(void *spacc, void *tfm)
> +{
> +	int err;
> +	int dig_sz;
> +	struct ahash_cb_data *cb =3D tfm;
> +	struct spacc_device *device =3D spacc;
> +	struct spacc_priv *priv =3D container_of(device, struct spacc_priv,
> +					       spacc);
> +
> +	dig_sz =3D crypto_ahash_digestsize(crypto_ahash_reqtfm(cb->req));
> +
> +	if (cb->ctx->single_shot)
> +		memcpy(cb->req->result, cb->ctx->digest_buf, dig_sz);
> +	else
> +		memcpy(cb->tctx->digest_ctx_buf, cb->ctx->digest_buf, dig_sz);
> +
> +	err =3D cb->spacc->job[cb->new_handle].job_err;

[Severity: Medium]
Should spacc_digest_cb() check job_err before copying cb->ctx->digest_buf
into cb->req->result?

In spacc_hash_init_dma(), ctx->digest_buf is allocated from priv->hash_pool
via dma_pool_alloc() without __GFP_ZERO, so it contains dma_pool freelist
metadata and stale digest bytes until the hardware writes the result. If a
job fails in hardware or during deferred submission in spacc_process_jb()
with a non-zero job_err, copying digest_buf unconditionally overwrites
cb->req->result with uninitialized or stale kernel memory.

[ ... ]

> +static int spacc_hash_try_hw(struct spacc_crypto_ctx *tctx,
> +			     struct spacc_priv *priv,
> +			     const struct spacc_alg *salg,
> +			     struct crypto_ahash *reqtfm,
> +			     struct ahash_request *req)
> +{
> +	int rc;
> +
> +	guard(mutex)(&tctx->lock);
> +
> +	if (tctx->handle < 0 || !tctx->ctx_valid) {
> +		/*
> +		 * spacc_open() acquires ctx_sem which may sleep;
> +		 * do_one_request runs in the crypto_engine workqueue
> +		 * which is a sleepable context, so this is safe.
> +		 */
> +		tctx->handle =3D spacc_open(&priv->spacc,
> +					  CRYPTO_MODE_NULL, salg->mode->id,
> +					  -1, 0, spacc_digest_cb, reqtfm);
> +		if (tctx->handle < 0) {
> +			dev_dbg(salg->dev, "context open failed, fallback\n");
> +			return tctx->handle;
> +		}
> +
> +		rc =3D spacc_set_operation(&priv->spacc, tctx->handle,
> +				OP_ENCRYPT, ICV_HASH, IP_ICV_OFFSET, 0, 0, 0);
> +		if (rc < 0) {
> +			spacc_close(&priv->spacc, tctx->handle);
> +			tctx->handle =3D -1;
> +			return rc;
> +		}
> +
> +		if (tctx->keylen > 0) {
> +			u32 mode_id =3D salg->mode->id;

[ ... ]

> +/* Crypto engine hash operation */
> +static int spacc_hash_do_one_request(struct crypto_engine *engine, void =
*areq)
> +{

[ ... ]

> +	atomic_inc(&priv->dma_ref_cnt);
> +
> +	rc =3D spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
> +			&ctx->src, &ctx->dst, req->nbytes,
> +			0, req->nbytes, 0, 0, 0, false);
> +	if (rc < 0) {
> +
> +		atomic_dec(&priv->dma_ref_cnt);
> +		spacc_free_mems(ctx, tctx, req);
> +		dma_pool_free(priv->hash_pool, ctx->digest_buf,
> +				ctx->digest_dma);
> +		pdu_ddt_free(&ctx->dst);
> +
> +		if (ctx->acb.new_handle >=3D 0) {
> +			spacc_close(&priv->spacc, ctx->acb.new_handle);
> +			ctx->acb.new_handle =3D -1;
> +		}

[Severity: High]
In spacc_hash_do_one_request(), when spacc_packet_enqueue_ddt() fails,
priv->dma_ref_cnt is decremented before freeing the DMA buffers and closing
the job handle, and priv->drain_wq is not woken up.

If spacc_crypto_remove() is waiting on priv->drain_wq, could it either hang
indefinitely because wake_up(&priv->drain_wq) is never called when
dma_ref_cnt reaches zero, or wake up early and destroy priv->hash_pool, the
DDT pools, and spacc->job while this error path is still freeing them?

Should this error path release all resources first and then call
atomic_dec_and_test(&priv->dma_ref_cnt) followed by
wake_up(&priv->drain_wq), matching spacc_digest_cb()?

[ ... ]

> +static void spacc_hash_exit_tfm(struct crypto_ahash *tfm)
> +{
> +	struct spacc_crypto_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct spacc_priv *priv =3D dev_get_drvdata(tctx->dev);
> +
> +	if (priv && tctx->handle >=3D 0)
> +		spacc_close(&priv->spacc, tctx->handle);
> +
> +	put_device(tctx->dev);
> +	mutex_destroy(&tctx->lock);
> +}

[ ... ]

> +static int spacc_hash_digest(struct ahash_request *req)
> +{
> +	struct crypto_ahash *reqtfm =3D crypto_ahash_reqtfm(req);
> +	struct spacc_crypto_ctx *tctx =3D crypto_ahash_ctx(reqtfm);
> +	struct spacc_priv *priv =3D dev_get_drvdata(tctx->dev);
> +	unsigned long flags;
> +	bool removing;
> +
> +	if (!priv || !priv->engine)
> +		return -ENODEV;
> +
> +	spin_lock_irqsave(&priv->spacc.lock, flags);
> +	removing =3D priv->removing;
> +	spin_unlock_irqrestore(&priv->spacc.lock, flags);
> +
> +	if (removing)
> +		return -ENODEV;
> +
> +	return crypto_transfer_hash_request_to_engine(priv->engine, req);
> +}

[ ... ]

> +static void spacc_hash_alg_destroy(struct crypto_alg *alg)
> +{
> +	struct spacc_alg *salg =3D container_of(alg, struct spacc_alg,
> +					      alg.hash.base.halg.base);
> +
> +	kfree(salg);
> +}
> +
> +static const struct ahash_engine_alg spacc_hash_template =3D {
> +	.base =3D {
> +		.init		=3D spacc_hash_init,
> +		.update		=3D spacc_hash_update,
> +		.final		=3D spacc_hash_final,
> +		.finup		=3D spacc_hash_finup,
> +		.digest		=3D spacc_hash_digest,
> +		.setkey		=3D spacc_hash_setkey,
> +		.export		=3D spacc_hash_export,
> +		.import		=3D spacc_hash_import,
> +		.init_tfm	=3D spacc_hash_init_tfm,
> +		.exit_tfm	=3D spacc_hash_exit_tfm,
> +
> +		.halg.base =3D {
> +			.cra_priority	=3D 300,
> +			.cra_module	=3D THIS_MODULE,
> +			.cra_ctxsize	=3D sizeof(struct spacc_crypto_ctx),
> +			.cra_reqsize	=3D sizeof(struct spacc_crypto_reqctx),
> +			.cra_destroy	=3D spacc_hash_alg_destroy,
> +			.cra_flags	=3D CRYPTO_ALG_TYPE_AHASH		|
> +					  CRYPTO_ALG_ASYNC		|
> +					  CRYPTO_AHASH_ALG_BLOCK_ONLY	|
> +					  CRYPTO_ALG_OPTIONAL_KEY
> +		},
> +	},
> +	.op =3D {
> +		.do_one_request =3D spacc_hash_do_one_request,
> +	},
> +};

[Severity: High]
spacc_hash_template is shared across all 18 algorithms in possible_hashes[],
unconditionally setting .setkey =3D spacc_hash_setkey and
CRYPTO_ALG_OPTIONAL_KEY in .cra_flags.

Because CRYPTO_ALG_OPTIONAL_KEY is set, ahash_set_needkey() never sets
CRYPTO_TFM_NEED_KEY on keyed algorithms (cmac(sm4), xcbc(sm4), and hmac(*)).
If a caller invokes crypto_ahash_digest() without calling
crypto_ahash_setkey() (or after a 0-length HMAC setkey()),
spacc_hash_try_hw() sees tctx->keylen =3D=3D 0, skips spacc_write_context()=
, and
runs the MAC in hardware using whatever stale key bytes remain in
ctx->hash_key instead of returning -ENOKEY.

Conversely, setting .setkey on the unkeyed hash algorithms (md5, sha1,
sha2*, sha3-*) causes crypto_hash_alg_has_setkey() to report that unkeyed
digests require a key.

Should CRYPTO_ALG_OPTIONAL_KEY be dropped, with .setkey only populated for
the keyed MAC and HMAC algorithms, and should spacc_hash_try_hw() still
program a zero-length key when a valid 0-length HMAC key is set?

> +
> +static int spacc_register_hash(struct spacc_alg *salg)
> +{
> +	int rc =3D 0;
> +	struct spacc_priv *priv =3D dev_get_drvdata(salg->dev);
> +
> +	salg->calg =3D &salg->alg.hash.base.halg.base;
> +	salg->alg.hash =3D spacc_hash_template;
> +
> +	rc =3D spacc_init_calg(salg->calg, salg->mode);
> +	if (rc)
> +		return rc;
> +
> +	salg->alg.hash.base.halg.digestsize =3D salg->mode->hashlen;
> +	salg->alg.hash.base.halg.statesize =3D HASH_MAX_STATESIZE;
> +
> +	rc =3D crypto_engine_register_ahash(&salg->alg.hash);

[Severity: High]
In spacc_register_hash(), salg->alg.hash.base.halg.statesize is set to
HASH_MAX_STATESIZE while spacc_hash_template sets
CRYPTO_AHASH_ALG_BLOCK_ONLY.

When crypto_engine_register_ahash() calls ahash_prepare_alg(), the crypto
core adds cra_blocksize + 1 to statesize when CRYPTO_AHASH_ALG_BLOCK_ONLY is
set, making crypto_ahash_statesize(tfm) exceed HASH_MAX_STATESIZE.

As a result, any virtual-address request in ahash_do_req_chain() (such as
crypto/hmac.c wrapping SPAcc sha3 algorithms) hits:

    if (crypto_ahash_statesize(tfm) > HASH_MAX_STATESIZE)
        return -ENOSYS;

and fails, while callers of crypto_ahash_export() with a HASH_MAX_STATESIZE
buffer will have cra_blocksize + 1 bytes written past the end of their
buffer by ahash_save_req().

Since spacc_hash_init(), spacc_hash_update(), spacc_hash_final(), and
spacc_hash_finup() delegate incremental hashing to the software fallback
rather than implementing block-only partial-block return semantics, should
CRYPTO_AHASH_ALG_BLOCK_ONLY be removed from spacc_hash_template?

> +	if (rc < 0)
> +		return rc;
> +
> +	guard(mutex)(&priv->hash_alg_mutex);
> +	list_add(&salg->list, &priv->hash_alg_list);
> +
> +	return 0;
> +}
> +
> +int spacc_probe_hashes(struct platform_device *spacc_pdev)
> +{

[ ... ]

> +			salg->mode =3D &possible_hashes[index];
> +			salg->dev =3D &spacc_pdev->dev;
> +
> +			rc =3D spacc_register_hash(salg);
> +			if (rc < 0) {
> +				kfree(salg);
> +				continue;
> +			}

[Severity: High]
Can this cause a double free of salg when spacc_register_hash() fails?

spacc_register_hash() installs spacc_hash_alg_destroy() (which calls
kfree(salg)) as cra_destroy and then calls
crypto_engine_register_ahash(&salg->alg.hash) -> crypto_register_ahash() ->
crypto_register_alg().

In crypto_register_alg(), once crypto_check_alg() initializes cra_refcnt to
1, any failure in __crypto_register_alg() (such as -EEXIST or -ENOMEM) calls
crypto_alg_put(alg) -> crypto_destroy_alg(alg) -> alg->cra_destroy(alg),
which already frees salg via spacc_hash_alg_destroy() before returning the
error to spacc_probe_hashes(), where kfree(salg) is called a second time.

> +
> +			registered++;
> +		}
> +	}
> +
> +	return registered;
> +
> +err_unregister:
> +	spacc_unregister_hash_algs(priv);
> +	return rc;
> +}
> +
> +int spacc_unregister_hash_algs(struct spacc_priv *priv)
> +{
> +	struct spacc_alg *salg, *tmp;
> +
> +	if (!priv)
> +		return 0;
> +
> +	guard(mutex)(&priv->hash_alg_mutex);
> +
> +	list_for_each_entry_safe(salg, tmp, &priv->hash_alg_list, list) {
> +		list_del(&salg->list);
> +		crypto_engine_unregister_ahash(&salg->alg.hash);
> +	}
> +
> +	return 0;

[Severity: Low]
spacc_unregister_hash_algs() is missing its closing brace at the end of
drivers/crypto/dwc-spacc/spacc_ahash.c, which causes a syntax error when
building the driver.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> new file mode 100644
> index 0000000000000..aa5fbe9a3e074
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c

[ ... ]

> +int spacc_sg_to_ddt(struct device *dev, struct scatterlist *sg,
> +		    int nbytes, struct pdu_ddt *ddt, int dma_direction)
> +{
> +	int i;
> +	int nents;
> +	int rc =3D 0;
> +	int orig_nents;
> +	struct scatterlist *sgl;
> +	struct scatterlist *sg_entry;
> +
> +	/* Count the SG entries needed to cover the requested length. */
> +	orig_nents =3D sg_nents_for_len(sg, nbytes);
> +	if (orig_nents <=3D 0)
> +		return orig_nents;
> +
> +	/*
> +	 * Ignore a trailing zero-length SG entry if present.
> +	 * Some callers use it as a terminator.
> +	 */
> +	if (orig_nents > 1) {
> +		sgl =3D sg_last(sg, orig_nents);
> +		if (sgl->length =3D=3D 0)
> +			orig_nents--;
> +	}

[Severity: High]
Won't calling sg_last(sg, orig_nents) here trigger BUG_ON(!sg_is_last(ret))
in sg_last() whenever the scatterlist contains more entries than the prefix
needed to cover nbytes?

sg_nents_for_len(sg, nbytes) stops as soon as the accumulated length reaches
nbytes and returns the number of entries in that prefix. If orig_nents > 1
and the caller's scatterlist has any entries after the orig_nents-th entry
(including a trailing zero-length entry after entries that already sum to
nbytes, or a buffer larger than req->nbytes), the orig_nents-th entry does
not have the SG_END marker set, causing sg_last() to hit BUG_ON().

[ ... ]

> +int spacc_init(void __iomem *baseaddr, struct spacc_device *spacc,
> +	       struct pdu_info *info, struct device *dev)
> +{
> +	int ret;
> +#ifdef CONFIG_CRYPTO_DEV_SPACC_CONFIG_DEBUG
> +	unsigned long id;
> +	char version_string[3][16]  =3D { "SPACC", "SPACC-PDU" };
> +	char idx_string[2][16]      =3D { "(Normal Port)", "(Secure Port)" };
> +	char dma_type_string[4][16] =3D { "Unknown", "Scattergather", "Linear",
> +					"Unknown" };
> +#endif

[ ... ]

> +	if (spacc->config.version >=3D 0x48)
> +		dev_dbg(spacc->dptr,
> +			"   TYPE       : %lx (%s)\n", SPACC_ID_TYPE(id),
> +			version_string[SPACC_ID_TYPE(id) & 3]);

[Severity: Medium]
Does indexing version_string[] with (SPACC_ID_TYPE(id) & 3) read out of
bounds when SPACC_ID_TYPE(id) is 3?

version_string is declared as char version_string[3][16] with only 3
elements (and only 2 initialized), whereas SPACC_ID_TYPE(id) & 3 can
evaluate to 3.

[ ... ]

> +int spacc_compute_xcbc_key(struct spacc_device *spacc, int mode_id,
> +			   int job_idx, const unsigned char *key,
> +			   int keylen, unsigned char *xcbc_out)
> +{

[ ... ]

> +			if (wait_event_interruptible(job->waitq,
> +						     job->job_done))
> +				wait_event(job->waitq,
> +					/*
> +					 * Pairs with smp_store_release() of
> +					 * job_done in completion path.
> +					 */
> +					 smp_load_acquire(&job->job_done));
> +
> +			job->job_done =3D 0;
> +			err =3D job->job_err;
> +			if (err !=3D 0)
> +				goto xcbc_err;
> +		}
> +	} else {
> +		/*
> +		 * Do the 48 bytes as a single SPAcc job this is the ideal case
> +		 * but only possible if ECB was enabled in the core
> +		 */
> +		spacc_write_context(spacc, handle, SPACC_CRYPTO_OPERATION,
> +				    key, keylen, iv, 16);
> +		err =3D spacc_packet_enqueue_ddt(spacc, handle, &ddt, &ddt, 48,
> +					       0, 0, 0, 0, 0, false);
> +		if (err !=3D 0)
> +			goto xcbc_err;
> +
> +		if (wait_event_interruptible(job->waitq, job->job_done))
> +
> +			wait_event(job->waitq,
> +				  /*
> +				   * Pairs with smp_store_release() of
> +				   * job_done in completion path.
> +				   */
> +				   smp_load_acquire(&job->job_done));
> +
> +		job->job_done =3D 0;
> +		err =3D job->job_err;
> +		if (err !=3D 0)
> +			goto xcbc_err;
> +	}

[Severity: Medium]
In both branches of spacc_compute_xcbc_key(), wait_event_interruptible()
checks plain job->job_done and only falls back to wait_event(...,
smp_load_acquire(&job->job_done)) when interrupted by a signal.

When wait_event_interruptible() succeeds without a signal (returning 0), the
wait_event() call is skipped. If job->job_done is already set before
wait_event_interruptible() is entered, its fast path reads job->job_done
without taking waitq.lock and without an acquire barrier to pair with the
smp_store_release(&job->job_done, 1) in spacc_pop_one_job() and
spacc_process_jb().

Should wait_event_interruptible() also use smp_load_acquire(&job->job_done)
(or simply use wait_event(job->waitq, smp_load_acquire(&job->job_done))
directly)?

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> new file mode 100644
> index 0000000000000..af95be0a8ebc1
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c

[ ... ]

> +static void spacc_crypto_remove(struct platform_device *pdev)
> +{
> +	struct spacc_priv *priv =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +
> +	/*
> +	 * Set before anything else: sysfs unbind (unlike rmmod) has no
> +	 * built-in wait for existing tfms to be freed, so a request can
> +	 * reach spacc_hash_digest() at any point during this function.
> +	 * This flag, checked under the same lock there, blocks any new
> +	 * submission attempt from this point on.
> +	 */
> +	spin_lock_irqsave(&priv->spacc.lock, flags);
> +	priv->removing =3D true;
> +	spin_unlock_irqrestore(&priv->spacc.lock, flags);
> +
> +	/* Stop the crypto API from handing out any new tfms. */
> +	spacc_unregister_algs(priv);
> +
> +	if (priv->engine)
> +		crypto_engine_exit(priv->engine);
> +
> +	wait_event(priv->drain_wq, !atomic_read(&priv->dma_ref_cnt));
> +
> +	/* Nothing can dispatch new work past this point. */
> +	spin_lock_irqsave(&priv->spacc.lock, flags);
> +	spacc_irq_glbl_disable(&priv->spacc);
> +	spin_unlock_irqrestore(&priv->spacc.lock, flags);
> +
> +	devm_free_irq(&pdev->dev, priv->irq, &pdev->dev);
> +
> +	if (priv->spacc_wq)
> +		destroy_workqueue(priv->spacc_wq);
> +
> +	/* No job can still reference this pool past the drain above. */
> +	dma_pool_destroy(priv->hash_pool);
> +	priv->hash_pool =3D NULL;
> +
> +	spacc_remove(pdev);
> +	platform_set_drvdata(pdev, NULL);
> +}

[Severity: High]
Can unbinding the device in spacc_crypto_remove() race with active requests
and surviving tfms, leading to a use-after-free or a leaked crypto_engine
kthread?

First, in spacc_hash_digest():

    spin_lock_irqsave(&priv->spacc.lock, flags);
    removing =3D priv->removing;
    spin_unlock_irqrestore(&priv->spacc.lock, flags);

    if (removing)
        return -ENODEV;

    return crypto_transfer_hash_request_to_engine(priv->engine, req);

priv->spacc.lock is dropped before crypto_transfer_hash_request_to_engine()
is called, and priv->dma_ref_cnt is not incremented until
spacc_hash_do_one_request() after spacc_hash_try_hw() completes. If
spacc_crypto_remove() runs in that window, wait_event(priv->drain_wq, ...)
can see dma_ref_cnt =3D=3D 0 and proceed to tear down priv->engine,
priv->hash_pool, and spacc while the request is still in flight.

Second, crypto_engine_exit(priv->engine) is called before
wait_event(priv->drain_wq, ...). Because retry_support is false,
engine->busy remains true until spacc_digest_cb() calls
crypto_finalize_hash_request(); if an in-flight job takes longer than
crypto_engine_stop()'s 200ms timeout, crypto_engine_exit() returns early
without calling kthread_destroy_worker(), leaking the worker kthread.

Third, when unbound via sysfs, existing crypto_ahash tfms can outlive
spacc_crypto_remove(). Because priv is allocated with devm_kzalloc(), devres
frees priv once spacc_crypto_remove() returns (get_device() in
spacc_hash_init_tfm() pins struct device, not devres resources), and
spacc_remove() frees spacc->ctx and spacc->job before
platform_set_drvdata(pdev, NULL). A concurrent or later call to
spacc_hash_exit_tfm(), spacc_hash_setkey(), or spacc_hash_digest() can read
a non-NULL drvdata pointer and dereference freed spacc->job, spacc->ctx, or
priv.

> diff --git a/drivers/crypto/dwc-spacc/spacc_interrupt.c b/drivers/crypto/=
dwc-spacc/spacc_interrupt.c
> new file mode 100644
> index 0000000000000..68dd049a5f65a
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_interrupt.c

[ ... ]

> +u32 spacc_process_irq(struct spacc_device *spacc)
> +{
> +	u32 irq_status;
> +	int x, cmd_max;
> +	unsigned long lock_flag;
> +
> +	spin_lock_irqsave(&spacc->lock, lock_flag);
> +
> +	irq_status =3D readl(spacc->regmap + SPACC_REG_IRQ_STAT);
> +
> +	/* clear interrupt pin and run registered callback */
> +	if (irq_status & SPACC_IRQ_STAT_STAT) {
> +		SPACC_IRQ_STAT_CLEAR_STAT(spacc);
> +		if (spacc->op_mode =3D=3D SPACC_OP_MODE_IRQ) {
> +			spacc->config.fifo_cnt <<=3D 2;
> +			spacc->config.fifo_cnt =3D min(spacc->config.fifo_cnt,
> +					spacc->config.stat_fifo_depth);
> +
> +			/* update fifo count to allow more stats to pile up */
> +			spacc_irq_stat_enable(spacc, spacc->config.fifo_cnt);
> +
> +			/* re-enable CMD0 empty interrupt */
> +			spacc_irq_cmdx_enable(spacc, 0, 0);
> +		}
> +
> +		/* Re-enable the watchdog interrupt */
> +		if (spacc->op_mode =3D=3D SPACC_OP_MODE_IRQ &&
> +				spacc->wd_cnt_limit) {
> +			spacc_irq_stat_wd_enable(spacc);
> +			spacc->wdcnt =3D 0;
> +			spacc->op_mode =3D SPACC_OP_MODE_WD;
> +			spacc->wd_cnt_limit =3D false;
> +		}
> +
> +		if (spacc->irq_cb_stat)
> +			spacc->irq_cb_stat(spacc);
> +	}

[Severity: High]
Can this sequence in spacc_process_irq() trigger an unhandled CMD0 interrupt
storm when recovering from watchdog limit fallback?

When spacc->wdcnt reaches SPACC_WD_LIMIT in SPACC_OP_MODE_WD,
spacc_process_irq() switches spacc->op_mode to SPACC_OP_MODE_IRQ and sets
spacc->wd_cnt_limit =3D true.

On the next SPACC_IRQ_STAT_STAT interrupt, the first block sees
spacc->op_mode =3D=3D SPACC_OP_MODE_IRQ and calls:

    spacc_irq_cmdx_enable(spacc, 0, 0);

Immediately after, the second block sees spacc->op_mode =3D=3D SPACC_OP_MOD=
E_IRQ
&& spacc->wd_cnt_limit and switches spacc->op_mode back to SPACC_OP_MODE_WD
without disabling CMD0 interrupts.

Because the CMDX servicing loop below only runs when spacc->op_mode =3D=3D
SPACC_OP_MODE_IRQ:

    if (spacc->op_mode =3D=3D SPACC_OP_MODE_IRQ) {
        cmd_max =3D (spacc->config.is_qos ? SPACC_CMDX_MAX_QOS :
                SPACC_CMDX_MAX);
        for (x =3D 0; x < cmd_max; x++) {
            if (irq_status & SPACC_IRQ_STAT_CMDX(x)) {
                ...

once SPACC_IRQ_STAT_CMDX(0) asserts in SPACC_REG_IRQ_STAT,
spacc_process_irq() will never clear or disable it while spacc_irq_handler()
keeps returning IRQ_HANDLED. Should the two if-blocks in the
SPACC_IRQ_STAT_STAT handler be an if / else if (checking wd_cnt_limit
first)?

[ ... ]

> +/* Function to run callbacks in the IRQ handler */
> +irqreturn_t spacc_irq_handler(int irq, void *dev)
> +{
> +	struct spacc_priv *priv =3D platform_get_drvdata(to_platform_device(dev=
));
> +	struct spacc_device *spacc =3D &priv->spacc;
> +
> +	if (spacc->config.oldtimer !=3D spacc->config.timer) {
> +		spacc->config.wd_timer =3D spacc->config.timer;
> +		spacc_set_wd_count(spacc, spacc->config.wd_timer);
> +		spacc->config.oldtimer =3D spacc->config.timer;
> +	}
> +
> +	/* check irq flags and process as required */
> +	if (!spacc_process_irq(spacc))
> +		return IRQ_NONE;
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
There appear to be a few concurrency and shared-IRQ handling issues between
spacc_irq_handler(), spacc_process_irq(), and spacc_init_device():

1. In spacc_irq_handler(), spacc->config.oldtimer, spacc->config.wd_timer,
and SPACC_REG_STAT_WD_CTRL are updated without holding spacc->lock and
before checking whether the interrupt came from this device on an
IRQF_SHARED line, racing with spacc_process_irq() and
spacc_pop_packets_ex().

2. In spacc_init_device(), after devm_request_irq(..., IRQF_SHARED, ...) and
spacc_irq_glbl_enable() are called, the driver modifies spacc.op_mode,
callback pointers, wd_timer, SPACC_REG_IRQ_CTRL, and SPACC_REG_IRQ_EN
without holding spacc.lock.

3. In spacc_process_irq(), irq_status is read from SPACC_REG_IRQ_STAT
without masking against SPACC_REG_IRQ_EN, and the raw irq_status is returned
to spacc_irq_handler(). If any status bits are set for a mode that is not
currently active in spacc->op_mode, spacc_irq_handler() returns IRQ_HANDLED
without clearing those bits.

Could the timer update and IRQ configuration changes be serialized under
spacc->lock, and should spacc_process_irq() only return IRQ_HANDLED for
enabled interrupt bits that it actually serviced?

> diff --git a/drivers/crypto/dwc-spacc/spacc_manager.c b/drivers/crypto/dw=
c-spacc/spacc_manager.c
> new file mode 100644
> index 0000000000000..0ee40fa7678cf
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_manager.c

[ ... ]

> +static int spacc_ctx_request(struct spacc_device *spacc,
> +			     int ctx_id, int ncontig)
> +{
> +	int ret =3D 0;
> +	int x, y, count;
> +
> +	if (!spacc)
> +		return -EINVAL;
> +
> +	if (ctx_id < -1 || ctx_id >=3D spacc->config.num_ctx)
> +		return -EINVAL;
> +
> +	if (ncontig < 1 || ncontig > spacc->config.num_ctx)
> +		return -EINVAL;

[ ... ]

> +/* Get a new job id and use a specific ctx_idx or -1 for a new one */
> +int spacc_job_request(struct spacc_device *spacc, int ctx_idx)
> +{
> +	int x, ret =3D 0;
> +	struct spacc_job *job;
> +	unsigned long lock_flag;
> +
> +	if (!spacc)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&spacc->lock, lock_flag);
> +
> +	/* find the first available job id */
> +	for (x =3D 0; x < SPACC_MAX_JOBS; x++) {
> +		job =3D &spacc->job[x];
> +		if (job->job_used =3D=3D SPACC_JOB_IDX_UNUSED) {
> +			job->job_used =3D x;
> +			break;
> +		}
> +	}
> +
> +	if (x =3D=3D SPACC_MAX_JOBS)
> +		ret =3D -1;
> +	else {
> +		/* associate a single context to go with job */
> +		ret =3D spacc_ctx_request(spacc, ctx_idx, 1);
> +		if (ret !=3D -1) {
> +			job->ctx_idx =3D ret;
> +			ret =3D x;
> +		} else
> +			job->job_used =3D SPACC_JOB_IDX_UNUSED;
> +	}

[Severity: Medium]
In spacc_job_request(), if spacc_ctx_request() fails validation and returns
-EINVAL (for instance, if num_ctx is 0 or ctx_idx is out of range), checking
ret !=3D -1 treats -EINVAL as a valid context index and assigns it to
job->ctx_idx.

Should spacc_job_request() check ret >=3D 0 instead of ret !=3D -1?

[ ... ]

> +}

=E2=80=94
AI reviewed your patch. Please fix the bug or emailuar@kernel.org if the is=
sue is a false positive.
=E0=B5=8B=E0=B4=9F=E0=B5=8D

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019162457.1000=
115-1-pavitrakumarm@vayavyalabs.com?part=3D2
