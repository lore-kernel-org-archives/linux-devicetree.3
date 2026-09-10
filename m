Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96DA3939C1
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048914; cv=none; b=VBufp1/QbSUUZzUmPElJ9qorM72S5zu0g3hYvGyAqjURFzMx2pVAUWhkaz0VN0//Dw/oIobkbjswdt0OmqJyx0WVpKw3ZuHzzcRL5LUJ4mqliZSE9kIdrW+fqIHY2atj77gYp7kqpFeq+KC3eM3pwNrz4NKm8QXklvRjK5aOprE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048914; c=relaxed/simple;
	bh=gUmAC2FuaaaA6SrhEBFabfdkyLv9KM5gIJ9rzuB2vCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cV6e7+WRopQDyVXQA+Ddh0yHmNsbfq/kGozk2hPF3yZ/KNMoSjE1W4YueCrqhpTxIa8o7M7BJsCyhRCAl441Yjy0LvLH7keYIfgzhMcUapeRHtw7QyDEqE6AS5+02bN0FWnCS4Gs6YjHVkCnZQRFkk6IowsXW5wqQ4eotUwKTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVCQIMCH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVCQIMCH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61C61F000FF;
	Thu, 10 Sep 2026 14:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048913;
	bh=S4Ejc2OM1/f5mCEIYj2k4/rMZmB5vuzNb8baGyGei+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bVCQIMCH1CLx92OQ5SFoM8QaTcdYoL0kyFdx0Ftl/G3l28YltXx/Rog71/PBPWFFs
	 Kp0AxamBF6QbMyDwgWKIKqSP4NhZNPjmfixtFqG1T7O637UuxYav9FxlaB/Z2zSeku
	 K21NVJn+bkCJe3TFAaHGONap9uouLQBOvSZIlvMwJiA9DCDG3vtxUHzpV98TJzyWtW
	 FK4yAjElnSO52VjXD44iUh98D0l5pcoPu2EEX7x98gXgOdMPO3vgiRjrsGbVt03gEt
	 zs8apiLJk2epa1MRKaWWDFPtJDte7tLf8DAyjA3rlEtgMgZn8+2TkVhI9k6FiLTG4+
	 wVQdsM84rXQCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 34/34] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs
 to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:01:52 +0000
Message-Id: <20260910140152.B61C61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims that `phy-names` is moved=
 to the root port node and that `pcie1_port0` is a newly added label.
--

commit 5a165f26f5136ff46d1b26908e6f480f88cfa37b
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to root port node

This commit updates the sm8550 devicetrees to move the PCIe PHY references
and the PERST/WAKE GPIO properties from the root complex controller nodes
down to the respective root port nodes. It also renames perst-gpios to
reset-gpios to match the root port binding context. These changes enable
board-level overrides for port-specific configurations.

> Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides.

[Severity: Medium]
Is this description accurate? Looking at the baseline code in sm8550.dtsi,
the pcie1_port0 label already exists and doesn't appear to be newly added
by this commit.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 0e701e709235c..9bbc31346f900 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2397,9 +2397,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> =20
>  			power-domains =3D <&gcc PCIE_0_GDSC>;
> =20
> -			phys =3D <&pcie0_phy>;
> -			phy-names =3D "pciephy";
> -
>  			operating-points-v2 =3D <&pcie0_opp_table>;
> =20
>  			status =3D "disabled";
> @@ -2461,6 +2458,8 @@ pcie0_port0: pcie@0 {
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> =20
> +				phys =3D <&pcie0_phy>;
> +
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;

[Severity: Medium]
The commit message states that phy-names is being moved to the root port
node, but it looks like it was dropped from the controller and not
re-added here alongside phys. Was phy-names intentionally removed instead
of being moved?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D34
