Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB733CF201
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622294; cv=none; b=b0lXzcHSQlr5QU96XcbtDM7UB9/YTJ3LyBLgaKQyLXONdnEE4gPgkZBZfRnbYF+1qswEIV823F7rvplBXt1X/sDHZ80wjP/A2E4dCbAsbQjeiRkaH0xXIAMUMSTdmbh7y/S1fXruNC4eIoQEHP6AYneO1T/zxLM/PLT3QvDEeM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622294; c=relaxed/simple;
	bh=+EEqVD2JSnvHMtzGQ2jrCX8AzTeZd7+UPOfvdgtOUcc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iqoyM8bLrtbWn8aU4MdEF7/pP045dnKF6ofF536KLLqmtcDBI2s9F5nqZQPVL/jw3GpCxIAow4GQ7LmAJqaTyC3WorWYKEEz84n9NeWlZnnrwObSuEdt3LVilPlGCMd3wyeQnNsJbIyCnxEIe/hIOFjsOQWq38nG3pH8rcJKOAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vo4TrBGa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vo4TrBGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1FD1F0089A;
	Sat, 10 Oct 2026 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622292;
	bh=K+SNFK2S/imPmuPCpYO0r7eOV7xVyVz7zCeUy7xqwm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vo4TrBGa13nUp4rPJeSVPhty4vyS01Dg+MqtcKYIOLUvoNv+Wjca9r37oY+n2V6we
	 hR3K7KwVoDh2Gtl8NLd0HSSx2PG36QZXD/LvF3aNIlaieYzlnWMcOvXfuj3GYFNtMj
	 /qmuZwVdk6+l3gq0VpqPIyhCJmxGatvR7h215d8Ze/Dj9yyQRu6/jV9a6g5vpfWXug
	 d9D/mXqMkLakJqZgVfjkhNH+/XhZPjYbsNiIduSG915ot6uq140QhM/zARy8Ibnirk
	 4XJP6d5oo6V+6qfDx4sueN1U+E2KY1URsNxAY8zKgnFlGb5gsm1loCWPnJxlIkUwGn
	 74KvlU+q7XpfQ==
Message-ID: <sashiko-outbox-166378@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 14/14] media: mediatek: decoder: support av1 extend
 vsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1ed11835bd1833066e162035a2529eda1304edcd.1791619743.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <1ed11835bd1833066e162035a2529eda1304edcd.1791619743.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:51:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] media: Out-of-bounds write to VPU firmware memory due to overs=
ized memcpy
--

commit 482da53176ed6a6bd943ba24dd065fc679bf7158
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: decoder: support av1 extend vsi

The patch expands the AV1 VSI state structure to include tile group
information to support the extended architecture. It also updates the
initialization routine to allow smaller shared memory buffers when
running on non-extended firmware.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 14639098fd463..1ef561dae18c7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -665,6 +670,8 @@ struct vdec_av1_slice_vsi {
>  	struct vdec_av1_slice_frame frame;
>  	struct vdec_av1_slice_state state;
>  	u32 cur_lst_tile_id;
> +	struct vdec_av1_slice_tile_group tile_group;
> +	unsigned int reserved[4];
>  };

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

[Severity: Critical]
This correctly enforces that older firmware provides a 0xD50-byte buffer for
the non-extended architecture.

However, since struct vdec_av1_slice_vsi was expanded with tile_group,
does vdec_av1_slice_vsi_to_remote() now copy too much data?

vdec_av1_slice_vsi_to_remote() {
	memcpy(remote_vsi, vsi, sizeof(*vsi));
}

Since sizeof(*vsi) evaluates to the new, enlarged compile-time size of the
struct, will this unconditionally write ~7.5KB of data into the 0xD50
(3.4KB) firmware buffer when decoding on non-extended hardware?

Could this out-of-bounds write corrupt adjacent data in the VPU shared
memory or firmware SRAM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791619742.gi=
t.kyrie.wu@mediatek.com?part=3D14
