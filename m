Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453307;
	b=d3C4M6Ka5K7hEQPfDrPnlU2o9cPOyhOGlD5Y2UE7XNCqqj/omPzJMJVEUnW5F8/NkJQn
	 FzFf046tzr8krght08+msta2M17l7BtRNIGZKismYKOQNHwvNKKi7SZ1j5B0V878zybyI
	 eIDM7SU+YiLWGkF/X7YqAWnYN273H5POD6ThpS36vPyKxylnILGwMR77oOxhGXjgS0TB4
	 lXlx5dVPSTy/Gh87v0NA3pOz4D+Oe/fhPg/xadtWBEsDOgWoWugeJ7GmIKDpdiehQiiNw
	 BgnQBCRO4z1ulG2aJhwSyhldgsTbuKhE7PeRZwfGBdZAz7ymK8CGytclOFzitUrmhtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453307;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BoYcgtwnpqrOn40MVPOYtlz1xv2Q5jMPd/ZcYqp6E90=;
	b=ap2Rxv+jkXz3P58yrFehA9HfedvWVuTj0ic1kcmVC6FhoU3MfNp9g8L+J2b0JwaFnEbe
	 1aWNEtxy/CIdh3VdPHzDUInIPyZbw5Gx+DPoda3prD3ybyQ8OQW3Yv3rsRBimvJX74YMn
	 vgHDHlTUWhr8sgMyLL19DuBl3fDRvsxE2Mgqxy8zStdPVVWOzu1N4XR/0LBdxcZ6Qa5N3
	 9GIm7nUKMA6ldZu1ZRh8DUGwjj3DlE31+YLWvHqpGE813179tVzNANULaa9YXNZVJUsbU
	 8gJd2qjNd/M3iKCSyHnFOoaxdA11HLxpNkok9EmsFlK4uxTfi0FdSirOKnme43dOtww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJ87r2RB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB24606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJ87r2RB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD37B1F00A02;
	Sat, 31 Oct 2026 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793453307;
	bh=BoYcgtwnpqrOn40MVPOYtlz1xv2Q5jMPd/ZcYqp6E90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OJ87r2RBMlzg35vk/26N0pHgB7kne+ovj3b89tJ7USbQp6AwZUA1AXpggFAKYHi89
	 M2Hu+DLQZqNT47cO90EccSc9oCyQ1FTnyPC1JS0WrcXrIS1ToeF6t7tGViqZZElLih
	 /k63RbklAjE9SWkSiBFO2EJEDxMs3+2UMEoSwHez4imaDbhiQE2T2LBLCrR0dJdE5h
	 rpRhUaBd+Ug979KToLjT0jC9oHjhSndUVFPszfUotSsh0zQYmhPgJrvgjqlusnr6Pz
	 +n2T0Dl2nxz3zgCpluc0RoWL+3v5F/CVV0vEPlO9mMXlhp9yw9ujRksUfQjLzL7VIe
	 lnOIoUh07vOYw==
Message-ID: <sashiko-outbox-191973@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: lemans: Move platform
 resources into lemans-embedded.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261031131042.1200862-4-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 13:28:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: lemans: Stripped compatible from gmu and bwmon=
 base nodes
--

commit edcbb96f9884f5698a7680bbdeb712898fc65efc
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: lemans: Move platform resources into lemans-embedded.dtsi

This commit moves platform resources such as clocks, regulators,
interconnects, pinctrls, and PHYs from lemans.dtsi into
lemans-embedded.dtsi so that lemans.dtsi can be shared with the GearVM
variant.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 7547042d8e851..821c86409c5da 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi

[ ... ]

