Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425043934F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523487; cv=none; b=CMseFnfKHTEnLa62pv8BuDJxTJA4/sKFhputTmcX8R6F4mzv8dfdzqBVWlNw+RNurLosYP/gsnk5TjqRdy16YURn69eVI/jirgrdXgUcUzZ2ywZB7PhAzy4fwp6b1stBzUpbUoXzpKHgaJEt0NAzhr61iHfIxWmDBO06vmZaF94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523487; c=relaxed/simple;
	bh=30ZPcafs78YQ+m2F+wyWdO96dGfQcgw929U8pPjA4U0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=krXiDIIJI+zSObRRNqp3P6AsoO0lZ3NRSwIywwq8t7j1DRku9QjjqJx4F3/igPsZPlcxB6IFYiIRTTzOZcIdtgfF50cGNLRGBtPOIe7SfWUqcfU1Ec/VfJMfFu3O/+iVtDNRt2C0nHt/+eexjyK/8IOzDna+ni1JH80AsAqt2Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7s9Yixq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7s9Yixq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173341F000E9;
	Wed,  8 Jul 2026 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783523486;
	bh=R2G+WOkftIiehbZlLQ6OgbqKnu4qIXTKMKTFN2H7ksQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U7s9YixqaUMjkgTUU4RbITGEin2JZjisDIAKVxE0laVsZlQbXtbTg/lreWqj84vHu
	 PQfd+ZT/foIOKfvFwsexdl6fw08V1pz08rvl9xfV1Ulr4QfIQmQGQIfvEgEBa40t/H
	 V+BH/bJz4Do1WR3IISsLAzigus4TAcL/NqwWKhaQZEJHcXJOASZgASiLQ5WyUjLEEM
	 X3/wgLz748SeoqyoiBzlP7R5a9U/a9AZj8JdUgDqp2N8R1rVS9Gqqm/Dmr05qBG/0G
	 62M6AjTtKZXKKbmmL35T49bwZU3r41unMsvZVk8t2t0fNGEiiqXxHv4vaMEarEqXHl
	 3iPaPxuXcJO9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/20] media: imx355: Add support for get_selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-media-imx355-v3-11-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-11-9df386a623d7@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:11:25 +0000
Message-Id: <20260708151126.173341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undeclared variable `crop` used in `imx355_set_pad_format()` causin=
g a compilation error.
--

--- Patch [11]: [PATCH v3 11/20] media: imx355: Add support for get_selecti=
on ---
commit 16a5ac6200fbe4b75d8e6b726a26958a450dfdf0
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Add support for get_selection

This commit provides all cropping information via get_selection. It updates
the subdev pad format operations to maintain crop rectangles in the try sta=
te
and implements the get_selection callback.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index c6f27cf269b40..ee1f41a66a0b6 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
[ ... ]
> @@ -869,6 +877,12 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
>  		framefmt =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
>  		*framefmt =3D fmt->format;
> +
> +		crop =3D v4l2_subdev_state_get_crop(sd_state, 0);

[Severity: Low]
Does this code introduce a compilation error? Looking at imx355_set_pad_for=
mat(),
it appears the crop variable is assigned and dereferenced here but is never
declared as a local variable within the function.

> +		crop->width =3D mode->crop.width;
> +		crop->height =3D mode->crop.height;
> +		crop->left =3D mode->crop.left;
> +		crop->top =3D mode->crop.top;
>  	} else {
>  		imx355->cur_mode =3D mode;
>  		/* Update limits and set FPS to default */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-media-imx3=
55-v3-0-9df386a623d7@raspberrypi.com?part=3D11
