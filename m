Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820600;
	b=ypI9ESIjeshLrT4EdlvuMNVSqBzb/pWVGhzhH4mTFnbGPuZsiRZIfVuOr5WlmKrfmVyr
	 P3eVaHrs383RtEdx+OkQnT9gOOHZL4MSpzcQtw6icmV7kOF4vwpYbXmHpHw04KCupbpQy
	 zIevEzXR8zgvSmIKByF2oxV1Y+qk3460QT6b5hS6YdfClLIueoPyxlXPHoBS1Lawdw05A
	 x51ghaWsyprt4OfZUiTUrTbiIxiwA4o6CO+jh56Gp1ZA90V1MV07SOElelo5yg1tyjjB5
	 fDAuqpHRtPfIeCYVyT20alOKd9RlAFkA7ZO4GlpKXqidt3/BcxcOjbIhz0kWwY1myqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820600;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gvGIvCmlhaHK5VTvge++qqXPDRtL1BbEPEiPXK07rUk=;
	b=Zd3UQ0V58aTHo1oHR3ZV6GIXeX4cNgYleJgoxnvFNIpDwFw9iDqsZtAhvpDs5qa5b9IY
	 2rWtBhJVDmmGAj26LN6gvSd2gNu3ESO0ruGgoccCrcXXxOOlmEVZNrizTh21bpt0Ace12
	 FAOE3+KLbIlVPmc5rCUZ1J1/eg+f++rcJRh+xHUuWzsARKs7W7cLPD3UNWbl6LkoJljkD
	 Pef9lmnsRu48lZnzq2zah47/4+iSbcyOfaRb1mudC25+crtm6RZfFaSJOovUjqWEY/E6m
	 Kye1TaiTMvwMjBs55ZEvwYg9IkaVQ+I0+va2r2NRNsEAoW61XLiC1Zzm/KxxW2nbiIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZCuanzq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF9606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZCuanzq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E021F000C5;
	Mon, 16 Nov 2026 09:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794820599;
	bh=gvGIvCmlhaHK5VTvge++qqXPDRtL1BbEPEiPXK07rUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZCuanzqH/XeF5lI7Iy2oS0Xx/TVWfiYngE+Cf7HQF6F7Xz/QsymZL8utfjDtk/Tl
	 CK0qbRMCgl8Bm+V2u5zJqUhB5wuap/vVM64h2Bg8xnMvgf7fUdeWvggYsZXFgjBgJK
	 h3HJ15K1JE6nbKgRXnt38kwquxh5wQw7L7HvNxal/hsCFQMTRb1F24ovCtf4lFaZVZ
	 n0TALyellAy+NueQA5UVToCVgbqmeVCDWw3CXkNzr1AliiIefac30j67mrnMHqp2+7
	 bbMVW/u05AHwfw0Uen9NXxIrYTbaZfosirJSwXkLtMEgkRvMruY84lUkt9PSJ90aHj
	 YQWNgPp9VGL8A==
Message-ID: <sashiko-outbox-216598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] arm64: dts: qcom: Add Motorola Signature
 (vantage)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-molokai-soc-v2-11-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
 <20261116-molokai-soc-v2-11-9dc4dddc4e96@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 09:16:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: vantage simple-framebuffer lacks clocks and
  power domains
- [Low] arm64: dts: qcom: gpio@b800 out of unit-address order in pmic@0
--

commit 06a3bd9d7180afacf80e722fa6af997381342626
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

arm64: dts: qcom: Add Motorola Signature (vantage)

This commit adds the devicetree for the Motorola Signature (vantage)
smartphone based on the Qualcomm Molokai (SM8845) SoC.

> diff --git a/arch/arm64/boot/dts/qcom/molokai-motorola-vantage.dts b/arch=
/arm64/boot/dts/qcom/molokai-motorola-vantage.dts
> new file mode 100644
> index 0000000000000..6d6648b8cddc6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/molokai-motorola-vantage.dts
> @@ -0,0 +1,784 @@

[ ... ]

> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@fc800000 {
> +			compatible =3D "simple-framebuffer";
> +			reg =3D <0x0 0xfc800000 0x0 0x2b00000>;
> +			width =3D <1264>;
> +			height =3D <2780>;
> +			stride =3D <(1264 * 4)>;
> +			format =3D "a8r8g8b8";
> +		};
> +	};

[Severity: Medium]
Does framebuffer0 need clocks and power-domains properties (or dispcc
disabled) to keep the bootloader-initialized display pipeline running?

In kaanapali.dtsi, gcc and dispcc are enabled by default while mdss is
disabled.  Without a consumer claiming GCC_DISP_HF_AXI_CLK, the dispcc
MDSS clocks, and DISP_CC_MDSS_CORE_GDSC, clk_disable_unused() and
genpd_power_off_unused() will gate the display clocks and collapse the
MDSS core GDSC during late initcalls, breaking simple-framebuffer
scanout.

[ ... ]

> +&spmi_bus0 {
> +	pmic@0 {
> +		compatible =3D "qcom,pmk8550", "qcom,spmi-pmic";
> +		reg =3D <0x0 SPMI_USID>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		pmk8550_pon: pon@1300 {
> +			compatible =3D "qcom,pmk8350-pon";
> +			reg =3D <0x1300>,
> +			      <0x800>;
> +			reg-names =3D "hlos",
> +				    "pbs";
> +
> +			pon_pwrkey: pwrkey {
> +				compatible =3D "qcom,pmk8350-pwrkey";
> +				interrupts =3D <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
> +				linux,code =3D <KEY_POWER>;
> +			};
> +
> +			pon_resin: resin {
> +				compatible =3D "qcom,pmk8350-resin";
> +				interrupts =3D <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
> +				linux,code =3D <KEY_VOLUMEDOWN>;
> +			};
> +		};
> +
> +		pmk8550_gpios: gpio@b800 {
> +			compatible =3D "qcom,pmk8550-gpio", "qcom,spmi-gpio";
> +			reg =3D <0xb800>;
> +			gpio-controller;
> +			gpio-ranges =3D <&pmk8550_gpios 0 0 6>;
> +			#gpio-cells =3D <2>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +		};
> +
> +		pmk8550_rtc: rtc@6100 {

[Severity: Low]
This isn't a bug, but gpio@b800 is out of ascending unit-address order
within pmic@0 and should be placed after nvram@7100.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-molokai-so=
c-v2-0-9dc4dddc4e96@yahoo.com?part=3D11
