Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E925328A2
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072797; cv=none; b=DHGBt3AjLL6g8ifnkG68sriil7kKc9ED0RzVoisQaFVcw5Cr0xOdoBMfw4zB3vt+rqrn8gJCyU/dbiWqyScSjmNuUrhOAI2Kahs8qsSdCKaxGZhtbaIhljdiQx1TObJR1jW561SPg6LxrOQbuKYz29cK0SNpCwa5b01QNf8beo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072797; c=relaxed/simple;
	bh=XuWivEnJYJKiaHfmQ95vZdOxboXTsOG5N2i3XYMFjeI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=leXnrUfiqdiTvRRkobv9gGjX3aoYAX04u8GMm2Yxqt8pVBbVIXCG8LTYDsdOD+kGXE0TNFuFZ1XSLyGSa13SfjTHKO9VpHmzZZJFXaXLUN7WFHAY8BwNsvqLWVmmdb4paZRqo/a5VP8Oftdq2Oju0fsNxIXoVx+7kaxQ2Kiy32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1AdChxW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1AdChxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706901F000FF;
	Tue, 22 Sep 2026 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790072795;
	bh=bk119CXEFKqyjqSKOZRxxBE8/OctHG2c6RP1QZIfbeg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T1AdChxWySv547fjmLLPHBtRoPgjKP2+giaDYZq+xlZD8wDxWvnJcgFbOGHSUK8CB
	 s9z937w5MzB1eGqoY8oojSxh9OpkA4CMOo4enwpXcL9qoddrA/futVWgxkBogahkPQ
	 3qe37FL2gbikMeS66c3SadW76F7ovPkOBnBbPEN1fj+qh2M06jntvJYZQ9haePpNlV
	 x1hz1qQbU2N4uuDWvmnnQ4Ye+L6qMfFIrjMt+9hMKUsr4eGnitVjtdDkat/p1HT4Zh
	 duQw6TYoR4T+9lvLW7HzwtP65jYpPwfHXdkz5vyAzwk78if0gwMUSaLZUlyRo9juCv
	 HC0r5jkhEsFXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add Acer Swift SFA14-11
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianfeng Liu" <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922100501.8888-3-liujianfeng1994@gmail.com>
References: <20260922100501.8888-1-liujianfeng1994@gmail.com>
 <20260922100501.8888-3-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:26:34 +0000
Message-Id: <20260922102635.706901F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: qcom: missing power-supply for backlight causes display black=
out
- [High] dts: qcom: swapped QMP PHY regulators risk hardware damage
--

commit 11d3bb0749b2f4ee1528ce4d8e70f906912678bb
Author: Jianfeng Liu <liujianfeng1994@gmail.com>

arm64: dts: qcom: Add Acer Swift SFA14-11

This commit adds device tree support for the Acer Swift SFA14-11 laptop,
based on the Qualcomm X1E78100 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts b/arch/a=
rm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
[ ... ]
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pm8550_pwm 3 500000>;
> +		enable-gpios =3D <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +
> +		brightness-levels =3D <30 255>;
> +		num-interpolated-steps =3D <225>;
> +		default-brightness-level =3D <170>;
> +
> +		pinctrl-0 =3D <&edp_bl_en>, <&edp_bl_pwm>;
> +		pinctrl-names =3D "default";
> +	};

[Severity: High]
Should power-supply =3D <&vreg_edp_bl>; be added here to ensure the backlig=
ht
regulator is claimed and remains enabled?

[ ... ]
> +	vreg_edp_bl: regulator-edp-bl {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VBL9";
> +		regulator-min-microvolt =3D <3600000>;
> +		regulator-max-microvolt =3D <3600000>;
> +
> +		gpio =3D <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&edp_bl_reg_en>;
> +		pinctrl-names =3D "default";
> +
> +		regulator-boot-on;
> +	};

[Severity: High]
Does this regulator need an active consumer or regulator-always-on? It is
defined with regulator-boot-on, but without any consumers in the device tree
(such as the backlight node), the kernel regulator framework will
automatically disable it during late init, causing the display to black out.

[ ... ]
> +&usb_1_ss0_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l1j_0p8>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Are these supplies swapped? It looks like the 1.25V regulator (vreg_l2j_1p2)
is mapped to the 0.88V core vdda-phy-supply, and the 0.88V regulator
(vreg_l1j_0p8) is mapped to the 1.2V vdda-pll-supply. Over-voltaging the
core PHY rail can cause hardware damage, and under-voltaging the PLL rail
will cause the PLL to fail to lock.

[ ... ]
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l2d_0p9>;
> +
> +	/delete-property/ mode-switch;

[Severity: High]
Could the vdda-phy-supply and vdda-pll-supply be backwards here as well? The
1.25V regulator (vreg_l2j_1p2) is mapped to the 0.88V core vdda-phy-supply,
and the 0.9V regulator (vreg_l2d_0p9) is mapped to the 1.2V vdda-pll-supply.

[ ... ]
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +	vdda-pll-supply =3D <&vreg_l3c_0p8>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Is this another instance where the supplies are swapped? It looks like the
1.2V regulator (vreg_l3e_1p2) is supplied to the 0.9V core vdda-phy-supply,
and the 0.9V regulator (vreg_l3c_0p8) is supplied to the 1.2V vdda-pll-supp=
ly.

[ ... ]
> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +	vdda-pll-supply =3D <&vreg_l3c_0p8>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Does this have the same swap issue as usb_mp_qmpphy0? The 1.2V regulator
(vreg_l3e_1p2) is mapped to the 0.9V vdda-phy-supply, and the 0.9V regulator
(vreg_l3c_0p8) is mapped to the 1.2V vdda-pll-supply.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922100501.8888=
-1-liujianfeng1994@gmail.com?part=3D2
