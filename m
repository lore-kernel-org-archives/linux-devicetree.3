Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865402DC78C
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217227; cv=none; b=OI5tIbrHqccIsQAEwvGbGqiFsgm/lEAawg6gpOfynDLSfuKADAEs3rtYX4tiSQOg5m7oWnSZm74C+brgt2XHaDdVPEKTJiOUeJsGnxBDY9o6zh7AS/dtpKNfTY4/2yE1+BJM4p2GcMAuK30mb5yp3RtqTpMUf3toTuKqEhUbL/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217227; c=relaxed/simple;
	bh=LN7C24IY1zz3hj+bQU+SHtep3LHzIMh4pZ1NtbKnEPs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l+uMF0Y147aBTMJRzj/eFgkPfxrQjlAqMMO8Ik6UxkxSNh4sspLObxsmGryZAcBtePAsHuMZAkbVvxeHwAnG3NIKxCdQ4b4RiF7sfZkzo1f3BJ5kiwDmOlkKZvYxJig4k7QZ0NnyyT+JOC+uNBUxqi5gmJvY7F/nE2YQRiNEilI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfHxkHb4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfHxkHb4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F981F000E9;
	Tue, 23 Jun 2026 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782217226;
	bh=U8w6tNmTW5hvj4zK5ENEJCd6be1vNRnbus83IB3kALg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KfHxkHb4hyz5ia30kj4bnOacrw4PCkoISRyq8eOjWhdC92FkyUYAeWxIqDb2B396V
	 Sw5+cRXxQykMvI4cGp5zr5BZY2ENVE3pUzAOFi6P9gBKX7g+hmR1somxhV0zCNHej9
	 R7H1uqKCOTyFgRJztYUrmvpiFSpiB5dCMNfqXF4XURQXcwRqMXGZNeJ2G0+DEulQb1
	 f/mi8bLtQUvaYmWW+e8m4PHo1F280NDApjTJLEsfEkVxxFmvNpUjIMMZb3bMttGxG4
	 ihVUP1wr/wBiTvh+SJ/OGvGJ5QZICI2qNUpC61rG/JvZp5oeQb+m1Q4GkXbDWmyZto
	 de0pUVOXLzAGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/12] ARM: dts: microchip: sama7d65_curiosity:
 Enable ADC, DVFS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260623105944.128840-9-varshini.rajendran@microchip.com>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-9-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 12:20:25 +0000
Message-Id: <20260623122025.94F981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `&adc` device tree node override is not sorted alphabetically, =
violating device tree formatting guidelines.
--

commit 922e23aeb754d170e8991198310689112a690505
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65_curiosity: Enable ADC, DVFS

This commit adds the regulator, pinmux, and enables the ADC for the
sama7d65 curiosity board. It also adds the cpu-supply regulator for DVFS.

> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/ar=
ch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 927c27260b6cc..a6a44a176f565 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -97,6 +97,18 @@ &can3 {
>  	status =3D "okay";
>  };
> =20
> +&adc {

[Severity: Low]
This isn't a bug, but should the &adc node override be sorted alphabetically
within the device tree file?

It is currently inserted after &can3, but standard device tree formatting
guidelines generally require node overrides to be sorted alphabetically to
maintain readability and reduce merge conflicts.=20

> +	vddana-supply =3D <&vddout25>;
> +	vref-supply =3D <&vddout25>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_adc_default &pinctrl_adtrg_default>;
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623105944.1288=
40-1-varshini.rajendran@microchip.com?part=3D8
