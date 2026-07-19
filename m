Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B63B2D12EC
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 04:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784433872; cv=none; b=UF10cENzSfXM6Xyfz/H8biXkMHHT83S3DgpKcqCuFbcNI6IK9yv+34lwaCHImUb6AdJL3BT43ZYq8gKuXZsGnZJAmDCD3hm980Zgt+5SiKVHv2wOorjLAZK8nF0m0YdbWvJNjBZwNcFDPPxrhVyOx7wKNb7Ia5kiWUWVOBkMdvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784433872; c=relaxed/simple;
	bh=n+xOyzxNtXqtSBBM4WCfP3uDIqmU4acamtF2KkfrSUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tXFBuWJOtHshOZDX+NR3xFQh+bEs043pqhfNg/CWFyYGdoifi2tmraYapkmoeXlGPcZE++w4XdGtdaUD5cbz4iKHuonG0FTmIy4iuetbQgF4NuI6KoH3X9Tt7xg+cTKsbUk95rl8s2ejkeG+vAhl5D9G4nH4wj0LaJssQNWVv/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVECXvZC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVECXvZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA801F000E9;
	Sun, 19 Jul 2026 04:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784433871;
	bh=oKatGeXJd5EOPehZ+fRGHGZRCGTkTHAB4YnwaIXYKQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OVECXvZCg/MSyn+/Nu2ZKJHmsTDNnPytJ6qpjMZ3iKLLTRFQdS17bP8ZO5+4qxk1Z
	 BqzeLTRcVDiOQAXNhiohFgfq+2eGAqIOhHxcl8VTReLwDk2gFzbbGiFmSn8cDuZrs2
	 uGOzdWz94eHDQ0SU4oNJnQd87iTMQTShQ3KueG+H0dPCk+yGoU3AFz7kFl2Jw3IA+0
	 5LKbd9fsjqQoJd/Byym6v3qOSF9CYOhjY933wA3cQSzuE9ERTr4RTclAWFS37Opr6C
	 Zoaxt2FztsHtHj0pKudgXlQPJJCoUXNh/zt7E1S0f/WOVv5WDKFzaz+CB4HDGrELwP
	 Jy0ecUQEv6Qlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260719034611.3623066-3-gahing@gahingwoo.com>
References: <20260719034611.3623066-1-gahing@gahingwoo.com>
 <20260719034611.3623066-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 04:04:30 +0000
Message-Id: <20260719040430.DFA801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uninitialized hardware state (missing clock enablement & reset seq=
uence violation) due to motorcomm PHY driver not handling clocks.
--

--- Patch [2]: [PATCH v5 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-=
IO ---
commit c0855ea5f59329ce1c87ee05212dc9c8bf0d2728
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

This patch adds device tree support for the Rockchip RK3576 based
ArmSoM CM5 compute module and its CM5-IO carrier board. It configures
the GMAC0 Ethernet with an on-module MotorComm YT8531 PHY.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> new file mode 100644
> index 0000000000000..b6977b973b340
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
[ ... ]
> +&mdio0 {
> +	reset-gpios =3D <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
> +	reset-delay-us =3D <20000>;
> +	reset-post-delay-us =3D <100000>;
> +
> +	rgmii_phy0: phy@1 {
> +		compatible =3D "ethernet-phy-id4f51.e91b",
> +			     "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0x1>;
> +		clocks =3D <&cru REFCLKO25M_GMAC0_OUT>;
> +	};
> +};

[Severity: High]
The commit message states that the REFCLKO25M_GMAC0_OUT clock is enabled by
the PHY driver. Does the motorcomm PHY driver actually handle clocks?

Looking at drivers/net/phy/motorcomm.c, there don't appear to be any calls =
to
clk_get() or devm_clk_get() to fetch and enable the clocks specified in the
device tree.

Additionally, dwmac-rk.c only fetches a PHY clock if the phy-is-integrated
property is present, which is missing here.

Because the MDIO bus deasserts the reset-gpios before the PHY device is
probed, will the PHY be brought out of reset with a dead clock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719034611.3623=
066-1-gahing@gahingwoo.com?part=3D2
