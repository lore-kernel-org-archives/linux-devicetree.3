Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A91684BE
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019912; cv=none; b=t6lxg/zw22aEWcjsmq0aib/kJS/uUCkHbc9kkJgQoaD6wzcp0WHKj2te4HmGEUrNpYP9W3C1aGiHYia+qSH5QEH/ri6/2ZD0wwDsf1tMawoJDj0anXcGwXXn+5ut2U69z5Sd20Ke2PZoqEKZflIHe0E4XztQHv0ZwEvRMgMzRRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019912; c=relaxed/simple;
	bh=bsGWIOwCKLVGu6durWuIQyo0VCRU5k53H2rHiAgLhgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VfA8nplh4H23Ktp3W9G4xGBHVT9XJaxDKw9FsAMKFh/QtF9apjW0aofnK3jNRD5R8xeMvkP2x0ZpVw1SfXd/N9s2Um4V6q6Gt7IT+C/l6jf4Pcg+qGXLPydzIUJjwQLSIER1pyBqRjwaBnsy9hp5CiDYIZUhL6O1WB09mrrkzMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3Cy2LXN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3Cy2LXN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529E11F000E9;
	Thu,  6 Aug 2026 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786019910;
	bh=qS659Sktuph0WdwOKM8PpyWrZt7leMouWkFRfingi34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U3Cy2LXNPBY521033/D7sV1h9PZGe0Opvfqzy0a0LKGe2SPbgX9lSP1bALEm7Xseb
	 tfHPiYibCe7bMIAz4UDbk0kaWfm3ZoPW3WKNlx9FOmNIjzkDtRMWFF2Kei97wYiY8M
	 3K4QjjVAMEoj3RvwhpR+DXI2IgpZFSgUVwU0zy5r2ybO9VndT4ZaNpePAPNvmIgqCe
	 c2pvHr3PkvT8a5cMDOcJ4oNy0GDNXTsbc2jvd0j54lLRp93VNcm6Q9a8qHDteHLnP1
	 XdtZiwUxh/pR7T1CkuY/O5UTi9CA/UeYN4aEEqJzzCHgq2VzhlVqIz0reifj6Cnyrl
	 mksdId6aELsdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806122553.182449-6-changhuang.liang@starfivetech.com>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-6-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:38:29 +0000
Message-Id: <20260806123830.529E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Overlapping child address ranges in the `dma-ranges` property of `=
bus_nioc`.
- [Medium] Incorrect variant bitmask for PMU Event ID 34 in `riscv,raw-even=
t-to-mhpmcounters`.
--

--- Patch [5]: [PATCH v3 5/5] riscv: dts: starfive: jhb100: Add JHB100 base=
 DT ---
commit 6747fd56a0417ce034668e51d45ea97227861dc1
Author: Ley Foon Tan <leyfoon.tan@starfivetech.com>

riscv: dts: starfive: jhb100: Add JHB100 base DT

This commit adds the base device tree sources for the StarFive JHB100
SoC and the corresponding EVB-1 board. It introduces support for 4=20
Dubhe-70 cores, along with basic peripherals including PMU, CLINT,
PLIC, and UART.

> diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/d=
ts/starfive/jhb100.dtsi
> new file mode 100644
> index 0000000000000..14ab83ed4482a
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
> @@ -0,0 +1,331 @@

[ ... ]

> +	pmu {
> +		compatible =3D "riscv,pmu";

[ ... ]

> +		riscv,raw-event-to-mhpmcounters =3D
> +			<0x00 0x00 0xFFFFFFFF 0xFFFFFFE0 0x00007FF8>,	/* Event ID 1-31 */
> +			<0x00 0x20 0xFFFFFFFF 0xFFFFFFFE 0x00007FF8>,	/* Event ID 32-33 */
> +			<0x00 0x22 0xFFFFFFFF 0xFFFFFF22 0x00007FF8>;	/* Event ID 34 */

[Severity: Medium]
Is the variant mask 0xFFFFFF22 correct for Event ID 34?

This mask appears to allow several bits (7, 6, 4, 3, 2, and 0) to vary,
which could cause other hardware PMU events to incorrectly match this rule
and route to the counters designated for Event 34.

> +	};

[ ... ]

> +		bus_nioc: bus {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			dma-noncoherent;
> +			dma-ranges =3D <0x4 0x00000000 0x0 0x40000000 0x2 0x0>,
> +				     <0x4 0x00000000 0x4 0x00000000 0x2 0x0>;

[Severity: High]
Does this dma-ranges property incorrectly define overlapping child addresse=
s?

Both entries define the exact same child DMA address space (<0x4 0x00000000>
with a size of <0x2 0x0>).

When parsed, standard OF translation matches the first entry, which entirely
shadows the second entry and could make its parent physical memory range
unreachable for DMA from this bus.

> +			ranges;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806122553.1824=
49-1-changhuang.liang@starfivetech.com?part=3D5
