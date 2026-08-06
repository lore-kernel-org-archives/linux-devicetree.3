Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63816422531
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049017; cv=none; b=pbVHTuFF3lzlft8BLfSqKpyfek0yIY2bCTIEybP6lBjnj9Rf3I148vGS0boFBdYW5d6pbvNfPK1j5n0Uy6q+bYn5+S+3dXziyjHHMflhM/7iHjAQkw25Y5BGxsW3ctyy+lRRm5rBCcwkpEi4/CBeihVl4q5rw7p5pPkjg5+9wF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049017; c=relaxed/simple;
	bh=cE/SDRghKkuZLxh9kvjW9ssubCGSAstTp7HT5ORm4m8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mu2Oqxn2NJrugCuCCemPjpcB2SsLSUmzT6Bi1ote/HzA1RXOi6SmI24QoWh4bJp+lRzx5Nt76WfbPcLBgMD3iep8L25Hiz/pTQyfcRMrAlyWomvZn7mC6ZdMXdKWPo9bDBNMc8jLbJbPDNPH8KUoZmxWjP+pR6gqAX4oetNIAUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVvkAFzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVvkAFzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2321F000E9;
	Thu,  6 Aug 2026 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786049016;
	bh=+iwlgP4vEg7r+r0hYeIa/qex/SMW0JU6xMkLZUgB5ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVvkAFzUry26gBq2kGXb+czv5PI6eyA7xjWvKtLD7mFLCxM7/Ht0IqOIw+nc9CtLg
	 wBKABgtn8i8EFVpt8GzDiczCGgUjssjaXGjoKawaYQk7a+5OmtJcFi2gLQb3KfltUa
	 Morupb7aG5PlxrDWc3oCNw95B1C16Uz7SEOKLKyf0wFkKbwlMV1/4Ktl2PYCLvyHU1
	 IuDH5U9AWVwsSuVs1ON6mQbxx3eB6/1PYPQOVE4m91+TLA3vt8r3vR6UeN+zFo0vYb
	 ljFwELjJOJiM2nBE6RJSPGCNSeyoE8+nPYLEcJ+UBPjcWAYnGSBBbYWEIzHUkOkqWk
	 RV1Nt1GELuBYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/19] crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806195519.2703224-17-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-17-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:43:35 +0000
Message-Id: <20260806204335.AE2321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] DMA write-after-free vulnerability on hardware timeout.
- [Medium] Improper rejection of valid 0-length messages for cryptographic =
operations.
--

--- Patch [16]: [PATCH v3 16/19] crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ) -=
--
commit 36b1570b3180e707d91edf00a1da1258b01e7320
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ)

This commit registers the SLH-DSA, LMS, and XMSS signature algorithms using
the CMH HCQ core. SLH-DSA supports sign and verify operations, while LMS
and XMSS are verify-only.

> diff --git a/drivers/crypto/cmh/cmh_pqc_lms.c b/drivers/crypto/cmh/cmh_pq=
c_lms.c
> new file mode 100644
> index 0000000000000..3a17ca4786603
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pqc_lms.c
> @@ -0,0 +1,238 @@
> [ ... ]
> +static int cmh_lms_verify(struct crypto_sig *tfm,
> +			  const void *src, unsigned int slen,
> +			  const void *digest, unsigned int dlen)
> +{
> [ ... ]
> +	if (!dlen || dlen > LMS_MAX_MSG_LEN)
> +		return -EINVAL;

[Severity: Medium]
Does this code improperly reject valid 0-length messages? Cryptographic
algorithms natively support empty message inputs, but this check causes them
to fail with -EINVAL.

> +
> +	sig_buf =3D kmemdup(src, slen, GFP_KERNEL);
> [ ... ]
> +	/* LMS verify traverses Merkle hash chains -- inherently slow */
> +	ret =3D cmh_tm_submit_sync_tmo(vcq, LMS_VCQ_CMDS, 1, d.mbx_idx,
> +				     cmh_tm_slow_op_timeout_jiffies());
> +
> +out_unmap:
> +	if (!cmh_dma_map_error(pk_dma))
> +		cmh_dma_unmap_single(pk_dma, ctx->pub_key_len, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(m_dma))
> +		cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, slen, DMA_TO_DEVICE);
> +
> +out_free:
> +	kfree(pk_buf);
> +	kfree(m_buf);
> +	kfree(sig_buf);
> +	return ret;
> +}

[Severity: High]
Can this lead to a DMA write-after-free if the hardware times out? If
cmh_tm_submit_sync_tmo() times out and returns -ETIMEDOUT, the caller-owned
heap buffers are unconditionally unmapped and freed. If the hardware later
recovers and completes the transaction, won't it perform an asynchronous DMA
write into memory that has already been returned to the slab allocator?

