Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE8480974
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522866; cv=none; b=fZLz9NycAC1q29hsoXSkkIxLYnG8YlFs/og6zxXvOKJUvMMIv8iyJnJD68RLYttNLXdJDejIVKoXFkaMMY+4eYAEiPz/nvrXAmRxvSADvRLt2bxVDfWjStMqJKbpTzgSmAR84QXuCKOKmOd6sNKXC27feGbrErRg+ZDkT6gYHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522866; c=relaxed/simple;
	bh=6pPID5AnqBALfPzH9QQzHGTWJyhEQt5aH04rkd0kJhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g5OALk7dOewGSv04P6ibZaE/7b5ZvqbOXZsAWdSPQ5U8x8sp586/5SEJnxscuQwswAr+aEjsh/mQ+5CsGNLVTQt8yRbU6efr9ZmVdDz1ZleBE+/Qt4zxkBuOmYLsF8+ZdbiwTOmX1QD4mKMhRdEIYX/keceEbTrkTwzRTy7WwqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epirE2Kg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epirE2Kg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D626B1F000E9;
	Wed,  8 Jul 2026 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522865;
	bh=QgofbTx4JFx7jIrAIeDkQGcOni6/kZHe7xXZRmErWQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=epirE2KgyBTrwg2C46e7ym+orm40hlWRN3gs8uhI3WDHrD3JYLZ2ZZd2R/oMdHVoF
	 TbM6RcrcVQxFzwE+/cZmhVbFqvM4YprLQ92SkHIH5YAor1hibhuD1MijekubNWTANM
	 f/GeafJOS9H9i4Bqmy75hriDvn+aVb2sFE8NxCkZd3/NWfjNulqJ8v2XAqcVEpGDBT
	 gNUZyt/PbcALSunGjjHF7ydvvhnPAiOupByecAObtN+StjCDGeeMLUBi+mMV8XL124
	 RYIaihX4jWHSdlkF5SmeWzyZAXSnrWX3/TPQsgDCHXBdSzxPGfbmRUlVwz5pkHJEuM
	 OO/PGmmRrJFsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/20] media: imx355: Set the colorspace in the
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-media-imx355-v3-14-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-14-9df386a623d7@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:01:03 +0000
Message-Id: <20260708150104.D626B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Accessing a non-existent `format` field on a `struct v4l2_mbus_fram=
efmt` pointer leads to a build failure.
--

--- Patch [14]: [PATCH v3 14/20] media: imx355: Set the colorspace in the f=
ormat ---
commit 7db2a6f63330856f1837e4b7a0ae932c8ac63b94
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Set the colorspace in the format

This commit sets the colorspace fields appropriately for a raw image
sensor in the imx355 driver.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index b27329143e481..2bf8da7469fe5 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -612,6 +612,10 @@ static int imx355_open(struct v4l2_subdev *sd, struc=
t v4l2_subdev_fh *fh)
>  	try_fmt->height =3D imx355->cur_mode->height;
>  	try_fmt->code =3D imx355_get_format_code(imx355);
>  	try_fmt->field =3D V4L2_FIELD_NONE;
> +	try_fmt->format.colorspace =3D V4L2_COLORSPACE_RAW;
> +	try_fmt->format.ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +	try_fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +	try_fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;

[Severity: Low]
Does this cause a build failure? try_fmt is a pointer to struct
v4l2_mbus_framefmt, which doesn't contain a format member.

Should this access the fields directly via try_fmt->colorspace and so on,
similar to how try_fmt->height is accessed just above this change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-media-imx3=
55-v3-0-9df386a623d7@raspberrypi.com?part=3D14
