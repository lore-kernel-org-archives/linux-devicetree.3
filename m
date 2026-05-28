Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE603438B9
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779943399; cv=none; b=Uf0TM2mdA8TegClyx0rhS1w5PQZTF8rjSmgi7TeKz7ckM3A/nOFBEJInZU0gacmCKtAVo7S+PKtcqxBijuT0kaMO2UMgUB9qJEdwa4JPsJVmsNt2VVkFfrs8ml7tr8GuOaOxyOU2LXgXBPh7nJRIOGFxafaMWz/VidHeGm7GHxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779943399; c=relaxed/simple;
	bh=Irmwfl6vGWSwobgNYVUm7RbHr3ryO3FbPAgt+l+Y6Ns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JUOQt0/+jskmOkJxJ6OWAGL8S6QAcX9kPB2AokFKFtnaG+wZ9cqQzRb68UHYtLo+UnpEtpRfxtDj5uXx7ikjjCZ5CfWKDpmzZJ2S11nxzR7dWwQ3qfywLkpvR61mQ+iuB9PuyZOOXozPmBzRc70PUW0zWS654epVUbEG3VshHX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gA/kXnR2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gA/kXnR2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6273E1F000E9;
	Thu, 28 May 2026 04:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779943397;
	bh=dfi7hopzJTBajODwpuyvWs7vKGjkWFKxdPS6oKapgBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gA/kXnR2bYeYo+s8vXnMya0EoR5nE81ArModxFYYI4nvjXQd68GA/3NkjUOXEEgYo
	 QGDZM1YqY/s4M0NJ+2pORRRJRhPuvduK1OdaYUtCZn+Fo54TdEwz85cojx1qk59RmY
	 dyF6wTx3UfDyJ26A9sepxgdIgy+9HdSusqqNMQP/HJsBxPb/ywNynZSQMWBadns6Vr
	 9MTjXZ6WOSzEvC/N7tMsNcEXCRogKnYd48Ux5+HZuxlQKpviQH+5HOKeukvkeeJZCc
	 FHqhDCd7oqUvb+ueKH2LVGCb1g8ie2F1jHmmUaWMXRR3lc8rszcphcjPtP/3dn2WbR
	 B8te0lo/WHPLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8960: Add CPU frequency
 scaling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta via B4 Relay" <devnull+guptarud.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527-expressatt_cpufreq-v2-3-b9b7726ccb6d@gmail.com>
References: <20260527-expressatt_cpufreq-v2-3-b9b7726ccb6d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 04:43:17 +0000
Message-Id: <20260528044317.6273E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The Krait CPU frequency nvmem parsing functions incorrectly cast a=
 `u8 *` buffer directly to a `u32 *` to read the efuse registers, leading t=
o endianness issues on big-endian systems.
--

commit dde749d736e7e3301796875cc37f978b7980ba69
Author: Rudraksha Gupta <guptarud@gmail.com>

ARM: dts: qcom: msm8960: Add CPU frequency scaling support

Enable Krait DVFS on MSM8960 by adding the required device tree nodes for
the OPP table, Krait clock controller, PVS efuse nvmem cell, and CPU idle
state.

Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b5=
6847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/acpuclock-8960.c#L120-L=
235

> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8960.dtsi
> index fd28401cebb5e..d4f4681974c5a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi

[ ... ]

> @@ -74,6 +82,123 @@ l2: l2-cache {
>  			cache-level =3D <2>;
>  			cache-unified;
>  		};
> +
> +		idle-states {
> +			cpu_spc: cpu-spc {
> +				compatible =3D "qcom,idle-state-spc", "arm,idle-state";
> +				entry-latency-us =3D <400>;
> +				exit-latency-us =3D <900>;
> +				min-residency-us =3D <3000>;
> +			};
> +		};
> +	};
> +
> +	cpu_opp_table: opp-table-cpu {
> +		compatible =3D "operating-points-v2-krait-cpu";
> +		nvmem-cells =3D <&pvs_efuse>;

[Severity: High]
This is a pre-existing issue, but does reading this efuse have an endianness
problem in the driver?

Looking at get_krait_bin_format_a() and get_krait_bin_format_b() in
drivers/cpufreq/qcom-cpufreq-nvmem.c, the code casts the u8 * buffer direct=
ly
to a u32 * to read the efuse registers, rather than using endian-safe
accessors like get_unaligned_le32().

On big-endian systems, would this read the nvmem data in reversed byte orde=
r,
resulting in incorrect speed and PVS bins being extracted and potentially
causing over or under-voltage issues by selecting the wrong operating point=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-expressatt=
_cpufreq-v2-0-b9b7726ccb6d@gmail.com?part=3D3
