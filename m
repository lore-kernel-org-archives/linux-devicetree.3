Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5D279DC3
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132325; cv=none; b=f7/AoEtDSEs/8pY9vCykrP1zdGyE2yPb3tozXh2dzf0GzMVeoh/RugjWTg21iDZaTOH3P//3TedHgoX1kB1kyb5AV/mfPtGlNaqGwhCxmnVKOCHgyp2fZBB58zkDtDeeWFrdnUyAij6La6EhWuDHltEonC+4xdx4EcChivsBkvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132325; c=relaxed/simple;
	bh=2z9JrHW1YjwEZ2N6KcUBOHYVnv7wlX958CI4eMV4FA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sBzCT7nO7itd9StO8CVpH8yg5cvh8JIYi0T6DQ51ZVA9jonLv7XV0XMR/JkeFkfcYyjiNibl+l4JTvLLBJ4ikqcbG8RLKV+ZxLR3XhBuGBqWByw7dQ5jxoASAvRPHZ6dlkxHHJvTNUw2jm2hKYVYNriXtwBFkZ528+S+dhYLjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CK+D7YdH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK+D7YdH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0398C1F00893;
	Wed, 23 Sep 2026 02:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790132323;
	bh=E+6gvrL3DuiNBr8FuzSh3RUfY+7b6V12hNG+58IPNbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CK+D7YdHax3KZZmjVX1Z8PXudlmNzJ6x7TWKPEKUGK0dAMN6xQrEeoAsQVAYG706M
	 PnJhmmMT6YGaPMFmyawOI7K3npJ4V5KdUl8SPfSveIpWwI+qO//LytdBUGJ10lfUh+
	 6wenJ5eDJosy4IJPcQpJy9hqOeLmtTIwUOOJqCKQ5jvLOHrXFeig3qC9kCvBZiwZ5q
	 +E3OqEnyl254BkV/xGa2QjOYVmCVeRMi51Mm3F/ySSxXHFLfhZ04ycieSfI6X0N10N
	 OmPa+18kv4fJ0sZiZ3vvJwp01blclChczBChimQzJTDk1GORA0ZoZGsYYaRZX7zdqP
	 K/IksLf7lKuHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/14] media: mediatek: vcodec: get share memory
 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923024258.257846-6-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
 <20260923024258.257846-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 02:58:42 +0000
Message-Id: <20260923025843.0398C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] vdec: mtk_vcodec_vcp_dm_addr returns NULL violating API contract
- [High] vdec: missing map_dm_addr error validation in H264 and HEVC VCP in=
it
- [High] vdec: concurrent VCP streams corrupt shared VSI memory
- [High] vdec: invalid pointer arithmetic on NULL vsi_core bypasses error c=
hecks
- [Medium] vdec: missing bounds validation on VCP shared memory offsets
--

commit d06f41499afd921668f031d62bb44ee4859ac008
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: get share memory address

This commit introduces shared memory division for the VCP architecture in t=
he
MediaTek vcodec driver. It adds functions to compute different memory
addresses based on memory type for components like AV1, H264, HEVC, and VP9.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index ece4e3e87e62d..468c4bf4e48ba 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -483,8 +483,31 @@ static unsigned int mtk_vcodec_vcp_get_vdec_capa(str=
uct mtk_vcodec_fw *fw)

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

[Severity: High]
Since vpu_dec_get_vsi_addr() requests VCODEC_LAT_MEM for all VCP decoding
instances, will returning the singular global fw->vcp->vsi_addr here cause
concurrent decoding contexts to overwrite each other's memory?

> +	case VCODEC_CORE_MEM:
> +		return vsi_core;
> +	case VP9_FRAME_MEM:
> +		return vsi_core + VCODEC_VSI_LEN;

[Severity: High]
Does this code perform invalid pointer arithmetic if vsi_core is NULL?

If the firmware failed to allocate and vsi_core_addr is NULL, adding
VCODEC_VSI_LEN results in a non-NULL invalid pointer (e.g., 0x2000) being
returned to callers.

> +	case AV1_CDF_MEM:
> +		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE;
> +	case AV1_IQ_MEM:
> +		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE + AV1_CDF_SIZE;

