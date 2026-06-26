Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAB23F9F26
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491212; cv=none; b=k9DyouDcM7RBWRq4Sh8LGH5dDrbHNqTQFBlB0b23G3dd+E/LlKma/zeCo6Ri0dO9BTYlKgUPeWzF1FVYlc9Y1Wot1a4Nmibr2yzeJNscd8ZHhK7oS1DFngIlNxmFtG4HsxHuIrfzkUHTropKhizQuB/SmrFumfqtUQAF0q+rTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491212; c=relaxed/simple;
	bh=CBHbJwUUhkWobFTs3c4qWPM3ffsC0az4FbWqJEZ7sE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ue2PFJtPKmsrVab42IWZU4Jdsq8eWBuUPsfiahCTzpJV8IAruAPl+0BFBqty6aFuVwHPCH049zD9X0Rg0ghZsm+N6O1cApm82ZUxczoUCHB9B5ZhkUagzqnjq2M+NQeve6gYBttgLHdf8NuNjRIYBHDd8WrddLnDwiN9QomdMEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMl9EVuO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMl9EVuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE68F1F000E9;
	Fri, 26 Jun 2026 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782491210;
	bh=zuzUZqxlSqMnYViZyXspk/Ji/qH5cMD2Dwss+G2Vtyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMl9EVuODzDpJ70zQY39s+ykD6FCKMBC6rQVZij0mlkdL+Se0AzFEOVDWYurTY4gN
	 UmCr59YXdQZzDW3uzZrbCy02IQ/QSeHQVxg8r3a+eekXQNLFjUiLN3o00ZW4s6qLrf
	 cu3+GKhJFt13Y7gw9PgoiAAaibBaHFYq4JFekHHLEVXdlRMeNiq6LcVCUwVBZdpisZ
	 X6Q53qJ6q2WSlRd2IA10LbdI/0oh3TvOCr13HLHVSCpgdOzHGSLglcn47h+1JQoLyj
	 vc9DD8l8Ud6vO9lqbgTqR760Ia9pCCVjn7A9yJRfFOGv8GUv5CFSvKaVNAjM1KA/1q
	 NcN1vxSYdiFIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add support for the
 phyCORE-AM67x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Morrisson" <nmorrisson@phytec.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260626161014.1146128-2-nmorrisson@phytec.com>
References: <20260626161014.1146128-1-nmorrisson@phytec.com>
 <20260626161014.1146128-2-nmorrisson@phytec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 16:26:50 +0000
Message-Id: <20260626162650.BE68F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The external PCIe reference clock generator `pcie_refclk0` is neve=
r selected as a clock parent, leaving the oscillator permanently disabled.
--

commit d9846b20b72a17d0a0d8f41ab892c88f00f2de4e
Author: Nathan Morrisson <nmorrisson@phytec.com>

arm64: dts: ti: Add support for the phyCORE-AM67x

Add support for the PHYTEC phyCORE-AM67x SoM and the corresponding
phyBOARD-Rigel carrier board. Features include audio playback, CAN,
PCIe, USB, eMMC, Ethernet, and various sensors.

[1] https://www.phytec.com/product/phycore-am67x/
[2] https://www.phytec.com/product/phyboard-am67x-development-kit/

> diff --git a/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts b/arch/a=
rm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts

[ ... ]

> +&serdes1 {
> +	status =3D "okay";
> +
> +	serdes1_pcie_link: phy@0 {

[Severity: High]
Will pcie_refclk0 remain disabled here since assigned-clock-parents isn't
overridden?

The base SoC device tree configures the serdes1 node with
assigned-clock-parents =3D <&k3_clks 280 1> (the internal core_ref_clk).
While the board DTS provides pcie_refclk0 in the serdes_wiz1 clocks array
below, it doesn't appear to override assigned-clock-parents on &serdes1 to
actually select it.

Because the clock framework might retain the SoC's default internal clock,
the physical PCIe reference clock oscillator's GPIO gate is never asserted,
which could cause PCIe link training to fail.

> +		reg =3D <0>;
> +		cdns,num-lanes =3D <1>;
> +		#phy-cells =3D <0>;
> +		cdns,phy-type =3D <PHY_TYPE_PCIE>;
> +		resets =3D <&serdes_wiz1 1>;
> +	};
> +};
> +
> +&serdes_wiz1 {
> +	clocks =3D <&k3_clks 280 0>, <&k3_clks 280 1>, <&pcie_refclk0>;
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626161014.1146=
128-1-nmorrisson@phytec.com?part=3D2
