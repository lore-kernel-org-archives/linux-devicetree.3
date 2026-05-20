Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362523D16EA
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321343; cv=none; b=UbRkWNu4Gs6K4sUwEbnGi571acgz3oDuAWMfnb9dtMYNVw7LvnzMOVhUJ5upoL8fFZIk66PFkuR4q6OTfLwhmJ8MF1y6MiBAu97ws6uMwGr6iSp/MGH0l01Wuprqzj1Q2xvnLi3kxWR00lliXJIw9x+e8S0mFgUw+TMgjZxj8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321343; c=relaxed/simple;
	bh=/xbpYJYyTd1UKE8Lzer4LO7cC73Dak7ZfajrqiKOVHo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F4F0D3GPzcDgJe1a2nM4v4WUKMftQbgwVIqDVkydeOAXd8e2fxf5M5EB8ftnW+N+V267IA7z/KBXXBaRVo6dU7my3tiUKYpP7Kr2/S3iAwit2CzdPq7iJUDWGuK/bMXVVQ9QBmglnxg6/scl/Tf8K6dGXJ7itlN09KONHEq89zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=rkTl979M; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="rkTl979M"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9144163319fso490950085a.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779321334; x=1779926134; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WO2Jlnfwd8E/DGsD03RFdw4xjY/iz1az5ExsXccXSE8=;
        b=rkTl979M6Ci3kL+s8oClot+pn+Ucw9w7zJakSlfvjPsQl7KMBtB0QTk+No8KYqUP+Q
         4xKdq+8EGDenYHKIaEwitlttYQs8yJnrbHMPGIsUuRmanKmw3aOVpbb15z4lyzuPVREg
         +Yic64J8FWItUaA1OOn0T2W7yevEvkfwQQHc2qOw/2zwneeOMb7Bl6LnlcP6o9ZZU+1N
         ey9YPTSvCv1kkv4EWmZzYbypupMkXAfTq+YyHx03bNxS4a+Jrsj7bUF13txhy4ARHhLm
         8W+nNxpdW7wgT5/L6pO0WvuQYgsVxkKlCRw9aqISJbvAc0UI2obWCjLRypWdRgCHNVfQ
         J3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321334; x=1779926134;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO2Jlnfwd8E/DGsD03RFdw4xjY/iz1az5ExsXccXSE8=;
        b=h1W2I38Iok2u0fk7PzKRF2ZIrOryO3yTIOEjE6a5lj/hoUkibBi7S0avWoH1C0XSnq
         hlRUuf6QPauqJ918vH3TpGRddV4k5SwxqcnvRnqpFPVwaCyH/3iocgOA5WKhFfzHmLsl
         n76OiFu9y5XCzAgw4tGtmvVhxBWmjULSxeQJvqTamBAlEF2IoeAYGMYjPL0GQM5XG3aA
         YxKYw1XHR7BZvS1v8QXOOinleXHo+h/en9t07F1omEINcFrr8mPhq92Ea+qKSZ6AwrwH
         dYnHt+gfEifeKINJLuoHxZfIGBVKnqFwznUgTqaLfmY3Q+DlhMWhrMgVBmqxnysBtGeT
         zgPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ufso4gCC/NoT3vIru9S2GnjpbtfnNFZNlHE4VPpu4xEQ3uyf/J9Y3XbDzP5g1uUpexw33Z7Cb1jz0@vger.kernel.org
X-Gm-Message-State: AOJu0YyVuMkTxC6qv75C8eaPo7Kar9huDBLNMDywreDsfBoXdtWKFqUr
	4aVGmHVzX88Tup2JQC/aH/m0GTAZLOqN5T6GRv9zOn5HxuJgEiCtUno9pmcI63JV8uY=
X-Gm-Gg: Acq92OGnTBhwTjV/okxOvZmvrm/4C2UDpBimas6j9q0ksX9aY58i6YtD+KUTU/dUlD0
	3QKZsBdDfd1Tmy6fX0EdCUSLaIe9nCte1n2Yu4UdDUpfZ36GouUBY5KewTIARVtrpgzPcDb2cFh
	d1ATPRslYf07WKDIFwPerz2usZAn7hyeExunPamibyqiMmfSMSwGBGhsqGad/il8ZWcuFSeIeLG
	t8CjkAzZq2qCAd3a42i1UGrAypQf9/UIUsRJD7OiwnFEcVxtYq3cLijOn//Jc5LLa5w/ikadYnx
	6EVMhl9gn1ARB5NJbs2xx7rwfIb8Zbrfr2W7yJSBWrO/qhBE6CUHBw0qmnCL+R7rGetfy8yF9v5
	e1m0nZpMoEJnOOrt5ZlOnKoy2CFkdGZ+5lPTfkiJlytaDi8YBFuKgpzK225VTJ9EgpJMS/v3/0+
	/RyUEK5triBpzncjMbvX/Of2F+ZzoBXJ8GjmQitCxRh1d2keNQRkPYEx+xGwo2tWESZDA1
X-Received: by 2002:a05:620a:f01:b0:90f:b39e:ec8 with SMTP id af79cd13be357-914a2a6220fmr67310485a.17.1779321334282;
        Wed, 20 May 2026 16:55:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3732dsm2241597285a.33.2026.05.20.16.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 16:55:32 -0700 (PDT)
Message-ID: <01ed1968d49691b47da056d5e07b376e5a2ef028.camel@ndufresne.ca>
Subject: Re: [PATCH v7 16/28] media: rockchip: rga: reuse cmdbuf contents
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
	p.zabel@pengutronix.de
