Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39D35C6A0
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974801; cv=none; b=X7CJjJaB7tgLZ4rylODEmG8CAQUdok6e0KKYk76mjB/b/mP7WG22RhRvgAmMRYVBouJM5jjJqQjSx5S+PhY/qLKinG7ATuszWnCsMrHK+SuHM2xaIKQZPAC0FcHpwgEjTBiZHO4qwLovRJ4WA8+y+u3YI4SrW7e+wZ5UzWI8/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974801; c=relaxed/simple;
	bh=/pTN6JoYJ+R2bFldo67j81clqF1Yrv9y8c3oQwqCv0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oA8ZQu0e/iLcHydTW/39IwYRZf5JiHJj+5Ody6guhDt7nKXPMhouyvFbhEND1OU8bXJ4vSf3Dc17IFyRKNpFj4BHmnuWB8ZNrqTOYKgfKxqpuEUExqD/waCntCOwzzCxYEs1dqP7mn4W7fcUEDEk7GkIHE9JJTzDhn6A1Jh8ugI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cstSFthR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cstSFthR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDE91F000FF;
	Wed,  9 Sep 2026 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974800;
	bh=hjDPLPqtSAsnSdo4Z7Hs6WiEhuhqBgDtq9BB81aaXRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cstSFthRqO6lVIsICDPijyPtpm3csRqcLe1HEyrK37vqXfwwBdZbc/NPLb5/Mwve9
	 WG+jG6RIrWnq45rIVwWwLHKu6hpopY6E7rFt48HbNVHsNFqfqQV/KYjKwBppGKSfwG
	 Yr7PjRnRL9HknJrCEepiR3TjXrn+Fee8yjrAOWcSBNZl0wrY5rWYz5gQiGwEVtlbY4
	 +8br7kS9X4QkToQZ86t1oJsjCLjxYKf/CbNobCf4hZNBHA/6nZqbk+AkIy3cq2igg5
	 yTyWO02lXKYcDYh1urVJpdwVF777/i+ngvk0vtvni79QfsX5+NrkgzgsA2OYZBRC+K
	 tJopUfFhbfcug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260910-kx-i2s-dts-v2-1-91f5376c899d@linux.spacemit.com>
References: <20260910-kx-i2s-dts-v2-1-91f5376c899d@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 17:26:39 +0000
Message-Id: <20260909172639.BCDE91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added I2S device tree nodes use hardcoded magic numbers f=
or DMA channels instead of the available hardware macros from `k3-pdma.h`.
--

commit 8163a94c4a6b08c0fea00752b0853d3f434a12d1
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

Add the six SSPA-based I2S controller nodes for the K3 SoC.
i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
divider, so they use the published 7-clock layout.

Link: https://lore.kernel.org/all/20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@lin=
ux.spacemit.com/

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index c3f2dce0969c0..f2ff9f02249c3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi

[ ... ]

