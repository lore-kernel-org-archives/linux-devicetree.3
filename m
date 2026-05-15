Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303873E8699
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833000; cv=none; b=G3HXFu84Epe4pM4fPCws2+hVXIPNdzTnHw0WT57IKch/cLaVgOXmmcHWfgp4Hj8yUQlf5nAsWQvLAlGm0cXDtY90Z08cJOrawyY+AINggM0zq+jgCSWln7AyKtIHi5atfAvP3l2+c3I28OGerIacupNRq9pOKNdFZohFQKu3TNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833000; c=relaxed/simple;
	bh=rVpo9a7EvXuvyv7q5S+hulpYue/k1ckBZCw3qlkLoAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WEfVSY7sExE8IOLH77gizjkCgVZj7uGepVNPyHhONx3hpa0uPQgK++Oimpb84I7Q3a019+6zdSTQAoq+crpvhETRNZEuC/p+a1zXo8//x2nemK7QqTsnBJCQcYpdAwQ69Jn3RZJ9/6yf4A4L6n8yiHtKcsTyxtVJ7jj9OUTm1C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evuWIIAl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evuWIIAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A02C2BCB0;
	Fri, 15 May 2026 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832999;
	bh=rVpo9a7EvXuvyv7q5S+hulpYue/k1ckBZCw3qlkLoAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=evuWIIAl2fR8I9XT+tD7uncQib4RhYvd3XdQlL9O873iFjbYg8B44eI1aWymws/bs
	 E0awfjSnhevJ0aglH9ncquExgAHZT1GqVf05GT6FSMhYGyKXcTjjua7G7f21Mrgi10
	 D+3qOaHbuFtG/8t2gbdOWObHYaNrepPvO/s/Z3bK/RfxrXPtB3wKj7wkRidr6IW/nv
	 a2wySEDicw0gXGrXwBN2mArWkJH2xtxRONrZUsnLhgFzKAfIxuozEGVgJnUelmUvMD
	 PijeEN+Pe17mCfSv2ELQ7IILAsBXOfkW+a2NdzWWjPcYcCIEJGimAihWg9VE9mBctS
	 SXsUakkVW043g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA
 device trees
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 08:16:38 +0000
Message-Id: <20260515081639.19A02C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete Refactoring (Redundant Overrides)
--

commit 1b8d9495374546485f67ed52546157ae1e006ba8
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: Enable the SMMU for SoCFPGA device trees

This commit enables the SMMU on the SoCFPGA board device trees by setting i=
ts
status to okay in the base dtsi file. This is needed so the Secure Device
Manager can correctly access memory-mapped peripheral regions.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index 352c96d144a84..527a5ef54c837 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -385,7 +385,7 @@ smmu: iommu@16000000 {
>  			interrupt-names =3D "eventq", "gerror", "priq";
>  			dma-coherent;
>  			#iommu-cells =3D <1>;
> -			status =3D "disabled";
> +			status =3D "okay";

This isn't a bug, but since the status is now set to okay in the base dtsi,
does this make the existing overrides in the board specific device trees
redundant?

For example, socfpga_agilex5_socdk_modular.dts,
socfpga_agilex5_socdk_013b.dts, and socfpga_agilex3_socdk.dts already
contain:

&smmu {
	status =3D "okay";
};

Could these board-level overrides be removed in this patch to maintain
device tree cleanliness?

>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515080014.6260=
-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D1
