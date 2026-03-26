Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222E73B3BE7
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528488; cv=pass; b=Rl5ptuOwrTKqu4TfZfOdjEER2Vz+VNWL1lOIPWrQPHLQs2YSnLShBqyX0ZO7ySBAH9j6WsH/acwmTSYi+HxjgW1Cusk7XjfPo+nvkorBgCXRfrikFPK1b2lBfz0LuTdvMyA/5g8fmC9p21gh/7nlXaBChftE3+1GjJqCjQ/9Qu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528488; c=relaxed/simple;
	bh=Kh8C2yd0QW5E5Nn2o1qDw2Ib5nSTc8p+g0FkjkfPiDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXQGdPnO/2gNkLzK7u0+UWAaWOz9mAI1nmCzKp/473IsSh8I8rVwSf3eF9ybs8Y/nGUxTLeP6D6Uyja77l/tgtm59+yW4GO/o8M5uvEoiBmlvmv4R/heXjmZoJ4oPBJiQtKXbfk30CglXcTC/wcmA1SG8w162TuEmGyMUXgPGQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4DP+qOp; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4DP+qOp"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso7065151fa.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528485; cv=none;
        d=google.com; s=arc-20240605;
        b=Po7ZQcPxfB3P83LfWxq9kNKyLA5J2BKQ2u1Bv557mSL0Hwf8Z6STUo92MiC1wu/nCY
         PbNNWLOsnBc5jBNB8nypTs3WBAvwDHCmyXLfNgx5FKpLqsZj+HRnM1BOSXUuOnzlSjqJ
         jpatQuXn+0L0nSc16NzwsdWGNZ7sdkNRYkY0n/fAka9nRmjk7J8gVQePdrU4lOMaFrmN
         ZscParmEnRclwe5CguBn4BS4pr4Cd76wC/JqD3OwmsaraSut6QR7ytSeO9XzjbR3zgQh
         Ko8k4SLFepE7ax/3jDZV+j8ctGFhuCTIMF/6M8DgZ0pZjEwv4n7CUnBovNILoCR06+hO
         MLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w8arL5aX7YsSdvIL2KLEa2SjWw/0ygcrFGAOAqfvGZA=;
        fh=oi0ws+zwoP3DDBeqr+toiUVw1uO5tXEcjvuOrLnH5Ew=;
        b=VGpvLjs8RgI112gVA4rcb+oXbxsOWKWbYpGyVy1tUvJpTkCPtMwBX6E9vLjF/ZfWZG
         ORmwCKXAxH+u1zVxFYj08ubqkrZpRgAyq5o2GtdSMlo3MG+yDTa7b5SRKe0cGyMaWT1Y
         ZC4VS1uG4utS2VEP5xKKEJxT6Q4dMiuemnxo9ZNi79xeSuEGUc5yNFQUQccpPm0Xhocz
         V5nXvwuFzTLNuZPiP3Bx+ul/rO8w6jK20zCxRMrfsDSw+L+gjpSlsPQZkjPl6BcqjPkf
         u+WW4eKkr4W23TQDwjG5S6KrWbWLCQYZuVr6HCmetnU+ocsEyrntDWLwhBnEra8KFeRa
         nv7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528485; x=1775133285; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w8arL5aX7YsSdvIL2KLEa2SjWw/0ygcrFGAOAqfvGZA=;
        b=F4DP+qOpaxvrrK3Kivb5yaJXpL6HP+GptmnIQorhZDKTToxrIelX5EkYMbUqcdqnUW
         IFmDvt1uymzvURo/j1v+LjAgjcBrgCRuBlyo0AI+r8jhsob+qm94uzw6UKetrTtampbm
         q560eZCcWJ0pZTuhxJ/lc/K59LVOTARsBQMypRZWwzTae/repluOig6+X4MpRUXSZqAF
         BLM/HgKnU+yT1Mx0ntNYdOK6Vgq1Lr+M9pDLxt6BFbURyfaOylfAv4DGx8I9v6xQMZWX
         r8kCShwEd2/rGj9N5MUfqWe49PnWlGTWOOoDPXscDUSzc8+hhebaAkce/ebr+9J+v+Q4
         AXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528485; x=1775133285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8arL5aX7YsSdvIL2KLEa2SjWw/0ygcrFGAOAqfvGZA=;
        b=qBau44eX29HVdaE2c/yIh3XCL0Y4ssJfyyPK9ehx/+PCmsojI+ZjUVio83t/dxTu5+
         qEEOgUTZgr1TUs6BLfOCEgGFwvo4wWKnKa67Kgcumde9gfdc0uZLrdfDV8UmazM3NoWF
         EIINFHf5DnY2OjZr71YRq+lhj8GF1vfdOhPlweBgAOb0/SQgOkYBU3M5lnjkx043f6pR
         H9GbF7N6tZrlzd/2XDT0s2ty9KWsLjoewo+ycVbU2xBJUydkgaQA0QNOnYYTdsoUAox6
         vFpZ7cMzPFnpHlzf6GBdpQvDOGAiV9QGqaCSKLe+EjAArvO0sTX0mJ+Imcd1SRvFIHar
         hbMA==