> @@ -1140,6 +1140,85 @@ uart10: serial@d401f000 {
>  			status =3D "disabled";
>  		};
> =20
> +		i2s0: i2s@d4026000 {
> +			compatible =3D "spacemit,k3-i2s";
> +			reg =3D <0x0 0xd4026000 0x0 0x30>;
> +			clocks =3D <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S0_BCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S0_BUS>,
> +				 <&syscon_apbc CLK_APBC_I2S0>,
> +				 <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK_DIV>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
> +			clock-names =3D "sysclk", "bclk", "bus", "func",
> +				      "sysclk_div", "c_sysclk", "c_bclk";
> +			dmas =3D <&pdma 21>, <&pdma 22>;

[Severity: Low]
Could this use the available hardware macros from k3-pdma.h instead of
hardcoded magic numbers, such as <&pdma K3_PDMA_SSPA0_TX>,
<&pdma K3_PDMA_SSPA0_RX>?

> +			dma-names =3D "tx", "rx";
> +			resets =3D <&syscon_apbc RESET_APBC_I2S0>;
> +			#sound-dai-cells =3D <0>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		i2s1: i2s@d4026800 {
> +			compatible =3D "spacemit,k3-i2s";
> +			reg =3D <0x0 0xd4026800 0x0 0x30>;
> +			clocks =3D <&syscon_mpmu CLK_MPMU_I2S1_SYSCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S1_BCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S1_BUS>,
> +				 <&syscon_apbc CLK_APBC_I2S1>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
> +			clock-names =3D "sysclk", "bclk", "bus", "func",
> +				      "c_sysclk", "c_bclk";
> +			dmas =3D <&pdma 23>, <&pdma 24>;

[Severity: Low]
Could this use the available hardware macros from k3-pdma.h instead of
hardcoded magic numbers, such as <&pdma K3_PDMA_SSPA1_TX>,
<&pdma K3_PDMA_SSPA1_RX>?

> +			dma-names =3D "tx", "rx";
> +			resets =3D <&syscon_apbc RESET_APBC_I2S1>;
> +			#sound-dai-cells =3D <0>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		i2s2: i2s@d4027000 {
> +			compatible =3D "spacemit,k3-i2s";
> +			reg =3D <0x0 0xd4027000 0x0 0x30>;
> +			clocks =3D <&syscon_mpmu CLK_MPMU_I2S2_SYSCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S2_BCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S2_BUS>,
> +				 <&syscon_apbc CLK_APBC_I2S2>,
> +				 <&syscon_mpmu CLK_MPMU_I2S2_SYSCLK_DIV>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
> +			clock-names =3D "sysclk", "bclk", "bus", "func",
> +				      "sysclk_div", "c_sysclk", "c_bclk";
> +			dmas =3D <&pdma 56>, <&pdma 57>;

[Severity: Low]
Could this use the available hardware macros from k3-pdma.h instead of
hardcoded magic numbers, such as <&pdma K3_PDMA_SSPA2_TX>,
<&pdma K3_PDMA_SSPA2_RX>?

> +			dma-names =3D "tx", "rx";
> +			resets =3D <&syscon_apbc RESET_APBC_I2S2>;
> +			#sound-dai-cells =3D <0>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		i2s3: i2s@d4027800 {
> +			compatible =3D "spacemit,k3-i2s";
> +			reg =3D <0x0 0xd4027800 0x0 0x30>;
> +			clocks =3D <&syscon_mpmu CLK_MPMU_I2S3_SYSCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S3_BCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S3_BUS>,
> +				 <&syscon_apbc CLK_APBC_I2S3>,
> +				 <&syscon_mpmu CLK_MPMU_I2S3_SYSCLK_DIV>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
> +			clock-names =3D "sysclk", "bclk", "bus", "func",
> +				      "sysclk_div", "c_sysclk", "c_bclk";
> +			dmas =3D <&pdma 58>, <&pdma 59>;

[Severity: Low]
Could this use the available hardware macros from k3-pdma.h instead of
hardcoded magic numbers, such as <&pdma K3_PDMA_SSPA3_TX>,
<&pdma K3_PDMA_SSPA3_RX>?

[ ... ]

> @@ -1170,6 +1249,46 @@ spi1: spi@d4040800 {
>  			status =3D "disabled";
>  		};
> =20
> +		i2s4: i2s@d4041000 {
> +			compatible =3D "spacemit,k3-i2s";
> +			reg =3D <0x0 0xd4041000 0x0 0x30>;
> +			clocks =3D <&syscon_mpmu CLK_MPMU_I2S4_SYSCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S4_BCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S4_BUS>,
> +				 <&syscon_apbc CLK_APBC_I2S4>,
> +				 <&syscon_mpmu CLK_MPMU_I2S4_SYSCLK_DIV>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
> +			clock-names =3D "sysclk", "bclk", "bus", "func",
> +				      "sysclk_div", "c_sysclk", "c_bclk";
> +			dmas =3D <&pdma 60>, <&pdma 61>;

[Severity: Low]
Could this use the available hardware macros from k3-pdma.h instead of
hardcoded magic numbers, such as <&pdma K3_PDMA_SSPA4_TX>,
<&pdma K3_PDMA_SSPA4_RX>?

> +			dma-names =3D "tx", "rx";
> +			resets =3D <&syscon_apbc RESET_APBC_I2S4>;
> +			#sound-dai-cells =3D <0>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		i2s5: i2s@d4041800 {
> +			compatible =3D "spacemit,k3-i2s";
> +			reg =3D <0x0 0xd4041800 0x0 0x30>;
> +			clocks =3D <&syscon_mpmu CLK_MPMU_I2S5_SYSCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S5_BCLK>,
> +				 <&syscon_apbc CLK_APBC_I2S5_BUS>,
> +				 <&syscon_apbc CLK_APBC_I2S5>,
> +				 <&syscon_mpmu CLK_MPMU_I2S5_SYSCLK_DIV>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
> +				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
> +			clock-names =3D "sysclk", "bclk", "bus", "func",
> +				      "sysclk_div", "c_sysclk", "c_bclk";
> +			dmas =3D <&pdma 62>, <&pdma 63>;

[Severity: Low]
Could this use the available hardware macros from k3-pdma.h instead of
hardcoded magic numbers, such as <&pdma K3_PDMA_SSPA5_TX>,
<&pdma K3_PDMA_SSPA5_RX>?

> +			dma-names =3D "tx", "rx";
> +			resets =3D <&syscon_apbc RESET_APBC_I2S5>;
> +			#sound-dai-cells =3D <0>;
> +
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-kx-i2s-dts=
-v2-1-91f5376c899d@linux.spacemit.com?part=3D1
