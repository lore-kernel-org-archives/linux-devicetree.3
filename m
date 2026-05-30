Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9686334
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 01:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780104453; cv=none; b=mu5P29NJ5mkmhQ4CW9IdhzuuYJ3onkcicpi49tJERVOrOGO9cWH3qC89RMK15XUjsQzEZlDZ+wn8mezf/sqUpvvz0mKQXEBIOgpPH7YjNI9ZjoLBV9OEp58Osa0GCEuKAXrZwoS8ELeByz8wSGV6W/o8XdfBzvYsJ66TGgIWDTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780104453; c=relaxed/simple;
	bh=jexv2mNPbt+3sO/sEhJ3QqssBTUG9UWO/s7GR43HobA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jp6+tk6T2ah0/UPidzd4QUT6QpoOrc/tF0k2XQ46MJweZDse1ot9UXySe4JAfM2wFPv0Y2K5XLdrKL9w7F8ielNTc6vmdiyAVoHYCh5DdWxjB3RxhgjTidBGg7289Ey+6cRUj1dxx0GXWpRbQ9/DfDsdkOmDDYXgSG7+huRSE10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY/8b0Q+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY/8b0Q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3817C1F00893;
	Sat, 30 May 2026 01:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780104452;
	bh=vE4DkWx/euhCMYN37mKvIX/9CJ0I2J4Ct9b6GZ0VZt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WY/8b0Q+S3wBRGErKVSiHjVqmU6FbbLt2IgZTIBs/IcHM8X6EDL2zG8GkK8U5+X10
	 fpfq5/14EOr7EtXhC4WkWeBrdNuQ9DWtP+0C6vY79KxaZKtGsX3YYN5NiBV81M9bQv
	 Qv87sqWqXGhUwgzlcninnGFskxY6AyQeEFulrWks6NHT/17h+jgkr2S65FXo4hfslt
	 xnH5zRfIheui1q0F0zOwOrkFL3NfujAwxRJ1VQrK0ix6WRrtnTu/7XXLaax32TO62z
	 teJSiToZOx2JAiTWvGnyhqIF46D9Y/vrfTUjZGsWxTVJsO8izqWrJKCw0br1GsA4U2
	 RoRBuJ3HRwNYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yepuri Siddu" <yepuri.siddu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 01:27:31 +0000
Message-Id: <20260530012732.3817C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `sw_ctrl` pinctrl node is defined but never utilized, and the =
required GPIO binding is missing from the bluetooth node.
- [High] UART7 is unconditionally disabled in the base industrial mezzanine=
 overlay instead of the M.2-specific overlay, breaking onboard Bluetooth fo=
r non-M.2 users.
--

commit 9cd1abaeac0567d92c13345a6a51b9b649ec7b1e
Author: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetoo=
th M.2 overlay

This commit adds a DTSO overlay for the QCS6490 RB3 Gen2 industrial
mezzanine board when the M.2 E-key slot is populated with a QCC2072
Bluetooth module. It configures UART4, sets sleep pin states, maps
host wakeup and power sequencing, and disables UART7 in the base overlay.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e-m2-cologne.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mez=
zanine-m2-cologne.dtso
> new file mode 100644
> index 0000000000000..905a40f4b938f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-co=
logne.dtso

[ ... ]

> +	sw_ctrl: sw-ctrl-state {
> +		pins =3D "gpio86";
> +		function =3D "gpio";
> +		bias-pull-down;
> +	};
> +};

[ ... ]

> +	bluetooth: bluetooth {
> +		compatible =3D "qcom,qcc2072-bt";
> +		max-speed =3D <3200000>;
> +	};
> +};

[Severity: High]
The commit message mentions "SW_CTRL is mapped to gpio86 for power
sequencing." Are we missing a reference to the sw_ctrl pinctrl node here?

It looks like the bluetooth node is missing a GPIO assignment (such as
enable-gpios or swctrl-gpios) and the corresponding pinctrl properties to
utilize the sw_ctrl state. Without these, will the Bluetooth driver be
able to request gpio86 and perform the intended power sequencing?

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index 83908db335afa..c96c7f52ea7a0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso

[ ... ]

> @@ -288,3 +288,7 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
>  &wifi {
>         status =3D "disabled";
>  };
> +
> +&uart7 {
> +	status =3D "disabled";
> +};

[Severity: High]
Does unconditionally disabling uart7 in the base industrial mezzanine
overlay break the onboard Bluetooth for non-M.2 users?

The commit message states this is done "as it is not used when the M.2 slot
is populated". Should this &uart7 override be placed in the M.2-specific
qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso overlay instead, so
it only applies when the M.2 slot is actually populated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529180234.3373=
056-1-yepuri.siddu@oss.qualcomm.com?part=3D3
