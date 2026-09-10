Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B007A380FF5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789009920; cv=none; b=R20ioYXv8609VEUmc1hemlY/r6k63Q/CFvGqaer8aF4t4rz9UNIoMWcltWO4ob1e0SzVNMsbUPwvRw0fbTb+APzl8y5+QLf+0OnG5fHFiHGwWbhY5k8pkiE2L1KL1pmdqpndL18ve9D5s1r5REvEFLGxbo+jInWxp3PkllflEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789009920; c=relaxed/simple;
	bh=wxu4inTJDKVHbU0Bj4Norit9ZIAgFyfkKxhs9tWja54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UT6CFP9N4FzHzVU1W68o8HRleVTeSDkswScKunwiy+fM8jD7hnvu6JZxLCOpW2MJRqn85h7VLOPi0ulPUAyO3F+ecAp1+XwGnAYWswk4eJESJSLRN/KR7cIgHjKpEQ6n3aI232a9BGOlnMzdcK+XSplLAdNCZuzneIJ6DhAq36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FG9GXcYn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FG9GXcYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B2E1F00898;
	Thu, 10 Sep 2026 03:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789009919;
	bh=T9LOOIzGKMg6rtMT5sc71inQC9bo5Wv1veZXjm4T3Ng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FG9GXcYnQEfQkkGiYwuAuq7jnUnFZdsQERGVKMNVWkptshH6emjTAgNS5iHEBOyTf
	 qPLrc+k8kuQ0b1clOchUt/kPgNoZfcPYPiy7yzUsgnMfhZ9c1Mmh6YatNS+R7Cvch6
	 nC7xjnq8FvMukY9n6jfM8l3tSScIIdT4remJo/Ok7zCEU49qU4iz/CXVsCZcTgySBY
	 woRFqFQcxThzEA0RLHOIy143kt8VZmYCB4VF7aIg2TfPJoSwwEF3BxEXWIUstz/6C4
	 0MknDvW6ADtnZwMK+4r2uZBfkBBYSfEYSHT3Z/+gxFnekQhWtv378EsJMULjbGIg+b
	 47PU6usyo4uWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8450: Add IPA node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909-sm8450-ipa-v2-3-2deb8b4e91a5@proton.me>
References: <20260909-sm8450-ipa-v2-0-2deb8b4e91a5@proton.me>
 <20260909-sm8450-ipa-v2-3-2deb8b4e91a5@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 03:11:58 +0000
Message-Id: <20260910031159.28B2E1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `ipa` node is missing the `qcom,gsi-loader` and =
`memory-region` properties, which violates the `qcom,ipa.yaml` device tree =
binding schema and causes the driver to fail during probe.
--

commit dced093feda54c054d95c56e0362c394d8a7c590
Author: Esteban Urrutia <esteuwu@proton.me>

arm64: dts: qcom: sm8450: Add IPA node
   =20
Add the description of the IPA block in the SM8450 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index b8793482b1815..95b6fd22a8465 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
[ ... ]
> @@ -2625,6 +2625,47 @@ adreno_smmu: iommu@3da0000 {
>  			dma-coherent;
>  		};
> =20
> +		ipa: ipa@3f40000 {
> +			compatible =3D "qcom,sm8450-ipa";

[Severity: Medium]
The newly added ipa node appears to be missing the qcom,gsi-loader and
memory-region properties. This violates the qcom,ipa.yaml device tree
binding schema and causes the driver to fail during probe.

If a board file enables this ipa node, the IPA driver's ipa_firmware_load()
function will unconditionally attempt to fetch the firmware memory region v=
ia
of_reserved_mem_region_to_resource(). Without the memory-region property
(which should reference the existing &ipa_fw_mem), this call returns an err=
or
and causes the driver probe to abort, leaving the IPA hardware completely
unusable.

Does this node need the qcom,gsi-loader and memory-region properties added =
to
ensure it validates correctly and probes successfully?

> +
> +			reg =3D <0 0x3f40000 0 0x10000>,
> +			      <0 0x3f50000 0 0x5000>,
> +			      <0 0x3e04000 0 0xfc000>;
> +			reg-names =3D "ipa-reg",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-sm8450-ipa=
-v2-0-2deb8b4e91a5@proton.me?part=3D3
