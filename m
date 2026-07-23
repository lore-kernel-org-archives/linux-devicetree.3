Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B6411F92
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809470; cv=none; b=pmN2lUx8+z+I2/BDSo/YYs3bnHoYbzHDsBmx17YjcR6zBv2ziIgt8IlLF5/xVGWiJUDL7L8ztyx/owNvA93yWn3cOXyArJbmWZZnuN/cXLc0u8YcZGMwytidrLZSjC+3eMCTJw+j34OZ4BceoEy+bJGfemWjwdTwuSyoRLVvacc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809470; c=relaxed/simple;
	bh=2ysFnJ8Tl30StoBbeeyvwD13cTjml8aXOIaoRWjfp90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P/kmaIfIoegAYrbCAij3oY6DSsCl77DfL9NEB7kHMyW0cRBOsKSyiECAZmrgKc41ZbftLO8pjYxbKusNAQCkN82p8rWA4XRK5w8kJOrdrSFzvBe84YFJmlXcBDLJ3YK4+L7iirXX+nmo4ddlCk+Ab9WY96dbBp2Gj3Ool/CXITw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O++RP3oQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O++RP3oQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42C31F00A3A;
	Thu, 23 Jul 2026 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784809469;
	bh=K0+PH6a3tmp0Wo6ZxpjfOPfGvTZzYyzbQXmMgB2pe8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O++RP3oQZa81LE9EWQnXI/wfY+IPvxUAWcSiuva3uAttGjrY+TdniNLiHDGAf+G28
	 d9zOID96f94X3y/vI5mm4uH0RYZ2qmRd2ehCTjKIS30dB/XplNpniqG38EUR3Zkn0z
	 jixwBGR9qR1gPgu2t8HUkAjNYMg72XouqvcSOIbG1BdNdLBzWziDlJEuf0x+I44hl5
	 hCqR7qXi1qa/WvTyYZjoIPk8X7HhUtn4qJQ+f4pn75whVok8qRppXDjA8etGxvAHwM
	 Lj0GpK7ivQll+vqJWZqSyGS0F9mCsbZBtNlLgkPf9vA0mbRQUQ5JVXMx5gYopXSWmF
	 GU4c6PHO4d4Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260723120156.285270-3-pavitrakumarm@vayavyalabs.com>
References: <20260723120156.285270-1-pavitrakumarm@vayavyalabs.com>
 <20260723120156.285270-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 12:24:28 +0000
Message-Id: <20260723122428.E42C31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Hardware DMA descriptors are written using CPU endianness instead =
of the required little-endian format.
- [High] Module unbind tears down the crypto engine before unregistering th=
e algorithms, causing a Use-After-Free.
- [High] Concurrent sysfs unbind leads to NULL pointer dereferences and Use=
-After-Free in tfm operations.
- [Medium] API Contract Violation: crypto_ahash_digest rejects large messag=
es instead of chunking or falling back.
- [Medium] Data race on shared buffer `tctx->ipad` in spacc_hash_setkey().
- [Low] Inconsistent internal state left behind when software fallback key =
setup fails.
- [Low] Redundant re-initialization of an active waitqueue structure.
--

--- Patch [2]: [PATCH v18 2/4] crypto: spacc - Add SPAcc ahash support ---
commit aeccbd51ad1044db1600d8106d1283e4ab1a88aa
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

This commit adds ahash support to the SPAcc driver. It introduces various h=
ash
algorithms including cmac, xcbc, hmac, sha, and md5.

