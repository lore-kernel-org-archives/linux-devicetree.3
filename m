Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA401456E17
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069249; cv=none; b=p6Hi5i0J95XWLcPxlHLdqRUCew8e7e8nx94N1BTgafB3JDpyLNc5Wyp2d+5GPkvE7go5uTTW7auKrtAsuW5x8rZXT00viKi6P7bkb/dF7zbk5g2lchUjK048chImr/gle8mWrQPtqnQ506Ci/Jx94m5daqNAmz0KP/8HKQhgxT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069249; c=relaxed/simple;
	bh=WtmKOT4k00FyQf+g8/04mh/BSS0kCFU0KqKwYPiAanU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rHPysNMjk21d91jFSIinkaf7aPCrh7Gqu9XB+XAkjj/kWHIgg7oNmPWXc3hnDdsmGKPNRl4rEUzn45WtoLMBFhjjy7PQNOees2FZWD//mD0b9yUXqKNU6A0NXMkMK7/GMkcAKFYcCZfhWdz39wDAM67S1MnYGTpPFzjT6B+gLz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5NuH2SG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5NuH2SG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFFD1F00893;
	Tue, 22 Sep 2026 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069247;
	bh=pirclwzXi1OHa51U/KjF7yxsu8P2yVgqw6eiv3UgcRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X5NuH2SGCly0YOrIfmw+maEaJwI03bSVbji1RY5UMG9RkwN1B9u8HamaoAZy80iCn
	 +8KhRcLFJRf2XuyCJRL8pcSHM5fLvaiyBV4w7fSuAiAqmmkCerqu6TBSIvq7Y8Pae8
	 N73XWx3QvgpXEM3dH6jUg0uev5rbEATzrRI9Qv6TED0DCcWkmfdZTzY5p2aQr6kuo9
	 oiebEIOZ0rHPF6el9L+ZvdSHowQLng/qAieUun9YbipmWZXtpC5ZPRWynMzWEjMXVJ
	 yz3mu9Z/XICrEgr3YemNKC8+/NIV8N6dPHE3QpG5jZ026mtwAV+aAyWSA5k2rz4Udr
	 5aZVcD2CS509A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 02/12] media: mediatek: jpeg: fix jpeg buffer
 payload size setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260922091530.241762-3-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:27:26 +0000
Message-Id: <20260922092727.0DFFD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: mtk-jpeg: unnecessary duplication of vb2_set_plane_payload()
--

commit c0c8c5e4f25d1e1a980b86dc79d9084a8c169924
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix jpeg buffer payload size setting

For multi-core jpegdec, if one core gets a resolution change event, the
payload size needs to change but cannot be changed immediately while others
decode, leading to mismatch warnings. This patch modifies the buffer prepare
function to clamp the payload size to the buffer length.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 41c4cf8dc2626..34135706a4ac3 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

[ ... ]

> @@ -710,12 +711,20 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *=
vb)
> =20
>  	for (i =3D 0; i < q_data->fmt->colplanes; i++) {
>  		plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> +		max_size =3D plane_fmt.sizeimage;
> +
>  		if (ctx->enable_exif &&
> -		    q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> -			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
> -					      MTK_JPEG_MAX_EXIF_SIZE);
> -		else
> -			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
> +			q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
> +			max_size +=3D MTK_JPEG_MAX_EXIF_SIZE;
> +
> +			vb2_set_plane_payload(vb, i,
> +					      MIN(vb->planes[i].length,
> +						  max_size));
> +		} else {
> +			vb2_set_plane_payload(vb, i,
> +					      MIN(plane_fmt.sizeimage,
> +						  vb->planes[i].length));
> +		}

[Severity: Low]
This isn't a bug, but does mtk_jpeg_buf_prepare() unnecessarily duplicate t=
he
vb2_set_plane_payload() call and clamping logic here?

Since max_size is already initialized to plane_fmt.sizeimage before the
conditional, could this be simplified by only adding MTK_JPEG_MAX_EXIF_SIZE
to max_size inside the if block, and then doing a single
vb2_set_plane_payload() call outside the branches?

>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091530.2417=
62-1-kyrie.wu@mediatek.com?part=3D2
