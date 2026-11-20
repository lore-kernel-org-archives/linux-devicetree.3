Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173638;
	b=yoUeokFhUviDb5L0Q/nkavhfomrTmYYCy9mjZDaOGmRn3t9Jn7xrMzvaPdEILiWoX9St
	 AYlTOoT208v8jwifl5hYUeRYm4pQDi79LwjEcehqHYda6ghaMTK1rdKF1EAiZMiRCwPEQ
	 1zpMxJdFrbvut+GcgVV6C/SWKenoubc5o1OOx3nW8tjwhAONWQtuUoX+Oa9AkYfsMRVbF
	 JEZqgozvS9ChY6VCsJ1H3BrqzaCwDXcP+376iIt1UZGT7uYy00tv72bQfBsQ8PfAPyrps
	 iAbDDjFpziAr2mNrKR0GnEME7yUU1FkGpbVCKrlk+lH1uq6NEmgZz4sPYjSFTFYjFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173638;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fYYHTUi/FbcikYuuAc9PGjmJ6qVjua1eY/ILg3ptx3U=;
	b=dLIYlOk23O09Et5gGwQN1f/dCQjWN7APuKun0oyGgGCvVgOZ+1fnE4y2zqWbdCZtqYeJ
	 qEdqt+06+qHdBhL0Nn6vSPADgdDHcVSsd34ILtBaqKxIuyvFDYHt1n8Qq68atlVC7nZLd
	 4UeBFBbdlaDvmTGKoXWrM8vj790BynVJreAkjzFTp8ih/M37nsUa+TMgXb6crTQH6TTvo
	 bTPJvoqM6qlb3tK3TGGVGvgWy+vAp94+XQsp53KGrMSIBQ8W0yFdgWwASGay1JCImuYZz
	 /1ZkKnWaKkWlAvbd0JU3tqbVho7+utBg50cx1z/qstCDPlpb5ukQiW4HLsDnAGVXh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P+gAD/dS";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F594606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+gAD/dS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C2A1F000C4;
	Fri, 20 Nov 2026 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173637;
	bh=fYYHTUi/FbcikYuuAc9PGjmJ6qVjua1eY/ILg3ptx3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P+gAD/dSK53Xoaw5J/pRdtM2aPS2mWcKzvNZ8yx3e2AvGo/RBkfy5ZAfkGde0Ad+E
	 u3msRxEnOlZoi3rLQdkII5kLh6TbRYYTRPpwspWmGy6AFdFIFLNoaXcoBZ7I/crEsx
	 oxRI8tcGys+xGAf9j7Y7BWGwq7dTojcAW9HXXS/C/2WjHcJLwxadgqd9jsM7igZFZK
	 6a7oJyk4UtVP/0mBiqPy/Awe097M9KaaLwtUrPWlujeKZaFGIpd7NpAMF+ifg6nA/j
	 E0S8wLr0lwc5algwZumQvbBdmrEduIOyeHtJ6Y/2C2VzI4zuXjDGxV7SXoCw4t6WYf
	 c5G0IZHccYe/g==
Message-ID: <sashiko-outbox-225025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-smmu_interconnect_addition-v4-4-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-4-cab8ee8be0b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:20:36 +0000
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
- [High] arm64: dts: qcom: lemans: adreno_smmu interconnects placed in
  lemans.dtsi
--

commit 91aa80f6108e778c84b304ef687907083b95b19d
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU

This commit adds a GEM_NOC to EBI1 interconnect path to the adreno_smmu node
in lemans.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 20f329c0df751..be71eb30f9979 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
>  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +			interconnects =3D <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>  		};

[Severity: High]
Should this interconnects property be placed under &adreno_smmu in
arch/arm64/boot/dts/qcom/lemans-embedded.dtsi instead of lemans.dtsi?

Commit 1f90a2bab7f6 ("arm64: dts: qcom: lemans: Move platform resources into
lemans-embedded.dtsi") moved the RPMh interconnect binding headers, the
gem_noc and mc_virt provider nodes, and &adreno_smmu's clocks and
power-domains into lemans-embedded.dtsi so that
arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi can include lemans.dtsi directly
with SCMI-managed resources.  Adding these RPMh macros and phandles to
lemans.dtsi breaks compilation for any target that includes
lemans-gearvm.dtsi because neither the macros nor &gem_noc and &mc_virt are
defined there.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-smmu_inter=
connect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com?part=3D4