> --- a/drivers/crypto/dwc-spacc/spacc_ahash.c
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
[ ... ]
> +static int spacc_hash_setkey(struct crypto_ahash *tfm, const u8 *key,
> +			     unsigned int keylen)
> +{
[ ... ]
> +	const struct spacc_alg *salg =3D spacc_tfm_ahash(&tfm->base);
> +	struct spacc_crypto_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct spacc_priv *priv =3D dev_get_drvdata(salg->dev);

[Severity: High]
If the device is unbound concurrently via sysfs, will dev_get_drvdata() ret=
urn
NULL and cause a crash when priv is dereferenced later in this function?
Active tfms can outlive the device unbind, making this a potential
Use-After-Free or NULL pointer dereference.

[ ... ]
> +		/*
> +		 * Enforcing valid block-cipher * key sizes supported by SPAcc:
> +		 * AES-CMAC accepts 16/24/32,
> +		 * SM4-CMAC/XCBC/SM4-XCBC only 16.
> +		 */
> +
> +		memcpy(tctx->ipad, key, keylen);
> +	}
> +
> +	if (!spacc_is_mode_keysize_supported(&priv->spacc, salg->mode->id,
> +				keylen, 1)) {
> +		dev_dbg(salg->dev, "keylen %u not supported for mode %d\n",
> +				keylen, salg->mode->id);
> +		return -EINVAL;
> +	}
> +
> +	{
> +		guard(mutex)(&tctx->lock);

[Severity: Medium]
Can this sequence cause a data race? The memcpy updates the shared tctx->ip=
ad
buffer before acquiring tctx->lock. If an asynchronous hash request is
processed concurrently by the crypto engine, could it read a corrupted MAC
key while it is being overwritten?

> +
> +		tctx->keylen =3D keylen;
> +
> +		/*
> +		 * For CMAC/XCBC the shash fallback also needs the key so that
> +		 * the software path produces correct MACs when the HW
> +		 * context is not yet available.
> +		 */
> +		if (tctx->shash_fb) {
> +			int rc =3D crypto_shash_setkey(tctx->shash_fb, key,
> +						     keylen);
> +
> +			if (rc)
> +				return rc;
> +		}

[Severity: Low]
If crypto_shash_setkey() fails and returns an error, does this leave
tctx->keylen in an inconsistent state? It gets updated to the new length
before the software fallback validation fails.

[ ... ]
> +static int spacc_hash_digest(struct ahash_request *req)
> +{
> +	struct crypto_ahash *reqtfm =3D crypto_ahash_reqtfm(req);
> +	struct spacc_crypto_ctx *tctx =3D crypto_ahash_ctx(reqtfm);
> +	struct spacc_priv *priv =3D dev_get_drvdata(tctx->dev);
> +
> +	if (!priv)
> +		return -ENODEV;
> +
> +	return crypto_transfer_hash_request_to_engine(priv->engine, req);
> +}

[Severity: High]
Does this check adequately protect against a concurrent sysfs unbind? The
unbind could occur immediately after the NULL check, causing a Use-After-Fr=
ee
when accessing priv->engine.

> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> +int spacc_packet_enqueue_ddt_ex(struct spacc_device *spacc, int use_jb,
> +				int job_idx, struct pdu_ddt *src_ddt,
> +				struct pdu_ddt *dst_ddt, u32 proc_sz,
> +				u32 aad_offset, u32 pre_aad_sz, u32 post_aad_sz,
> +				u32 iv_offset, u32 prio,
> +				unsigned long *lock_flag)
> +{
[ ... ]
> +	if ((u32)(proc_len - job->post_aad_sz) > spacc->config.max_msg_size)
> +		return -EMSGSIZE;
> +
> +	if ((pre_aad_sz & ~SPACC_AADCOPY_FLAG) > spacc->config.max_msg_size)
> +		return -EMSGSIZE;

[Severity: Medium]
Does rejecting large inputs here violate the Linux Crypto API contract?
The ahash interface guarantees support for arbitrarily large inputs. Would
it be better to chunk the requests internally or use a software fallback
instead of returning -EMSGSIZE?

[ ... ]
> +int spacc_compute_xcbc_key(struct spacc_device *spacc, int mode_id,
> +			   int job_idx, const unsigned char *key,
> +			   int keylen, unsigned char *xcbc_out)
> +{
[ ... ]
> +	spacc_set_operation(spacc, handle, OP_ENCRYPT, 0, 0, 0, 0, 0);
> +	job =3D &spacc->job[handle];
> +	init_waitqueue_head(&job->waitq);

[Severity: Low]
Can this cause lockdep warnings or lock state reset issues? The job slots
and their waitqueues are already initialized in spacc_job_init_all(), so
re-initializing an active waitqueue here might violate lock semantics.

> --- a/drivers/crypto/dwc-spacc/spacc_device.c
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
[ ... ]
> +static void spacc_crypto_remove(struct platform_device *pdev)
> +{
> +	struct spacc_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	if (priv->engine)
> +		crypto_engine_exit(priv->engine);
> +
> +	spacc_irq_glbl_disable(&priv->spacc);
> +	devm_free_irq(&pdev->dev, priv->irq, &pdev->dev);
> +
> +	spacc_unregister_algs(priv);

[Severity: High]
Is it safe to exit the crypto engine before unregistering the algorithms?
This creates a window where the algorithms remain active but point to a
destroyed engine. If a user submits a new request during this window,
could it result in a Use-After-Free?

> --- a/drivers/crypto/dwc-spacc/spacc_hal.c
> +++ b/drivers/crypto/dwc-spacc/spacc_hal.c
[ ... ]
> +int pdu_ddt_add(struct device *dev, struct pdu_ddt *ddt, dma_addr_t phys,
> +		unsigned long size)
> +{
[ ... ]
> +	if (ddt->idx =3D=3D ddt->limit)
> +		return -EINVAL;
> +
> +	ddt->virt[ddt->idx * 2 + 0] =3D (uint32_t)phys;
> +	ddt->virt[ddt->idx * 2 + 1] =3D size;
> +	ddt->virt[ddt->idx * 2 + 2] =3D 0;
> +	ddt->virt[ddt->idx * 2 + 3] =3D 0;

[Severity: High]
Does writing these values as raw uint32_t integers cause issues on
big-endian architectures? The SPAcc DMA controller expects little-endian
descriptors. Should these be converted using cpu_to_le32() to prevent
DMA out-of-bounds accesses and memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723120156.2852=
70-1-pavitrakumarm@vayavyalabs.com?part=3D2
