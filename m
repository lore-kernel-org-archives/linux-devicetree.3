Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952BE48A8B9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809044; cv=none; b=ddBwuUW9RQCAwPBxtGXYXf/qJwdlDz9WBm+PCJIJzo9pqfUxqU3wCqNDyv+wPtYp9MgUVOA00ugWuP/J81TgqKixMqXikp80TJ58tSHxQWQKtc5OcD+S7+d4bTloCSIzHofIaP1chvxBhZvROyLaauLohhw9XuXWnIp/rSWFnDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809044; c=relaxed/simple;
	bh=FJlJKXcgGN/FbZ/5/zOoPjAkD26G4L0w5SAy3puEQqE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RPN76W50TuYn7LuSk5rhF5l3ImRj1FTSNTEuf3CltdKhl/vD8FFu+QE1a/NFSQEgHnIqBbCHCk+qc+cVd4Ygczoe6XaM+QbQKHRFkuN1cpHysa7Kr+z8IvP+t6dtpeVmLPs0p4gW7/HZSMiMjtI1b27u6RUpK9SVU7+dRfPcy2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1IpHqzg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1IpHqzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A763F1F0089B;
	Mon, 12 Oct 2026 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791809042;
	bh=bGiEHSMkACvJfzn4J/gKQMRENm2j7g7PaDzjEAr0bZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X1IpHqzgUjBB5qLqWn/iDU6ILb8nAnfzzkMI5ErwYQtChsJhO7F8+IVdc6cFNhUh8
	 7y7gjm/jP3Y1gjzBuIsj+edRN3KRqqXTT4KM+tm23jt6UMmtB690BqU90x6aB63Dh0
	 k8pO0FIoXjfAyWt6dsqTqxSMUcqMqPgv2x+c3dzgT739thoXVXOXHF7lUgfQ8kGLgd
	 wohZx+T+kIeatBYutDLfx8iVtmwrVDhvz4UZgAbm6QRUDFPmeIvh57o5mMiLVxys8L
	 cWJudOyO0v5wapguf/0jNEhGIudwTt3eJtp2EvsT5PcjrEniwG/qzshPy95FvQXMSq
	 3FxGQ2AhXxsNA==
Message-ID: <sashiko-outbox-168122@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linghui Wu" <linghui.wu@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:44:01 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: qcom: shikra: overlay references missing &pcie and &tc9563 =
labels
- [Medium] dts: qcom: shikra: i2c3 bus left disabled in Wi-Fi/BT overlay
--

commit c7775498584a8a4439bd0383ef59c4918ec334ae
Author: Linghui Wu <linghui.wu@oss.qualcomm.com>

    arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay

    Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on Qualcomm
    Shikra IQS EVK.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/ar=
ch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> new file mode 100644
> index 0000000000000..3264c0add67bd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> @@ -0,0 +1,107 @@
[ ... ]
> +&i2c3 {
> +	qps_gpio_expander: gpio@3c {
> +		compatible =3D "nxp,pca9534";
> +		reg =3D <0x3c>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +};

[Severity: Medium]
Will this GPIO expander probe successfully? The i2c3 bus is disabled by def=
ault
in the base SoC device tree, and this overlay adds the expander to the bus
without explicitly setting status =3D "okay" to enable the controller.

Since the m2_keye_3p3 regulator relies on a GPIO from qps_gpio_expander, the
expander failing to probe will cause the regulator to defer indefinitely,
leaving the Wi-Fi/BT module unpowered.

> +
> +&pcie {
> +	iommu-map =3D <0x0 &apps_smmu 0x0800 0x0 0x1>,
> +		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
> +	vddpe-3v3-supply =3D <&m2_keye_3p3>;
> +};

[Severity: Medium]
Are we missing prerequisite patches for the base Shikra device tree? The
overlay targets the &pcie label, which does not appear to be defined anywhe=
re
in the base device trees (shikra.dtsi, shikra-iqs-som.dtsi,
shikra-iqs-evk.dts). Applying the overlay will fail with an unresolved phan=
dle
error.

> +
> +&pcie_port0 {
> +	compatible =3D "pciclass,0604";
> +	reset-gpios =3D <&tlmm 118 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcie_port0_ep: endpoint {
> +			remote-endpoint =3D <&m2_e_pcie_ep>;
> +		};
> +	};
> +};

[Severity: Medium]
Similarly, does the base tree define the &pcie_port0 label? It also appears=
 to
be missing from the base tree, which will prevent the overlay from applying.

> +
> +&tc9563 {
> +	reg =3D <0x1ff00 0x0 0x0 0x0 0x0>;
> +	status =3D "disabled";
> +};

[Severity: Medium]
Is the &tc9563 label present in the base tree? The overlay attempts to disa=
ble
this node, but it seems to be entirely missing from the base Shikra device
tree, which will also result in unresolved phandle errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012122934.3240=
030-1-linghui.wu@oss.qualcomm.com?part=3D1
