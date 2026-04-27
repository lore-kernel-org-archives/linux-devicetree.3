Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750113B8BC1;
	Mon, 27 Apr 2026 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292830; cv=none; b=aWE1MvJQwEnu1XfAukLuzlZOu4cJBLn02DcuCGVo8M+Qo4sBtd1k5ylkY1Lfqid+fV9kSZcRnMtYZH4m8WjvJMRTe8wHCWWTxwK0622NNQ8AsXJIJBk1F4+2PoPFGeC2UWcTYtZQBjt+Uo45/+pJFzk9N+Jm5VX+k+gZHQi2XTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292830; c=relaxed/simple;
	bh=hBRhS9r+el8j8Oh8NrUzxl+2SrEzb1ahxw//wUO0BKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tQxwboEhruCG4IlPmJ0r5Gu3lExasNWF2PA9MpsOiMd3z7oE5D10KMnzHqlVj2plkwndnIxwy1PBsQBZUx1twSWNSXxvNdu1R+8jPsbgwte4ykR+9z4IiFaPwocvKIcV5wUFlMv4DzEo9CHeKCap/09N+IUMkFqxo8k1E+bLW5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=lzJFGkIw; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="lzJFGkIw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VJKIc0zAxeYT5fXYQZbODNvkxb2EkocuhVXOnLkXtms=; b=lzJFGkIw60RjRCW3TwobbaH5Fj
	249d9pmx3QvUnfKLmrRWM6f6Bzx81CeOKPV63v/pPf4fFaD3MB1rLQ5veRg5oSEJENVADDVl2HBEV
	tmahgYfUf2pnlKCqW3SNTOWyu7FbrWpA7ImV7qYH/3qKSdLZ4dvcZYkKWOUXcoe9WSiYsS93YM/pt
	G6MsqMJlz9X7h3fMECBI6QKS78dnwcTXG0pUqZmpeK/I6dBETZ9qOTBIQ4W9WyXfAm1J55dk1FqB4
	0l2OTFifx/b3hlqu6VV32gDpdobLvJYuW0H1jRns8SCrl6gy3Ek25zpVGBWgVgLaG7y6YEXSwsdhz
	sRdqOfpw==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Gray Huang <gray.huang@wesion.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com, Gray Huang <gray.huang@wesion.com>
Subject: Re: [PATCH 5/6] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
Date: Mon, 27 Apr 2026 14:27:02 +0200
Message-ID: <5673086.MHq7AAxBmi@phil>
In-Reply-To: <20260325054614.1497147-6-gray.huang@wesion.com>
References:
 <20260325054614.1497147-1-gray.huang@wesion.com>
 <20260325054614.1497147-6-gray.huang@wesion.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 25. M=C3=A4rz 2026, 06:46:13 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Gray Huang:
> The Khadas Edge 2L board provides one USB 3.0 Host port and one
> USB 2.0 port (connected via an internal hub). Enable the
> corresponding DWC3 controllers and PHYs.
>=20
> Signed-off-by: Gray Huang <gray.huang@wesion.com>
> ---
>  .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> index 003342fd69a7..8ecd00f6645d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> @@ -30,6 +30,29 @@ hdmi_con_in: endpoint {
>  		};
>  	};
> =20
> +	vcc5v0_device: regulator-vcc5v0-device {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_device";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
> +	vcc5v0_host: regulator-vcc5v0-host {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		enable-active-high;
> +		gpio =3D <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
> +		vin-supply =3D <&vcc5v0_device>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&usb_host_pwren>;
> +	};
> +
>  	vcc_sys: regulator-vcc5v0-sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_sys";
> @@ -531,6 +554,12 @@ pcie0_rst: pcie0-rst {
>  		};
>  	};
> =20
> +	usb {
> +		usb_host_pwren: usb-host-pwren {
> +			rockchip,pins =3D <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	wifi {
>  		wifi_reg_on: wifi-reg-on {
>  			rockchip,pins =3D <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -542,6 +571,24 @@ wifi_wake_host: wifi-wake-host {
>  	};
>  };
> =20
> +&usb_drd1_dwc3 {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&u2phy1 {
> +	status =3D "okay";
> +};
> +
> +&u2phy1_otg {
> +	phy-supply =3D <&vcc5v0_host>;
> +	status =3D "okay";
> +};
> +
> +&combphy1_psu {
> +	status =3D "okay";
> +};

same here, u-something and c-something between pinctrl and sdhci
is the wrong place.

Heko

> +
>  &sdhci {
>  	bus-width =3D <8>;
>  	no-sdio;
>=20