> @@ -4662,49 +3089,9 @@ gpu: gpu@3d00000 {
>  			gpu_zap_shader: zap-shader {
>  				memory-region =3D <&pil_gpu_mem>;
>  			};
> -
> -			gpu_opp_table: opp-table {
> -				compatible =3D "operating-points-v2";
> -
> -				opp-405000000 {
> -					opp-hz =3D /bits/ 64 <405000000>;
> -					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> -					opp-peak-kBps =3D <5285156>;
> -					opp-supported-hw =3D <0x3>;
> -				};
> -
> -				opp-530000000 {
> -					opp-hz =3D /bits/ 64 <530000000>;
> -					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> -					opp-peak-kBps =3D <12484375>;
> -					opp-supported-hw =3D <0x2>;
> -				};
> -
> -				opp-676000000 {
> -					opp-hz =3D /bits/ 64 <676000000>;
> -					opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
> -					opp-peak-kBps =3D <8171875>;
> -					opp-supported-hw =3D <0x1>;
> -				};
> -
> -				opp-778000000 {
> -					opp-hz =3D /bits/ 64 <778000000>;
> -					opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
> -					opp-peak-kBps =3D <10687500>;
> -					opp-supported-hw =3D <0x1>;
> -				};
> -
> -				opp-800000000 {
> -					opp-hz =3D /bits/ 64 <800000000>;
> -					opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> -					opp-peak-kBps =3D <12484375>;
> -					opp-supported-hw =3D <0x1>;
> -				};
> -			};
>  		};
> =20
>  		gmu: gmu@3d6a000 {
> -			compatible =3D "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>  			reg =3D <0x0 0x03d6a000 0x0 0x34000>,
>  			      <0x0 0x03de0000 0x0 0x10000>,
>  			      <0x0 0x0b290000 0x0 0x10000>;

[ ... ]

> @@ -4793,30 +3123,9 @@ adreno_smmu: iommu@3da0000 {
>  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> -		serdes0: phy@8901000 {
> -			compatible =3D "qcom,sa8775p-dwmac-sgmii-phy";
> -			reg =3D <0x0 0x08901000 0x0 0xe10>;
> -			clocks =3D <&gcc GCC_SGMI_CLKREF_EN>;
> -			clock-names =3D "sgmi_ref";
> -			#phy-cells =3D <0>;
> -			status =3D "disabled";
> -		};
> -
> -		serdes1: phy@8902000 {
> -			compatible =3D "qcom,sa8775p-dwmac-sgmii-phy";
> -			reg =3D <0x0 0x08902000 0x0 0xe10>;
> -			clocks =3D <&gcc GCC_SGMI_CLKREF_EN>;
> -			clock-names =3D "sgmi_ref";
> -			#phy-cells =3D <0>;
> -			status =3D "disabled";
> -		};
> -
> -		pmu@9091000 {
> -			compatible =3D "qcom,sa8775p-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
> +		llcc_bwmon: pmu@9091000 {
>  			reg =3D <0x0 0x9091000 0x0 0x1000>;
>  			interrupts =3D <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>;
> -			interconnects =3D <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> =20
>  			operating-points-v2 =3D <&llcc_bwmon_opp_table>;
> =20
> @@ -4865,12 +3174,9 @@ opp-9 {
>  			};
>  		};
> =20
> -		pmu@90b5400 {
> -			compatible =3D "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
> +		cpu_bwmon0: pmu@90b5400 {
>  			reg =3D <0x0 0x90b5400 0x0 0x600>;
>  			interrupts =3D <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
> -			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> -					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
> =20
>  			operating-points-v2 =3D <&cpu_bwmon_opp_table>;
> =20
> @@ -4893,15 +3199,11 @@ opp-3 {
>  					opp-peak-kBps =3D <16265000>;
>  				};
>  			};
> -
>  		};
> =20
> -		pmu@90b6400 {
> -			compatible =3D "qcom,sa8775p-cpu-bwmon", "qcom,sdm845-bwmon";
> +		cpu_bwmon1: pmu@90b6400 {
>  			reg =3D <0x0 0x90b6400 0x0 0x600>;
>  			interrupts =3D <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
> -			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> -					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
> =20
>  			operating-points-v2 =3D <&cpu_bwmon_opp_table>;
>  		};

[Severity: Medium]
As reported by Sashiko on v2 [1], moving the compatible property out of
gmu@3d6a000 (gmu), pmu@9091000 (llcc_bwmon), pmu@90b5400 (cpu_bwmon0), and
pmu@90b6400 (cpu_bwmon1) in arch/arm64/boot/dts/qcom/lemans.dtsi into
arch/arm64/boot/dts/qcom/lemans-embedded.dtsi leaves these four nodes
enabled under soc@0 (compatible =3D "simple-bus") with reg, interrupts, and
iommus or operating-points-v2 properties, but without a compatible string.

Neither the subsequent commit "arm64: dts: qcom: Add device tree for Lemans
GearVM variant" (lemans-gearvm.dtsi) nor commit "arm64: dts: qcom: lemans:
Enable lemans-sa8255p-ride board support" (lemans-sa8255p-ride.dts) adds
compatible strings to or deletes these nodes, leaving four enabled
simple-bus child nodes without a compatible property in non-embedded DTBs
such as lemans-sa8255p-ride.dtb and causing dtbs_check schema validation
failures under simple-bus.yaml.

Should the compatible properties remain in lemans.dtsi (with status =3D
"disabled" if disabled by default), or should the complete nodes be moved
into lemans-embedded.dtsi if they are exclusive to the Embedded variant
like epss_l3_cl0 and epss_l3_cl1?

[1] https://lore.kernel.org/r/20261015023711.721837-4-shengchao.guo@oss.qua=
lcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031131042.1200=
862-1-shengchao.guo@oss.qualcomm.com?part=3D3
