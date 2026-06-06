Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF926AF4
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780723022; cv=none; b=f4Bp0g1W7M8+NxILC/OPZMxTurbkAoczxHxPCIIuewkdfhHB9eAi6Jcl3BKmUAZRXX5RKKOy4ciLVlDqrvuyLkMs15CHuj+opvrwr0RLDZPsLo/un6CmJuvaZ46RKGcZ/56pUi57ih4VBT/zHLs9C5zb5Kv3+ua3HLk+jVzftHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780723022; c=relaxed/simple;
	bh=ApwgZ0P89xFpWrYDY7+QyrgcIQl93APnzbkOQ/o1XZ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SwxjzE2HHRhfU30nSVGKIpVQukmTjbnUNfQDiHOixFdqDQaM2AvI3Amfp6yO8yvx/VotezaoMtSzUleiEtgjmwNzbiMS8WTvpg8/FAiUTa8SlqC3Oh3svfCL91usLhYIU5r895wDNq4T1eOwlFRpt4Cq04XwCN5WuB6EwEVaaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lhr3NnSz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lhr3NnSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F021F00893;
	Sat,  6 Jun 2026 05:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780723021;
	bh=Z+vUT6ASl/W9wavZsQkTnSdOSYy2iux4uoddAcnjSLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lhr3NnSzDZWEgupsHqErKRsoj06dqcSRM8Ww2K/3tWesyelVqxQ+TRAt+A1UvdRJq
	 mF8V9Whl5zdOiVdMD9P1ylfuARkdAyAEVOFpZuo7zn8uDoQbSF9tmyDU7LddGBDv1h
	 qlgxiGDddgmibk5o3VI1SAQ7SpCwK4oDDaem0Bbt5mtRJ/Mn3A5zvTGAAjjB7lFCMT
	 pnVuXWISpOWNI8r/rIpZ8OpoMXRVUSZmQ/PkjSBfndUBIeLscrEFH/apR2/Vx01yzY
	 lKcdpgqCUVH2blT+PPfRWqhhO1cGgh2RghozsHj2/N6uC2EZ2pkZel3y9y25Yfq50X
	 OtcgrMkJqTohg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/14] video: backlight: lm3533_bl: Implement
 backlight_scale property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260606045738.21050-14-clamor95@gmail.com>
References: <20260606045738.21050-14-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 05:17:00 +0000
Message-Id: <20260606051701.51F021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Sysfs show functions `show_linear` and `show_als_en` incorrectly t=
reat a set hardware bit as an error, leaking uninitialized kernel memory to=
 userspace.
--

commit 5b473ee9a07b0b9fd223194515f44e1ffe1b934d
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: backlight: lm3533_bl: Implement backlight_scale property

Since the device supports linear and non-linear modes, implement the
backlight_scale property to describe this state.

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index 4f8cde9f290d0..2aa4b86042ff2 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -142,6 +142,7 @@ static ssize_t store_linear(struct device *dev, struc=
t device_attribute *attr,
>  {
>  	struct lm3533_bl *bl =3D dev_get_drvdata(dev);
>  	int ctrlbank =3D lm3533_bl_get_ctrlbank_id(bl);
> +	struct backlight_device *bd =3D bl->bd;
>  	unsigned long linear;
>  	int ret;
> =20
> @@ -153,6 +154,9 @@ static ssize_t store_linear(struct device *dev, struc=
t device_attribute *attr,
>  	if (ret)
>  		return ret;
> =20
> +	bd->props.scale =3D linear ? BACKLIGHT_SCALE_LINEAR :
> +				   BACKLIGHT_SCALE_NON_LINEAR;
> +
>  	return len;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but looking at the adjacent
show_linear() and show_als_en() functions:

drivers/video/backlight/lm3533_bl.c:show_linear() {
    ...
	ret =3D regmap_test_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
			       CTRLBANK_AB_BCONF_MODE(ctrlbank));
	if (ret)
		return ret;
    ...
}

If the hardware bit is set, regmap_test_bits() returns 1. Since the check is
if (ret), it immediately returns 1 to the sysfs core without calling
scnprintf() to populate the buffer.

Does this cause the sysfs core to interpret this as one byte successfully
written and copy the first byte of the unwritten buffer to userspace, leaki=
ng
potentially uninitialized kernel memory?

Should the check instead be `if (ret < 0)`?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606045738.2105=
0-1-clamor95@gmail.com?part=3D13
