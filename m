Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C9025A2BB
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511847; cv=none; b=PFAq3CSahdhMSqJu0OUSMV3SjwZjR2oIujdgpkB8f/n1a6XSFYMDc6cWuwH38ndXutGNX73NVmf38JdEcymRYT8EFgLtNo/OagHmhp1/VYxKlImONEJhxGDspPVEXnfkF8H/pSN9Qb50wePq8SdFeUxyRzY1KQeFksMhzTIG4zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511847; c=relaxed/simple;
	bh=vR5N4uvZw9T7fpKDO/SchH/u6QuiaPZ+qBcJcQufiM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s1G9+mVsRKkOkClB2sKy3pWV4kqZsYbFzmxATLl/KVS8q/lEmOakeuibpmTEcnA8Z3F6SvsYFcjefcrsByQSWRztXI2GpbjM5dcQ6O4hTnoJCXEiJpHm5sskEF9c3vCyQTIrv6iHGbcrTn8Jhb/qzEbPeDneJxFr4Y7aqucwjIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiCeTUP3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiCeTUP3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A651F000E9;
	Mon, 20 Jul 2026 01:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784511846;
	bh=SmPMvHitKTIaaJRqfmhuP7D2PPukdC10g+7lVzPbs1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YiCeTUP3+x1t/Sz2yp2WecKmRt8RjU3TXHv6TKI6TezIOrk9rTu9uSThNCcB1LVmS
	 y76ssnfzj/Hgl8GEMfCT5L5EGGIt+7oYiImYfM1JX+hdEFLbNtpL4T9TD6VTJCeBqN
	 0wSNeB12VV8FIUBZzQd7zYaw67a+5K+JS2WI2gaww90sS89t5p1olISyCDhzDMwkSU
	 kba3A2Zg+IXpq6++8QbPutSV7YyhQMCuFEcvwzYfMclTpI6McXJLvIDgCKBGZ0kpTZ
	 lZpAypi5hTLPibOUsEZZ9cNQrRvBjq98k7zvx6Ap8wylS4/baEoyxpmzSsFgnhv0ZS
	 AezjwA2duU+ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/14] media: mediatek: vcodec: get different
 firmware ipi id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720012056.1026551-5-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:44:05 +0000
Message-Id: <20260720014405.D1A651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing check on `mtk_vcodec_fw_get_ipi()` return value leads to o=
ut-of-bounds memory write during VPU IPI registration
--

--- Patch [4]: [PATCH v6 04/14] media: mediatek: vcodec: get different firm=
ware ipi id ---
commit 74021a635ff4b0a5bb38e1b68df4fa4d276cadb5
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: get different firmware ipi id

This commit introduces a helper function to get the IPI ID based on
firmware type and hardware index for different architectures. It replaces
hardcoded SCP IPI IDs with this helper in various decoder interfaces.

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

[ ... ]

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 10359ce9b934e..69d60717181a6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
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
Does this code need to check the return value of mtk_vcodec_fw_get_ipi()
before assigning it to inst->vpu.id?

If the firmware type is not SCP or VCP, mtk_vcodec_fw_get_ipi() returns
-EINVAL. This assigns -22 to inst->vpu.id, which then gets passed down
through vpu_dec_init() into vpu_ipi_register():

drivers/media/platform/mediatek/vpu/mtk_vpu.c:vpu_ipi_register() {
    ...
    if (id < IPI_MAX && handler) {
        ipi_desc =3D vpu->ipi_desc;
        ipi_desc[id].name =3D name;
        ipi_desc[id].handler =3D handler;
        ipi_desc[id].priv =3D priv;
        return 0;
    }
    ...
}

Since the bounds check uses a signed comparison, -22 < 7 evaluates to true,
which could lead to an out-of-bounds write to ipi_desc[-22] and corrupt
memory. This same pattern also appears in the slice initialization routines
for AV1, HEVC, VP8, and VP9.

Could this negative ID assignment be prevented by validating the return
value of mtk_vcodec_fw_get_ipi()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D4
