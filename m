Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E142B320
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557147; cv=none; b=eSddSVNGIoP6xxr5eHR7h72Z3uq107Zfj+nL3KfMijA0cy6nITYXrrs7XeK18T3MhYUe/wCUtUQBIHdbN4Hi/Rj4Iezrk2uV0tr9OUEBj8oYw5oIP9cjHFS1HSu9t9H7w5ypEy0zvr1MyrSFw6qoidOmX6G5b3v4V8lyuPhhsk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557147; c=relaxed/simple;
	bh=WQQhyOlE+bgaJ9h8b7MScwUbBrabCQCdHyWrzDkOJS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UF/+mBPmVaSB7/IXZ6YqMYZv86b8j7flF59wfybybWL4KgXye6qHebSi76YcbCA4DHIXnPgJeTGV8g+5kY+uDfxZw3Oqm+Zt123NGAHgAkRtSUIHuD7CeOtEpDu7C5dwWn/9yFGuRcJIlAGeYlPsRKaPRTRSH9Ay1+C9dILN9S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yi3cP81s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yi3cP81s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC1B1F000E9;
	Mon, 20 Jul 2026 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784557145;
	bh=ZdVHTpk/xD5rtX3sWSrApluJuVk31kdfhSQivNLQBLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yi3cP81siTlclfbbs99R4Sn9lAZktT5YSlSnEvhxNQ7dALGXuKmh935N5XdaEqImN
	 9k61WXINmGRum1b98vj1tRQI4kwR22WS11nq2IUQMnHgAY2829hvLh/fcIB9bgN30V
	 XaNK68bCkG3WTDSzddvmRkKzfFxWXICeDYttxdy8yExASoKigjfhHTQ+vmlEosiv8T
	 qNJXFFm7F0Z0ytJf9oSvVLHjFPQ+5A/G7I//8ZreWK0UGMpKDydjwdSo8sSBsqvRwZ
	 OleGlkUUlu4F9vsLAGh2WZ8ld5/VTojjAm+sZq2a4iviVPfA5QJ8NM3psVFaSK78nx
	 E0cxDAGHmJMgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720133432.1042046-13-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:19:05 +0000
Message-Id: <20260720141905.8DC1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Probe failure in SMMU initialization leaves dangling pointers =
in the global master device arrays and permanently increments hw_index, cau=
sing UAF and array OOB on deferred probes.

Pre-existing issues:
- [High] Blind dereference of HW arrays when child probes fail early.
--

--- Patch [12]: [PATCH v16 12/12] media: mediatek: jpeg: add jpeg smmu sid =
setting ---
commit 73b8529184733966196568926fff60cf629320ae
Author: Kyrie Wu <kyrie.wu@mediatek.com>

    media: mediatek: jpeg: add jpeg smmu sid setting
   =20
    Add a configuration to set jpeg dec & enc smmu sid

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8e96501a4f9fa..bb9bdd9913d94 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
[ ... ]
> @@ -1663,6 +1680,11 @@ static void mtk_jpegenc_worker(struct work_struct =
*work)
>  	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
>  	ctx->total_frame_num++;
>  	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
> +
> +	if (jpeg->variant->support_smmu && comp_jpeg[hw_id]->smmu_regmap)
> +		mtk_jpeg_set_smmu_sid(comp_jpeg[hw_id]->smmu_regmap,
> +				      JPG_REG_GUSER_ID_ENC_SID);
> +

[Severity: High]
This isn't a bug introduced by this patch, but I have a question about how
unpopulated hardware array entries are handled when a child probe fails.

In mtk_jpegenc_worker(), it calls mtk_jpegenc_get_hw() to select the hw_id.
If an earlier probe failure left the array entry in enc_hw_dev as NULL, cou=
ld
this result in a NULL pointer dereference?

mtk_jpegenc_get_hw() iterates based on max_hw_count (which is set from the
Device Tree child nodes) and accesses the state directly:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpegenc_get_hw() {
    ...
    for (i =3D 0; i < jpeg->max_hw_count; i++) {
        comp_jpeg =3D jpeg->enc_hw_dev[i];
        if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
    ...
}

Could this blindly dereference comp_jpeg if the child probe never completed
and left it NULL? The exact same pattern seems to exist in mtk_jpegdec_get_=
hw().

>  	mtk_jpeg_set_enc_dst(ctx,
>  			     comp_jpeg[hw_id]->reg_base,
>  			     &dst_buf->vb2_buf);
[ ... ]
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 07452249bcb67..3058fdf4f6054 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
[ ... ]
> @@ -665,6 +684,10 @@ static int mtk_jpegdec_hw_probe(struct platform_devi=
ce *pdev)
>  	master_dev->reg_decbase[i] =3D dev->reg_base;
>  	dev->master_dev =3D master_dev;
> =20
> +	ret =3D mtk_jpegdec_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +

[Severity: Critical]
If mtk_jpegdec_smmu_init() fails and returns an error like -EPROBE_DEFER,
will this leave a dangling pointer in the master_dev->dec_hw_dev array?

Looking earlier in mtk_jpegdec_hw_probe(), dev is allocated with devm_kzall=
oc
and added to the master_dev array, and hw_index is incremented:

    i =3D atomic_add_return(1, &master_dev->hw_index) - 1;
    master_dev->dec_hw_dev[i] =3D dev;
    master_dev->reg_decbase[i] =3D dev->reg_base;
    dev->master_dev =3D master_dev;

    ret =3D mtk_jpegdec_smmu_init(dev);
    if (ret)
        return ret;

When returning ret, the devm-managed dev will be freed, but the pointer
remains in master_dev->dec_hw_dev[i] and hw_index is never decremented.
Could this lead to an out-of-bounds write on deferred probe retries and a
use-after-free when the worker thread accesses the array?

This same issue seems to be present in mtk_jpegenc_hw_probe() in
mtk_jpeg_enc_hw.c as well.

>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D12
