Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5C378839
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630020; cv=none; b=rUqLouYBEhL20A5YiTKUr+omT/he9xRmRurVAmhdPUT/kaK8PSvtvrFZ6vZ1TKUBuujf8g0eDhVqZpO7g/TUzONeq0LtYSPN5a4oYvd+IUqZzA+BYQzQzMGW4ZGL7gJGlrGlM8uB2vFDOiiQtWGxN27wLw+2XSMPQHjytrESZFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630020; c=relaxed/simple;
	bh=KB8wOnRdNXOSKHPQa04wjYPDr5KL7VJR570mh6YMFOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QvRdFLmb8o/MBBL0LUG7GyyGPTkRE1l/jk5eAHacGT+pHZbJmJGF43/pA82SRfwllsO/Jg86gbspj6BK62Kx/qI+wXwRBgJ66xaZjHEzasabyO3f2BasCXpQH2c24FQ5pAF4WRLt3VbIwBfmYrVhqZ5t3At2wDX2LBwcA2zL4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3ovBeUF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3ovBeUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1211F000E9;
	Thu,  9 Jul 2026 20:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630019;
	bh=h9C5p8uVfIVhyihbp7S/pjPXzz6PjBaHOH1FeDKhJ0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E3ovBeUFmuU0CTkfNLABf4W4DqSu72tti6MYh6gXrp9K+qlV12GdnVsqwi75t9tAW
	 TUzM++5NsZ2ALDF+WEiGucHH3q2O++b3PJW5P0OKYSqcwAorgbQiHbaMroviPr4D8G
	 jp3A0qNGCeK/jL9Tpkc9IBWlNGlMi44htzmTXlVqq6543i8dCdQESLGtOsx5K6jF5Y
	 YUtOd0u7CWb+8vCl//Lar6V8s2NOONCIHm4urFAEvlUrAej/bqIrkkIMES4OIbWSmx
	 EIchZgN7ERFiPAqAZb9U/RO1WbgQOMVt471GlFuNk4FcDNDj1pMBcuX2nIbf+NuqUq
	 Kts4g1N1ZZ1Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/19] crypto: cmh - add ChaCha20-Poly1305
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709203037.1884436-11-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-11-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:46:58 +0000
Message-Id: <20260709204658.9F1211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Failure to reset `total_len` during an error in `cmh_poly_upda=
te` causes `cmh_poly_final` to leak uninitialized kernel heap memory.
- [High] Unbounded kernel memory exhaustion (DoS) in Poly1305 driver due to=
 missing request destructor and improper re-initialization.
- [Medium] Using `dma_addr_t` as a boolean check in the error path of `cmh_=
poly_final` leaks a DMA mapping if the mapped address is 0.
--

--- Patch [10]: [PATCH v2 10/19] crypto: cmh - add ChaCha20-Poly1305 ---
commit 23c814e3e61faada221bb1fbcd27c935e6800b9b
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ChaCha20-Poly1305

Register ChaCha20-Poly1305 AEAD and ChaCha20 skcipher algorithms
using the CMH CCP core (core ID 0x18).  Also registers the Poly1305
ahash for standalone use.

> diff --git a/drivers/crypto/cmh/cmh_ccp_poly.c b/drivers/crypto/cmh/cmh_c=
cp_poly.c
> new file mode 100644
> index 0000000000000..020a98fbe6070
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_ccp_poly.c

[ ... ]

> +static int cmh_poly_init(struct ahash_request *req)
> +{
> +	struct cmh_poly_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	memset(rctx, 0, sizeof(*rctx));

[Severity: High]
Does this code leak dynamically allocated chunks? If a user-space applicati=
on
creates an AF_ALG socket, accumulates data, and then either closes the requ=
est
or re-initializes it by calling cmh_poly_init() again, the request context =
is
zeroed here, losing the pointers to the chunks while they remain on the TFM
list.

The ahash API does not have a freereq callback to handle early closure
cleanups.

> +	INIT_LIST_HEAD(&rctx->chunks);
> +	return 0;
> +}

[ ... ]

> +err_free_chunks:
> +	/*
> +	 * Terminal error -- free all previously accumulated chunks.
> +	 * Callers may not call .final() on error, so they would leak.
> +	 */
> +	cmh_poly_free_chunks(rctx, tctx);
> +	return ret;

[Severity: Critical]
Could this leak uninitialized kernel memory? When cmh_poly_update() encount=
ers
an error and frees the chunks here, it does not reset rctx->total_len to 0.

If cmh_poly_final() is subsequently called, it allocates an uninitialized
kmalloc buffer of size total_len, skips the memcpy loop because the chunk l=
ist
is empty, and maps it for DMA.

An attacker providing the key could potentially recover the plaintext of the
uninitialized kernel heap data by reversing the resulting MAC.

> +}

[ ... ]

> +static int cmh_poly_final(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_poly_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_poly_reqctx *rctx =3D ahash_request_ctx(req);
> +	struct vcq_cmd cmds[CMH_POLY_MAX_PAYLOAD];
> +	struct core_dispatch d;
> +	s32 target_mbx;
> +	u32 core_id;
> +	u32 idx;
> +	int ret;
> +	gfp_t gfp;

[ ... ]

> +out_unmap_in:
> +	if (rctx->total_len > 0 && rctx->in_dma)
> +		cmh_dma_unmap_single(rctx->in_dma, rctx->total_len,
> +				     DMA_TO_DEVICE);

[Severity: Medium]
Does this code inadvertently leak a DMA mapping on architectures where 0 is=
 a
valid DMA address? Checking if a dma_addr_t is non-zero will fail when the
mapped address happens to be exactly 0, skipping the unmap call.

> +out_unmap_tag:
> +	cmh_dma_unmap_single(rctx->tag_dma, POLY1305_DIGEST_SIZE,
> +			     DMA_FROM_DEVICE);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D10
