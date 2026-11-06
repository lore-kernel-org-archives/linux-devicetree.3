Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946152;
	b=1VWkHrIbgXY4PaUWG4vYr1j93/PWO1c1zs4MUrjigBDUV06ZmdGyFgma+2HsilFaehUI
	 yKqsmZYdqogNI6k7ku1iIYANh2tumEUnNUo2+czjatxhxvuNz55bWTn5UBcSpW7afwddW
	 o2QqRc4YShe7LE8kKPUyh9peuHgDzruyEfMyK7FzkW/hGb5E5WdVUvY5ILd2GDufCCptz
	 Rf2nt4Kb9+DRcwCGtsWRQEAXQyI+j3z9jfbwIwZtWPbgM6ANAvbwWc9Ue5JPAgUAXX8l3
	 yiyhr/Gk2tLdOavBxbXMs1KJQ3NRTfFQyKqxwZPwW3V/IUHHaVGhduqCdJp524fPEVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946152;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rrWDj3qKNUOdY2qWqoPCz8O6YDDuEwTD6EHNmup6yhE=;
	b=d+xVYRtXoO54cGgVzd2q2eE2HKGG4fnmmUTJyBgYcR3V42Gw5Fs6Fqpwm8uIAmhNmTMy
	 zzkGJat4EgRNb5J70YfHc7C6hzAxPhFNq9MI8BP6asjyWk7VPaZzjPMGenjBhwHlzWaWs
	 FqagFicmMqdIqK7b35fh7/+390R0DtUOmyQ4NM3uK0JbwrZyoNqJMgcJiyu0jBlAO9uDf
	 2udCUtbCLxmbYUcpdkwKCV5/RjAvX1lOgg51dEeogWMqzEyUeDJq6tlatEmQyOpZrzkK9
	 rkz2Me9gRllsEl63kRmrSy9+F2LV7cqixJeECmuXaW1CiodA1oqNCesS48BNSNvHAQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lP8tg1iz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58C606D801
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lP8tg1iz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8ACA1F0089F;
	Fri,  6 Nov 2026 06:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946152;
	bh=rrWDj3qKNUOdY2qWqoPCz8O6YDDuEwTD6EHNmup6yhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lP8tg1izAzmIUsVN1V0HLckaNd2mFWzK1gGv9i9kHYH7+ge8C3RwhSdFI1S0LOg6e
	 4ZSPmTL8irFZzjIbmCApFrTZ+dfeGppMh10eUyLFS1CUrVqBgFKqjH36LX3+zZMr9Q
	 UN6oFXzIwkxi+YVMNfOc2QEvtTph/O6JPviM52B57BIENR/l+OYxBlubIFIQ62I5r2
	 hopXl9Rep/vkoYp56nhACtES21JsFdWIM6zS/FEi1vlb7UFwrDFMTJ1BgbPRCsWyRX
	 qCFpl73tu4TozSgsDiKDcymK11VxTpbwwddNdrlrUYoSFum7Tu/oAYvGLliF/wSOD4
	 CyQhhouDhIz0w==
Message-ID: <sashiko-outbox-200888@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: mediatek: mt8390-genio-common: Fix
 type C port mode and connection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106060621.2706658-2-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
 <20261106060621.2706658-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 06:22:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: mediatek: missing PDO_FIXED_USB_COMM in mt8390
  source-pdos
- [Low] arm64: dts: mediatek: mt8390-genio: hub ports nodes violate
  ti,usb8020b schema
--

commit b958daa221ebf8e15b905e203df3fc6aa4fbfaae
Author: Chen-Yu Tsai <wenst@chromium.org>

arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connect=
ion

This commit updates the USB controller and Type-C connector on MT8390
Genio boards to host-only and source-only mode, routing the connector's
High-Speed and SuperSpeed endpoints through the onboard TI TUSB8020B hub.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 669eaec662f33..d10ee1603103f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -512,18 +512,11 @@ rt1715@4e {
>  		connector {
>  			compatible =3D "usb-c-connector";
>  			label =3D "USB-C";
> -			data-role =3D "dual";
> -			op-sink-microwatt =3D <10000000>;
> -			power-role =3D "dual";
> -			try-power-role  =3D "sink";
> +			data-role =3D "host";
> +			power-role =3D "source";
>  			pd-revision =3D /bits/ 8 <0x03 0x00 0x01 0x08>;
> =20
> -			sink-pdos =3D <PDO_FIXED(5000, 2000,
> -					       PDO_FIXED_DUAL_ROLE |
> -					       PDO_FIXED_DATA_SWAP)>;
> -			source-pdos =3D <PDO_FIXED(5000, 2000,
> -						 PDO_FIXED_DUAL_ROLE |
> -						 PDO_FIXED_DATA_SWAP)>;
> +			source-pdos =3D <PDO_FIXED(5000, 1000, 0)>;

[Severity: Low]
Should source-pdos pass PDO_FIXED_USB_COMM instead of 0?  This connector
routes High-Speed and SuperSpeed data lines to the onboard USB hub, so
passing 0 causes tcpm_pd_send_source_caps() and
usb_communication_capable_show() to advertise the port as incapable of
USB data communication.

[ ... ]

> @@ -1555,6 +1541,19 @@ hub_2_0: hub@1 {
>  		peer-hub =3D <&hub_3_0>;
>  		reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
>  		vdd-supply =3D <&usb_hub_fixed_3v3>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				usb_3_0_p2: endpoint {
> +					remote-endpoint =3D <&typec_con_ss>;
> +				};
> +			};
> +		};
>  	};
> =20
>  	hub_3_0: hub@2 {
> @@ -1563,11 +1562,18 @@ hub_3_0: hub@2 {
>  		peer-hub =3D <&hub_2_0>;
>  		reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
>  		vdd-supply =3D <&usb_hub_fixed_3v3>;
> -	};
> =20
> -	port {
> -		xhci_ss_ep: endpoint {
> -			remote-endpoint =3D <&typec_con_ss>;
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				usb_2_0_p2: endpoint {
> +					remote-endpoint =3D <&typec_con_hs>;
> +				};
> +			};
>  		};
>  	};
>  };

[Severity: Low]
Do the new ports child nodes under hub@1 (usb451,8025) and hub@2
(usb451,8027) cause dtbs_check to fail against
Documentation/devicetree/bindings/usb/ti,usb8020b.yaml?  That schema only
references usb-device.yaml# with additionalProperties: false, and the
prerequisite commit "dt-bindings: usb: ti,usb8041: Fold in TI USB8020B"
noted in the patch commentary is not present in the tree yet.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106060621.2706=
658-1-wenst@chromium.org?part=3D1
