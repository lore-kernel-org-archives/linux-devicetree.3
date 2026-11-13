Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582507;
	b=D6TovhNnkpp5VZjD4AGOCyfrw+PPVbKyzVjf+cr7vzNPcWWx7FmA6K0tbBu6IBidTBR4
	 CiqHwxeEawxA+jhDdNAvBNSYEU+AI+NcsN1jmPwqrgqL+GI1XHy/Gis1EkIg0i0y7Mp6A
	 An9XdrSD6HNyur05ky3BqrRqTK7jOrXb3+pTEZ0EY8AhvPuM2+Yb1wraVDr67ndrud2pW
	 xGvIlOeaBxtOKwZhdJUU8NQXTQmd7oOcqNqhpP8NBkYWPUrV+NKHosg4bVxx4PIJzvRkz
	 +uzXVDFruqI3qptC2UShIoUOR79srMS+sPDrGJ4lXWLg7UCQEMADwed1KjCtkov4XdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582507;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kz0ApRp752cQaNUG0rj+odfW/4QvQt7V844RFKFBs78=;
	b=xas92RX1g21HCu8DMv/1nazo83spC/JmJ78ulQaOYz4wU+0nZFO1QgL6xxXPlNOdPY30
	 /pVEocdysBhp0J4Vq0m8ALSwzDedyhZEuTUh5KodN09NeVUluBfjquXaLxRNxI49Hy167
	 Am7tk3T2eLt/f3Tu2XjFzSNZOcVBrZYa9IAbMYrT8xGJ6P+MrmxKYXeUKAFg1PhPuB5Jq
	 aIOlt4YPH7xvPnL6qfpzSxzIvImOqm8rfAX24yqIzRUxY/Vnn8yXo5ckVsYrhL/gB5XKh
	 LBzTfRBzOfiFpDU0K28u9lvnw4vGUUnTi5Z+oL2tu4d1zX2owfskGCTiliGZQiJzoug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENpwzDr5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56DC606A881
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENpwzDr5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132431F000C5;
	Fri, 13 Nov 2026 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582507;
	bh=Kz0ApRp752cQaNUG0rj+odfW/4QvQt7V844RFKFBs78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ENpwzDr5sC2u7U2q68/OSvFiJGTrpSC15/DNt/0Z9Os1LfRlkTXFNO+VyVQRDW5uz
	 pazqvHP4nhVyIps8NzQFEZy7/oVbsO1tpCRyK69L3LLDJN/3YOSncGlqbaMi7J5Eqe
	 VzeHG3aWlsDKdsccS5B5fj/Ew7DcjkfV5Gknz9GT/EBVDrK7EScscAcrFM8oy0LBtk
	 ohvVvkwUbiRqTTiF30E5Ao8Bpe0lwLPPMidPYR95TSJbaozz2BVPcQFw6TaczbxRTL
	 wFpT8SmPOo6y9uSyyOBLnE8jnHeVeUGRLbu3z0gKcUNP66wxFeaTE7wIUVxRVTQhwz
	 1VANEyNuX2NTA==
Message-ID: <sashiko-outbox-213056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: support camera module on
 Haikou Video Demo on RK3399 Puma
Reply-To: sashiko-reviews@lists.linux.dev
To: "Quentin Schulz" <foss+kernel@0leil.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-rk3399-puma-haikou-video-demo-cam-v2-1-e71acf307f92@cherry.de>
References: <20261113-rk3399-puma-haikou-video-demo-cam-v2-1-e71acf307f92@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 15:08:26 +0000
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
- [Low] arm64: dts: rockchip: missing reg and address/size cells in
  &isp1 port@0
--

commit a25f92051078c649413a94889902e838a237378c
Author: Quentin Schulz <quentin.schulz@cherry.de>

arm64: dts: rockchip: support camera module on Haikou Video Demo on RK3399 =
Puma

This commit adds device tree overlay nodes for the OV5675 camera sensor and
DW9714 focus lens driver on the RK3399 Puma Haikou Video Demo adapter,
enabling isp1, isp1_mmu, and mipi_dsi1.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.d=
tso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
> index 141a921a06e47..013920d9a3392 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso

[ ... ]

> @@ -122,6 +129,53 @@ pca9670: gpio@27 {
>  		pinctrl-names =3D "default";
>  		reset-gpios =3D <&gpio4 RK_PD6 GPIO_ACTIVE_LOW>;
>  	};
> +
> +	camera@36 {

[ ... ]

> +	};
> +};
> +
> +&isp1 {
> +	status =3D "okay";
> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		port@0 {
> +			mipi_in_cam: endpoint@0 {
> +				reg =3D <0>;
> +				data-lanes =3D <1 2>;
> +				link-frequencies =3D /bits/ 64 <450000000>;
> +				remote-endpoint =3D <&cam_output>;
> +			};
> +		};
> +	};
> +};

[Severity: Low]
Should port@0 define reg =3D <0>, #address-cells =3D <1>, and #size-cells =
=3D <0>
to match isp1 in arch/arm64/boot/dts/rockchip/rk3399-base.dtsi?

Because dtc compiles this overlay into a standalone .dtbo before fdtoverlay
merges it with the base DTB, #address-cells and #size-cells on ports apply
only to port@0 and are not inherited by its child endpoint@0.  Without them
on port@0, compiling the overlay triggers dtc reg_format,
avoid_default_addr_size, and graph_endpoint warnings on endpoint@0 (plus
unit_address_vs_reg and avoid_unnecessary_addr_size warnings with W=3D1
because port@0 has no reg property in the overlay).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-rk3399-pum=
a-haikou-video-demo-cam-v2-1-e71acf307f92@cherry.de?part=3D1
