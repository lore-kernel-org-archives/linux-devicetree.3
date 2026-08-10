Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0253CC7CD
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363640; cv=none; b=cl+uzQNtlsquBT5zAT9kz1X4pDAJ2Fomvf/KZmeP5Rzp21A5iXKywXLZvd0RriUSvzx3KAmArsvtX3c3MqEf+yb+Pl3rxxmPjfseoTzA3uIs63JBrVCMbVD//AmPEQ8j1+wglAqUiH4kdmN/YJPLyJR6M1e3ir7zOeHNaUBrye4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363640; c=relaxed/simple;
	bh=iYlzfa+JJZguDfn5xK1/k+uRZV6TGUwEuRvb8RZMyOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JH2a8QpzKip58917qCkwTZ5LwCJ7Y9WC8MYNI5IR/WfmfwfX4qoslFCPq+yg2hD36ESztLy3qN3k6nup72Pk8jeSsOy8WyKlSAG9Uu63EqP98ERotfzKlnlpVMMyn3gJYbUEYP5vAO3cLz39ITsfNVjY912bGZLwY/KCv2otHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7Skn+yo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7Skn+yo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD161F00A3A;
	Mon, 10 Aug 2026 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786363639;
	bh=YRHPFMgdaA0yiUbbK8fEIq4YxUNO4dVldMnmHB8GPGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V7Skn+yotrckp+a0sTthvv3EhH3kYOIhz7IjmBJQ3qQnWkxmOyq+j9p7/P5Ugmad6
	 tqiZjC7vyyrGBMgot7ExPA7aAcrG0RW33BoukRJAO9PZs6wzeFL32tPmFyIrMm+QN7
	 7rq71ozSCPVG2lL4fuEx8D+KyNnGrlozBOpiHuGqWJK9PaMs/tCSV3yVbtpRKyk7M/
	 9GrV98LcLEgP6ipRQMuEoTwV7Zc9PmgiAzAc9UJk7o4rimUGFKVXpIjSEIKgNxFnke
	 br29Xc8j5fRmKNnaRzLzZ/vUJAHUgUPjciKnqH/8x7PyZhPluFJvsfNEgmjkHj+Fay
	 RkHIeAK+Yhx5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 USB3 host
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:07:17 +0000
Message-Id: <20260810120718.3AD161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `reset-gpios` and `vdd-supply` properties for the USB hubs and=
 peripherals will be completely ignored because their compatible strings ar=
e not supported by the kernel's onboard USB dev driver.
- [High] `qcom_ipq806x_usb_hs_phy_init()` overwrites the entire `HSUSB_PHY_=
CTRL_REG`, destroying bootloader-configured frequency straps for MSM8974.
- [High] SuperSpeed USB devices (AX88179 and PL2775) are incorrectly nested=
 under the HighSpeed hub (`hub_2_0`) instead of the SuperSpeed hub (`hub_3_=
0`).
- [High] The SuperSpeed hub (`hub_3_0`) is assigned an invalid port address=
 (`reg =3D <2>`), breaking DT node mapping for both root hubs.
--

--- Patch [10]: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable t=
he USB3 host ---
commit 316b8b1bbfd2cabe66fe0293f9ed61e3a48ec197
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

ARM: dts: qcom: apq8074-dragonboard: enable the USB3 host

The USB3 port of the dragonboard drives the onboard TUSB8040A hub with
the AX88179 GbE controller and the PL2775 USB-SATA bridge behind it.
This commit enables the DWC3 controller in host mode along with its PHYs
and describes the onboard chain as device nodes under the controller.

> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/a=
rm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
> --- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts

[ ... ]

> +	/* TI TUSB8040A four port hub */
> +	hub_2_0: hub@1 {
> +		compatible =3D "usb451,8043";

[Severity: High]
Will the reset-gpios and vdd-supply properties be ignored here?

The new compatible strings (usb451,8043, usb451,8041, usb67b,2775,
usbb95,1790) do not appear to be supported by the onboard_usb_dev driver's
onboard_dev_match array. The generic USB core parses these nodes but does
not natively handle reset-gpios.

Could this cause the reset lines to float and power sequencing to be
unmanaged, preventing proper enumeration?

> +		reg =3D <1>;
> +		peer-hub =3D <&hub_3_0>;
> +		reset-gpios =3D <&pm8941_gpios 6 GPIO_ACTIVE_LOW>;
> +		vdd-supply =3D <&pwr_c_3p3>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		/* Prolific PL2775 USB-SATA bridge on the DN0 port */
> +		device@1 {
> +			compatible =3D "usb67b,2775";

[Severity: High]
Are the SuperSpeed USB devices (AX88179 and PL2775) nested under the
incorrect hub here?

Since these are SuperSpeed capable devices, they will enumerate on the
SuperSpeed bus. By placing them under the HighSpeed hub (hub_2_0) instead
of the SuperSpeed hub (hub_3_0), the USB core won't be able to match the
enumerated device to a DT child.

Will this cause device-specific DT properties like reset-gpios to be
silently ignored during USB enumeration?

> +			reg =3D <1>;
> +			reset-gpios =3D <&pm8941_gpios 10 GPIO_ACTIVE_LOW>;
> +			vdd-supply =3D <&pwr_c_3p3>;
> +		};
> +
> +		/* ASIX AX88179 USB-GbE controller on the DN2 port */
> +		ethernet@3 {
> +			compatible =3D "usbb95,1790";
> +			reg =3D <3>;
> +			reset-gpios =3D <&pm8941_gpios 9 GPIO_ACTIVE_LOW>;
> +			vdd-supply =3D <&pwr_c_3p3>;
> +		};
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible =3D "usb451,8041";
> +		reg =3D <2>;

[Severity: High]
Is this port address valid for the SuperSpeed hub?

The APQ8074 DWC3 controller has a single physical port, meaning both root h=
ubs
should expose exactly one port (port 1). Because this uses reg =3D <2>, the
USB 3.0 root hub will look for port 1 and instead find hub_2_0 (which has
reg =3D <1>).

Does this leave hub_3_0 orphaned and break DT node mapping?

> +		peer-hub =3D <&hub_2_0>;
> +		reset-gpios =3D <&pm8941_gpios 6 GPIO_ACTIVE_LOW>;
> +		vdd-supply =3D <&pwr_c_3p3>;
> +	};
> +};

A related issue appears to exist in the PHY initialization sequence for this
hardware:

drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:qcom_ipq806x_usb_hs_phy_init() {
    ...
    writel(val, phy_dwc3->base + HSUSB_PHY_CTRL_REG);
    ...
}

[Severity: High]
Does qcom_ipq806x_usb_hs_phy_init() overwrite the entire HSUSB_PHY_CTRL_REG?

If the MSM8974 HS PHY probe reuses this function, calling writel() without a
prior readl() will destroy the bootloader-configured reference frequency
straps. This seems to contradict the requirement to preserve these strap
bits.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-msm8974-us=
b3-v1-0-1a47e1185524@oss.qualcomm.com?part=3D10
