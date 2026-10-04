Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C837F29992A
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094662; cv=none; b=XwhC8mKsp72t0tFb7EoCH9wkXM7Y9Xlr1wKynjijSBQmYt+bbLBlHUEAb8iJp8wgn9s5azMbl52X8VXF5ljzo52KSqn7XWjTNxVXJKhC0DP+C5uhrMvjcspyzwD5mnCWIVDsCJe6W89tXRf92dqX1cpMG4AZCLaV/EIcljsGsoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094662; c=relaxed/simple;
	bh=mpz+U4x9iKDU+0Cn8GpRHvA8L+tpPT2dZIhMPKnm8jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=chGJjAnEChoegEsHLiikfn4Ut7xTSxkeZ1Ygs3k3iBcP/0wPSQ/2eoZNbnREnIe4DNbEMk+TKzqDIunUeKdw2JCBx9bVP8aCz97evF4fOESVqN1x9VJTzZ1hDEkyUbO28zfjPO+FZUnLjhi1wjCWWpBJFIFEamYjCf7a7TVcRiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/8I16AW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/8I16AW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022061F000FF;
	Sun,  4 Oct 2026 06:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791094660;
	bh=xKmBgB7Wf+TJvuL3CGGSBTHSSRCEjmH/qziS5Rxl1Rc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G/8I16AWHUBtg0GaAO5Hyec854imLVsQ0i/FAWnp3wQeY1I9gc0Ul1CiU6+A3NwWR
	 HjP6fHlVVtB9KNDQFZmdRkD28+QTOVnINBbDeQg5BQ7jELH91uq1mr6XHvO9R6Ggvi
	 34sTyoEj/NQNx/E1iGNvJycpkWP4kztQOfxm+6XCECo8cG0G6u20vTKraWbInL9Tb8
	 XOSYLBHn1PH+ySewQ1NGsOrv7S5bOtTt1jfYkhK56Brda71ma4XrKLzXw6AJNs25sc
	 vMCcDLVdSsJh2AjKxqtDSdaoMuA9UjdrXh8QeOS/4jfiG+32i/CU8lKaAmqbUyKh7O
	 k51ezpDlKgIog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:17:39 +0000
Message-Id: <20261004061740.022061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: codec ti,tas5770l is unprobeable due to missing driver binding
- [Low] dts: duplicate &i2c2 node definition
--

commit 880aa6b0e6df0b9fa5a017a1a3c706d5c89c5508
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes

This commit adds speaker and headset jack nodes for the M1 Mac mini. It
integrates Apple-specific variants of the TI TAS2770 and Cirrus CS42L42 by
advertising them to the machine driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/d=
ts/apple/t8103-j274.dts
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,71 @@ &i2c2 {
>  	status =3D "okay";
>  };
> =20
> +/* Audio codecs */
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker: codec@31 {
> +		compatible =3D "ti,tas5770l";

[Severity: High]
Will this codec successfully probe? The intended codec driver's match table
in sound/soc/codecs/tas2770.c does not appear to include this compatible
string:

sound/soc/codecs/tas2770.c:tas2770_of_match[] {
	{ .compatible =3D "ti,tas2770" },
	{},
};

Without a matching driver binding or a generic fallback string like
"ti,tas2770" in the DTS, the kernel's I2C core and OF matching will fail
to bind a driver. Does this leave the codec component permanently in
deferred probe and prevent the sound card from initializing?

> +		reg =3D <0x31>;
> +		interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;

[ ... ]

> +	};
> +};
> +
> +&i2c2 {

[Severity: Low]
Does this file already have an &i2c2 node defined right above this hunk?
While the Device Tree Compiler safely merges duplicate nodes into a single
block during compilation, is it preferred to nest the new jack_codec node
inside the existing &i2c2 block to avoid redundant top-level references?

> +	status =3D "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible =3D "cirrus,cs42l83";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D10
