Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111BF43932B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523325; cv=none; b=FgZ1L7UwHfzgB7ovNGG882B80o3tmHQn3Pxxga9MqQg0YckKuM2DhuDNNYDJxFgthN+5cCO46awP2eXpcKPTbLRZMKye5cNk6mohpkd/u0atm0T50y537jrR+CaKhGp1e7pHMgubMvQpYckZG2egfZENcCfgSv48YjUVclTj7Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523325; c=relaxed/simple;
	bh=gzdUnbirfD1ic+i7KeVSCwI0oDY0efvV1fi9UeKTp8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lXfQVa7KFsWTfDGxml03AcpAyfpxuLCaDFkK0ADbsu6W69TnGti+cO+t3JZFeJCrM9rTYmebmnOYGYmVsUXNUOjdEkIAQvb3LtoKvDXEurScGdpnibJA8XpDbGvvDvcQGoS01+bI1Fw9g9c25lt4aAydey6XtryqyZncz0ioy2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5Tiz2Q0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5Tiz2Q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C22C1F00A3A;
	Wed,  8 Jul 2026 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783523323;
	bh=CSUY+DcJFv/TVH7azOySxTVVhLEqq0djmY0f47HoM2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M5Tiz2Q08MMjkwOaXJh83MqkpX2XXYSl0BEvI2n94J5fIjHYf2XZrPd8XL/IWanlE
	 obkk7844AltUnGAhRlGok2RsNZpYC/h7/rUFTxoQmqKLCj/5rTd4QKmZivQn2WgjO6
	 tmllUvqutzgMxY7ehQWtt8B626YqFzUxomSXjRbQPvn5CeeuBY/vLFfzrMdBEGfAez
	 EagT6FE7rpLdR59s//Xw+DVbHBgrNubNYrGl40blLw0P02k4iXqOqpG704HHp8pJBz
	 DjHvg7QbPGhZQTRBEQOF02l2A1L7M3uTpepHt2/YEG+YPNuG8TykYE+eSfQNJ5VCyf
	 a3my/ZIXUrd3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/20] media: imx355: Convert to new CCI register
 access helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260708-media-imx355-v3-13-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-13-9df386a623d7@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:08:42 +0000
Message-Id: <20260708150843.6C22C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing lock when calling `__v4l2_ctrl_grab` in `imx355_set_stream=
` leading to data race
--

--- Patch [13]: [PATCH v3 13/20] media: imx355: Convert to new CCI register=
 access helpers ---
commit fe9b8fcf594a4a8149bc0b6b2e99148353f94fe2
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Convert to new CCI register access helpers

This commit replaces the private register access helpers in the imx355 driv=
er
with the new common CCI register access helpers.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index f01a1a5ae7c9a..b27329143e481 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
> @@ -1096,14 +981,14 @@ static int imx355_set_stream(struct v4l2_subdev *s=
d, int enable)

[Severity: High]
Does this code now lack a lock when calling __v4l2_ctrl_grab() in
imx355_set_stream()?

Since the outer mutex_lock(&imx355->mutex) was removed in this series in
favor of localized locking via v4l2_subdev_lock_and_get_active_state(sd),
the __v4l2_ctrl_grab() calls appear to be left unprotected:

    if (enable) {
        ...
        state =3D v4l2_subdev_lock_and_get_active_state(sd);
        ret =3D imx355_start_streaming(imx355);
        v4l2_subdev_unlock_state(state);
        ...
    } else {
        imx355_stop_streaming(imx355);
        ...
    }

    /* vflip and hflip cannot change during streaming */
    __v4l2_ctrl_grab(imx355->vflip, enable);
    __v4l2_ctrl_grab(imx355->hflip, enable);

__v4l2_ctrl_grab() modifies control flags and invokes send_event(), which
iterates over the event subscription list (ctrl->ev_subs).

If userspace concurrently calls VIDIOC_SUBSCRIBE_EVENT or
VIDIOC_UNSUBSCRIBE_EVENT on the flip controls while another thread starts or
stops streaming (VIDIOC_STREAMON / VIDIOC_STREAMOFF), could this cause list
corruption and a kernel panic?

Additionally, __v4l2_ctrl_grab() asserts lockdep_assert_held(), which would
trigger a lockdep splat if the control handler's lock is not held.

>  static int imx355_identify_module(struct imx355 *imx355)
>  {
>  	int ret;
> -	u32 val;
> +	u64 val;
> =20
> -	ret =3D imx355_read_reg(imx355, IMX355_REG_CHIP_ID, 2, &val);
> +	ret =3D cci_read(imx355->regmap, IMX355_REG_CHIP_ID, &val, NULL);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-media-imx3=
55-v3-0-9df386a623d7@raspberrypi.com?part=3D13
