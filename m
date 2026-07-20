Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF081A9B58
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511368; cv=none; b=kCQE3b1Zudz00QoSqqDjiYRj0DCHB5aA0MVamQCkb12eYNhIO1K45xhNo3Vg991fCXXIizAn/Nr7bkR+oVn2QxAbW+2yp9IdXqFPPl1ixo3j70z+IWtPLsp8hqOecf5GyPMIiSgoI2uXQ8mAmPY5iQ5/6sYlAZVjajru8qYpOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511368; c=relaxed/simple;
	bh=8tVgG8Ljm4iXJycnj2tCmSTYyfXPari79gt7MbcyaJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JZr3bcGfm0+StKM/FhghFlG268LfLPi/Sf2WWS7lIJbgo0pvYYRhLVZPUp1YOdCWnRAJc4gtblk/aY1E2uMmCrc2HrRANL94vBJWNCOT3GbwrHAonqFHaGQF1bbJpil11leRlwSafitNmloNxPjsfZiXoDTxk5GZOkynn87FaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPow5cpb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPow5cpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913181F000E9;
	Mon, 20 Jul 2026 01:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784511366;
	bh=AJog1Oeb5slh52QVCq2+kjHYfSQ4iKJGTOAZ/gHSU6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OPow5cpbLf8mObCSPO8Jj/Ct3THr29oVr9HPTOALokHBLYuKZzURCiRfGyB1GEzjf
	 D3zdqbS6OVHT/VG/DU47YEf6YtQJePdUPPSIcV6hjfGN1Y8lDamkclRBj11A8FQVSN
	 Z79ctwIkJ2H+yt/Lr6qX+m/HSn2GPhBBKwzbPPsfauq/GKsjBcaLSArUl8vauFq1fA
	 6CplLkFuPFe08h3I2I9axSLTntWb4wLA0wCKIdlvW4OqZsdHvHe4IvMMPLy3iKEvbO
	 HeHS0/EAtYbX0yNAEdH8Ai7r6LYXu2OStCNd9IdXVi5ZJBBbZzxBxz8/LGLKB6g8xB
	 nMsef1cFlWINQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/14] media: mediatek: vcodec: add decoder
 compatible to support mt8196
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260720012056.1026551-10-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-10-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:36:06 +0000
Message-Id: <20260720013606.913181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added MT8196 chip was added to the `mtk_vcodec_dec_chip_=
name` enum, but its V4L2 capability limits were not updated in the stateles=
s decoder's control setup, causing the driver to advertise artificially lim=
ited fallback capabilities to userspace.
--

--- Patch [9]: [PATCH v6 09/14] media: mediatek: vcodec: add decoder compat=
ible to support mt8196 ---
commit 33685e9d98f41bca9dad07f1a7aa64db22f658cd
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: vcodec: add decoder compatible to support mt8196

MT8196 is lat single core architecture. Support its compatible and
use `mtk_lat_sig_core_pdata` to initialize platform data.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index 15e437323af5a..53d1708b012b7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
>  	MTK_VDEC_MT8188 =3D 8188,
>  	MTK_VDEC_MT8192 =3D 8192,
>  	MTK_VDEC_MT8195 =3D 8195,
> +	MTK_VDEC_MT8196 =3D 8196,

[Severity: High]
Does adding this new chip name without updating the stateless decoder's
control limits restrict the MT8196 capabilities to their lowest defaults?

For example, in drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c:

mtk_vcodec_dec_fill_h265_profile() {
	switch (ctx->dev->chip_name) {
	case MTK_VDEC_MT8188:
	case MTK_VDEC_MT8195:
		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
		break;
	default:
		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
		break;
	}
}

Will this cause the HEVC max profile for MT8196 to fall to the default
MAIN_STILL_PICTURE limit, preventing standard Main profile and 10-bit decod=
ing?

A similar fallback to defaults seems to occur for MT8196 in:
- mtk_vcodec_dec_fill_h265_level() (limits HEVC level to 4 instead of 5.1/5=
.2)
- mtk_vcodec_dec_fill_vp9_profile() (limits VP9 to Profile 1)
- mtk_vcodec_dec_fill_h264_level() (limits H.264 to Level 4.1)

Should the MT8196 chip be added to the capability limit setups for the stat=
eless
decoder controls?

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D9
