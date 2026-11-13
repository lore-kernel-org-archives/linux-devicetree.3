Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574794;
	b=SV9Gh4QHtrAZa372GA8+STu9wRURnuP7v94Id7hXQY1PYec2ijfjm0UG6BT1huqGG0D+
	 Uj0E7uhZdiTiyeRriU2XaEyL+0yvBvH8pMLHJs6uQv1/GCbCQYl60SFDb3luQiQM5gpJG
	 sKpN5g/KqUd6MPWnM3PB0VCGV/yObNWYqzVjI6bSuO/OIwfyfKOXfqYiTX4HrCDSoJYRJ
	 iA4QdqrGjNrl4KxnW8eZevNpPL5I17Am2Q//LjhgJAnqld95wOW9gOWrx37yfyYCObUe3
	 q95EJppaIqUyPIQRSOu60CjpRWVr/zJ4oK8andJUC6l/+0T6dBpFIysozjHw/8dsC7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
	b=SgwaZQ3N8DGJs4J1XhzJFMA5/f3tDZ1E3vmpQxu+xReQ1373Qb1xF/hnvcAYBMRqHwbF
	 CnC0mN3jOgMMSsimLqPZm0BYjSa+bpIrLdTWTz1rLZzQ22BwL2RwB+VaYUtZ+rBIrYncn
	 d6qdtmj7bouGPaqE45MAO5lL+iijAYn+GcfCV6pUGmHOiv+1lp4C+oh5/DIYXuYOBqAmt
	 0nCmv+UjeOutmHJ9m9NK2e/IYfxdV2e69H0nX4oBszT9ogpGBA//yI/GAMfjdCyathNjq
	 Eev8pIgPPj2TqPZfmH5xGclgKNUgFHnfjF6/RI8qJs4E969ZJu0bg7zOJCgfrzkwOqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AkroMdRT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2225B606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2225B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AkroMdRT
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so3780351a12.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574792; cv=none;
        d=google.com; s=arc-20260327;
        b=htoTFegBSPJrL4cVLj1PekPnbXl4p2Fl2L9qwhbz9xuhD1JjKSBOUbB13Nz1lOQUTk
         1M24xWBw5wMUqySXrVHGPd5eZ5pZmWeCtKxuA4oxhwaXznN4kGv3Gn3PwvmFMsHAwbqQ
         OcykvmFi3RzP6dVMA3vC7C4S/8okgC//ARQlVjBbNeOIdPwrnZHyufqSNx8tiiFFKPPm
         SK9zpMSwe8ORjjugaf0aZladW0Epz8rh1oHWAUDJFOuJCUrNVVqdz9LrUVjt9uUzgmgc
         RsvmGWd0Ciw4OqdeM/UAwVPMO2qqYkL8ODBvMty8Spt0BrMiwkKbcCSCQBrFCMCz+Uuf
         itBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        fh=TDWzHTo/6/s/ou/IoTTq0j+eg6c07ukzHBdmEZ6WGew=;
        b=Qi9SpJhvG3gHX93CX/dRTIBiDSQRExgowCRZI0ui9N3R0xy1JOeqlBNUjW7Ya0gzeM
         23JTFDFAQo/gNxeddg1y+1hMdhEOvXaic0ikaAH5zvbV+3J0S3ZFcEkRqe8lM8p6CysU
         qJ79WNaqXX/sK8AVk7I5dWkqU/BzdNCcS0+tyEb5i2eVfFYjpE0952XqoYOkk17ceVot
         KIux9DJMYz/8mpFr5HIp8PRxjyWEg90PzcST9vqS+nijexOKsdTFeHHrIYx9UEzQZOX3
         2ilblOGxC2t1kFATlA6OY4HHV3xc1QQeO1JP0T+zGi2GttAmQTsyujyY6uVQrzRbhPoj
         6QDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574792; x=1795179592; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=AkroMdRTCJEU56zCl5mRMi6rrvafd2Mh879g64RVhOfD34YxgOzOtrBsT8yx4NkQl8
         gSv1yRzVbhdBh7graboeUHyOjVxnWYWXqTxrq5bwqTXLdODgtOJ2GOfvja1i9wZBs4H9
         fcb9zmhVDOC+WUd7SGVWyfxFQP93w/xQqb2FnisylYb2rXsRhjc4CRnja+NBnS2rKhXF
         cLontnuKm89vJ8lgs810EU0/SMd4hbxtRDKKGG1T7m/yNzjT4qqUkxsmm7hHJo35Whfx
         tDrQsm7X93e0qnvrkO6hPhp7RxKzDVtK1uhz9g5bxTs3CjlOANpOM/WN/oFPwtcbJAz3
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574792; x=1795179592;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=YSU7Mu7WlsvYC1gCEn1n/Xn/rrIfG5x09Do6G+S5mKb9hVVcYP9fdZqNmp/C9nh4K2
         ll/dAm4RhuwZ/NPs02ChjytNla6niJk550Esy6lU97vRDW9cUGLQNfoxgqU1fRRswsoy
         hqx+k8gbiVloCl2X6UtKRReqTpOZn6R/R68Nis532AYot/cfeXJW4ip9nIOpTn3CDv6w
         GDug9gGyJGIZo9r9u/13SiI/zigdqCA7SX6qqNijdp5Evskb86PExhWW5hGgZTBB7p8S
         4kg5uZPEnCiFY+xQo1FMsBoE7OckqTEMFLtpHhS3p6vfWmdmnOUetkvieJyBmrtbLYW/
         aK1A==
