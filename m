Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21253ACEE2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631296; cv=none; b=E+eWgji2HvjNC1j+LIHe78rSiMgtE6hRL6ex0/4S77n0nBfEplLSuPW3j7vZe/vsr7/duVV3RZJflpQodgt9B4rqXOfvQm7oxLT1QFrZ4rkfDU618aQ5FKbIu3SA+LG8aTp52ZhjOFobSEzZaDfcRufRtRFSb3/JbEHcn0wlDaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631296; c=relaxed/simple;
	bh=jR1ZXcWvVQO1h5K+N18ttK6I5jWaGPviF8w3nyhbmb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fLjtcieAUCV91R+3Uopuo7jcGwb2XIQ4VYgufX+1gwU2d4DfBYfHWYLtEzlxYFy9ZdhUkS5U5qbKCLU0O+za7CrGSZcs8lzDwq6DaWj1rR9NCeX/3TqBLFvxF+22ORmx3lbBJHqm5FRHfQJE8QfxDWBNravGUXncWJtsPx/XtP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHx6eH0M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHx6eH0M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D01A1F00A3D;
	Thu,  9 Jul 2026 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783631294;
	bh=gRKCzj9N29WjG3hhKh264AbThATSjJn1gQ9fpl71y2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fHx6eH0MfhWRDQ+Xz9aEgDYt0+JKxKZqNmPVyF8GzueE0OCb8bLZMs7ltW6WUtDaA
	 xaRu5nbokbELpgSKUBR3xYiLxng47Ad4lnkCUir6h7MxkYxk5YP5oLLLdXNxTBOrMM
	 9UJUYocefH4z1nTkjMW/TRIRmZhtLwa36J2Ncns7JtclIxIf6NJ7+k71cCAFh/m+qq
	 xI1ZgIEWaDkZSIS5j6uFtgpKduc5gmJ4UfQigzvN6snKjiteRh8s0pgISvdNdEbc99
	 72doTJAq1xDd+jW1KdsXwHs0V20/4G17w+ELLASgRx8eUEFU6ZxMZb41YM5WyLS8nS
	 JUo1phSYsKQtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/19] crypto: cmh - add ECDH/X25519 kpp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709203037.1884436-15-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-15-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 21:08:11 +0000
Message-Id: <20260709210814.3D01A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardcoded PKE_SWAP_FLAGS breaks X25519 (Curve25519) coordinate end=
ianness.
- [High] The Phase 1 completion handler unconditionally allows backlogging =
for Phase 2, ignoring the caller's CRYPTO_TFM_REQ_MAY_BACKLOG flag.
- [High] Hardware Datastore (DS) object leak when Phase 2 submission fails.
- [Medium] Unnecessary kmemdup and double DMA-mapping of the private key vi=
olates DMA API rules.
- [Medium] Failure to update req->dst_len on insufficient output buffer.
--

--- Patch [14]: [PATCH v2 14/19] crypto: cmh - add ECDH/X25519 kpp ---
commit c7f55fee9fddee53ac321aab50b8d12f127bfd39
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Date:   Thu Jul 9 20:30:32 2026 +0000

    crypto: cmh - add ECDH/X25519 kpp
   =20
    Register ECDH and X25519 kpp algorithms using the CMH PKE core.
    Supports P-256, P-384, and Curve25519 for key agreement.

> diff --git a/drivers/crypto/cmh/cmh_pke_ecdh.c b/drivers/crypto/cmh/cmh_p=
ke_ecdh.c
> new file mode 100644
> index 0000000000000..d8b821cc4217c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_ecdh.c

[ ... ]

