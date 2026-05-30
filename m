Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52C3AE18D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780163804; cv=none; b=UhSZVeRDesXb78nX/R2M7hn+GUQc1whbHm70/NpaUP0hu0+fQ+mJP7kEu3StcFeryWbpVu/ON8kxSx7PVFgF3MscHrOHDW40YsmAZvwUH/YAiqwrK6fzezH+1TxE+grc9fKUQS3MzJok8Jigz/9zye1kFUgznLBy3OCMZpyNQuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780163804; c=relaxed/simple;
	bh=MobSg2E0kspVHEqWNlF715o2+XY5X0ih2aBMAQRjy54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JQyCxfgjR1PT43tqZs/kph33s3WzPz0G9b+93BRvik1rpHA5FLZzWO0GqwllH5/81kmJFN6gNV3FbmnYFnuRFVmmjh3HQfZ2GmCCe2pjIWkMSgUSapxyyxGCoagPFn9RLdC/aZqFaD3rsLroqZFIhwL960Eo7ceiFgaW7zdf1kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEIfecs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEIfecs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFC41F00898;
	Sat, 30 May 2026 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780163803;
	bh=GbULqt59L7rbPovftjFEznDbz39BwPeWzva1fKlpzXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oEIfecs7JJ1u5SvXIFv5db0j0z47whiMRlZ4ku/cWzsYjcDAaAmJgr+b1YwSNHe0i
	 gfePwkdh7vQ2j7SaA3oUA5F9HUZ3iq+tFVC8Jrxnv5TTH6Y+0KZHdvvQyke+YHc4IX
	 TAeXa5cCV6hdcUs/Ec00/XRPoJ3iVRFF9us6rlkDYpzOdGbDUAaevATFhgvJFDvkW1
	 a3PdbVxwloYb2eriBNWuXVokZqySl1Om08INWqE/mJv/82wj7kS4mQOujqKQaMk4rI
	 A6JMS+M79Rf9MT+u/2cQZRYRHyTbhoP2peu7DvX12XDJuJm4u08OTUH6T9/HjUdo4h
	 +qQnx0YElwe0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 RESEND 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Milas" <josh.milas@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530173347.33533-5-josh.milas@gmail.com>
References: <20260530173347.33533-5-josh.milas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 17:56:43 +0000
Message-Id: <20260530175643.8FFC41F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect memory size specification for SG2000 SoC (256 MiB inst=
ead of 512 MiB).
--

commit c5b4a9fd5a4e96c34400baa5e56b2ce675d91e7b
Author: Joshua Milas <josh.milas@gmail.com>

riscv64: dts: sophgo: add SG2000 dtsi

This commit introduces the device tree source include file for the Sophgo
SG2000 SoC for the RISC-V architecture.

> diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts=
/sophgo/sg2000.dtsi
> index 0000000000000..412adacc00576
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
[ ... ]
> +/ {
> +	compatible =3D "sophgo,sg2000";
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x10000000>;

[Severity: Medium]
Should this memory capacity be 512 MiB instead of 256 MiB? The SG2000 SoC
is a System-in-Package that integrates 512 MiB of DRAM, and the ARM64 device
tree for the same SoC specifies 0x20000000.=20

Setting this to 0x10000000 restricts the available RAM to 256 MiB unless it
is explicitly overridden by a bootloader.

> +	};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530173347.3353=
3-1-josh.milas@gmail.com?part=3D4