X-Forwarded-Encrypted: i=1; AL+hErHrNOTSEMULLGmRo6bFgBajC3jThK+TPKjVAEnpWOBtxGek3RQsNpa6KDLjqf6ixwUExRA1rg1SSl/+@vger.kernel.org
X-Gm-Message-State: APuU4Z+vRhBAPluQJCe+62/ZmuoFg7bAIMfTCwEXDGRbgUjroMoQTKLy
	XVA++GT9chkzhWW+Gfo8LRJS9EZYtvVasaWYpw1MTzRIBko5pes+dkp0zp/VXTNUybX078TpiOH
	utRECzpNhJWIi2HM+/GGeSdgCW/1ae78c/QjaWVLFFA==
X-Gm-Gg: AYBFou0qStKKujA1Pf8YfSGSLMH8umldU/Dc+yFXZiLofgQ0+u7bY2MvEdjGINzN825
	eHfXFFxSmwW1N+riiClZHdgBeee7BGOkwgmNGKWGeJGbqky7CDHxNMzwHXmQ1Vgg28jdCII1rww
	649Nmc5R2Z61XbRHbZTeN6MXjT9uWK7isK+Hp55qkaeiNx8F9W5EgEFdm0Ntc2YlJ3HhdrHIHVX
	YjzmAA+uk5XaUmjYnwBKWSkjEYeI2+va9fAT8D59Re3qTpBRUEBBXuRz9McUxo32LBKCCF0fl5e
	vbTprEQL/UTP2ovZiHa0YR+3zhGvNu2+YpegYePCVb1ac6OOX1YSPbqMuNXki876l+E/KNc+U5Q
	cTwWdJWu6pHuc6rbsfNYD6iLb29cBLsLfSwCxnuzmyVxMk5F13H41VcATlM0UIGkr8iq0Xn4Ypg
	Pb8hdjnQ7ex+7RQs0=
X-Received: by 2002:a17:907:3f9e:b0:c46:ca2b:84ab with SMTP id
 a640c23a62f3a-c507bca4549mr587358566b.13.1794574792499; Fri, 13 Nov 2026
 04:59:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-12-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-12-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:59:40 +0000
X-Gm-Features: AclHuK9cm82mhKCf1OM8U8MOAQmGsMU4pcM69WzWfUaEMzCzm0cQud7ofsYoc9E
Message-ID: <CADrjBPpf_-pnzQRYrpqpzWUewgF_U5EbOA1CJprnH1XzQoDuLg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14 RESEND] arm64: dts: exynos8855: add cmu_top &
 cmu_peric clock DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_top & cmu_peric block.
> This also add sysreg_peric node. sysreg_peric contains
> DRCG and MEMCLK SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 0333b80eba84..2e5dc79d66bc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -10,6 +10,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/samsung,exynos8855.h>
>
>  / {
>         compatible = "samsung,exynos8855";
> @@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_top: clock-controller@13900000 {
> +                       compatible = "samsung,exynos8855-cmu-top";
> +                       reg = <0x13900000 0x10000>;
> +                       #clock-cells = <1>;
> +                       clocks = <&oscclk>;
> +                       clock-names = "oscclk";
> +               };
> +
>                 pinctrl_usi: pinctrl@15030000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15030000 0x1000>;
>                         interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_peric: clock-controller@15400000 {
> +                       compatible = "samsung,exynos8855-cmu-peric";
> +                       reg = <0x15400000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_IP>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "mmc_card",
> +                                     "ip";
> +                       samsung,sysreg = <&sysreg_peric>;
> +               };
> +
> +               sysreg_peric: syscon@15420000 {
> +                       compatible = "samsung,exynos8855-peric-sysreg",
> +                                     "syscon";
> +                       reg = <0x15420000 0x10000>;
> +                       clocks = <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
> +               };
> +
>                 pinctrl_peric: pinctrl@15440000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15440000 0x1000>;
> --
> 2.34.1
>
