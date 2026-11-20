Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173526;
	b=HVGm1n0AEsCBDORm7R4mbD3tAYUVwGAETwLOazLIk6Wu4Nz5B+sF5Da0n54N0jcO+lur
	 G6EzcrbfMMyesRFuOgbVrySnnMA8xLSCq0rwnhCHAFhbOEHxY1Eu2ZW5Q6thjz0SzH1BC
	 vvq6oj7ucs31duG6ZgevfgokZ4LW/HjTedGfxfdF6KlqSO92lKEVCDqQnPMUJkGMZ0fxy
	 K9r3DRU0Wg2pAPM7Irhw31IoPIYulAxWqRNLHkl/wsnXIHqCgvJWpolpZgEgSk7w5llaJ
	 xZ7/oLM+nhjjaXvw/xFmfS/dH3EaCUuUENRz7YwC3FQzSCySTIS3Dd92gcNsfZ8RB3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173526;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F3IsEUnYkxFfjwTfAPIhfdEyk49Hm6IyPJknbf9OKAw=;
	b=cfZ7fh6R1I/O56j4k0GJ5N23SjC6aTZuXPKkFGhWDjV+8DYd/9uTcbC0LmJG7HBn7AV6
	 E5xwLRDxoZ/IbLPiiiMhmAVSyCaM8WWv7HbFnC2fq/VlGxhEwg3v/q715faxtW2wVt2Xh
	 N1t+8egQ9BrrT27b+194/Ve0KhrzR9aAEJK2RL6r7T6hL4hLYyIGvR+cud6lafB0ZzADp
	 C5R1YLOHHgeI5Z5FeHu98Z4Z5VIniV3nui4FyS1OxG0iagvR2XTmbYhB7+RGPsf+8+Lvf
	 p5qx01Q0HkL60et89yxYr3jpa4IPIBJ3FfhQpC0syBcNe5p+9slqS9HizMtlQFkb5zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8uWA14M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A0606A33C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8uWA14M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A201F000F2;
	Fri, 20 Nov 2026 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173525;
	bh=F3IsEUnYkxFfjwTfAPIhfdEyk49Hm6IyPJknbf9OKAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8uWA14MIa5dFlj0koHDol+HER38EbeFPHJ+Exna5/G9+JHyQruIem+AuVASJ2fJI
	 4LbFzEuA7ZmUlwIez3Ssdz5OFAKegd/ibj1qLqSCu/OH1rIJODWTVUDq7oesyz7ScR
	 2+VNPsnhMahp0B5q7yCDoBFnS4iPzetV7+UTuuZRp2ojaDl1WsC0g9sjR6ObDtYcfY
	 GKo6nvljGrTGm1UGeAv3G8Y8hD5eyfd+yh7FX9wN7rbTgVHrc6RermxYasw0hVvMcf
	 L7MZsB+Zyp0GLYCXR1LG69lAYI7XveizmOpGcFnWrpqIjSS3h/vS2jpfqQ+3z7cCfS
	 jjHZxE4Be72Ww==
Message-ID: <sashiko-outbox-225019@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
 interconnect for adreno SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-smmu_interconnect_addition-v4-11-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-11-cab8ee8be0b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:18:45 +0000
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
- [Low] arm64: dts: qcom: sc8280xp: unintended removal of
  interconnect-names on gpu node
--

commit 31ed160ba5181c81ec7e9540c83d18c590a7bfbd
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: sc8280xp: Add GEM_NOC interconnect for adreno SMMU

This commit adds the GEM_NOC to EBI1 interconnect path to the Adreno SMMU
node on SC8280XP.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 703b4f4e20598..6eae42384a18d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3405,7 +3405,6 @@ gpu: gpu@3d00000 {
> =20
>  			qcom,gmu =3D <&gmu>;
>  			interconnects =3D <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> -			interconnect-names =3D "gfx-mem";
>  			#cooling-cells =3D <2>;
> =20
>  			status =3D "disabled";

[Severity: Low]
Was interconnect-names =3D "gfx-mem" removed from gpu@3d00000 by mistake?
The gpu node retains its MASTER_GFX3D to SLAVE_EBI1 interconnect path, for
which Documentation/devicetree/bindings/display/msm/gpu.yaml defines the
gfx-mem name, while the commit message only describes adding the
interconnect to gpu_smmu.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-smmu_inter=
connect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com?part=3D11
