Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267663C0639
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779776945; cv=none; b=hVX5S0q9b1o4fgTHYFojOjWZdGZ0gnxDTfJv73Hrm53VAGUZfG3SGDrpZ9OaUgzSaQYXIVlT3vvcxfBeFrBYoj3ckCXwKI85FwrCnuV/uwGDGFBz1SSC35qG7P0lj7ryd9OGWuXOi8rkw/W9hdsFtDrr4HRccl4XNEtPkQ5x7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779776945; c=relaxed/simple;
	bh=LLp4xk81XvSl0TqCmYuoGlgdq34x3Ta7aTqO6kbjNHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VFTOZaaQB4zfVnY0zYcxHAwCldV3uquJbpBMLIlnsCBKDAFP6gJ3HhEfD/f1oN+ZrFw21g9FXzVe1tWG5kPabyFEFzzQtWSRJIcy6qJFUPBMAjYZ1YQ2958vGb9JTa6jkRPrDVS+B39FeWYGJQUMamncwndQwPBiX4w/zgUohcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkO728N+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkO728N+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19CE1F000E9;
	Tue, 26 May 2026 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779776941;
	bh=9G08+jHNQo/pDBk8uqMaYGIAJjZv0qGoYAgBFXtuwE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OkO728N+JQN5prLSl1CH+7CGZWTtEqzUFPqP+QKgoH7fpNfbu/263SIZdACPnMvFV
	 JdRA+GnYPVrJVd7fmMYb8vuJcMPJgECjHeM8gJj9d6yLkGspc7oB9L2vj4r+YPGRNb
	 Mdy2jduyCbBjpdv/QeS5mnQtGv7vDpPr5i/AXdr8zsFZb/+31KPv5QaiKyGvFeVxKA
	 8X5VTyuISKA988nB4JsiQwqApjm/PapRNKy1gLEfEq6SjRSpCRqOOvH1g8eC5VmhsV
	 5wv960tselFOpvZ3Ot75e0xhSIBad3uk9We2xHMCqfM5TinPdzexFkFaulHqKVDTE5
	 xy0EAD3bPO05Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 RESEND 5/5] arm64: dts: qcom: Add device tree for
 SA8797P Ride board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 06:29:00 +0000
Message-Id: <20260526062900.B19CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Thermal zones lack a critical trip point and use passive trips wit=
hout cooling maps.
- [Medium] UART nodes are enabled without pinctrl configurations.
--

commit 2a7d549a569e32271efac6bc43150f202ba201ce
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for SA8797P Ride board

This commit adds the initial device tree for the Qualcomm SA8797P Ride
reference board. It configures the primary and secondary serial consoles,
enables UFS storage support, and defines multiple thermal zones.

> diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/=
dts/qcom/sa8797p-ride.dts
> new file mode 100644
> index 0000000000000..d429de313f248
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts

[ ... ]

> +&thermal_zones {
> +	pm_kobra_thermal: pm-a-die-thermal {
> +		polling-delay-passive =3D <100>;
> +		polling-delay =3D <0>;
> +		thermal-sensors =3D <&scmi23_sensor 3>;
> +
> +		trips {
> +			trip0 {
> +				temperature =3D <115000>;
> +				hysteresis =3D <5000>;
> +				type =3D "passive";
> +			};
> +
> +			trip1 {
> +				temperature =3D <135000>;
> +				hysteresis =3D <5000>;
> +				type =3D "passive";
> +			};
> +		};
> +	};

[Severity: High]
Are we missing cooling maps and critical trip points in these thermal zones?

These passive trips set high temperature limits (up to 135C for PMIC and 12=
5C
for UFS) but lack a cooling-maps section, meaning the thermal core cannot
take action to throttle a cooling device.

Furthermore, by omitting a type =3D "critical" trip point, the kernel is
prevented from performing an emergency orderly shutdown when excessive
temperatures are reached. Does this leave the hardware unprotected against
thermal runaway?

[ ... ]

> +&uart4 {
> +	status =3D "okay";
> +};
> +
> +&uart15 {
> +	status =3D "okay";
> +};

[Severity: Medium]
Do these UART nodes need pinctrl configurations?

They are enabled without defining or assigning any pinctrl properties
(such as pinctrl-0 and pinctrl-names). On Qualcomm platforms, explicit pin
multiplexing configurations are usually required to map UART TX and RX
lines to physical pins.

Without these properties, will the UARTs fail to route data and remain
non-functional unless they rely purely on implicit bootloader configuration=
s?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526051300.1669=
201-1-shengchao.guo@oss.qualcomm.com?part=3D5