Date: Wed, 20 May 2026 19:55:31 -0400
In-Reply-To: <20260521-spu-rga3-v7-16-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
	 <20260521-spu-rga3-v7-16-3f33e8c7145f@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iE9F37poAHpBbdW9jc1N"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-iE9F37poAHpBbdW9jc1N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 21 mai 2026 =C3=A0 00:44 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Reuse the command buffer contents instead of completely writing it
> for every frame. Therefore we only need to replace the source and
> destination addresses for each frame. This reduces the amount of CPU
> and memory operations done in each frame. A new cmdbuf_dirty flag notes
> if the cmdbuf has to be rewritten on the next frame.
>=20
> The initial idea of initializing the cmdbuf on streamon broke the
> ability to update controls while streaming (e.g. mirroring).
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> Changes in v6:
> - Reworked the commit to not setup the cmdbuf on streamon but rather
> =C2=A0 re-initialize it on the next frame when something changed.
> - Sasahiko flagged the cmdbuf setup at streamon:
> =C2=A0 https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86=
%40pengutronix.de?part=3D17
> - Dropped Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> =C2=A0 due to the reworked patch and commit message contents
>=20
> Changes in v5:
> - Don't set the flipping and rotation values at streamon and preventing
> =C2=A0 the userspace from chainging them at runtime
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 13 +++++++++----
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 11 ++=
+++++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 ++
> =C2=A03 files changed, 20 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index dac3cb6aa17d3..567d39e58d33f 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -417,8 +417,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> -
> =C2=A0	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
> =C2=A0	/*
> =C2=A0	 * Due to hardware bug,
> @@ -427,11 +425,9 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
> =C2=A0
> =C2=A0	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
> -	rga_cmd_set_mode(ctx);
> =C2=A0
> =C2=A0	rga_cmd_set_src_info(ctx, &src->offset);
> =C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> -	rga_cmd_set_trans_info(ctx);
> =C2=A0
> =C2=A0	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =C2=A0
> @@ -440,6 +436,14 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0				=C2=A0=C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);
> =C2=A0}
> =C2=A0
> +static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
> +{
> +	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> +
> +	rga_cmd_set_mode(ctx);
> +	rga_cmd_set_trans_info(ctx);
> +}
> +
> =C2=A0static void rga_hw_start(struct rockchip_rga *rga,
> =C2=A0			 struct rga_vb_buffer *src,=C2=A0 struct rga_vb_buffer *dst)
> =C2=A0{
> @@ -582,6 +586,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_height =3D MAX_HEIGHT,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> +	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> =C2=A0	.start =3D rga_hw_start,
> =C2=A0	.handle_irq =3D rga_handle_irq,
> =C2=A0	.get_version =3D rga_get_version,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index d080cb672740b..394b14b9469df 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -38,6 +38,11 @@ static void device_run(void *prv)
> =C2=A0	unsigned long flags;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&rga->ctrl_lock, flags);
> +	if (ctx->cmdbuf_dirty) {
> +		ctx->cmdbuf_dirty =3D false;
> +		rga->hw->setup_cmdbuf(ctx);
> +	}
> +	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =C2=A0
> =C2=A0	rga->curr =3D ctx;
> =C2=A0
> @@ -47,8 +52,6 @@ static void device_run(void *prv)
> =C2=A0	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =C2=A0
> =C2=A0	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
> -
> -	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t rga_isr(int irq, void *prv)
> @@ -141,6 +144,7 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0		ctx->fill_color =3D ctrl->val;
> =C2=A0		break;
> =C2=A0	}
> +	ctx->cmdbuf_dirty =3D true;
> =C2=A0	spin_unlock_irqrestore(&ctx->rga->ctrl_lock, flags);
> =C2=A0	return 0;
> =C2=A0}
> @@ -228,6 +232,7 @@ static int rga_open(struct file *file)
> =C2=A0		ret =3D -ENOMEM;
> =C2=A0		goto rel_ctx;
> =C2=A0	}
> +	ctx->cmdbuf_dirty =3D true;
> =C2=A0
> =C2=A0	ctx->rga =3D rga;
> =C2=A0	/* Set default formats */
> @@ -448,6 +453,7 @@ static int vidioc_s_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
> =C2=A0	frm->crop.height =3D pix_fmt->height;
> =C2=A0
> =C2=A0	frm->pix =3D *pix_fmt;
> +	ctx->cmdbuf_dirty =3D true;
> =C2=A0
> =C2=A0	v4l2_dbg(debug, 1, &rga->v4l2_dev,
> =C2=A0		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
> @@ -564,6 +570,7 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =C2=A0	}
> =C2=A0
> =C2=A0	f->crop =3D s->r;
> +	ctx->cmdbuf_dirty =3D true;
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 38518146910a6..5360f092fecf0 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -55,6 +55,7 @@ struct rga_ctx {
> =C2=A0
> =C2=A0	void *cmdbuf_virt;
> =C2=A0	dma_addr_t cmdbuf_phy;
> +	bool cmdbuf_dirty;
> =C2=A0
> =C2=A0	int osequence;
> =C2=A0	int csequence;
> @@ -152,6 +153,7 @@ struct rga_hw {
> =C2=A0	u32 max_width, max_height;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> +	void (*setup_cmdbuf)(struct rga_ctx *ctx);
> =C2=A0	void (*start)(struct rockchip_rga *rga,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);
> =C2=A0	bool (*handle_irq)(struct rockchip_rga *rga);

--=-iE9F37poAHpBbdW9jc1N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag5J8wAKCRDZQZRRKWBy
9DAZAP9Xf7IdErtf/h9OYj66sgKI7S2PALOfOoCONV6yRBPk5wEA8266iKH8r1NF
zwhjBDfN6Qioq0E01auxFy1Gft3WbAw=
=ULXz
-----END PGP SIGNATURE-----

--=-iE9F37poAHpBbdW9jc1N--
