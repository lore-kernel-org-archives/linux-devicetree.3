Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0CE2E7374
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843261; cv=none; b=is8XRPVTUCX4Yb8Dt5XmQ9lfZtjiQPFsNouvT6M/onvE05S1IqVMBAskcbc93PEU7jd49QFRjresls+qpNooG2oVC9yq4/cvRmgKLjhc46qMXflpE0FaYxFDMUPj2OTJDGGcyM7sjW8ZKJj6+iOhWaWOwFarww2pIrj+te/gegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843261; c=relaxed/simple;
	bh=OUUNQfaOmgNCKOlitYwUJKpII0ZpniRgkTu5PNFcMF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AFfMHVUj0qe3kZZ4Gbpd+gSiHCOZpaYhZgS3s9J1bdwEdMEgUTigj8NiaJ+uAJyTa6b609mR3VvwDRuxYgRb8VLgSPABhZSbDjan08RsM8jjO2ZwVsXCNeWZI3StrJ1yNJL45b4xeMe6sLAnxUJHNhCmllzfslxzSwTSaTGFSms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEJzkMGj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEJzkMGj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF11F1F000E9;
	Tue,  4 Aug 2026 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785843260;
	bh=bWB7xHGsW5uM29vnX+zBrMJjI8/vQSjsIYvAFyEFE8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oEJzkMGjlA0IY7jBvGhj6NhDIoNNeqSSrbHw2S3Tlr6gRpu9/96QzmXK6yl22X8K9
	 iP8wCrrRO4P/YDTixxD/wGtIt3zKBw1wAtQKLgiJN8gv1iQ7MPuth1Nh5DyhOVbM0E
	 fg4qVFDdC8t9cFSYJZxDsM86yJGZfot5J0XpmwrIBZauDrgSYwZGun0JbO1IN1gkMH
	 mCw+m8ExyglYFr72bnrHyB4b7cPGgYBZUODGfHqJ3lqPz4o3xTiU3EOBYAexQ1Eia1
	 m4GLfQCx9nasQAwJ2f7N/2+h/AIyqisxtjjGeTBYRLPMN1sorW2LGyZKv5u81+YyEl
	 xR4mBnY21AehQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] riscv: dts: eswin: add watchdog support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804104431.1391839-9-pinkesh.vaghela@einfochips.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
 <20260804104431.1391839-9-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:34:19 +0000
Message-Id: <20260804113419.EF11F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect timer reference clock mapping for watchdog nodes
--

--- Patch [8]: [PATCH v3 8/8] riscv: dts: eswin: add watchdog support ---
commit bfe09d553ee566b62eb6947526013fd32a57d405
Author: Pritesh Patel <pritesh.patel@einfochips.com>

riscv: dts: eswin: add watchdog support

This commit adds watchdog nodes for the ESWIN EIC7700 SoC and enables
them for the HiFive Premier P550 board.

[ ... ]

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index c13432d145042..f873e9eeb9290 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -265,6 +265,46 @@ syscon: syscon@50440000 {
>  			};
>  		};
> =20
> +		wdt0: watchdog@50800000 {
> +			compatible =3D "snps,dw-wdt";
> +			reg =3D <0x0 0x50800000 0x0 0x4000>;
> +			interrupts =3D <87>;
> +			clocks =3D <&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
> +			clock-names =3D "tclk";

[Severity: High]
Will this cause the watchdog to calculate timeouts incorrectly or freeze
entirely?

The snps,dw-wdt driver uses the clock named tclk to determine the frequency
for timeout calculations. Here it is mapped to the APB interface clock
(EIC7700_CLK_GATE_LSP_WDT0_PCLK).

Since the ESWIN EIC7700 clock driver defines a separate watchdog reference
clock (EIC7700_CLK_GATE_NOC_WDREF), providing the faster APB clock frequency
to the driver might cause it to calculate extremely large tick counts. This
would result in physical timeouts taking much longer than requested.

Additionally, if EIC7700_CLK_GATE_NOC_WDREF is not referenced here, could
the common clock framework's clk_disable_unused late initcall gate it and
completely freeze the watchdog counter?

This same clock mapping pattern appears in the wdt1, wdt2, and wdt3 nodes
introduced below.

> +			resets =3D <&reset EIC7700_RESET_WDT0>;
> +			status =3D "disabled";
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804104431.1391=
839-1-pinkesh.vaghela@einfochips.com?part=3D8
