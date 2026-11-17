Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888861;
	b=HvzCgOhPvKcNItWuC/0K2+gjUYf6c0xWnaqwb7E5Hk/UpGGc4OsOq87W6E7Vp+6rO3lH
	 d1y8UIDIOKwyKL6gdk8M7nFqskUR9gPEcvPV1BozZTGI8Uo7M+7qhHmanSVzKh3vtYuaC
	 s9Q7Gs379p6R19nFOS5mvfW2psqGIWnncyC0Dray8gFrjMRYmnIz05hdGOfULkgUYKdUI
	 5UKvSED4BvgY973Viyn9FQj3PLymteGRZaewVSmLv9pUsLbxgjqTpA4rl1dSjz2wNkd5u
	 x6eSKW536WoodD2LU4IWHqxpr2LmdQ12gMGnipXnfWzrmGzWBzD0mqrK8YVJbF7etaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888861;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yU9/aoF+hdGK0FL+ZZnBWAJml9c3OG8hkZh51TRHELE=;
	b=r7+bvfrpWM7Bjmgt/hiU3ZWYAR+VY5oGNSmFEwyFVKlSYCPIW2oiR7wardu58nd7liVq
	 WpUAaimX5iRFzr5xEcuAQ681S6D2VShMRzDV/xED0UWcHaExb6C3lndTZyoZB70z1DH9I
	 1IqM6M/Rut0KhlHHmHSZEQeAa5JGpHaVEsNoqo1ApXnMRRsvuikL16b4MfM6YQXb2oDCV
	 fsnTLQfPBVzXIPTf3O3gQbTblvbmiqTKJx78Ji0yhkzjuW5dZYn+PPpa9nHccYr/2ZN0Q
	 3o2IUn9pLKWPQ+cw+dCgHRQcTnbcKjrAnw/PCWaxQf0Mm+49IFIH0pgt3bsl1VKVgAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4BbxV9B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D889606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4BbxV9B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C4A1F000C4;
	Tue, 17 Nov 2026 04:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794888860;
	bh=yU9/aoF+hdGK0FL+ZZnBWAJml9c3OG8hkZh51TRHELE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a4BbxV9BTw0FkWiZGK9bdlFSmhKPH+xhVD9+ZuBLVJrV6mkYBeZNQy4UWup5yi0pW
	 uSq+jA/WyWk/2vqZHdSaAzkkbPwEODWw2CLQS9wr04Vio0YoSnnXSXTB4JNmptW5zD
	 Ar/u1VqOFL/QN8j3nghoqzOyOuQbuFkq8Fk0Q3dYKqdSQ3tSJ0mroRQ/dx7mgh0kYo
	 M5/0Jrm5JybLLSrhOI9qbl75hDVDdfeGuH7xXZVDowksbw49jPCEkl9PSR3akVm48V
	 vlbe0joVd8UNlOGw7IAIYL+UCFelRhsWNjso9aBCE4EF3DOIu4MWn57O5VfdPfCcWl
	 Py+J683ViA5Gw==
Message-ID: <sashiko-outbox-218180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 14/14] media: mediatek: decoder: support av1 extend
 vsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117032950.1425556-15-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-15-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 04:14:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] media: mtk-vcodec: VCP table sizes set for non-VCP in
  vdec_av1_slice_init()
- [Low] media: mediatek: vcodec: duplicate AV1_TILE_SIZE macro and
  vdec_av1_get_tiles_num()
--

commit 9047e2aa57e9e09f9e60cb45bd82896702db3562
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: decoder: support av1 extend vsi

This commit adds extended VSI support to the MediaTek AV1 stateless
decoder by storing tile group information in the shared VSI structure when
MTK_VDEC_IS_SUPPORT_EXT is set.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 2d6e08e722de0..97ca80fd06d6b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -25,6 +25,9 @@
> =20
>  #define AV1_INVALID_IDX			-1
> =20
> +#define AV1_NON_EXT_VSI_SIZE		0xD50
> +#define AV1_TILE_SIZE			64
> +
>  #define AV1_DIV_ROUND_UP_POW2(value, n)			\

[ ... ]

