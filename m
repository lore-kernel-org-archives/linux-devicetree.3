Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518025;
	b=wM5J1kZA/jTquAQRjE0pMY3/N+SjXIG6oy+BOQG/d76ODgezFIgYePeWyz8c3x/tCci3
	 L6/PxwZlfIET7tBoc0yF7RZrHNwuP2eb21fgod7tQ46akejzu/EXgNJZTn/hxbpgEZAhL
	 spGvSRF3G8U3qXpBczBWbUKTxtJpxXInYuwj7AST6U6JcDvYb2ZTh6GUkyv458+fbbqy8
	 zawIcXv+hUmVD07fKBeBos02izEBo9mVJoL4WPKKL2WRakl1WsKgJsiTGtvWb80alWvPQ
	 ZFFnMuB/yDaQfzDBXXE3gzRHMuxzmE2WkeLUmVkMwMZtfXY2QrNCKtKVD1EGAJXA8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518025;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qly1zGeHTqk/5sm2o7gs7J8sPM4vT5mFwRKuNLE1UIk=;
	b=WkRCL4GWJAdyrx1ZtoYCwbzaXkQEOu4IaYGsUNpL9xq/60l74aAh+wG1hgK73Ly66TpQ
	 fB9zrBuClcTUTZigOv2ES8b8oSkyThWcZ+6VV3VLqA4Q+qt4a5snzTv0ycSHF2pFUGEaA
	 0pWxs6NDri7MCJ01WDSFUtWY/gu/8OISCvrT/yXNI5XCrzUeiVQQ9Q6dla36HTg9+kwSv
	 DJhE/rfO1d0NCuY0lxP1lLOC0adAEUGeNcOW3jVZKJiNE2OoLzuUCUZY+jXH0NOVvMYWG
	 oEI4bNANzo0ueXmb62nwZ+z6PQhPXsEon8ckn5NOOyOMJpt21t8K46tIba8mhvGTRKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOWZ8Oae;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E40C606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOWZ8Oae
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF851F000D1;
	Tue, 24 Nov 2026 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518024;
	bh=qly1zGeHTqk/5sm2o7gs7J8sPM4vT5mFwRKuNLE1UIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XOWZ8OaeNrTp6PRzr/zHoelDsO/NmdybreEnTe23kkhBuh4YmgP0yb7RlROAtBmad
	 m8X3rLGrHIpiCZZF/bFWKaM6nTxUyCDlYje+Q/qKl8cHlaaz7p0/Lcxt5vt7/FDDkk
	 K/v3FlNX1Dsk11f/wZ/0mDV0UMlvqUc/3FlKhK/6qtmIR2NhLBKNu+/Dk7yjqlO/Py
	 nNCRAw64cSPMiqd+Bpjxxh5ginzqRPR8zRFd1ZXXtNSo0iGe85kHt7nskIsvxabZjy
	 TW4dTC0/93RDtVHey3msOpXJUY+IDP0D00pNzabOpBz6r167u8z8rWiw/3hXq2r2+I
	 hP1dtMfy+5RwQ==
Message-ID: <sashiko-outbox-231005@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iommu: Add Seca SMMU compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yadu M G" <yadu.mg@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <27f6e560a71f770078ef26137207905870c6ce58.1795517644.git.yadu.mg@oss.qualcomm.com>
References: <27f6e560a71f770078ef26137207905870c6ce58.1795517644.git.yadu.mg@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:00:23 +0000
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
- [Low] dt-bindings: iommu: missing allOf clock constraint for
  qcom,seca-smmu-500
--

commit a50417b889a5516165666393140d7c411dac19de
Author: Yadu M G <yadu.mg@oss.qualcomm.com>

dt-bindings: iommu: Add Seca SMMU compatible

This commit adds the qcom,seca-smmu-500 compatible string to the ARM
SMMU device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6748351c78122..6700d31517834 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -59,6 +59,7 @@ properties:
>                - qcom,sdx55-smmu-500
>                - qcom,sdx65-smmu-500
>                - qcom,sdx75-smmu-500
> +              - qcom,seca-smmu-500
>                - qcom,shikra-smmu-500
>                - qcom,sm6115-smmu-500
>                - qcom,sm6125-smmu-500

[Severity: Low]
Should qcom,seca-smmu-500 also be added to the allOf clock constraint
blocks at the bottom of the schema (for example, the block setting
clock-names: false and clocks: false)?  Without an entry there, clocks
and clock-names remain unconstrained and allow up to 7 arbitrary clocks
from the top-level property definitions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/27f6e560a71f770078e=
f26137207905870c6ce58.1795517644.git.yadu.mg@oss.qualcomm.com?part=3D1
