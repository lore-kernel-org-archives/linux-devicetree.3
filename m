Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199886;
	b=yildYtihDHEy86mK6JVxTsBcazflGD9CF1VmfKGGHn33En8nD/lxJhAYkpSKBM6cR1jS
	 L1HQeFL8opjRiQSbrvYUlzC9bf1peLEzr1Y7kf+KfcH1LKjSfyZNc1/T+Di7wXetjOrhs
	 ainJuoVBgBSbgyiwSfyqcAOkAgMxcRijOwTMDUrtirqQzzLwEoW9I4Fga71zQjOToWvKG
	 FGs8nrf0N8+nHrst9XOmmH8wHvic01ZpCnP6csLBFtFSjdEH0GixQPZfNAu6EYzfsz8Hs
	 JsAqzzcNgcNBtB2f/KJdE5J3GUeoiWPhBMShkUlLWWxJ0MVoFcF/jck/0wElI2bKbzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199886;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CTfNp6sHk3gA68bjl5kjIorXN/QvnGoC1KLAFPwwDpc=;
	b=TOuN5/EGSNIRub7gRbsWc+lLC35ZF9ymTK0E16O4DPybyfEM5jyCG02JuTqCfsw5KwL2
	 vsANh2y1Cyl2XiBcfLUN4U3DuYm+sZgu+IVDJWxWkxE2Wvqg1m3H6JeAMacrIEOaev3Xx
	 ILgsD/kj5j5LcmYefO/hzTquoBOAYcWAEjQNcgd/qyYdc/QUSsTwQIoKvpQNpQeQzhyYW
	 MjEW8aP0+Tc5RSXkQ/TCA8Hdqr/jJsIRqJ9JX+HEr2nhPsFuHfDw69YfD6BKjZIePDMZ/
	 2T4nWmDxkfEeK7HS4SWAwi2bj0pOvQFndU2w3J1whZGvyUbpV8rcfZ7jUkD5EIA3IBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIbKgIzL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD155606A333
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIbKgIzL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265471F000C6;
	Fri, 20 Nov 2026 18:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795199886;
	bh=CTfNp6sHk3gA68bjl5kjIorXN/QvnGoC1KLAFPwwDpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MIbKgIzLq1HZFyOwP+RNgevawTgy//jF1eKoWMI8SdSO4oV6T40VVvFtEYmHqZxUP
	 U7g7bncCCCcRYUQ8lGLL+Pc//JkZVdj49Y4K8O+kE9eUhxNAGZflvJ/QjCOOr+XM14
	 CRpcRqpnRfL9qokhJDh/pmOZ+Gl/VX+7Sao5Q46lBMGOyQ2PWE+GiF4BohMxw9AlcC
	 H+rWLizcc7oJ1rVodfgyv63TLyO/1ql3C4u6eIJvD/lG7Fjmh08mWQXFl8dBoKbh/W
	 aVI2A5a0JIa6VnY9yboprYoIqsF3wTfMrosL8nCY8dihxaZYEUoRZOPQTItZhiMnKq
	 gbQXcqV7M9c9w==
Message-ID: <sashiko-outbox-225853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: Add Samsung S5K3T2 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261120-upstream-s5k3t2-v6-2-dd345fa4201c@proton.me>
References: <20261120-upstream-s5k3t2-v6-0-dd345fa4201c@proton.me>
 <20261120-upstream-s5k3t2-v6-2-dd345fa4201c@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 18:38:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: i2c: s5k3t2: update pad format code on flip in
  s5k3t2_set_ctrl()
--

commit 85ec713a348e49278df044a3a69e78e7c8ca64be
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>

media: i2c: Add Samsung S5K3T2 image sensor driver

This commit adds a V4L2 subdevice driver for the Samsung S5K3T2 20 Mpixel
CMOS image sensor supporting three RAW10 modes on four MIPI D-PHY lanes.

> diff --git a/drivers/media/i2c/s5k3t2.c b/drivers/media/i2c/s5k3t2.c
> new file mode 100644
> index 0000000000000..9b5be8b4e0067
> --- /dev/null
> +++ b/drivers/media/i2c/s5k3t2.c
> @@ -0,0 +1,1365 @@

[ ... ]

> +static int s5k3t2_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5k3t2 *s5k3t2 =3D container_of_const(ctrl->handler, struct s5k3=
t2,
> +						   ctrl_handler);
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +	s64 exposure_max, exposure_def;
> +	int ret;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&s5k3t2->sd);
> +	fmt =3D v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id =3D=3D V4L2_CID_LINK_FREQ)
> +		return s5k3t2_set_link_freq(s5k3t2, state, ctrl->val);
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		exposure_max =3D fmt->height + ctrl->val - S5K3T2_EXPOSURE_MARGIN;
> +		exposure_def =3D min(s5k3t2->exposure->default_value,
> +				   exposure_max);
> +		ret =3D __v4l2_ctrl_modify_range(s5k3t2->exposure,
> +					       s5k3t2->exposure->minimum,
> +					       exposure_max,
> +					       s5k3t2->exposure->step,
> +					       exposure_def);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!pm_runtime_get_if_active(s5k3t2->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_AGAIN,
> +				ctrl->val << S5K3T2_AGAIN_SHIFT, NULL);
> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_EXPOSURE,
> +				ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_HBLANK:
> +		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_HTS,
> +				fmt->width + ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_VTS,
> +				fmt->height + ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_TEST_PATTERN,
> +				ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_HFLIP:
> +		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_ORIENTATION,
> +				(s5k3t2->hflip->val ? S5K3T2_HFLIP : 0) |
> +				(s5k3t2->vflip->val ? S5K3T2_VFLIP : 0), NULL);
> +		break;

[Severity: Medium]
Should s5k3t2_set_ctrl() update fmt->code =3D s5k3t2_get_format_code(s5k3t2=
) in
the active subdev state when V4L2_CID_HFLIP is set (before the runtime PM
check)?

Both hflip and vflip carry V4L2_CTRL_FLAG_MODIFY_LAYOUT and change the Bayer
code returned by s5k3t2_enum_mbus_code(), but without updating fmt->code in
the active state, v4l2_subdev_get_fmt() and v4l2_subdev_link_validate() see=
 a
stale media bus format code after a flip control change.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-upstream-s=
5k3t2-v6-0-dd345fa4201c@proton.me?part=3D2
