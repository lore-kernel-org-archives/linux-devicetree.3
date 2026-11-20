Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173587;
	b=Em/Lu9r3cViFn5QZZmPRdsi6VkGgKQ7s0BCCOmW7fnnIsI5TTyMCIlMkrVkNdaYIBF4u
	 9onwHwnIryY7kqBiOGS1wlCniuFZknSihd+Vf6msbS+FGWgch63Zd+KYuCWLKCdlEC0CF
	 H40GM/RJhwdgzsJiNbeBT8eBYQnjZ3e6qRgfZSXzx8zHuYtlArcayQYmpQLNyiF27kqi4
	 Q2y3pzoAlhNlT289NFgJ1dEqV1TFAe9ZqIqGGazpo0e7eo2vs+JD6Mzq/1nLVa2JA2Kfy
	 XWf+gtD+Mw0r8WxO4Dv3O4dZYOZTm21hq/UDHmtXBEZUy3rYrGZ8YadgCy6UBMZdYtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173587;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qD+ogFAK7gLPhzPXNkz2nATMhcO3eXGteGlVM0lTvQM=;
	b=qGRGMWY1ByIt865aZ2B7QAEzx0XYhQhuitIinlwv5Iui64plsPhYYjMvfCorSriHrrZ6
	 MEmL9w0Vpjuj2jJNXL90Oxghqg6SUEMTPl18SSNLJyYdVAuJbtPHnlO29ad5fD0GmnFU/
	 dU9wMJMaiiWq3jzxLtFKR4sJw20OibjvHo9LWPM2Kku+c33pqmGzymozSq4jcORace72s
	 scKLF+mLfAWM/vqemPUy1B3lf/RuNzDU4UfWMxhYXNKCoVWnQ7PsxNWJVa4D8ijEWj1xj
	 9ssP6lDmvESrfiR5ci2PQSpNqzD9ZN09mLwATIwBeuqYltJ5vga3zD7Dqlnnjx14jjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HyqRvrtw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3CE606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HyqRvrtw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35531F000C6;
	Fri, 20 Nov 2026 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173586;
	bh=qD+ogFAK7gLPhzPXNkz2nATMhcO3eXGteGlVM0lTvQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HyqRvrtwQ2bRiW5FnqwnKVbv/ErVC6CafRGlVHra7AzqL45nUNusERJePyag57kcD
	 2RSsXNbtLVS8/xGckKK9sQe4MqRjMONk18+lH0KqyFOjQLY2HW5sLuyIEwMebmimFv
	 hZSKdmfjZd3S+6l8K+a/uvpyX19edDDrCinQk//HrxX/bY52TPaD3xVrJDUYPkkraA
	 GNP8qe9L5l07VcGpgnkT8Nr8nqnLEOopNx9A89RHd8jeEIwLleyy+IcM8fFAePe6xX
	 DFk3b2eoZ3eO8Y5jNZq+A+kjoVmezOGlPVT1DT89asG0lEYPX9WKVPWljmV/RETvtX
	 f9agjv52GqXtA==
Message-ID: <sashiko-outbox-225020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
 interconnect for adreno SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-smmu_interconnect_addition-v4-13-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-13-cab8ee8be0b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:19:46 +0000
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
- [Low] arm64: dts: qcom: sm8550: unintended removal of gpu
  interconnect-names
--

commit 84970715df5481c5df7967660858749ef5a111c1
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Add GEM_NOC interconnect for adreno SMMU

This commit adds the GEM_NOC MASTER_GPU_TCU to SLAVE_EBI1 interconnect
path to the adreno_smmu node on SM8550.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index cf7d67faef925..d11691a7ba36c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2898,7 +2898,6 @@ gpu: gpu@3d00000 {
> =20
>  			interconnects =3D <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> -			interconnect-names =3D "gfx-mem";
> =20
>  			status =3D "disabled";
> =20

[Severity: Low]
Was interconnect-names =3D "gfx-mem" removed from the gpu@3d00000 node by
accident?  The commit only describes adding the interconnect path to
adreno_smmu (iommu@3da0000), and removing "gfx-mem" drops the property
added by 1ba400792679 ("arm64: dts: qcom: sm8550: add interconnect and
opp-peak-kBps for GPU") and documented in
Documentation/devicetree/bindings/display/msm/gpu.yaml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-smmu_inter=
connect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com?part=3D13
