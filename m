Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845FF3EB107
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283108; cv=none; b=t+zTrMnkljIb9ZlbgOYzgJfAbTl5HJixpoRe5Adyi6MuwoF1bbIKcgk4M5/7QJNvalFjihON5bFHL7O4ADkgIIc0Xo3jEcZtnQQN42LfnoLRH9TRrH//xwnzAIKyvVdkQ87AMBZYtjqmhsUXr6mKg2uDhrBDabq4yX8GB+F/OPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283108; c=relaxed/simple;
	bh=Krs0EnDriK7KiUSHixzbmuAbEElQ6bIKVD46JPh1n5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jOwJzicn2YVGdSe1EPT2XGKpQY++gUH5eHzrU8z1eXpETsG0AwVEXI2N3dH/N5gDmfMJbVMR5eq0F1Xz8KVzBfep1vc4JGrf+J9/ZsdCVHufluB5QkaVfeo/qBlcoyfDFZFV8QSNo5wY87bVuf66CEQTBZTJv/ucFsJabVw0v+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXM1fySB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXM1fySB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5813F1F00A3D;
	Fri, 17 Jul 2026 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784283107;
	bh=sxqnYtInDIXJZR1GmtgxPGBxjPf7UevL7pO4hJngVjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXM1fySBEuQ/8cJTMo0yo4J3+ECWsJliAJEjCo52d9SXCf6r0RBn2qbIUgNbWr/4M
	 xETUM24t7cly6sAQTwyGgO28PCUoT+qfnUcA4xDlEZZs2I+VsCZA4FKcRl5m3fYUa+
	 v6EzmE8/AKDAKSGRfdL6BpiDQXcI/NPh2KIHc4H7ZUtgtGsWTPy4tRb8lbg3a67gTS
	 PP+nw4SrJbzFxjUf4Sk5MyrpZ1SlTlDkiSiPLdXcV7+gd6P9IdJ56ci61nJx3jgxCg
	 pPkC7L92ZEYo70o+4Z/5xEBUEe/R4jLTkK7Uv324C51981i0RJVWbB3TECzzUj0t+B
	 u8jpjV7wkknIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: enable audio ML
 offload memory and SMMU mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Meduri" <pratyush.meduri@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717095825.3962666-3-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
 <20260717095825.3962666-3-pratyush.meduri@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 10:11:45 +0000
Message-Id: <20260717101146.5813F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] IOMMU Domain Mismatch causing SMMU Translation Faults
- [Low] Device Tree Naming Anti-pattern for reserved-memory node
--

--- Patch [2]: [PATCH v2 2/3] arm64: dts: qcom: lemans: enable audio ML off=
load memory and SMMU mappings ---
commit 420f45475f05629508de21378a1cf7698d94040d
Author: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>

arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU mappings

The audio ML offload use case requires a contiguous buffer shared with the
audio DSP, issuing DMA transactions through additional SMMU stream IDs. This
adds a dedicated shared-dma-pool CMA region wired to q6apm DAIs and maps
the ML stream IDs to the EL2 overlay remoteproc_adsp iommus property.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/d=
ts/qcom/lemans-el2.dtso
> index 621ad930cf547..5b477346ef908 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> @@ -19,7 +19,9 @@ &iris {
>  };
> =20
>  &remoteproc_adsp {
> -	iommus =3D <&apps_smmu 0x3000 0x0>;
> +	iommus =3D <&apps_smmu 0x3000 0x0>,
> +		<&apps_smmu 0x3060 0x9>,
> +		<&apps_smmu 0x3062 0x1>;
>  };

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 3b0539e27b519..0605651137846 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -624,6 +624,14 @@ reserved-memory {
>  		#size-cells =3D <2>;
>  		ranges;
> =20
> +		audio_cma_mem: qcom,audio-ml {

[Severity: Low]
This isn't a bug, but does this node name violate Device Tree naming
conventions?=20

Node names are typically generic and shouldn't contain vendor prefixes or
commas unless they match the first compatible string exactly.

Could this be renamed to something like audio-ml-cma or audio-ml-mempool
instead?

> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0x0 0x00000000 0x0 0xffffffff>;
> +			reusable;
> +			alignment =3D <0x0 0x400000>;
> +			size =3D <0x0 0x1000000>;
> +		};
> +
>  		sail_ss_mem: sail-ss@80000000 {

[ ... ]

> @@ -8134,6 +8142,7 @@ q6apmbedai: bedais {
>  						q6apmdai: dais {
>  							compatible =3D "qcom,q6apm-dais";
>  							iommus =3D <&apps_smmu 0x3001 0x0>;
> +							memory-region =3D <&audio_cma_mem>;
>  						};

[Severity: High]
Will the ML engine actually be able to access this memory without triggering
SMMU translation faults?

The CMA memory region (audio_cma_mem) is assigned here to the q6apmdai
device. Consequently, allocations from this pool are mapped exclusively into
the IOMMU domain associated with q6apmdai (stream ID 0x3001).

However, the ML stream IDs (0x3060 and 0x3062) were assigned to the
remoteproc_adsp device earlier in lemans-el2.dtso:

&remoteproc_adsp {
        iommus =3D <&apps_smmu 0x3000 0x0>,
                 <&apps_smmu 0x3060 0x9>,
                 <&apps_smmu 0x3062 0x1>;
};

Since separate platform devices with distinct iommus properties are placed
into separate IOMMU groups and domains, won't the SMMU fail to look up the
CMA memory mappings when the ML engine issues transactions using stream ID
0x3060 or 0x3062?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717095825.3962=
666-1-pratyush.meduri@oss.qualcomm.com?part=3D2
