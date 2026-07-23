Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691C2253EE
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774756; cv=none; b=NEhLPPYjHYfd6pJOfYTAsmWK6WSIE4J1XOwUPSkNbKoAxj2ehpqwELWqXwUD1GtbWl45qQ4ZbfRR1o0BaM5yObMYuqKPJHA0yGkUiwO8ci4+hZ8wxPXXb9N8whob1fFLzn0Z5A2a6ryqI0c0ddGHbJa/aDVlDL7kFSdtCFO6U2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774756; c=relaxed/simple;
	bh=s48PRV4zBf7y8pGvatmwDuxJVoVJXA20pPSqPbD0hPw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r3e5wT3m/Lhaiei1j5s7/IDp8lhBOD84rAwwY5q8C3g+pfpPsI5Y8i71V6ZSMsTYOrWyeVphdmD4YNnNGsFd3d/SzS7Q2K2a4ALJI5deqKGaKPDuqaxyOB30+JKAecD3rDG4Hw7G/nBkLJjXAZxZEpVNKCs9L5cSsq9RwP+O8YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb6YUxny; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb6YUxny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400FD1F000E9;
	Thu, 23 Jul 2026 02:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784774754;
	bh=tkW1weYwa57KGnVEv5rR7OPZS90dqSWov9q/bvtDZFk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kb6YUxnyikjgUTqDuwxvIW3Gncw+dO+DX/DvJ6WhTnKnBRTOIS/f9BZLc2Wrf037N
	 uXNbbpll/N4CaOCKpac77E9OIo2ER33D3tIrGyvsQwMllusdHLzqf84UVeQwWAuMMt
	 5lUMAT7R747DqndznGwZC1WkIubfypN0odLiJdnrg6MEYIIjL+OGH0LMCGULHzCsPT
	 YOgOb3wE9o/MTRl7TjkQHTyPuzfDXeW0dyqrM8O68lqnV6XEkalrf1VM6Soh7jHTa9
	 NuZeIwimSMUmK68+oO6++UmnaHpEELrL/J9KhiVul1UbHMDTbTXPyrw047i93n1zZR
	 aPuW/8dRVrkDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: mahua: Replace
 pcie3a/pcie3_phy with dedicated pcie3b_phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260722-glymur_linkmode_0722-v6-5-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-5-bba8156b8cbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:45:53 +0000
Message-Id: <20260723024554.400FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `pcie3b_phy` node lacks the `vdda-phy-supply` and `=
vdda-pll-supply` properties, which will trigger `dtbs_check` errors.
--

--- Patch [5]: [PATCH v6 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3=
_phy with dedicated pcie3b_phy ---
commit 919bcfc5a66ac884962879da8e57f8559595dcdf
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy with dedicated pcie3b_phy

This patch removes the unused pcie3a and shared pcie3_phy nodes from the=20
Mahua device tree, as it only uses PCIe3b. It replaces them with a dedicate=
d=20
pcie3b_phy node using the existing Gen5x4 PHY compatible, and updates the=20
GCC pipe clock parent and PCIe3b port phy references accordingly.

> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qc=
om/mahua.dtsi
> index 22822b6b2e8b9..3280eb96d61c0 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
[ ... ]
> @@ -134,6 +186,43 @@ &pcie_west_slv_noc {
>  	compatible =3D "qcom,mahua-pcie-west-slv-noc";
>  };
> =20
> +&soc {
> +	pcie3b_phy: phy@1b90000 {
> +		compatible =3D "qcom,glymur-qmp-gen5x4-pcie-phy";
> +		reg =3D <0x0 0x01b90000 0x0 0x10000>;

[Severity: Low]
Does this node need to define vdda-phy-supply and vdda-pll-supply?

The qcom,glymur-qmp-gen5x4-pcie-phy compatible requires these properties
according to the bindings schema. Without them, this might trigger
schema validation failures during make dtbs_check.

> +
> +		clocks =3D <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-glymur_lin=
kmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com?part=3D5
