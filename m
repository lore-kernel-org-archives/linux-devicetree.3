Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB037FF6A
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642284; cv=none; b=Igh9BBXBAPjaSY/gJOCpQ9r7kBnrlOJEkiUGrDrlTPnGc42fl7H9dozj95cV/wQOGx9s7oXc1Ifsm2pS+osxSdMxQxBFet487hBgXRE0SpKcXH86PVHP9KZEm9TYgqvPVLY9jNRaxOImcaQFvc72snwa5cRSxQ8LU9NAP5yNUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642284; c=relaxed/simple;
	bh=bYlthkB+78Pe+c8JN+EI74s+IPHgvZOz7V0ZvrfdWaM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eGOql/+LcOIi0+C1YVCNYmtVci99BJlOeuNhpkSjU9h0wQDK+kMLv3tv9Hwsm+AUR3Ff5TqmszRFcMu+Bu3NuH+iz/HiD99WMh5pbAo9CDrVkECzyzCF9OA0nZ1Kzii+ZmOYoMexY4PNacH+vL5H2G4e6VulkCNnInj3475i75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LftzJUvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LftzJUvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911C71F000E9;
	Tue, 16 Jun 2026 20:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781642282;
	bh=nhtflGcQ1nNomOmdOC7hKpibiUjInzqrHMJuq38UGco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LftzJUvLT5Q36XPakmCFH107i+nPniaKR/MkklXk9evqpgAxaCAD9O/IeHRfSh8YH
	 N0Yht7vfSOiIiGxhUVusfz9BMqVNP2j24ZTj1WG0yYkJGvKx+WFUyzSyuAX2tLJwBS
	 fFYnnRJ1sAeHatVIoHCXpDxr5THbonIhXCE5j5PCZ5O6+WKrB+dKRZx4Fdi2ibAVen
	 LuJfVOu6smgK/OKPs8AXlHtsjgi6Q5KRZHAfNqaCu/XTow8gW3iAJC1qMWZOPDxm52
	 9Z9mvxRM7bvAyJ4kiicKNcJj+9w2GTvnDfZ9O4rTT1KV4rnOk5n2eKA9jOMjUiY3f3
	 6Ryu0VbhEw8Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 11/12] ARM: dts: zte: Declare zx297520v3 clock
 device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-zx29clk-v4-11-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-11-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 20:38:02 +0000
Message-Id: <20260616203802.911C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `interrupts` property for the `uart2` device node was unintent=
ionally deleted during the clock updates.
--

commit 59fdf05791fcf663705de912314c4a81bdabedae
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

ARM: dts: zte: Declare zx297520v3 clock device nodes

This commit introduces clock device nodes for zx297520v3, wires up the UART
clocks and resets, and replaces the placeholder uartclk node.

> diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zt=
e/zx297520v3.dtsi
> index a16c30a164bb9..a2b6909e7434d 100644
> --- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
> +++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi

[ ... ]

> @@ -94,9 +166,9 @@ uart2: serial@140d000 {
>  			compatible =3D "arm,pl011", "arm,primecell";
>  			arm,primecell-periphid =3D <0x0018c011>;
>  			reg =3D <0x0140d000 0x1000>;
> -			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&uartclk>, <&uartclk>;
> +			clocks =3D <&lspclk ZX297520V3_UART2_WCLK>, <&lspclk ZX297520V3_UART2=
_PCLK>;

[Severity: High]
Was the interrupts property unintentionally deleted here during the clock
updates for the uart2 node?

The PL011 UART driver requires the interrupts property per its device tree
schema binding to handle rx/tx operations. Removing this property breaks
device tree validation and prevents hardware interrupt assignment for uart2.
This could cause the driver to fail during probing or completely break
interrupt-driven serial communication, rendering uart2 unusable.

>  			clock-names =3D "uartclk", "apb_pclk";
> +			resets =3D <&lspclk ZX297520V3_UART2_RESET>;
>  			status =3D "disabled";
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-zx29clk-v4=
-0-ca994bd22e9d@gmail.com?part=3D11
