Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0413BE147
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537035; cv=none; b=etwsNe/oocBwEWiy4bjybU+fRsxSyDAwXtshCru2TCDeDfJ7UA+Rt4Yxs96ZUxPo934DDTLIqpZAEDNnMdkDGqAUHbDL9Xrr3xgFOVZMLio7yIuinp+ZUJkkbVnK/28/2vwM0jc4YzSDAyy9xXjaMlkmKT9lobHeduAaGSmHUAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537035; c=relaxed/simple;
	bh=Yw8vIOlTJUcKw8aN6gOX/6XaY7ulhtc+ZC/OE/QR+gk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=focNyZZ7c0TjU9oIH3rlwMIEWdQsUe+x2ZHiy4iY07cxfi//mm9andzt9CECyOrciy874OSySP9w1p1G5hSJKFJWvUmY6H+0PWIX9AKtUpI+t4OENhs988iqpCjS/+lcfItvS1jx/fR/78E59rGoMCld46WpAY65QcGkKwCQRfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngDdGgSw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngDdGgSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDCBC2BCB0;
	Mon, 11 May 2026 22:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537035;
	bh=Yw8vIOlTJUcKw8aN6gOX/6XaY7ulhtc+ZC/OE/QR+gk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ngDdGgSwvbpv0uGAGdMSLH6DwlEucfRL9mG4ZycC9odjk8CTVLUB7MjtKNn0j8LUm
	 Mdd3R77eWNjHYawp8NDRvHEK4LZdCnuH1Bd4B8+PeqjxaraGI6TwPnoJ3KpYz3qZ8k
	 +VuzFsTDmLRn7Cr5exSpsSlZZhqiIMRx1scKl2fqGWKr5H0dAwZHeJ8+9xX2n+h1Oh
	 91My67ajCtC+M6zMBWC7GcoWqWuY6edayxv1whjQiO+WRbkNk+BP03mujZbJwHk6T2
	 EYqnHKa9B6dM8oVSMCVrkmpkviiBJ+6/tb5c2cvI6oO6/Pm6+PFeEKD/ag+Ahc3ubk
	 CsBKE6SpOeueA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/10] arm: dts: renesas: r8a7740: Add clocks for FSI
Reply-To: sashiko@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260510084303.122426-3-phucduc.bui@gmail.com>
References: <20260510084303.122426-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:03:54 +0000
Message-Id: <20260511220354.CCDCBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] System hang regression due to bisectability breakage (clock disabl=
ed by framework).
- [Low] DT Binding Schema Violation due to skipped positional items in the =
`clocks` array.
--

commit 2d24adee7eadd7ba80ff4dc222250fe7259e1d9e
Author: bui duc phuc <phucduc.bui@gmail.com>

arm: dts: renesas: r8a7740: Add clocks for FSI

Add the SPU clock to the FSI node to ensure it is enabled before register
access, preventing potential system hangs.
Add missing clocks for FSI (icka/b, xcka/b).

> diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/r=
enesas/r8a7740.dtsi
> index d13ab86c3ab47..6f9d9bbfd159a 100644
> --- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
> @@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
>  		compatible =3D "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
>  		reg =3D <0xfe1f0000 0x400>;
>  		interrupts =3D <GIC_SPI 9 0x4>;
> -		clocks =3D <&mstp3_clks R8A7740_CLK_FSI>;
> +		clocks =3D <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
> +			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
> +			<&fsibck_clk>;

Will adding the spu clock to the device tree without the corresponding driv=
er
support cause the common clock framework to automatically disable it during
system initialization?

If the bootloader leaves the spu clock enabled, and the kernel disables it
because the driver hasn't claimed it yet, could this cause a regression whe=
re
the system hangs on subsequent register accesses by the fsi driver?

To maintain bisectability, should the driver be updated to manage the spu
clock before or in the same commit as this device tree update? I see this
regression was addressed in a later commit adding spu clock control in
hw_startup/shutdown, but it may break bisectability here.

> +		clock-names =3D "fck", "spu", "icka", "ickb", "xcka",
> +				"xckb";

Does appending the external clocks (xcka and xckb) here without the internal
dividers (diva and divb) violate the strict positional order defined in the
device tree binding schema?

The dt-binding schema for renesas,sh_fsi2 defines the clocks property as an
ordered list where the 5th and 6th items are the internal dividers, and the
7th and 8th are the external clocks.

Since dt-validate evaluates array items positionally, will it evaluate the
external clocks against the internal divider descriptions? Should the array
be padded with dummy elements (like <0>) to maintain the strict positional
order?

>  		power-domains =3D <&pd_a4mp>;
>  		status =3D "disabled";
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.1224=
26-1-phucduc.bui@gmail.com?part=3D2
