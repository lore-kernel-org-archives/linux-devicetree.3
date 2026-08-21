Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955C1D432D
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315579; cv=none; b=QN2U+x13LB+h2Bt6JsC5CO4ABZ4UDlVVsOkdG3LSX7Pq5F4IaGT3IjaaouCyIO7S0kqhuF6bhNGj2kiV+p3+99BY2p4DzJUkxLRaLnOremRAAbZS+3YnFZIi6Yw2b7GOTm4oIpdWz5SeTMb3MJ6uIXml0lZY/2dGsIzxQzXF8AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315579; c=relaxed/simple;
	bh=PmBMpkKaBaWmMj1Er7Ijrdgmgrke8o9VNzH6kuSGVkU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CdvjjBg2wghWtL8e/Wctb4Ydu6eYoFVdfcxrixKnHkQ8Y1gTHfH5cdllm2Y62UBr89PDXCwKzcosi7afAGFN2Eap1RVlp47Lkbv7rwR7u2K5rRmZ/i6qU6sX5KwREJu/LDzj+uu6ehlgWxATt8UWwVxQmnBrcDv0O2u39vPV6eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJmajT/w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJmajT/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721791F000E9;
	Fri, 21 Aug 2026 12:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315577;
	bh=bcr2K2H5yLJuv2ACy/jcNe93hl0gV4SmcejXtT80Ur4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJmajT/wHCCpYlavphGSE2Am29ax8ybzKGuvPRuDx0JXGBUUEN/OmOP3ZAmaABjFA
	 +K/Gk7bIc/2CvR9SV9T3EaqEHcHER7lM9th6/gPrkM4uYFlf8HGyRztO97h0iCk2Rp
	 kXLqs2zgx0x0cBrwHrVgdX0ocrL8XL73xhg2PxPLUq1nFpYQlIHSvBbioiWqil1FQA
	 2uIJs/EzmtoWfrozlsCPazgcuoUEw0C5AayHTQ7l7szpKvpCVwyCBo7KhaQAZ8KVLj
	 zEcThLMJ2jl504DOdGXfgptAIyjKVZEMiFbzNemfDgpKP08TPmWcZZOu4pk3N3dIS4
	 POk2ao/7SkaMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-next-patches-v4-7-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
 <20260821-next-patches-v4-7-7ab02c0d4eb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:32:57 +0000
Message-Id: <20260821123257.721791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `brightness-levels` property in the `backlight_dsi` node define=
s a single element (`<255>`), which violates the led-backlight DT schema an=
d causes a runtime kernel warning.
- [Low] The USB SuperSpeed PHY (`usb_qmpphy`) is needlessly enabled and rou=
ted to the Type-C connector on a USB 2.0-only device, misrepresenting the b=
oard topology and wasting power.
--

--- Patch [7]: [PATCH v4 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T ---
commit b6a263c7aa2dea142dda12d7e116e55fb2d00b44
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add Xiaomi Redmi 9T

This commit adds a devicetree for the Xiaomi Redmi 9T smartphone based
on the Bengal/SM6115 SoC. It supports basic functionality like display,
GPU, I2C peripherals, keys, regulators, remoteprocs, UFS/SD, and USB.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts b/arch/arm6=
4/boot/dts/qcom/sm6115-xiaomi-lemon.dts
> new file mode 100644
> index 0000000000000..881e05b70116b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
> @@ -0,0 +1,497 @@
[ ... ]
> +	backlight_dsi: backlight-dsi {
> +		compatible =3D "led-backlight";
> +		leds =3D <&led_backlight>;
> +		brightness-levels =3D <255>;
> +		default-brightness-level =3D <190>;

[Severity: Low]
Could this single-element brightness-levels array trigger a dt-schema
validation failure and a kernel warning during boot?

In the led_bl.c driver, parsing this node calls of_property_count_u32_elems=
()
which warns when num_levels =3D=3D 1 with "Not enough levels defined\n", ca=
using
the property to be ignored.

Additionally, the default-brightness-level index of 190 would be out of
bounds for an array with only one element.

> +		/* Backlight controllers can differ between panel variants */
> +		status =3D "disabled";
> +	};
[ ... ]
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +				pmi632_hs_in: endpoint {
> +					remote-endpoint =3D <&usb_dwc3_hs>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +				pmi632_ss_in: endpoint {
> +					remote-endpoint =3D <&usb_qmpphy_out>;
> +				};
> +			};
> +		};

[Severity: Low]
Is it intentional to route the SuperSpeed PHY endpoint to the Type-C connec=
tor
here, given that the device is USB 2.0 only?

The usb_dwc3 node restricts the maximum speed to high-speed. Leaving the
SuperSpeed PHY routed and enabled could misrepresent the hardware topology =
if
there are no physical SS traces.

> +	};
> +};
[ ... ]
> +&usb_qmpphy {
> +	vdda-phy-supply =3D <&pm6125_l4>;
> +	vdda-pll-supply =3D <&pm6125_l12>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Should the usb_qmpphy node remain disabled for this high-speed only device?

Enabling the QMP SuperSpeed PHY wastes power initializing and bringing up an
unused PHY when the USB controller probes.=20

Usually, devices in this situation also remove the usb3-phy reference from
the phys property in the usb_dwc3 node so the driver does not attempt to
initialize it at all.

> +
> +&usb_qmpphy_out {
> +	remote-endpoint =3D <&pmi632_ss_in>;
> +};
> +
> +&xo_board {
> +	clock-frequency =3D <19200000>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-next-patch=
es-v4-0-7ab02c0d4eb9@gmail.com?part=3D7
