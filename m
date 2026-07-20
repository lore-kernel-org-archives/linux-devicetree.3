Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5C554774
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511148; cv=none; b=L+TCniXe7B9W4Mt5RPqibnawknyfu5JC5qgVubQczdkREhsY4X19FoAjXGPNgT6incZhh8ua4uLft6J5QQaZzo60K6nytlNd5hdDwHgAWdjNgG8vpFM7F77LvTyOC+6QVei0FqjS0GQiuTFAtx2LoDhw98j5rvwL6xT36pedqlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511148; c=relaxed/simple;
	bh=lxDHjvugangZDz51SN9HZQP/vnGlxLkcvijT9H6qSSI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CkX3n+Xj4j1VH78SRFNvT0hzHAtJPJBT4seH+YDzuDze5xnaA6T/P937SxQbqJkbVfA+/hZH8zTw6UQgOqdlPraftSX7JHwLm28CsyVWaewVZt/r9JdmUIwUW5ZfSYhEKf7RphE3HkXsif+qwiXq0L+7MV1tCLhCfQ6ZKUA/lvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohE8tn5x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohE8tn5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C01C1F000E9;
	Mon, 20 Jul 2026 01:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784511145;
	bh=4q+juEEtHcQmqFu6oYt5fDojk4ucVMyseQzdvGXWRSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ohE8tn5xYhP0GDYDrLHHVYef2tufBMUa5F7B1gVUquM2OCEGpTjSwmkbxlWaJFCtS
	 o30A9Aho0WjHRblFwxguuxAh4sxj+2y/QZuyTXArzee0FUw2VSc6BtR/B1wLlSWR60
	 0wpcpAzRVUSQ+7aCEbEYolQfk2lel7xMtIsKso3daZQ6W9D2VXW8I0PA79qvdQ8Lpa
	 L/S4vnWY6zuxz6pzmBKWqE9+n6GFvIhA6RN0RXiBodOiy+rseI2zLbU5LI0Ab6F/vJ
	 dNbgrVmo3U7UWatH0exSJZjTO99xEMnM5ubAV9lIsEs9921CFufYHYrklg7mtP/nv2
	 vVwWtZqVnMD9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/14] media: mediatek: vcodec: send share memory
 address to vcp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260720012056.1026551-8-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:32:24 +0000
Message-Id: <20260720013225.5C01C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional increase in firmware IPC message size may break ba=
ckwards compatibility with older SCP/VPU firmware.
--

--- Patch [7]: [PATCH v6 07/14] media: mediatek: vcodec: send share memory =
address to vcp ---
commit 84b64e642819aa5202009e5076e47823645bcbc0
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: send share memory address to vcp

This commit updates the AP to VPU initialization message by adding a shared
memory address field. It is used specifically for the VCP architecture where
shared memory is allocated in the kernel rather than reserved in the VPU.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.=
h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> index 47070be2a9914..097561a1efdcf 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h

[ ... ]

>  struct vdec_ap_ipi_init {
>  	uint32_t msg_id;
>  	u32 codec_type;
>  	uint64_t ap_inst_addr;
> +	u64 shared_iova;
>  };

[ ... ]

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index cdb673e6b4770..3a10b32be0945 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -236,6 +236,8 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>  	msg.msg_id =3D AP_IPIMSG_DEC_INIT;
>  	msg.ap_inst_addr =3D (unsigned long)vpu;
>  	msg.codec_type =3D vpu->codec_type;
> +	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) =3D=3D VCP)
> +		msg.shared_iova =3D vpu->ctx->dev->fw_handler->vcp->iova_addr;
> =20
>  	mtk_vdec_debug(vpu->ctx, "vdec_inst=3D%p", vpu);

[Severity: Medium]
Does this unconditional size increase break backwards compatibility with ol=
der
SCP/VPU firmware?

By adding shared_iova to struct vdec_ap_ipi_init, the struct size increases
from 16 bytes to 24 bytes. Directly after this diff hunk in vpu_dec_init(),
the message is sent to the firmware using the full sizeof(msg):

err =3D vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));

If older firmware expects a strictly sized 16-byte initialization message,
could sending 24 bytes unconditionally cause the initialization to fail and
render the video decoder unusable on existing non-VCP devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D7
