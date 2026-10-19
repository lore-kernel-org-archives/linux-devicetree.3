Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C27286A0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406415; cv=none; b=TZHkmJXZ050lZT29JNX3VvVgU87c7MNVWFZQ3lUbcdJGyeEQXSVqZiwvMpclPNvZoHuX+S1sWyseb3KzBc5bwCtCEhgHdi0DAX9tqfXp9Ga7ftwZpCuWeznqr6plbyCd91cddpyf0s/We8rbZxaXGv3GbN1jfj3+JRVax3R79Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406415; c=relaxed/simple;
	bh=AdBI5QAVOQi4V6Yx4xnWwGsFBn/7eJEGf/RobauGU3I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FBzWY4/bnqanlKsHAJU40M9JNCDfIUlXAShVi9hSMuVamtfq07gwmmpCsIsVt+qEv0VrdnnQXgA8nBnJmQdo3qva8Q+5hR4Qpuf/XTrBgnrS9+N/ID7BXjwUZZUWsFFZilbCE7nn4mXbPzM4rHFQmtC/wgaha3M2bUu4ljnbBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZscyYAuu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZscyYAuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B831F000C5;
	Mon, 19 Oct 2026 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792406413;
	bh=4pWsJBu7+nZwNDUMI8kZo9/UkLUYou4kzf6JUR4cquQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZscyYAuuxDupVqTtAO6h2ZiWavfzh6bm9qlsNPSszUiJ2HdOPzonpcN4ekgFfuxYU
	 tWowRhJJELBrKjv7f7jmipPcVXOcnqft1nn3mls4gz2N2bRCUg1lyezDEgnyiILfZU
	 IWxK6nh5f+fhZlGz/s7D2Tp2bo5C5G4b7fNi5paegfYIAsICD3bDP5BhB3+iV0s0b/
	 Lmez+MjupoAO7yKmHtcFeVnJTBvI+iTgBCGd+JpmjuvhO4Aeoj6wupK64rPodZq5Sw
	 quRRIu2KymEn5xmw/FHZC9oAPfe5NRQVUb4JvESPpjxkwKolBb0nWD1kGwgl0eqo7T
	 mumR5LUtjHRiw==
Message-ID: <sashiko-outbox-177006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: Add initial support for
 Exynos5515 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-for-next-lucky7-v2-4-c4ecab4b1c4c@member.fsf.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
 <20261019-for-next-lucky7-v2-4-c4ecab4b1c4c@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:40:13 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: exynos5515: undocumented and unsupported watchdog co=
mpatible
- [Medium] arm64: dts: exynos5515: pmu node uses software-model compatible
- [Medium] arm64: dts: exynos5515: missing clocks on sysreg_peri and sysreg=
_fsys
--

commit 004e20a5dc89e977ddee65c29861e06d78443621
Author: Aiden Isik <aidenisik@member.fsf.org>

arm64: dts: exynos: Add initial support for Exynos5515 SoC

This commit adds the initial device tree source for the Samsung Exynos 5515
wearable SoC, including nodes for the Cortex-A55 CPUs, PMU, ChipID, generic
timer, watchdog timer, and CMU_TOP, CMU_PERI, and CMU_FSYS clock units.

> diff --git a/arch/arm64/boot/dts/exynos/exynos5515.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5515.dtsi
> new file mode 100644
> index 0000000000000..ce6fcbfffdb2e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos5515.dtsi
> @@ -0,0 +1,189 @@
[ ... ]
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x0>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x100>;
> +			enable-method =3D "psci";
> +		};
> +	};
> +
> +	oscclk: osc-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "oscclk";
> +	};
> +
> +	pmu {
> +		compatible =3D "arm,armv8-pmuv3";
> +		interrupt-affinity =3D <&cpu0>,
> +				     <&cpu1>;
> +		interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +	};

[Severity: Medium]
Should the pmu node use compatible =3D "arm,cortex-a55-pmu" instead of
"arm,armv8-pmuv3"?

In Documentation/devicetree/bindings/arm/pmu.yaml, "arm,armv8-pmuv3" is
marked as only for software models:

          - arm,armv8-pmuv3 # Only for s/w models
          ...
          - arm,cortex-a55-pmu

When drivers/perf/arm_pmuv3.c matches "arm,armv8-pmuv3", it registers the
PMU with the generic name "armv8_pmuv3" instead of "armv8_cortex_a55",
preventing userspace perf tooling from identifying the Cortex-A55
microarchitectural events.

