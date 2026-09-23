Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA2436B054
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132445; cv=none; b=abWPJtZPkowVUlY4+l4m+uzzs8r94wXLlDa1PHbSpSnbPSH4ZEPrVhcGlen1BzVL6fL+iN1W5fXnP9jfmaT+pwhbLY8CaeGywSkVqT2pFqc3qzhXmsJFcrLh4ZwFk0rZ3a8M/aON8+Z4CYF+zdRCIVbXvj8XYpbCMy+quR+1jlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132445; c=relaxed/simple;
	bh=5VuiCUrfu2gwVn5qqNjQmdd2m6k7W7lrno7gMxq0Yxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FHJZ0DAIo37DGbDWhDuYG7l3BPxtbb4E/gf3UaTeiU9tRJFkPspvtXuYs98gaSNEtxe5mbkhmYkN+TIMupVnIuyARRT0QI2Qsg+H6Tw51/bAbIi82YDDpbPW26P90CRfAoThZo9hwwHy7q2cqHQSOakARKyqZEMhLumEVzx0whA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPMjaFOG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPMjaFOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9F31F000FF;
	Wed, 23 Sep 2026 03:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790132444;
	bh=ra1NKtazDYUdmxoTD99pbfR/0eU++OTyLu8r3KU2RMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPMjaFOGRPptjHzRN8zwnEZF3E5GiWMvPvEx2o3PwMranrED1CWhXBtHCkOtu6hjB
	 2K+E53Nrdj7q7jp+Q1xrfr6Q1BXIulin5zkxL9LzLo8pFasFndmtOFhYTUVqYtfR2H
	 pYQmvM9yxmPghywKvMwmxOJ+dHhwKhCmusJVfS6zgDrjLuyfxIhQIPTAW3cANJ7/Ny
	 WsgnnuLR9WVKqu3vK+QLmRg2zmw9IHwwM+B/MfXmG//nBr695sVlMBxyhL8DGou4GW
	 ifb09OhIxbSHtFXbBsyzRmkmu7psRGahPaI3rqUq7LdiwtIEC9rhLiLXPmsQO9pozK
	 H5QTV47xk0xMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 14/14] media: mediatek: decoder: support av1 extend
 vsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260923024258.257846-15-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
 <20260923024258.257846-15-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 03:00:43 +0000
Message-Id: <20260923030043.CA9F31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: mediatek: out-of-bounds write in vdec_av1_slice_vsi_to_remo=
te()
--

commit 7baa5f16a9dd54f573ce9f2e95fd834226622b32
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: decoder: support av1 extend vsi

This commit introduces support for an extended VSI architecture in the Medi=
atek
AV1 decoder. It adds tile group information directly to the VSI structure s=
o it
can be shared with the kernel.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 14639098fd463..1ef561dae18c7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c

[ ... ]

> @@ -665,6 +670,8 @@ struct vdec_av1_slice_vsi {
>  	struct vdec_av1_slice_frame frame;
>  	struct vdec_av1_slice_state state;
>  	u32 cur_lst_tile_id;
> +	struct vdec_av1_slice_tile_group tile_group;
> +	unsigned int reserved[4];
>  };

[Severity: High]
Does adding these fields inflate the size of struct vdec_av1_slice_vsi beyo=
nd
the space allocated for legacy hardware?

It looks like the compile-time size of the struct is now much larger (over
0x1D50 bytes, as the tile_group struct is around 4KB).

[ ... ]

> @@ -1942,9 +1978,18 @@ static int vdec_av1_slice_init(struct mtk_vcodec_d=
ec_ctx *ctx)
>  		goto error_vsi;
>  	}
> =20
> -	if (vsi->vsi_size !=3D sizeof(struct vdec_av1_slice_vsi))
> -		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
> -			     vsi->vsi_size, sizeof(struct vdec_av1_slice_vsi));
> +	if (IS_VDEC_SUPPORT_EXT(ctx->dev->dec_capability)) {
> +		vsi_size =3D sizeof(struct vdec_av1_slice_vsi);
> +		vsi->iq_table_size =3D AV1_IQ_TABLE_SIZE;
> +		vsi->cdf_table_size =3D AV1_CDF_SIZE;
> +	}
> +
> +	if (vsi->vsi_size !=3D vsi_size) {
> +		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%x\n",
> +			     vsi->vsi_size, vsi_size);
> +		ret =3D -EINVAL;
> +		goto error_vsi;
> +	}

[Severity: High]
For legacy (non-EXT) hardware, vsi_size is permitted to stay at the much
smaller AV1_NON_EXT_VSI_SIZE (0xD50). Could this lead to an out-of-bounds
write when synchronizing the VSI buffer?

In unmodified code, vdec_av1_slice_vsi_to_remote() performs an unconditional
copy:

static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *=
vsi,
						struct vdec_av1_slice_vsi *remote_vsi)
{
	memcpy(remote_vsi, vsi, sizeof(*vsi));
}

Since sizeof(*vsi) uses the new expanded struct size, but the firmware buff=
er
for non-EXT hardware is still validated against the smaller 0xD50 size, won=
't
this memcpy() overwrite adjacent VPU memory and potentially cause crashes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923024258.2578=
46-1-kyrie.wu@mediatek.com?part=3D14
