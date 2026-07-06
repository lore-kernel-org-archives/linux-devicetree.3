Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516643EB7F4
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322957; cv=none; b=U04qUN3hcLgZAQFze8HicwH0p9oQ6FZNTpZfa5zJipWD3e6pb9lWZvb6/JQcgLcLe1WhKky72ZksYRz1px9EReLWfLEiJS6ocRG/hJ0q9hZwQbVUtnP4J1mAt6xy24EtvbbCRfL7yFMZQTxT5rWBCO2CxdQRY/kN3VEVEVcLIxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322957; c=relaxed/simple;
	bh=7tJ4twLONmOOz0ElowuuUtMGNPjXbw8uXCL3n04HiRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pJ85q+/zGXPRost3jzVASYKAonZDW9YtcoSQooh7Wzzg7sB2ILgMVNIdu2POVdsXlVyJww/OVqnaLfu/UKdTSkNumix6iXCVndJYlvLJRUv8HI8vCBZIABFvYCG1lorOLptkwlHCe1PRtRig6x34AsMMArM8J1l5ndyo3xBE1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8YsTh/K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8YsTh/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C481F000E9;
	Mon,  6 Jul 2026 07:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783322945;
	bh=vdnTOBSrhHH6+gszY1RFinOrL6ia4reRz9DRuevoHDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d8YsTh/K2mhjAmoOjBK4u0fuLoxOBGTq86hOIhEyXLz0LZocwDiNrsizCjr3OdAZ/
	 Khowo+xYw81ciCvUr2r41fGowkw+1xgCXTYD3mb+GIZqpnqHMs6xXr918MSzDFNACK
	 RJC5ZHHjcsAvrz6fjxA55QXKCrKRiPjK5eJ9qK/Z2IVFlvzFQYTRBDugbNsSS7w/IR
	 PCuHZQCYyPUUvctb45F34Nd4jlX08LGpSbO1/wrqFMhNpmuV+Z6cJO3HvAsu97MngX
	 hN/Slo1f0xzB6N+UPb+nz4KG3EVsZwDfklC5ZAqcDmgyjQM7W61I5q6geSBUktPA7o
	 bZuNJSQwgmiyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:29:04 +0000
Message-Id: <20260706072904.F0C481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing interconnect bandwidth configuration (`opp-peak-kBps`) in =
`jpeg_opp_table`
--

commit 616b7352b84f0f021a4d35b811588d48e0fe74d6
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Add JPEG encoder node
   =20
Adds the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index 7076720413ab2..a089b706f60c6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
[ ... ]
> @@ -4649,6 +4654,82 @@ port@5 {
>  					reg =3D <5>;
>  				};
>  			};
> +
> +			jpeg-encoder@ac53000 {
> +				compatible =3D "qcom,sm8250-jenc";
[ ... ]
> +				interconnects =3D <&gem_noc MASTER_AMPSS_M0
> +						 QCOM_ICC_TAG_ACTIVE_ONLY
> +						 &config_noc SLAVE_CAMERA_CFG
> +						 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +						<&mmss_noc MASTER_CAMNOC_HF
> +						 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI_CH0
> +						 QCOM_ICC_TAG_ALWAYS>,
> +						<&mmss_noc MASTER_CAMNOC_SF
> +						 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI_CH0
> +						 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names =3D "cpu-cfg",
> +						     "hf-mnoc",
> +						     "sf-mnoc";
> +
> +				iommus =3D <&apps_smmu 0x2040 0x400>;
> +
> +				operating-points-v2 =3D <&jpeg_opp_table>;
> +
> +				jpeg_opp_table: opp-table {
> +					compatible =3D "operating-points-v2";
> +
> +					opp-100000000 {
> +						opp-hz =3D /bits/ 64 <400000000>,
> +							 /bits/ 64 <100000000>;
> +						required-opps =3D <&rpmhpd_opp_min_svs>;
> +					};

[Severity: High]
Does this missing opp-peak-kBps configuration cause interconnect bandwidth =
to
default to 0?

Since the interconnects are defined on the jpeg-encoder node, when the driv=
er
dynamically sets an operating point via dev_pm_opp_set_opp() during runtime,
the OPP core will iterate over these interconnect paths and call icc_set_bw=
().

Without opp-peak-kBps, won't this vote for 0 bandwidth on the hf-mnoc, sf-m=
noc,
and cpu-cfg interconnects? This could effectively disable or clock-gate the
memory buses, triggering NoC stalls, SMMU faults, or fatal bus errors when =
the
encoder subsequently attempts DMA memory access.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706071113.3832=
15-1-atanas.filipov@oss.qualcomm.com?part=3D4
