Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC8D3B42C7
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370481; cv=none; b=mZSmMXYqxuDYHbhXdNbI4e3O49wBMMoTDpW2w4JL5+ArNQwhvlKLjyReVvxhuMaQGgisSAZ1bptHz36fyxYxPk1FR4v40bX4DMw9vIJlo5+476dhWTaiBH20nMhAdMMMaxPbbtlfp1yuN+e4II091r0zM0OEmJCIHu+fktBM/5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370481; c=relaxed/simple;
	bh=BYArAMB3zhgYj4wbOyAQUfqJeIZMloggfSS6CrsLBpA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pJJKY1rjv3WvsxGo3ETCk+3jcCYOr4dkQVWoA/6yQi45I8fGdR0vzs7aRhlUOF9DAA+XboeRSNxRgIVsJO+3IBzF7xq1IBzg9PqpK+pBIHL+FAMW0LPf1JcHCndRZrB6kfo9Mi7iK2qQH91MkW/pHlkUmNa4d6hqgodTiVseqM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xp2b/zDS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xp2b/zDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE4F1F00893;
	Mon, 14 Sep 2026 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789370475;
	bh=HJBBbYRowQIYT3O4jdPUnCWs8LD79LrkZBlQBAS+uQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xp2b/zDSPffD5DdmRXLK6kOcafilAZGXsI9hcY2u3WszohwpX/TQHfJRJqq+sxnMn
	 GSVL+JzNVQFlzdmCkf5iNeFw3uWju7C6dCpFu2YsuTWuP0OiInlZJzKV/rxkVkoAN/
	 DezbyjjNMOpEd5TL3sgB/3dyt/qxyZuYnJkhgo809e921u449+h8g+6bErVElPli/G
	 ZT7GXOwb2h0zSIWk56+7mh73xMd3CADEUxKJbTFBqw/Tky+7R25ZjgyNubSOz5tSEF
	 p5hbsqZmqzsL1slqc1RJM2Bqs5RuvsZwAw5hBr7NmdcizJi4FPbSTN905nT0FZgG+T
	 PQJixGdNqY9Qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: st: add dcmi node on stm32mp23x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-stm32mp2x-dcmi-v1-2-c594e081d21b@foss.st.com>
References: <20260914-stm32mp2x-dcmi-v1-0-c594e081d21b@foss.st.com>
 <20260914-stm32mp2x-dcmi-v1-2-c594e081d21b@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 07:21:14 +0000
Message-Id: <20260914072115.5CE4F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing unconditionally required 'port' property in the newly added=
 'dcmi' node, causing a dtbs_check warning.
--

commit 42a2863a4d17c3ffce4549b0b100b843b4aeb937
Author: Alain Volmat <alain.volmat@foss.st.com>

arm64: dts: st: add dcmi node on stm32mp23x

This commit adds the devicetree node for the DCMI controller in the
stm32mp231.dtsi include file.

> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts=
/st/stm32mp231.dtsi
> index 0feb8943efae6..ad008049384b7 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -646,6 +646,20 @@ uart7: serial@40370000 {
>  				status =3D "disabled";
>  			};
> =20
> +			dcmi: dcmi@404a0000 {
> +				compatible =3D "st,stm32-dcmi";
> +				reg =3D <0x404a0000 0x400>;
> +				interrupts =3D <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> +				resets =3D <&rcc CCI_R>;
> +				clocks =3D <&rcc CK_BUS_CCI>;
> +				clock-names =3D "mclk";
> +				dmas =3D <&hpdma 137 0x60 0x00003012>;
> +				dma-names =3D "tx";
> +				access-controllers =3D <&rifsc 88>;
> +				power-domains =3D <&cluster_pd>;
> +				status =3D "disabled";
> +			};

[Severity: Low]
Does this node need a 'port' property to satisfy the st,stm32-dcmi.yaml
dt-binding?

While the driver safely handles a missing endpoint in dcmi_probe() by
returning -ENODEV:

drivers/media/platform/st/stm32/stm32-dcmi.c:dcmi_probe() {
	...
	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
	if (!np) {
		dev_err(&pdev->dev, "Could not find the endpoint\n");
		return -ENODEV;
	}
	...
}

the binding schema unconditionally requires the port property, which will
trigger a dtbs_check warning when omitted.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-stm32mp2x-=
dcmi-v1-0-c594e081d21b@foss.st.com?part=3D2
