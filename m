Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E313D1717
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280061; cv=none; b=NAbIB8OmSv1F2F4+IuwtzxPYv/qcR5RXpK+m7RdW5p+cqJoFm57IAOvCA5rxn6/4Z40HB9Dc5ge2eluvn79iKPtCxa1mlYOuHBgiotNdW8p8NIGoMxr7+AGpfKZ7uqD8hwjTg4GyeBfbxQ+du/1PukdGOOCOKSRJcEjIOFcszPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280061; c=relaxed/simple;
	bh=WSCbbK/9bIFQMPoY+lciUIfyXmvrAUmFMp8rHLToQzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fE3FJ1BKwNVHxRpvmwkBWbdIlWafEytlZrIXG7sNZDu9S24WrBEpY648ANh6vJu9Ozf3v4Cb0aqigStFSWbz95xi/YW7ifkHIylbVs79Cp8awtyJPGXIVpAI62r6m4LIBh57m3RCj0/8AW38RowQOLvpSmaN1fV6wRcrLwp2wr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYcNmEVv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYcNmEVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CA11F000E9;
	Wed, 20 May 2026 12:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779280060;
	bh=k7Tu59hQ2iActr6T9gGMW3uM3gqkkRNO3nlBwqpV2Nw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aYcNmEVvisvIrmH8NdvkDrt58qXHT1PlaWjsX+HGSxFVCDhiHQ4q46/sBWBo2o84A
	 1u6IRrBZ7LJBuWupxmq/IOxeME/B+RXyIdCQ0IPw2R2VP2Zs9WfAmtrXUpVq6x4z5U
	 kJtUseVYVCuukXeMUksGPNEj0XB2WdhpNzYM60fZfWtrzdO34CnEmCC9VubSmKZOxP
	 TVstdqLhIiivFw7e76l35Yvxk6Odh06nJPLLUpFuS6xAdPp7Wa2KFCIjuQKUyHmgrg
	 OIynBiXCWtP9HrctG6/di2KUEDQWWZ70YWrywMdXTFdyGEw/tp3QD/TeGqP/ckl9sp
	 FPxhdoY75ZDEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 01/17] media: ti: j721e-csi2rx: Remove word size
 alignment on frame width
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520120022.539913-2-r-donadkar@ti.com>
References: <20260520120022.539913-2-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:27:39 +0000
Message-Id: <20260520122739.C6CA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing word-size alignment allows odd frame widths, violating =
V4L2 macro-pixel requirements for packed formats.
--

commit 1c8944cd1907204dbed865890aef72e4ff1103a8
Author: Rishikesh Donadkar <r-donadkar@ti.com>

media: ti: j721e-csi2rx: Remove word size alignment on frame width

This commit removes the limitation that the frame width must be a multiple
of the word size, as the hardware does not strictly enforce this constraint.
It updates the format clamping and stepwise frame sizes to a minimum and
step of 1.

Link: https://www.ti.com/lit/pdf/spruj16

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
[ ... ]
> @@ -360,23 +352,15 @@ static int ti_csi2rx_enum_framesizes(struct file *f=
ile, void *fh,
>  				     struct v4l2_frmsizeenum *fsize)
>  {
[ ... ]
>  	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> -	fsize->stepwise.min_width =3D pixels_in_word;
> -	fsize->stepwise.max_width =3D rounddown(MAX_WIDTH_BYTES * 8 / fmt->bpp,
> -					      pixels_in_word);
> -	fsize->stepwise.step_width =3D pixels_in_word;
> +	fsize->stepwise.min_width =3D 1;
> +	fsize->stepwise.max_width =3D MAX_WIDTH_BYTES * 8 / fmt->bpp;
> +	fsize->stepwise.step_width =3D 1;

[Severity: Medium]
Does removing this alignment entirely allow invalid widths for packed
macro-pixel formats?

For formats like YUYV (YUV 4:2:2), the V4L2 specification requires widths
to be an even number, because a single macro-pixel represents 2 pixels in
4 bytes.

By hardcoding step_width to 1 and removing the width rounddown in
ti_csi2rx_fill_fmt(), userspace could request an odd width like 3.
This results in a bytesperline calculation that physically cannot hold
full macro-pixels, which may lead to stream desynchronization or unread
data in the hardware FIFO.

Should we fall back to format-specific macro-pixel alignment using
something like v4l_bound_align_image() instead of removing all alignment
constraints?

>  	fsize->stepwise.min_height =3D 1;
>  	fsize->stepwise.max_height =3D MAX_HEIGHT_LINES;
>  	fsize->stepwise.step_height =3D 1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D1
