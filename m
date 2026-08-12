Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E4335C1B1
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786558219; cv=none; b=YnQy+lVi23TJmlOHv2GLv08WPEWoPkpw4NmbgdTMu3xgKd1IoJGv90D+ZK/R3welJbqESSFq6SmCqEohDhE9uM9jQfjadjEYCGP4IGgJCw+Ds5OHQPcc4B890GXENCfv7hIHtL+4Qp1cW1DmzQQjf7V3n6r3glctJqRVy9vQHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786558219; c=relaxed/simple;
	bh=cFRWtAcIFld1C1QtyHSfoxoGqV89KNrypa87/LsktWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WFBfsWCg5iwvIarRdvXgJ/URMNQEGrkbNXZUoKq5tcyX5xo89mJikuabUVyRlzrUNgV0JsugeVMfh+vrF+sISSU0Oyk6F93woNwGPaziz+olE7zAO+ptTyss3bIqxUJXp5nPMYfKUpy8AS16Hmr/+ctR7MqlJdTLt6jYAxCjVDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkvYU4UK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkvYU4UK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A901F000E9;
	Wed, 12 Aug 2026 18:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786558215;
	bh=rEpHeD0D/o26V7uFgOEpLZ8qHnr69I7e/xR+NGdpFYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LkvYU4UKoVMutXB/QLBA/M1OwmZ/EvA+KioaAhiV11wqSUuO3d8yIWOI/G49dJ4Zb
	 d04nO2nEmkQJ7SJyBIbj9ky/gT+RMk40wF+HsevkKEff7dEeRoj3k0PDLfPcsck8gq
	 VXpX8YHc8Dne0TC5BrcsCI0U7nOiab4JUvmBvS3YuFcIPWOuxA3IunJcwmY83t0p1F
	 SVkoR8M62g1q5/4KEa9MFLmYIon511Z1SXRnln2kjR/ziSQeA9F4GoXdB0rpF7g1nZ
	 ddU3GZha/g/a5W3dHz+HPv98BJcaIZ8abd7v7r70jbsAz2qJSVp6kjZVG/zgkUqH/7
	 mbVa6EYEW5wZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812175020.666558-3-pavitrakumarm@vayavyalabs.com>
References: <20260812175020.666558-1-pavitrakumarm@vayavyalabs.com>
 <20260812175020.666558-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 18:10:14 +0000
Message-Id: <20260812181014.B9A901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing hardware reset in the removal path allows DMA writes to fr=
eed memory
- [High] Use-after-free of `priv->engine` during device teardown due to inc=
orrect cleanup ordering
- [Medium] Data corruption due to overloading `pre_aad_sz` parameter with `=
SPACC_AADCOPY_FLAG`
--

--- Patch [2]: [PATCH v22 2/4] crypto: spacc - Add SPAcc ahash support ---
commit 78512023fe2c29d98b9094823066da614d7046ac
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

This commit introduces asynchronous hash support for the SPAcc driver,
covering algorithms like CMAC, XCBC, MD5, SHA1, SHA2, and SHA3. It implemen=
ts
the core driver structure, crypto engine callbacks, and the hardware control
logic for these hash operations.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
[ ... ]
> +static int spacc_hash_do_one_request(struct crypto_engine *engine, void =
*areq)
> +{
[ ... ]
> +	if (spacc_hash_try_hw(tctx, priv, salg, reqtfm, req) < 0)
> +		goto fallback;
> +
> +	rc =3D spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
> +			&ctx->src, &ctx->dst, req->nbytes,
> +			0, req->nbytes, 0, 0, 0);

[Severity: Medium]
Here in spacc_hash_do_one_request(), the length req->nbytes is passed
directly as the pre_aad_sz argument to spacc_packet_enqueue_ddt().

If a caller submits a hash request with a buffer size >=3D 2GB (where the
MSB is set), doesn't this trigger the SPACC_AADCOPY_FLAG check inside
spacc_packet_enqueue_ddt_ex()?

spacc_packet_enqueue_ddt_ex() implements:

    if (pre_aad_sz & SPACC_AADCOPY_FLAG) {
        job->ctrl  |=3D SPACC_CTRL_MASK(SPACC_CTRL_AAD_COPY);
        pre_aad_sz &=3D ~(SPACC_AADCOPY_FLAG);
    }

Could this lead to the hardware receiving an incorrectly truncated payload
size and an unexpected SPACC_CTRL_AAD_COPY control flag, causing an
incorrect hash output or hardware malfunction?

[ ... ]
> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
[ ... ]
> +static void spacc_crypto_remove(struct platform_device *pdev)
> +{
> +	struct spacc_priv *priv =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +
> +	spacc_unregister_algs(priv);
> +
> +	if (priv->engine)
> +		crypto_engine_exit(priv->engine);

[Severity: High]
The crypto engine is exited and its structure is freed here, but the
interrupt handler and workqueue are still active.

If a hardware job completes and raises an interrupt immediately after
crypto_engine_exit() returns, the IRQ handler queues the work. The
worker then executes spacc_digest_cb(), which eventually calls:

    crypto_finalize_hash_request(priv->engine, cb->req, err);

Does this create a race condition where the active callbacks dereference
the freed priv->engine state, leading to a use-after-free?

> +
> +	spin_lock_irqsave(&priv->spacc.lock, flags);
> +	spacc_irq_glbl_disable(&priv->spacc);
> +	spin_unlock_irqrestore(&priv->spacc.lock, flags);
> +
> +	devm_free_irq(&pdev->dev, priv->irq, &pdev->dev);
> +
> +	if (priv->spacc_wq)
> +		destroy_workqueue(priv->spacc_wq);
> +
> +	dma_pool_destroy(priv->hash_pool);

[Severity: High]
The hash_pool (and later the ddt pools via spacc_remove()) are
destroyed here.

However, the removal path never issues a hardware abort or reset command
to the SPAcc engine to halt any ongoing asynchronous operations. If the
module is unloaded while a crypto hardware request is actively processing,
the hardware will continue executing the job.

Could this allow the hardware to eventually complete the job and perform a
DMA write of the digest or ciphertext into the destination buffer allocated
from the now-destroyed pools, silently corrupting whatever system memory
has claimed that physical address?

> +	priv->hash_pool =3D NULL;
> +
> +	spacc_remove(pdev);
> +	platform_set_drvdata(pdev, NULL);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812175020.6665=
58-1-pavitrakumarm@vayavyalabs.com?part=3D2
