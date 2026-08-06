Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79813ED12B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047874; cv=none; b=LYnLInP8J7fTUghVWayJON6ydtMFmtK37aZgRTNlLOobiVYbaZPVaqs9t3sJiVUHx9jHHqIQG8MdUiQLuGqJdy6tNtwddrYyF/SYv4nb3YMt9i+y8FFiz9kt0P8XbU6RfodvqFnFiPw8FkcXXm3UfUzO8MmC8cvhqVSgzGZjuY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047874; c=relaxed/simple;
	bh=c0TQCCoETpaQBkYWPev3xKQdPwVoyMTZvt3/Z2IaMmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e9eK7v7Sr2rNQBSKeo+vYTgUx9FSwxdzplPUdfwyO7oxwvIyud/pmb1sisqbXdoilx8UKCYrSvhRZUjsJljic7QM0hp48AcHQkiGOEwYGElLjXK+nsUfYzphT0QRFeV0nFMZVE952JERtbCQpNyVH9e5igjJmcjbhqASwksWTvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFTBmrnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFTBmrnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781AE1F00A3E;
	Thu,  6 Aug 2026 20:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047871;
	bh=IHB/1/RcunUOBU2d1mDfo7ar+RfsbbCMDOvYfnpVFZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cFTBmrnp3LovEDT0M3RMXtNWbkObzLG8Txr8XyywPvfsCwbs5mGTV/cOjBYgUMMA6
	 DQNsIvDvg7VtGYRHYwEvbLBNTayTAWKi/RCKZUMRE9y8yBiiFmYLm555depMGZFaNn
	 VAVW2xdn3Jeu+jTCx1gNiz4pbnDpM5C3EqoC0Ho17xa9j0h6VUvdsneE9KoY4V77hY
	 DxCiY4G9p7F47667DYK2UZ/RZOxM0N0RJrY2/1B8yFUJYEAvhJ1GeH+i8WOMqBpuTF
	 6Vo5XS8UFyQsiqu0dcbSAVjAhH48JFepJqu25FW1vVZ7x1iP6acj+JPJhntSJ1sSNK
	 ejQHQ3H9bwQeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/19] crypto: cmh - add ML-KEM/ML-DSA (QSE)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806195519.2703224-16-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-16-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:24:31 +0000
Message-Id: <20260806202431.781AE1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The driver unconditionally unmaps and frees DMA bounce buffers=
 when hardware transactions time out, risking severe memory corruption if t=
he hardware is wedged.
- [High] The ML-DSA sign and verify operations explicitly reject zero-lengt=
h messages, violating FIPS 204 and breaking software fallback compatibility.
--

--- Patch [15]: [PATCH v3 15/19] crypto: cmh - add ML-KEM/ML-DSA (QSE) ---
commit 7381e2595560d52e928536b3ed32c1907a27b36c
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ML-KEM/ML-DSA (QSE)

Register ML-KEM (Kyber) and ML-DSA (Dilithium) algorithms using
the CMH QSE core (core ID 0x09). ML-KEM is ioctl-only (keygen,
encaps, decaps). ML-DSA is registered as a sig algorithm with
priority 5001 to override the kernel's verify-only mldsa
implementation at priority 5000.

> diff --git a/drivers/crypto/cmh/cmh_pqc_mldsa.c b/drivers/crypto/cmh/cmh_=
pqc_mldsa.c
> new file mode 100644
> index 0000000000000..8f9bdf67aea24
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pqc_mldsa.c

[ ... ]

> +static int cmh_mldsa_sign(struct crypto_sig *tfm,
> +			  const void *src, unsigned int slen,
> +			  void *dst, unsigned int dlen)
> +{

[ ... ]

> +	if (dlen < sig_size)
> +		return -EINVAL;
> +	if (!slen || slen > ML_DSA_MAX_MLEN)
> +		return -EINVAL;

[Severity: High]
Does this break compatibility by rejecting zero-length messages? FIPS 204
allows for empty messages, and rejecting them here could prevent the signin=
g of
valid empty messages. Since the hardware driver overrides the software
fallback, this would break the capability kernel-wide.

[ ... ]

> +	ret =3D cmh_tm_submit_sync_mbx(vcq, QSE_VCQ_CMDS_MIN, 1,
> +				     dd.mbx_idx);
> +	if (!ret) {
> +		/* Sync bounce buffer so CPU sees the DMA-written signature */
> +		cmh_dma_sync_for_cpu(sig_dma, sig_size, DMA_FROM_DEVICE);
> +		memcpy(dst, sig_buf, sig_size);
> +		ret =3D sig_size;
> +	}
> +
> +out_unmap:
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, sig_size, DMA_FROM_DEVICE);
> +	if (!cmh_dma_map_error(m_dma))
> +		cmh_dma_unmap_single(m_dma, slen, DMA_TO_DEVICE);
> +
> +out_free:
> +	kfree(sig_buf);
> +	kfree(m_buf);
> +	return ret;
> +}

[Severity: Critical]
If cmh_tm_submit_sync_mbx() times out and returns an error, does this code
unconditionally unmap and free the DMA bounce buffers?

If the hardware is wedged and a timeout occurs, freeing the memory here cou=
ld
leave the hardware DMA engine with a dangling physical address that it might
still write to later, leading to memory corruption.

[ ... ]

> +static int cmh_mldsa_verify(struct crypto_sig *tfm,
> +			    const void *src, unsigned int slen,
> +			    const void *digest, unsigned int dlen)
> +{

[ ... ]

> +	if (slen !=3D sig_size)
> +		return -EINVAL;
> +	if (!dlen || dlen > ML_DSA_MAX_MLEN)
> +		return -EINVAL;

[Severity: High]
Similar to cmh_mldsa_sign(), does this incorrectly reject valid zero-length
verification requests?

[ ... ]

> +	ret =3D cmh_tm_submit_sync_mbx(vcq, QSE_VCQ_CMDS_MIN, 1, d.mbx_idx);
> +
> +out_unmap:
> +	if (!cmh_dma_map_error(pk_dma))
> +		cmh_dma_unmap_single(pk_dma, pk_size, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(m_dma))
> +		cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, sig_size, DMA_TO_DEVICE);
> +
> +out_free:
> +	kfree(pk_buf);
> +	kfree(m_buf);
> +	kfree(sig_buf);
> +	return ret;
> +}

[Severity: Critical]
Could a timeout from cmh_tm_submit_sync_mbx() cause these buffers to be fre=
ed
while the hardware might still perform a DMA read from them later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D15
