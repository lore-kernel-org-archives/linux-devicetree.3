Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A89C2931FC
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058277; cv=none; b=Sld/Yrn4Mql6CLYrIqD2bm5tzv5s4oBA5bvnFTF3ZWQnNzOA9ZFHa6UE6R+/3ba/4kNEqZch+NyM9JC/65yIYa9NZTmQAfuwZZXBL1WMm8wMuPzGOYbSXdUSdCzna5Q3Z5h4cins98JCRyRabxRNEbMrXY9ahSlpyOG+uzIb2iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058277; c=relaxed/simple;
	bh=r4KcR4ET1+RlP/YZGqLh5iHtDvY1PaES7s6GmU67koY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V3wmKfyMnLeYQdkGuIVYuKelzVzzlnBYlkvIQoN0W8IFonlyBTGl34qAKAslRRuxMEifqd0a/3IkuSZMzUbLbONtmN5rI7RW9CRGoSa0ScKk2v5GV3dFJyIEJTOwbMPWa/hdI51C/aVcB0poTr4o5MQbr5X5v/Gq7R+qmzce0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUeGJVr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUeGJVr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FDE1F000E9;
	Tue, 14 Jul 2026 19:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784058276;
	bh=2ZrqV4wUQ0JqphfXOJZWHIB2ckX0Zv2yV9YHnTsjtpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUeGJVr6Nf4J1GmwXZQzIRp7FGSi6hHp/YJ8hrNp6o/mtBega6JpVXxvQQPS35sNv
	 3sFK6lmOwUedA/YwupW2ru+bqao0UMqaNuTNVsUA4uRh1rpKQHS0odpVjLZ2Qas/b9
	 noqTjJAe/ADbRCe3euLPrntkF4JIN/JYibrEWlY1Ls+vrNbEZbLFY+x7r7duoKDwwM
	 yCvbRJ6JqXnC5uvrgIVzlCRleKUjSJpwE5S6AqQzE0/RzgvfMXi+ijB06s3eo+a0RY
	 J6MiVXIJXh613CUH0zfsp8vFzQYJl0Nqny4nL1LEaBkAriSmmhE7PjED+hSDVItC2f
	 wu3wSbo+4zBHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: rockchip: Add RV1106 pinctrl support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714132531.v2.3.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
References: <20260714192535.2082729-1-sjg@chromium.org>
 <20260714132531.v2.3.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 19:44:35 +0000
Message-Id: <20260714194435.E9FDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] `rockchip_get_drive_perpin()` lacks decoding logic for the expon=
ential drive strength encoding used by RV1106, returning heavily truncated =
and incorrect values.
--

--- Patch [3]: [PATCH v2 3/3] pinctrl: rockchip: Add RV1106 pinctrl support=
 ---
commit 665d35cf92d5b01cd2a3d9d6d9a796fd3a3aea13
Author: Simon Glass <sjg@chromium.org>

pinctrl: rockchip: Add RV1106 pinctrl support
   =20
This commit adds pinctrl support for the Rockchip RV1106. Each GPIO bank
has its own IO control (IOC) register block. The drive strength uses the
RK3568-style exponential encoding.

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index 7e0fcd45fd265..0589a7a0879f7 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
[ ... ]
> @@ -3310,6 +3390,7 @@ static int rockchip_set_drive_perpin(struct rockchi=
p_pin_bank *bank,
>  		ret =3D strength;
>  		goto config;
>  	} else if (ctrl->type =3D=3D RV1103B ||
> +		   ctrl->type =3D=3D RV1106 ||
>  		   ctrl->type =3D=3D RK3506 ||
>  		   ctrl->type =3D=3D RK3528 ||
>  		   ctrl->type =3D=3D RK3562 ||
>  		   ctrl->type =3D=3D RK3568) {
>  		rmask_bits =3D RK3568_DRV_BITS_PER_PIN;
>  		ret =3D (1 << (strength + 1)) - 1;

[Severity: Medium]
This is a pre-existing issue, but does rockchip_get_drive_perpin() need to =
be
updated to handle this exponential encoding?

While rockchip_set_drive_perpin() correctly applies the 8-bit exponential
encoding for RV1106 here, rockchip_get_drive_perpin() seems to lack the
corresponding decoding logic.

When pin_config_get() is called for these pins, it appears to fall back to
DRV_TYPE_IO_DEFAULT, truncate the hardware register value to 2 bits (since
rmask_bits defaults to RK3288_DRV_BITS_PER_PIN), and look it up in the lega=
cy
rockchip_perpin_drv_list array:

drivers/pinctrl/pinctrl-rockchip.c:rockchip_get_drive_perpin() {
	...
	data >>=3D bit;
	data &=3D (1 << rmask_bits) - 1;

	return rockchip_perpin_drv_list[drv_type][data];
}

Could this lead to incorrect readouts for RV1106 (and other modern SoCs) via
debugfs or pin_config_get()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714192535.2082=
729-1-sjg@chromium.org?part=3D3
