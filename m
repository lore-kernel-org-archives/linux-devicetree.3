Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E204391E64
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362923; cv=none; b=DzpRHII19ZrME7dnV5895DLjtf2Yud2JDspj1ZF+mdnfXgpdonBnnHUe2MSXYzVR8yiM+K+W6TCxFm5ln0S5zVU4SdUVl+31TqUxj9tCDA0nxkOOCYnRgLDFXpJUwVSOESpg0U9w2TaXJslc0oJp2mCFxO/pdmIa/jwLrSVsT8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362923; c=relaxed/simple;
	bh=f6+rTbced+tErfZ5ypUahdCLnrNk4X/IaM2kYJy5ebs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AcZ+S/qOKUaDwGXFBYbQaja6lD60p/3X+evuxAO72PAd040cgqhFLduJMsZfm9Ryz4k0QtLPxuRD2AFYpc8tI5aV6F/Kmw1k3ZJalIKyei+cwsAEzVTseJroBr1Egenk7Wkec4LN3u1/avJFR/gpAD5ddtnr7aIz3Vlg6WPhbT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCWTyxkZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCWTyxkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2BC1F00A3A;
	Mon, 10 Aug 2026 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362922;
	bh=9lY3xQK/PzI5Vm2s5fXeUH8oDn2PkGuAFLDjgit5a/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aCWTyxkZB+3P90m7ClD4mE71i4SRe8pka8Nfhlf5OCqOnVidiIcMzGH6j1mZ7M50o
	 lVyV936ozK4TOcPx21Wo5AFmLi7ndOGLD0eX7ttp/99sF7sHQZDUdoEtASOkZPF9z+
	 4SzZWS6oQS3bvTBFyKLI1YC+DsEvUqVFv8bM9lpoP3UyE8B9scLpuNQuWM+60sc0P/
	 hDdCArio3BEmyJHMYUa09Y+PVqsOsZ1s3Pq/4WLecm82vLw8Ymv+MHoy8ri6Bcwxfe
	 a8CwklDtltJnNzMesNTzbpjQZChvp+L9sSIaPZ01xRr2a2uMZ4b8CiQqR8n1deVlXg
	 PKE8dibMC+Lig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 RESEND 1/6] arm64: dts: qcom: Add device tree for
 Nord SoC series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810114313.776563-2-shengchao.guo@oss.qualcomm.com>
References: <20260810114313.776563-1-shengchao.guo@oss.qualcomm.com>
 <20260810114313.776563-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:55:21 +0000
Message-Id: <20260810115521.CF2BC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `cpu-idle-states` property in CPU nodes and incorrect use =
of `domain-idle-states` in CPU power domains.
- [High] All secondary high-temperature thermal trip points are incorrectly=
 configured as `type =3D "passive"` instead of `type =3D "critical"`.
--

--- Patch [1]: [PATCH v10 RESEND 1/6] arm64: dts: qcom: Add device tree for=
 Nord SoC series ---
commit 6e2b5a047ad42d9b919ebd0fbf1f8ae98bae9bab
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include for the Qualcomm Nord SoC
series. It describes core components including 18 Oryon CPU cores,
GICv3, TLMM, thermal sensors, SMMU, QUPv3, SCMI, watchdog, and timers.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -0,0 +1,4623 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or subsidiaries.
> + */
> +
[ ... ]
> +	cpus {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "qcom,oryon-1-5";
> +			reg =3D <0x0 0x0>;
> +			enable-method =3D "psci";
> +			power-domains =3D <&cpu0_pd>;
> +			power-domain-names =3D "psci";
> +			next-level-cache =3D <&l2_0>;
> +			clocks =3D <&cpu_perf 0>;
> +			#cooling-cells =3D <2>;

[Severity: High]
Should this CPU node (and the other CPU nodes) include the cpu-idle-states
property? Without it, the cpuidle framework may not discover and register
the CPU idle states, which could prevent the cores from entering deep idle
states and lead to excessive power consumption.

> +
> +			l2_0: l2-cache {
[ ... ]
> +	psci {
> +		compatible =3D "arm,psci-1.0";
> +		method =3D "smc";
> +
> +		cpu0_pd: power-domain-cpu0 {
> +			#power-domain-cells =3D <0>;
> +			power-domains =3D <&cluster0_pd>;
> +			domain-idle-states =3D <&core_off_c4>;
                        ^^^^^^^^^^^^^^^^^^

[Severity: High]
Does passing an arm,idle-state node here violate the DT schema? It appears
that domain-idle-states expects a genpd domain-idle-state cluster state,
rather than a CPU idle state.

> +		};
[ ... ]
> +	thermal_zones: thermal-zones {
> +		ddr-0-0-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens0 0>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <105000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature =3D <115000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
                                        ^^^^

[Severity: High]
Should this extreme temperature trip point be marked as "critical" instead
of "passive"?

If the SoC reaches 115C or 125C, a passive trip point will only instruct
the thermal framework to throttle via cooling devices. It won't trigger an
emergency shutdown, which might leave the hardware vulnerable to physical
damage from overheating. Is this pattern intentional across all the
thermal zones defined in this file?

> +				};
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810114313.7765=
63-1-shengchao.guo@oss.qualcomm.com?part=3D1
