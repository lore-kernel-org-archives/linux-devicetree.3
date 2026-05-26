Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEBC30BBB8
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779768987; cv=none; b=Y04Q2hrUNXweI9ECaWps4NBlQBpQyg6AadC4oeHyRR5V27NMf2vRiIaEA0yUqN6+ziHBi6U2ubzZRG7CsEUTe9p1daMeWTWv/5uB073IhbnEM+P8VRCPTxKaE5yi450cFY6T/R9OSdsDHxC/8ZdrEWo9yJU8V/9FegvZFTlHY9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779768987; c=relaxed/simple;
	bh=ejWWegHAqDnYNV9rnycgBnIK7oZOtHTSnEX1Phyk1+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OJ9fYHUY3S/M8wYVOUrDJ5XPvbOkGtuI/LLJdqnry7jjBjv438QJUm93K8/35HW6TUCnqkXvHWNZBZfAmokTmOC1Zq+cTAOv9H1W+b9EjKGKjLYDSnAqUSg2Phki/gMWVv4BLFPvhgc76qH++wTdwvb57urT48IZzZESK5X58IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPJ0HE9k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPJ0HE9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7831F000E9;
	Tue, 26 May 2026 04:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779768982;
	bh=GNhUhVxyjIob4BLKtTZzoPhvnVARdL7zVkUa0IGBAgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NPJ0HE9knjhtRoDFBW6GrSnGnFoV4AUumNilMfEpzzrovSQ72nTsHf9zK0Wq2Yroj
	 v0fxaadk/507ijnAXTCFuQ05NYKCT+2NvCvAXxpWnJDCv2yTqvH1FWBmY7+a3+YjDF
	 uUOl6CAgajNHY5bjLyhfi+qn7YHa22t7mH3IWgaFoJhU7fsX8CdcsMY4jfC4bsrw7d
	 jEalFF7nOW+LX7tPiFsARtLiHc5GELShMM6Kz4x3O6uH51bWbNQ3jpP6ayDuqL+KpN
	 GUy5p9/Q7JiEGEp65g+nXpKa1mnpQHBVX4DchIW141V2lfoyie0xQb3hZ1Rt2OKWQJ
	 CzEGcS/TyGixg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260526034557.1669007-3-shengchao.guo@oss.qualcomm.com>
References: <20260526034557.1669007-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 04:16:21 +0000
Message-Id: <20260526041621.EA7831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] SCMI shared memory phandles are incorrectly ordered, breaking TX/R=
X communication.
- [High] The `ufs_mem_hc` node is missing the mandatory `reg` property.
--

commit cfa0d5607f866c28a7b366f81351c85f19172eee
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include (nord.dtsi) for the Nord SoC
series, describing the core hardware components such as CPUs, SCMI interfac=
es,
thermal sensors, and memory regions.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..954a2b23a4fa3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -0,0 +1,4513 @@

[ ... ]

> +	firmware: firmware {
> +		scm {
> +			compatible =3D "qcom,scm-nord",
> +				     "qcom,scm";
> +			qcom,dload-mode =3D <&tcsr 0x79000>;
> +		};
> +
> +		pdp_scmi: scmi {
> +			compatible =3D "arm,scmi";
> +			mboxes =3D <&pdp0_mbox 0>,
> +				 <&pdp0_mbox 11>,
> +				 <&pdp0_mbox 1>;
> +			mbox-names =3D "tx",
> +				     "tx_reply",
> +				     "rx";
> +			shmem =3D <&pdp0_a2p>,
> +				<&pdp0_p2a>;

[Severity: High]
Is this shared memory order correct for the SCMI driver?

The Linux SCMI driver typically expects index 0 for the TX channel and inde=
x 1
for the RX channel. Since <&pdp0_a2p> is Agent-to-Processor (RX) and
<&pdp0_p2a> is Processor-to-Agent (TX), does placing a2p at index 0 cause
the SCMI driver to transmit on the RX region and receive on the TX region?

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cpu_perf: protocol@13 {
> +				reg =3D <0x13>;
> +				#clock-cells =3D <1>;
> +			};
> +		};

[ ... ]

> +		rng: rng@10c3000 {
> +			compatible =3D "qcom,nord-trng",
> +				     "qcom,trng";
> +			reg =3D <0x0 0x010c3000 0x0 0x1000>;
> +		};
> +
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
Is the reg property missing from this node?

The UFS host controller node is declared with a unit address (@1d44000), but
without a corresponding reg property, won't the UFS driver fail to map its
registers during probe?

This might also trigger a dtc unit_address_vs_reg compilation warning.

> +
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible =3D "qcom,tcsr-mutex";
> +			reg =3D <0x0 0x01f40000 0x0 0x20000>;
> +			#hwlock-cells =3D <1>;
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526034557.1669=
007-1-shengchao.guo@oss.qualcomm.com?part=3D2
