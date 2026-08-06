Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F947F76A
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048464; cv=none; b=qYNt8Uv/xZDw6VPjJximaF5G789iJzWitJQ9UzvmdK9dYuPdA6WKk74rVL3lmdwxe+NsfoT0rLgOgrOtwzrSwWEImS+79r/4NlTZgsLo5UeBrjvtJkk4AtyBANTeLtr4WMfb9WD9RGL1cw2rB27iZMF/HnzmASAZ3A7CHmJtF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048464; c=relaxed/simple;
	bh=RK+7tqDUYLU9BN6ZJs7B/Gapb6UEHr2NvTAwq7oJaFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bDQQQZ0nWqdr+Cry+hiJr5dnpFnlOgj6RMMHjuWMve+k+QwIrD1ZPP/Pb+o9132YSZ/EFXUlcxUvdzmvoVPt7emGblziTx9BpE6r1sZnPw0Jq7kJtX2ZxJNnK54Bmsd75xmW63c5Zota76mtoFWpx1xhnIU5OTMXNlREfb+o4bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIoQPvPx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIoQPvPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1461F000E9;
	Thu,  6 Aug 2026 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786048462;
	bh=/9JEUZQrf5UlgF5BSrH/5RxTKb0acZ6J6clIxG4JtCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LIoQPvPx3IvrAAfoGRfDhrRuo1+8Obp8/a50xWgFzTAL0mV2GZi3fs4UVnMuN2dE3
	 rf5kwk+bDDN0B1kf42sR1TkGbt3DRc/+OfdwbOzrLAqLCRbXg9o/XtzKFH9a2mfblp
	 ta/AASz1+4wxz8Jk7F4yiSYXqAwdK390oVo+/qYmtbQ7qUVBHjVmx18ZXXTFauf83A
	 DMbBJ7IU5uURuew3MciOUa7cExlSc3htOYfXEVaYpUHOnOVdV/pvXNWwGzXBKMVmNJ
	 g4ugVkfhGQobsKyqDgGl7nog9oqoO6bgn08Ore+pv4n3jKdc59eBU6YkGXHtrZqRLw
	 MNgh1x0QnVCqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/19] crypto: cmh - add ECDH/X25519 kpp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806195519.2703224-15-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-15-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:34:21 +0000
Message-Id: <20260806203422.3D1461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware datastore slots allocated for the ECDH shared secret are =
permanently leaked on success and error paths.
- [Medium] Phase 2 of shared secret computation violates the async crypto A=
PI contract by unconditionally enabling backlog and bubbling spurious `-EIN=
PROGRESS` notifications.
- [Medium] The driver bypasses FIPS 186-5 validation for caller-provided pr=
ivate scalars on NIST curves, allowing degenerate or out-of-bounds keys.
--

--- Patch [14]: [PATCH v3 14/19] crypto: cmh - add ECDH/X25519 kpp ---
commit 9f2cb0033e85cf322ca1c6ba96a2932f498d8824
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ECDH/X25519 kpp

Register ECDH and X25519 kpp algorithms using the CMH PKE core.
Supports P-256, P-384, and Curve25519 for key agreement.

> diff --git a/drivers/crypto/cmh/cmh_pke_ecdh.c b/drivers/crypto/cmh/cmh_p=
ke_ecdh.c
> new file mode 100644
> index 0000000000000..1b49dd060e52c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_ecdh.c

[ ... ]

> +static int cmh_ecdh_set_secret_nist(struct crypto_kpp *tfm,
> +				    const void *buf, unsigned int len)
> +{

[ ... ]

> +	if (key_size =3D=3D 0) {
> +		/*
> +		 * key_size =3D=3D 0: generate a validated random private key.
> +		 * Uses the kernel ECC library (FIPS 186-5 A.2.2) to ensure
> +		 * the scalar is in the valid range [2, n-3] for the curve.
> +		 */

[ ... ]

> +		ret =3D cmh_key_setkey_raw(&ctx->key, rnd, ctx->clen,
> +					 CORE_ID_PKE);
> +		kfree_sensitive(rnd);
> +		return ret;
> +	}
> +
> +	if (key_size !=3D ctx->clen)
> +		return -EINVAL;
> +
> +	if (secret.len !=3D ECDH_KPP_SECRET_MIN_SIZE + key_size)
> +		return -EINVAL;
> +
> +	return cmh_key_setkey_raw(&ctx->key, ptr, key_size, CORE_ID_PKE);

[Severity: Medium]
Are we missing a validity check for caller-provided private scalars?

When key_size !=3D 0, we write the raw private key directly into the key
context without calling ecc_is_key_valid() to verify it falls within the
valid range [1, n-1] for the NIST curve.

> +}

