Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6983F8ED3
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107677; cv=none; b=FitJI28imviVIYkMpPWH1UDdDVtarFoP2yBMK24X1AqjaSz1Vqtf0KeKmmAKbTus7hMTYno5RKGKaFrjn35SqWQRM1v+Mslm7mCRK3XTLNNJkUtVE2Cr7a5Dwk5VYpkxnEZDvZNoJQ75MaqjB8YJ4LVQO8kSuPVytqPixsUOpyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107677; c=relaxed/simple;
	bh=PZ1sy0ttnQ6+03SqLRcVEn9x2iuUu+2g/bsno9SVfrQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MAQQaEXwG+Z33BwcuVBJ0XZYPYgPOFyy7dUWG+c0SN8j7U8LEPyikb0uOuIMZxive3Dw0ymFenYKHMTGEamPCFaLqQ8Y+OSayRrSp7ePp013W0V1c/BwlVoMkDUCQQfg7InctZVG55j26o2uPRgMnUtv5uau7NETIHtkK4Y5lX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QU6HcPbE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QU6HcPbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E6D1F00A3A;
	Fri,  7 Aug 2026 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786107663;
	bh=HgIz1YJ5c7U9cYZWb8x4HnIBIX6b0E3pgK+Ug04iM7A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QU6HcPbEDXUkG+lXdETnzCtLb0vL21Y1ekLBNmb2th6mZOsHgdU6jSd/5Wg55qHkK
	 AUI2+CqX3IX3m5GTg+666OpRW0U3oEzXAxQt/OiqOGVFs2Lf5LZKfbzjoW0XECqqW8
	 I8h1mZzh8G7m/cWNPX7eeX/JV0SYE52W/RDRLHEdyqiq7t3iIZgg+9obInynbBpgvZ
	 5cfYGBkTAxev2Koc7WS6DvMwo1pa/KxP2jC62CtWULcAT8csb6KEBRniMGytOMPKz3
	 W3Wda2nsGn8apnWBxLuh5MOXfVoExjo6isCVfX5oBXSNl44Ssjr0tnsEYyVfBhaTd+
	 oYwACCDCV7nTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-sm7125-samsung-v3-3-ac0139e5c612@gmail.com>
References: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
 <20260807-sm7125-samsung-v3-3-ac0139e5c612@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:01:02 +0000
Message-Id: <20260807130103.58E6D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The QMP (SuperSpeed) USB PHY is unnecessarily enabled while the =
USB controller is restricted to high-speed mode without an SSPHY.
- [Low] The `rmtfs_mem` node lacks a unit address in the common dtsi but ha=
s a `reg` property appended in the board files, causing a DTC warning.
--

--- Patch [3]: [PATCH v3 3/3] arm64: dts: qcom: sm7125-samsung: add initial=
 device tree ---
commit 7ad14e43b9cfd884317a8c3a0d039dc250371474
Author: Erikas Bitovtas <xerikasxx@gmail.com>

arm64: dts: qcom: sm7125-samsung: add initial device tree
   =20
Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
in 2021. Add initial device tree for SM7125 Samsung platform with
support for:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- UFS
- USB

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts b/arch/arm6=
4/boot/dts/qcom/sm7125-samsung-a52q.dts
> new file mode 100644
> index 0000000000000..ecba5be8164ea
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts

[ ... ]

> +&rmtfs_mem {
> +	reg =3D <0x0 0xf4f00000 0x0 0x202000>;
> +};

[Severity: Low]
Does this trigger a unit_address_vs_reg warning in the Device Tree compiler=
?=20

The rmtfs_mem base node is defined without a unit address in the common dts=
i,=20
but a reg property is appended here in the board file.

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> new file mode 100644
> index 0000000000000..b8863e111bc4f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi

[ ... ]

> +&usb_1 {
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode =3D "peripheral";
> +	maximum-speed =3D "high-speed";
> +
> +	status =3D "okay";
> +};

[ ... ]

> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l4a_0p9>;
> +	vdda-pll-supply =3D <&vreg_l3c_1p2>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Is it necessary to enable the SuperSpeed QMP PHY here?

The USB controller is restricted to high-speed mode and configured to ignor=
e=20
the pipe clock from the SuperSpeed PHY via qcom,select-utmi-as-pipe-clk.

Leaving the QMP PHY enabled might unnecessarily waste power and regulator=20
resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-sm7125-sam=
sung-v3-0-ac0139e5c612@gmail.com?part=3D3
