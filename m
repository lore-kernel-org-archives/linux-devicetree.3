Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB82222D0
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511646; cv=none; b=TSzdsnEVBUMhcHgldYv9YDIDcpX+FUiIXVZtYoJmQOHoCrarpvRjnh4CeiqGKl38wecf9gugexIz3yCUYZVDEhlq1hoFz7Qtr15wxBpQdYdkfqROHfis/yBweYT/t+9cgN6z8jyw7MGYn6nePl8VxTPkUIE8RxfDSnAJXs35GQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511646; c=relaxed/simple;
	bh=5md2aMczaSi4Utu+e2lFUEeHB1CYRYen3pW1qV34kZ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dCoIq6taA1v7NZuu2keOXgUrxdQ9ixg0WinW2F6ig8XbDgvXDZ5NbUDUrxqBesh+ZLRkeA79yx6afcJI7/xrSRq+wL0ZwHVN3+snJ9bwJ+paG38cDRAWQ6TieTipaI0cwWhcu5r/FgwVs8Y6W296bceabGpuH79O/HxZhYurLok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQ3GCGUR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQ3GCGUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1BA1F000E9;
	Mon, 20 Jul 2026 01:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784511644;
	bh=6VqJK/7H1xjunt504SQW/PfXRJFLHLN8kprro/tAgD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nQ3GCGURJKRpy8wnMckb6GRvltHILaHEb2QjW42bLcNe4Yd/r7DASkXjBOX156oS2
	 cIBT6kBSWSDmLkLC9Ck9ZchZgw8VbiFigKbTtThqg5peB1Kg6FcpL1S8K93Iw2f8Rk
	 2vi4nDXm1l5i1Hqbn/tEf/BC5U8ZLVrNXHjHKgxMzP0oa2jHsFiCtwQ3J49lIdKb5q
	 BEiaFxxK7KpsOk/0kmK8wbZCElRImDTUkjnxjqdKPusQ8ilYArWDwdiPloiCPybN0P
	 AI3bNjCQeaZoDHbmLdPy0HTONo71YbwQw/5YRXZcJniG6cNJkz9rcqt9tpVW99La36
	 lZPeFAETKoSWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/14] media: mediatek: vcodec: get share memory
 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720012056.1026551-6-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:40:43 +0000
Message-Id: <20260720014044.0B1BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] mtk_vcodec_fw_map_dm_addr() has inconsistent error semantics acros=
s firmware types, leading to NULL or ERR_PTR dereferences.
- [High] mtk_vcodec_vcp_dm_addr() calculates shared memory offsets blindly =
without verifying they fit within the allocated firmware memory (vsi_size).

Pre-existing issues:
- [High] Firmware-provided sizes vsi->cdf_table_size and vsi->iq_table_size=
 are used for memory allocation and memcpy without validation.
--

--- Patch [5]: [PATCH v6 05/14] media: mediatek: vcodec: get share memory a=
ddress ---
commit 4c9f9286cbe2e7417003bc83c03e8482665fcca4
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: get share memory address

This commit adds support to get shared memory addresses for the VCP
architecture by dividing a single shared memory block into different
functions.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
[ ... ]
> @@ -483,8 +483,31 @@ static unsigned int mtk_vcodec_vcp_get_vdec_capa(str=
uct mtk_vcodec_fw *fw)
>  	       MTK_VDEC_IS_SUPPORT_10BIT | MTK_VDEC_IS_SUPPORT_EXT;
>  }
> =20
> -static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_d=
mem_addr)
> +static unsigned int mtk_vcodec_vcp_get_venc_capa(struct mtk_vcodec_fw *f=
w)
>  {
> +	return 0;
> +}
> +
> +static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_ty=
pe)
> +{
> +	unsigned char *vsi_core =3D fw->vcp->vsi_core_addr;
> +
> +	switch (mem_type) {
> +	case ENCODER_MEM:
> +	case VCODEC_LAT_MEM:
> +		return fw->vcp->vsi_addr;
> +	case VCODEC_CORE_MEM:
> +		return vsi_core;
> +	case VP9_FRAME_MEM:
> +		return vsi_core + VCODEC_VSI_LEN;
> +	case AV1_CDF_MEM:
> +		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE;
> +	case AV1_IQ_MEM:
> +		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE + AV1_CDF_SIZE;

[Severity: High]
Are these offsets guaranteed to fit within the memory provided by the
hardware?

When fw->vcp->vsi_size is initialized via get_mem_size() in
mtk_vcodec_vcp_load_firmware(), the driver doesn't seem to validate that
the allocated block is large enough to contain these offsets. If a
malformed device tree or mismatched firmware provides a smaller memory
block, could this lead to out-of-bounds accesses into adjacent memory?

> +	default:
> +		break;
> +	}
> +
> +	return NULL;
> +}

[Severity: High]
Is returning NULL here safe when other firmware types return an ERR_PTR?

In drivers like vpu and scp, mapping functions return ERR_PTR(-EINVAL)
on failure. Because this VCP function returns NULL instead, callers have
mixed expectations.

For example, in vdec_av1_slice_init_cdf_table(), the code checks:

        remote_cdf_table =3D mtk_vcodec_fw_map_dm_addr(...);
        if (IS_ERR(remote_cdf_table)) {
                ...
        }

If VCP mapping fails and returns NULL, it passes the IS_ERR() check and
can cause a NULL pointer dereference during the subsequent memcpy().

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
[ ... ]
> @@ -775,7 +784,7 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_=
av1_slice_instance *instanc
>  	ctx =3D instance->ctx;
>  	vsi =3D instance->vpu.vsi;
>  	remote_cdf_table =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						     (u32)vsi->cdf_table_addr);
> +						     vdec_av1_get_cdf_table_addr(ctx, vsi));
>  	if (IS_ERR(remote_cdf_table)) {
>  		mtk_vdec_err(ctx, "failed to map cdf table\n");
>  		return PTR_ERR(remote_cdf_table);

[Severity: High]
This is a pre-existing issue, but does vsi->cdf_table_size need to be
validated against the maximum allowed size before it is used?

Shortly after this mapping, the code does:

        memcpy(instance->cdf_table.va, remote_cdf_table, vsi->cdf_table_siz=
e);

Since vsi->cdf_table_size is provided by the firmware via shared memory, a
compromised or malformed firmware could provide a size larger than the
AV1_CDF_SIZE (0xFE80) memory region. Could this result in an out-of-bounds
read of adjacent kernel memory?

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
[ ... ]
> @@ -514,7 +523,7 @@ static int vdec_vp9_slice_init_default_frame_ctx(stru=
ct vdec_vp9_slice_instance
>  		return -EINVAL;
> =20
>  	remote_frame_ctx =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						     (u32)vsi->default_frame_ctx);
> +						     vdec_vp9_get_frame_ctx_addr(ctx, vsi));
>  	if (!remote_frame_ctx) {
>  		mtk_vdec_err(ctx, "failed to map default frame ctx\n");
>  		return -EINVAL;

[Severity: High]
Does this !remote_frame_ctx check properly handle the ERR_PTR(-EINVAL) that
can be returned by mtk_vcodec_fw_map_dm_addr() when using VPU or SCP?

Since the VPU and SCP mapping paths return an ERR_PTR on failure, this check
will bypass them, resulting in kmemdup() attempting to dereference the
error pointer:

vdec_vp9_slice_init_default_frame_ctx() {
    ...
    if (!remote_frame_ctx) {
        return -EINVAL;
    }
    ...
    frame_ctx =3D kmemdup(remote_frame_ctx, sizeof(*frame_ctx), GFP_KERNEL);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D5
