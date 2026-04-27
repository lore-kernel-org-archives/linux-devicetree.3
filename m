Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B86C3B894D;
	Mon, 27 Apr 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292758; cv=none; b=u4AcpuPW+FAOjXJXD0CqmBG21vW6692w4Yq5TIf7tb1GdCsk1EnWy3zuZMQ14pPqJ3q0OOIBjpwINroUE6ayu1HOx+AMHGATEcuuSHrIBRUJ5uPJnasKgwmWez3NUuKtYyxjr79rTfoUACMD3OkalK59q3fRR92ClH4p2cpa7IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292758; c=relaxed/simple;
	bh=kPccZz2fVCsehhsnyer/IKLXB18iuMNK34QfkD2oRO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCwCKS8XKDwPuJDNnVXOkyz/gr4aDn4MAhvc1K68M6kX9eFbf3iv3yvCzArSa7en0a6zczkjZcaSeGxlidwU5AloHq6o8SJy9tuqtZbnHYyPm2bM4ZDcsVA2lzI5PCtsrtcOjNsYLjb2tqLDdUZNB7n4QYsGWDx3yzrLpcpTP6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tJP4z/UU; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tJP4z/UU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=333EQ5bhO0fiPprY5W+7dmdDUISQgxlb4XBMWTWf1m8=; b=tJP4z/UUPvD4UlrBsuvfNDoHl1
	lnd9XxfkZ9/k7Q1jEt3qnr97Ju8L2hZWMCqwqm5clCWWyXa0Yt+75weS0s4u+VhV4KQ9/kKO8aNnH
	8n0j+UqFH9arwRD0QkRtkv7VvuQy7/JZNA1byei+XKLHqyX3SsyWrpYTiMfSXY5k2rQnf8b3Lpi9J
	w73mwCzLIio74WloxRpy1ShWqeUgEGqzTX36VqhhloA1PZNaiJekSlR8UKjL11bz03AVIfEeavbsJ
	DzrHdOvW9qhEwC4aZHe85TODVRtwSNyZot6t8/jO14hwKhmUKo92tdo/Sa7FMCCKoJPMpr0BIlQzW
	ZUGZ2RBg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Gray Huang <gray.huang@wesion.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com, Gray Huang <gray.huang@wesion.com>
Subject:
 Re: [PATCH 2/6] arm64: dts: rockchip: Add AP6275P wireless support for Khadas
 Edge 2L
Date: Mon, 27 Apr 2026 14:25:51 +0200
Message-ID: <4059489.Mh6RI2rZIc@phil>
In-Reply-To: <20260325054614.1497147-3-gray.huang@wesion.com>
References:
 <20260325054614.1497147-1-gray.huang@wesion.com>
 <20260325054614.1497147-3-gray.huang@wesion.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 25. M=C3=A4rz 2026, 06:46:10 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Gray Huang:
> The Khadas Edge 2L board uses the Ampak AP6275P (BCM43752) PCIe
> Wi-Fi 6 module.
>=20
> Enable the pcie0 controller and add the Wi-Fi module as its child
> node. Additionally, enable the HYM8563 RTC to provide the 32.768kHz
> LPO clock required by the Wi-Fi module, along with the necessary
> CombPHY and fixed regulator.
>=20
> Signed-off-by: Gray Huang <gray.huang@wesion.com>

Please make this 2 patches:
=2D add the rtc
=2D add the wifi using the rtc

> ---
>  .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 71 ++++++++++++++++++-
>  1 file changed, 70 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> index 5781deae00d9..09cb0f0d6dcf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> @@ -47,7 +47,19 @@ vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
>  		vin-supply =3D <&vcc_sys>;
>  	};
> =20
> -
> +	vcc_wifi_reg_on: regulator-wifi-reg-on {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&wifi_reg_on>;
> +		pinctrl-names =3D "default";
> +		regulator-name =3D "wifi_reg_on";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		vin-supply =3D <&vcc_1v8_s3>;
> +	};
>  };
> =20
>  &cpu_l0 {
> @@ -431,6 +443,63 @@ regulator-state-mem {
>  	};
>  };
> =20
> +&combphy0_ps {
> +	status =3D "okay";
> +};

also please sort also phandles alphabetically, i.e. pcie2 between
c-something and i2c is the wrong place :-)


Heiko

> +
> +&pcie0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie0_rst>;



