Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A8D3B6362
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523149; cv=none; b=N/mslXQTEKZfaLIjeMMJ/Zo+jyBAMALWWlS02fU/QkTBdk81FjJI3W6gnEiEisXTa2s/shKHaVzkco+BGZlOR0yu7mGclW/tbrEd4DSwQFHB8Hl3zJGQM2xBnSW+Jpwu4bg/X0YpmrE6GnjaT5bQ06h6403JG6wpW8By9DaIIKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523149; c=relaxed/simple;
	bh=oXOzuwH5zL17K3Q+fNRhq/2lW6pn5k8SWfF10ofZRDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WodRXsNnbYYaVfBcaS0bRoTQZYKhzAMaJ93NeEsdXQ2mCOplNTe5XaT2PXBzuOEtQDqwXr6ft6qaWvGlywprBv9dKzwxWAGb8T2h5SY8j22LwI6EISOO5iT/aaZWxw2CfNXrJju+giwXpnILZqyc2LRxZeSyRJZA+soKrLAdEfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Puq3jqpz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Puq3jqpz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A361F000E9;
	Wed,  8 Jul 2026 15:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783523147;
	bh=BxHydh36d4jcbqN8diW5hVG30qlFHT0ZuBALUp46cko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Puq3jqpzj+d6zCsyXr0AZ9oIMN758nZv757b/RXJApOvc1YrcoYhL1BMry6tIXPnh
	 MOVztvQtCaaHa5jcp1rsHLq3HMNjBLE6O0hHmT/zcBxTaRUXwgiSbdDu8umtSF0BQw
	 jhh3wpl2zule5hAOmbqD3wFEjbGNZUUgHGm+vIdnjnyA6Y7b+IBQ4xGXly2qev/eHp
	 PQnHbvVfTH3oth8k/mrU4/nQccpI1nDSmuw6b9l72L8tMmu5g+5fjkil5Yo9THnuoa
	 1QSGUQgcLkextXkzFGa/P7+3AHYXZsVUQpZn2aocuyQ66a1CfOR6cW//F3iXmxX2a2
	 ZfFwbp32SrN7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/20] media: imx355: Remove redundant fll_min, and
 implement fixed offset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-media-imx355-v3-10-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-10-9df386a623d7@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:05:46 +0000
Message-Id: <20260708150547.13A361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] When changing the format via `imx355_set_pad_format()`, the driver=
 attempts to reset `vblank` to its default value using `__v4l2_ctrl_s_ctrl(=
)`. It relies on this call to trigger the `s_ctrl` callback (`imx355_set_ct=
rl()`), which updates the `exposure` control's maximum limit based on the n=
ew format's height. However, the V4L2 control framework explicitly optimize=
s out calls to `s_ctrl` if the new control value equals the current value. =
If a user manually sets `vblank` to a value that matches the target format'=
s `vblank_def` prior to a format switch, `s_ctrl` is skipped and the `expos=
ure` bounds are not updated. This leaves the control completely out-of-sync=
 with the new format's Frame Length Lines (FLL).
--

--- Patch [10]: [PATCH v3 10/20] media: imx355: Remove redundant fll_min, a=
nd implement fixed offset ---
commit 3cb4d69cef75e79b15075f8e2c250b2bb53d96a4
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: media: imx355: Remove redundant fll_min, and implement fixed offset

This commit removes the redundant fll_min field from the imx355 mode
configurations, as it is always identical to fll_def. It also sets a fixed
minimum vertical blanking (vblank) limit of 20 to improve the maximum frame
rate achievable across all modes.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 2a97e076bff76..c6f27cf269b40 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
> @@ -889,10 +874,9 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  		/* Update limits and set FPS to default */
>  		height =3D imx355->cur_mode->height;
>  		vblank_def =3D imx355->cur_mode->fll_def - height;
> -		vblank_min =3D imx355->cur_mode->fll_min - height;
>  		height =3D IMX355_FLL_MAX - height;
> -		__v4l2_ctrl_modify_range(imx355->vblank, vblank_min, height, 1,
> -					 vblank_def);
> +		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_VBLANK_MIN,
> +					 height, 1, vblank_def);
>  		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in how
exposure limits are updated during a format change in
imx355_set_pad_format().

The code relies on __v4l2_ctrl_s_ctrl() to reset the vblank value, expecting
it to trigger the s_ctrl callback (imx355_set_ctrl) to update the exposure
control limits.

However, the V4L2 control framework optimizes out calls to s_ctrl if the
new control value matches the current value. If userspace manually sets
vblank to a value that exactly equals the new format's vblank_def prior to
the format switch, the s_ctrl callback will be skipped.

Could this leave the exposure limits out of sync with the new format's Frame
Length Lines (FLL), resulting in userspace seeing stale limits and potentia=
lly
setting an invalid exposure value?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-media-imx3=
55-v3-0-9df386a623d7@raspberrypi.com?part=3D10
