Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447D233ADA3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 21:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631002; cv=none; b=gxvb5ruI70O0ErBLQQQDACF4C2VbhS4GBuE2xO1mbzlOpkP7tPlOxFQN7WVtY87R1fRnH50B5YWXqbUfbPpF4xh0PDc20/pL7ppB2ZCc95J3cVk/QC7vmRoaaY5dx/7D/4gH4+52t0bDFVTepkUA/78L85W3f1YZ7IctGyeKgAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631002; c=relaxed/simple;
	bh=mzADz6eyDapBeLkuhk5eJCllLRdiP6R+peDUtChPSd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HebCvujqb8Jjqb9gxaR+qIe+JA7tpYjP/4LP/6Dg6yO6ajkq3EqxDtyepoyslwDHGFi9ohGsS31fXml7ji5zoYx8x8pZoAneorQUcXktrquFB2MNmOISZCd5WVsi+XsYjR5vUkTa0XDvTJbGC6jCIzN5Vx8Q9MlUzxO9jfl9qOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNt9EMFw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNt9EMFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31E61F000E9;
	Thu,  9 Jul 2026 21:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783631000;
	bh=6T3peSU6Dqq0Arq9wEa14hWd40xVC2v5bl+7TBB3s1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oNt9EMFwn1wcWyHeCVyLGLlVZwHy4mWjei0dP075E93nYef0VmMWPoFKXITVvkrxZ
	 7gv2UoNeXSKgMV2qKgiASPmFLuopl6xiD5+0BtCF6gm/Ur/XIuUrHJuvLdx/Q37wJY
	 RUQgVWsCJB6ZlE+l7f9JPcfQ64YDip8VTzIAScgJojt4YohDpiqJtHPDkzETD9kOQi
	 mY1MSeYOXh1+PBu1Q/u+mxugR7iOLVcvWyfUW0FgRZZzoPiyfHpI4Q60hhPbael420
	 0opRnNUAy6s7/x0GPRTDS0r6KFJcp/ViyxGq3qaVKu5EXOflYGdSde2u5mtHdXqcIu
	 d9fihebMNZU4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/19] crypto: cmh - add ML-KEM/ML-DSA (QSE)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709203037.1884436-16-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-16-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 21:03:20 +0000
Message-Id: <20260709210320.A31E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing software fallback for oversized ML-DSA messages and incorr=
ect rejection of 0-length messages.
- [Medium] Redundant DMA mappings and DMA API ownership violation for key b=
uffers.
--

--- Patch [15]: [PATCH v2 15/19] crypto: cmh - add ML-KEM/ML-DSA (QSE) ---
commit c3b137e6f523e1962d3380a121a8e0166757ffb3
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ML-KEM/ML-DSA (QSE)

This patch registers ML-KEM and ML-DSA algorithms using the CMH QSE core.
It provides ML-DSA as a signature algorithm at priority 5001, overriding
the kernel's software implementation. It includes key generation, signing,
and verification capabilities.

> diff --git a/drivers/crypto/cmh/cmh_pqc_mldsa.c b/drivers/crypto/cmh/cmh_=
pqc_mldsa.c
> new file mode 100644
> index 0000000000000..cbe63c34a1c80
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pqc_mldsa.c
[ ... ]
> +static int cmh_mldsa_sign(struct crypto_sig *tfm,
> +			  const void *src, unsigned int slen,
> +			  void *dst, unsigned int dlen)
> +{
[ ... ]
> +	if (ctx->key.mode !=3D CMH_KEY_RAW)
> +		return -EINVAL;
> +	if (dlen < sig_size)
> +		return -EINVAL;
> +	if (!slen || slen > ML_DSA_MAX_MLEN)
> +		return -EINVAL;

[Severity: High]
Does returning -EINVAL here permanently fail valid operations?

FIPS 204 allows 0-length messages, so rejecting slen =3D=3D 0 might break v=
alid
requests. Additionally, since this driver registers at priority 5001 and
overrides the generic software implementation (priority 5000), returning an
error for messages over ML_DSA_MAX_MLEN (10KB) means the crypto API won't
transparently fall back.

Should the driver internally allocate a fallback software tfm to handle
oversized messages, and properly support 0-length messages?

> +
> +	m_buf =3D kmemdup(src, slen, GFP_KERNEL);
> +	sig_buf =3D kzalloc(sig_size, GFP_KERNEL);
> +	if (!m_buf || !sig_buf) {
> +		ret =3D -ENOMEM;
> +		goto out_free;
> +	}
> +
> +	if (ctx->key.raw.len !=3D sk_size) {
> +		ret =3D -EINVAL;
> +		goto out_free;
> +	}
> +
> +	sk_buf =3D kmemdup(ctx->key.raw.data, ctx->key.raw.len, GFP_KERNEL);

[Severity: Medium]
Does this redundantly copy and map the secret key?

The key in ctx->key.raw.data was already mapped as ctx->key.raw.dma in
cmh_key_setkey_raw() for the lifetime of the key. Also, since that buffer
is mapped to the device (DMA_TO_DEVICE), does reading from it here with
kmemdup() violate DMA API ownership rules?

Can this code just pass ctx->key.raw.dma directly to the VCQ command to
avoid the extra allocation and copy on the hot path?

> +	if (!sk_buf) {
> +		ret =3D -ENOMEM;
> +		goto out_free;
> +	}
[ ... ]
> +static int cmh_mldsa_verify(struct crypto_sig *tfm,
> +			    const void *src, unsigned int slen,
> +			    const void *digest, unsigned int dlen)
> +{
[ ... ]
> +	if (!ctx->pub_key)
> +		return -EINVAL;
> +	if (slen !=3D sig_size)
> +		return -EINVAL;
> +	if (!dlen || dlen > ML_DSA_MAX_MLEN)
> +		return -EINVAL;

[Severity: High]
Similar to the signing path, does this incorrectly reject valid 0-length
messages and oversized messages?

Since the driver overrides the software fallback, it likely needs to handle
dlen =3D=3D 0 and delegate messages larger than ML_DSA_MAX_MLEN to a softwa=
re
fallback to maintain API contracts.

> +
> +	sig_buf =3D kmemdup(src, slen, GFP_KERNEL);
> +	m_buf =3D kmemdup(digest, dlen, GFP_KERNEL);
> +	pk_buf =3D kmemdup(ctx->pub_key, pk_size, GFP_KERNEL);

[Severity: Medium]
Does this redundantly allocate and map the public key on every verification?

Instead of copying it here, could the public key be mapped once in
cmh_mldsa_set_pub_key() and reused, avoiding this extra copy overhead
on every verify operation?

> +	if (!sig_buf || !m_buf || !pk_buf) {
> +		ret =3D -ENOMEM;
> +		goto out_free;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D15
