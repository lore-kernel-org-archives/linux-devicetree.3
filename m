Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E74F3A257A
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979176; cv=none; b=hvEYSm5UbXv9P+DxMwAdYbyX5cs3YkyGQhiYvwVpa8LbkSktAQPaEB9nh6pGbUBqXqZwB208shvz11DL8QDxr6LC0yLzp7ZKTfBCa6qbmX3zx3vskFOHDrcCko60Y36t2Zc9pTjUnKkX1wn/ka8msQaeETOyoUijIcuZ0ovz/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979176; c=relaxed/simple;
	bh=xLNqQwrDZS/9/QoVijaJ97Iw31VF9FtYr23DjULV4es=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p2LCuf7821tPKZSX0FG6BoZNTaDOa6iPM1MqN1GPb4FfanRYLYSwL0cC8boimzFVvoY4mhwcc4KAqQ1k01SNDd9l8fSXLmKG/t9ajTI/0pPTAFa054u/KSXRVHy+n6c78WMNjWLNlMa/LvZThuteoXPdW2RYjAQXTUA/m0En+Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drZmi0yM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drZmi0yM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8332E1F00893;
	Wed,  9 Sep 2026 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788979174;
	bh=R9i0/FMhtP/CmGYgXnj703IMvpEGiZ0uv9/vk4m85oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=drZmi0yMZTsZKGYTe+m5s1DpjCf6a2b8dhBs1xl/wEdq+E8qfhfWs149BwxhMkM9X
	 XcqBHR8NNrCtki457D9fv4lNXoBcp+EBBzbITwFg+hl5THlP1KdiBkufnpdIfZQu7K
	 L5XKZ25Aq0fqz7ZL/uMJpeVuNcnWscvXLff3faKNlcmCQ8mNLYa4B60k6UX8Oj7Rdk
	 TQ9QoWuvjd54F1HQ+JJ5VT4EZNRahjutma08iwB04HAJApS4r0zFi9mTBCUis2BrCN
	 HT1wusLr+ed4mPAwCPg5T8Em6zRsosuWVISp2lnWWYzytjpX6InlfPvFs9dgbkWicV
	 uX3S25qSAsPIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909182641.165383-2-marex@nabladev.com>
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 18:39:34 +0000
Message-Id: <20260909183934.8332E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect use of "ethernet-phy-ieee802.3-c45" compatible string fo=
r a Clause 22 PHY, breaking PHY probing.
- [Medium] Conflicting RGMII TX delay configuration for gem1/phy1 overrides=
 `phy-mode` contract.
- [Medium] Suspiciously short PHY reset deassertion delay (10us).
--

commit eea503ea47697121b80dcf7c5965d02c5b346e78
Author: Marek Vasut <marex@nabladev.com>

arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard

Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
The board is populated with four ethernet ports, QSPI NOR,
eMMC, UART and USB host interfaces.

> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts b/arch=
/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> new file mode 100644
> index 0000000000000..0108f3d505a7f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
[ ... ]
> +&gem0 {
> +	phy-handle =3D <&phy0>;
> +	phy-mode =3D "mii";
> +	status =3D "okay";
> +
> +	mdio0: mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy0: phy@1 {	/* TI DP83822I */
> +			compatible =3D "ethernet-phy-id2000.a240",
> +				     "ethernet-phy-ieee802.3-c45";

[Severity: High]
Does this compatible string cause the PHY probe to fail?

The TI DP83822I is a standard Clause 22 PHY. Using the C45 fallback string
causes fwnode_mdiobus_register_phy() to parse "ethernet-phy-ieee802.3-c45",
set is_c45 =3D true, and force get_phy_c45_ids() to read the PHY ID using n=
ative
Clause 45 MDIO frames. Since the PHY ignores native C45 accesses, this
read fails and get_phy_c45_ids() returns -ENODEV, aborting the PHY registra=
tion.
This configuration is also duplicated for phy1, phy2, and phy3.

> +			reg =3D <1>;
> +			reset-gpios =3D <&gpio 78 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10>;
> +			reset-deassert-us =3D <10>;

[Severity: Medium]
Is a 10 microsecond reset deassertion delay long enough?

The MDIO core waits exactly reset-deassert-us after pulling the reset GPIO
high before attempting communication. 10 microseconds is an extremely brief
window. This might cause intermittent MDIO read timeouts (0xffff) and probe
failures if the PHY hasn't completed its hardware reset initialization.
This short delay is also present for phy1, phy2, and phy3.

> +		};
> +	};
> +};
> +
> +&gem1 {
> +	phy-handle =3D <&phy1>;
> +	phy-mode =3D "rgmii-rxid";

[Severity: Medium]
Does explicitly setting tx-internal-delay-ps below conflict with the RGMII
contract established here?

The phy-mode =3D "rgmii-rxid" property dictates that the PHY should apply an
internal RX delay but NO TX delay.

> +	status =3D "okay";
> +
> +	mdio1: mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy1: phy@1 {	/* TI DP83822I */
> +			compatible =3D "ethernet-phy-id2000.a240",
> +				     "ethernet-phy-ieee802.3-c45";
> +			reg =3D <1>;
> +			max-speed =3D <100>;
> +			reset-gpios =3D <&gpio 8 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10>;
> +			reset-deassert-us =3D <10>;
> +			tx-internal-delay-ps =3D <1>;

When this is present, the DP83822 driver parses tx-internal-delay-ps via
phy_get_internal_delay(), returning 1. The driver then bypasses the default
RGMII clock shift logic and leaves DP83822_TX_CLK_SHIFT unset, explicitly
enabling the internal TX delay on the PHY. This can double-delay the TX clo=
ck
or misalign it entirely, leading to link instability or complete RGMII TX
failure.

> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909182641.1653=
83-1-marex@nabladev.com?part=3D2
