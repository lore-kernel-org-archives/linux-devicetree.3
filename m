Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250D4282F13
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786866678; cv=none; b=ir1PtSBxSzpfVG8GM7ODyTnHExzcM2eyN5Q8xwgyCNL5e6QSGz/BQAH06JPdz5yXyqMIcDHzJ/LMg6vrANtINBulNRMzjPaNbI7bBIKyBQ2qzDrYq54Qtk/AmxQyYIB+9UJv6VmqYMCDN113AB5kwVj4u6ZQv2p6uI2+0kiIHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786866678; c=relaxed/simple;
	bh=/uMKMSblCKeiyBfMseSktrBbfrIzVAOY0X1LgH987Ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H+F7+hsN0nV+81iRyl3re+hYlfp7qt8GfnutEE0r32zPJesc1lizR3dIsKK9qrLhK2Xx+1XHEY2P5IT22IFtYHj6FRkpQRSuNguX0qCdUOtHdNnCSV70lcGUEvIoXWnOsqm3Ge5uAI5gDJx9BDeJ6JVJGBqyDUAru7dTBa72KOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYIvPDRv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYIvPDRv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712D31F000E9;
	Sun, 16 Aug 2026 07:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786866676;
	bh=qVwaIODOGKMU+rvdGXqKyOT3YXDBZCehoFa22lEx/xI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYIvPDRv4UvTQs7vRRzBcHoUUDGSFnVvNTvslMn5Y2lTgk+cVP9NSSv0MyubbPJDh
	 Q15UgafBWrWykX+8hX9x5lqX4TIICyQA6TnHOOv8f1A+Uog0eLhGNXaSGN6nep1AnK
	 Uo89UMJAvuwvTsQ9FemyUU2Y/dej1cxH5omNQEnbuNAO+xQOYqdHNPEY5KyW/WeSGy
	 X8SHfLnTactyN/2i3fJ5CQYVTy+MwSqnuiavjhvXmy4Zbsg8AiJvnnrobBnCz/ATp3
	 wDFNFtQvqwupy6421hpxXf1Zczd0IcL276D4G9oVpDPbejNT++/tn3IUV01RIUI509
	 /mqHDryAGiKRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: fix IMSIC guest parameters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guo Ren" <guoren@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260816074125.2105828-1-guoren@kernel.org>
References: <20260816074125.2105828-1-guoren@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 07:51:15 +0000
Message-Id: <20260816075116.712D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Reducing `riscv,guest-index-bits` to `<3>` incorrectly caps guest =
interrupt files and catastrophically breaks the physical MMIO layout for se=
condary CPUs.
--

--- Patch [1]: [PATCH] riscv: dts: spacemit: k3: fix IMSIC guest parameters=
 ---
commit bd339af20fe829df6f685236a32dbabad41e337c
Author: GUO Ren (XuanTie) <guoren@kernel.org>

riscv: dts: spacemit: k3: fix IMSIC guest parameters

This commit updates the K3 device tree IMSIC guest configurations based on
the SpacemiT K3 User Manual. It lowers guest-index-bits and num-guest-ids
for simsic, and removes them entirely for mimsic.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index c3f2dce0969c0..6dce1e3aa2c91 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi

[ ... ]

> @@ -1246,9 +1246,9 @@ simsic: interrupt-controller@e0400000 {
>  					      <&cpu4_intc 9>, <&cpu5_intc 9>,
>  					      <&cpu6_intc 9>, <&cpu7_intc 9>;
>  			msi-controller;
> -			riscv,guest-index-bits =3D <6>;
> +			riscv,guest-index-bits =3D <3>;

[Severity: High]
Will reducing riscv,guest-index-bits to 3 break the physical MMIO layout
for secondary CPUs and incorrectly cap the guest interrupt files?

The IMSIC irqchip driver uses riscv,guest-index-bits to determine the
physical MMIO stride between HARTs (stride =3D BIT(guest-index-bits) * 4096=
).
By reducing this from 6 to 3, the calculated stride drops from 256 KB to
32 KB.

With a 32 KB stride, CPU 1's supervisor IMSIC file is incorrectly calculated
to be at base + 32 KB. This offset actually hits CPU 0's 8th guest interrupt
file instead of CPU 1's true supervisor file (at 256 KB).

Additionally, the AIA spec states guest files are indexed 1 to GEILEN. With
GEILEN=3D8, representing index 8 requires at least 4 bits. Setting
guest-index-bits =3D 3 mathematically limits the maximum addressable index =
to
7 (BIT(3) - 1), truncating the 8th guest file.

The commit message mentions that KVM will dynamically correct this via
hgeie, but KVM reads nr_guest_files directly from the irqchip driver, which
enforces the BIT(guest-index-bits) - 1 limit. Is it possible this change
will cause MSIs and IPIs for secondary CPUs to fail?

>  			riscv,hart-index-bits =3D <4>;
> -			riscv,num-guest-ids =3D <511>;
> +			riscv,num-guest-ids =3D <63>;
>  			riscv,num-ids =3D <511>;
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816074125.2105=
828-1-guoren@kernel.org?part=3D1
