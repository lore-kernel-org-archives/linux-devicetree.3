Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382E78F2F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177609; cv=none; b=iO/1Bz8nHOxdlf2sM3Eb9QMDygQGeD51ENzXgjjM9ofQdObKYueV/t0S4dtM1n2dtVr1BQlMNnt4/IF15ITSIpri5I+LZcDr0+YazmOasCSNDcrSmYaR8NXnEHdGIN9kua3CdMvr6EfAXMNV26TxYkKzXJcmeZxOAUiiiG7M22c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177609; c=relaxed/simple;
	bh=8cEWFSoWpKpfDcjsYZgs0qZxp62RsAbZNJXaysHVgck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IhXLwpChyETLTfKdmROgqQar7vZycNI/ECIBjJH0eUovFOY+MOcrecZ71o/+0B/iQwsEydCYn/jd57iGM+Fqob1IbY+dFPCVM1xxALRsbedaLrzZbx0nNs1miOguphc27Eky70hnMVQz5JO2O0SfX66T+ft4khNB39QuNjK+pgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgarmRXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgarmRXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CDCC2BCB3;
	Tue, 19 May 2026 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779177608;
	bh=8cEWFSoWpKpfDcjsYZgs0qZxp62RsAbZNJXaysHVgck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jgarmRXJXxi3VaGKLKbf7bC4TOnq3nN7OzRMuoMmcXDuiJzYXgczUuj3/0j7uzDqd
	 V36VR/GYIhSFClpb+WUaJnzPjhIoVFFMVmCumWWaRZT24ixpGvIaq4f8owG7apsPoa
	 XmHLU9hPLfCTakMtAeh+gr5OYx03RAOgV+hVWgAyfr/iPIwfut7Z7uQujbkNcCIhiY
	 3nxJhxUcB+8VCvJkmVBJLTg7rNDBZG/TW2GssCcEzmaI7jZncepXOPc/PMb6LQazsn
	 cXCxKZF5apjj/eh/N99zqSz9hrdhT02vrE0qEf3JTrda7OzfSGsMugZPHTjA8HbF39
	 MboDq9mZc81pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer
 Qualcomm variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519074113.61464-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519074113.61464-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:00:08 +0000
Message-Id: <20260519080008.96CDCC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Omission of AP variants allows invalid clock properties to pass va=
lidation.
- [High] Missing clock constraints for `hawi` and `kaanapali` Adreno SMMU v=
ariants.
- [Medium] Redundant and logically contradictory schema constraints for `sm=
6350`, `sm6375`, and `eliza`.
--

commit c2f0647af32a181995cc73fd00080208d48cecd5
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants

This commit updates the arm,smmu.yaml binding to add missing clock
constraints for several Qualcomm SMMUs. It specifically targets variants
that share a front compatible string but have different fallback compatible=
s,
restricting the clocks property where appropriate.

> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547c..ed0d10157bd61 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -566,7 +566,9 @@ allOf:
>        properties:
>          compatible:
>            items:
> -            - const: qcom,sm8750-smmu-500
> +            - enum:
> +                - qcom,glymur-smmu-500

Does this regression omit clock constraints for qcom,hawi-smmu-500 and
qcom,kaanapali-smmu-500 here?

These compatibles are explicitly defined in the top-level schema as Adreno =
GPU
SMMUs, yet neither appears in any conditional block that validates Adreno
clocks and clock-names.

Without this, when these are used as Adreno GPU SMMUs, the schema will acce=
pt
any arbitrary 1-7 clocks without validating the clock names, leaving schema
validation incomplete for these devices.

> +                - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
>              - const: arm,mmu-500

[ ... ]

> @@ -602,6 +605,39 @@ allOf:
>          clock-names: false
>          clocks: false
> =20
> +  # Disallow clocks for all other platforms where specific compatible is=
 used
> +  # with different fallbacks and only one combination has no clocks
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - qcom,eliza-smmu-500

Does this regression introduce redundant constraints for eliza, sm6350, and
sm6375 in this block?

The newly added block explicitly targets platforms where specific compatibl=
es
are used with different fallbacks.

The Adreno variants for sm6350 and sm6375 use the arm,smmu-v2 fallback. The=
ir
-smmu-500 compatibles are exclusively used for APs and are already
unconditionally constrained by the preceding contains-based block.

Similarly, qcom,eliza-smmu-500 lacks an Adreno variant in the schema entire=
ly
and could be added to the preceding unconditional block instead.

> +                - qcom,glymur-smmu-500
> +                - qcom,kaanapali-smmu-500
> +                - qcom,milos-smmu-500
> +                - qcom,qcs615-smmu-500
> +                - qcom,qcs8300-smmu-500
> +                - qcom,sa8775p-smmu-500
> +                - qcom,sm6115-smmu-500
> +                - qcom,sm6125-smmu-500
> +                - qcom,sm6350-smmu-500
> +                - qcom,sm6375-smmu-500
> +                - qcom,sm8150-smmu-500
> +                - qcom,sm8250-smmu-500
> +                - qcom,sm8350-smmu-500
> +                - qcom,sm8450-smmu-500
> +                - qcom,sm8550-smmu-500
> +                - qcom,sm8650-smmu-500
> +                - qcom,sm8750-smmu-500
> +                - qcom,x1e80100-smmu-500

Does this regression omit other AP variants from this new block?

Several SoCs share this identical pattern of sharing a front compatible with
Adreno GPU SMMUs: qcom,qcm2290-smmu-500, qcom,sar2130p-smmu-500,
qcom,sc7280-smmu-500, qcom,sc8180x-smmu-500, qcom,sc8280xp-smmu-500, and
qcom,hawi-smmu-500.

Because they are missing from the disallow list, their AP variants are not
properly restricted. For qcm2290, sar2130p, and hawi, their clocks remain
entirely unconstrained.

For sc7280, sc8180x, and sc8280xp, their AP nodes will hit existing
contains-based conditional blocks intended for their GPUs, meaning schema
validation will incorrectly allow their AP nodes to specify GPU clocks.

> +            - const: qcom,smmu-500
> +            - const: arm,mmu-500
> +    then:
> +      properties:
> +        clock-names: false
> +        clocks: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519074113.6146=
4-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