[Severity: Medium]
Is there a missing bounds validation on these shared memory offsets?

These offsets stack additively, requiring a minimum backing DMA buffer size.
If the hardware or firmware provisions a smaller memory block than expected,
this could silently return out-of-bounds DMA pointers, resulting in invalid
memory accesses when the codec later reads or writes these structures.

> +	default:
> +		break;
> +	}
> +
> +	return NULL;
> +}

[Severity: High]
Does returning NULL here violate the API contract expected by callers?

Other implementations return ERR_PTR(-EINVAL) on failure. Returning NULL
causes issues for callers like vdec_av1_slice_init_cdf_table() that expect =
to
validate the result using IS_ERR().

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 756fbb7778b1f..4932ef4695946 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
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
>  	}

[Severity: High]
Will this IS_ERR() check fail to catch the NULL return from
mtk_vcodec_vcp_dm_addr()?

Since mtk_vcodec_vcp_dm_addr() returns NULL instead of an error pointer for
unhandled memory types, this IS_ERR() check evaluates to false. This allows
the code to proceed and attempt a memcpy() from a NULL remote_cdf_table.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 69d60717181a6..544d3bc065645 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -1233,7 +1233,11 @@ static int vdec_h264_slice_init(struct mtk_vcodec_=
dec_ctx *ctx)
>  		vsi_size =3D round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
>  		inst->vsi_ext =3D inst->vpu.vsi;
>  		temp =3D (unsigned char *)inst->vsi_ext;
> -		inst->vsi_core_ext =3D (struct vdec_h264_slice_vsi_ext *)(temp + vsi_s=
ize);
> +		if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +			inst->vsi_core_ext =3D
> +				mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);

[Severity: High]
Are we missing an error check for the result of mtk_vcodec_fw_map_dm_addr()?

The mapped address is directly assigned to inst->vsi_core_ext without check=
ing
for NULL or ERR_PTR. If the mapping fails, the invalid pointer will be stor=
ed
and later dereferenced unconditionally during core decode operations.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hev=
c_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_hevc_req_multi_if.c
> index dd638ef440836..a5dd42987452f 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> @@ -879,8 +879,11 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
> =20
>  	vsi_size =3D round_up(sizeof(struct vdec_hevc_slice_vsi), VCODEC_DEC_AL=
IGNED_64);
>  	inst->vsi =3D inst->vpu.vsi;
> -	inst->vsi_core =3D
> -		(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
> +	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
> +		inst->vsi_core =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCO=
DEC_CORE_MEM);

[Severity: High]
Does this code also need to validate the return value of
mtk_vcodec_fw_map_dm_addr() before assignment?

Similar to the H264 case, storing a potentially failed mapping without chec=
king
for NULL or ERR_PTR could result in a kernel crash during decode operations.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index b492686784ec3..ee4d1cd82426f 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
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
>  	}

[Severity: High]
Will this check fail to protect against an invalid pointer from
mtk_vcodec_vcp_dm_addr()?

If mtk_vcodec_vcp_dm_addr() returns an offset added to a NULL base (e.g.,
0x2000), this !remote_frame_ctx check will evaluate to false. This allows
execution to proceed and crash when kmemdup() later attempts to dereference
the invalid pointer.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index b35759a0b3533..cdb673e6b4770 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -9,6 +9,14 @@
>  #include "vdec_ipi_msg.h"
>  #include "vdec_vpu_if.h"
> =20
> +static u32 vpu_dec_get_vsi_addr(struct vdec_vpu_inst *vpu, const struct =
vdec_vpu_ipi_init_ack *msg)
> +{
> +	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) =3D=3D VCP)
> +		return VCODEC_LAT_MEM;
> +	else
> +		return msg->vpu_inst_addr;
> +}

[Severity: High]
Can returning a single hardcoded enum for all VCP instances lead to memory
corruption?

By requesting VCODEC_LAT_MEM for all VCP decoding instances, multiple
concurrent V4L2 mem2mem decoding contexts will be mapped to the exact same
global VSI memory buffer. This means concurrent streams could silently
overwrite each other's shared state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923024258.2578=
46-1-kyrie.wu@mediatek.com?part=3D5
