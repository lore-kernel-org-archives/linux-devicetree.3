Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8451EDEA
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 21:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804308; cv=none; b=VRpDI2bWyrYRea+6+hCZchYQTQp9Gjvdj8mfgSxYwW+FUMaCVtPYAv/vsPJjKqgz+reP47AyzfWc//SCP+BAbnwWjeSdutOPS16xW3xwLAWqiShB34mbM2MoCaj54lOetT2QKO2JuoViNhCKR8I/VIO+voYyze9OvLVgO7E89aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804308; c=relaxed/simple;
	bh=avtJ8h1Zf1oPXNbsfV7uE3FchLdMl2nSWsSanC0Qf6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g7QcwK81nA94D3WBJmk3u6iTTm2a6WuMzvH3o545/O3n5jIj0eAFQdQusDEMQQomWbgzjz/9hSDRywEDZ3C+RV+0GMeQ3n11QtfsVV6t88b71idrUSAqVA8AVbYGu7Fm2r/B2LzQFGjuHOVLzYDfrQPoOJG3FQgVIzY4j1cxFWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxKYqsZL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxKYqsZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C874F1F000FF;
	Wed, 30 Sep 2026 21:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804307;
	bh=4j2XdM7GeYSzARtaB8P4mFl85wGb+sR7G1ORD+dt1U0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxKYqsZLgdSYbXEkRrzYD6hRQoOT605CFy299o+GG96Vmgy7DwD5oxpKb7jhNONyR
	 qSb+IAcHLqhBqV+GP5I3moWJu0B439h/auGrwnBF/6ZXSVLEG8NRdMrC4c9A9qp27a
	 2lIKJ8SepIilhlmKUytz4hOUqoXumUREFJX0gwf/YkpCK7f+KYhRl0OSTHnBvvgSje
	 cZ0fWYWJszdUt3pWT2xLrRUTGdXjW3v9TIi7+elwJw1M3rEUIhoizul+N6p/jE0k4Z
	 SaWNIMLnqddLrU3Q6+o/KubOHu2NXZqdlS9ZC6T4HmT3Xs5+SYu8Gxa9UsrkFpmDGm
	 /whQVH7MErICQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxim Storetvedt" <mstoretv@cern.ch>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930212421.4810-4-mstoretv@cern.ch>
References: <20260930212421.4810-1-mstoretv@cern.ch>
 <20260930212421.4810-4-mstoretv@cern.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 21:38:26 +0000
Message-Id: <20260930213826.C874F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: swapped voltage regulators for USB QMP PHY nodes
- [Medium] dts: invalid power topology supplying 3.3V switch from 1.8V sour=
ce
--

commit e084aaae679956c0579caf519602293f9f79b553
Author: Maxim Storetvedt <mstoretv@cern.ch>
Subject: arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees

Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the Samsung
Galaxy Book4 Edge based on a common dtsi.

Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcud=
i4j2wogtr@4yecb2bkeyms/
Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/

> diff --git a/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi b=
/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
[ ... ]
> +	vreg_display_vdd: regulator-display-vdd {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_DISPLAY_VDD";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 120 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&display_vdd_en>;
> +		pinctrl-names =3D "default";
> +
> +		startup-delay-us =3D <400000>;
> +		regulator-enable-ramp-delay =3D <400000>;
> +
> +		vin-supply =3D <&vreg_octa_vdd>;

[Severity: Medium]
Is it expected that this 3.3V regulator uses a 1.8V input supply?

Looking at the definition of vreg_octa_vdd in this file, it is fixed at
1.8V. A 3.3V switch or LDO fed by a 1.8V source will cause the regulator
core to flag a 'supply voltage too low' or unsupportable constraints error
during probe when attempting to resolve the display voltage.

> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
[ ... ]
> +&usb_1_ss0_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l1j_0p8>;

[Severity: High]
Could these voltage supplies be swapped?

The 1.2V supply (&vreg_l2j_1p2) is assigned to the 0.8V PHY core rail
(vdda-phy-supply), while the 0.8V supply (&vreg_l1j_0p8) is assigned to the
1.2V PLL rail (vdda-pll-supply).

During device probe, this swapped regulator assignment will activate,
causing a significant overvoltage on the PHY core and undervoltage on the
PLL, which could lead to hardware damage or initialization failures.

> +
> +	status =3D "okay";
> +};
[ ... ]
> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l2d_0p9>;

[Severity: High]
Does this node also swap the voltage supplies?

Similar to &usb_1_ss0_qmpphy above, a 1.2V supply is incorrectly assigned
to the 0.9V PHY core rail.

> +
> +	status =3D "okay";
> +};
[ ... ]
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l2d_0p9>;

[Severity: High]
Does this node also swap the voltage supplies?

Similar to the earlier QMP PHY nodes, a 1.2V supply is incorrectly assigned
to the 0.9V PHY core rail here as well.

> +
> +	/delete-property/ mode-switch;
[ ... ]
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +	vdda-pll-supply =3D <&vreg_l3c_0p8>;

[Severity: High]
Does this node also swap the voltage supplies?

A 1.2V supply is incorrectly assigned to the 0.8V PHY core rail here as
well.

> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930212421.4810=
-1-mstoretv@cern.ch?part=3D3
