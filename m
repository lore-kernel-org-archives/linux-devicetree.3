Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CA63E0752
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780627128; cv=none; b=koMCtOiSl9zTReijRwTYDSkgt1A/lCHFImvSMdadJDU0rNwWQ5Clzbb+/2dNk+DPL6k0Gtmg77yF6Sk1vx/dOzmfCVeuF98AaPSvcoHLCLhpgRWoUY3dzSF9CYEQVZGzrH8swJa01/lVZOrpsmbZEBTBomkI1zEje73Mhf560Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780627128; c=relaxed/simple;
	bh=IkrJCouyKBu8b6+raSJt6DmdTV0ZFT/WkO7boEIqbIU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AlESfdo9eqMQdoYtOs4Bw/VPfBWWQCtfQb0UC+0V6rLwCifnZ7CDKAVjFKx9tZq3O7vN0LzuKujppPseSAWTyPbZAo3S+JnjOX3VUPNGFxOeazWp7WINJhle0bWnzKzVJgGMzAAZ6XIcUQI0uqPlZPADrEFxBFiXnEwcSMYkY8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4D9C3z+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4D9C3z+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716251F0089C;
	Fri,  5 Jun 2026 02:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780627117;
	bh=2a0zvNVeReHvvfOfNxf8zdsJcAYvxcv/YbDysjZv1BI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P4D9C3z+1bgOMSv1Hj3yZaggRP7oyDysHzTQO9r/xLq3g6gnHk6jcihJm6gW7CZCA
	 E0C1he1rmLgLr46OtLm/OAgKvIv6lBZW/QmbxxhrQXvT7dM//vGUFMYSG8iqPGHEGF
	 k4ll/rlzj0ZH/O6VVwF41e68PP0fPIPS0m0rwv0kF2erVPIf05u1kBwvVQ6jYVfTxb
	 Rc+nTRvAIk3ZggwAMXCltxYzVvxx12fgFW6Z4iwpjaa2ZR2abhvqXE4tM/j5ij0ShB
	 Pnx1b/1wYJnhYKWqMh0btf9HB6uCeWh+VQpTNqw90stZ+IRdLjIL7R5z4k4aaTcZ85
	 HfSJfv8JTGgSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: Add eDP node for RK3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605022305.3058853-4-damon.ding@rock-chips.com>
References: <20260605022305.3058853-4-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 02:38:37 +0000
Message-Id: <20260605023837.716251F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing dt-binding documentation and driver support for 'rockchi=
p,rk3576-edp' compatible string.
- [Medium] Device tree schema violation and unmanaged clock due to incorrec=
t clock-names mapping.
--

commit e47ec8c7e8e01e5a72a889c3a37a5a2d40321b07
Author: Damon Ding <damon.ding@rock-chips.com>

arm64: dts: rockchip: Add eDP node for RK3576
   =20
Add full device tree definition for the integrated eDP controller
on RK3576, following the existing RK3588 hardware layout.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index 28175d8200d57..733449cb88b15 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
[ ... ]
> @@ -1496,6 +1496,34 @@ hdmi_out: port@1 {
>  			};
>  		};
> =20
> +		edp: edp@27dc0000 {
> +			compatible =3D "rockchip,rk3576-edp";

[Severity: Medium]
Will this trigger a schema validation error during make dtbs_check?

The new compatible string is declared here without a fallback string like
"rockchip,rk3588-edp". If this string is not documented in the device tree
bindings (rockchip,analogix-dp.yaml) and lacks a match in the Rockchip Anal=
ogix
DP driver, the driver might not probe successfully.=20

Should a fallback compatible be provided if the hardware is fully compatibl=
e,
or do the binding and driver need to be updated alongside this patch?

> +			reg =3D <0x0 0x27dc0000 0x0 0x1000>;
> +			clocks =3D <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>, <&cru HCLK_VO0_ROOT=
>;
> +			clock-names =3D "dp", "pclk", "hclk";

[Severity: Medium]
Does naming this third clock "hclk" violate the device tree schema and
prevent the driver from managing it?

The dt-binding schema for rockchip,analogix-dp.yaml explicitly restricts the
third clock name to "grf". The eDP driver attempts to fetch the third clock
using devm_clk_get_optional(dev, "grf").=20

With the name set to "hclk" here, will the driver silently fail to find it,
causing the HCLK_VO0_ROOT clock to be ignored and left unprepared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605022305.3058=
853-1-damon.ding@rock-chips.com?part=3D3
