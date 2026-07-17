Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A223EB114
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283212; cv=none; b=pgtRlAs7M9I+n1bOnEfnPx+PmfWYcdVYFqQImslAUK59Csl5yHyFEe1VIwJtwkZXALFo/1fVwAIlB2l3kxmGZWICKoxuTRIpiMHUes+tmElYpi3OkFXXn9uGJ3DmH8ra/IfS+2LYKBgyT/SRboG2SA3Us0kfvzjCpmwhUFgW/Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283212; c=relaxed/simple;
	bh=SoxoE4V8z7Y5OfG1kOJLQKGsQC/0T3rtPRwhxZC1UWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OIqRE0SP40ZNvWvu3MgcAzqeo6KFj5+iYbY2iGUi7SxfE0M6G97qZU13mjZJgJgdtwln5GPqq8Z4X/XwexhKSy3GOmt/GuuMAtcEhAblFZdoJSM9aiQl5/NZd9iEC6DklWeqqcIvf1v9XwIfwyz4RNcDiBB0dOShf+FD9aRTsCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbB6F1nm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbB6F1nm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281C81F000E9;
	Fri, 17 Jul 2026 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784283210;
	bh=mEA0tZnPg2dEhVLwWISFfl/dA9fbbhlePrAfkvsrlXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NbB6F1nmfY4ncHgZJrI+pAwqg6THMojJ5K9c/yYHn8zyAVc4z5/KQdTKrryGVT5xa
	 bzSl9SQObjj2acILiWZR1tZmAdZ7+6jAow1xr1T48lrlzdXdoBZQi+CRHLyC4Kp9DN
	 H9O4M1sToK8WOx8WNao1ZzTYi164iN0VZaWQY8uapWnxr0ndfPUIRMTaTNmjGFPdex
	 aDnvS+zu6ooI41TqfvBPVci9h8uKdufaQaCl8cze7icDT/xfGIO9Xgr0ScXHBFqPa4
	 LHDZDz2a03RvHCA3FdHqPOjRsj2Jl7DUxom0V4+EW4ds7U0HiN74x83wzA0WAtYX82
	 6OnoXUDS9wZSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML
 offload memory and SMMU mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Meduri" <pratyush.meduri@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
 <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 10:13:29 +0000
Message-Id: <20260717101330.281C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The ML-related SMMU stream IDs are added to a different device's I=
OMMU domain (remoteproc_adsp) than the device mapping the CMA buffer (q6apm=
dai), leading to Stage 1 Translation Faults.
- [Medium] The commit message incorrectly documents the Stream IDs being ad=
ded as 0x3060 and 0x3062, while the code adds 0x2060 and 0x2062.
- [Low] The newly added reserved-memory node uses a vendor prefix and comma=
 (`qcom,audio-ml`), which violates standard DT node naming guidelines.

Pre-existing issues:
- [High] The `q6apmdai` driver does not initialize the DT `memory-region` p=
roperty, rendering the devicetree addition inert and causing allocations to=
 fall back to the default allocator.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML off=
load memory and SMMU mappings ---
commit 4a8f1567e9c6cd6a5d86dc17c6731564a853e2ff
Author: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>

arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU mappings

The audio ML (machine-learning) offload use case requires a contiguous,
physically addressable buffer shared with the audio DSP/SPF, and issues
DMA transactions through additional SMMU stream IDs that are not
covered by the existing ADSP mapping.

[ ... ]

> Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
> remoteproc_adsp iommus property in the EL2 overlay so these buffers are
> translated by the SMMU instead of being rejected.

[Severity: Medium]
The commit message documents adding stream IDs 0x3060 and 0x3062, but the c=
ode
adds 0x2060 and 0x2062. Is this a typo in the commit message?

> diff --git a/arch/arm64/boot/dts/qcom/monaco-el2.dtso b/arch/arm64/boot/d=
ts/qcom/monaco-el2.dtso
> index a7e3270f86090..97bb8287cec33 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
> @@ -17,7 +17,9 @@ &iris {
>  };
> =20
>  &remoteproc_adsp {
> -	iommus =3D <&apps_smmu 0x2000 0x0>;
> +	iommus =3D <&apps_smmu 0x2000 0x0>,
> +		<&apps_smmu 0x2060 0x9>,
> +		<&apps_smmu 0x2062 0x1>;
>  };

[Severity: High]
Does adding the ML-related stream IDs to the remoteproc_adsp node result in
Stage 1 Translation Faults?

The memory-region is assigned to the q6apmdai device (which uses stream ID
0x2001) in monaco.dtsi. When q6apmdai allocates and DMA-maps the memory, the
mapping is created in the IOMMU domain associated with 0x2001.=20

By adding 0x2060 and 0x2062 to remoteproc_adsp (which uses 0x2000), the Lin=
ux
arm-smmu driver places these stream IDs into a different IOMMU domain than =
the
one holding the ML memory mapping. Should these stream IDs be added to the
q6apmdai node instead so they share the same IOMMU domain?

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 64fc0d592282c..d971c0ea1b302 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -729,6 +729,14 @@ reserved-memory {
>  		#size-cells =3D <2>;
>  		ranges;
> =20
> +		audio_cma_mem: qcom,audio-ml {

[Severity: Low]
Does this node name violate Devicetree naming conventions? Node names should
typically be generic and avoid vendor prefixes and commas, which are reserv=
ed
for compatible strings.

> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0x0 0x00000000 0x0 0xffffffff>;
> +			reusable;
> +			alignment =3D <0x0 0x400000>;
> +			size =3D <0x0 0x1000000>;
> +		};
> +
[ ... ]
> @@ -2844,6 +2852,7 @@ q6apmbedai: bedais {
>  						q6apmdai: dais {
>  							compatible =3D "qcom,q6apm-dais";
>  							iommus =3D <&apps_smmu 0x2001 0x0>;
> +							memory-region =3D <&audio_cma_mem>;
>  						};

[Severity: High]
This isn't a bug introduced by this patch, but will this memory-region
assignment be ignored by the q6apmdai driver?

Looking at q6apm_dai_probe() in sound/soc/qcom/qdsp6/q6apm-dai.c:

	rc =3D of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
	if (rc < 0)
		pdata->sid =3D -1;
	else
		pdata->sid =3D args.args[0] & SID_MASK_DEFAULT;

	dev_set_drvdata(dev, pdata);

	return devm_snd_soc_register_component(dev, &q6apm_fe_dai_component, NULL,=
 0);

The driver probe function does not call of_reserved_mem_device_init(). For a
shared-dma-pool, the driver must explicitly initialize it. Without this cal=
l,
the driver dev->cma_area remains unconfigured and memory allocations will
silently fall back to the default system CMA pool, defeating the purpose of
adding this dedicated 16MiB region.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717095825.3962=
666-1-pratyush.meduri@oss.qualcomm.com?part=3D3
