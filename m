Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4BA1A6816
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503036; cv=none; b=qBWLutTd6phml9lj638BT6s9J4nbaFKS0t4YsAyWrUejWf3Ebo9lff8aVlVdP6cMQXP05MDaO5DUg3bYWbU20q5iAXTEIQgIKsSgBqPO/lyTyxE186vsv4PW11SYm13kafAtHoHIh3S4FM5jMRacKP8o0UrTfOF7EovdW0WmGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503036; c=relaxed/simple;
	bh=TJLQFY3A0pkS3cJVWxEKUhh+eLtfHcBG4sJU3T6oGU8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZUl5vIs/ve4u6u1Zw6nck2qNYggxtXfYQZg20kmFcddnv/8H751FoD1HG+YYGE5oxKrj/I599b65w2abF9bhcg5SEk8TmzjAQDPAqxdfbRJ8LLJRpynghg5Bp3nH5DdQoJDu9QWVWHG6lvqi5tAB3soJHfmItwlyc5rgzuamfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZythfic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZythfic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87871F000E9;
	Mon, 15 Jun 2026 05:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781503035;
	bh=R+k6vc3M1rq8waiprFnocGtgmE69JAynowKaLTQCrLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZythficFHk7VOWLJqMe79cIk2vaTK2iW9I3iit3ufZlMVeHGG9s3fvLe5PpPNa++
	 sGHiiXhnTHGfRi9h7rrsFBkXr6JmYmjk7NXjPs1kA/mZRp+8t+1zIXeuyOIcKazsG2
	 PUtDpHmS5tsFdceOnfen3prR24aSmSuxpkkzMbkGW2pL32gpVXiSvwdLftm4yNkJhP
	 ymfs/CyvRHTOIUqt3IfAOKkxWpqZ8lmdQtKPd44Z8PGaup/aOSKn3oV6pjYUpZ3CLc
	 V30ew8wqacGatCNpSsOcDUphQuQGa5/uX6kdfag+hX2hfEMkQXQpCI935KVOiqCaRd
	 IklbAOV0N/B1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org
In-Reply-To: <20260615054911.48821-3-a0987203069@gmail.com>
References: <20260615054911.48821-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 05:57:14 +0000
Message-Id: <20260615055714.B87871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The unit addresses for EHCI1 and OHCI1 nodes use uppercase hexadeci=
mal characters.
--

commit 05d96a79d90d16847229b2f5b5cfd71d8eb6ef98
Author: Joey Lu <a0987203069@gmail.com>

arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node

This commit adds device tree nodes for the MA35D1 USB subsystem,
including a dual-port PHY node and nodes for the DWC2, EHCI, and OHCI
controllers. It also enables the corresponding nodes and configures
pinctrl in the board files.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dt=
s/nuvoton/ma35d1.dtsi
> index e51b98f5bdce4..73ff1d78d2848 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

[ ... ]

> @@ -379,5 +388,62 @@ uart16: serial@40880000 {
>  			clocks =3D <&clk UART16_GATE>;
>  			status =3D "disabled";
>  		};

[ ... ]

> +		ehci1: usb@401C0000 {

[Severity: Low]
Should this unit address use lowercase hexadecimal characters?

The Devicetree specification requires unit addresses to be formatted using
lowercase hex. Using uppercase 'C' here (unlike the 'c' in the reg property
below) can trigger W_simple_bus_reg warnings when checking device trees.

> +			compatible =3D "generic-ehci";
> +			reg =3D <0x0 0x401c0000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk HUSBH1_GATE>;
> +			phys =3D <&usb_phy 1>;
> +			phy-names =3D "usb";
> +			companion =3D <&ohci1>;
> +			status =3D "disabled";
> +		};
> +
> +		ohci0: usb@40150000 {
> +			compatible =3D "generic-ohci";
> +			reg =3D <0x0 0x40150000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk HUSBH0_GATE>;
> +			phys =3D <&usb_phy 0>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
> +		ohci1: usb@401D0000 {

[Severity: Low]
Similarly, could this node be named usb@401d0000 to comply with the
standard Devicetree lowercase hex conventions?

> +			compatible =3D "generic-ohci";
> +			reg =3D <0x0 0x401d0000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk HUSBH1_GATE>;
> +			phys =3D <&usb_phy 1>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615054911.4882=
1-1-a0987203069@gmail.com?part=3D2
