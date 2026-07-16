Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907B528505E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211812; cv=none; b=HncvFT6nJLVY5T6kL+87nieCorVmP+n6EKxWtYzaVUHJ+fSYGan4T13wW8pvOPM7LhjWnJ7OHT1No97p1+BeRDm91U2vYCu4GuAvVq985ZBplcdyFG2+UFgexVGqL7fW5FC4NabjRjgwdyBX09QAsR7qTaIvTZ4vtrkG8Yt3cyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211812; c=relaxed/simple;
	bh=FdOwA70eJkRB6fWSkMFK8tZ48vBlp4qnuJFi1HMKFGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jy8/W1k4u5hftxvXXd5v+/4t0mYbk/zFvzZlEdI4vlXNuSOGkopeTYkGaYfeDZ6s4rr7Lldggoq+Xh1tcSHDtfkdDaoty0IqIa7WfiwreT++bOR70TD5UgWuJ9VINiV1f0CKpSO03mOP7KbZoIgjA1W5cDuU44kmFB/59x9TaDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rl5oh9zS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rl5oh9zS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C3B1F00A3A;
	Thu, 16 Jul 2026 14:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784211811;
	bh=SxIZZu89c7XCqTiCMtj56pD8gy6LCEnmWBnoWmf2LRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rl5oh9zSwo2e13ULLlEPnDbyBmjwSJ+H6ZIOUdhMejHNpwYQeu6Mx7bHEtgLoFfF9
	 BdGofMdgM+aKtNEFA70TjAmVxN8hM518wtJ5b9wLn6tDaLhId3lyzGsICOISoJP7C1
	 S5axXvhEReuhO30hqG1w3Ag3tm127cyGY2dhtqKV67hmJmRRU0KwFgpgJzBPMuxoLk
	 0CyKCG3oXIcu92mcPrQY7H3MqUyyaIeW5UN/WEJC3V7l+/MbQWJTtzSYW1rFax3C6f
	 brDXTTIpyS4nHAu2Z2n6HR6BKD75ZupjJ2vpL52NUD3pBv8MIGBQdstDjcXSgcG6V7
	 j2sLUmjy2UjxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716081711.2482259-3-gahing@gahingwoo.com>
References: <20260716081711.2482259-1-gahing@gahingwoo.com>
 <20260716081711.2482259-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:23:30 +0000
Message-Id: <20260716142331.29C3B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Silently ignored clock configuration on MDIO PHY node.
--

--- Patch [2]: [PATCH v3 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-=
IO ---
commit 235c0c71486f5323f7d8535da556a6e07eb3e094
Author: Jiaxing Hu <gahing@gahingwoo.com>
Subject: arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

This patch adds the ArmSoM CM5 compute module and its CM5-IO carrier board,
configuring peripherals such as GMAC0 with an on-module Ethernet PHY, USB,
PCIe, and HDMI. It also describes the reset and 25 MHz reference clock
required for the YT8531 Ethernet PHY.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
[ ... ]
> +&mdio0 {
> +	reset-gpios =3D <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
> +	reset-delay-us =3D <20000>;
> +	reset-post-delay-us =3D <100000>;
> +
> +	rgmii_phy0: phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0x1>;
> +		clocks =3D <&cru REFCLKO25M_GMAC0_OUT>;
> +		assigned-clocks =3D <&cru REFCLKO25M_GMAC0_OUT>;
> +		assigned-clock-rates =3D <25000000>;

[Severity: Medium]
Will these assigned clock properties be processed by the kernel?

Since this PHY is placed on the mdio bus, which doesn't process assigned-cl=
ocks
automatically like the platform bus does, it appears this configuration wil=
l be
silently ignored.

If the bootloader leaves this clock unconfigured, the Ethernet PHY might fa=
il to
operate. Should these properties be moved to the parent platform device (gm=
ac0)
instead, so that the 25 MHz reference clock rate takes effect?

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716081711.2482=
259-1-gahing@gahingwoo.com?part=3D2
