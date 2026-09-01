Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF07D3290D1
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272185; cv=none; b=SO1I7YjCnlvtps3cEeA8q+9FjyO6QdqjvfJJKrkYl5wcRuIHtPfDWaVHOU0477R4QqQAQVI4fk7qUKJDu28iOfYE/DvNGudr37D3aun0llRQvR0ZykbtciMSIjLL53cHgsdyJ6LHY+9mA41Njit4HhIOjn/4J9mAjZ/d5dpW+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272185; c=relaxed/simple;
	bh=MvNmmo0UpAPINy+hk6fWvv1h3HkCtfG/JJdUOcaFEkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tl6JCaS+BRli4f0nEbZieXEWXY1FN+N7YziOoMhtCivvZRZSBA9IcCQCgJWLSVFSqN5Y5+DOoWAmYMCBFUwhkha5Q2jfrjYMz0aaDP8uI+U0s8stKi0Yz830Wk9SNnw851n5011jE9w2so/xse7weqH3ypgW7BvXMQz8P9VXrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKv/P+bY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKv/P+bY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB9F1F000E9;
	Tue,  1 Sep 2026 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788272184;
	bh=Hx9vx+bf6KcOmnCzMPZRX0cnx5cN/dBN/lO2ySqR/YU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iKv/P+bY0geOP4vtnRpcTD6GGiTxXDPi5pzdVySF25xvV+CgW1bjV2xeEgul+a5zq
	 nSfm4paIwlNlBuaCjn2rRLTPxx+QrhwJFAECsZc56cZ2X9/4PzXtudXY8MBB06TEdK
	 cUSt1O7DdizrlEeyNP/t4vI4dV+9lM/j7arhEkUv5+7BHCONaR4U5q6rbBnxMqbQOn
	 9xaHu4gGACShSCtme+2Av+H6dDd3zAUBxmWfnFNlt4KHcf6DfYaeIeIehJfuLFS10a
	 RmBtftTLPBfG33PBeiWNm7bl13geMMtJ04/v3F1aSA6msYnDggi0qxcSPH/kd+xp7q
	 xRFkxo1BXXn9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
References: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 14:16:23 +0000
Message-Id: <20260901141624.1EB9F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete Binding Schema: `qcom,nord-smmu-500` bypasses clock r=
estrictions because it was omitted from the Adreno-specific if-then conditi=
onal blocks.
--

commit c82163177cdbe8e91a89f7aadb6d4d1e2a85afb2
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC

Add a specific compatible string to document the GPU SMMU present on
the Nord SoC.

> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a965..ea338d313c052 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500

[Severity: Medium]
Does this new compatible string need to be added to the Adreno-specific
if-then conditional block in the allOf section?

When qcom,nord-smmu-500 is omitted from the conditional block that matches
other Adreno SMMUs (like qcom,milos-smmu-500 and qcom,sm8550-smmu-500),
the schema might silently permit invalid clock configurations. It appears to
bypass the specific clock restrictions for Adreno SMMUs and defaults direct=
ly
to an unconstrained state (1 to 7 clocks) since Adreno SMMUs use a 4-item
fallback array.

Should qcom,nord-smmu-500 be appended to the enum list in the allOf block
to enforce the correct hardware-specific constraints?

>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901140816.7420=
0-1-shengchao.guo@oss.qualcomm.com?part=3D1
