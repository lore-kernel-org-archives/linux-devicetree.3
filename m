Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610D81AA8
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215947; cv=none; b=P2IMuOVSbVucoTozBzPO0jIw6ynRUmVa7YxSCOnIk0oHTlrWHjoW5tIUe3LH/CVnnobfaQ8ZwYx0Kov+PNynoqjk+HBoyAdV14cxIkNXBS0NpuVw037n9D14lKQIjTIEXS0KxNowUM3BEu3ew1whCb9Hqp/xjF3rkZzHds932VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215947; c=relaxed/simple;
	bh=unk9VhZXIRn8ljkn4Ob5TIDXdV302FVufjx8GNh3pKQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=quptC9OCzz64UaECDQFi4ehQRFTh3qoLvYnVk8O0G6/qP0lQmwR/ryp1Vk8rgJVF0/QFbVHPbUmb/AedriFkfyIz3Iol0VvUnYTbwotZ+eFLuYzR21b6E68YVdBe0OUQGpPq8Q/ODpZ7Mn6DXDATMJ8pR7DL9VzcIU6yiL1RBio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3rsHLJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3rsHLJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3526F1F000E9;
	Thu, 16 Jul 2026 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784215945;
	bh=tAICV+0jS87OgfLepygtCxntEgf1KEv/6l/y8aNqgNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y3rsHLJTXIqe3DJi7mK4a51BsGXfiMPmRAZ0jlz9nWf62IBgZjnNfjYsS8MMNTT2C
	 HFQHTJYbqCNskXHyPOcg4pzg8ZFms8pmrOr9rmJB/ToKZ3+8myFUdq4sOsuVI+k1Bd
	 QXaXsOo9xR7pY7MopiAL8RVTavaqnrFi6PW5NkS4b85eeWzxaQxdsjqEiiyPHZ7WOY
	 ijQt5AxA85A6GpB+NQutttSr/v+24AS0m1YYR/2M/lgVX29cAwyCCzNIdnUU9C8e7w
	 LiLUvqBOymOwBYY97aMn1OTxTIP8udQb7C/C6Y++2IaW78GFvyQk8dXYH1qH5S1qRQ
	 vO41XKubrr3oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: lemans: enable audio ML
 offload memory and SMMU mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Meduri" <pratyush.meduri@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716151854.3041914-2-pratyush.meduri@oss.qualcomm.com>
References: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
 <20260716151854.3041914-2-pratyush.meduri@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 15:32:24 +0000
Message-Id: <20260716153225.3526F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] ML stream IDs are assigned to the wrong device node (`remoteproc_a=
dsp`), causing Stage 1 SMMU translation faults when the DSP accesses CMA me=
mory mapped by `q6apmdai`.
- [Medium] Adding the 'memory-region' property to the q6apmdai node violate=
s the device tree binding schema.
- [Medium] Adding multiple stream IDs to the `iommus` property of `remotepr=
oc_adsp` violates the `maxItems: 1` constraint inherited from the PAS commo=
n binding.
- [Low] The reserved-memory node name `qcom,audio-ml` improperly contains a=
 vendor prefix and comma.
--

--- Patch [1]: [PATCH v1 1/2] arm64: dts: qcom: lemans: enable audio ML off=
load memory and SMMU mappings ---
commit ca6c69a94d584933404e0f4eb77272a1012439df
Author: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>

arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU mappings

This commit adds a 16 MiB CMA region for audio ML offload and assigns it to
the q6apm DAIs node. It also adds new SMMU stream IDs to the remoteproc
ADSP node in the EL2 overlay to allow the DSP to access the buffers without
faulting.

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

[Severity: Medium]
The common PAS schema for the adsp node=20
(Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml)
restricts the iommus property to maxItems: 1. Does adding three items
here cause dtbs_check to fail?

[Severity: High]
Will placing the ML stream IDs on the remoteproc_adsp node result in SMMU
translation faults when the DSP accesses the CMA memory?

Because the memory-region is wired to the q6apmdai device later in this
patch, the ALSA driver will map the DMA buffer into q6apmdai's IOMMU
domain. However, remoteproc_adsp is a distinct platform device with its
own domain. If the DSP performs transactions using stream IDs 0x3060 and
0x3062, they will be translated by the remoteproc_adsp domain which lacks
the mappings for the CMA buffer.

>  };
> =20
>  &remoteproc_cdsp0 {

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
The dtschema for reserved-memory nodes enforces a regex pattern that does
not permit commas (^[a-z0-9-]+(@[0-9a-f]+)?$). Could this vendor prefix and
comma in the node name trigger a dtc node-name-has-comma warning?

> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0x0 0x00000000 0x0 0xffffffff>;
> +			reusable;
> +			alignment =3D <0x0 0x400000>;
> +			size =3D <0x0 0x1000000>;
> +		};
> +

[ ... ]

> @@ -8134,6 +8142,7 @@ q6apmbedai: bedais {
>  						q6apmdai: dais {
>  							compatible =3D "qcom,q6apm-dais";
>  							iommus =3D <&apps_smmu 0x3001 0x0>;
> +							memory-region =3D <&audio_cma_mem>;

[Severity: Medium]
Does the qcom,q6apm-dai binding allow the memory-region property?

Running dtbs_check might flag this as an error because the schema for
Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml sets
additionalProperties: false and doesn't explicitly define memory-region.

>  						};
>  					};
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716151854.3041=
914-1-pratyush.meduri@oss.qualcomm.com?part=3D1
