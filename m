Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339555;
	b=n88HK1cskya9G+puuE4Q95DzThwzL1VCO2on3XZ5jsDMSSez5A3X+l4GhlYiqqGkr2ex
	 WbHnximZgS+FKU2pM1BOPGl3XBdfBvhZhFSC9+QY3We3tB/+jxf9MZwu3ed31wePyFvT6
	 E258S4wsKXdflmmnddXm/ghkWtwyfTrZOc1fRNo0b+/+gSscEBMP3cUhkUAeIM//YKc6b
	 mYKLfaTDvTmySnG8iqgHelMfqY+ZzWmJ0HqjWdVMA+4Uoiz5yfGROqxuhACX1Vnw7vS8r
	 vG2AwVb4Whsl0+ffK6bjn6GnHAzJrOwNlmx8/rtzqYyLx2LkaYoWkOY99V5ClF9ilyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339555;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mon1Ah4cbxJHmxeW+kKLzcHxra+iaVZbu+kPIsaja2c=;
	b=cwvA4SFCpc38UzPeMYuJx/3lRrke2yJbKZrnOGMMSpRazNoHDtW5g936RPn8gNzyqSVu
	 j/Gl12fJYsotsXEkSfVjoybMFBfYW0Ln6bJEHd4ayCHQqyp154jALDpTVTgHHNPSQnat3
	 oCA4DDXECcJbP46H5N3AnR8Pj6J8RjvWf+toL+9dJaZc1uOF9RiF3Hk7PikwlU6myvsuT
	 i8OOTcCVioXPOnC/MrepL0sVudUmXZq0jnD1DuoYcIZX3MEvpa5tmuiCA9bUC6yol9g69
	 b6B70e2dLzOcWjnB4muiw75vJX3G2VThgOrohcHa/OYaWt0ZBskwqIFJ4yw3SlOcJUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMhLFNID;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91307606A32A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMhLFNID
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23621F008A5;
	Tue, 10 Nov 2026 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794339555;
	bh=mon1Ah4cbxJHmxeW+kKLzcHxra+iaVZbu+kPIsaja2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kMhLFNIDmGAzINcpt4GdGQQ0KAViKyPkxkPRRg8YkVeNtqzce7RcLnP87Xn5UmLQI
	 EpOiBgK+XzUb8/LwER7qe410avMKG/lpMd9bPv83mbMEugo0OM6hQkrHOxQZ47CVg1
	 8ABTH+cX+125QR9yIuI+NP+vO9SXKSbW9xsR2iP+/Mir2dveOAnjy+UdQSNeQTwj/F
	 uCXHnHBWurM73UtYoz61Bs97lLHN2kASiggGvP045VZBu1uF9VySFEx3Cu/MK1xl62
	 S/eCbmC6V4J6SZR7zwJr0WtSXHfKLpYNE9RevV1JMdF6mJkO+Stv6MNac8E2bQ4jTH
	 sdVg0m99rY7GA==
Message-ID: <sashiko-outbox-207674@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add USB-C DP altmode support
 to LubanCat 4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <cyan2254650260@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110193028.512456-3-cyan2254650260@gmail.com>
References: <20261110193028.512456-1-cyan2254650260@gmail.com>
 <20261110193028.512456-3-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:39:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: rockchip: unsorted &dp0 nodes and properties in
  rk3588s-lubancat-4
--

commit 261397db3cd2b33e2c023e8478bf7780b94572b6
Author: Pufan Jin <cyan2254650260@gmail.com>

arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4

This commit adds DisplayPort alternate mode support on the USB-C connector
of the EmbedFire LubanCat 4 by wiring the USB-C connector, usbdp_phy0, dp0,
and VOP2 VP1 in the device tree.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
> index a94aaddb2749e..6c5a942dfd854 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts

[ ... ]

> @@ -857,6 +872,9 @@ &usb_host2_xhci {
> =20
>  &usbdp_phy0 {
>  	orientation-switch;
> +	mode-switch;
> +	sbu1-dc-gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios =3D <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
>  	status =3D "okay";

[ ... ]

> @@ -895,3 +929,26 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>  		remote-endpoint =3D <&hdmi0_in_vp0>;
>  	};
>  };
> +
> +&dp0 {
> +	status =3D "okay";
> +};
> +
> +&dp0_in {
> +	dp0_in_vp1: endpoint {
> +		remote-endpoint =3D <&vp1_out_dp0>;
> +	};
> +};
> +
> +&dp0_out {
> +	dp0_out_con: endpoint {
> +		remote-endpoint =3D <&usbdp_phy0_dp_in>;
> +	};
> +};

[Severity: Low]
This isn't a bug, but per the devicetree coding style and the rest of this
file, label reference nodes are sorted alphabetically, so &dp0, &dp0_in, and
&dp0_out should be placed between &cpu_l3 and &gmac1 rather than between &v=
p0
and &vp1.  Similarly, in &usbdp_phy0, mode-switch should be placed before
orientation-switch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110193028.5124=
56-1-cyan2254650260@gmail.com?part=3D2
