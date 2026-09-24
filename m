Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A692E41A55D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240039; cv=none; b=JTHv2kVgTkgYbmc3OpkQ66VzDI1n1in6rXV7Yk+zHiJGY+nq3p3zfvnqHYaI+gHuR8C4Hh8TX3ISDqOUN1Ns0ZYlskib0C4TymGZysGGY5EVCCAcvjBp5hsGZa/bmo2zocHuWZKTsLu0WlfaCEctJtt9QNxsuNyBcqHVb/RJUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240039; c=relaxed/simple;
	bh=R2979Vx9+XCSHgKpBud0X74KevNQg24rSZimHiSfX5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sEnCKgEpnlBeleY/jxUO9mtFgKMOyd8b/PwPqIlU2EFy2iszIdUhetKqILr5BFaClZJ5c9YUCTibxihaxyTA+fELtfuON0uyZiBWKfWWP12CX2BcJPtKUZVUhth2dubctQkNEKWuZAZB06tuZCPfcFbWML1gKRH2DAf3V1ESVoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYUefgxQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYUefgxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F81D1F000FF;
	Thu, 24 Sep 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240038;
	bh=6FSeXHY2SCE7jFjaQlcYCbH/6EW7jQrwlsL+pKYiDjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JYUefgxQ6SV7YhKmz1AjHN+/v1Pf/UpJeCty7NHXE/6ePBM3a5n1ruksxxTY7z16k
	 Xt3g0Ey1LF3CoWfxUVS7F7N0KVvyYsPHyDYSEFEjqpIqRLwRJ5sPJsvdz2lDERUO04
	 +NNznTV99N6P6rDv09R08L9qJX2pnXzkThsAdYaLtwv7lFDYwP9izOvboN+9pvj+o2
	 AXSD6VyR/NkyKVu6+c+H+I9Iu2rYO8mDbgEODriY/1S/UDgpeo3ZgzowpGbWcqB23v
	 9rH+ckg4dBUESYgTpUORNTPhiW1dnz76kxZMvTO5qJblTFcpaFXuFc0uKrEpNPvaZC
	 hkhsz06YQg1GA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add adreno SMMU nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
References: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:53:57 +0000
Message-Id: <20260924085358.4F81D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: missing nord-embedded.dtsi changes for adreno SMMU nodes
--

commit a2c0ee3a850e499db0187f8a73a66cb5ce9ccf9c
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: nord: Add adreno SMMU nodes
   =20
Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index e0496fd40c308..376ae16041752 100644
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
> +			reg =3D <0x0 0x03da0000 0x0 0x40000>;

[Severity: Medium]
The commit message states that the gpucc clock and power domain are wired up
in nord-embedded.dtsi for these adreno SMMU nodes.

However, this patch only modifies nord.dtsi and omits the intended changes
to nord-embedded.dtsi. When probing the adreno SMMU on embedded Nord varian=
ts
that rely on gpucc, are the clock and power domain properties missing for
adreno_smmu_0 in arch/arm64/boot/dts/qcom/nord.dtsi?

Could this lead to driver probe failures or hardware aborts?

[ ... ]

> +		adreno_smmu_1: iommu@98a0000 {
> +			compatible =3D "qcom,nord-smmu-500",

[Severity: Medium]
Similarly, when probing adreno_smmu_1 in arch/arm64/boot/dts/qcom/nord.dtsi,
is this base node also missing the clock and power domain properties that
were intended to be specified in nord-embedded.dtsi?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924084805.1021=
758-1-shengchao.guo@oss.qualcomm.com?part=3D1
