Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A8A175A92
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777717795; cv=none; b=m+xKElWGHY98dpgRXkp40cgBad9hBWVuIAfJysadYvu9q85tE1f7C2rQ0dfryZBjP70UEuUaaZO5kop6smiaIg5ta0szG05L3eOLfimCPxKZHQuhICwr6kNuD0YqSg8kgAxeStDixwbWhwpPbFZjaSHEdmHNbeGxrwU/LlVzoSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777717795; c=relaxed/simple;
	bh=w5CBLuMm/q3LOwcBHnSU22N/tz69POKWOgCD+CGfHw8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jYP5Sxt5/rDdKueEITjta6Yt+K1vFDWkV6jOwV56Od8qyu83rG/NeA94W85ftu16/s96lu62yt38ge+jKO5qGr3I/mKSm3t5PS+3epKZWApThMGSMC/PTLgeUD03WYdQSkP4bkAuM9cgEyn9TYWAO/CS8VrplQ0CVkLplm66rK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=TvAbHW2v; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="TvAbHW2v"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1777717788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKC3PTkwWrrt7PYEQQ0B4ZjpL8QByGd23QV939tztOg=;
	b=TvAbHW2veUJcqZme81cx/GGP21R4PHW48Vdw9zFZVYz7lCULM0oYq8uZZ7Ra4+LV09brVr
	fAxK4DBv+MX5wbEMbSxiS1cjcjoSfHRiR08qh468IM4CjCYgwY84JKB6OfstJ7+gqrnE2k
	pD3knfHjk5ly0w8/ukaBdUTNmJ7gGf94gnpXEUNl3fov/xCCdWABF2f1J9p9I+d68sTFI6
	Ip1ZA7X45ylF88PIs+mnGL1GDFTGMIWXjakszAleSQpi1J5R6xmeKp+XXkXRyd4cWUeArB
	9RmD0PbQyU6MB6OKBhx6SbGUUbRNFWCqc7Ev8l5DNhOcI6Z00JdNGehMPsnTPA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 May 2026 12:29:40 +0200
Message-Id: <DI84CXWVJPXB.1OG0PYJ5L31TX@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nick@khadas.com>
Subject: Re: [PATCH v2 2/7] arm64: dts: rockchip: Add HYM8563 RTC for Khadas
 Edge 2L
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Gray Huang" <gray.huang@wesion.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <heiko@sntech.de>
References: <20260429063712.2150938-1-gray.huang@wesion.com>
 <20260429063712.2150938-3-gray.huang@wesion.com>
In-Reply-To: <20260429063712.2150938-3-gray.huang@wesion.com>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 29, 2026 at 8:37 AM CEST, Gray Huang wrote:
> The Khadas Edge 2L uses an on-board HYM8563 RTC connected to
> I2C2. Enable it and expose its 32.768kHz clock output so later
> board-level patches can reference it as the LPO clock source for
> the AP6275P wireless module.
>
> Mark the RTC as a wakeup source as well.
>
> Signed-off-by: Gray Huang <gray.huang@wesion.com>
> ---
>  .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts     | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> index 5781deae00d9..c85b219fe409 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> @@ -46,8 +46,6 @@ vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
>  		regulator-max-microvolt =3D <2000000>;
>  		vin-supply =3D <&vcc_sys>;
>  	};
> -
> -
>  };

You're removing unneeded empty lines (good), but you introduced them in
patch 1 of this series ... thus fix patch 1? That also means you're no
longer adding an unrelated change in this patch.

Cheers,
  Diederik
 =20
>  &cpu_l0 {
> @@ -431,6 +429,17 @@ regulator-state-mem {
>  	};
>  };
> =20
> +&i2c2 {
> +	status =3D "okay";
> +
> +	hym8563: hym8563@51 {
> +		compatible =3D "haoyu,hym8563";
> +		reg =3D <0x51>;
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "hym8563";
> +		wakeup-source;
> +	};
> +};
> =20
>  &sdhci {
>  	bus-width =3D <8>;

