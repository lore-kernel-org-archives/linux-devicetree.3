Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA3F53B325
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076152; cv=none; b=XNyBVdrBxxXh/Lr7J2qhMcENbQZvs0yRJugde6TBS3AbWwPKhEOw8Vtxd2gJQRwTj8h9WgTn/g1vKANbmmZpUQ4PexYq/0afCTVAFFNwd4oHuYjTyKZozizdWCMtU6+F4dUaFTqojDykCQvHbCeUEFyWBH+tGNN0guCQwtnKB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076152; c=relaxed/simple;
	bh=Q9rCd2vKlsz5N39sqSVlzAeygiZSYXSgOSuL42p3SI4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SFrZHVjEn71bNyw5lI+px3V/Vz3RjccZf2YsftevJONiXMaX8RHfWHIuO/7bLOMZAmqxiB6RL/GhhQAtwNOfZtLIrfdeNJJ8D1XwmYQl1+SmYPegjAFQ4Ej6BSvhrAfu2nX23GvGiE2h1UCTXxmEh7JZSNQtB6fxRGs741bVP/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WX8WGB0w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WX8WGB0w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FC51F00893;
	Tue, 22 Sep 2026 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790076151;
	bh=fU73jGzq5GFzPjjppXF6hW3ZfuZJwVfCZNozcUbycSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WX8WGB0wW3cWNIA0ndToAgmLHfJ1wCbH0MzrNklGumm4pMHU7+Oo7EcQbLS9WZN6v
	 BF1QkzW630jket1zV5oCjb+if/elh41Jkl2l5J1Xg0siubrdPloVJ9qsY+o98mJ6ya
	 gNjxc5ksgDjQwque8UY1m8W742MlIl/pREfkz7b12cEKNH3FO0Kq+THI8l4+wNmMQX
	 ACuLqK8sPVKb0d9bXVKs/Dl7KMYJQHChWsfBLKZUCm2uer/OTsYmWoJYUJx96h5TpN
	 OH8x1cLRru26N+ZxOX3nRyQeJ+DsJO+tau3JgiwQgAi+us6HXvZ8E4nTpZSyFDVYtU
	 KgjuYr9AOp/Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add adreno SMMU nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
References: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 11:22:30 +0000
Message-Id: <20260922112230.D0FC51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: missing status disabled for adreno SMMUs causes =
probe panic
--

commit 8a1e674673fbb99f1a306ac8158a2cd1f163f274
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: nord: Add adreno SMMU nodes

This commit adds the Adreno GPU SMMUs (MMU-500) for both GPU instances to
the base nord dtsi. It also notes that the required clock and power domain
resources are wired up in nord-embedded.dtsi.

Dependencies:
- SMMU binding: https://lore.kernel.org/all/20260902013858.130887-1-shengch=
ao.guo@oss.qualcomm.com/

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index e0496fd40c308..6c53246d5ad05 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1518,6 +1518,80 @@ tcsr: syscon@1f60000 {
>  			reg =3D <0x0 0x01f60000 0x0 0xa0000>;
>  		};
> =20
> +		adreno_smmu_0: iommu@3da0000 {
> +			compatible =3D "qcom,nord-smmu-500",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";

[Severity: High]
Should this node be marked with status =3D "disabled" by default?

Because it lacks clocks and power-domains here in the base nord.dtsi
(which the commit message mentions are added in nord-embedded.dtsi), it is
enabled for all boards including this dtsi. This causes
devm_clk_bulk_get_all() in the arm-smmu driver to return 0 clocks and
succeed. The driver then accesses the SMMU registers without enabling the
required power resources, leading to a kernel panic (synchronous external
abort) during boot.

> +			reg =3D <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells =3D <2>;
> +			#global-interrupts =3D <1>;

[ ... ]

> +		adreno_smmu_1: iommu@98a0000 {
> +			compatible =3D "qcom,nord-smmu-500",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";

[Severity: High]
Similarly, should this node also default to status =3D "disabled"?

Like the adreno_smmu_0 node, this will cause a synchronous external abort
on probe if the required power resources are missing but the node remains
enabled.

> +			reg =3D <0x0 0x098a0000 0x0 0x40000>;
> +			#iommu-cells =3D <2>;
> +			#global-interrupts =3D <1>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922111354.5339=
02-1-shengchao.guo@oss.qualcomm.com?part=3D1
