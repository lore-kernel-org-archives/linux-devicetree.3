Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7B358372
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774248; cv=none; b=hDVDllh6jNdZRPEnue6O9O5N3ZLm+hVMVMbV61BdCzBEfem/wvMd7aMmjWAnnFiBg5bT3HsUFww5Cfrb6ksn8yRtY/Qr83DVbJFr0QGhaUXkDEFi1u4BAkiQ0KkthjcOKD5fZiOEzxsVqCtVEFEgQGVd6qLcQwNiuYbCTyV3Ok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774248; c=relaxed/simple;
	bh=1EPAuQJJmJiLgX/Cc7bUs4zcEqYHBCQHepHaEodrz6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hVZ1uhP+roFh0MtvE/ojJH2vP6Nsy/fkmAM+OPCifgHNJHSQqrCh+GCwHWKGa5tZqJOkA6NnL//b/Qx+HJvsap2dH8Y1BgV8uoVg8hXePDFKvvYKrIvU2HN59sYRiwyNXFZLofU1mHbuXRTkhPaFI5Xgt0p1Jmw8fpjj6t15KiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jW6mcC5J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW6mcC5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68B41F000E9;
	Tue, 26 May 2026 05:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779774247;
	bh=lu8MkCXytTIex5lzlpqA6z4le1b27AQaCKcL0CxIOW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jW6mcC5JHN5s2iCG1FmMNoduVXO+Tdls90LekcuXyjw4f3MO206hiCSDFF7gC6Jor
	 dQU9oxyESvazH+qlDCKEYrZP+LgYZdxWcGlQZwSR4KIEBJAY9YkH61G7SrYUI2Qq50
	 JRJph6mhDJdwcn3Ll2t5lgDOP2z0eX4zToBZLjzIvS4bwVh/kbiGkOzGnjyPyLTJdu
	 Vd+jlHF3UFHVsccDuMxmt1lDlboYF0UeGWpavsdzPZB7cqhAFsMgyizEK5K6COkBhC
	 E9HAIFMliRm/td5VZA/5hvdwDYtMsOpbdJ8S14FIbRT/NzwqL343JOpjL3S5587W+d
	 KJtx39pFeLJVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for
 Nord SoC series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 05:44:06 +0000
Message-Id: <20260526054406.D68B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The UFS host controller node is missing the required `reg` propert=
y.
- [Medium] PSCI CPU power domains incorrectly reference an `arm,idle-state`=
 as a `domain-idle-state`.
--

commit 5cfe2bd3985bb2e72ebd4055f3c4ed028cffb283
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
arm64: dts: qcom: Add device tree for Nord SoC series

This commit introduces the base device tree include for the Nord SoC series,
defining core hardware components like CPUs, GIC, GPIO, thermal sensors,=20
SMMUs, UFS, and power management domains.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..954a2b23a4fa3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -0,0 +1,4513 @@

[ ... ]

> +		idle-states {
> +			entry-method =3D "psci";
> +
> +			core_off_c4: cluster-c4 {
> +				compatible =3D "arm,idle-state";
> +				idle-state-name =3D "retention";
> +				entry-latency-us =3D <93>;
> +				exit-latency-us =3D <129>;
> +				min-residency-us =3D <560>;
> +				arm,psci-suspend-param =3D <0x00000003>;
> +			};
> +		};

[ ... ]

> +	psci {
> +		compatible =3D "arm,psci-1.0";
> +		method =3D "smc";
> +
> +		cpu0_pd: power-domain-cpu0 {
> +			#power-domain-cells =3D <0>;
> +			power-domains =3D <&cluster0_pd>;
> +			domain-idle-states =3D <&core_off_c4>;
> +		};

[Severity: Medium]
Will this successfully parse the domain idle state?=20

The generic power domain framework (genpd_parse_state_node) expects nodes
referenced by domain-idle-states to have compatible =3D "domain-idle-state"=
.=20

Since core_off_c4 uses "arm,idle-state", this might get rejected during
genpd initialization and prevent CPU retention/power-down states from
working in OSI mode.

[ ... ]

> +		ufs_mem_hc: ufshc@1d44000 {
> +			compatible =3D "qcom,nord-ufshc",
> +				     "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			interrupts =3D <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			lanes-per-direction =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x14c0 0x0>;
> +			dma-coherent;
> +			msi-parent =3D <&gic_its 0x14c0>;
> +		};

[Severity: High]
Is this node missing a reg property to map its MMIO base address and size?=
=20

Without it, schema validation may fail, and the UFS driver won't be able
to map its hardware registers. This will cause the probe to fail, which cou=
ld
prevent the system from mounting the root filesystem.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526051300.1669=
201-1-shengchao.guo@oss.qualcomm.com?part=3D2
