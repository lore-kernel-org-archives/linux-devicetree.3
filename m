Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817986;
	b=Lfw34WKfjwJSiVzcoVsyZGbjy2KUFtKinK3LLkUUhzPYEQrZSUt2bgVGrLMYjoNiFqDB
	 DgvC8W3A1+pBjnQ7uPsVix7nXDCgKlpW2JwxP7UWtUQc2BLaG/FN+iW7xyo/z2fjQeAPo
	 ocInCRYygaXcXAn9XE4V3jrRJgUPN6KKadzG+4/VXHJM85tZR+O4ycgL6jXfMqCXG6FT6
	 tz0zaoqcMVJwZNlHNK2QZ7K4gzulpqWP0Count4ttPJq1v4W2pod9KaZeld/7zdrItpqh
	 36rhU989WqbK7uihgKArMrId5CPfdhH4dbes5m3nX0LyHU5SgHs+n70/Q68SJQOLBqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817986;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jz+qGbVpfUavIZ1YsgkL0VpfWcew4IU/BRd4U7uuyaQ=;
	b=BhR+WHHc+4NsBpLqTLLUd8sWo6WKVngHJRYVYswN7BHOf4fmxqTS7W34fU46gpzq76If
	 e+SjEX33l+wMXXrjGLGeGT374jFhheCMaqSL2EixcFJKSx6logYsMCJO+WtzyHN76O6fj
	 gFoGxsI5/PVNDafJZBYOF3mBmZLxupROP9oEK93zN5ZlhdpB9pltSl7o63sp0dwfvtT0R
	 5n8W3AI6W0lClJ+3WdeMY9ipWliTBW2r3KXe68oaB3amI2PiR6g7Yl+3Gm3jpDea9oChU
	 p5l7plGaiku65gNdSaB2tFGdFQJ3XhleNTCpJ/VrNMa4tRbuXT4rAU4i80YzNF39LRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKqw8Dsp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA11A606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 04:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKqw8Dsp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204381F01825;
	Sat, 24 Oct 2026 04:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792817985;
	bh=jz+qGbVpfUavIZ1YsgkL0VpfWcew4IU/BRd4U7uuyaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NKqw8DspMJsb7q6VF1CIdiiP+JqBOFXtem9m2NvHmYpabR61wsn/czkZZyorRkImO
	 PjJRScTVTFofuv9bIK3OuerPMuFdDAEmXqx86tHEBQG05B2Ve/SUiiSjR9n3eVaPZ9
	 RXPv3IKY8mwdWyBfgSAIoq2k6VyacozEZ0UWMMtBl1W8t6into6NDV1QmNxtVqjEAP
	 co8gFXOQozk4zOcF128xjaRFV3LgwgQx2to49AHZyyPAB1aBLSw2GxTxDa3qRWoZD1
	 aFPpmYKmZZHk/pqsB+d75OE2cx0vPfiNiswtk9ElNFS/1MoRahTgv4M/QroIImPMFS
	 s3aIXm0mRRRAg==
Message-ID: <sashiko-outbox-183551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jeff Roach" <jeff.roach0@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261024044650.9936-3-jeff.roach0@gmail.com>
References: <20261024044650.9936-1-jeff.roach0@gmail.com>
 <20261024044650.9936-3-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 04:59:44 +0000
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
- [Medium] arm64: dts: qcom: missing data-lanes on usb_2_qmpphy in qmp_comb=
o_probe()
--

commit 445e95f688e19265eba79721f7454f1310f9d5f6
Author: Jeff Roach <jeff.roach0@gmail.com>

arm64: dts: qcom: Add HP OmniBook X 16-cp1

This commit adds a device tree for the HP OmniBook X 16-cp1 laptop based on
the Qualcomm Mahua (Snapdragon X2 Elite) SoC, enabling keyboard, touchpad,
touchscreen, PCIe NVMe and Wi-Fi, USB-C and USB-A ports, eDP panel, remotep=
rocs,
and audio.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts b/arch/ar=
m64/boot/dts/qcom/mahua-hp-omnibook-x16.dts
> new file mode 100644
> index 0000000000000..94882596d83e4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts

[ ... ]

> +/* USB-A port on the right side */
> +&usb_2 {
> +	dr_mode =3D "host";
> +
> +	/delete-property/ usb-role-switch;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply =3D <&vreg_l4c_e1_0p91>;
> +	vdda12-supply =3D <&vreg_l4f_e1_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_2_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l4c_e1_0p91>;
> +	vdda-pll-supply =3D <&vreg_l4f_e1_1p2>;
> +	refgen-supply =3D <&vreg_l1c_e1_0p91>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Should usb_2_qmpphy also define a static USB3 data-lanes mapping under
ports/port@0/endpoint@1 when mode-switch and orientation-switch are deleted?

In arch/arm64/boot/dts/qcom/glymur.dtsi, usb_2_qmpphy only defines an empty
unnumbered endpoint under port@0 without data-lanes:

	usb_2_qmpphy: phy@88e1000 {
		...
		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			port@0 {
				reg =3D <0>;

				usb_2_qmpphy_out: endpoint {
				};
			};

When neither mode-switch nor orientation-switch is present,
drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_probe() falls back to
reading static lane mappings from port@0/endpoint@0 (for DP) and
port@0/endpoint@1 (for USB3):

	if (of_property_present(dev->of_node, "mode-switch") ||
	    of_property_present(dev->of_node, "orientation-switch")) {
		ret =3D qmp_combo_typec_register(qmp);
		if (ret)
			goto err_node_put;
	} else {
		enum typec_orientation dp_orientation =3D TYPEC_ORIENTATION_NONE;
		enum typec_orientation usb3_orientation =3D TYPEC_ORIENTATION_NONE;

		ret =3D qmp_combo_get_dt_dp_orientation(dev, &dp_orientation);
		if (ret)
			goto err_node_put;

		ret =3D qmp_combo_get_dt_usb3_orientation(dev, &usb3_orientation);
		if (ret)
			goto err_node_put;
		...
		} else {
			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
		}
	}

Without replacing usb_2_qmpphy_out with endpoint@1 containing data-lanes
(such as <1 0> or <2 3>), both dp_orientation and usb3_orientation remain
TYPEC_ORIENTATION_NONE. Does this cause qmp_combo_probe() to emit the warni=
ng
above, leave qmp->qmpphy_mode at QMPPHY_MODE_USB3DP instead of
QMPPHY_MODE_USB3_ONLY, and leave qmp->orientation unset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024044650.9936=
-1-jeff.roach0@gmail.com?part=3D2
