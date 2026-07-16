Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD73347BD4
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216706; cv=none; b=FlAS1/vHAxKPovCcoWTullFGohaGrF/2loAtiVx8m2hfuSYZFlsr6jKZbBK6mmpAIDqMhcoejyJzit6kuYEQcIHfk3ckJB11f0Ji51EEKMtM7GUtVpm9hhDr8K7WaPx8q9qZjvkf4fsbKQfx7ZCgaazlW2PRha0jBVhl76iyhy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216706; c=relaxed/simple;
	bh=53Q6YPemZ4Z7IiBTYpRxvtylbwPK6mUSuI8GX+RUuKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q2F0GnQhhmHZGnjRHXV7mHf837raDZqVhx3Hx/aQcsXL0dnVObO2LN55RSSBws5JpKjtZwIP6BZK4zFyBxvCgRXFGrdli108buFhwLhoyQkPLLIJJw3gVlNghN0RIKT21+ovGwN+cvaSbmZs9NuBvdYo8dvJumf2ZkP3cp2epv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqKkeO7B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqKkeO7B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265D91F000E9;
	Thu, 16 Jul 2026 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784216704;
	bh=Ob9IfSTkDd1oCbrGQgx0HK5l+WzI+66GPEYNxqOcUA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LqKkeO7Bs0ai/sk02Rv/vEWDckSx0bDpxJeLzKiKkpgd9Ge+irJWbWAfswu4NEUpO
	 TTxenECwgAzu6iIt1aAdb/GLcxVOptmUEyQ7IkXg46lsLugYPoPK20Vo7WTgp+/sLf
	 pvWIvAqAN0tcr4Y+IG/XrsyQ7BaFQn2x977nTOPWbIlNTmNQU4HcA7MGypzZRtTsVH
	 M3kcPsYGSDtV7sc6tBB2L9uM3HF5EU6+yksKSDhVkvZyZRdEOKSKtvdnM2WoZYoqx4
	 sTnA0dpOtNc/WC/2dHSKgLFrOUPy2tSgRx8yVemXX0pKP0wnPuyo+WBuzNbxmZjEgd
	 aa1NJIuq6j0Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: monaco: enable audio ML
 offload memory and SMMU mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Meduri" <pratyush.meduri@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716151854.3041914-3-pratyush.meduri@oss.qualcomm.com>
References: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
 <20260716151854.3041914-3-pratyush.meduri@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 15:45:03 +0000
Message-Id: <20260716154504.265D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The newly added `memory-region` for `audio_cma_mem` will be silent=
ly ignored because the `qcom,q6apm-dais` driver does not invoke `of_reserve=
d_mem_device_init()`.
- [Medium] The commit message incorrectly references stream IDs `0x3060` an=
d `0x3062`, while the code and the included error logs implement `0x2060` a=
nd `0x2062`.
- [Low] The reserved-memory child node name `qcom,audio-ml` incorrectly use=
s a vendor prefix and comma, violating standard node naming conventions and=
 schema bindings.
--

--- Patch [2]: [PATCH v1 2/2] arm64: dts: qcom: monaco: enable audio ML off=
load memory and SMMU mappings ---
commit d4559ccd650e9d04eb0b0b1f98b8e965dd7cd910
Author: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>

arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU mappings

This patch adds a dedicated 16 MiB shared-dma-pool CMA region for audio ML
offload and connects it to the q6apm DAIs node. It also updates the EL2
overlay to include the ML-related stream IDs so the SMMU translates rather
than blocks these transactions.

> Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
> remoteproc_adsp iommus property in the EL2 overlay so these buffers are
> translated by the SMMU instead of being rejected.

[Severity: Medium]
This isn't a bug in the code, but there appears to be a typo in the commit
message. The text references stream IDs 0x3060 and 0x3062, while the code
and the included dmesg logs correctly use 0x2060 and 0x2062. Should the
commit message be updated to match the implementation?

> diff --git a/arch/arm64/boot/dts/qcom/monaco-el2.dtso b/arch/arm64/boot/d=
ts/qcom/monaco-el2.dtso
> index a7e3270f86090..97bb8287cec33 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso

[ ... ]

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
Does this node name violate standard device tree naming conventions? Using a
vendor prefix and a comma in the node name (qcom,audio-ml) typically causes
dt_binding_check validation failures.=20

Standard reserved-memory schemas strictly expect child node names to match
generic patterns like memory, pool, shared-dma-pool, or cma. Should this be
named something generic like audio-ml-cma?

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

[Severity: High]
Will this memory-region actually be utilized by the driver?

Looking at the driver probe routine in sound/soc/qcom/qdsp6/q6apm-dai.c,
q6apm_dai_probe() does not appear to call of_reserved_mem_device_init().

Without that initialization, the driver will silently fall back to allocati=
ng
from the default CMA pool instead of using this dedicated 16 MiB region.

This seems like it would waste the reserved 16 MiB of RAM and defeat the
patch's goal of isolating allocations to guarantee contiguity, potentially
breaking the ML offload feature when the default CMA pool fragments.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716151854.3041=
914-1-pratyush.meduri@oss.qualcomm.com?part=3D2
