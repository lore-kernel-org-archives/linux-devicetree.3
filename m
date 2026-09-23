Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263C8C8D9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132614; cv=none; b=Ts79qUBqGDmg6zXSfBgsb6mRMrjKSXggSWBP9dK6IGvXaBcTVg3WGy2PhgS7QYhTLjukeRW0WtdgxCv5DDdua0GFdcsVMbME34Z0h5y0aGOpOdSuENEEMhCILgOYLKHpnN3lvCo7bQOKCJ/Ud0I3dh/3p3Qo62AKxdi4Sf9UQ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132614; c=relaxed/simple;
	bh=Rj67jTuk8v+4vG2KIt3PwrSOoCD0Epf4INCEAE2S7H4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ARW/Az7dvaYGAjDNOJTM4GAkbqRZsM5B6LwyD3I9388oJe8IyIkaoG9212h961SjRdP+kH2B19ZTCaKg2ibgMLGOU9e9Z9EKWQ8apP3Xvt8s18eNOplY3TdD2/j1g6dk6NlFyiRtnleetN8AVUzDvAnA8b32DvY0MTbTcwQPimE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luC8mdX1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luC8mdX1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77A51F000FF;
	Wed, 23 Sep 2026 03:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790132612;
	bh=unaaS2lJad6QYymp9tIqkKwxE5fOU4zajeWNU2lu+Co=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=luC8mdX14ehhaV+4O9O4q8KUdOT73bq/j5luM4bwhQ5+0VFqAwiXcvNl6JaR5KG/n
	 0THqRNaqRVYix8n8S86cqT9+RP7UXdZsBWSe2GfNNmpPiBGQw01uH/EWwjGwreMa81
	 k0yH0Wu+ZGbRBvIJQh1A8UE2WJYqqOZdDyrVvkKb1ODYdwPfVMD3QVam6abvY2nmM5
	 n5ifsEy093PDSBP6NJ81lyYb2RzJ1GX953Q6NmPHkmlJzFiRWDz1vdJGVcJT1yNvZb
	 T1+vNgaA1dawp0TXMQmEKFJ8LlzMUSP2xjAOUzwkzqhLR2YoztcbBjdEa7CajUFg30
	 H86Mkcvgg5/qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/14] media: mediatek: vcodec: get different
 firmware ipi id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260923024258.257846-5-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
 <20260923024258.257846-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 03:03:32 +0000
Message-Id: <20260923030332.A77A51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: mtk-vcodec: out-of-bounds array write via unchecked firmwar=
e ipi id
--

commit 576e89832edf2cee2354139a5fddaa192a84287b
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: get different firmware ipi id
   =20
This commit introduces mtk_vcodec_fw_get_ipi() to fetch inter-processor
interrupt IDs based on firmware type and hardware index. It also updates
various slice initialization functions to use this new helper.

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

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 2d622e85f8271..756fbb7778b1f 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1877,6 +1877,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
>  {
>  	struct vdec_av1_slice_instance *instance;
>  	struct vdec_av1_slice_init_vsi *vsi;
> +	enum mtk_vcodec_fw_type fw_type =3D ctx->dev->fw_handler->type;
>  	int ret;
> =20
>  	instance =3D kzalloc_obj(*instance);
> @@ -1884,8 +1885,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
>  		return -ENOMEM;
> =20
>  	instance->ctx =3D ctx;
> -	instance->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	instance->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	instance->vpu.id =3D mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
> +	instance->vpu.core_id =3D mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);

[Severity: High]
If fw_type is unsupported like VPU, mtk_vcodec_fw_get_ipi() will return
-EINVAL. Does assigning this negative error code directly to vpu.id without
validation cause an out-of-bounds write later?

When vpu_dec_init() calls mtk_vcodec_fw_ipi_register(), it routes to
vpu_ipi_register(). The bounds check in vpu_ipi_register() only verifies
that the ID is less than IPI_MAX, but lacks a lower bound check:

drivers/media/platform/mediatek/vpu/mtk_vpu.c:vpu_ipi_register() {
	...
	if (id < IPI_MAX && handler) {
		ipi_desc =3D vpu->ipi_desc;
		ipi_desc[id].name =3D name;
	...
}

Could this allow the negative ID to bypass the bounds check and perform
an out-of-bounds write to the ipi_desc array? This same pattern appears
in the other slice initialization functions updated in this patch.

>  	instance->vpu.ctx =3D ctx;
>  	instance->vpu.codec_type =3D ctx->current_codec;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923024258.2578=
46-1-kyrie.wu@mediatek.com?part=3D4
