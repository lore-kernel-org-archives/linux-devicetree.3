Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E39540BCB4
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157302; cv=none; b=J+Y/sTmrd/k7O9v+dyc2hftUm/CqZKTEKPYdK8WWLItbCaMsOQ7WCEHPnKM5E/+qERBFiBGejirahhEWYVfNIeOMU4/dyPvLAlqMZIe3+jgftudBhM606sPHPAi61ZA7KkHalLIBqlnseclAvYbkafgp/sOiGZBejHlgqbmWzu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157302; c=relaxed/simple;
	bh=MKHjeZY0hu3CMpuvNKRD4gtg0ohw8FhVOUgSj3FEosk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ePfaHv9huUROcHuVfTfEbzE0/0hFFmAs46SlUyJh03P2ugu18HzJpveGRwuNRpf0R/SF9Hc/Qj2i1tTeHbBOhDXOBPYmxNJ9Pw4QIuwjmXM2fAa3yhDO0/AWYXMd8baL44U5jI0h8aTOgAsJni7ZpGzHv1ckai2fa6t7TcZLEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhPICzxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhPICzxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5481D1F000FF;
	Fri, 11 Sep 2026 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789157297;
	bh=Ywyi2OkeWrRw/Cq30F4SQfklWWmgUMn7KQYf1DsssM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nhPICzxFF5VWjGh0Mw0EICsDg3gBvm5JKbAmASJ0RMLwuEmeat+U2uMKuVuU4sHuD
	 AZb7hk32URrZB85zm5V/onX6e2QOkbawMVWMyrjE7bbNYX5banVSEsfAxrL4qMV2fu
	 kyxapMHHMipLxH3Gr40VIYKdJlZXIbzY1M2qKqUh6gXpiZouDIRURMHabEqJqOhUY1
	 O8FPcT2uM3S5X1Q63Poo8zA6YbMtYQkPcND8w3kU00W3Q0vnxXe0GLMta8uyrPPcBK
	 1pQ0AhSR5BMv0fBaVWQ0E3zjWxrMnVSA8Ppfk1SBCOEe5bVb8kQIW4wlmCJRQ4PTBx
	 3fDDHY7S36IQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPi R5S
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Pardini" <ricardo@pardini.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-5-c1b9e5f10cd6@pardini.net>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-5-c1b9e5f10cd6@pardini.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 20:08:16 +0000
Message-Id: <20260911200817.5481D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The PCI root port bridge nodes (`pcie@0,0`) specify invalid `bus-ra=
nge` properties that incorrectly duplicate the host controllers' bus ranges=
, resulting in secondary buses that overlap with their primary buses and co=
nflict with downstream child device configurations.
--

commit 9036af8384aaa0dde91ac21a4bd6adf0c3d12244
Author: Ricardo Pardini <ricardo@pardini.net>

arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R5S

The FriendlyElec NanoPi R5S (rk3568) carries two on-board Realtek
RTL8125 NICs behind pcie2x1 and pcie3x1, alongside the existing gmac0
RGMII PHY. This describes the fixed function nodes and attaches ethernet1
and ethernet2 aliases so U-Boot can inject MAC addresses for them.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
> index 90ce6f0e1dcff..9ed11663c31c9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts

[ ... ]

> @@ -107,6 +109,20 @@ &pcie2x1 {
>  	num-lanes =3D <1>;
>  	reset-gpios =3D <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x000000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x00 0x0f>;

[Severity: Low]
Does this describe an invalid PCI topology where the pcie2x1 bridge's
secondary bus is identical to its primary bus? Setting the secondary
bus to 0x00 conflicts with its primary bus (0x00) and the downstream
rtl_eth1 child node's bus (0x01).

> +
> +		rtl_eth1: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x010000 0 0 0 0>;
> +		};
> +	};
>  };

[ ... ]

> @@ -119,6 +135,20 @@ &pcie3x1 {
>  	reset-gpios =3D <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
>  	vpcie3v3-supply =3D <&vcc3v3_pcie>;
>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x100000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x10 0x1f>;

[Severity: Low]
Does this also configure the pcie3x1 bridge's secondary bus to 0x10,
conflicting with its own primary bus (0x10) and the downstream
rtl_eth2 child node's bus (0x11)?

> +
> +		rtl_eth2: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x110000 0 0 0 0>;
> +		};
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-rk3588-dts=
-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net?part=3D5
