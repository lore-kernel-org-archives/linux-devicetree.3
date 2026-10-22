Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669327;
	b=bymyU+m0/qVGxUHCVGRYdnhG88ZCLb40hFmuYMr4baFZ36sjVMRtT/FYLutnWpwTDH3Z
	 zeAxm3G0TgkZuihhTbG5IYTEO6GBP+mR6+SoVihBW47rM371eEuPNeh+1ZbcLaDiHQ9o/
	 12+Mz7wU2kltgyG9wxebG5IXYfG1THMqXiX7kjN0gGb/As+m1VAQirMdt+CQY9kcYataN
	 qz0gQr5DjJ8l781H68RAaKzHg5HhdabE0XoihqWRGdGFvE3FXYf/3+xlim+OmpjG1/Puq
	 R+2omFhefSdCBwJvm5m9aeR7tyFLfXQrXMgR8MZ/MHFCfznJ6wbiRRCe+Vng8zRbKLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vNERAkQs9ez4hEvpewXo6suYBqkjyBt8hZRsRGmyfzM=;
	b=plb1s5O58YIrkglIPCnU4jBkOmR0P/E190kX0r4pjlEV4NsDI3clp6mjxJawHVY3dSWe
	 oRgB9dC0WG1NJtdVY6sjaRzj+k2J+/6jWrKqRrpiFC/J4Nwvx/uMoYF72SFc+K7bezRkI
	 iM/fGJdBR78OLNpUoDOUnNaR4iPNgHrnmos1xTX7JZs9FKOoLK9nnHdGZCr0qaxPXCrPU
	 qkBaNniYxRDKBAYokDtbx5YHSxb6BDPWG1iWy61YjAisVwxwxVSRrMXaUX4Ox141fny7C
	 e6hIFrhlliLYzq2iQB+t/i5ZUfngWQM9RunUOjle/uhODky4P1JzrNrOEfOMtYtswyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vzq+xNAE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BA1606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vzq+xNAE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE941F000C1;
	Thu, 22 Oct 2026 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792669326;
	bh=vNERAkQs9ez4hEvpewXo6suYBqkjyBt8hZRsRGmyfzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vzq+xNAEsyRTykzbHaRfSJA+Ld3WQDrDSYsibcY5GGIGnzais34mfxzbRbEODm3PQ
	 yRMpKqSpWJSbhdKsjM4AXneInKPn5N3a2AziekzEnjcvCXbufn1IT6BP3ujah1u0fM
	 YGo2CLBDBxN8yxmJOiReDHWbB5h/ubD3ePUdSpzFM895eBfCnl/H8BlzIJRn4j8VdG
	 FhI5JlFxtSUaRHj6GEo3Xw8+LotBBfOv8UHfDnGu48ZcWID2I+UA4f2fSM3DG7Ypc3
	 ir2tuCJxo0099vYKgx26EurMKst4P1XUFiDspdrbr1GqVo3hI6SYjNi4dsamM2ZeE2
	 S4x5mhAErbMwA==
Message-ID: <sashiko-outbox-181378@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8250-hdk: Add the 2 LEDs of
 PM8150b
Reply-To: sashiko-reviews@lists.linux.dev
To: "ShiTou Hong" <redstone.dcity@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022113601.2320940-6-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
 <20261022113601.2320940-6-dc_redstone@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 11:42:05 +0000
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
- [Medium] arm64: dts: qcom: sm8250-hdk: deprecated LED label overrides col=
or in sysfs
--

commit 8610d8172ae62463a8325cbe16b011b5f8fa6fc1
Author: redstonee <1516235445@qq.com>

arm64: dts: qcom: sm8250-hdk: Add the 2 LEDs of PM8150b

This commit enables the pm8150b lpg controller on sm8250-hdk and adds two
child nodes for the green heartbeat and red wlan indicator leds.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8250-hdk.dts
> index eb899c92fcfb7..d15e75a4ace5c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/usb/pd.h>
> +#include <dt-bindings/leds/common.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -157,6 +158,25 @@ vreg_pmu_pcie_1p8: ldo9 {
>  	};
>  };
> =20
> +&pm8150b_lpg {
> +	status =3D "okay";
> +
> +	led@1 {
> +		reg =3D <1>;
> +		label =3D "led-heartbeat";
> +		linux,default-trigger =3D "heartbeat";
> +		color =3D <LED_COLOR_ID_GREEN>;
> +	};
> +
> +	led@2 {
> +		reg =3D <2>;
> +		label =3D "led-wlan";
> +		linux,default-trigger =3D "none";
> +		default-state =3D "off";
> +		color =3D <LED_COLOR_ID_RED>;
> +	};
> +};

[Severity: Medium]
When pm8150b_lpg probes in drivers/leds/rgb/leds-qcom-lpg.c, registering
led@1 and led@2 calls:

  devm_led_classdev_register_ext() ->
    led_classdev_register_ext() ->
      led_compose_name() ->
        led_parse_fwnode_props()

In drivers/leds/led-core.c:led_parse_fwnode_props(), the presence of the
deprecated label property causes an early return before color or function
are parsed:

	if (fwnode_property_present(fwnode, "label")) {
		ret =3D fwnode_property_read_string(fwnode, "label", &props->label);
		if (ret)
			dev_err(dev, "Error parsing 'label' property (%d)\n", ret);
		return;
	}

Because label is set on both nodes in
arch/arm64/boot/dts/qcom/sm8250-hdk.dts, color =3D <LED_COLOR_ID_GREEN> and
color =3D <LED_COLOR_ID_RED> are ignored at runtime, and the devices are
registered in sysfs as /sys/class/leds/led-heartbeat and
/sys/class/leds/led-wlan instead of /sys/class/leds/green:heartbeat and
/sys/class/leds/red:wlan.

Since label is also deprecated in
Documentation/devicetree/bindings/leds/common.yaml and
dt-bindings/leds/common.h is already included, should led@1 and led@2 use
the function property instead of label:

	led@1 {
		reg =3D <1>;
		function =3D LED_FUNCTION_HEARTBEAT;
		linux,default-trigger =3D "heartbeat";
		color =3D <LED_COLOR_ID_GREEN>;
	};

	led@2 {
		reg =3D <2>;
		function =3D LED_FUNCTION_WLAN;
		linux,default-trigger =3D "none";
		default-state =3D "off";
		color =3D <LED_COLOR_ID_RED>;
	};

so that the color and function properties take effect?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022113601.2320=
940-1-dc_redstone@outlook.com?part=3D6