> @@ -1403,17 +1413,29 @@ static void vdec_av1_slice_setup_uh(struct vdec_a=
v1_slice_instance *instance,
>  	vdec_av1_slice_setup_tile(frame, &ctrl_fh->tile_info);
>  }
> =20
> +static
> +struct vdec_av1_slice_tile_group *vdec_av1_get_tile_group(struct vdec_av=
1_slice_instance *instance,
> +							  struct vdec_av1_slice_vsi *vsi)
> +{
> +	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
> +		return &vsi->tile_group;
> +	else
> +		return &instance->tile_group;
> +}

[ ... ]

> @@ -1608,6 +1630,15 @@ static int vdec_av1_slice_setup_pfc(struct vdec_av=
1_slice_instance *instance,
>  	return ret;
>  }
> =20
> +static u32 vdec_av1_get_tiles_num(struct vdec_av1_slice_instance *instan=
ce,
> +				  struct vdec_av1_slice_vsi *vsi)
> +{
> +	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
> +		return vsi->tile_group.num_tiles;
> +	else
> +		return instance->tile_group.num_tiles;
> +}
> +
>  static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instan=
ce *instance,
>  					    struct vdec_av1_slice_vsi *vsi,
>  					    struct mtk_vcodec_mem *bs,
> @@ -1648,12 +1679,18 @@ static void vdec_av1_slice_setup_lat_buffer(struc=
t vdec_av1_slice_instance *inst
> =20
>  	vsi->tile.buf =3D instance->tile.dma_addr;
>  	vsi->tile.size =3D instance->tile.size;
> -	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * instance->tile_gr=
oup.num_tiles);
> =20
>  	vsi->cdf_table.buf =3D instance->cdf_table.dma_addr;
>  	vsi->cdf_table.size =3D instance->cdf_table.size;
>  	vsi->iq_table.buf =3D instance->iq_table.dma_addr;
>  	vsi->iq_table.size =3D instance->iq_table.size;
> +
> +	/* lat_buf is used to share hardware decoder syntax between lat and cor=
e,
> +	 * there isn't only one. But there is only one tile.va for each instanc=
e.
> +	 * Need to copy tile information to lat_buf every time.
> +	 */
> +	memcpy(lat_buf->tile_addr.va, instance->tile.va,
> +	       AV1_TILE_SIZE * vdec_av1_get_tiles_num(instance, vsi));
>  }

[Severity: Low]
This isn't a bug, but AV1_TILE_SIZE duplicates the existing
AV1_TILE_BUF_SIZE macro (also 64) used for allocating and indexing the
same tile entries in vdec_av1_slice_alloc_working_buffer() and
vdec_av1_slice_setup_tile_buffer().  Also, vdec_av1_get_tiles_num()
duplicates the IS_VDEC_SUPPORT_EXT() check in vdec_av1_get_tile_group()
instead of using vdec_av1_get_tile_group(instance, vsi)->num_tiles.

[ ... ]

> @@ -1943,10 +1982,20 @@ static int vdec_av1_slice_init(struct mtk_vcodec_=
dec_ctx *ctx)
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

[Severity: Medium]
Should setting vsi->iq_table_size and vsi->cdf_table_size to
AV1_IQ_TABLE_SIZE and AV1_CDF_SIZE be guarded by fw_type =3D=3D VCP rather
than IS_VDEC_SUPPORT_EXT()?

AV1_CDF_SIZE and AV1_IQ_TABLE_SIZE are the partition sizes of the VCP
shared memory region in mtk_vcodec_vcp_dm_addr(), and
vdec_av1_get_cdf_table_addr() and vdec_av1_get_iq_table_addr() only select
those VCP partitions when mtk_vcodec_fw_get_type() is VCP:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c:v=
dec_av1_get_cdf_table_addr() {
	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) =3D=3D VCP)
		return AV1_CDF_MEM;
	else
		return (u32)vsi->cdf_table_addr;
}

If an SCP platform advertises MTK_VDEC_IS_SUPPORT_EXT via
scp_get_vdec_hw_capa(), overwriting vsi->iq_table_size and
vsi->cdf_table_size here causes vdec_av1_slice_init_cdf_table() and
vdec_av1_slice_init_iq_table() to allocate and memcpy() the VCP partition
sizes from the SCP DMEM addresses vsi->cdf_table_addr and
vsi->iq_table_addr.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117032950.1425=
556-1-kyrie.wu@mediatek.com?part=3D14
