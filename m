Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE13C3148A7
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 22:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788127974; cv=none; b=eba3wbGkMHyio9emv5wrzRabugTsPtdCAqxe84IeY2ulpBgcaSNfifUE+6AvbVqwCpmJegU5Pb+EGB92iiOBGKg83Q8L9r/7ufTENefkqhIVz0lr6V/dqZeGOWWly2fvzdot/yAkJVvYpFXCTSqFvmGD7jZyPjEORzF8wuhON6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788127974; c=relaxed/simple;
	bh=0mkqjBFVGTsFt8ZAwCvMpXnOc/Ehk+NHMxwzZ4Am41Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JkIJjaipD351owtKnxzTkGk8RAWKKdXvm49N98S/XEAvDZ33HsFQMH9YBZKF26ft9UQlPSNSZltZo2Y0u3zCr/3nJ1CWb2nx+K/iJ85OS7/FeRNsm0UMN1nhOz9Q0RCF8Ej8K/Q+PXG9tOir9635IbnW75eJ5FhlTsT97Q5jnV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XePxhAHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XePxhAHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295271F000E9;
	Sun, 30 Aug 2026 22:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788127972;
	bh=Fg4cPFtL/PlQuD0lJdABC9jxJ5/Wen+eJwZohQQD8Z8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XePxhAHyER8W8S1hS8FyYQd3TCDQH08CyMLHD73EwpgWxx4fG0gvHuReh4IvgJa3M
	 qd2V5AkF6On2DIccp8Ub9C7ibEobuifgdKxyk16fhvJx+T6pDzaxQo1dYfF3pcj/Wy
	 IYJc0ND5OW0PpkzkeeA3WWx7gudVUgrG1Mo1WgbigQP5Zgqim33gsBprxrW+NKJKn5
	 UNAyohOLDdKmPp/Nzz+3kSHAQ7og4FC1VDni0hIOVhd4omokIqcQn/fjftnJAk+jar
	 SAG/ZUcblTIK+MwuuWM2JV9gf6sKVVZpYop8VCMg/Es/Zm5xCjDW2enxI4ODPII5ZJ
	 JkDt2htpJxEdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Pettit" <jason.pettit@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:12:51 +0000
Message-Id: <20260830221252.295271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] 1.8V regulator applied to 1.2V and 0.95V pins on the WCN7850 PMU, =
risking hardware damage.
- [Low] The board device tree references an undefined `&pcie3_phy` label, c=
ausing a dtc compilation failure.
--

commit 4454af8cdf9bffc654c2251cf576014586466b4c
Author: Jason Pettit <jason.pettit@oss.qualcomm.com>

arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
   =20
Add board support for HP OmniBook Ultra 14" Next Gen AI PC
(product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts=
 b/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts
> new file mode 100644
> index 0000000000000..d1c1880a50b9b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts

[ ... ]

> +	wcn7850-pmu {
> +		compatible =3D "qcom,wcn7850-pmu";
> +		vdd-supply =3D <&vreg_wcn_0p95>;
> +		vddaon-supply =3D <&vreg_l15b_e0_1p8>;
> +		vdddig-supply =3D <&vreg_l15b_e0_1p8>;
> +		vddio-supply =3D <&vreg_l15b_e0_1p8>;
> +		vddio1p2-supply =3D <&vreg_l15b_e0_1p8>;
> +		vddrfa1p2-supply =3D <&vreg_l15b_e0_1p8>;
> +		vddrfa1p8-supply =3D <&vreg_l15b_e0_1p8>;

[Severity: High]
Does this apply a 1.8V supply (vreg_l15b_e0_1p8) to pins that structurally
require 1.2V (vddio1p2, vddrfa1p2) and ~0.95V (vddaon, vdddig)?

Over-volting these inputs with a 1.8V supply risks permanently damaging the
WCN7850 PMU or causing system instability. A 1.2V regulator (vreg_l18b_e0_1=
p2)
is defined in this file but appears incorrectly unused here.

[ ... ]

> +&pcie3_phy {
> +	vdda-phy-supply =3D <&vreg_l3c_e1_0p94>;
> +	vdda-pll-supply =3D <&vreg_l2c_e1_1p2>;
> +
> +	vdda-refgen0p9-supply =3D <&vreg_l1c_e1_0p91>;
> +	vdda-refgen1p2-supply =3D <&vreg_l4f_e1_1p2>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Does this reference an undefined pcie3_phy label?

Since pcie3_phy is not defined in glymur.dtsi (unlike older SoCs where it
might have been copied from), this reference will cause a dtc compilation
failure when building the device tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-x2-hp-omni=
book-ship-v1-0-9feada71dc79@oss.qualcomm.com?part=3D2
