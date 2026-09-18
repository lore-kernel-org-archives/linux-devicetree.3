Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0539A4FE2FB
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744981; cv=none; b=qAjlzKrcV0k9Lkj1oubAIvpEamqrzNHLVeBbFHTYC55MecXymRlVyg3riEW2MdyhhK04uUWExtD4s9RZIaBmJG/+MmDh2mMGUD/XJrayHZ/Le065KJ6RzNsVuPK7dHgjsvKY49AhYHM6g5XeoA28qstnKIuhzJ36laF8rg4fnvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744981; c=relaxed/simple;
	bh=CQpp6Jmln5pMlSZFBlSipZA0MKAlY7BWrQRwvHF/8PE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fu9LtyDcxCoEFL2gLO6++cgQRZ+G7H1m+pn7gLE822W5p4c6rmC2bKgs/zHxQpcVPNVl1VKPmszwW4bs+sfthKBmG1tl+C+9ixHPM1Tqk2UptIjO9Lrnyv1RvcbfLqkQ2sV7dofJMegRvg3/EvweJ+otnZyylEUc5BdtqDCqgyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7UkBCNW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7UkBCNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2221F000FF;
	Fri, 18 Sep 2026 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789744976;
	bh=LYnCFq2gRYtiA+jd6gGRanT6A6uINlsuELa5SEVpHig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I7UkBCNW6cc6OCIzrStiy8FS24yYPf56sWWl1/oKYzR89Y0SP7/yI89Cqkh/ptt/Q
	 goCuc1JOYsnqHTRBbxKT/1dfaeNBMpGpbdSD9UUKIRmDs6f1EN9fVXaQYUpJSNFgdR
	 mTHy6ggfvI2OdK0dvGN/JzNvKpvjS9nyBQqVdh77LAQGJbJ2QUo4oykAT94SbZUJCb
	 c4cLXLBRgCLfmV52rSYhzb8kpJa7ro1AF+Xr7x81TtKaY93pApZCjKYN2B2mbzzAFY
	 GIwR/9OPFKn++ddg0GkuVywyzb6mBt2yI8DX/GpXHxBvE/HPjgimh++mGZIfBvsPqD
	 9DLW/WQWWFBsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: r9a08g046: Enable TSU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918150730.122056-9-biju.das.jz@bp.renesas.com>
References: <20260918150730.122056-1-biju.das.jz@bp.renesas.com>
 <20260918150730.122056-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 15:22:55 +0000
Message-Id: <20260918152256.3C2221F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt: io-channels hardcodes Linux array index instead of hardware =
ID
--

commit 43dcf56f74f46f025839610adda743ab502b8711
Author: Biju Das <biju.das.jz@bp.renesas.com>
arm64: dts: renesas: r9a08g046: Enable TSU

This commit adds cooling cells to the CPU nodes and describes the ADC1 and =
TSU
nodes to enable thermal mitigation. It also sets up a CPU thermal zone with
passive and critical trip points.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index c63a857f0e5b0..a2f6718c0043a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
[ ... ]
> +		adc1: adc@108c0000 {
> +			compatible =3D "renesas,r9a08g046-adc1";
> +			reg =3D <0 0x108c0000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 378 IRQ_TYPE_EDGE_RISING>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_ADC1_ADCLK>,
> +				 <&cpg CPG_MOD R9A08G046_ADC1_PCLK>;
> +			clock-names =3D "adclk", "pclk";
> +			resets =3D <&cpg R9A08G046_ADC1_PRESETN>,
> +				 <&cpg R9A08G046_ADC1_ADRST_N>;
> +			reset-names =3D "presetn", "adrst-n";
> +			power-domains =3D <&cpg>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			#io-channel-cells =3D <1>;
> +
> +			channel@8 {
> +				reg =3D <8>;
> +			};
> +		};
> +
> +		tsu: thermal@108d0000 {
> +			compatible =3D "renesas,r9a08g046-tsu";
> +			reg =3D <0 0x108d0000 0 0x10000>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
> +			resets =3D <&cpg R9A08G046_TSU_PRESETN>;
> +			power-domains =3D <&cpg>;
> +			#thermal-sensor-cells =3D <0>;
> +			io-channels =3D <&adc1 0>;
> +			io-channel-names =3D "tsu";

[Severity: Medium]
Does this hardcode an internal Linux array index (0) instead of the actual
hardware channel ID (8)?

Since channel@8 is the only defined channel in the adc1 node, it currently
sits at index 0 in the driver's array, which masks the issue.

If a future device tree update enables another channel (like channel@0),
would the array shift so index 0 points to the wrong physical channel? This
looks like it could cause the CPU to read incorrect thermal data and break
thermal mitigation.

> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918150730.1220=
56-1-biju.das.jz@bp.renesas.com?part=3D8
