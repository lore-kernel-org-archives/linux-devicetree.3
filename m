Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94113F889E
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 17:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420970; cv=none; b=e8umzcI3im40SiMpAFE49Y6BDKSpHpy9dgO7vhvNPuRk71aVjj+ttmn5Y/nYPWQiQ6ixG5rw5gOVOzWoNu9Q9M8iBVOqdgtGY89V2WRVWLTPqzpzeLAPWJU+VJRoKc/lsyf33yruGVJ4KfHjrLTJqTpJ3b3MR4cAPXGe1Oartk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420970; c=relaxed/simple;
	bh=CMR7GAa3HlEHiVUv1q4eWMabNlQKCpS63Rm9iCMpb2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N50dRDd0w3VRe9+EuBjAv2qyxpn1ntJs3ctQnPKgLz2iig6kgvTaUHmY7G271UwXbLOJKorDEW+tKZliQ7XW+eSeWvYWdwYSaCHsIgMebvkShyqjV/sD9fp55snRLUXXVjdjRqHak1+dWIeH+oWQFgg3XxZoWoZ3w16ZuWgu6uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjQl6A0k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjQl6A0k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EFE1F00893;
	Tue,  2 Jun 2026 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780420968;
	bh=TJnLCDmwYkmsPjWk77mcM3NF0shuYC11a9ENuMeB3uE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RjQl6A0kyvQKwTNpjsaXn2k5vJhTIfdyPIgghJ8b6Mf40SHw14Itd7OGwXPULnhD+
	 EOP46O2PafIHCaFHI4ZZvthQVpYKcyhRZsyua6tlgrfqFCmBcmbqxx1IPWc005HUbR
	 dAocTrUdhoalDbXXfWSCfZ7Gyp/fiO0okKdwRiAVtsTMwI3MRU59wvXDCTs656YHhp
	 x4nPcV4ywYbc8OpmVlpW3h2sQdd1nvyn1zpV/AnNqRulfZKK8uTo0Xgkb/ldJaT1EQ
	 2sPLKCacSyhv6WysVF+oE24MwnkX7ZDK3Bg27azxgh4UF0Vg7zaRTR8xHVCHzXkryN
	 pJZZkNB1qIelQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/5] arm64: dts: exynos: gs101: Add thermal
 management unit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260602-acpm-tmu-v7-4-8047dd54b0e9@linaro.org>
References: <20260602-acpm-tmu-v7-4-8047dd54b0e9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 17:22:47 +0000
Message-Id: <20260602172248.54EFE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The TMU APB clock (priv->clk) is left enabled during system suspen=
d, causing a power leak.
--

commit 45da7d1dd2f371f5e33444f5d1be0481464a464a
Author: Tudor Ambarus <tudor.ambarus@linaro.org>

arm64: dts: exynos: gs101: Add thermal management unit

This commit adds Thermal Management Unit (TMU) support for the Google
GS101 SoC. It describes the TMU using a consolidated SoC node that includes
memory resources and a phandle to the ACPM IPC interface. It also defines
thermal zones for the CPU clusters to enable thermal mitigation.

> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 86933f22647b7..b6866ef99fb34 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi

[ ... ]

> @@ -639,6 +647,15 @@ watchdog_cl1: watchdog@10070000 {
>  			status =3D "disabled";
>  		};
> =20
> +		tmu_top: thermal-sensor@100a0000 {
> +			compatible =3D "google,gs101-tmu-top";
> +			reg =3D <0x100a0000 0x800>;
> +			clocks =3D <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
> +			interrupts =3D <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
> +			samsung,acpm-ipc =3D <&acpm_ipc>;
> +			#thermal-sensor-cells =3D <1>;
> +		};

[Severity: High]
Does enabling this device tree node lead to a clock leak during system
suspend in the corresponding driver?

Looking at acpm_tmu_suspend() in drivers/thermal/samsung/acpm-tmu.c:

drivers/thermal/samsung/acpm-tmu.c:acpm_tmu_suspend() {
    ...
    ret =3D acpm_tmu_control(priv, false);
    ...
}

During system suspend, the core PM subsystem calls pm_runtime_get_noresume()
in the device_prepare() phase, which artificially increments the runtime PM
usage count to prevent runtime suspend transitions.

When acpm_tmu_suspend() is invoked, it calls acpm_tmu_control(), which
temporarily increments and decrements the usage count via
pm_runtime_resume_and_get() and pm_runtime_put_sync().

Because the core PM still holds its reference, the usage count never drops
to 0. Consequently, acpm_tmu_runtime_suspend() is never invoked, meaning
clk_disable_unprepare() is skipped.

The peripheral clock remains unconditionally enabled for the entire duration
of the system sleep, leading to battery drain and preventing deep sleep
states for the parent clock and power domain.

The driver author intended the clock to be off here (as noted by the comment
'APB clock not required for this specific msg'), but missed the core PM
refcount behavior.

Should the driver be modified to ensure the clock is disabled or synced via
pm_runtime_force_suspend() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-acpm-tmu-v=
7-0-8047dd54b0e9@linaro.org?part=3D4
