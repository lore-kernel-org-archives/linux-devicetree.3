Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182994;
	b=1Wrz0GTZ/3ZgiiOeMWvcaf6Qmtb8ibZo933s+FKOYRPcL7GoQXFs5sQrzYBfwbWy6t8a
	 6dL76GYlwnUuq2XTmJZ7JLMTIetOLaYJqGjm+seCWuNAumJKEl7yp8YSYoAOl0DUYmoov
	 N1B7nUPsJChgAG2GtgUA958OPqFmJNzWay+46p7P+XocYVCIv4TiEu/hC77ElFoND1Lmb
	 3KpnXRFbcb+tMcO++OULDP9J6In+SlDdAUVQhvAYJB6iCnbRjdXBdIu8qqTm+0adwJSNH
	 c9sJ0eirErReOyPPNst/BW8bO7Gd6DAKjlBgDRYXFpleYH+G+uH4jSHl++JDy4lRPSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182994;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+cLJ5vG96Cxxgr5suHwPwceVPa+rgcCkW7OFZoc3w5o=;
	b=yols6UT89nc+k0Lgz3sz1CN5JHP9APIu0/brDbenkTynWNHpEjahuB/MadwhXqqpXYC3
	 jdLe3/aPynTz/p5Xmn3F5kynVeDEV+YrvGAtqfCpG5t0/BQx9wNpmkhe94y5Lo1oMPZbS
	 r05En30pWVru+k5nZxehSVHrELu65z4kDXDRHx+vBl0CC6EGAOwC3KQFZxRaqdvZIN78f
	 RRdwF6hDrMYUJjycsVAAfniKrw1uFghd4Ps6+titenJzxnlO2hVtS/K4OMuw26v3524hP
	 hFyYzY+Dr4B+8FVb0jPcL5SY38Xsgo6dkgTfzNwa4nbwT7fkJnql4HJOZDtmuj45AGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDCcXhXL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD9060A3832
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDCcXhXL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16D41F00AD4;
	Fri, 20 Nov 2026 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795182993;
	bh=+cLJ5vG96Cxxgr5suHwPwceVPa+rgcCkW7OFZoc3w5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZDCcXhXL0cF9gzZm2iCBirrYFLbe6FwddkzgR9QCs57ihw/z9ds5n5m/GEF6Pc7FR
	 eHKuEtUxgsjJfRuuV1gLVOF5tz+QaY4DNXzyNgWEhghoUfGWFQdBj0zK+Ks+EJYit3
	 XWbqfrluNTIyRSET5jrYkIy8VRQ4fdLVHP3QzRGhYUOfjUdnZseySPJeqCWO2AoDdI
	 JcDkHqOAc+ka7lm38I9gw+G8eZBp2mFVMcsJhlJUqaT+/LIFXOGp4cqTqF8PocZh6e
	 tF7YuGuhyj7jOS37tBY+oMbbkqlBo0hqPcjQ/+B0epeMylEMvAoEf2KPMk/WJTbPe2
	 b7qtrwFHqEQGQ==
Message-ID: <sashiko-outbox-225305@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:56:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: lemans: adreno_smmu interconnects placed in
  lemans.dtsi
--

commit 69c1b90a142a42fba13058e11d6ad8fe981b319c
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU

This commit adds the GEM_NOC interconnect property to the adreno_smmu node
in lemans.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 20f329c0df751..be71eb30f9979 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
>  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +			interconnects =3D <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>  		};

[Severity: High]
Should interconnects be placed under &adreno_smmu in lemans-embedded.dtsi
instead of lemans.dtsi?

Commit 1f90a2bab7f6 ("arm64: dts: qcom: lemans: Move platform resources
into lemans-embedded.dtsi") moved the interconnect dt-binding headers, the
gem_noc and mc_virt provider nodes, and &adreno_smmu's power-domains and
clocks out of lemans.dtsi into lemans-embedded.dtsi.  Adding this property
to lemans.dtsi breaks building any target that includes lemans-gearvm.dtsi
(added in commit c1ef028799fc ("arm64: dts: qcom: Add device tree for
Lemans GearVM variant")), because neither lemans.dtsi nor
lemans-gearvm.dtsi includes the interconnect headers or defines &gem_noc
and &mc_virt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-smmu_inter=
connect_addition-v4-0-be30526391d9@oss.qualcomm.com?part=3D4
