Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162543DDB0D
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047513; cv=none; b=m4eXt3tm8xbJM4lTh/x8T8r6ffaXD0ZPIxdr3RFPBxBNby6NeqEOHFayHsZ/pu1UKrOs4xPoAiZt38yR3gzewDOx346hJZGzTMi2fQdH8Uz8TVCo6cKg8RyWybdMsztGM+h5bZf4eILVkGEbRenoYGSVseCG8bJapu1NXX6obv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047513; c=relaxed/simple;
	bh=sga2w+k/CFUhLuyOc9iojRhW9CgrtB+2z8DZOWXlmuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lurr3KL8WcopLsZyapEwuTTO+aR2ifoxv1NwkIgc9ytderRoxWNmwEzrCdtDIuPso68S1UVKM1raDx4xyi81aYLVky02UL7iYbX4zl9xLZVssxx+hv0kny8AI0VKd7MOZssGfQbybH8x7o9V6JSJGn7qSaruX8Q/E5j3/++Xr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UthOEH4S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UthOEH4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D1F1F000E9;
	Thu,  6 Aug 2026 20:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047508;
	bh=GhdV3Zl7Dneo3xM/4jA8gOpDlxv4UUuJpGkKnbYx1ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UthOEH4S6H7FagqmVFZR+7XzIR3AlU9Q3qYtXaoY6QF6i7DmpXbhyeSt//oqjnZCY
	 /vpDdgjHmLYgDQf1rJ+yh23b1iDRz0qQNFUD+htt9jtTV41i4LQk8EGM1fiNz6ZFfM
	 zBm1/g1r0VS4TU+M+KyaZ9DPHbT/BE81b8aCEj1FN1oqXena7r8cJY4VHxLj/f40SK
	 /GYZ/Tlx0YvrkxxEb4ld2/08JZ3W9cHyQVvBcXYfdnDS/SGh5Ml9ZENzXwiosRxqsr
	 dJLA3THxXToYeGwNmnDRQ7DIpEnylq11zqf1FLjutVnumM3VifLTvGnypcA+gWYcIK
	 VmI8qiq41kE7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/19] crypto: cmh - add RSA akcipher
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806195519.2703224-13-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-13-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:18:27 +0000
Message-Id: <20260806201828.11D1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] State corruption in RSA akcipher key setup allows unprivileged=
 kernel panic or out-of-bounds DMA access.
--

--- Patch [12]: [PATCH v3 12/19] crypto: cmh - add RSA akcipher ---
commit 1cce85c01c65473c016e5f55fbec7d241cfe672c
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add RSA akcipher

This commit registers the RSA akcipher algorithm using the CMH PKE core.
It supports encrypt, decrypt, sign, and verify operations with 2048, 3072,=
=20
and 4096-bit keys, as well as 512 and 1024-bit keys for interoperability.

> diff --git a/drivers/crypto/cmh/cmh_pke_rsa.c b/drivers/crypto/cmh/cmh_pk=
e_rsa.c
> new file mode 100644
> index 0000000000000..a848b7eddc8e2
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_rsa.c
[ ... ]
> +static int cmh_rsa_set_pub_key(struct crypto_akcipher *tfm,
> +			       const void *key, unsigned int keylen)
> +{
> +	struct cmh_rsa_tfm_ctx *ctx =3D cmh_rsa_ctx(tfm);
> +	struct rsa_key rsa =3D {};
> +	int ret;
[ ... ]
> +	/* Strip ASN.1 leading zero padding from modulus */
> +	while (rsa.n_sz > 0 && rsa.n[0] =3D=3D 0) {
> +		rsa.n++;
> +		rsa.n_sz--;
> +	}
> +
> +	ctx->bits =3D cmh_rsa_key_bits(rsa.n_sz);
> +	if (!ctx->bits)
> +		return -EINVAL;
> +
> +	/* Reject an exponent wider than the modulus (HW buffer bound). */
> +	if (!rsa.e_sz || rsa.e_sz > ctx->bits / 8)
> +		return -EINVAL;

[Severity: Critical]
Does this code corrupt the tfm state if validation fails?

If a valid key is set first, ctx->n and ctx->e are populated. Then, if
a subsequent invalid key is provided (e.g. an unsupported modulus size where
cmh_rsa_key_bits() returns 0), ctx->bits is updated to 0 and an error is
returned.

This leaves the tfm in a split state where ctx->n and ctx->e are non-NULL
but ctx->bits is 0.

If a subsequent cmh_rsa_enc() is called with a zero-length source buffer:

cmh_rsa_enc()
   u32 key_bytes =3D ctx->bits / 8; // 0
   ...
   rctx->m_buf =3D kzalloc(key_bytes, gfp); // Returns ZERO_SIZE_PTR
   ...
   rctx->m_dma =3D cmh_dma_map_single(rctx->m_buf, key_bytes, DMA_TO_DEVICE=
);

The ZERO_SIZE_PTR is passed to cmh_dma_map_single(), which can cause a
kernel panic (Oops). This path appears reachable by unprivileged userspace
via the AF_ALG interface.

[ ... ]
> +static int cmh_rsa_set_priv_key(struct crypto_akcipher *tfm,
> +				const void *key, unsigned int keylen)
> +{
> +	struct cmh_rsa_tfm_ctx *ctx =3D cmh_rsa_ctx(tfm);
> +	struct rsa_key rsa =3D {};
> +	u32 key_bytes;
> +	u8 *d_padded;
> +	int ret;
[ ... ]
> +	/* Strip ASN.1 leading zero padding from modulus */
> +	while (rsa.n_sz > 0 && rsa.n[0] =3D=3D 0) {
> +		rsa.n++;
> +		rsa.n_sz--;
> +	}
> +
> +	ctx->bits =3D cmh_rsa_key_bits(rsa.n_sz);
> +	if (!ctx->bits || !rsa.d_sz)
> +		return -EINVAL;
> +
> +	key_bytes =3D ctx->bits / 8;
> +
> +	/* Strip ASN.1 leading zero padding from private exponent */
> +	while (rsa.d_sz > 0 && rsa.d[0] =3D=3D 0) {
> +		rsa.d++;
> +		rsa.d_sz--;
> +	}
> +
> +	if (!rsa.d_sz || rsa.d_sz > key_bytes)
> +		return -EINVAL;

[Severity: Critical]
Could this similarly corrupt ctx->bits on failure?

As with cmh_rsa_set_pub_key(), updating ctx->bits before completing all
validation checks allows the tfm to be left in an inconsistent state if an
error is returned, potentially leading to the same zero-size allocation and
DMA mapping crash during later operations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D12
