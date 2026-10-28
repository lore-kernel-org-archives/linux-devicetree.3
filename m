Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204357;
	b=3bbc37vJpSuvQZRFF1JY34VUm5Hc8+ivbK3MGGkJLFiwdRQ0uT8LTsyOvS0ibDsa19Bg
	 OlXqt3Vvh93tTl1HJc21AsPHwfvpA837FqRjjR8YwWKskiZny091tGVjWRK2R2TtxchBe
	 4O67tTOJhlOVqp9Vo9XLsYx0s3Y5lNf/9MugZd1JIraSc6hWuVFrUYM/k65wRGCYqn5se
	 D5vHvJLXHcdtwp4+6GSkwBZLN0wfjgtrz3gxr/Bota6/Ohi1PvEQ0NWEvNpKyPY8HTOe5
	 IWlHpd+m0NWkp/B/wN8Y0NwOmUaO8/i9SFMVvvdmGHwIlDF8PRKaFFP6lyBvAHGoMFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204357;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nYbFEgyC/xqC3hKEfXtpRoaY23g6uKG+OjaK4ev9ZiQ=;
	b=xGUsqdy3ufn8eYsSLDJuG9eGPOsYo1fjc8BIyiZhxg5Y/ertwWKjhR7WFbpLyaLpyPwu
	 a5QlLMaLFBQIvAPEjq8lcYVwRzVyv2u03u7Dkh44ZxoLLIV9Mfzdeo2/nrkDMTIFtfCCr
	 GAUgndsZJtT8tjOFF2pnjcnONR4NRyCVL87wtkJzRu76uT/0y6AuE277wc5aS2fQiIS3u
	 ZRfDU9KD9vw1NPTHtOcjw0AA87OnM9AVBi8P2JOxE6whcjaL1FPoL+FFXBtp9JHmG0dRm
	 pllxj3lpzmXYxGLoXUDjBmnbrKXZU6L6lqEoji250q5tM3FCJcJBXxzAqAWscUw6jBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GL0g+dRL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C884E606A321
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GL0g+dRL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DC41F01825;
	Wed, 28 Oct 2026 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793204356;
	bh=nYbFEgyC/xqC3hKEfXtpRoaY23g6uKG+OjaK4ev9ZiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GL0g+dRLtcfXqNP2E0U0soxurK8ljfptbgtvtdt9icp14A/zeeLEok3KGKjnW6Lwc
	 Fd7qmh5WqQw9Y2eONMOhNRRcYbJeTxPX2bdEj84WZ+aoDUSxiQVkCgtEYi0wQSUJP7
	 rJyTgSi8cenbFYj6P+AhLzowK1PTcbLedp5BJ9qp4P7t/EsW1ZWWQwaf8DFmUNMFnD
	 dM29aO4XI8zJk9yNTeKkvtCt1+VZp8+9G+mIxUQGNh+ic606NLXjKdEH3PMP61O/6s
	 PzxBsxIiEFlBZ8+0d+yEI+jhm6D7tcCoJ979DvWVD99o8M/eptvWpwXQHlg/6z/o6Y
	 GCLs4roiAMrAg==
Message-ID: <sashiko-outbox-188154@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] ARM: dts: omap: dm816x: Update USB node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-6-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
 <20261028-patch-ektor5-dm8168-dts-v2-6-4544429251e2@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 16:19:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ARM: dts: omap: dm816x: usb0 and usb1 reg-names order violates DT b=
inding
--

commit 35b005745f908eb885e6f38cec92f9ed09548b10
Author: Andrew Goodbody <andrew.goodbody@linaro.org>

ARM: dts: omap: dm816x: Update USB node

This commit updates the dm816x USB device tree node to use the ti,sysc
interconnect target module wrapper and relative child register offsets so
that USB works with DMA enabled.

> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti=
/omap/dm816x.dtsi
> index e3d49651b44ee..b839ee29e9eb5 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -574,19 +574,28 @@ uart3: serial@48024000 {
>  		};
> =20
>  		/* NOTE: USB needs a transceiver driver for phys to work */
> -		usb: usb_otg_hs@47401000 {
> -			compatible =3D "ti,am33xx-usb";
> -			reg =3D <0x47401000 0x400000>;
> -			ranges;
> +		usb: target-module@47400000 {
> +			compatible =3D "ti,sysc-omap4", "ti,sysc";
> +			ti,hwmods =3D "usb_otg_hs";
> +			reg =3D <0x47400000 0x4>,
> +			      <0x47400010 0x4>;
> +			reg-names =3D "rev", "sysc";
> +			ti,sysc-mask =3D <SYSC_OMAP4_SOFTRESET>;
> +			ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_SMART>;
> +			ti,sysc-sidle =3D <SYSC_IDLE_SMART>;
> +			ti,sysc-delay-us =3D <2>;
> +			clocks =3D <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
> +			clock-names =3D "fck";
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> -			ti,hwmods =3D "usb_otg_hs";
> +			ranges =3D <0x0 0x47400000 0x8000>;
> =20
> -			usb0: usb@47401000 {
> +			usb0: usb@1000 {
>  				compatible =3D "ti,musb-dm816";
> -				reg =3D <0x47401400 0x400
> -				       0x47401000 0x200>;
> -				reg-names =3D "mc", "control";
> +				reg =3D <0x1000 0x200>,
> +				      <0x1400 0x400>;
> +				reg-names =3D "control", "mc";
>  				interrupts =3D <18>;
>  				interrupt-names =3D "mc";
>  				dr_mode =3D "host";
> @@ -622,11 +631,11 @@ &cppi41dma 11 1 &cppi41dma 12 1
>  					"tx14", "tx15";
>  			};
> =20
> -			usb1: usb@47401800 {
> +			usb1: usb@1800 {
>  				compatible =3D "ti,musb-dm816";
> -				reg =3D <0x47401c00 0x400
> -				       0x47401800 0x200>;
> -				reg-names =3D "mc", "control";
> +				reg =3D <0x1800 0x200>,
> +				      <0x1c00 0x400>;
> +				reg-names =3D "control", "mc";

[Severity: Low]
Should usb0 and usb1 keep their reg and reg-names entries ordered as "mc",
"control"?

In Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml, which covers
compatible =3D "ti,musb-dm816", reg-names is defined with a fixed order:

  reg-names:
    items:
      - const: mc
      - const: control

Swapping the order to "control", "mc" in usb0 (usb@1000) and usb1
(usb@1800) causes dtbs_check schema validation to fail on dm816x device
trees (such as dm8168-evm.dtb), and differs from am33xx.dtsi and
dm814x.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-patch-ekto=
r5-dm8168-dts-v2-0-4544429251e2@linaro.org?part=3D6
