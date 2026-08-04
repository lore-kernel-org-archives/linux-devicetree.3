Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999A3AAF7C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845599; cv=pass; b=izLZJvGfl9uRFv7QC6N/nGnJce00eG9gHHpBKK3S4OF0a/Cf486pEFWhudJ+p97PAz7gB9IrcGs6kf6HSFuOQAVmmeYmMDc/ugJRSm+roIegldETM5R2+fNGx8qsr4dFIji1IonSsHatcqKPwE7FuYFHM4ZFUo2YeXhRL5FSS6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845599; c=relaxed/simple;
	bh=1jmt5WCmRdYFJEkC9Rif/cfA1XLv5OjEVL2XiuFUUMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O87dnjZ/Zh3wIYd+9c7yAYyip03RWFntFlL1bBLR8mizZ9Bzb2mfePYr4bV9jdJHK6ufaIFidV39L7HHfaWOo+2+Ue7G9QxQSWQCt3TEiBf7k8fT3Sdl29pNmmunm5xOk6vFZ/tv+GTftL84HiSfVdNVhR19reUvGozMCUXZxAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A541xQpc; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A541xQpc"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so6424160a12.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845596; cv=none;
        d=google.com; s=arc-20260327;
        b=sDSHvx08ZKGUyh8foud06Au2b7hDj0QyYck+p2yJDEr10ReuR68qo9+kgUkPv3bUFQ
         1b+YUUHVqQ6dbyu3SmGBjONW7/DcIFis6Hq4fDR3xerBCLZs08CafaHwR0YnVJWGreuK
         9KMlO9mYZDjZ9kS18gmFpir3PIHAlcnLNjUiJarCMZvu8mwKwTYF1AtgE9VRBWroVGqE
         3d8tryF1nGLqNiNQtL21Mfk/xI2gPVfvXO/bo9Jw6CaX+6T6HJCzfBC7fqPZEWGHZ9K7
         xzOZxgad82wFY46uex9HNCkLFebGZp3E60tXuUcrfAPy4HuJrsIGpe6Hi4f4w/AWk9fG
         mNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        fh=sEyTV2+ZNs3HzjuPxamUcdT0Ybrx0VZIf/FLaLFMVyE=;
        b=DM1E6U3MhnUA05nfzQLkywa7lu/QmRh2VAO+ey0Z/HzgdtWcpKpESRnyTLkG/0e5xU
         Rx5vlQyj2uRjZkiiFi+d5BmoMuoGSVgrJXz5PsE8FdddAQDlaI8gLLV9GEoZmqvDqkwY
         70pPNi8LVrX3D8DqgWclY5sXKkJxvfPgk23yyx7rn2F30qiMpt+K2pddSsp31Ya8rbJs
         6w6cWQUgd60fzp0eqERavPhzklmwoYn7cUFk0WE6hPSa+7bSJWeomTJgCOPNY97bH6ug
         AhKRm7aa7Bw6n5fVtrG20+4TLKpNJg0lEE1FM4RdcKCu5neFkwGuuuFAE5Q+X1UT3Fej
         g97g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845596; x=1786450396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        b=A541xQpcY59QDdUBNiR5AzU+FDat0f0C3w6EWdHVaQOcEWsUSiPAMzJiBIxpXKtLsl
         Rqmyuyh+g15mgW0YwefgKOwVe7rH/r8c6nuhrqtPCtYRONtrInDX1tjuJ2ugZ+6UZgVp
         9Lp/QFBYDpNVcqhRygEqhTxNCCznx9TMwZqELpskQ8ykQTJqhre72LcGWLtYRxdN/CuB
         Giw8SfqSz97mt/3Qa+HBKDND85fJ2F5bcqPkn5dSHfNiblbBdrQ5ODWylsizDsnpB7hn
         +Mwsqb8XTrBt/wK3NYvLMR9wrjhyebkJ7bgvqlB0frKStECfqGX3U6xB3boT669IhW3a
         RYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845596; x=1786450396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        b=R7pAh0aUTevguXf1R2bBSZOCU3hHpMB6hHtpE9Q7BT35ftjyC/uKXj0hmz+B+DS+8Y
         +OQ04zcgah4tJctR8ml1HiaVj3R562KvoZ6JDbvgj74003Aj6PyM5ddFWeTlZ71k/y0+
         Fjpx8nJpuhEG6g3yjrer3Oz42aurQT6PdvMtTXGwApVGC8a1vExXRRNuvt0iIb0S4JNN
         Nf7Wr49QlEGtyfYYT4vrmW65TO2gmp/jmnbB8tewXFbIVj0Ww+bwwdOfYk6m1y6CIBPj
         OjXsIxQsdAJkVemQop8vt6SbPftEjHIWYs4DFm4p4CQzXccF2QTwf/Gg9r9wlt9tcnCS
         hZuA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4KXG3cJZNuO7Bsqn1EMdyrIecAlcc7GA7gBDIrzVCMfVpamCwEBiGB43fkaUwMFTYXLeVUIqatnhS@vger.kernel.org
