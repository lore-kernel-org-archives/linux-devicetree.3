Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAA2E0B5C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609636; cv=none; b=cw35FrglYs8YDxEgW93P+L/dXLUEr/l5a5P5MlxfCCur1b8dFLzVA7aFE0BhNs6bffAnhf6OVZdTpXqqOKyRrfyEcKoxNDYMOlfIfj04QrprjuRCJQdiTe9A4SXOabQ+6vmWrQ0G/UmJZUb7JDySJidrqCWW46sxgrOEFPForKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609636; c=relaxed/simple;
	bh=H8G84BuUW3A/D8z6pTB/TyJlya0I5fcpjP8l/w+dDl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fpv3ML7NVXewzorry8k1MyRCEog3pm7slAPU3bRE5gn/0gWV9mrboupzKtqeSfpDCHTJ3W1XCJWXAWH88fwElMj9EcycIAFXg9G3AgUYFFpDJ0ku3gse/NoojN7zqm7vVtSnNCc+AC1rmKsjGD4MgtxE4HJ/mwXMxtlWzqmqwu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4Wnwk/K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4Wnwk/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6271F1F000E9;
	Tue, 21 Jul 2026 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784609634;
	bh=TuSKWNav2/RpDXNoc+xWUj1Pj7KSKrioUnb86dKS/J8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q4Wnwk/KD8fnLz4ZfplJDrK56CudHApMYCDjhXdvDacxhO786yV9GEnMI9cBlv4YE
	 15MkrY2YSHwxFPD2xJqcH8ufJhbQb4SYLIsaLhzwrmGPdu0RFMJ//3MLhJruAO/qI2
	 Gq1BOdwteorx5D4P5PPJmWD9wcbud+OmSmLVyncSQ8TCQ3AQ5wZ7v6gOwK6mTcL3sv
	 tYLV2LUmukIwVLDmW0X2b62q5UbkYSVKEgqQ5mpu4dBEPH6eh3UidxKxayc2z7VdqU
	 gg5r7SE4BydThol7JouYpnK70/foMJlOMGiA2bYrMymo+JLhHN06R4HigomFMVwu42
	 piOkZilGjy5tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] arm64: dts: qcom: Add device tree for Nord
 GearVM variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721044005.2882803-3-shengchao.guo@oss.qualcomm.com>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
 <20260721044005.2882803-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:53:53 +0000
Message-Id: <20260721045354.6271F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardcoded GIC_ESPI interrupts in scmi57 through scmi63 conflict wi=
th apps_smmu_0.
--

--- Patch [2]: [PATCH v7 2/6] arm64: dts: qcom: Add device tree for Nord Ge=
arVM variant ---
commit 1f36266e7d1bd796ddbb6d1dc183a6af6873f479
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord GearVM variant

This commit adds a SoC-level device tree include for the Nord GearVM variant
where a VM controls platform resources as an SCMI server. It includes shared
memory regions, QUPV3 GENI SE blocks, and a UFS host controller.

> diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/=
dts/qcom/nord-gearvm.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi

[ ... ]

> +	scmi57: scmi-57 {
> +		compatible =3D "qcom,scmi-smc";
> +		arm,smc-id =3D <0xc6008012>;
> +		shmem =3D <&shmem57>;
> +		interrupts =3D <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
Does this interrupt assignment conflict with apps_smmu_0?

The apps_smmu_0 node in the base nord.dtsi already claims GIC_ESPI 32 throu=
gh
GIC_ESPI 127 using IRQ_TYPE_LEVEL_HIGH. Here, scmi57 through scmi63 are
sequentially assigned GIC_ESPI 32 through GIC_ESPI 38 with
IRQ_TYPE_EDGE_RISING.

The kernel IRQ subsystem strictly prohibits sharing interrupts with mismatc=
hed
trigger types. This will cause request_irq() to fail for whichever driver
probes second. Because apps_smmu_0 acts as the IOMMU for core peripherals,
and SCMI controls critical power domains, a probe failure here might leave
core subsystems unpowered or unbootable.

> +		interrupt-names =3D "a2p";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		arm,max-msg =3D <10>;
> +		arm,max-msg-size =3D <256>;
> +		arm,max-rx-timeout-ms =3D <3000>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721044005.2882=
803-1-shengchao.guo@oss.qualcomm.com?part=3D2
