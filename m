Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656723;
	b=IZs8Bo7KLw8X5I6q6VhpxaELqX86f6jh0Dh92hVq4GBDjgfTu+a77hzNPCOaVAd/WEbS
	 L5xeSnDPm2LRILgbxLKUbrgOpvIya5yhwNKwgyubENUGb1lNMYBLd+cBvLUWfR6XZY/d6
	 nXHi5uvOiFXmDF6o9xNuCyx+KpUxO2SZJb/uJHNbJdUUd92qOO4aJhuqmDypnCL7Db2LE
	 2ba+8zXuR5iIx+G/UgT5lULSQd/PjpU+JBoUucJMyXdFsWMkFTx3aGsPuA0fCyM4Oc33A
	 IhRpzcAeMCV0afXfc4fj327BeAmLrGbYQXwz4wsbAl0wDnBe4e2Z+USK4wNexwwV9Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656723;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y5MBZfmGLNA/6nRHb8tOyTmORJI8NWg4GR+vitJiBIg=;
	b=O92zTDtRdt6h1ZNcSoSyBQPhdkV9WFKCwLDc0Sh0ckKaU8gaI67St6UAMahRwh7AR8Xg
	 C56Q18wwfrp/X7k2kFjyPWDFed7rQjYDMvE0dErEkJYGqWJNU9NtQngQE+A6Dcg2QvC2q
	 RdcM3dnr5RWx3kYBzVCIVbw2gE6aM0uILEN4qoc2yj5lQTbNWhSucXdTO7SetKzsSiqda
	 8SV5jzcdjKwL7vVEbMcxmF+gYphIXVRCosTY5/PgZWzvoGNuM9LRUCNahfiem7n/jBDeJ
	 0IYks0ChTMxHhrx/xZANrv90PKh6ZIJd/ZdiSygI8Kdl4NpzY2CqhVpndR0aFQdL9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GXoIZ03y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F8606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GXoIZ03y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468291F000EB;
	Thu, 26 Nov 2026 01:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656722;
	bh=Y5MBZfmGLNA/6nRHb8tOyTmORJI8NWg4GR+vitJiBIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GXoIZ03yvo7DcNx2QnsL0+y72wkmp6jYXKWBHAfhKyySwO/+5b32LBALREB9uytvc
	 TsaPMDW8a9leX8GyNPDZfL+ZobFWtHUZjDW9fhGfZOi9X2TbyhKbghAxE07ZSwJnIA
	 8ryV/NXX8GOrZBGApJqVXwbNi5o5MRIzGQCtZYMNQPeUmU6ynABf17O+M5GnLRKLYZ
	 Ytq9aAXc0V6a40gnDj9kUzoygle1C3I+stinygdsTG3stEXKf75XP1CO1ehkLCg1B1
	 MSoGfW0GK83VGvJtnIbVYkZajfstdmOmIOUnqDM+Lu/VBTiXRPqpzoTnUrxuBud/B8
	 KlMTwMuYbBnMg==
Message-ID: <sashiko-outbox-234551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 Gameforce Ace
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-7-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
 <20261126-rockchip-usb-c-dp-altmode-v1-7-7991eb5bb426@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 01:32:01 +0000
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
- [High] arm64: dts: rockchip: missing altmodes node in Gameforce Ace
  connector
--

commit f7aa33c43ca95ec2ee7b6fa1f45573f338a6a9a6
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

arm64: dts: rockchip: Add USB-C DP AltMode for Gameforce Ace

This commit enables dp0, connects the DisplayPort and USBDP PHY OF graph
endpoints to the USB-C connector, and drops rockchip,dp-lane-mux from
usbdp_phy0 for the Gameforce Ace.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arc=
h/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
> index 5ffc94b70813c..4bfa442d762c5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts

[ ... ]

> @@ -685,22 +701,22 @@ ports {
> =20
>  				port@0 {
>  					reg =3D <0>;
> -					usbc0_orien_sw: endpoint {
> -						remote-endpoint =3D <&usbdp_phy0_orientation_switch>;
> +					usbc0_hs: endpoint {
> +						remote-endpoint =3D <&usb_host0_xhci_hs>;
>  					};
>  				};
> =20
>  				port@1 {
>  					reg =3D <1>;
> -					usbc0_role_sw: endpoint {
> -						remote-endpoint =3D <&dwc3_0_role_switch>;
> +					usbc0_ss: endpoint {
> +						remote-endpoint =3D <&usbdp_phy0_ss_out>;
>  					};
>  				};
> =20
>  				port@2 {
>  					reg =3D <2>;
> -					dp_altmode_mux: endpoint {
> -						remote-endpoint =3D <&usbdp_phy0_dp_altmode_mux>;
> +					usbc0_sbu: endpoint {
> +						remote-endpoint =3D <&usbdp_phy0_dp_out>;
>  					};
>  				};
>  			};

[Severity: High]
Does the usb-c-connector node under fusb302 also need an altmodes child
node advertising DisplayPort AltMode (SVID 0xff01)?

During port registration, tcpm_register_port() ->
typec_port_register_altmodes() looks up the "altmodes" child node on the
connector and returns without registering any port alternate mode when it
is absent.  When a DisplayPort AltMode partner is attached, matching
against port->port_altmode fails and typec_probe() rejects the partner
altmode with -ENODEV before dp_altmode_probe() can run, while the static
rockchip,dp-lane-mux property on usbdp_phy0 has also been removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-rockchip-u=
sb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com?part=3D7