X-Gm-Message-State: AOJu0Ywy9etKRJ9AFtagK6MbVNrUdtwCTjsBwhzR3MPmMyRRY7yirsVe
	O421ZzLxSYURSfXLznCLzmbjoBqRwIJo1Pmv7ug/EDgFQM0Lrvs3QPzCJ5VutEVEQruGEEc5axr
	DvfyAwz4GjCWcfEbeCrSiNcJkYMoKZ0ahxOtqtNyDWA==
X-Gm-Gg: ATEYQzznRHvECqSJxr8dvOMNxc+octR4N4YGGFlgo42ZSqCMH3zCod7muzX8KUonNGT
	8jCQ1zuW6R31maT86d8XpowrnXMHoiXLVDbhlRjI9YfAzbc1q3QOtIkLi5Oo59Vo7fJN0SrflqL
	o3LEEs8zrEr4/czbQzCwpO7pRnGl0PQouytqMVQoRdluFFIja6omgEMt59fGaN39ymJSMX7AyV6
	DOBGd7mdIrkBA5VxY64o66Ib9cvNlAkaAnd8nMWfXmm2f+8oluvjlqlwtxkHA+v+nVDvencynCj
	gkN+wqI=
X-Received: by 2002:a05:6512:3503:b0:5a2:787a:fa54 with SMTP id
 2adb3069b0e04-5a29b984575mr3819487e87.18.1774528485146; Thu, 26 Mar 2026
 05:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325225439.68161-1-rougueprince47@gmail.com> <20260325225439.68161-2-rougueprince47@gmail.com>
In-Reply-To: <20260325225439.68161-2-rougueprince47@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:34:08 +0100
X-Gm-Features: AQROBzA9ouu9GctOeENUqpjJUJQ5Hy-gzMk2QIkjrS5DYDZYZfDgFBRbTuNSliw
Message-ID: <CAPDyKFo29rgaf7OtvbkP85w96Y3nRJZORO_Sog70hdoxzYVzSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: hisilicon,hi3660-dw-mshc:
 Convert to DT schema
To: Bhargav Joshi <rougueprince47@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	xuwei5@hisilicon.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, zhangfei.gao@linaro.org, linux-mmc@vger.kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Mar 2026 at 23:55, Bhargav Joshi <rougueprince47@gmail.com> wrote:
>
> Convert the Hisilicon DesignWare Mobile Storage Host Controller
> (dw-mshc) bindings from text format to DT schema.
>
> As part of this conversion, the binding file is renamed from
> k3-dw-mshc.txt to hisilicon,hi3660-dw-mshc.yaml to align with compatible
> string naming conventions. Examples have been updated to pass schema
> validation.
>
> Note: synopsys-dw-mshc binding specifies clock names as "biu" followed
> by "ciu". However, this Hisilicon binding reverses the order to 'ciu'
> then 'biu' to match both the legacy text binding and in-kernel Hisilicon
> DTS board files.
>
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>

Applied for next, thanks!

Kind regards
Uffe



