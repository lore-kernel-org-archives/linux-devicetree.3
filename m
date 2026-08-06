Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918A43ED11B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047873; cv=none; b=D1LGNsCtdWyM208PV3oeaYoFijSfVa9q7P8HCfG0v//7uL9lDuMAWOQhV2h0Gh3zisxmPECmZ5lJ0vGvUsFzeGgl/G9nuQBrJCERvDEPnwRrJABrYAme00QD4DTymqwKeCeApQTOP38OsINUqXHqGDY+36SKOcmMAzsEaaqfVIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047873; c=relaxed/simple;
	bh=wcfvZmEJQHXr44oDM/gR+68sY+Y0RU2rIg1Tnh/MMYQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lmzkL7vY3XnaX0rajhcyI64P3UHDyryIp9F9qldmH4xkwtPA2FOXT1LlCdzbszAXiYRiJbuZg5O81wlz85RlRdoZXK6HOupIrgkhitTC21kZt4MvKiaAem9cwjoGrSqi+nGbMzn6y7ZE/iX/PTWvYK/mS3erqILZUvVqP6/paZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJP07NcG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJP07NcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78031F000E9;
	Thu,  6 Aug 2026 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047871;
	bh=FTtVyhNeoTM1l/bqyo8OB/3FUX3951gUOwLx/e06ujk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJP07NcGQvmJSKmGpLgOlefn46cwPATnDlIxf4/sUqfQEAif4M6nCURIQG26LHiOk
	 dgwDOTm15REqQ/SVdXYTuQI2Xak69E5SgL5jeZQUYMzOQnh3+z4o9oJofU2sOJ0JFM
	 Oa3/xFbxNZzESeZ1uSkLZK2lZFc/yPUi6yCozS20SxOuRtlQgydKf2fo+QLU+G5WhM
	 hT9hmaoXGPEy5Qf89MaVI3klCyXCz20Gwz/byy7HYkPjiKOzt/uiqbhnzeTfQCGqe7
	 DQhZlLdVy0SPV5q8Alxb2S40MEanCY/X0Rsx40acaKC72rIcA7aTuRKrxaipUCdcAz
	 k9PrU21mwbR5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/19] crypto: cmh - add ECDSA/SM2 sig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806195519.2703224-14-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-14-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:24:30 +0000
Message-Id: <20260806202430.B78031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] DMA Use-After-Free (UAF) memory corruption during hardware timeout=
 in synchronous ECDSA operations.
- [Medium] Latent stack buffer overflow in ecdsa_be_to_vli() due to flawed =
bounds checking logic.
--

--- Patch [13]: [PATCH v3 13/19] crypto: cmh - add ECDSA/SM2 sig ---
commit 93e934df7eae63fe0a90fc7b8a6f5ff276f60f86
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ECDSA/SM2 sig

Register ECDSA and SM2 sig algorithms using the CMH PKE core.
Supports P-256, P-384, P-521, and SM2 curves for sign and verify
operations. SM2 is registered as verify-only via the crypto API.

> diff --git a/drivers/crypto/cmh/cmh_pke_ecdsa.c b/drivers/crypto/cmh/cmh_=
pke_ecdsa.c
> new file mode 100644
> index 0000000000000..6d6b8aec6c884
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_ecdsa.c

[ ... ]

> +static void ecdsa_be_to_vli(const u8 *in, unsigned int in_len,
> +			    u64 *vli, unsigned int max_digits)
> +{
> +	unsigned int full_len =3D max_digits * sizeof(u64);
> +	u8 tmp[ECC_MAX_BYTES];
> +	unsigned int i;
> +
> +	if (WARN_ON_ONCE(max_digits > ECC_MAX_DIGITS))
> +		max_digits =3D ECC_MAX_DIGITS;
> +
> +	memset(tmp, 0, full_len);

[Severity: Medium]
Does this code calculate full_len before clamping max_digits?

If a caller passes a large max_digits, full_len could exceed ECC_MAX_BYTES
before the clamping happens, potentially causing a stack buffer overflow
in the memset. Would it be safer to calculate full_len after the check?

[ ... ]

> +static int cmh_ecdsa_verify(struct crypto_sig *tfm,
> +			    const void *src, unsigned int slen,
> +			    const void *digest, unsigned int dlen)
> +{

[ ... ]

> +	ret =3D cmh_tm_submit_sync_mbx(vcq, PKE_VCQ_CMDS_MIN, 1, d.mbx_idx);
> +
> +out_unmap:
> +	if (!cmh_dma_map_error(rp_dma))
> +		cmh_dma_unmap_single(rp_dma, clen, DMA_FROM_DEVICE);
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, sig_raw_len, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(dig_dma))
> +		cmh_dma_unmap_single(dig_dma, clen, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(pk_dma))
> +		cmh_dma_unmap_single(pk_dma, ctx->pub_key_len, DMA_TO_DEVICE);
> +
> +out_free:
> +	kfree(rp_buf);

[Severity: High]
Is it possible for the hardware to still write to rp_buf if
cmh_tm_submit_sync_mbx() times out?

If a timeout occurs, this path unmaps and frees rp_buf back to the slab
allocator. Without a mechanism to abort the in-flight hardware operation,
could the hardware later complete its DMA write and corrupt the reallocated
memory?

> +	kfree(pk_buf);
> +	kfree(sig_raw);
> +	kfree(dig_buf);
> +	return ret;
> +}

[ ... ]

> +static int cmh_ecdsa_sign(struct crypto_sig *tfm,
> +			  const void *src, unsigned int slen,
> +			  void *dst, unsigned int dlen)
> +{

[ ... ]

> +	ret =3D cmh_tm_submit_sync_mbx(vcq, idx, 1, dd.mbx_idx);
> +	if (!ret) {
> +		/* Sync bounce buffer so CPU sees the DMA-written signature */
> +		cmh_dma_sync_for_cpu(sig_dma, sig_raw_len, DMA_FROM_DEVICE);
> +
> +		/* Encode raw (r||s) into VLI ecdsa_raw_sig for kernel API */
> +		ret =3D ecdsa_raw_to_sig(sig_buf, clen, dst, dlen);
> +	}
> +
> +out_unmap:
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, sig_raw_len, DMA_FROM_DEVICE);
> +	if (!cmh_dma_map_error(dig_dma))
> +		cmh_dma_unmap_single(dig_dma, clen, DMA_TO_DEVICE);
> +
> +out_free:
> +	kfree(sig_buf);

[Severity: High]
Similarly, does this free sig_buf while the hardware might still attempt a
DMA write upon a late completion?

Like the verify path, a timeout from cmh_tm_submit_sync_mbx could lead to
the hardware overwriting freed memory if the transaction is not successfully
aborted on the device.

> +	kfree(dig_buf);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D13
