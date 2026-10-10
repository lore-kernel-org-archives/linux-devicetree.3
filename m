Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B53451CE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622603; cv=none; b=ZV9BrbJUIo4qL5MScE5h4C758LuyWRvq261Ervn1jERBFBDXbA+uunIHNRiA/EQz6JADfWeFDjpFWHjNb2iTFbns8x2F+mt8uTP/WZ3lJOUfQf8FoFTwftk7kpEcN1eusX9av7wP+tZPgn5g/qS1W7uClMEjNs28D/hN81E0D4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622603; c=relaxed/simple;
	bh=2QC91/Bt77Od6+1QV7yChBdf29cg7Wah0ctepZ8llPo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EKSv+45yWraAoOo+75ZW5flshSjEO+8mb9CR1tl1jR/OsonzqL9Q3VOZTvODLtkkTk0k3DTePS7P9FzBsHPiwg4jmAWzUMeUhR3MpRo2pOgC7bZG8NlVTsAUgrQ/oQ04XDF1Kl6YGO96FCrC4LRR743kpImncopJ4GQjAnDr9a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jycAd3kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jycAd3kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532911F00893;
	Sat, 10 Oct 2026 08:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622601;
	bh=U3EfYK+0MDbCCywO5Z0h/r7fY6amf28PEtwJJtWtFMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jycAd3kIVEuKbrdXp8ZKazojHXescSKoIojbFz4XN6jJtLKIWaN6iYy/TnSDGA7L3
	 oaFkTuvo6hHdDN0Zy0FtFyKE9YDwSQc8xw8C/NwSwrRjYf5Z8KtbxqUSbLcBCLaNm7
	 KUO6dgt/RjMBd164DYRX9J+O1ELpuaVJ6a5eHPiXdavME2OCsRKao3L4FRjvTs0NPe
	 qAtIylKqL6e4O0OC0z/Bu1y374qVRx732DCKJZe0gfEBkwRkYQVI8IxLKpvhx87yfG
	 BYls1lfHj4AMSv+pPZ0rfZB2K7OPKRQqgskSGqENeyN78D01CO8m0CR1piDEfKP8Lf
	 AG/dKaJPLgOwQ==
Message-ID: <sashiko-outbox-166380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/14] media: mediatek: vcodec: get different
 firmware ipi id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <61d082035d1bd9f3394834963ca59defaf663370.1791619743.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <61d082035d1bd9f3394834963ca59defaf663370.1791619743.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:56:40 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: mtk-vcodec: OOB write via unvalidated -EINVAL from fw_get_i=
pi
--

commit b7bb8fd08e359be31186a13bf22647a6a15432b2
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: get different firmware ipi id

This commit updates the driver to get the inter-processor interrupt (IPI) ID
dynamically based on the firmware type and hardware index. This allows
supporting different architectures instead of using hardcoded IDs.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> index 552d0d8a84444..8630e871d78e2 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> @@ -3,6 +3,20 @@
>  #include "../decoder/mtk_vcodec_dec_drv.h"
>  #include "../encoder/mtk_vcodec_enc_drv.h"
>  #include "mtk_vcodec_fw_priv.h"
> +#include "mtk_vcodec_fw_vcp.h"
> +
> +int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id)
> +{
> +	switch (type) {
> +	case SCP:
> +		return hw_id =3D=3D MTK_VDEC_LAT0 ? SCP_IPI_VDEC_LAT : SCP_IPI_VDEC_CO=
RE;
> +	case VCP:
> +		return hw_id =3D=3D MTK_VDEC_LAT0 ? VCP_IPI_LAT_DECODER : VCP_IPI_CORE=
_DECODER;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_ipi);

[ ... ]

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 10359ce9b934e..69d60717181a6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -1204,6 +1204,7 @@ static int vdec_h264_slice_single_decode(void *h_vd=
ec, struct mtk_vcodec_mem *bs
> =20
>  static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>  {
> +	enum mtk_vcodec_fw_type fw_type =3D ctx->dev->fw_handler->type;
>  	struct vdec_h264_slice_inst *inst;
>  	int err, vsi_size;
>  	unsigned char *temp;
> @@ -1214,8 +1215,8 @@ static int vdec_h264_slice_init(struct mtk_vcodec_d=
ec_ctx *ctx)
> =20
>  	inst->ctx =3D ctx;
> =20
> -	inst->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	inst->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	inst->vpu.id =3D mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
> +	inst->vpu.core_id =3D mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);

[Severity: High]
Does this code handle cases where mtk_vcodec_fw_get_ipi() returns an error
code?

If an unsupported firmware type (such as VPU) is provided,
mtk_vcodec_fw_get_ipi() will return -EINVAL (-22), which is then assigned
directly to inst->vpu.id and inst->vpu.core_id without validation.

When this propagates to vpu_ipi_register() via vpu_dec_init():

drivers/media/platform/mediatek/vpu/mtk_vpu.c:vpu_ipi_register() {
    ...
    if (id < IPI_VPU_MAX && handler) {
        ipi_desc =3D vpu->ipi_desc;
        ipi_desc[id].name =3D name;
    ...
}

On ARM64 (AArch64), the AAPCS64 dictates that the underlying type for an en=
um
whose values all fit in a signed 32-bit integer is a signed int, making
enum ipi_id signed.

The bounds check evaluates -22 < IPI_VPU_MAX as true. This bypasses the che=
ck
and executes a negative index out-of-bounds write to the ipi_desc array.

Could this lead to memory corruption (slab underflow) before the mtk_vpu
struct if a malformed Device Tree pairs a stateless decoder compatible stri=
ng
with a VPU firmware handler?

>  	inst->vpu.ctx =3D ctx;
>  	inst->vpu.codec_type =3D ctx->current_codec;
>  	inst->vpu.capture_type =3D ctx->capture_fourcc;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D4
