Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887596;
	b=1L1ljqxdOeOjivasdDsX13L7rAAXauz0bGoq1nPibYhPd0Uf9hZlhnsEtXfbk3qFT6x+
	 veu/P7ndejTMVHutAgWPUFVhsg5BuICrgAN/l+MD+jx6l7I4fWh1V+bBwJALvrv2gVXst
	 G9ZBhEkrusI+CyKw3bqsayCyNMikHeQ9v20KKVX9KEQPM2o3DuiHkoZrv+S9xHrweXETM
	 7PHdXu1dVGm7Us/97JM1BVnRc6MTJsjlZ0KvJqNu5r+huq9QsSdt7JnxgPCWtZRf6g1RO
	 gZJOlR7vThHYzImjWoFObcC0p9sTdZxpDbdnAhRDDnHFrQZUGEUVe6520m7zEGcyZUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887596;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tLUEeWBNH1suUP6OTW5uxLnjtx/9ByNMKhVBJm7UctU=;
	b=rZ+E6JF/7/v4uyfvtHXR+sep3X0fn1bMbmeb37KHCbhuRjKfOo2HvvoZ6uKouljLcDjO
	 C0YqJ+NebaQn/6Qq5JJSuFyBLI1VReHe3xS8d5QHujqhTVqqSKP6PHzdG/SUncBQMOchW
	 3nyTFhm0bVqp4tD81gsOfWvJhn6lORPiX/xKWduMWbQom45O/POPGo47DYTKT6pljF4rb
	 MkNqEDPdCuhPE1bCZGlEnFZyf0IcSAXl/l4kdyuqzb3lQHF3YeqPUOW343pQdUs28GRXB
	 MAh72IiHtf3f3zdACf1swnekq8C8o1jm3x1bsKvwama5lhm1orj81U0crKmF1WdSZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6+nWK8x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E884606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6+nWK8x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853491F000C4;
	Tue, 17 Nov 2026 03:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794887595;
	bh=tLUEeWBNH1suUP6OTW5uxLnjtx/9ByNMKhVBJm7UctU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6+nWK8xEEIvEYeKyjh+DdN9oMZEDlWP6Jt4NgPUJ/4NPK5AyjT+jkufU/JmM/es2
	 DyYRLvMlSuY4HQc5jTmzsCVarWhEjSXyF+H+pWcWq5VFaLt4sdWYYMI9kK+RDCatYE
	 iEh5kO+8o7+dmrikSwpeNtd0H4f27FOaNbTGMbjavo7PbtQAOpf7mqQ5hqeKNX2BX6
	 pnLtP+SAbCQJJy/276uyFHg0PuiUpQddOjctE2WYlYyepHeKhkk3acxl9S5Qx7JGUx
	 ccRCtMwcw5SjJNem30P3HotK1Qrp21Ygq6trdFG3Py6tJZmB+3RaBupq9rZLywzqpf
	 LLf1wN6LmRcvQ==
Message-ID: <sashiko-outbox-218167@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/14] media: mediatek: vcodec: get different
 firmware ipi id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117032950.1425556-5-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:53:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] media: mediatek: vcodec: fw_handler->type accessed directly by
  callers
--

commit 570b1a574a8a9971d79e8070cabc43cdc4bbf018
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: get different firmware ipi id

This commit adds mtk_vcodec_fw_get_ipi() to select the decoder IPI ID
based on the firmware type and hardware index, and updates the stateless
decoder initialization callbacks to use it.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index 50d93d47b6de0..005ac9969b5bd 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -43,5 +43,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw=
, int id,
>  int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
>  			   void *buf, unsigned int len, unsigned int wait);
>  int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
> +int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
> =20
>  #endif /* _MTK_VCODEC_FW_H_ */
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 49d9b4a72387e..84d28a0ba15a5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1878,6 +1878,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
>  {
>  	struct vdec_av1_slice_instance *instance;
>  	struct vdec_av1_slice_init_vsi *vsi;
> +	enum mtk_vcodec_fw_type fw_type =3D ctx->dev->fw_handler->type;
>  	int ret;
> =20
>  	instance =3D kzalloc_obj(*instance);
> @@ -1885,8 +1886,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
>  		return -ENOMEM;
> =20
>  	instance->ctx =3D ctx;
> -	instance->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	instance->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	instance->vpu.id =3D mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
> +	instance->vpu.core_id =3D mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);

[Severity: Low]
Should mtk_vcodec_fw_get_ipi() take struct mtk_vcodec_fw *fw instead of
enum mtk_vcodec_fw_type?

In mtk_vcodec_fw.h, struct mtk_vcodec_fw is forward-declared as an opaque
handle whose definition lives in mtk_vcodec_fw_priv.h, and every other
mtk_vcodec_fw_*() helper takes struct mtk_vcodec_fw *fw as its first
argument (with mtk_vcodec_fw_get_type() provided specifically to query
fw->type).  Taking enum mtk_vcodec_fw_type here causes vdec_av1_slice_init()
and the other four decoder init callbacks to reach directly into the private
ctx->dev->fw_handler->type field.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117032950.1425=
556-1-kyrie.wu@mediatek.com?part=3D4
