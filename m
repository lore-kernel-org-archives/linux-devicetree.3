Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8E33F5A7
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622609; cv=none; b=UUgE+rzZwB+AFhEMiE67cJgaBGPxBM7aoh8kBOb+WHJ2dE5Y2AoWM/dpTJzeveyiTUdbsx2tuWesv6bpkGA9RI5RraZHusQRutXAHGZnjQ1IWuKmsSpfSMy+eh3QsAZSM8tzpGa7gjURU0z4gsfIejVDFajXCFEtV6ArvBRD17w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622609; c=relaxed/simple;
	bh=iy1wVZsL5c8bNSadOzzPJ93X2FaRoMSv5SYhNcO93rw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=E0xsJ7IRiKEr10RR0J47npWRQczdIhYhMxsvIDvly8KZFMSb4CG7uOev4vJ18dKQ1nbuCcMjmIrNqZAFQvQjJX+lVwjccJ5UC5hVCwFnwr06BbOpp+xy0WZzTjLOeSaKCcKgnHWcuQrlN4cB4XVXl1xD1oUm7ia9ulPJCTXQd+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/PvYb9e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/PvYb9e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EFE1F00893;
	Sat, 10 Oct 2026 08:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622607;
	bh=FiMBCkZan/zRcUNpJW1tImnF3WQNOPXvXa2TxpTBZuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X/PvYb9eSl7Lc6WrFh96+NxVj3IY43TKdB3XtwrNotH53M4eNhFos/nCM9xxiuRxY
	 LogJI+aLrwvOtNEgG3TtNz0P0KIxBtlwO/wa5FkR63y0FBQWI4Q/c2cKh9DtxzFKGq
	 lg3zCsqerXZ3ktGKODkJr7HV2uOX+VkFanDnTp5VIfy6Os7rjHGbV96Ps0YKtYtrAu
	 lBlqJDwnOCpxaCGOmTLSJ7e+q/yNGdLxyaa7gvYZgag0gOHIPdaGqdTtctxLlHDNgc
	 ez22b6ujSQeZ+ODUFAUKYDQRlbVnoFh01/0Yull6L7DdnWpeS+cYuEwfYnkwA+G64l
	 2OCFWsupfHzzw==
Message-ID: <sashiko-outbox-166381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/14] media: mediatek: vcodec: get share memory
 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <f935f06d722c5936862cb8c576b354432b45b45d.1791619743.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <f935f06d722c5936862cb8c576b354432b45b45d.1791619743.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:56:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: vcodec: missing IS_ERR check on fw_map_dm_addr return in VP=
9/AV1
- [High] media: mediatek: OOB read via unvalidated firmware sizes and VCP o=
ffsets
--

commit e6e728fceb78092db0d746297086675978804b45
Author: Kyrie Wu <kyrie.wu@mediatek.com>

    media: mediatek: vcodec: get share memory address
   =20
    This commit divides the single shared memory for the VCP architecture
    into multiple functional areas. It introduces helpers to retrieve
    specific memory addresses and offsets for different codec components.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index ece4e3e87e62d..468c4bf4e48ba 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
[ ... ]
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
Does this code compute memory pointers based on hardcoded offsets without
first verifying that the configured VCP memory size (fw->vcp->vsi_size) is
actually large enough to contain them?

If the device tree memory region is insufficiently sized, could this expose
the kernel to out-of-bounds reads?

> +	default:
> +		break;
> +	}
> +
>  	return NULL;
>  }
[ ... ]
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 756fbb7778b1f..4932ef4695946 100644
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

[Severity: High]
Is memory being copied based on an untrusted size parameter
(vsi->cdf_table_size) provided by firmware?

Looking at vdec_av1_slice_init_cdf_table(), if a compromised firmware
supplies an excessively large size, couldn't this cause the kernel to read
out of bounds from remote_cdf_table into the dynamically sized DMA buffer?
This seems unmitigated for non-EXT capability devices.

>  	if (IS_ERR(remote_cdf_table)) {
>  		mtk_vdec_err(ctx, "failed to map cdf table\n");
>  		return PTR_ERR(remote_cdf_table);
[ ... ]
> @@ -1904,8 +1931,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
>  		goto error_vsi;
>  	}
>  	instance->init_vsi =3D vsi;
> -	instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, =
(u32)vsi->core_vsi);
> -
> +	instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +						       vdec_av1_get_core_vsi_addr(ctx, vsi));
>  	if (!instance->core_vsi) {

[Severity: High]
Could an error pointer bypass this check when mtk_vcodec_fw_map_dm_addr()
fails?

Since mtk_vcodec_fw_map_dm_addr() returns ERR_PTR(-EINVAL) on VPU and SCP
failures, it seems an error pointer would slip past this NULL check and
lead to invalid memory accesses in subsequent memcpy operations.

>  		mtk_vdec_err(ctx, "failed to get AV1 core vsi\n");
>  		ret =3D -EINVAL;
[ ... ]
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index b492686784ec3..ee4d1cd82426f 100644
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

[Severity: High]
Is it possible for mtk_vcodec_fw_map_dm_addr() to return an ERR_PTR here?

If mapping fails, does this check miss the error pointer, allowing an
invalid memory location to be passed to kmemdup() below?

>  		mtk_vdec_err(ctx, "failed to map default frame ctx\n");
>  		return -EINVAL;
[ ... ]
> @@ -1864,7 +1882,7 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
>  	}
>  	instance->init_vsi =3D vsi;
>  	instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						       (u32)vsi->core_vsi);
> +						       vdec_vp9_get_core_vsi_addr(ctx, vsi));
>  	if (!instance->core_vsi) {

[Severity: High]
What happens if mtk_vcodec_fw_map_dm_addr() returns an error pointer?

If it only checks for NULL, it appears the error pointer could be stored
in instance->core_vsi and erroneously used as a valid memory location later.

>  		mtk_vdec_err(ctx, "failed to get VP9 core vsi\n");
>  		ret =3D -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D5
