Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7560741A794
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528450; cv=none; b=CTjyFGb3OW421QE05zE+H6hFyhd8zrgIGScu+sQWN6Xw0ofrtMzqrsYE/C/RYTjhpihCwEclJ4v/20Q1dxWtORaNKF5TGaIDu2rDxKVAX4/sMl2A1boNdz60VUsEDTrjqQtKxh6Bx3ZVh0+fsIQRBVjIxXzfdpwIk4/Tn4d4VI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528450; c=relaxed/simple;
	bh=bJpy2Est2TT+ME7gq/mgQRtuPUQV3FWnt+6QWffM7yo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W4pZfQFeup6uRmeB34CLwlf0QNk5q21GKXsSMQjW2Opq9js/zxhiMSH0yG2NJ1oVdJRPwqlbjh2eyIO66YOzd73k03EpCdf4xCtcxu19iyVDVQ051EUwdR/PV8RXZgdUaxbRfgOjooJPqMHRUq33cmMfE6E0Y/ZAfFOxOdcATm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIT7Xwlx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIT7Xwlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9671A1F00A3A;
	Wed, 12 Aug 2026 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528449;
	bh=L7qBPA9QkUykans0mVcNSCRK+TqAYzR3MPKSlgnTPcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MIT7XwlxRKSLVtazbPaV1UK4q0BCc0wa9VmRe4ZF9b6NGmy+fh4rZgq0ZsYA6zOPI
	 EH3I+WEH3Qw+ktXbaBX+yihkMDN0R0TTvGt0fMruQuwZsql3R/dLDt+uvRfp+/GkbW
	 DNrSmSeQCe4k95OQDN2PFy6x6rsiL3z2RWrC2f74rLrS9cZz56XN3ARaGlhFVQnUY7
	 d2NB5iSORAqt5OvWplsnYcAtHW7BA8umLSzdgCPbHMAQC59nrstu9R8MpXMURZ6RvK
	 7UUTPbtH0tq01A4rgaAE50JrPqzsYZjY86fy8AVYEgWV6AAdGLwg51GqGTwjLhgaP7
	 AtYw8DjlDcSSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/14] arm64: dts: qcom: ipq5332: Enable USB
 Super-Speed PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260812-ipq5018-usb3-v2-12-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-12-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:54:08 +0000
Message-Id: <20260812095408.9671A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect Device Tree Compatible String
- [Low] Missing USB Controller PHY Reference / Device Tree Build Failure
--

--- Patch [12]: [PATCH v2 12/14] arm64: dts: qcom: ipq5332: Enable USB Supe=
r-Speed PHY ---
commit 3876ed72a1a7faf7ac5d0f75eed308d2c1085ec6
Author: Praveenkumar I <quic_ipkumar@quicinc.com>

arm64: dts: qcom: ipq5332: Enable USB Super-Speed PHY

This commit enables USB Super-Speed PHY support on the IPQ5332-RDP468
board. It overrides the PCIe PHY compatible string so the combo PHY is
handled by the USB3 PHY driver, and sets the required clocks and resets.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts b/arch/arm64/boo=
t/dts/qcom/ipq5332-rdp468.dts
> index 25a70cd884c03..164f9a9a6c757 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
[ ... ]
> @@ -100,3 +100,22 @@ &usbphy0 {
> =20
>  	status =3D "okay";
>  };
> +
> +/* this combo PHY supports PCIe and USB3 */
> +&pcie0_phy {
> +	compatible =3D "qcom,ipq5018-uniphy-usb-ss-phy";

[Severity: High]
Does this compatible string use the wrong SoC version for this board?

Because this is an IPQ5332 board, using the IPQ5018 compatible string will
cause the phy-qcom-uniphy-usb-ss-22ull driver to write the IPQ5018
initialization sequence (targeting offsets like 0xa8) instead of the correct
IPQ5332 sequence (targeting 0x7C4 and 0x7E8).=20

This will cause initialization to fail and may corrupt unrelated registers.

> +
> +	clocks =3D <&gcc GCC_PCIE3X1_PHY_AHB_CLK>,
> +		 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +		 <&gcc GCC_USB0_PIPE_CLK>;
> +
> +	resets =3D  <&gcc GCC_USB0_PHY_BCR>;
> +
> +	qcom,phy-usb-mux-sel =3D <&tcsr 0x10540>;
> +
> +	vdd-supply =3D <&regulator_fixed_5p0>;
> +
> +	/delete-property/ num-lanes;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Is an override for the USB controller node missing from this file?

An earlier patch in this series adds phys =3D <&usbphy0>, <&usbphy1>; to
ipq5332.dtsi, but usbphy1 is never defined. This will cause a device tree
build failure due to the unresolved phandle.

Should this board file override the phys property in the &usb node to link
this newly configured &pcie0_phy combo PHY, replacing the non-existent
<&usbphy1> reference?=20

Without this link, the USB controller will not use the combo PHY and will
remain degraded to High-Speed 2.0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D12