> ---
> Changes in v2:
>     - Grouped compatible strings into an enum.
>     - Replaced raw numbers with proper flags.
>     - Fixed property order and removed invalid hex values.
>     - Added explanation for clock order change in commit message.
>     - Collected Acked-by tag.
>
>  .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
>  .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
>  2 files changed, 117 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
>
> diff --git a/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
> new file mode 100644
> index 000000000000..296bd776488e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/hisilicon,hi3660-dw-mshc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon specific extensions to the Synopsys Designware Mobile Storage Host Controller
> +
> +maintainers:
> +  - Zhangfei Gao <zhangfei.gao@linaro.org>
> +
> +description:
> +  The Synopsys designware mobile storage host controller is used to interface
> +  a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
> +  differences between the core Synopsys dw mshc controller properties described
> +  by synopsys-dw-mshc.txt and the properties used by the Hisilicon specific
> +  extensions to the Synopsys Designware Mobile Storage Host Controller.
> +
> +allOf:
> +  - $ref: /schemas/mmc/synopsys-dw-mshc-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - hisilicon,hi3660-dw-mshc
> +          - hisilicon,hi4511-dw-mshc
> +          - hisilicon,hi6220-dw-mshc
> +      - items:
> +          - const: hisilicon,hi3670-dw-mshc
> +          - const: hisilicon,hi3660-dw-mshc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: card interface unit clock
> +      - description: bus interface unit clock
> +
> +  clock-names:
> +    items:
> +      - const: ciu
> +      - const: biu
> +
> +  hisilicon,peripheral-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of syscon used to control peripheral.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/hi3620-clock.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mmc@fcd03000 {
> +        compatible = "hisilicon,hi4511-dw-mshc";
> +        reg = <0xfcd03000 0x1000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clocks = <&mmc_clock HI3620_SD_CIUCLK>, <&clock HI3620_DDRC_PER_CLK>;
> +        clock-names = "ciu", "biu";
> +        vmmc-supply = <&ldo12>;
> +        fifo-depth = <0x100>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&sd_pmx_pins &sd_cfg_func1 &sd_cfg_func2>;
> +        bus-width = <4>;
> +        disable-wp;
> +        cd-gpios = <&gpio10 3 GPIO_ACTIVE_HIGH>;
> +        cap-mmc-highspeed;
> +        cap-sd-highspeed;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/hi6220-clock.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      mmc@f723e000 {
> +          compatible = "hisilicon,hi6220-dw-mshc";
> +          reg = <0x0 0xf723e000 0x0 0x1000>;
> +          interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +          clocks = <&clock_sys HI6220_MMC1_CIUCLK>,
> +                   <&clock_sys HI6220_MMC1_CLK>;
> +          clock-names = "ciu", "biu";
> +          bus-width = <4>;
> +          disable-wp;
> +          cap-sd-highspeed;
> +          sd-uhs-sdr12;
> +          sd-uhs-sdr25;
> +          card-detect-delay = <200>;
> +          hisilicon,peripheral-syscon = <&ao_ctrl>;
> +          cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> +          pinctrl-names = "default", "idle";
> +          pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
> +          pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
> +          vqmmc-supply = <&ldo7>;
> +          vmmc-supply = <&ldo10>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
> deleted file mode 100644
> index 36c4bea675d5..000000000000
> --- a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -* Hisilicon specific extensions to the Synopsys Designware Mobile
> -  Storage Host Controller
> -
> -Read synopsys-dw-mshc.txt for more details
> -
> -The Synopsys designware mobile storage host controller is used to interface
> -a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
> -differences between the core Synopsys dw mshc controller properties described
> -by synopsys-dw-mshc.txt and the properties used by the Hisilicon specific
> -extensions to the Synopsys Designware Mobile Storage Host Controller.
> -
> -Required Properties:
> -
> -* compatible: should be one of the following.
> -  - "hisilicon,hi3660-dw-mshc": for controllers with hi3660 specific extensions.
> -  - "hisilicon,hi3670-dw-mshc", "hisilicon,hi3660-dw-mshc": for controllers
> -     with hi3670 specific extensions.
> -  - "hisilicon,hi4511-dw-mshc": for controllers with hi4511 specific extensions.
> -  - "hisilicon,hi6220-dw-mshc": for controllers with hi6220 specific extensions.
> -
> -Optional Properties:
> -- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
> -
> -Example:
> -
> -       /* for Hi3620 */
> -
> -       /* SoC portion */
> -       dwmmc_0: dwmmc0@fcd03000 {
> -               compatible = "hisilicon,hi4511-dw-mshc";
> -               reg = <0xfcd03000 0x1000>;
> -               interrupts = <0 16 4>;
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               clocks = <&mmc_clock HI3620_SD_CIUCLK>, <&clock HI3620_DDRC_PER_CLK>;
> -               clock-names = "ciu", "biu";
> -       };
> -
> -       /* Board portion */
> -       dwmmc0@fcd03000 {
> -               vmmc-supply = <&ldo12>;
> -               fifo-depth = <0x100>;
> -               pinctrl-names = "default";
> -               pinctrl-0 = <&sd_pmx_pins &sd_cfg_func1 &sd_cfg_func2>;
> -               bus-width = <4>;
> -               disable-wp;
> -               cd-gpios = <&gpio10 3 0>;
> -               cap-mmc-highspeed;
> -               cap-sd-highspeed;
> -       };
> -
> -       /* for Hi6220 */
> -
> -       dwmmc_1: dwmmc1@f723e000 {
> -               compatible = "hisilicon,hi6220-dw-mshc";
> -               bus-width = <0x4>;
> -               disable-wp;
> -               cap-sd-highspeed;
> -               sd-uhs-sdr12;
> -               sd-uhs-sdr25;
> -               card-detect-delay = <200>;
> -               hisilicon,peripheral-syscon = <&ao_ctrl>;
> -               reg = <0x0 0xf723e000 0x0 0x1000>;
> -               interrupts = <0x0 0x49 0x4>;
> -               clocks = <&clock_sys HI6220_MMC1_CIUCLK>, <&clock_sys HI6220_MMC1_CLK>;
> -               clock-names = "ciu", "biu";
> -               cd-gpios = <&gpio1 0 1>;
> -               pinctrl-names = "default", "idle";
> -               pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
> -               pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
> -               vqmmc-supply = <&ldo7>;
> -               vmmc-supply = <&ldo10>;
> -       };
> --
> 2.53.0
>
