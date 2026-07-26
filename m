Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E71A6809
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077190; cv=none; b=mploiAHS6pg81ArQZKOpSxG0cdyGNk00jojn5BzJw0wer/EQD5bwpnxTaDdA7CrzP4joK07QdAnzt6iYRu6YmJ8t+r3g0n0GLc6Dz0Avy2kYM4xhzYxvb1DZaPdtPwo+usIvD8xkeuSlqR7GOHHG0XDdyPgDHKd0u1KUXJOvnA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077190; c=relaxed/simple;
	bh=sGtqhPsn3wEM7s86b86erp1WPWsiYIOM4dsnkhcEXA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fznkWicJnZSwbha1anqLGQzh7lIRcdwJdP936qqm/gUznzwNjHzbxz2U+VNEobVp9EnpCg2N5qGQizmP+LeyyWA8rH7bvslDdL30iM5sZ0TMNLSAx34fEfNsOegbTJwgvXKL1b1dTjYp9K37nd1eCi/EyaH4HBpcg8G/+OSqVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZGmXGP7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZGmXGP7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C961F000E9;
	Sun, 26 Jul 2026 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785077189;
	bh=mYE/T4RIl+UCf++mrtjVDX/XhqL8MDwjXb2OK2XFCXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dZGmXGP7EWRTtFCts+RwxoJr/j4B9A1wRntByIeFxT3s2sle92jaMokkUHYCjcaJw
	 gRtblZlZIR/f1KKTZyFBIOE6C9L1ecjfXTxmiFL43zRLG4uW3HGo+33/Mrlwq29df/
	 QAk2ZqXH6EgG6XC1/J/71H8r4oJx/fC7Y8WhzLI4PoGfYSQT5RZpWfe/MYsKFa4C74
	 KrwNDOzTn1yGk3bv2cZo2Qa4Ty2qrMBwCG2R4pcpELzq8cO8Pc/wf6h+0k8AbipT72
	 ZcVmMEpwf2bpWiJuRbxJUbHocO1+D9OT8igKvWkbEQb7aZyz1Fd8bbihGklQDvPj+1
	 gWGI6C3r+YqLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700
 Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260726143048.130116-3-mitltlatltl@gmail.com>
References: <20260726143048.130116-1-mitltlatltl@gmail.com>
 <20260726143048.130116-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 14:46:28 +0000
Message-Id: <20260726144628.C7C961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] Framebuffer broken by mdss overriding and incorrect splash-regio=
n node name.
- [Medium] SD card detect GPIO has inverted polarity in the Devicetree.
- [Medium] The aw99706 backlight node uses the property 'enable-gpio' inste=
ad of 'enable-gpios'.
- [Medium] Missing 'vdd-s4-supply' for populated smps4 regulator in regulat=
ors-3.
- [Low] DWC3 port@2 mapping is invalid and unsupported by the role switch f=
ramework.
- [Low] Invalid 'data-lanes' configuration for CPHY mode in mdss_dsi endpoi=
nts.
--

--- Patch [2]: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y=
700 Gen4 ---
commit 0b24150b2f36abd3f0b1e0dcdac6cf1e84f0c2fb
Author: Pengyu Luo <mitltlatltl@gmail.com>
arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4

This commit adds the initial devicetree for the Lenovo Legion Y700 Gen4
tablet, which is based on the sm8750-qrd platform. It supports basic
functionality including USB, framebuffer, buttons, and battery charging.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 0000000000000..6e4f8e9015fee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
[ ... ]
> +	reserved-memory {
> +		/*
> +		 * Use this to tell the BL to initialize the display related
> +		 * resources, so we can use efifb. Please 's/-/_/'
> +		 */
> +		splash-region@fc800000 {

[Severity: Medium]
Does the hyphen in this node name prevent the ABL bootloader from matching
the splash region memory node? Should this be renamed to
splash_region@fc800000?

[ ... ]
> +	regulators-3 {
> +		compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +
> +		vdd-l1-supply =3D <&vreg_s1d_0p97>;
> +		vdd-l2-supply =3D <&vreg_s3g_1p8>;
> +		vdd-l3-supply =3D <&vreg_s7i_1p2>;
> +		vdd-s1-supply =3D <&vph_pwr>;
> +		vdd-s3-supply =3D <&vph_pwr>;
> +
> +		qcom,pmic-id =3D "g";

[Severity: Medium]
Since vreg_s4g_0p75 is defined further down in regulators-3, is a
vdd-s4-supply mapping missing here alongside vdd-s1-supply and
vdd-s3-supply?

[ ... ]
> +	backlight: backlight@76 {
> +		compatible =3D "awinic,aw99706";
> +		reg =3D <0x76>;
> +
> +		enable-gpio =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Should this property be named enable-gpios instead of enable-gpio?

[ ... ]
> +&mdss {
> +	status =3D "okay";
> +};

[Severity: Medium]
The commit message states "- Framebuffer (Require mdss and dispcc to be
disabled)". Does enabling the mdss node here override and break the
simple-framebuffer fallback intended by the splash_region setup?

[ ... ]
> +&mdss_dsi0_out {
> +	remote-endpoint =3D <&panel_in_0>;
> +	data-lanes =3D <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply =3D <&vreg_l3i_0p88>;
> +	phy-type =3D <PHY_TYPE_CPHY>;

[Severity: Low]
Is it correct to specify 4 data lanes for mdss_dsi0_out when the PHY type is
set to PHY_TYPE_CPHY, which natively supports up to 3 trios? Should
data-lanes be updated to <0 1 2>?

[ ... ]
> +&sdhc_2 {
> +	cd-gpios =3D <&tlmm 55 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Looking at sdc2_card_det_n, gpio55 is configured with bias-pull-up. Shouldn=
't
cd-gpios use GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH to correctly handle
the physical pull-down upon SD card insertion?

[ ... ]
> +&usb {
> +	dr_mode =3D "otg";
> +	maximum-speed =3D "super-speed-plus-gen2x1";
> +
> +	status =3D "okay";
> +
> +	ports {
> +		/*
> +		 * USB2.0 is shared for two ports, set pinctrl eusb_mux_default
> +		 * to select the repeter. Plugging out one of them will reset
> +		 * the DWC3, which causes both of them to be disconnected.
> +		 */
> +		port@0 {
> +			reg =3D <0>;
> +
> +			usb_dwc3_hs: endpoint {
> +				remote-endpoint =3D <&pmic_glink_hs_in>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg =3D <2>;
> +
> +			usb_dwc3_hs2: endpoint {
> +				remote-endpoint =3D <&pmic_glink_hs_c2_in>;
> +			};
> +		};
> +	};
> +};

[Severity: Low]
Is port@2 mapping valid for the dwc3 node? The role switch framework does n=
ot
typically support port 2, which could cause issues with Type-C connector
multiplexing. Should port@2 be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726143048.1301=
16-1-mitltlatltl@gmail.com?part=3D2
