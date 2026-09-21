Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFE4BD348
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003760; cv=none; b=GQS3YZmZpEh/OYfoyRdOC+vI282I/hc+UvSqOsC55fOQQlj/UOPDzdgM4WfZJ3NOUysxDn9WVZcby5ZbT2Dq0b4T+oe77z0OqTQApwsnFKLPI4hp/qwuJDoctsDrUz9mu2r7poE8ScLb6B6mnNhOHvgdoovM+eU77G76zL4R/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003760; c=relaxed/simple;
	bh=bfzOEXaWcl7aJ/gD7I3edOuSSJvgDZHj2ulBtif/AMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CHT6S8XUEldM/bTS5Lgq7LiaPLLb8w4uhUh+YKjTzqZGtuyW3k48G2yBpqMLWjH0qH4KZd2l90J31P7LAj9gC0xfCxs5+LIlEbFTk+OXmO8oQHso7Uy+esh6/65a/d88hLmrnfMNIeyKJEXBAmbvQbuLzIIrwWX7pY3EqfT4sWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLqbepcX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLqbepcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B351F00893;
	Mon, 21 Sep 2026 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003759;
	bh=IvVrKT/XddcK5v/YkbCBcrKrESVpUuEUPJugrQvk/QI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RLqbepcXOALiZ3qHT9V65eGXb8hcCoVbdB0iRgACJDfwPNSNf1kfTjtn95T1SK0VB
	 A4lvgp7DCgMTshdaxqpMdp5lgBqbADPP+jFqX9+WHuUOKY5pJyytXTJRXw7W8ekYl8
	 6gV6qgG7KP4aAfxrki3CPhRyaLm+Fml3hYmuUaIo5uEgJPB1GywJ9MEPzmoDhuFGKr
	 9Yk67Nl9N3+3MJZ2PnRc7JTgcu/sFNTHv9hFOJ93agXkIyxCFmd1vT9nNxJnQ8t/3P
	 F07Ug6h9PQBUSCQco3n0RBeSG6R3+aeT+rHpUHgw6fv49PVFH0vPFOPN5NQAMGI15b
	 brVTPvY5sve4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop
 reserved memory node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Lalaev" <andrey.lalaev@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-2-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
 <20260921-sophgo-remove-coprocessor-node-v1-2-ace29446b327@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 15:15:58 +0000
Message-Id: <20260921151558.D9B351F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dts: ABI breakage by dropping coprocessor reserved-memory node
--

commit fa1a6e529f0f63c13f25ecb8772efefbd481942e
Author: Andrei Lalaev <andrey.lalaev@gmail.com>

riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node

This commit drops the reserved-memory node for the coprocessor from the
sg2002-milkv-duo256m device tree. The change is based on the premise that
the current FSBL handles this dynamically at runtime.

> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/r=
iscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> index a2797c0bd7671..d4e86c15664e6 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -36,17 +36,6 @@ led-0 {
>  			linux,default-trigger =3D "heartbeat";
>  		};
>  	};
> -
> -	reserved-memory {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
> -		ranges;
> -
> -		coprocessor_rtos: region@8fe00000 {
> -			reg =3D <0x8fe00000 0x200000>;
> -			no-map;
> -		};
> -	};

[Severity: Critical]
Does removing this static fallback node introduce a regression for systems
using an older bootloader?

While newer FSBLs might dynamically inject or update the reserved-memory
node, older FSBLs rely on this static reservation in the device tree. Witho=
ut
the no-map property for 0x8fe00000, will the kernel treat the 2MB coprocess=
or
region as general-purpose RAM, since it falls within the standard memory
space?

This could lead to memory corruption if Linux and the active coprocessor
overwrite each other's memory when users upgrade their kernel and device
tree without also upgrading their bootloader, breaking the standard backward
compatibility contract.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-sophgo-rem=
ove-coprocessor-node-v1-0-ace29446b327@gmail.com?part=3D2
