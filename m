Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF80721A434
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 19:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780774225; cv=none; b=f9hgky+s2AnplgWjNdO2LzHrOwLECAirSpOzmA8R6fPwSyQQfU95A0uU2ngph3Ak5hjwey27nL//8Y85wmm44eqL285zJ8SKp0K9KyxdF9+Jd8gNXU7Hpymx14mc0BHULeuwDh316cnMgjiI/T40NZ+uknd17gKmOHZYjvI2aZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780774225; c=relaxed/simple;
	bh=QKYHY0qgMcMoBTNwpncxRqngwXcB4yMBhr4n9IkeS10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ugjaQTRgB/bmYQeh3lVP0HYrOo+IF0C9FLCcdG76qFRuJNiWJPCSYjVlc+9/7n932+jl9u3XPwUW1tvSO4yjt3guvFperSoWf/TD4zFWG8xJ/87GNI9GWb6ET+rqjJSNmLwj16Mvjfmq/bBrjoNeF4Gyth2zgUNBWQKQvTqVEGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUyWH2Ns; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUyWH2Ns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591D61F00893;
	Sat,  6 Jun 2026 19:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780774222;
	bh=jE4HYmDjPwCf/zXFM46m6catfSXXNqYLsPE71lyrV7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QUyWH2Nsy5q09AJL8L3emnv3b1TAfYiTprTeJQuu43CoSaO8WIhQZpmeDxyZD7+1Y
	 GwlvSSmSyg8ZFGYM2bW/aAPDM6RAH+x5TUlQPH/dT3R0o+C0Ryd5vCYXmdmtgtrfyE
	 TICJ9SnQMEd1tYF9HN6NpHdgGnVyQQWFdGCb/tQbExuPL+T06Ox9FJ7vcy1UUTpRlW
	 NI3dLXaQFr9sZ5cM2fijZLuAgb0p913yNWzBCbA4Fq43gLTy8aOpOAiw0UEkC5j6J5
	 t2KY8Y/CyKOJ5PMwMugQ8wmDtZihoclatbq8iKm95G7p2cD8qS1ikRzVwL7tjR1hM8
	 tLKf6fN7k9Y2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Move PCIe GPIOs to
 root ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260607-rubikpi-bugfix-next-20260605-v1-1-ff97c5e35bf6@thundersoft.com>
References: <20260607-rubikpi-bugfix-next-20260605-v1-1-ff97c5e35bf6@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 19:30:21 +0000
Message-Id: <20260606193022.591D61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving reset-gpios to the root port node without moving `phys` bre=
aks PCIe reset initialization, leaving the endpoints stuck in reset.
--

commit 061c47f23072e39770a5af921fae6283ad631fb1
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

arm64: dts: qcom: qcs6490-rubikpi3: Move PCIe GPIOs to root ports

This commit moves the PCIe0 and PCIe1 reset and wake GPIOs to their
root port nodes in the qcs6490-thundercomm-rubikpi3 device tree. This
keeps the GPIO ownership with the device below the root port to match
the updated PCIe binding expectations.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/=
arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index f47efca42d48d..5c08ab53cdbd9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
[ ... ]
> @@ -830,10 +827,12 @@ &pcie0_phy {
>  	status =3D "okay";
>  };
> =20
> -&pcie1 {
> -	perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> -	wake-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
> +&pcie0_port {
> +	reset-gpios =3D <&tlmm 87 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +};

[Severity: High]
Does moving reset-gpios to the root port node without also moving the
phys property break PCIe reset initialization?

In drivers/pci/controller/dwc/pcie-qcom.c, qcom_pcie_parse_port() expects
to find the phys property on the port node:

qcom_pcie_parse_port() {
        ...
        phy =3D devm_of_phy_get(dev, node, NULL);
        if (IS_ERR(phy))
                return PTR_ERR(phy);
        ...
}

Because phys remains defined on the host node in the underlying base
dtsi, this returns -ENODEV and falls back to qcom_pcie_parse_legacy_binding=
().

The legacy parser then looks for perst-gpios on the host node:

qcom_pcie_parse_legacy_binding() {
        ...
        reset =3D devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
        if (IS_ERR(reset))
                return PTR_ERR(reset);
        ...
}

Since this patch removes perst-gpios from the host node, this silently
returns NULL and the driver proceeds without acquiring the reset GPIO.

With pinctrl configuring the pin as output-low, won't the endpoints remain
stuck in reset indefinitely?

> =20
> +&pcie1 {
>  	pinctrl-0 =3D <&pcie1_clkreq_n>,
>  		    <&pcie1_reset_n>,
>  		    <&pcie1_wake_n>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607-rubikpi-bu=
gfix-next-20260605-v1-1-ff97c5e35bf6@thundersoft.com?part=3D1
