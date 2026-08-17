Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010EA4418FF
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980228; cv=none; b=Zl6PsKCVkhXrrFv7CmWQ5fhTcRpPy7LEOHxRdap6gPyOjPxJm9kUOyxaSK6tjTvUyC0gAYrgGbnE+zf3MuBKr1roSTzgsrFVN7NuaSOzDlphBllbpP/hY3Z2eO5TktUOrty2JglGANxd5ysvgWV/NfIuI830e0KmhMkJGscJNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980228; c=relaxed/simple;
	bh=vExaptpNCXN2r0WgnOwHv1Js4YO7woTqeX/Jhxi8JX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E8iTyAkWkGh1ZP0ylSfeVOzCrGvyHTo0oRUv9a7bqESXLNde2de0WWFhCcbpQeZjsCEYi6sxkQzjMHsn1LI0SCrinFd5/u4TVGd4DIOgHW5Jfkyra1F8IWO3iUGGKiNjdR5MR2r29QMjPRZ6dJGlQpgQGtN6J8oJCfx3+VmZu20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMDAlTeY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMDAlTeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7FD1F000E9;
	Mon, 17 Aug 2026 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786980226;
	bh=pHWn2RnBhDm0IQ8WmG185T162Ow6WJAznShZWE+kgMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aMDAlTeY0/CH147CWKWRNhYwcIZ0qC4YPgsudWwrTq1PJrunDpVcbTBuRknzZSwbJ
	 BHE+vGGbrgcVykqLQv5sJNVlmdONxtLfIESQDPOyfesWmZ5eZOQMI3xdmNCKakrQRI
	 NX8G9EFYeQr4zy3bco4u2MupF9X7Cv9b6WJEjswnayOJINeadES6KL/MZy9O/s9gOP
	 qbez0K0PG6JLWT9BOJY0PdTy9y9bIpxmG4xbnXCc1n2lAg1QtO+liTEvxdH2Rv7KfL
	 ZKisRDDMx8q0EzYuBvH1Oxk81GakEEcA59DoiktUmd14bkGWy4JdO8KFGn7Kq8aNR8
	 raBZvNomsPOiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Pettit" <jason.pettit@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-glymur-send-v4-2-3fb89cec703e@oss.qualcomm.com>
References: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
 <20260817-glymur-send-v4-2-3fb89cec703e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 15:23:46 +0000
Message-Id: <20260817152346.7F7FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The QMP PHY vdda-phy-supply and vdda-pll-supply regulators are=
 swapped on all USB PHY nodes, supplying 1.2V to the 0.9V core and 0.9V to =
the 1.2V PLL.
--

--- Patch [2]: [PATCH v4 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 A=
I ---
commit 202cffb7469000f285c774f7cd690578bdee2992
Author: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: arm64: dts: qcom: Add HP EliteBook X G2q 14 AI

Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
(Snapdragon X2 Elite / Glymur). This includes support for the internal
eDP panel, USB Type-C, chassis HDMI, USB-A host, NVMe, and other internal
peripherals.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arc=
h/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> new file mode 100644
> index 0000000000000..7993f0e70fc00
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> @@ -0,0 +1,1032 @@

[ ... ]

> +&usb_0_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply =3D <&vreg_l3f_e0_0p91>;
> +	refgen-supply =3D <&vreg_l2f_e0_0p94>;
> +
> +	status =3D "okay";
> +};

[Severity: Critical]
Are the regulators for the QMP PHY swapped here?

Supplying 1.2V to the 0.9V core (vdda-phy-supply) causes an overvoltage that
can physically damage the hardware.

Additionally, supplying 0.91V to the 1.2V PLL (vdda-pll-supply) means the P=
LL
will fail to lock, rendering the USB interface non-functional.

[ ... ]

> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply =3D <&vreg_l1h_e0_0p94>;
> +	refgen-supply =3D <&vreg_l2f_e0_0p94>;
> +
> +	status =3D "okay";
> +};

[Severity: Critical]
Could the regulators for this QMP PHY also be swapped?

Just like usb_0_qmpphy, it appears 1.2V is being supplied to the 0.9V core =
and
0.94V is being supplied to the 1.2V PLL.

[ ... ]

> +&usb_2_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply =3D <&vreg_l3f_e0_0p91>;
> +	refgen-supply =3D <&vreg_l2f_e0_0p94>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status =3D "okay";

[Severity: Critical]
Does this PHY also have the supplies swapped between the 0.9V core and
the 1.2V PLL?

[ ... ]

> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply =3D <&vreg_l2h_e0_0p88>;
> +	refgen-supply =3D <&vreg_l4f_e1_1p2>;
> +
> +	status =3D "okay";
> +};

[Severity: Critical]
Are the supplies swapped on this PHY as well, causing an overvoltage on the
0.9V core?

[ ... ]

> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply =3D <&vreg_l2h_e0_0p88>;
> +	refgen-supply =3D <&vreg_l4f_e1_1p2>;
> +
> +	status =3D "okay";
> +};

[Severity: Critical]
And here as well? It looks like the same swap pattern applies to all the
USB PHY nodes in this board device tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-glymur-sen=
d-v4-0-3fb89cec703e@oss.qualcomm.com?part=3D2