[ ... ]
> +		sysreg_peri: syscon@10020000 {
> +			compatible =3D "samsung,exynos5515-peri-sysreg", "syscon";
> +			reg =3D <0x10020000 0x10000>;
> +		};

[Severity: Medium]
Do sysreg_peri and sysreg_fsys need their clocks properties wired up to
CLK_GOUT_PERI_SYSREG_PCLK and CLK_GOUT_FSYS_SYSREG_PCLK?

In drivers/clk/samsung/clk-exynos5515.c, peri_gate_clks and fsys_gate_clks
register dedicated gate clocks for these sysreg blocks:

	/* SYSREG */
	GATE(CLK_GOUT_PERI_SYSREG_PCLK, "gout_peri_sysreg_pclk",
	     "mout_pll_peri_bus_user",
	     CLK_CON_GAT_CLK_BLK_PERI_UID_SYSREG_PERI_IPCLKPORT_PCLK,
	     21, 0, 0);

When cmu_peri and cmu_fsys look up samsung,sysreg via
samsung_cmu_register_one() -> samsung_en_dyn_root_clk_gating() ->
syscon_regmap_lookup_by_phandle() -> of_syscon_register(), the absence of
a clocks property means regmap_mmio_attach_clk() is not called, leaving
the SYSREG PCLK unprepared and unenabled during sysreg MMIO accesses.

In addition, Documentation/devicetree/bindings/soc/samsung/samsung,exynos-s=
ysreg.yaml
currently omits samsung,exynos5515-peri-sysreg and
samsung,exynos5515-fsys-sysreg from the allOf conditional block that
requires clocks, causing the else branch (clocks: false) to apply.

> +
> +		cmu_peri: clock-controller@10030000 {
> +			compatible =3D "samsung,exynos5515-cmu-peri";
> +			reg =3D <0x10030000 0x10000>;
> +			#clock-cells =3D <1>;
> +			clocks =3D <&oscclk>,
> +				 <&cmu_top CLK_DOUT_CMU_PERI_BUS>,
> +				 <&cmu_top CLK_DOUT_CMU_PERI_IP>,
> +				 <&cmu_top CLK_DOUT_CMU_PERI_UART>;
> +			clock-names =3D "oscclk",
> +				      "bus",
> +				      "ip",
> +				      "uart";
> +			samsung,sysreg =3D <&sysreg_peri>;
> +		};
> +
> +		watchdog: watchdog@10050000 {
> +			compatible =3D "samsung,exynos5515-wdt";
> +			reg =3D <0x10050000 0x100>;
> +			clocks =3D <&cmu_peri CLK_GOUT_PERI_WDT0_PCLK>,
> +				 <&oscclk>;
> +			clock-names =3D "watchdog",
> +				      "watchdog_src";
> +			interrupts =3D <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
> +			samsung,syscon-phandle =3D <&pmu_system_controller>;
> +
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Can this watchdog node pass dtbs_check or bind to a driver when enabled?

The compatible string "samsung,exynos5515-wdt" has no fallback compatible
and is not present in Documentation/devicetree/bindings/watchdog/samsung-wd=
t.yaml
or in s3c2410_wdt_match[] in drivers/watchdog/s3c2410_wdt.c:

static const struct of_device_id s3c2410_wdt_match[] =3D {
	{ .compatible =3D "google,gs101-wdt",
	  .data =3D &drv_data_gs101_cl0 },
	...
	{ .compatible =3D "samsung,exynos850-wdt",
	  .data =3D &drv_data_exynos850_cl0 },
	...
};

Also, for dual-clock Exynos watchdog variants with "watchdog" and
"watchdog_src" clocks, both samsung-wdt.yaml and s3c2410_get_wdt_drv_data()
in drivers/watchdog/s3c2410_wdt.c require the samsung,cluster-index property
and fail probe with -EINVAL when it is missing.

> +
> +		cmu_fsys: clock-controller@10400000 {
[ ... ]
> +			samsung,sysreg =3D <&sysreg_fsys>;
> +		};
> +
> +		sysreg_fsys: syscon@10420000 {
> +			compatible =3D "samsung,exynos5515-fsys-sysreg", "syscon";
> +			reg =3D <0x10420000 0x10000>;
> +		};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-for-next-l=
ucky7-v2-0-c4ecab4b1c4c@member.fsf.org?part=3D4
