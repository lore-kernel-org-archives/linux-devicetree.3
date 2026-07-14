Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421038E8BF
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034179; cv=none; b=OO0T/S+U1Gh+nwWUs9BsgvdBzxaHLC5hJfUX3lrxi1qOL9fMVqvlQCVjev3Q6S4sbKIZT8MhFh1KmZnUL27MaBc2EWL/lFMpEwaqg12LGIluTrgOIbAjduJBxy05kGET8Zl3BgNvkdG6CcglhlvdaKnADJvo5M3ec5MuZQQ5gVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034179; c=relaxed/simple;
	bh=49EJy2I245R3oL6qxS0jUWJITX8DdSiR/8f2KDrNZ0A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GlrnguP5dveq07DiuljCPdXU9edDcRuK+EU37EWeMK4ycXJ7a+DBl+kLxbPMSImS9+9IgEjaC/I96sJSrDBV2y9ZEytaFV71JjM0RhZ1wm7vx3wt8cPZpctEphCovMSjY9dNm0+z3vtK84jwLW7wGf2mtMR6eN/EuvZSeSRI+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=UGk5ycZi; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="UGk5ycZi"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1784034169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0CMiWuHZ0uwm0W5eVDnOsKsl7y91gjDTzq0HQxMpSw=;
	b=UGk5ycZi1gfvOCT3UYL7c1WC1wB5w04XvTi36jPTzKWnDmqncgcsA0Baaq7pBkFacjCD9o
	p56kVwP7VJNwgCGHVKqg5uuq5lVXijoK4hTbsalenG1YQEtYQ7q/syDu5Qti5dZQ1Qh9d5
	n1J9wVnTWbLui4anE7KKF3ui+JSTU4+Ya+j09Rcb0e22mo2k9nS6lBiKxrZ+vV7opL+GMd
	UeSHTMPWzvThCfw1S6SWvynCCCZgymG6bdMmBJt7tzA+lUQSVkUgGMVxkBrQKj2HhoNLuc
	bH1CHjVIKeoT5NvEfuXuMLf3HF8brggE4kDqiOPSdAVTXXHI8kgP+YU1uRsjuA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 15:02:45 +0200
Message-Id: <DJYBBXE6SAG2.20OEJI5K6JIVM@cknow-tech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <diederik@cknow-tech.com>,
 <jonas@kwiboo.se>
Subject: Re: [PATCH v3 03/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing pcie rst pinctrl
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713-nanopi-m6-v3-3-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-3-227567ffc5dc@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Joachim,

On Mon Jul 13, 2026 at 10:30 PM CEST, Joachim Eastwood via B4 Relay wrote:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
>
> The pins are used as reset-gpios but not reserved through pinctrl.
>
> Fixes: f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files used as par=
ents to dtsi files")
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> index 67e284a15c35..8df6e1a21180 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> @@ -360,12 +360,16 @@ rgmii_phy1: ethernet-phy@1 {
>  };
> =20
>  &pcie2x1l1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_1_rst>;
>  	reset-gpios =3D <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
>  	vpcie3v3-supply =3D <&vcc_3v3_pcie20>;
>  	status =3D "okay";
>  };
> =20
>  &pcie2x1l2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_2_rst>;
>  	reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
>  	vpcie3v3-supply =3D <&vcc_3v3_pcie20>;
>  	status =3D "okay";
> @@ -420,6 +424,16 @@ rtc_int: rtc-int {
>  		};
>  	};
> =20
> +	pcie {
> +		pcie2_1_rst: pcie2-1-rst {

``pcie20x1_1_perstn_m2`` to match the schematic name?

> +			rockchip,pins =3D <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		pcie2_2_rst: pcie2-2-rst {

And ``pcie20x1_2_perstn_m0`` here?

Cheers,
  Diederik

> +			rockchip,pins =3D <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	sdmmc {
>  		sdmmc_det_pin: sdmmc-det-pin {
>  			rockchip,pins =3D <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;