[ ... ]

> +static void cmh_ecdh_ss_phase1_complete(void *data, int error)
> +{

[ ... ]

> +	/* Read the DS reference written by Phase 1 */
> +	cmh_dma_sync_for_cpu(rctx->ref_dma, sizeof(u64), DMA_FROM_DEVICE);
> +	cmh_dma_unmap_single(rctx->ref_dma, sizeof(u64), DMA_FROM_DEVICE);
> +	rctx->ref_dma =3D DMA_MAPPING_ERROR;
> +
> +	/* Phase 2: extract shared secret from DS */
> +	vcq_set_header(&vcq[0], 3);
> +	vcq_add_sys_data(&vcq[1], *rctx->ref_buf, rctx->ss_dma,
> +			 rctx->clen);
> +	vcq[1].id |=3D rctx->dma_swap;
> +	vcq_add_sys_flush(&vcq[2]);
> +
> +	ret =3D cmh_tm_submit_async(vcq, 3, 1, rctx->mbx_idx,
> +				  cmh_ecdh_ss_phase2_complete, req,
> +				  true, 0);

[Severity: Medium]
Can this violate the async crypto API contract by bubbling spurious
-EINPROGRESS notifications?

Phase 2 submission hardcodes the backlog_ok parameter to true, which ignores
the user's req->base.flags & CRYPTO_TFM_REQ_MAY_BACKLOG setting.

If the queue is full and Phase 2 is backlogged, cmh_ecdh_ss_phase2_complete=
()
will pass -EINPROGRESS to cmh_complete(), even if the caller did not allow
backlogging.

> +	if (ret =3D=3D -EBUSY || !ret)
> +		return;
> +
> +	error =3D ret;
> +
> +out_cleanup:
> +	if (!cmh_dma_map_error(rctx->ref_dma))
> +		cmh_dma_unmap_single(rctx->ref_dma, sizeof(u64),
> +				     DMA_FROM_DEVICE);
> +	if (!cmh_dma_map_error(rctx->ss_dma))
> +		cmh_dma_unmap_single(rctx->ss_dma, rctx->clen,
> +				     DMA_FROM_DEVICE);
> +	kfree(rctx->ref_buf);
> +	rctx->ref_buf =3D NULL;
> +	kfree_sensitive(rctx->ss_buf);
> +	rctx->ss_buf =3D NULL;
> +	cmh_complete(&req->base, error);
> +}

[ ... ]

> +static int cmh_ecdh_compute_shared_secret(struct kpp_request *req)
> +{

[ ... ]

> +	dd =3D cmh_core_select_instance(CMH_CORE_PKE);
> +	rctx->mbx_idx =3D dd.mbx_idx;
> +
> +	vcq_set_header(&vcq[0], 5);
> +	idx =3D 1;
> +	vcq_add_sys_write(&vcq[idx], SYS_REF_TEMP, ctx->key.raw.dma,
> +			  SYS_REF_NONE, ctx->key.raw.len,
> +			  ctx->key.raw.sys_type);
> +	vcq[idx].id |=3D dma_swap;
> +	idx++;
> +	vcq_add_sys_new(&vcq[idx++], 0, rctx->ref_dma, clen);

[Severity: High]
Does this leak the hardware datastore slot?

We allocate a DS slot using SYS_CMD_NEW, but neither the success path in
cmh_ecdh_ss_phase2_complete() nor the error path in
cmh_ecdh_ss_phase1_complete() appear to issue a SYS_CMD_GRANT with 0
permissions to delete the object.

Could this eventually exhaust the hardware datastore memory on repeated
operations?

> +	vcq_add_pke_ecdh(&vcq[idx++], dd.core_id, ctx->curve, clen,
> +			 clen, ss_type, rctx->peer_dma,
> +			 SYS_REF_TEMP, SYS_REF_LAST, swap);
> +	vcq_add_pke_flush(&vcq[idx++], dd.core_id);
> +
> +	ret =3D cmh_tm_submit_async(vcq, 5, 1, dd.mbx_idx,
> +				  cmh_ecdh_ss_phase1_complete, req,
> +				  !!(req->base.flags &
> +				     CRYPTO_TFM_REQ_MAY_BACKLOG), 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D14