> diff --git a/drivers/crypto/cmh/cmh_pqc_slhdsa.c b/drivers/crypto/cmh/cmh=
_pqc_slhdsa.c
> new file mode 100644
> index 0000000000000..4bec4278cd9c6
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pqc_slhdsa.c
> @@ -0,0 +1,377 @@
> [ ... ]
> +static int cmh_slhdsa_sign(struct crypto_sig *tfm,
> +			   const void *src, unsigned int slen,
> +			   void *dst, unsigned int dlen)
> +{
> [ ... ]
> +	if (!slen || slen > SLHDSA_MAX_MSG_LEN)
> +		return -EINVAL;

[Severity: Medium]
Could this explicit rejection of slen =3D=3D 0 break API conformance? It lo=
oks
like it prevents valid empty-message signing requests from being processed.

> +
> +	m_buf =3D kmemdup(src, slen, GFP_KERNEL);
> [ ... ]
> +	ret =3D cmh_tm_submit_sync_tmo(vcq, vcq_count, 1, d.mbx_idx,
> +				     cmh_tm_slow_op_timeout_jiffies());
> +
> +	if (!ret) {
> +		/* Sync bounce buffer so CPU sees the DMA-written signature */
> +		cmh_dma_sync_for_cpu(sig_dma, sig_sz, DMA_FROM_DEVICE);
> +		memcpy(dst, sig_buf, sig_sz);
> +		ret =3D sig_sz;
> +	}
> +
> +out_unmap:
> +	if (sk_buf) {
> +		if (!cmh_dma_map_error(sk_dma))
> +			cmh_dma_unmap_single(sk_dma, sk_sz, DMA_TO_DEVICE);
> +		kfree_sensitive(sk_buf);
> +	}
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, sig_sz, DMA_FROM_DEVICE);
> +	if (!cmh_dma_map_error(m_dma))
> +		cmh_dma_unmap_single(m_dma, slen, DMA_TO_DEVICE);
> +
> +out_free:
> +	kfree(sig_buf);
> +	kfree(m_buf);
> +	return ret;
> +}

[Severity: High]
Is it possible for a delayed hardware write to corrupt the heap here? In the
event of a timeout from cmh_tm_submit_sync_tmo(), these DMA buffers are
freed. If the hardware is merely delayed and eventually finishes, it might
write the signature into the now-freed sig_buf.

> [ ... ]
> +static int cmh_slhdsa_verify(struct crypto_sig *tfm,
> +			     const void *src, unsigned int slen,
> +			     const void *digest, unsigned int dlen)
> +{
> [ ... ]
> +	if (!dlen || dlen > SLHDSA_MAX_MSG_LEN)
> +		return -EINVAL;

[Severity: Medium]
Does this code block valid 0-length messages from being verified?

> +
> +	sig_buf =3D kmemdup(src, slen, GFP_KERNEL);
> [ ... ]
> +	/* SLH-DSA verify recomputes hyper-tree hashes -- inherently slow */
> +	ret =3D cmh_tm_submit_sync_tmo(vcq, HCQ_VCQ_CMDS_MIN, 1, d.mbx_idx,
> +				     cmh_tm_slow_op_timeout_jiffies());
> +
> +out_unmap:
> +	if (!cmh_dma_map_error(pk_dma))
> +		cmh_dma_unmap_single(pk_dma, pk_sz, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(m_dma))
> +		cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, sig_sz, DMA_TO_DEVICE);
> +
> +out_free:
> +	kfree(pk_buf);
> +	kfree(m_buf);
> +	kfree(sig_buf);
> +	return ret;
> +}

[Severity: High]
Can a hardware timeout cause a use-after-free? Freeing m_buf, pk_buf, and
sig_buf immediately after a timeout might allow a delayed hardware DMA
completion to access freed memory.

> diff --git a/drivers/crypto/cmh/cmh_pqc_xmss.c b/drivers/crypto/cmh/cmh_p=
qc_xmss.c
> new file mode 100644
> index 0000000000000..50de1ef0f488c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pqc_xmss.c
> @@ -0,0 +1,238 @@
> [ ... ]
> +static int cmh_xmss_verify(struct crypto_sig *tfm,
> +			   const void *src, unsigned int slen,
> +			   const void *digest, unsigned int dlen)
> +{
> [ ... ]
> +	if (!dlen || dlen > XMSS_MAX_MSG_LEN)
> +		return -EINVAL;

[Severity: Medium]
Will this return -EINVAL for perfectly valid 0-length messages?

> +
> +	sig_buf =3D kmemdup(src, slen, GFP_KERNEL);
> [ ... ]
> +	/* XMSS verify traverses Merkle hash chains -- inherently slow */
> +	ret =3D cmh_tm_submit_sync_tmo(vcq, XMSS_VCQ_CMDS, 1, d.mbx_idx,
> +				     cmh_tm_slow_op_timeout_jiffies());
> +
> +out_unmap:
> +	if (!cmh_dma_map_error(pk_dma))
> +		cmh_dma_unmap_single(pk_dma, ctx->pub_key_len, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(m_dma))
> +		cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
> +	if (!cmh_dma_map_error(sig_dma))
> +		cmh_dma_unmap_single(sig_dma, slen, DMA_TO_DEVICE);
> +
> +out_free:
> +	kfree(pk_buf);
> +	kfree(m_buf);
> +	kfree(sig_buf);
> +	return ret;
> +}

[Severity: High]
Does this error path introduce a use-after-free risk? If the hardware stalls
and cmh_tm_submit_sync_tmo() returns -ETIMEDOUT, these buffers are freed. A
subsequent hardware recovery would access memory that is no longer allocate=
d.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D16
