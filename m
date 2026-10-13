Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06995293F6
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914567; cv=none; b=lS6QIY5dGrYizjPIcf+e4zOA8ieEcwXM8OMw3T1IzcsvXgBS2KyqO356a/A05cEueIpmaSie5I9FXFgTypEGSeu8rAtnpO1cIFbuhreaTtCjvzWcy1sN+4JQPrAca5tMo3mHCvbq1feMlXYLRpZl7byD1HjBUex7NLuFxnzk/B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914567; c=relaxed/simple;
	bh=v5KqDovjRbiA2G/dSHPE6+2hXLeHXQS2DhRYvdQaWP0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cMt8/SOWruNpVbnHnnOm/ZfINUYj7/aYm3EoVem04Kq3iA7aEZ9zHbS0tDsteKmSLM7jRbvm7J6yh3YFZRlCoDuZ1/9U5Uc/8gaeNV3YMT4zMN3K2gFFQt4dDk3swHtM9mR3/c5pHjBT1aIsn7HvzzjNBdDuxeEEcTAIZcIagvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTTtUald; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTTtUald"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012F21F000FF;
	Tue, 13 Oct 2026 18:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791914563;
	bh=bBz2kxBTgjJszw7BNI2/B7hqKkHuhFBO+HQu/ep3XPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HTTtUaldtO9a3onFqTZtyyqNrOrwBt2uWfeIXf9uMeOVrZyyi7Xe0kIQdvK92vwJG
	 tg7Kg7TcAq9i9FTQeUww4n9aQkUuoRCIs2SIbVK+HibRa3PKAnmwUlgIXiwr034J6s
	 dcjCPswjLkcWki7ub4wtV7Ay43/gccjKWg2i+40gBoxZGSsFFuQAC0JU6Hskh+MTT6
	 JqGmF9NuF32h+VgkHN92G+PVX4JBAnZGeKSH6SAl7qK1V8MVN5feLdkGcGjyy94Mqq
	 5dzzoyS2X7dMA1c1ft3V2G8UDJ2NjQJ7G5DlkAoyLEEHhTySHq4DgmgvDCGxU0ZOn6
	 luyuCFPlX4KPQ==
Message-ID: <sashiko-outbox-170288@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] crypto: cmh - add AES skcipher/aead/cmac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013174847.2192609-5-aousherovitch@rambus.com>
References: <20261013174847.2192609-1-aousherovitch@rambus.com>
 <20261013174847.2192609-5-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:02:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mm: spurious ENOMEM on crypto requests due to high-order kmalloc
--

commit 6acd06ca4d876414812511190b70a583e7f5687b
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add AES skcipher/aead/cmac

This commit registers AES algorithms using the CMH AES core for skcipher,=20
aead, and ahash. It supports 128, 192, and 256-bit keys, and routes
operations through hardware acceleration.

> diff --git a/drivers/crypto/cmh/cmh_aes.c b/drivers/crypto/cmh/cmh_aes.c
> new file mode 100644
> index 0000000000000..d4352caf771f6
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes.c
[ ... ]
> @@ -371,19 +474,16 @@ static int cmh_aes_crypt(struct skcipher_request *r=
eq, u32 aes_op)
> +	/*
> +	 * Linearise input from scatterlist.  cryptlen is user-controlled up
> +	 * to CMH_AES_MAX_CRYPTLEN (well above KMALLOC_MAX_SIZE), so use
> +	 * __GFP_NOWARN: an oversized request fails cleanly with -ENOMEM
> +	 * instead of splatting the page allocator.
> +	 */
> +	rctx->in_buf =3D kmalloc(req->cryptlen, gfp | __GFP_NOWARN);
> +	if (!rctx->in_buf)
> +		return -ENOMEM;
> +
> +	scatterwalk_map_and_copy(rctx->in_buf, req->src, 0, req->cryptlen, 0);
> +
> +	rctx->in_dma =3D cmh_dma_map_single(rctx->in_buf, req->cryptlen,
> +					  DMA_TO_DEVICE);
> +	if (cmh_dma_map_error(rctx->in_dma)) {
> +		ret =3D -ENOMEM;
> +		goto out_free_in;
> +	}
> +
> +	/* Allocate and map output buffer */
> +	rctx->out_buf =3D kmalloc(req->cryptlen, gfp | __GFP_NOWARN);
> +	if (!rctx->out_buf) {
> +		ret =3D -ENOMEM;
> +		goto out_unmap_in;
> +	}

[Severity: High]
Will this contiguous allocation fail under normal system memory fragmentati=
on?=20

The skcipher cryptlen can be up to CMH_AES_MAX_CRYPTLEN (32MB), but kmalloc=
()=20
has a hard limit of KMALLOC_MAX_SIZE (typically 4-8MB) and will=20
deterministically fail for larger sizes. Even for moderately large sizes=20
(e.g. 64KB - 1MB), kmalloc() is highly prone to failing when system physica=
l=20
memory fragments.

Because the crypto framework does not automatically retry with a software=20
fallback when the hardware driver returns -ENOMEM, valid requests (such as=
=20
those from dm-crypt or IPsec) might unexpectedly fail and break caller=20
functionality. Could this be changed to support scatter-gather directly or=
=20
use a fallback allocation strategy if the hardware supports it?

> diff --git a/drivers/crypto/cmh/cmh_aes_aead.c b/drivers/crypto/cmh/cmh_a=
es_aead.c
> new file mode 100644
> index 0000000000000..ed2a0b9449bc0
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes_aead.c
[ ... ]
> @@ -622,15 +740,11 @@ static int cmh_aes_aead_crypt(struct aead_request *=
req, u32 aes_op)
> +	/* Linearise input */
> +	if (cryptlen > 0) {
> +		rctx->in_buf =3D kmalloc(cryptlen, gfp | __GFP_NOWARN);
> +		if (!rctx->in_buf) {
> +			ret =3D -ENOMEM;
> +			goto out_unmap_aad;
> +		}

[Severity: High]
Similarly here in cmh_aes_aead_crypt(), the driver attempts to allocate up =
to
1MB of contiguous memory using kmalloc(). Does this run the same risk of
failing due to memory fragmentation and propagating spurious -ENOMEM errors
to the AEAD callers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013174847.2192=
609-1-aousherovitch@rambus.com?part=3D4