X-Gm-Message-State: AOJu0YzyvBmpyyWdcGLTtwYaq5NQGqBKmHUCqji/u5tP4e8bA84OOX7d
	EZgtVzgy3P2qx3l/ayKvk74q15SOUDpNisslBQZcdLN8jljeeqCIM7M2uUsC3gyOd4G9i5XeeB4
	eB4THjzCNE0r+tK+FKgzGoJpDBW+8omFMs+SZtKj4VA==
X-Gm-Gg: AR+sD10chtmWeMMqPrRZnGG7LsZMjVS9nPow7NAc0uNlTkjTLCjR7UoYitoTC+5HNxz
	ZrVolfl6fFSBO27Iwma80LK0ibE1RLnwHbKUADNt0Gtwyh1LnoZN1DFj5ZyBTdnoDNzY87EgiUE
	gpt2LGIHH7brzon0+BWyBVmlyeiFBgvAMh/ALTRvIE1OcZY30Z+s8RRm7fRJ7/8/HJLmyTslpl7
	3RTd9eeW0ebSmzN+ajlcgHy2cJY82ABNRBtCR7+R95kb90qtXnyhVo12kRE92vKP4O/JSXtvnic
	BGrwK2+TWkJzPbsM8B6CWRNCHV4XGbZ8Xk3toFEV5sjFToAo4ctxKJmRZRJJvQFwH3/P4QfdQTD
	UODI=
X-Received: by 2002:a05:6402:210e:b0:6a1:dbd:bfe with SMTP id
 4fb4d7f45d1cf-6a10dbd14d3mr6487020a12.7.1785845595738; Tue, 04 Aug 2026
 05:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-8-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-8-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:13:04 +0100