> +static int cmh_ecdh_generate_public_key(struct kpp_request *req)
> +{
> +	struct crypto_kpp *tfm =3D crypto_kpp_reqtfm(req);
> +	struct cmh_ecdh_tfm_ctx *ctx =3D cmh_ecdh_ctx(tfm);
> +	struct cmh_ecdh_reqctx *rctx =3D kpp_request_ctx(req);
> +	u32 clen =3D ctx->clen;
> +	bool is_25519 =3D (ctx->curve =3D=3D PKE_CURVE_25519);
> +	u32 out_len =3D is_25519 ? clen : 2 * clen;
> +	struct vcq_cmd vcq[PKE_VCQ_CMDS_MAX];
> +	struct core_dispatch dd;
> +	u32 swap, dma_swap;
> +	int ret, idx;
> +	gfp_t gfp;
> +
> +	if (ctx->key.mode !=3D CMH_KEY_RAW)
> +		return -EINVAL;
[Severity: Medium]
Will this return -EINVAL without setting req->dst_len to out_len first?
The KPP API typically expects the driver to update req->dst_len with the
required size before returning an error so the caller can allocate a large
enough buffer.

> +	if (req->dst_len < out_len)
> +		return -EINVAL;
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;

[ ... ]

> +	swap =3D PKE_SWAP_FLAGS;
> +	dma_swap =3D pke_swap_flags(ctx->curve);
> +
> +	dd =3D cmh_core_select_instance(CMH_CORE_PKE);
> +
[Severity: Medium]
Does this code unnecessarily copy and double-map the private key?
The ctx->key.raw.data buffer is already DMA-mapped as DMA_TO_DEVICE in
cmh_key_setkey_raw(). Reading this buffer via kmemdup() without a prior
dma_sync_single_for_cpu() violates DMA API rules, and the duplication
adds overhead. Could ctx->key.raw.dma be passed directly to the hardware?

> +	rctx->sk_buf =3D kmemdup(ctx->key.raw.data, ctx->key.raw.len, gfp);
> +	if (!rctx->sk_buf) {
> +		ret =3D -ENOMEM;
> +		goto out_unmap;
> +	}
> +	rctx->sk_dma =3D cmh_dma_map_single(rctx->sk_buf, ctx->key.raw.len,
> +					  DMA_TO_DEVICE);
> +	if (cmh_dma_map_error(rctx->sk_dma)) {
> +		ret =3D -ENOMEM;
> +		goto out_unmap;
> +	}
> +
> +	vcq_set_header(&vcq[0], PKE_VCQ_CMDS_MAX);
> +	idx =3D 1;
> +	vcq_add_sys_write(&vcq[idx], SYS_REF_TEMP, rctx->sk_dma,
> +			  SYS_REF_NONE, ctx->key.raw.len,
> +			  ctx->key.raw.sys_type);
> +	vcq[idx].id |=3D dma_swap;
> +	idx++;
[Severity: High]
Does hardcoding swap to PKE_SWAP_FLAGS break coordinate endianness for Curv=
e25519?
Since pke_swap_flags(ctx->curve) returns 0 for X25519 but swap unconditiona=
lly
applies PKE_SWAP_FLAGS, won't this force incorrect hardware byteswapping on
inputs and outputs for Curve25519? Should this be using dma_swap instead?

> +	if (is_25519)
> +		vcq_add_pke_ecdh_keygen(&vcq[idx++], dd.core_id, ctx->curve,
> +					clen, rctx->pk_dma, SYS_REF_TEMP,
> +					swap);
> +	else

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
[Severity: High]
Does passing true unconditionally for backlog_ok ignore the caller's reques=
ted flags?
If the caller did not set CRYPTO_TFM_REQ_MAY_BACKLOG in req->base.flags,
a backlogged Phase 2 could trigger an unexpected -EINPROGRESS completion ca=
llback.
Could this lead to the caller prematurely freeing the request structure, re=
sulting
in a use-after-free when the final completion executes?

> +	ret =3D cmh_tm_submit_async(vcq, 3, 1, rctx->mbx_idx,
> +				  cmh_ecdh_ss_phase2_complete, req,
> +				  true, 0);
[Severity: High]
If cmh_tm_submit_async() fails here, do we leak the hardware Datastore (DS)=
 object?
Phase 1 created a DS object in hardware memory. If we hit an error here and=
 jump
to out_cleanup, it looks like we exit without sending a SYS_CMD_FLUSH comma=
nd
to the hardware, which would strand the object in the mailbox memory perman=
ently.

> +	if (ret =3D=3D -EBUSY || !ret)
> +		return;
> +
> +	error =3D ret;
> +
> +out_cleanup:
> +	if (!cmh_dma_map_error(rctx->ref_dma))

[ ... ]

> +static int cmh_ecdh_compute_shared_secret(struct kpp_request *req)
> +{
> +	struct crypto_kpp *tfm =3D crypto_kpp_reqtfm(req);
> +	struct cmh_ecdh_tfm_ctx *ctx =3D cmh_ecdh_ctx(tfm);
> +	struct cmh_ecdh_reqctx *rctx =3D kpp_request_ctx(req);
> +	u32 clen =3D ctx->clen;
> +	bool is_25519 =3D (ctx->curve =3D=3D PKE_CURVE_25519);
> +	u32 peer_len =3D is_25519 ? clen : 2 * clen;
> +	u32 ss_type =3D SYS_TYPE_SET(SYS_TYPE_FLAG_PT, CORE_ID_PKE);
> +	struct vcq_cmd vcq[5];
> +	struct core_dispatch dd;
> +	u32 swap, dma_swap;
> +	int ret, idx, nents;
> +	gfp_t gfp;
> +
> +	if (ctx->key.mode !=3D CMH_KEY_RAW)
> +		return -EINVAL;
[Severity: Medium]
Will this return -EINVAL without setting req->dst_len to clen first?
Similar to cmh_ecdh_generate_public_key(), the caller needs to know the req=
uired
size if the destination buffer is too small.

> +	if (req->src_len < peer_len || req->dst_len < clen)
> +		return -EINVAL;
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;

[ ... ]

> +	if (cmh_dma_map_error(rctx->peer_dma) ||
> +	    cmh_dma_map_error(rctx->ss_dma) ||
> +	    cmh_dma_map_error(rctx->ref_dma)) {
> +		ret =3D -ENOMEM;
> +		goto out_unmap;
> +	}
> +
> +	swap =3D PKE_SWAP_FLAGS;
> +	dma_swap =3D pke_swap_flags(ctx->curve);
> +	rctx->dma_swap =3D dma_swap;
> +
> +	dd =3D cmh_core_select_instance(CMH_CORE_PKE);
> +	rctx->mbx_idx =3D dd.mbx_idx;
> +
[Severity: Medium]
Does this code unnecessarily copy and double-map the private key?
The ctx->key.raw.data buffer is already DMA-mapped as DMA_TO_DEVICE in
cmh_key_setkey_raw(). Reading this buffer via kmemdup() without a prior
dma_sync_single_for_cpu() violates DMA API rules, and the duplication
adds overhead. Could ctx->key.raw.dma be passed directly to the hardware?

> +	rctx->sk_buf =3D kmemdup(ctx->key.raw.data, ctx->key.raw.len, gfp);
> +	if (!rctx->sk_buf) {
> +		ret =3D -ENOMEM;
> +		goto out_unmap;
> +	}
> +	rctx->sk_dma =3D cmh_dma_map_single(rctx->sk_buf, ctx->key.raw.len,
> +					  DMA_TO_DEVICE);
> +	if (cmh_dma_map_error(rctx->sk_dma)) {
> +		ret =3D -ENOMEM;
> +		goto out_unmap;
> +	}
> +
> +	vcq_set_header(&vcq[0], 5);
> +	idx =3D 1;
> +	vcq_add_sys_write(&vcq[idx], SYS_REF_TEMP, rctx->sk_dma,
> +			  SYS_REF_NONE, ctx->key.raw.len,
> +			  ctx->key.raw.sys_type);
> +	vcq[idx].id |=3D dma_swap;
> +	idx++;
> +	vcq_add_sys_new(&vcq[idx++], 0, rctx->ref_dma, clen);
[Severity: High]
Does hardcoding swap to PKE_SWAP_FLAGS break coordinate endianness for Curv=
e25519?
Since pke_swap_flags(ctx->curve) returns 0 for X25519 but swap unconditiona=
lly
applies PKE_SWAP_FLAGS, won't this force incorrect hardware byteswapping on
inputs and outputs for Curve25519? Should this be using dma_swap instead?

> +	vcq_add_pke_ecdh(&vcq[idx++], dd.core_id, ctx->curve, clen,
> +			 clen, ss_type, rctx->peer_dma,
> +			 SYS_REF_TEMP, SYS_REF_LAST, swap);
> +	vcq_add_pke_flush(&vcq[idx++], dd.core_id);
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D14
