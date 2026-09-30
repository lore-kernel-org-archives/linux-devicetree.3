Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA9B3624DB
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767557; cv=none; b=J/6Dzaj+9cIJ17Ux4RfzLXRYYHo+3qahV/W1dvis/A34VmUsA3wdkvhpm+63WCo5vHurgIyU7ZXPJYWrIU7ef1oI4ZNOCVimCIsLcyuhXb/w6xGgdkyUlRnOQLD+WrcjYsJbtLHlEYnzw5CRPjeunGchd9tEutOTOORUzv3ajaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767557; c=relaxed/simple;
	bh=G9xb4a0y6gEWtHuJPlK9+9gevT6oijNu6YVM5BlIV8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T96wv9KAUZ4/o2hQubTPuQ2MEMWD8qyYbg5xhBLBfXz5ZNPYLKju6SsXUvcUCM5Hf53bdeJ0mV+DyJlV4FMtPbD+q4PDznIkJvkFvhb1dfDX6RLVaKIVvt/UYOmlHJ4ZWbMGhuerOBatI72eEE6da0i2IXNk9CHQLtGtXIxZ3pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgdEoGua; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgdEoGua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F211F000FF;
	Wed, 30 Sep 2026 11:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790767555;
	bh=MT9pDBppidmhLiCh7Njwo66mhL1EOdQv1oqGvT4ZnK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LgdEoGua90kqAcqJa5e1rYz8cDEHS1PM/ZtuFILsAdV32l7BwxPWmL5DBjR4ak+Po
	 /j93bGAPhzb43m+LdcQlxZ3CegjTIc1aAe0arAB+54x3jz+bgutRBrJ4rajPo1gzHN
	 +MYqSP6+P9F9U4TmxmvVGpuk0wbWG02fF7IvgN+LvwpbKK3B5lSNWI6J78DAnlXcmf
	 rxhVTrpuy3cFsPKs0KkZpOlsmFJyhdz7WYvvw/Rq6EZK65rxiP9qNYOcR9o6CM3xiB
	 xk5FvEjRq1e6JE/m9pZGYjNex6WYued8goWwhz+Vj1xr058CiK6aa2uqmNmM531y4A
	 ukpUF4wrhiHkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-shikra-dt-changes-v5-1-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
 <20260930-shikra-dt-changes-v5-1-8eaf658a0e38@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 11:25:54 +0000
Message-Id: <20260930112555.69F211F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: incorrect over-indentation of the mdss node
--

commit c036145cd42553cee75513d9d43a23d346a733a4
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add MDSS display subsystem

This commit adds the SoC-level display subsystem nodes for Qualcomm Shikra,
including the MDSS wrapper, DPU display controller, DSI host controller,
and 14nm DSI PHY.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 9823c591b02b1..4ff85c1c8fddc 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> @@ -2809,6 +2810,207 @@ adreno_smmu: iommu@59a0000 {
>  			power-domains =3D <&gpucc GPU_CX_GDSC>;
>  		};
> =20
> +				mdss: display-subsystem@5e00000 {
> +			compatible =3D "qcom,shikra-mdss", "qcom,qcm2290-mdss";

[Severity: Low]
This isn't a bug, but does the mdss node have incorrect over-indentation he=
re?

The node is declared with 4 tabs, while its properties (e.g., compatible)
and children use 3 tabs, and its siblings use 2 tabs. This creates visually
confusing formatting where a parent is indented further than its children.
Could this be adjusted to match standard device tree coding style?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-shikra-dt-=
changes-v5-0-8eaf658a0e38@oss.qualcomm.com?part=3D1
