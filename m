Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893AF4746AE
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932445; cv=none; b=PhXiM1sNMxpKHBpF/aRSQClRSXhnfwzBb7ixJ9PS42AppqIUq86OHSwiiLhCY5GkK299qHw8lUL7SVTgNPC1d/fv1OGBTVN33Rm1v4eBzVfKXQCz7NXjl+3dvqDmHr2ODLwoLdCQ4Ymjcj/Wkf+Af7HuvHGl1dxoJL5V4n0NGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932445; c=relaxed/simple;
	bh=D/UgWNYe2Ycdf+QHW5aqo+pXWMngQWmgGmqk4ed5B64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HVRp61cQ0nBE6dYFEHjWs91k8m0A3f+DJ3L/pnKTR+gUQte/blYOHC8L35iBbTwuY/C0zx9XDXV7GrYFsEilLNXyL5FcDCXm/3JK9gzSRec4jsDPbJgPl4YbK1FGWEnEQoG5c6WmSt+IsCPR+B1FO6axVYaGssUyd1Z/US8KEjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RssSonna; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RssSonna"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304341F00893;
	Fri,  2 Oct 2026 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932444;
	bh=ZR+EEBm9VhGEQCzK/YI+TKn7quHvelzvczoqhCuWxlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RssSonnai1p0znQfqbGgMuMvW/lE4i8NOdSzGrAS/KQ5fcOmZNKpEF2ahOWq50Ray
	 Z9Not8dtb3I4x7uSx3faN4WSw/GD55s/w9GK8HXiWbSE9+QiMzRn1Qzlul2VTcWgZC
	 zET4Kk3gqj5q5O3a01FKcnBUufRCSsUxOWgI3rPapnuehhm4o4nJxxqfUSA1AeSAwZ
	 ohyFb2Xy5Fgb/xA5lw0iHrG5zNY8BMSbvVqkvjNvDCMvePdlUEwalx8BnXu49bsamG
	 er9qs5rXr0JNF7NpBeHIr+4/HmthWJSgdOO2/+GfWn6KxDg/n42yzS5GIEdGrpucrH
	 RnQVWUTQhwENQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sdm632: Correct power domains
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261002-sdm632-rpmpd-v3-7-95c47d0f26cf@mainlining.org>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-7-95c47d0f26cf@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:03 +0000
Message-Id: <20261002091404.304341F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] remoteproc: qcom_q6v5_mss: probe failure due to missing mss-supply=
 for MSM8953
- [Medium] dt-bindings: power: qcom-rpmpd: RPMPD_VDDMD conflicts with RPMPD=
_VDDMX_VFL
--

commit f5ae81644790ad18298d9d35e487c425be535c4d
Author: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>

arm64: dts: qcom: sdm632: Correct power domains

This commit adds power domain overrides for the SDM632. It specifies=20
domains for various subsystems, acknowledging that SDM632 uses different=20
power domains from the MSM8953 it is based on.

> diff --git a/arch/arm64/boot/dts/qcom/sdm632.dtsi b/arch/arm64/boot/dts/q=
com/sdm632.dtsi
> index 40d86d91b67fa..5a677da5afb01 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm632.dtsi
[ ... ]
> @@ -87,3 +87,37 @@ opp-725000000 {
[ ... ]
> +&mpss {
> +	compatible =3D "qcom,sdm632-mss-pil";
> +	power-domains =3D <&rpmpd RPMPD_VDDCX>,
> +			<&rpmpd RPMPD_VDDMX>,
> +			<&rpmpd RPMPD_VDDMD>;

[Severity: Medium]
Does the use of RPMPD_VDDMD here conflict with RPMPD_VDDMX_VFL?

In include/dt-bindings/power/qcom-rpmpd.h, both are defined as 5:

#define RPMPD_VDDMX_VFL         5
#define RPMPD_VDDMD             5

A SoC that has both domains would have a conflict in the provider array,
or a user specifying RPMPD_VDDMD on a board that has VDDMX_VFL will scale
the wrong regulator.

[Severity: High]
While overriding the domains for SDM632 here, does this leave MSM8953 broke=
n?

The mss power domain was removed in arch/arm64/boot/dts/qcom/msm8953.dtsi
at the mpss node, but the required mss-supply was not added.

The MSS driver now requires an mss-supply active regulator for MSM8953.
Consequently, the driver falls back to a dummy regulator.
When q6v5_regulator_enable() attempts to set 1.05V, regulator_set_voltage()
returns -EINVAL on the dummy regulator, causing a fatal start failure.

Furthermore, this breaks backward compatibility for older MSM8953 DTBs
because the MSM8953_VDDMD power domain was removed from the
msm8953_rpmpds[] provider array, causing genpd attach to fail.

> +	power-domain-names =3D "cx",
> +			     "mx",
> +			     "mss";
> +};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-sdm632-rpm=
pd-v3-0-95c47d0f26cf@mainlining.org?part=3D7
