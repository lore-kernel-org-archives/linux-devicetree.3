Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB81B6CE9
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631061; cv=none; b=JMAjLsLRN4URXvkNg5oGd0H+uIPoPaoYL1SukXabOBHnz8Pzu0t5LUW2lVNHDQW5qgl8VZ4shKdnz7ZiPMPsi1AMskTakRZh4hkfFnMgY0KpFfCl1jYeK2vYurJqrf5dr3Ml4WyaURBLyXlhoZPRO/FINTo/2EVx9oNLvB1x+bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631061; c=relaxed/simple;
	bh=pg6O6pLAi4R+D9EBSgd+5OcWBrIWQhjgK06k9wKlVJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nY4L/f4wfmrT6De2vj+xRakcj0Eo/IjFZvFU2t7XJWivYGS8APqMHaoPGDMIR09eNwawsMLfYrHIjmnQ6PmMdktXAim9Y85z2uBu/wP2TMSLxBiezGqW2VpgOhG0exGQJn/vAb8eb0XxZMZHCMfwSulQFxo8mWvKRQ7fn2Ikx0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nr3EYfW4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nr3EYfW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11241F000E9;
	Thu,  9 Jul 2026 21:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783631060;
	bh=4Kd+SY2SVO2wVBZeTKckuh7Gm/ifykDErzX+ihX0yjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nr3EYfW45HgGWPxAXVMUksW0Y94+dMJSJUapXrVDOeDodJHPQmr/etvRIz5nL/4CI
	 UHRro95lON0qis3F4rIBClek4U+B4IyzMY04dCxHO16FmlVJtW2jz7e16ARqqQH785
	 TcXpqA7RkPh/U7ZTGW0FsCDlo3olYSkk6w6/cZgw0u9SAWJ0jBIjMJKYr6TSdZwpFX
	 eZWK9TZ02x3A+33mVBMs+BUrrmTmr/uGehG03s36lv5P3yk8R2Q3ZN0nKr3oM5ZG2z
	 elSUOCRCQeEbMubJOKizK5hptIiXdly6dzc75vhMBrFuWxwXUMESbMCK6TN80csm6Z
	 Ru+UC40H41mTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/19] crypto: cmh - add ECDSA/SM2 sig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709203037.1884436-14-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-14-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 21:04:18 +0000
Message-Id: <20260709210419.E11241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `cmh_ecdsa_set_priv_key` incorrectly rejects valid P-521 private k=
eys due to a strict length check.
- [High] A malicious user can provide an oversized ECDSA signature to trigg=
er a WARN_ON_ONCE, potentially causing a kernel panic on systems with panic=
_on_warn enabled.
- [Medium] Unnecessary copying and DMA mapping of the private key on the fa=
st path during `cmh_ecdsa_sign()`.
--

--- Patch [13]: [PATCH v2 13/19] crypto: cmh - add ECDSA/SM2 sig ---
commit 6d12540edcf70f967d4d40c53ce926233bb16875
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ECDSA/SM2 sig

This commit registers ECDSA and SM2 signature algorithms using the CMH PKE
core. It supports P-256, P-384, P-521, and SM2 curves for signing and
verification. SM2 is registered as verify-only via the crypto API.

> diff --git a/drivers/crypto/cmh/cmh_pke_ecdsa.c b/drivers/crypto/cmh/cmh_=
pke_ecdsa.c
> new file mode 100644
> index 0000000000000..6b65f7fb72cc9
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_ecdsa.c

[ ... ]

> +static void ecdsa_vli_to_be(const u64 *vli, unsigned int ndigits,
> +			    u8 *out, unsigned int out_len)
> +{

[ ... ]

> +	} else {
> +		/* VLI wider than out -- skip leading (zero) bytes */
> +		u8 tmp[ECC_MAX_BYTES];
> +
> +		for (i =3D 0; i < ndigits; i++)
> +			put_unaligned_be64(vli[ndigits - 1 - i],
> +					   &tmp[i * sizeof(u64)]);
> +		skip =3D full_len - out_len;
> +		WARN_ON_ONCE(memchr_inv(tmp, 0, skip));

[Severity: High]
Can an unprivileged user trigger this WARN_ON_ONCE by providing an
oversized signature (e.g., via keyctl or AF_ALG)?

If the user passes an r or s array padded with non-zero upper bytes during
signature verification, could this cause a kernel panic on systems with
panic_on_warn enabled?

Would it be safer to return -EINVAL here instead of warning?

> +		memcpy(out, tmp + skip, out_len);
> +	}
> +}

[ ... ]

> +static int cmh_ecdsa_sign(struct crypto_sig *tfm,
> +			  const void *src, unsigned int slen,
> +			  void *dst, unsigned int dlen)
> +{

[ ... ]

> +	dig_buf =3D kzalloc(clen, GFP_KERNEL);
> +	sig_buf =3D kzalloc(sig_raw_len, GFP_KERNEL);
> +	sk_buf =3D kmemdup(ctx->key.raw.data, ctx->key.raw.len, GFP_KERNEL);
> +	if (!dig_buf || !sig_buf || !sk_buf) {
> +		ret =3D -ENOMEM;
> +		goto out_free;
> +	}
> +
> +	/*
> +	 * Truncate or zero-pad digest to clen bytes, right-aligned.
> +	 * Matches ECDSA bits2int: use leftmost min(slen, clen) bytes,
> +	 * zero-pad on the left when slen < clen.
> +	 */
> +	memcpy(dig_buf + (clen - copy_len), src, copy_len);
> +
> +	dig_dma =3D cmh_dma_map_single(dig_buf, clen, DMA_TO_DEVICE);
> +	sig_dma =3D cmh_dma_map_single(sig_buf, sig_raw_len, DMA_FROM_DEVICE);
> +	sk_dma =3D cmh_dma_map_single(sk_buf, ctx->key.raw.len, DMA_TO_DEVICE);

[Severity: Medium]
Is it necessary to allocate and DMA map the private key on the fast path
during cmh_ecdsa_sign()?

Since cmh_key_setkey_raw() already pre-maps the key into ctx->key.raw.dma
for the lifetime of the transform, does duplicating this mapping here
cause unnecessary performance overhead, or unnecessarily expose the private
key material in a transient heap buffer?

> +
> +	if (cmh_dma_map_error(dig_dma) || cmh_dma_map_error(sig_dma) ||
> +	    cmh_dma_map_error(sk_dma)) {
> +		ret =3D -ENOMEM;

[ ... ]

> +static int cmh_ecdsa_set_priv_key(struct crypto_sig *tfm,
> +				  const void *key, unsigned int keylen)
> +{
> +	struct cmh_ecdsa_tfm_ctx *ctx =3D cmh_ecdsa_ctx(tfm);
> +
> +	if (keylen !=3D ctx->clen)
> +		return -EINVAL;

[Severity: High]
Does this strict length equality check prevent P-521 signing?

The kernel crypto API passes exactly 66 bytes (ceil(521/8)) for P-521
coordinates, but ctx->clen for P-521 is 68. Would it be better to accept
lengths <=3D clen and left-pad them with zeroes, similar to how
cmh_ecdsa_set_pub_key() handles it?

> +
> +	return cmh_key_setkey_raw(&ctx->key, key, keylen, CORE_ID_PKE);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D13
