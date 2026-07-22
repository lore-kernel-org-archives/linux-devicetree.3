Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10B247127B
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706838; cv=none; b=AulN89USgBBXbn6qPLsAYCLaalQ49M7oJRpqAYp7VeIjr95Pm6LGUaXdpbdFM9YA51kul+g6/B8AYd3A/OH2cyR9xaGCyTFIGilP8iLln4Ih9fFzucVkSlwk/0Hk0WB4khBx3ISb/1ry8muUPGV0BVpSksTsey2KgDdoKSk67dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706838; c=relaxed/simple;
	bh=VmhAEkwGkgo8FLtPCGsir35juOJm6RTqSNh7+mimhOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XAAW2RiAxdDUviKOOj+n7/oETb0ChWiVJCAaRirCso1XTAEyLu+cuNvUpNOvg5o/R9k86lPKRK9wFbpGPAxMl/IaT2GPTGUPR1RQCfT5yoLdf9lvuQTOjGYcp3kHdytQ2HzWjVpOxLTS9MoyO9V9xaWfE/gdf8Rhir94rfHyOeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JChiToRP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JChiToRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD351F000E9;
	Wed, 22 Jul 2026 07:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706837;
	bh=9J+7zqLwuctYHg635btE/wqBzxVqVc5f5QxUiJc5AxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JChiToRPqIcLG/fkrbonUilJwWpfdwr3gRCRmYZx6uzqYyigA+/E9Pcko/xhLxe3Z
	 QgbRu/7WMgS6IJUrFz8gD5+7hOqwfB+4gP6zZ/utH8LHLdrklkj1aTg8gfJEWNIJjz
	 A6jFcr3OZ5IqugZluLhTV3h1mU5RKZjTZyEl6xxWm5RQuOIttBFhrRDzbsK7/YCROz
	 XIXL36PUGSC0UFXSCn8Ta41uRvVdVhxJA9tW5NFFD5A56Lc64VWtaoqCDmVijpyUNT
	 TG3wqwHx8uiTHwTxT0KrFUX+cu/EGzgAF9XJOJO/5b+Cy5ktufTTNbbzrRwPabDJKZ
	 JD0vu0khm3kqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: add basic devicetree for
 Ayaneo Pocket DS gaming console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Hamamdjian" <azkali.limited@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722-pocketds-v4-3-438704cd51f7@gmail.com>
References: <20260722-pocketds-v4-0-438704cd51f7@gmail.com>
 <20260722-pocketds-v4-3-438704cd51f7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:53:56 +0000
Message-Id: <20260722075357.0DD351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `gamepad_pwr_en` pinctrl configuration lacks an output directi=
on property (e.g., `output-high;`), failing to statically drive the gamepad=
 power enable pin.
--

--- Patch [3]: [PATCH v4 3/3] arm64: dts: qcom: add basic devicetree for Ay=
aneo Pocket DS gaming console ---
commit ec748f97a724e3e498d7de4898d4226da0a677a0
Author: Teguh Sobirin <teguh@sobir.in>

arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

Add initial Device Tree for the Ayaneo Pocket DS gaming console based
on the Qualcomm QCS8550 platform.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts b/arch=
/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
> new file mode 100644
> index 0000000000000..bc9232fd4b711
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts

[ ... ]

> +&pcie1 {
> +	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 =3D <&pcie1_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +
> +	pcie@0 {
> +		/* Renesas =CE=BCPD720201 PCIe USB3.0 HOST CONTROLLER */
> +		usb-controller@0 {
> +			compatible =3D "pci1912,0014";
> +			reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> +
> +			avdd33-supply =3D <&upd720201_avdd33_reg>;
> +			vdd10-supply =3D <&upd720201_vdd10_reg>;
> +			vdd33-supply =3D <&upd720201_vdd33_reg>;
> +
> +			pinctrl-0 =3D <&gamepad_pwr_en>;
> +			pinctrl-names =3D "default";
> +		};
> +	};
> +};

[ ... ]

> +	gamepad_pwr_en: gamepad-pwr-en-active-state {
> +		pins =3D "gpio52";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};

[Severity: High]
Does this node need an output-high; directive to actually drive the gamepad
power enable pin?

The gamepad_pwr_en pinctrl configuration is consumed during the probe of the
PCIe USB controller, but without an output direction property, the pin might
remain unconfigured or rely on unstable bootloader state. Could this leave
the gamepad MCU unpowered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-pocketds-v=
4-0-438704cd51f7@gmail.com?part=3D3
