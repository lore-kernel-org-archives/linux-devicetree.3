Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2FF4657C4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515579; cv=none; b=saHHKza7mI4kKTS/I5OWVJ9sAv5+jRV+BwRB67A5pGJTcU16TqiPvCpiL4G6/fNyK+pBwZ0wfJVP/oFaqs4gyVW75Tos0/djR522MQf4TTqpDTH/7YyJ+cSVg3JZFp8sfB3Mxy53F5g3lgTo3fq/5rpb190iL56stulgplXsP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515579; c=relaxed/simple;
	bh=cvqYhYnXXEQoboO0Ocq29k/BhX5X44SyjDDeciQY8lI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oP4Lc5IB7YNSAjjnDBv8P7sD/yVEOZpyM3+YQSB1M+5IGLpXoid4FTq/XVqNIx1PRy8q3rsIMTy0hkaSAbBkULcfqiPmwq2ts03slHFJNLz3XAhECOh7GGFuLcrBmd3seKEun2yEaPAIcfH9W8o+BtOorKH1IxSHhst724svaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2RnwX+p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2RnwX+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC651F000E9;
	Wed,  8 Jul 2026 12:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783515578;
	bh=v53hsJE6JBpbf12RNy18nOj0XAfLdlhflf4sWeCndiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2RnwX+pOKrwhzYHnzt0plaoLGQE7KZn8KjsdsCIpRxA2pT+OWtmBf0O1HYEhFHKf
	 Ly0b/2pXMFsPp7W/hhz/x8SqHZtJ5g6qh7qla3qmbRwETKHA9ARpcPy6Dud3KQh44g
	 Q3XHuGk1rWCs6kcA7PcEol763jtErYZpY68fiNgFxKjyI7aG1b3bBG1mdeziGShCCe
	 1NWDGEn1XRDA73Ng7GishZPVHvTor587SUhVALJUh0iXevnx6zeo/pkkPMTNRqteHd
	 ERzkcY1grbv8utD9pp5Vh56s3BkWMvL0pG5tLD7VgXcrjLD4GIcurC9y4B5GZXFuJv
	 kM5D4ioEEG1Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and
 PECI nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomer Maimon" <tmaimon77@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708125352.1915040-3-tmaimon77@gmail.com>
References: <20260708125352.1915040-1-tmaimon77@gmail.com>
 <20260708125352.1915040-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 12:59:37 +0000
Message-Id: <20260708125937.EEC651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch duplicates the `timer0` node instead of moving it, result=
ing in a duplicate node and label definition that will cause a Device Tree =
Compiler (DTC) error.
--

--- Patch [2]: [PATCH v7 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 =
and PECI nodes ---
commit 1450734310ae6f4872b7fb3d37cc7db1efd0ebca
Author: Tomer Maimon <tmaimon77@gmail.com>

arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/ar=
ch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> @@ -59,15 +59,6 @@ apb {
>  			ranges =3D <0x0 0x0 0xf0000000 0x00300000>,
>  				<0xfff00000 0x0 0xfff00000 0x00016000>;
> =20
> -			peci: peci-controller@100000 {
> -				compatible =3D "nuvoton,npcm845-peci";
> -				reg =3D <0x100000 0x1000>;
> -				interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks =3D <&clk NPCM8XX_CLK_APB3>;
> -				cmd-timeout-ms =3D <1000>;
> -				status =3D "disabled";
> -			};
> -
>  			timer0: timer@8000 {
>  				compatible =3D "nuvoton,npcm845-timer";
>  				interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;

[ ... ]

> @@ -138,6 +129,13 @@ serial6: serial@6000 {
>  				status =3D "disabled";
>  			};
> =20
> +			timer0: timer@8000 {
> +				compatible =3D "nuvoton,npcm845-timer";
> +				interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +				reg =3D <0x8000 0x1C>;
> +				clocks =3D <&refclk>;
> +			};
> +

[Severity: Low]
Will this result in a duplicate node and label definition during dtbs
compilation?

It appears this patch adds timer0 to its new sorted location but misses
removing the original timer0 node from the top of the apb bus. This typical=
ly
causes a duplicate label error from the Device Tree Compiler.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708125352.1915=
040-1-tmaimon77@gmail.com?part=3D2
