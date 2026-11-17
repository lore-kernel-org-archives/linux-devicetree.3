Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887893;
	b=CAeoDfENgMMqn6MI2dZufaMsbsr7FTjkwL5UqyxFkx7uJH9taNNpooktaPjVku6IWdP5
	 /bIv+oUwGU9CwHG7ar7zSkdN9mkASLrEuGHxM41WtVIXV6n6TcDj6qr/Kg7QRaAGbw/t/
	 ZyxajGy1IT9xFGS0EAeX9pd6ao74m/KkK2ByFKk8VXtVmSIsZy0tZo2/G1nd41NKMDpu5
	 vKbeaar28aZ8S3aiEMlmgjJzcmbtgeJrdW8is7hzDAx39xpQKRrPGCfT6uLzYS28MIfTU
	 VWLiBrLqa9r8pQSe9ZL0dOVSmTH//TNJsI/W5PUEAVLtN5F8wBd2wJUmOJ0uBoibVzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887893;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UJAcOijmv1siFMXlHDD2Yx1zDphvl4fKpUkYlmwjLWw=;
	b=06yvtAiPXNdX/SMGErBuRdmuC6c9Oyqv84zslBcdJv0S83xr8LLLDKaPHcdENPQ/NtFw
	 WrRWbpMnOtba4L8jXWFrTGQAUS8gDpxCBqsd/sOayUIfG8o62gAO734vdymXg946d86yH
	 CcOcIlVd7Xa4Z+nTwJXitqn2AWX48Ddn7ZuR1rdmUcrg0wbXv0oyZ8cDjQMNuhUobjVZE
	 /GGW19ilO7/wNBJSioyu/fRhRaYwPKZwwfM7R3VS170cdOC9z00QNjroiMaZGkCuPxEw7
	 ID2C//eM0Tcyg/XXlzycLbUW6JiIhaNAI/rPpwtVitrqXnJqZm1834BQv95gRADn5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K8U2KL/I";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A42606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8U2KL/I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E601F000C4;
	Tue, 17 Nov 2026 03:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794887893;
	bh=UJAcOijmv1siFMXlHDD2Yx1zDphvl4fKpUkYlmwjLWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K8U2KL/IBvoPgtD88+joY4V9Tt5wTaV6UxjjRM8Cfa4RJZW4AdTZprdoV4zAWK8I2
	 1KsZ8OdzLjXykLpXbhDIJSmwkLuU2g0XturIXIDKFcys6zGix9aa1r9m/qPnswlKeY
	 tkuoMaB5zo04RPlmUR0ACM3J6GDSl7TVZPF2WzOx1dW/ALbT6zkRKttm5GBqolQ7N0
	 f9/jGr3E+O39cexzKk8yx2miOtwMssJjtEeStkCHqmm9mHuO+WC0p2H606eRk8enzC
	 /382twNGVWaKwyMg/ugPosOoFuBsjYjt5nbhG76fY+eGIDRPjIyXPTkoOwpvfP6ZDg
	 AX3yZS29jHwLg==
Message-ID: <sashiko-outbox-218174@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/14] media: mediatek: vcodec: get share memory
 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117032950.1425556-6-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:58:12 +0000
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
- [High] media: mediatek: vcodec: broken error checks for
  mtk_vcodec_fw_map_dm_addr()
--

commit f8c6ecd0c5f49d45a4ff6d9ac44477ccdda67d46
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: get share memory address

This commit implements mtk_vcodec_vcp_dm_addr() to partition the VCP
shared memory buffer into regions for VSI, VP9 frame context, and AV1
tables, and updates the decoder drivers to query these regions when
running on VCP firmware.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> index 5ec7a67b51b67..49ba897630a54 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
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
> +	default:
> +		break;
> +	}
> +
>  	return NULL;
>  }

[Severity: High]
Does mtk_vcodec_vcp_dm_addr() match the error return convention expected
by callers of mtk_vcodec_fw_map_dm_addr()?

The VPU and SCP .map_dm_addr implementations return ERR_PTR(-EINVAL) on
failure, whereas mtk_vcodec_vcp_dm_addr() returns NULL (or a small
non-NULL offset from NULL if fw->vcp->vsi_addr was not mapped, because
mtk_vcodec_vcp_load_firmware() sets vsi_core_addr to vsi_addr +
VCODEC_VSI_LEN unconditionally and leaves vsi_core_addr NULL for
ENCODER).

In vdec_av1_slice_init_cdf_table() and vdec_av1_slice_init_iq_table(), the
callers only check IS_ERR(), so a NULL return from mtk_vcodec_vcp_dm_addr()
causes a NULL pointer dereference in memcpy().  Conversely,
vdec_av1_slice_init(), vdec_vp9_slice_init_default_frame_ctx(), and
vdec_vp9_slice_init() only test for !ptr, which misses ERR_PTR(-EINVAL) on
SCP/VPU and dereferences the error pointer in kmemdup() or during frame
decoding.  In addition, vdec_h264_slice_init() and vdec_hevc_slice_init()
assign the result of mtk_vcodec_fw_map_dm_addr() to inst->vsi_core_ext and
inst->vsi_core without checking for errors at all.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117032950.1425=
556-1-kyrie.wu@mediatek.com?part=3D5
