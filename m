Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAE64EA397
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554759; cv=none; b=BeI+HEz5ATv76Q3Cv6ZJlTJQjb4sg6UVFnfgW9mY23Rzwto9JSUxHh0s4wmIQuTAV/oY3saGOPQUKobqGnF4S/dSXe+f74QmrDJQqzdHlykLsab0yzg3dUXBCIsCIXxhJLZelQimqHOseVEXm93sFcmKiKwoUzm9IrriOjulS6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554759; c=relaxed/simple;
	bh=oRxPCXlcp4oZG8w1qyiRgrQGqJ2eT/8HlM3YAddcHkQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uOngPn8TucVM0JRcXJlWM9zVVdFb2ITD6Fc9cuohKpOZwGHnJacETNakLcHwPm57l5cCetQ1BC6KJDDCy8y3qLfpH1b565ELI9H+5YyMYdSRzJ8zmri7feIslJl3CrwC9N2/jcwzFH8zzFAb9x+P0Qgdg6mlq0w1Aa/e2V8Rg0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvwSmzgr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvwSmzgr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B731F000FF;
	Wed, 16 Sep 2026 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789554740;
	bh=OStslCeIURQ1G+onkNNhfV2sdhWO+nBcbl9KRVafGyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SvwSmzgrHR00QhcjtoFqP7EuRJnuUejS417nrhMj+4ofe/x8QUlAkK2EH5x3fItU8
	 LBWs0wCyqbpraGI0GDvZs9VEUUvROUNrNPNUHoKJ7MUK017QaH6uZ3JY0i3m0bZg42
	 oFmpByOEX0b05wsdmd1J322b7fM26g8YUszGSfXTsxypY29upPY5IxfZIjKpcM8nb9
	 9dDUx+D7h+NRzsUic1Kyl3P/dfvA2qLURY+flFv6ozO/N6hDc7tSsfLl/c9nGZJe3R
	 Sk/R/drOx4m556qSB2TYnd/4fb3cp1X0DlLpSNz3vJ7jAj1n/rEMtwM8/I+09mX9Pc
	 aGKarpHJkrGRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sa8775p: Add qref and refgen
 supply for PCIe PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziyue Zhang" <ziyue.zhang@oss.qualcomm.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org
In-Reply-To: <20260916102023.2054761-5-ziyue.zhang@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-5-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 10:32:19 +0000
Message-Id: <20260916103220.39B731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt: qcom: sa8775p: missing refgen-supply breaks PCIe PHY probe
--

commit 01fe676ff997cb09ae0eae172966d007c6ff8142
Author: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>

arm64: dts: qcom: sa8775p: Add qref and refgen supply for PCIe PHYs

This commit adds vdda-qref-supply and vdda-refgen-supply properties to the
PCIe PHY nodes in the SA8775p Lemans-EVK and Lemans-RIDE device trees. This
ensures stable operation and prevents occasional system crashes.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dt=
s/qcom/lemans-evk.dts
> index a45485b54a5b7..11fb11b161fc1 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -851,6 +851,8 @@ &pcie0 {
>  &pcie0_phy {
>  	vdda-phy-supply =3D <&vreg_l5a>;
>  	vdda-pll-supply =3D <&vreg_l1c>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;

[Severity: High]
Does this node also need a refgen-supply property?

Looking at the QMP PCIe PHY driver for SA8775p, sa8775p_qmp_phy_vreg_l mand=
ates
5 regulators, including refgen:

drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:
static const char * const sa8775p_qmp_phy_vreg_l[] =3D {
	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
};

When qmp_pcie_vreg_init() calls devm_regulator_bulk_get(), it expects all
regulators in this array to be present. Without refgen-supply defined here =
(or
in the base PHY node pcie0_phy in lemans.dtsi), won't devm_regulator_bulk_g=
et()
fail with -ENODEV and break the PCIe PHY probe deterministically at boot ti=
me?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916102023.2054=
761-1-ziyue.zhang@oss.qualcomm.com?part=3D4
