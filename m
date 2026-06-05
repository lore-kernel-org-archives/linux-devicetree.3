Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28884282F1A
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 22:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780699742; cv=none; b=sjVWZ2mZlAW0aYr0Osx6AqSnInei5Q8WQLZMZqSW6tm2vSS4CLXqQl3p6dhup/mL9IbU+CskapsLyQznLLIEdwtNDd7fUn7G/q7XfZpTdOCMXt5NwHohvzr3t3/2tZyod4zyviCW5cO3wcajTPKRdgCVg/yW1BdYp+kmbxjvQ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780699742; c=relaxed/simple;
	bh=q40kf+RYKFpbsxStEjqySjgwoxcy111kBVP+pU0PxMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O1vikpF94m0lKhJ08ARF54R5q85nHWe7n/DeJ5J/PCBaTIBh7OArLpim6M/yAkvXVrrie/vYQ31HgNMHvjnj2k0lDGjYGJYutd72snhmG8OuDOathqhtXcVFRb36R0HvZXJXBMuz4WVBTalqn8PTJiBxFjcr1sctZlG37KYoqQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgmNFHLm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgmNFHLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB991F00893;
	Fri,  5 Jun 2026 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780699740;
	bh=rHeFn/H6GYtGxeHK/d+r/uP0W7MDxny1kO+yGdZEcg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgmNFHLmrU5nSNfjVg7NjmQ03BbO50pK8KSmdwBmv2H+RkWmUJLBTcSEWiakvxTiK
	 QwWYB9ZqzxXs9SgW8zhynf9jDRA5eGuIta5fHM8fTuorVYccAjC+igWP+tRZ32dMHo
	 ZM3xN4fCekb1rMz6pcPv8tLoDtZZ33IpVDbE2rCWBsarkqFzbIqwf7G2puprkEjwm9
	 X3TMlOg0SKFMLx4p6nlETY40mKEJkU6mezEGYhIgSB8nKOoOxxT+PsOsDKrnC+KhOS
	 YvDIsNJuzOwVFF1dTqpriy5s1XEXzMevnO3hCKhhst9tTGucEqbzp5bbpdWb/crOOO
	 QmZmlyDSievMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR
 and LLCC bandwidths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:49:00 +0000
Message-Id: <20260605224900.8BB991F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The SCMI cpufreq driver ignores DT `operating-points-v2` and int=
erconnect properties, leaving LLCC and DDR bandwidth unscaled despite commi=
t message claims.
--

commit a13e6fe2fe07b0245da4da3915362899fce3df5b
Author: Aaron Kling <webgeek1234@gmail.com>

arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwidths

This commit adds operating-points-v2 tables and interconnect paths to the
CPU nodes for the SM8750. The stated goal is to scale LLCC and DDR
frequency based on the CPU cores' current hardware operating point.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index fafed417c66fc..6f44c39364991 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -44,6 +44,11 @@ cpu0: cpu@0 {
>  			next-level-cache =3D <&l2_0>;
>  			power-domains =3D <&cpu_pd0>, <&scmi_dvfs 0>;
>  			power-domain-names =3D "psci", "perf";
> +			operating-points-v2 =3D <&cpu0_opp_table>;
> +			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;

[Severity: Medium]
Will these device tree properties be parsed and used by the active cpufreq
driver?

Since this CPU is managed by the SCMI protocol (as indicated by the
scmi_dvfs power domain), the SCMI cpufreq driver dynamically fetches OPPs
directly from firmware.

It appears the SCMI drivers bypass parsing the device tree
operating-points-v2 tables entirely, meaning the OPP core won't trigger
bandwidth scaling during CPU frequency transitions. Does this leave the LLCC
and DDR bandwidth unscaled, contrary to the commit message?

[ ... ]

> +	cpu0_opp_table: opp-table-cpu0 {
> +		compatible =3D "operating-points-v2";
> +		opp-shared;
> +
> +		opp-384000000 {
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-peak-kBps =3D <(547000 * 16) (350000 * 4)>;

[Severity: Medium]
Is this bandwidth scaling data accessible if SCMI is handling the OPPs?

Because the SCMI cpufreq driver doesn't use dev_pm_opp_of_add_table(),
these static bandwidth mappings appear to be inert dead code. Is there
another mechanism being used to pass this interconnect bandwidth data
alongside the SCMI managed operating points?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-sm8750-ddr=
-bw-scaling-v1-1-f39f918c95a7@gmail.com?part=3D1
