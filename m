Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49D399348
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621993; cv=none; b=iYqG0o3b5Q81LNFWLdzgK8uC9XcYKF6KLKQcyeBeVH6OGYWNxecHT8FAFM+du+eLVkatdZawLuyJgZNAit8uO2qy+SsoVJak8IhQIy7w0/2D3rq9+mDwUp/BnWBicxxaMwXu99JUIp7EL4bQLgaie/WT9fqE7TO70jPGW2GJFW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621993; c=relaxed/simple;
	bh=KQQVmM5B+PaYTJsNRCqYGlnWmZdPzMN+aORogYy1dxg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OJFChRnk6NhZxW+Sp9Ai7tDg1HLti6JRzv0M5/q87FTCZH7xN9nPEkTPy8tKpUUmmz/P4EnrCxFotmA8q4MJIwkdEwgnBQBKFz8/XHM9VYks51BHNAGQOridcebKGcyk589tFk3djasd01ToDqB7zoRKBvep4HGFthLbw80rQ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtTEJ7mN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtTEJ7mN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8461D1F000FF;
	Sat, 10 Oct 2026 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791621988;
	bh=pwgX9MtuSKeDysYMZDwoLsk+A0xjQp1JNlHXHYF25oE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HtTEJ7mNftY9fSoo+zR1+ONB2Kil3/b9KxGV8f5n78M+2m1xNywWZ9XPYy9Qu9heO
	 qJgIlReYGidlK+/ZiqAjIC9fze+T0XL72GJMmOvTASnK17P/PcfFuONSjDzKS0SlHO
	 a5oRUmsvp/RsATfIChLCFqxZYa33V5k0fvdFa6D3QTIKtdh5xw4FGrwJT5VJZzmS0R
	 ncVEQp+pqndDR/TX+hEm3lgUHxw8/A3fw5nBjpKgzQszaFkEhIMHqZ4dAj+Co70BgT
	 368aHaQmbYQavBFHyK5AyxTub+ziD8xGdUGU6quAWzdX6fQUy5zi5Zgye8aZ+yXk3b
	 WUQ/XqftjHtZg==
Message-ID: <sashiko-outbox-166374@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/14] media: mediatek: vcodec: send share memory
 address to vcp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <2b8aedbd69015d02a3a62ee35b4c551209fe335f.1791619743.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <2b8aedbd69015d02a3a62ee35b4c551209fe335f.1791619743.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:46:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: vcodec: IPI msg size increase may break older firmware
--

commit 82cf992a706e24d85ad99ada3a7b106540bc8145
Author: Kyrie Wu <kyrie.wu@mediatek.com>

    media: mediatek: vcodec: send share memory address to vcp
   =20
    The share memory is allocated in kernel for vcp architecture, it's
    different with vpu which share memors is reserved in vpu micro
    processor. Need to send share memory address to vcp.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.=
h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> index c2c2a3a63dfd3..8b771d47053b0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> @@ -67,11 +67,13 @@ struct vdec_vpu_ipi_ack {
>   * @msg_id	: AP_IPIMSG_DEC_INIT
>   * @codec_type	: codec fourcc
>   * @ap_inst_addr	: AP video decoder instance address
> + * @shared_iova	: reserved share memory address
>   */
>  struct vdec_ap_ipi_init {
>  	uint32_t msg_id;
>  	u32 codec_type;
>  	uint64_t ap_inst_addr;
> +	u64 shared_iova;
>  };

[Severity: Medium]
Does this struct size change break older firmware?

The size of struct vdec_ap_ipi_init is increased from 16 to 24 bytes here.

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
Will this unconditionally send the new 24-byte size to all firmware types?

In vpu_dec_init(), vcodec_vpu_send_msg() is called right below this:

	err =3D vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));

If older VPU or SCP firmwares strictly validate the IPI message length,
could the video decoder initialization fail and render the device unusable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D7
