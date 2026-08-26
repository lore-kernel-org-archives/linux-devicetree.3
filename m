Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E82BDC0F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713838; cv=none; b=jGneXdSS8cqop4JZKkBmp4NqBiS0ITuNmJk84qCz+Z56+NoYoMvnu2sFAhXUlSLPYYIiYoKnc6hBuCAyClqqnYZjxM6dxC5f6XEsopyrQQSeJHqIPDgZ4q5yfTMW/MIfD51q/BiKNAKsqyHJSqSLi4dIEqo1IjwMuuP+j4L/M4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713838; c=relaxed/simple;
	bh=pNYJMe9f2+JSEb0zGsiSjnx2ACxtdOG7D7avt/UxFRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WgSiaNxEeHnphm9vtHd2IaZATYUp4SU2GC0ZPKICvHRVcn46RT4aNE2ewlQQQwBP4dXkJa8oL+8+SMEnGsNkPQCY/VHJ3iFQchsS80mm0JMrqtj0NM7zV0nrKB1cWaV31rpaSUbcmZvsC6kOvMJgfDZDxVz/mpt0w8Mnx3CQsD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwT9Uzlc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwT9Uzlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA9A1F000E9;
	Wed, 26 Aug 2026 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787713836;
	bh=4d5YWMdHCLJaYR9ja/vvYotAbSjhhv3eD8/n77Qgf/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gwT9UzlciBgflJf13XgW/XdozgzCk9mZyDpBGlnqoEhoieZ+NJW+WOWnkVYFQx3KP
	 hjrn0ymd/btcWBmxjF7dqeIm2HqaSa7+/yhejweTSjKgDdCuzRAvtR/maSg429wjhE
	 FhTzzPJL4Q5id9J2V48WgkW8HClbpnl7VoUNJqW5Fbh8+eZGnYM32LWf5umi4+CKeX
	 icNRvACoxGp8flpWImW+jumpdi8m2x0hc6EALgnWwVNu/VMsFB3RHBqWiRtb7zVNLc
	 3ObPmHUEUc0ejP66+/5YrjJ4D6bzHSHTCbvSJuu0OiCXN2HHsx2i5E1Yv+Wa76uFxl
	 MKQvBVfOnvKSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/5] arm64: dts: qcom: glymur-crd: Add PHY supplies
 for pcie3_phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825-glymur_linkmode_0826-v10-2-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-2-56ab597d77e4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 03:10:35 +0000
Message-Id: <20260826031036.4EA9A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `status =3D "okay";` in the `&pcie3_phy` node override, =
preventing the PHY from probing.
--

commit 7b7b60a46157d034dc15cbceba4357d52385bef5
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: Add PHY supplies for pcie3_phy

This commit wires the shared Gen5x8 PCIe PHY's regulator supplies
through board-specific PMIC rails in the glymur-crd device tree.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dt=
s/qcom/glymur-crd.dts
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -29,6 +29,14 @@ &mdss_dp1_out {
[ ... ]
> =20
> +&pcie3_phy {
> +	vdda-phy-supply =3D <&vreg_l3c_e1_0p89>;
> +	vdda-pll-supply =3D <&vreg_l2c_e1_1p14>;
> +
> +	vdda-refgen0p9-supply =3D <&vreg_l1c_e1_0p82>;
> +	vdda-refgen1p2-supply =3D <&vreg_l4f_e1_1p08>;
> +};

[Severity: Medium]
Does this node also need a status =3D "okay"; override to function properly?

Since nodes like pcie3_phy are typically left disabled in the base glymur.d=
tsi=20
file, omitting the status override here means the PHY driver will not probe=
=20
despite having the regulator supplies configured, which could leave the PCI=
e=20
interface non-functional on boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-glymur_lin=
kmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com?part=3D2
