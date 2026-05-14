Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206BD33689B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782046; cv=none; b=BWT8//of/9ziVsOwSxentpDQEW2T62qHDv0kt9NPQDP/54fMj1L0OYCDZs/3AdHzA9HolzT17PKFRBLwQG2YI461T/qGzyZMVT/ht7728fbPccAIibBzbfkBthtfQz0sSeL2G06r7xO+2iWnm8hdrEItCroLPTFVTgM/7k1Asv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782046; c=relaxed/simple;
	bh=CTfb6PN3jCumTQHELGbMd2kKqpalXrnanLsGv4TV7OY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aazjnMkqrVV/FMsaP/vgfRPeykInqWlAdtAewBz0/IVo5WJvygVNJvinpcnfr/kaH3Mw7sSa2JOsruyeU2fw9F/lFu9ZyB4C455Sb2sClAr9AOdM4gZte046rmbsxR5lqVgx78y3PkSKrLh3Dl5Otz+jX/89VTlSvWxFfaibNE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pd0e2UCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pd0e2UCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77088C2BCB3;
	Thu, 14 May 2026 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782045;
	bh=CTfb6PN3jCumTQHELGbMd2kKqpalXrnanLsGv4TV7OY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pd0e2UCG0Hfow0uRdimp7U6ndjSTt+VqbU6qPCvD57FILn+JmaiRRj8rVd0piiPMJ
	 c4dQJNzqvQC8Y6xLIL3S6HDTejg/176ElLJ+zdNrgnOtjnVWe1DG7fZ0h6/+elcMZL
	 yhklFE9YIntifzesvVDya/3Vlkwabsl6jg5915CrJS/OkysKBsMiQXxH6pKzwubd1I
	 muOJycEXNOMFirzoj2WvCZte85pPqhcSJYvo60tTIQooiTaTa1rtlV1nX8WSIuf1m/
	 pRSfdxo1RQCDoMqyEb//QP9uDzsGnCDdprL/eLalBRk9A2zvP/U/3secFt85E3dzpH
	 uTj4bQhYWcOJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8960: Add CPU frequency scaling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta via B4 Relay" <devnull+guptarud.gmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com>
References: <20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 18:07:24 +0000
Message-Id: <20260514180725.77088C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `opp-supported-hw` property specifies an array of three all-1s=
 masks, misusing the OPP core API and completely bypassing hardware speed b=
in filtering.
- [Medium] The commit implicitly corrects the `saw0` and `saw1` compatible =
strings without documenting this behavioral change in the commit message.
- [Low] The newly added properties `opp-microvolt-speed0-pvs0-v0` (and simi=
lar `-v0` properties) violate the device tree binding schema and will cause=
 `make dt_binding_check` to fail.
--

commit 06323598829c4bb247922fa2b1d518f8024bc3f5
Author: Rudraksha Gupta <guptarud@gmail.com>

ARM: dts: qcom: msm8960: Add CPU frequency scaling support

Enable Krait DVFS on MSM8960 by adding the required device tree nodes:

- OPP table with 12 operating points from 384 MHz to 1.512 GHz, with
  per-PVS voltages for slow, nominal, and fast silicon bins.
- Krait clock controller (krait-cc-v1) driving the CPU muxes from
  PLL9/PLL10, ACC aux outputs, and PXO.
- PVS efuse nvmem cell in qfprom for the cpufreq-nvmem driver to
  read the speed-bin and process voltage class.
- CPU idle state for Standalone Power Collapse (SPC).
- operating-points-v2, clocks, cpu-supply, and cpu-idle-states wired
  into both CPU nodes.

Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b5=
6847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/acpuclock-8960.c#L120-L=
235

> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8960.dtsi
> index fd28401cebb5e..50e51021e2d7c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi

[ ... ]

> +	cpu_opp_table: opp-table-cpu {
> +		compatible =3D "operating-points-v2-krait-cpu";
> +		nvmem-cells =3D <&pvs_efuse>;
> +
> +		opp-384000000 {
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-microvolt-speed0-pvs0-v0 =3D <950000>;

Does the opp-v2-kryo-cpu.yaml binding schema support this -v0 suffix?

The schema currently restricts microvolt property names using the regex
pattern ^opp-microvolt-speed[0-9]+-pvs[0-9]+$ and enforces
additionalProperties: false for OPP nodes.

Appending the -v0 suffix here will likely cause dtbs_check to reject it as
an undocumented property, introducing a schema validation regression.

> +			opp-microvolt-speed0-pvs1-v0 =3D <900000>;
> +			opp-microvolt-speed0-pvs3-v0 =3D <850000>;
> +			opp-supported-hw =3D <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;

Is this opp-supported-hw mask configured correctly?

The qcom-cpufreq-nvmem driver configures the OPP core to expect a single
32-bit hardware version mask (config.supported_hw_count =3D 1). In
drivers/opp/of.c:_read_supported_hw(), having three elements is interpreted=
 as
three separate hardware versions.

Because every mask has all bits set to 1, the validation check
(val & drv->versions) will always evaluate to true, bypassing the
hardware speed bin filtering. If a chip evaluates to a higher speed bin (e.=
g.,
speed1), the OPP core will register these operating points but fail to find=
 the
corresponding voltage properties, as only speed0 voltages are defined here.

Will this scale the CPU clock without appropriately scaling its voltage sup=
ply?

Should this be a single 32-bit mask representing the supported speed bin (e=
.g.,
<0x1> for speed0)?

> +		};

[ ... ]

>  		saw0: power-manager@2089000 {
> -			compatible =3D "qcom,msm8960-saw2-cpu", "qcom,saw2";
> +			compatible =3D "qcom,msm8960-saw2-v1.1-cpu", "qcom,saw2";

This isn't a bug, but this compatible string change isn't mentioned in the
commit message.

Since this alters the SPM node compatible strings and is functionally requi=
red
for the newly introduced cpu_spc idle state, could this correction be
documented in the commit message?

>  			reg =3D <0x02089000 0x1000>, <0x02009000 0x1000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-expressatt=
_cpufreq-v1-0-487fd2d78859@gmail.com?part=3D3
