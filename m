Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F347DD58
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983269; cv=none; b=uWFCz1D+kWcfZ8CEdD8cC9BuBoqgthBdMT1L9oZXIIgIJ4zBF8difNGWcsN1+faM2E8BnH2LjVse9oF+km5WnnHKXHoS6gRUuANDO8OzbeVN5w22KYNYYoBEN9UVC7Hf3X88JvEQpwA7DcefMQ4GscMOcYW1UTbVFDcGW6k+OSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983269; c=relaxed/simple;
	bh=HBkefB7x96oKwGQlLbHmpLtBxzPdAGJ1kHf71RbfxgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jduBnR51l/8OnJ1YnhtfrhxzLV+dinVR2nhJIbZlEYui3JPBwIE7nT+sYP+M/3iPbiQ4TetTJhfSksxSbLX3nmdh/KXrCUuVQ79W28zWuZ2cQ9gA6mWirhHLqtkuFaa15os+M2cN/VQu8LSrL2+e4VrPBxtD4pNUBXH9ftFkQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkwwL2r5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkwwL2r5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2958F1F00A3D;
	Thu,  2 Jul 2026 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782983268;
	bh=sfQJdhwPVhbgBEzXkE4VFdyHCTHzwch5B9PKJQndVC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SkwwL2r5og6rnIgfBI20ws6S4k9k61CMC7CeqzNYiBwv6bmPo9ovpxERtmW374D6P
	 xqJUE7KVpIINkO/hXMRdEq2TFULnyEkej73mM6ehZs+dKs/cWOy/MW/2/pizLCBArm
	 o7gyGFRbgV8vBbNz2MYv2nXbgSnyDOgsBElvvHCRbGd7NMi8rQXwUO5PArFFnAzQgI
	 ChDDhyK0cR6+qcgq1ADd7RS4AUw5FQFPyipAMjcGWcnsxjhnr4P/9ONUNy634ZrQh/
	 iMAbIlnuCoRO2k+Ndc22kc2U98sWgc44y7UMTcP3qIi339MTdaL9C7EDe7tvM8hwI+
	 yEc93BnT8FOCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: realtek: Add GPIO support for
 RTD1625
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702090115.2564318-5-eleanor.lin@realtek.com>
References: <20260702090115.2564318-1-eleanor.lin@realtek.com>
 <20260702090115.2564318-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:07:47 +0000
Message-Id: <20260702090748.2958F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Device Tree mapping conflict where two distinct GPIO controllers=
 claim the exact same pins from the `isom_pinctrl` controller.
--

commit ca40dcb33ea07a0408e101ec08ff651fed48479b
Author: Yu-Chun Lin <eleanor.lin@realtek.com>

arm64: dts: realtek: Add GPIO support for RTD1625

This commit adds the GPIO nodes for the Realtek RTD1625 SoC.
It configures multiple GPIO controllers and establishes their=20
pin controller mapping ranges.

> diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/=
realtek/kent.dtsi
> index 8d4293cd4c036..228b82dfdb7ac 100644
> --- a/arch/arm64/boot/dts/realtek/kent.dtsi
> +++ b/arch/arm64/boot/dts/realtek/kent.dtsi
> @@ -151,6 +151,37 @@ uart0: serial@7800 {
>  				status =3D "disabled";
>  			};
> =20
> +			gpio: gpio@31000 {
> +				compatible =3D "realtek,rtd1625-iso-gpio";
> +				reg =3D <0x31000 0x398>;
> +				gpio-controller;
> +				gpio-ranges =3D <&isom_pinctrl 0 0 2>,
> +					      <&ve4_pinctrl 2 0 6>,
> +					      <&iso_pinctrl 8 0 4>,
[ ... ]
> +					      <&iso_pinctrl 26 4 2>,
> +					      <&isom_pinctrl 28 2 2>,
[ ... ]
> +			iso_m_gpio: gpio@89100 {
> +				compatible =3D "realtek,rtd1625-isom-gpio";
> +				reg =3D <0x89100 0x30>;
> +				gpio-controller;
> +				gpio-ranges =3D <&isom_pinctrl 0 0 4>;

[Severity: Medium]
Is it intended for both the gpio@31000 and iso_m_gpio controllers to claim
the exact same pins from the isom_pinctrl controller?

Looking at gpio@31000, it maps pins 0-1 and 2-3 from isom_pinctrl. Down here
in iso_m_gpio, the gpio-ranges property identically maps isom_pinctrl pins =
0,
1, 2, and 3.

Could this cause unexpected behavior in the pinctrl subsystem? Functions li=
ke
pinctrl_find_gpio_range_from_pin() strictly return the first matched range,
which might silently shadow the other controller's reverse lookups. Also, if
both controllers attempt to request the same pin via pinctrl_gpio_request(),
would the second request fail because the pin will be marked as already in-=
use?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702090115.2564=
318-1-eleanor.lin@realtek.com?part=3D4
