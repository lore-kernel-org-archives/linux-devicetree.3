Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C423469F6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670821; cv=none; b=baeacBWUbImJMwqxYS7lCrz49dA2uKPo8nJmH9xu++igdHDXV+yKxky1ka3YMqn3bu5KCTbbbRI6z9cNlrjRT44azZSLvZbw71G+XvdVjux4RHzKgMNzoe6pEQbhvl/pAnRZUCKeUPzvUoBQJ+MYP+EEsGplb2CZV3BIEhYspyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670821; c=relaxed/simple;
	bh=FdPx3VdLTPr31MD09yDhtDlUIk1tD3pJuJxcFSxMbRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RSjUKALXUwi+hLfgt+4UNq8h3JMdGKqWsxB6bCOShAR9sLtKTEVm5/tRzr8QQ0K6b+UORTO8n4MF2nPsNJZKIqMN2WhrnnKwq0G7tJ6QB9m/MNa0kXb2s8o3nigEWywYtvw1CbEmEDhZJcXIeGolLPAXrHxXMrUO3kMQ5Z8HQik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajDNv3p3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajDNv3p3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4CA1F000E9;
	Fri, 10 Jul 2026 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783670819;
	bh=XfjyenfdoQcmATcYU/2DieH0W4HAXuCRb/9JpgURYq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ajDNv3p3FKJ1TlDhw2qDNdP2b1O5r9zCZ0o7s9UVKwlGE/SsZ4pG16CVFLpCryrsY
	 bLdDaYFwy8599NMXz+rS01vh1sronqUYevExt3n42/YBwKdkw5cSVMDON2oTQAGFze
	 Mes3pEwqHisYEm7k9bGQprbhLexl0I3YcZylZEkhg0wOhill8N8g2FmLrrgaAfzgOk
	 Y4Jk4Uhvbwt2+P76xQfN1aAcJUDo24uTt6cBUAUvE3NPbp6X3fIG7uH3g6RoCqhMxa
	 nFPRYqeR6iO6oMy6aK/an/IunUoRj2yvrLKjCKDlmXczbcHTcPedodOJj62eFpDY6K
	 R/YL06u8O43vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Yeh" <chenyou910331@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710075917.159969-3-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-3-chenyou910331@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 08:06:59 +0000
Message-Id: <20260710080659.7B4CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `gpio@5021000` node is inserted out of numerical or=
der with respect to its unit-address.
--

--- Patch [2]: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO cont=
roller ---
commit 141d632bdcf67218645f5def2ac6d6cba75ba5ef
Author: Chen-Yu Yeh <chenyou910331@gmail.com>

riscv: dts: sophgo: cv180x: Add PWR_GPIO controller

This commit adds the PWR_GPIO controller node to the CV180x/CV181x device t=
ree.
The controller is an additional DesignWare APB GPIO controller located in t=
he
always-on power domain.

> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts=
/sophgo/cv180x.dtsi
> index 06b0ce5a2db7a..25ad2bd265d76 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -160,6 +160,24 @@ portd: gpio-controller@0 {
>  			};
>  		};
> =20
> +		gpio4: gpio@5021000 {

[Severity: Low]
This isn't a bug, but should this node be sorted by its unit address?

It appears that gpio@5021000 is placed right before adc@30f0000, which brea=
ks
the standard convention of sorting device tree nodes numerically by their u=
nit
address.

> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0x5021000 0x1000>;

[ ... ]

> +		};
> +
>  		saradc: adc@30f0000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710075917.1599=
69-1-chenyou910331@gmail.com?part=3D2
