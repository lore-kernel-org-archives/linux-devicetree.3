Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2904EFFA3
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905597; cv=none; b=s5SGwXAygZCB9PZZLwqltxhA2fzOtEA+TUDX5wodYRuHnzFmvpt+1zYszml5zY9slFjl7aeOpvny57mNo8O2W7ZkLv1wUDgpz1syZzJ/WrQ04hb9W7UrcXLMZWZGwqJU4gMMmyFBV3o2yOU772BVnfzRHvk28pvPOar+y4CQ6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905597; c=relaxed/simple;
	bh=k8JlBUJOL0Ieqt0O9pac/XLcoVSq/CM8L/fE/A9rEjw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=a16V4U0OorSibK7J000L2PJaM3mB/ieQK6hfkaAPJTda37BBsRU5ZZ6j51EO/lxFYcXHEVzvn8pf0eezic08pjnw7MhlJL+CocckkDg9HTvBEIYHAZhM7OuHPCV9viQ+pEcQWWFgtZCWc4xogbruyJP9WBQoaE0bDYwAJWphl8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gqes+tkp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gqes+tkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2351F000FF;
	Tue, 13 Oct 2026 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905594;
	bh=gPlC2Rn3gNzRd5irz9/c1Zk5H69nXVfhQWF47HgG568=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gqes+tkpr1vol1w+o93lyiTrXxDuFpbQ+BosMlOY0rYCHKQLbIuJ+Fc9HvAZ2aHyF
	 XZWZLUrwE2dG1J3bxBzy/3bZ2JfZ7s7ph8qEDnU0rdaDr5LSDUANGFzJ9NIjNFgoOq
	 BLI7ykKWI5YsiOKpoxUyZYTN3zH9ic0XqRHgXQiULzH35Mzt/ED03G8lezF9BuIapT
	 ggL/ROrMDf1ca25Zt5eYFl7JZl0zoQf5UylLrwrw+yWkkeKW/QX4qZ2Ex1t+HdoSeJ
	 n0Um5cA/OJ3IVFj2ec1zJzhzn6J/WiDZgfjcrWN/+yJQd2YmURDr4kGyUoC9UhtN0q
	 aztikYJtUVbKA==
Message-ID: <sashiko-outbox-170016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/13] media: sony-starvis2: Allow runtime control of
 link frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261013-media-starvis2-v2-6-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
 <20261013-media-starvis2-v2-6-3670722d250a@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:33:14 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: sony-starvis2: missing lock and NULL check for link_freq in=
it
--

commit 54243fb94593be25be7c3f168bb8161959b863e5
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: sony-starvis2: Allow runtime control of link frequency

This commit connects V4L2_CID_LINK_FREQ to allow runtime configuration
of the link frequency when the sensor is not streaming.

> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> index 66c77c5957e32..2bb438d22ada0 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c

[ ... ]

> @@ -1210,25 +1236,23 @@ static int starvis2_init_controls(struct starvis2=
 *starvis2)
> =20
>  	starvis2->vmax =3D starvis2->variant->vmax_default;
> =20
> -	hmax =3D variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
> -	if (starvis2->lane_mode =3D=3D STARVIS2_LANEMODE_4L)
> -		hmax =3D max(hmax >> 1, variant->hmax_min_pixel_array);
> -
>  	/* PIXEL_RATE is fixed and read-only */
>  	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
>  			  starvis2->variant->pixel_rate,
>  			  starvis2->variant->pixel_rate, 1,
>  			  starvis2->variant->pixel_rate);
> =20
> -	/* LINK_FREQ is also read only */
> -	link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> -					   V4L2_CID_LINK_FREQ,
> -					   ARRAY_SIZE(link_freqs) - 1,
> -					   __ffs(starvis2->link_freq_bitmap),
> -					   link_freqs);
> -
> -	if (link_freq)
> -		link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +	starvis2->link_freq =3D
> +		v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ,
> +				       __fls(starvis2->link_freq_bitmap),
> +				       __ffs(starvis2->link_freq_bitmap),
> +				       link_freqs);
> +	__v4l2_ctrl_modify_range(starvis2->link_freq,
> +				 __ffs(starvis2->link_freq_bitmap),
> +				 __fls(starvis2->link_freq_bitmap),
> +				 ~(starvis2->link_freq_bitmap),
> +				 __ffs(starvis2->link_freq_bitmap));

[Severity: High]
Does this code pass starvis2->link_freq to __v4l2_ctrl_modify_range() witho=
ut
checking if it is NULL? If v4l2_ctrl_new_int_menu() fails to allocate memor=
y,
it returns NULL, which would cause a NULL pointer dereference when
__v4l2_ctrl_modify_range() accesses ctrl->handler.

Also, is it safe to call __v4l2_ctrl_modify_range() in starvis2_init_contro=
ls()
without holding the control handler lock? This unlocked variant expects the
handler lock to be held, which will trigger a lockdep assertion failure. Sh=
ould
this code use the locked variant v4l2_ctrl_modify_range() instead?

>  	vblank =3D starvis2->vmax - starvis2->variant->active_area.height;
>  	max_vblank =3D STARVIS2_VMAX_MAX - starvis2->variant->active_area.heigh=
t;
> @@ -1236,6 +1260,10 @@ static int starvis2_init_controls(struct starvis2 =
*starvis2)
>  					     V4L2_CID_VBLANK, vblank, max_vblank,
>  					     2, vblank);
> =20
> +	hmax =3D variant->hmax_min_link_freq[starvis2->link_freq->val];

[Severity: High]
Can this cause a NULL pointer dereference if starvis2->link_freq is NULL?
It appears this accesses the val field without a prior check.

> +	if (starvis2->lane_mode =3D=3D STARVIS2_LANEMODE_4L)
> +		hmax =3D max(hmax >> 1, variant->hmax_min_pixel_array);
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-media-star=
vis2-v2-0-3670722d250a@raspberrypi.com?part=3D6