X-Gm-Features: AUfX_mwc02vgie46TBnIUko-uRbRaYK1so1vlpZtpYgOnY3URFkF56TQorxPBfo
Message-ID: <CADrjBPo0OzJP7UmnW2igYyqhWxbrdF_fmj0xrvX_0N6P3tNoXg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: fsd: Align continued properties and
 add missing blank lines
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>
>   [required-blank-lines] child node must be preceded by a blank line
>   [continuation-alignment] continuation should align to column 39 (under =
< or ")
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  2 +
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 97 +++++++++++++++++++----------=
------
>  2 files changed, 55 insertions(+), 44 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/=
tesla/fsd-evb.dts
> index 73b6a25e0e4d..503abe52a81c 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -53,9 +53,11 @@ simple-audio-card,dai-link@0 {
>                         cpu-0 {
>                                 sound-dai =3D <&i2s_0 0>;
>                         };
> +
>                         cpu-1 {
>                                 sound-dai =3D <&i2s_0 1>;
>                         };
> +
>                         codec {
>                                 sound-dai =3D <&tlv320aic3x>;
>                                 system-clock-frequency =3D <33000000>;
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tes=
la/fsd.dtsi
> index 214d33ca7177..6766c78243a3 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -43,12 +43,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpucl0_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl0_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl0_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl0_3>;
>                                 };
> @@ -58,12 +61,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpucl1_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl1_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl1_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl1_3>;
>                                 };
> @@ -73,12 +79,15 @@ cluster2 {
>                                 core0 {
>                                         cpu =3D <&cpucl2_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl2_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl2_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl2_3>;
>                                 };
> @@ -456,13 +465,13 @@ clock_imem: clock-controller@10010000 {
>                         reg =3D <0x0 0x10010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
> -                               <&clock_cmu DOUT_CMU_IMEM_ACLK>,
> -                               <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
> +                                <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
> +                                <&clock_cmu DOUT_CMU_IMEM_ACLK>,
> +                                <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_imem_tcuclk",
> -                               "dout_cmu_imem_aclk",
> -                               "dout_cmu_imem_dmaclk";
> +                                     "dout_cmu_imem_tcuclk",
> +                                     "dout_cmu_imem_aclk",
> +                                     "dout_cmu_imem_dmaclk";
>                 };
>
>                 clock_cmu: clock-controller@11c10000 {
> @@ -499,17 +508,17 @@ clock_peric: clock-controller@14010000 {
>                         reg =3D <0x0 0x14010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TB=
UCLK>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DM=
ACLK>;
> +                                <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>=
,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_T=
BUCLK>,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>=
,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_D=
MACLK>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_pll_shared0_div4",
> -                               "dout_cmu_peric_shared1div36",
> -                               "dout_cmu_peric_shared0div3_tbuclk",
> -                               "dout_cmu_peric_shared0div20",
> -                               "dout_cmu_peric_shared1div4_dmaclk";
> +                                     "dout_cmu_pll_shared0_div4",
> +                                     "dout_cmu_peric_shared1div36",
> +                                     "dout_cmu_peric_shared0div3_tbuclk"=
,
> +                                     "dout_cmu_peric_shared0div20",
> +                                     "dout_cmu_peric_shared1div4_dmaclk"=
;
>                 };
>
>                 sysreg_peric: system-controller@14030000 {
> @@ -522,13 +531,13 @@ clock_fsys0: clock-controller@15010000 {
>                         reg =3D <0x0 0x15010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
> -                               <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
> -                               <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
> +                                <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
> +                                <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
> +                                <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_pll_shared0_div6",
> -                               "dout_cmu_fsys0_shared1div4",
> -                               "dout_cmu_fsys0_shared0div4";
> +                                     "dout_cmu_pll_shared0_div6",
> +                                     "dout_cmu_fsys0_shared1div4",
> +                                     "dout_cmu_fsys0_shared0div4";
>                 };
>
>                 sysreg_fsys0: system-controller@15030000 {
> @@ -541,11 +550,11 @@ clock_fsys1: clock-controller@16810000 {
>                         reg =3D <0x0 0x16810000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
> -                               <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
> +                                <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
> +                                <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_fsys1_shared0div8",
> -                               "dout_cmu_fsys1_shared0div4";
> +                                     "dout_cmu_fsys1_shared0div8",
> +                                     "dout_cmu_fsys1_shared0div4";
>                 };
>
>                 sysreg_fsys1: system-controller@16830000 {
> @@ -921,7 +930,7 @@ spi_0: spi@14140000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI0>,
> -                               <&clock_peric PERIC_SCLK_SPI0>;
> +                                <&clock_peric PERIC_SCLK_SPI0>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -940,7 +949,7 @@ spi_1: spi@14150000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI1>,
> -                               <&clock_peric PERIC_SCLK_SPI1>;
> +                                <&clock_peric PERIC_SCLK_SPI1>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -959,7 +968,7 @@ spi_2: spi@14160000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI2>,
> -                               <&clock_peric PERIC_SCLK_SPI2>;
> +                                <&clock_peric PERIC_SCLK_SPI2>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -973,21 +982,21 @@ timer@10040000 {
>                         compatible =3D "tesla,fsd-mct", "samsung,exynos42=
10-mct";
>                         reg =3D <0x0 0x10040000 0x0 0x800>;
>                         interrupts =3D <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
> +                                    <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&fin_pll>, <&clock_imem IMEM_MCT_PCLK=
>;
>                         clock-names =3D "fin_pll", "mct";
>                 };
>
> --
> 2.53.0
>
