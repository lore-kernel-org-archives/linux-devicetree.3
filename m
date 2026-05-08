Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5071363C5B
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284531; cv=none; b=IFaP15pd4jH6wdZf/KHeZ7JQAGgHf0l8kPdJdtTn1l24SaHeSzIQjsg0oQEZuy2Z4vCk/ghiAMPuNbv+Gp/MxJZiMp3PYBqn5+kI2wQeGyK6CRi+Nz5n9Gawsi/ANerLGg7G1vvCHh0XrNTpGJtGJQQ4vk02O8hfhO8BbJ+M07w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284531; c=relaxed/simple;
	bh=PpnBNlSPu+rAb7qB9vZbUr+XD1uAV5eBqXiQtsZ9XtE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VYOhRVoYWHAFQ68H4e6ItQJWpOKqs3M8FdxQoIhlO9ZOaApAHWxba641h4Ue1WQQDfCkaiecXYORI4QUTrgUTTMsu3Yf4WcIACWxiVW/lQRzvYOdcHaWEH1NoXK7NkbOKsmCOvwfahNiBoNd2eg6JJO1o3HfXMpVKQvnKPT+ZYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHJoJgPt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHJoJgPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C052C2BCB0;
	Fri,  8 May 2026 23:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284530;
	bh=PpnBNlSPu+rAb7qB9vZbUr+XD1uAV5eBqXiQtsZ9XtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RHJoJgPtQxXaQ2haIOHfUDdEHvmCjxx3Oa8JV3X+x9yj2t13INs/DkZdwUa7KaynP
	 Xxz6jteNm9we7nighVgnaWb07mYi1SYmDqAaL6UK8qTipWaMYPh4yKztiNRoFWloRo
	 1SvVSmUASOcDOYRF4ehHXgbTp2LVZQkbFwTmJ7ugVKNe/icGbBNYSGNBPVrml556Jk
	 wCJ1zuvNiZus6ObufN7TX9YtJ6Yzrm45SIxhfN5U52PF4H7+g9u+nmHdmG4J51VjrN
	 19dohcd7kpK87aRViWn7CyieC1O4YT9f5zG81+Cx2oAG4lTchbk1CGoy3nDl+AT+Qw
	 qfZm7OfUVXnmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/10] arm64: dts: realtek: Add clock support for
 RTD1625
Reply-To: sashiko@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508111641.3192177-11-eleanor.lin@realtek.com>
References: <20260508111641.3192177-11-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:55:29 +0000
Message-Id: <20260508235530.5C052C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Device tree nodes with a unit-address should be ordered by their ph=
ysical unit-address, but `clock-controller@7088` is incorrectly placed afte=
r `serial@7800`.
- [Low] The fixed-clock node is named `osc`, which uses a deprecated naming=
 format according to the `fixed-clock` bindings.
--

commit a60494898a192c94263b0fcf9833b624f1fce48f
Author: Yu-Chun Lin <eleanor.lin@realtek.com>

arm64: dts: realtek: Add clock support for RTD1625

This commit adds the clock controller nodes and an osc27m fixed clock for
the Realtek RTD1625 SoC to the kent.dtsi device tree.

> diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/=
realtek/kent.dtsi
> index ae006ce244205..4722337a143d8 100644
> --- a/arch/arm64/boot/dts/realtek/kent.dtsi
> +++ b/arch/arm64/boot/dts/realtek/kent.dtsi
> @@ -26,6 +26,15 @@ timer {
>  			     <GIC_PPI  9 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> =20
> +	clocks {
> +		osc27m: osc {

This isn't a bug, but does the node name osc follow the fixed-clock binding=
s?
The fixed-clock schema deprecates generic names like osc and prefers names
matching the clock-([0-9]+|[a-z0-9-]+) pattern, such as clock-27000000.

> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <27000000>;
> +			clock-output-names =3D "osc27m";
> +			#clock-cells =3D <0>;
> +		};
> +	};
> +

[ ... ]

>  			uart0: serial@7800 {
>  				compatible =3D "snps,dw-apb-uart";
>  				reg =3D <0x7800 0x100>;
> @@ -150,6 +167,22 @@ uart0: serial@7800 {
>  				reg-shift =3D <2>;
>  				status =3D "disabled";
>  			};
> +
> +			ic: clock-controller@7088 {

This isn't a bug, but should clock-controller@7088 be placed before
serial@7800? Device tree nodes with unit-addresses are typically sorted in
ascending order by their physical address.

> +				compatible =3D "realtek,rtd1625-iso-clk";
> +				reg =3D <0x7088 0x8>;
> +				clocks =3D <&osc27m>;
> +				#clock-cells =3D <1>;
> +				#reset-cells =3D <1>;
> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508111641.3192=
177-1-eleanor.lin@realtek.com?part=3D10
