Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A5433025
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220668; cv=none; b=glDZPkiCPbukzUX2HX4RfDthTAwOEbtC/+yCVj1cHBtURaX7DNA3VhVot5WHAGJ6LlvMNOEDxqh1j+/5acEYUiyQUjkbfFX0NC0hMX5rGLckVyl9RIp5nPAKfbrr/UKfqj88Y0fkCMq8tl9dey6liFpC24/jeoKmfGsvtV8neJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220668; c=relaxed/simple;
	bh=PfICZRJYm0Kt4vvGM7IRzjCB02kjuFLdxzoaIAQhyQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ml2J2ZOKLvqmmYhdvmAaqjXvRNA9sCv56ZwbA/eaeKujK/6KEDeu1UgCz5xFbMwuFB/kpp/rM+gbAfkh0fbDfgQTHVH3fGlZiIdtUP+jF3ss+Gz/zFN7TpzQ8aCwjuzRO+7hvF7TuncqO2KNxD6X3ZenNb6ZColvoh9CxwivPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvH+a3ia; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvH+a3ia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28621F000E9;
	Thu, 16 Jul 2026 16:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220666;
	bh=lSBIv7OWKxbZ/KlUJmEZhydaAV2IVAedbP6QR6H7v9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JvH+a3iaizBSdKW260Hrsc1VrqQ33B+QsocoNnXgsGAeZqcSWEGpI1Qfz8kwzKkSu
	 35HgJD0i2QfvEg24ew2mGKzmoUYLvSvSTaJ60EGy+FiUeKcBh5wzW93RiC4oPBOPdv
	 vqwqtvDh4qDozwbjJjFrdQihQrTKu7PjUkawoL514perN7CGwOFQVmJmTPOWfvzpCA
	 aYsWmk4G7WZL1JZcIx3wBdJM4IGZw2B4YhIx08ygrRFNcl2B1X789Ri2fc+0Dr6f3J
	 JmvpByFfaGrnnst8eV9umlFKZPAzlV3hLbhJKkqMyl9X9rWfHyZOvGIqC8IG8fKB5A
	 a/dFyLQJERBSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Enable Primary USB controller
 on Shikra CQM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-3-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-3-13f73a0571bb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 16:51:05 +0000
Message-Id: <20260716165105.F28621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `usb_2` controller incorrectly assigns `GCC_CFG_NOC_USB2_PRIM_=
AXI_CLK` to its `iface` clock instead of the correct system NOC clock `GCC_=
SYS_NOC_USB2_PRIM_AXI_CLK`.
- [Medium] Missing `dr_mode =3D "peripheral"` property in the `usb_1` node =
overlay, causing the controller to fail to initialize in device mode.
--

--- Patch [3]: [PATCH v3 3/4] arm64: dts: qcom: Enable Primary USB controll=
er on Shikra CQM platform ---
commit e2592f76c437910744ef5b9caed7e31cf607381b
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

arm64: dts: qcom: Enable Primary USB controller on Shikra CQM platform

This commit enables the primary USB controller in device mode on the
Shikra CQM platform. It enables the usb_1, usb_1_hsphy, and usb_qmpphy
nodes with their respective supply regulators.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c3..9867160470a8e 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -38,3 +38,22 @@ &sdhc_1 {
> =20
>  	status =3D "okay";
>  };
> +
> +&usb_1 {
> +	status =3D "okay";
> +};

[Severity: Medium]
The commit message mentions enabling the primary USB controller in device
mode, but this node doesn't specify the mode.

Without dr_mode =3D "peripheral", won't the DWC3 core default to OTG mode
and prevent the Qualcomm specific VBUS override from being enabled, causing
the port to fail to enumerate as a device?

Should dr_mode =3D "peripheral" be added here to ensure it operates in devi=
ce
mode as intended?

[ ... ]

The following issue was also found in arch/arm64/boot/dts/qcom/shikra.dtsi:

> 			clocks =3D <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
> 				 <&gcc GCC_USB20_MASTER_CLK>,
> 				 <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,

[Severity: High]
Does this code incorrectly assign GCC_CFG_NOC_USB2_PRIM_AXI_CLK to the usb_2
iface clock instead of the correct system NOC clock
GCC_SYS_NOC_USB2_PRIM_AXI_CLK?

Supplying the configuration NOC clock instead of the system NOC clock for t=
he
iface clock will result in the SYS_NOC clock not being appropriately enabled
during USB AXI transactions. Can this cause AXI bus hangs or access faults,
which could lead to system panics or freezes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-shikra-usb=
-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com?part=3D3
