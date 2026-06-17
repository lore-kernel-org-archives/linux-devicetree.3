Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024EE3F0A9F
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699486; cv=none; b=gRQhtBZwIL3ZukeZBRGrhH86sKkCJ6ZWneFiKTzD9s0D15ARu9NAkdF0MYBkOcTO7c0Cs/QduOq2id6i3Qy+R7kXQmcbSTry1so2Q4uwK6O0t7242C5tix/LC8wukYoIgRRhqmBuLIlE/un+JjrggaE2l6OCbH9oBYZ4gjwxMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699486; c=relaxed/simple;
	bh=Ec2O03+8FL79cABuBc08lOUQlC3R5Ia0iaAbOWW9Qbs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gR6V0xpQZtFe7XJcr/uLUbqXD4gpUZXF3Y3J8DeSDZ09N32kuWLeGnLgnniDGxslwsCEdtM+fT5qvN64T0w8ZPJpCdPtm1h7IJ5U/jVYGhlChShAEtZ+EvkfHDDnjHD7CgL6pGvM+TJG5SYwmYKsf4rvNZRC8leSqaZYLQjWJS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lV7H05Rq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lV7H05Rq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76D91F000E9;
	Wed, 17 Jun 2026 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781699484;
	bh=eazbb0s9Zzrv47U0UWMgcTY7KPZuo6+Xj9akgfjv5Bk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lV7H05RqKV8yrqDAxr0l/CiM7ocXK2eVD+uvb1y5HnhiUNMxBKvxkpf6YHnZNQKeK
	 d0XlVnYcO3eeLYm747KXYOpxgDUBBeI6mR4YBxRkE1hDi4fMNcFmIsDvEzQll6x5FJ
	 ctA56dkA06EnQH9o7iViG3BieafHxy3g0Q4l19sVjD2F3TWmBrsp+dcBUvrqA/Ljou
	 eAuXTuVgEegrtYGu8R512E7an1AhjbS3/yPuZNZYO2dClHBrU8gMDSTTf4hlcpIiXz
	 +/s2hef34Xn4l7znAbcG7En0ByCafjO36iu4b7Q9WxIh7PUf+nnrgeh1nhFcb3kh7C
	 zEErXy/inB9lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix
 rk1808 hsfreq table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gerald Loacker" <gerald.loacker@wolfvision.net>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260617-feature-mipi-csi-dphy-4k60-v1-1-4611ff00b0ff@wolfvision.net>
References: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
 <20260617-feature-mipi-csi-dphy-4k60-v1-1-4611ff00b0ff@wolfvision.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 12:31:23 +0000
Message-Id: <20260617123123.D76D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Valid low-frequency ranges mapping to configuration bit 0x00 are i=
ncorrectly rejected as errors.
--

commit 73e8683965255c344bec41b44d480c1cece33b57
Author: Gerald Loacker <gerald.loacker@wolfvision.net>

phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table

This commit extends the final entry in the rk1808 hsfreq table to exactly
2500 Mbps. This allows the RK3588, which reuses this array, to fully
support rates up to 2500 Mbps.

> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/p=
hy/rockchip/phy-rockchip-inno-csidphy.c
> index c79fb53d8ee5c..5281f8dea0ad3 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -170,7 +170,7 @@ static const struct hsfreq_range rk1808_mipidphy_hsfr=
eq_ranges[] =3D {
>  	{ 299, 0x06}, { 399, 0x08}, { 499, 0x0b}, { 599, 0x0e},
>  	{ 699, 0x10}, { 799, 0x12}, { 999, 0x16}, {1199, 0x1e},
>  	{1399, 0x23}, {1599, 0x2d}, {1799, 0x32}, {1999, 0x37},
> -	{2199, 0x3c}, {2399, 0x41}, {2499, 0x46}
> +	{2199, 0x3c}, {2399, 0x41}, {2500, 0x46}
>  };
> =20
>  static const struct hsfreq_range rk3326_mipidphy_hsfreq_ranges[] =3D {

[Severity: High]
This is a pre-existing issue, but while looking at these frequency range
tables it appears that valid low-frequency configurations are incorrectly
rejected as errors.

In rockchip_inno_csidphy_configure(), the code iterates through the
hsfreq_ranges to find the cfg_bit:

drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:rockchip_inno_csidphy_conf=
igure() {
    ...
    if (!hsfreq)
        return -EINVAL;
    ...
}

The rk3326_mipidphy_hsfreq_ranges table defines an entry for frequencies up
to 109 Mbps with a valid cfg_bit of 0x00:

    { 109, 0x00}, { 149, 0x01}, { 199, 0x02}, { 249, 0x03},

If the data rate falls into this lowest range, hsfreq is correctly set
to 0x00, but the subsequent if (!hsfreq) check evaluates to true and
incorrectly returns -EINVAL instead of applying the configuration.

A similar issue appears in rk_dphy_configure() inside=20
drivers/phy/rockchip/phy-rockchip-dphy-rx0.c with tables like
rk3399_mipidphy_hsfreq_ranges which has { 89, 0x00 }.

Could this validation be modified to verify if a valid match was found=20
during iteration rather than checking if the resulting configuration bit=20
is non-zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-feature-mi=
pi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net?part=3D1
