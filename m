Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962792;
	b=keawglvdfjGeW/eswCbLgK/ufbrOwoaqnZro8vFLo1rZME+a7g/o1hjJF0Vl36Wy/KNv
	 WQlKuGu5X/FGDoKziGH34nNfd7HCyV1GumjrhpEApRFGitC1qJfMFr26Z5Bnmk63ZsA8h
	 kCMf/nKxFG5tUMFQKqlgqtHK9tl/ci53i1ZHezGwOmFpqmPS4HlAA4mSjyUKlL/d5HghR
	 Wdul2MJ7InnEyByBD3+J+4QARAQAIIT8ZgqNAKbTPlt/Yixeg3dLhIz4dIImreaPoYKU/
	 Si9FVOVEG5a9YrelNp3nO/PljGDZjNaKaFD0khjsYyruMT1+f5wYwpMJd4syz7SJwvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962792;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=slv48Zzo7hdpis2W0rGmQzEpH7ISKDafg9bxgK1B+vc=;
	b=EWJlyaFKUB5tkNQesnjk9/ZT2PzENgL8UoNCcgUQEcl5s4m1k+dJU37QxLYrPglw0LQX
	 EclFmA0L6zj2zFN371EhMjoVEeaWPQP/kh5nbxO30DJY7ZYlBNcl3BDwflaCyh5qhT3dY
	 74iGE9v3TmeRGXA5gj/w+kogUEs8/FsBi9k4mEYYiF1Yjhh15GiaPfWpfRPzFg4hSsA4Z
	 e9l6CGeOK6ZJtxmR1xdptDbXVVXLQs9bGej9gPQkaCsBcTfBG39fs2PP4c662nEmujJZ6
	 IEweOBhr0oZvoOYo96+q4ejz0zE1xExlFpbtylwxHClnNGemz4elOkZseoTtWJ9fzyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GTfU6yHI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C5606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GTfU6yHI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4051F0089F;
	Fri,  6 Nov 2026 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962791;
	bh=slv48Zzo7hdpis2W0rGmQzEpH7ISKDafg9bxgK1B+vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GTfU6yHIBP1ckYhPmEDQcojpcSG8ZnvV7Ed2UwehB/HLhlYxUAD0pnIo9SH8zdv1n
	 snQ864Dsn4FOD7s+04ioAoQWqe1m+SXKc/QmtAQkKWknAjnXE+BnoguFjguJNIYINK
	 G6uw4etlu7KlKTS4PZh4vXmAqKme6Mp/I0pyMEJoFLJfq3+eyD/Crcgq6qtSTlO5Jj
	 WPpZXKHk0j+r2ifTZc/QJGaPUpH3gW+qH2qML10HgzGixE6JrWuIwulrSRZHiyxd5o
	 MGYppK61/pOoIB+sxn+H0MNWscw8JO44H6q/64TQ47i6xBV0MOBpQs+aaLn80Sq2rG
	 KfRdHazxZ+gBA==
Message-ID: <sashiko-outbox-201261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] arm64: dts: amlogic: meson-s4: add the USB host
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:59:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: amlogic: unmatched s4-usb2-phy compatible breaks
  USB probe
- [Medium] arm64: dts: amlogic: meson-s4 USB glue and xHCI violate DT
  binding
- [Low] arm64: dts: amlogic: meson-s4 USB2 PHY nodes out of address
  order
--

commit 52aac76c3162fb981eef1f4f1e554811e324a07e
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

arm64: dts: amlogic: meson-s4: add the USB host

This commit adds the two USB2 PHY nodes and the USB controller node with
its child xHCI host node to the Amlogic Meson S4 SoC device tree.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 8bbd70e52a299..155997649dc3a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -770,6 +770,26 @@ cpu_temp: temperature-sensor@20000 {
>  				amlogic,secure-monitor =3D <&sm 1>;
>  			};
> =20
> +			usb2_phy0: phy@3c000 {
> +				compatible =3D "amlogic,s4-usb2-phy";
> +				reg =3D <0x0 0x3c000 0x0 0x2000>;
> +				clocks =3D <&xtal>;
> +				clock-names =3D "xtal";
> +				resets =3D <&reset RESET_USBPHY20>;
> +				reset-names =3D "phy";
> +				#phy-cells =3D <0>;
> +			};
> +
> +			usb2_phy1: phy@3e000 {
> +				compatible =3D "amlogic,s4-usb2-phy";
> +				reg =3D <0x0 0x3e000 0x0 0x2000>;
> +				clocks =3D <&xtal>;
> +				clock-names =3D "xtal";
> +				resets =3D <&reset RESET_USBPHY21>;
> +				reset-names =3D "phy";
> +				#phy-cells =3D <0>;
> +			};

[Severity: High]
Does "amlogic,s4-usb2-phy" have a matching driver or binding in the kernel,
or does it need a fallback such as "amlogic,g12a-usb2-phy"?

phy_meson_g12a_usb2_of_match[] in drivers/phy/amlogic/phy-meson-g12a-usb2.c
and Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml only
list "amlogic,g12a-usb2-phy" and "amlogic,a1-usb2-phy". Without a matching
driver or fallback compatible on usb2_phy0 and usb2_phy1, no PHY provider
is registered, so dwc3_meson_g12a_probe() -> dwc3_meson_g12a_get_phys() ->
devm_phy_optional_get() returns -EPROBE_DEFER permanently when usb@fe03a000
is enabled, and dtbs_check fails.

> +
>  			eth_phy: mdio-multiplexer@28000 {
>  				compatible =3D "amlogic,g12a-mdio-mux";
>  				reg =3D <0x0 0x28000 0x0 0xa4>;

[Severity: Low]
This isn't a bug, but phy@3c000 and phy@3e000 are placed before
mdio-multiplexer@28000 instead of after it in unit-address order under
apb4.

> @@ -988,6 +1008,31 @@ mdio0: mdio {
>  			};
>  		};
> =20
> +		usb: usb@fe03a000 {
> +			compatible =3D "amlogic,meson-s4-usb-ctrl",
> +				     "amlogic,meson-g12a-usb-ctrl";
> +			reg =3D <0x0 0xfe03a000 0x0 0xa0>;
> +			interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			clocks =3D <&clkc_periphs CLKID_USB>;
> +			resets =3D <&reset RESET_USBCTRL>;
> +			power-domains =3D <&pwrc PWRC_S4_USB_COMB_ID>;
> +			dr_mode =3D "host";
> +			phys =3D <&usb2_phy0>, <&usb2_phy1>;
> +			phy-names =3D "usb2-phy0", "usb2-phy1";
> +			status =3D "disabled";
> +
> +			crg_xhci: usb@fde00000 {
> +				compatible =3D "generic-xhci";
> +				reg =3D <0x0 0xfde00000 0x0 0x100000>;
> +				interrupts =3D <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clkc_periphs CLKID_USB1_TO_DDR>;
> +				status =3D "okay";
> +			};
> +		};

[Severity: Medium]
Do the compatible strings on usb@fe03a000 and its child usb@fde00000 match
Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml and
drivers/usb/dwc3/dwc3-meson-g12a.c?

The binding only allows a single compatible entry from its enum (which does
not include "amlogic,meson-s4-usb-ctrl") and restricts child usb@ nodes to
dwc2.yaml# or snps,dwc3.yaml#, so both nodes fail dtbs_check. In addition,
dwc3_meson_g12a_otg_init() looks up the host child via
dwc3_meson_g12_find_child(dev, "snps,dwc3"), which returns NULL when the
child uses "generic-xhci".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106104659.5465=
6-1-christian.koever-draxl@student.uibk.ac.at?part=3D8
