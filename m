Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B1F2C08C8
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837435; cv=pass; b=tG4sZRK/zmc2bfGlfGKy4Thp7r6lLVBX2xgpyGJXCek5HJCABx9o04qndZpufonAiotOhc/Ow73iq5iBqjemHTTpxmyLkdG35teSWwRoYPT8GYOIXoKFYeBnLfj3J9Gn1Ys2MM0yQU23t1XL7yj/0SOzyGb+ZhE04nhM1beJ6oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837435; c=relaxed/simple;
	bh=son5GUfBCXkJka3b7rHSwRZcR0H7LmRjWetn/EiAmVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiyZc08f0LiB7qDmr88/hJMLh73RylfUY1kBFFyKy6Rjy0vJ/KsBsvmDHCM+KeyRPnBkvb6QEByW3rCCcxLV99rBp6iDg77U+isVGixVLR6z4RQtTyk2wXBniyx3OMxSmtOzHLIPHWihtz0U6CbS5NsUxoAiD3EjP9KgVPlhRHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwWZfu9d; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwWZfu9d"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8f9568e074so858260566b.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 22:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776837432; cv=none;
        d=google.com; s=arc-20240605;
        b=DEW4dmllkGoSNG/0AyONlvBBxfDVTPJMVgmQyT1TUJR1DXM8wkuJrXR3rD650Qia88
         Vtj1VsRlEA4XAQStqoKF6vZHYHtmZtLoNFxIznfl53YioDQHH01bNobENAbvToteidfn
         5nSV0r+hgllXxWqM372VwZJACADvmZ8lDtjk7NchoVB/S3FGVWascbvF62tTU2TTqCUj
         8RsQM0jR3Zdu711dMXXuYCkbZl3Tl+CMgmeyucjn9X/FkeJviPhyxTqxjFdBspsY/pV7
         Cauiyx6/QapZF2UXLAVYeXL8KiRkrXLvN6puRJZorrV/Z4bG7yGJ1uOEDxi9J0ixEP87
         eDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        fh=u0l3e7j9wf90xvnN2l0OYtG1RJ2AdV/YdGwZaTtu1Lw=;
        b=bigLn6botm1WeEu8NZK+sSW8aIlqkGpgngND4QUSLVHdM7536KKzw4Ck4o3nq+s5CW
         otB/aZEDqKeRRy/fgElkKu2LM5sLx3mGoe/GIrsmK2U1/m0+3knBJlAMoQJV5zAn7t6r
         qP32kkVUd29vSJQgSty0hKVBKbKlNTbAqNmGIYT6TH/j6cP9sq/PuO6wba+Z85dvI8cr
         49OtOhAqzXxmM8PhuRO99L47DhTFrlf/ystfiCkay8f7HRIsjdB02xzsdrmGqQbXfaU+
         zEy3ZE/q2mqVEx4DvF/3uLfLZV7s3RoTrvhbS8NFZU1qorgg0gMHnNq8XDtJH4a/8CWz
         vtCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776837432; x=1777442232; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        b=FwWZfu9dRVT99gz2CjUN93mRoFXQLjyqUuYqhqrRvqzrbkRuQIeasHYpcAL7/h82Pe
         uAmK+xC8F37G8Sb2fHEq8kKdX6EeHjNb1etpnO9pCSNbbpGLLNbjWwVyJ7B1WdRaIoOv
         KunOF5r5Fc8zPPIOyFkYlM+lAVI9KCB6X75GgQFepfKLV7VoRlA+jIoBFRNKh6l71sWx
         u563VV94qGXjpf8K8IFld/s3FI2ydL2KDLN50ntjIeIiiDnbWfDVaycVMunxyTwtk/Ry
         5mKg7kY67d/mTlfZQVTYr+v8iqcxS4tEuHReyG0Ixa8N/mJeZmdHUJsVZxj9e2NysDl8
         09+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837432; x=1777442232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        b=B928VRqMZgzIQjI9co3WCvB5qJ1AACKT5iQTCanrztWiAuci8V2cSCVN4eaVBo04Rc
         elp3n6jPyNc60Q8qCc+YH92dGgVUbVQBbxzDUMiOgwN+NH73A7a3tTgt8QtM5CvUvg1o
         1CX7Idi95/QrkLk0fJYIIJidBMV058AKh5AZt/6o8DqcTEjEGtKSDuCDZhy93dgMhUIx
         g9Ho4vCvezIC8qJQ7tmy9cGTGj9gY2b4AIrE6GkTvYvu+/a9TxEpNU8bzE5vdjfwEPA2
         yaDWomqUf23e8hium3VSOQEfkQ6z7X/XhocerTupBrKB5cnXPAIQtjtsV4Y/85drPmdJ
         LaRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IiERZPOCep7lAgZ4q5PNGUVgzt57SBwrJgAQGASert7UlNN7EECYgjFL5SxyBHhYwPTDOs2z341en@vger.kernel.org
X-Gm-Message-State: AOJu0YzqAILoVVXZ/YqehK8eVqONwDtK4+4JuWNxfSkxZT2hrusDZ3Eg
	Ctu+2S2PEvf+GLxf36YWl0ARq+YVY0hFMixt/uHUMOfmdoXt3dePupb0IDF2tGT45KS7lScTAlf
	stmX4MuHL+oxRgX5ASFx5WWiJOCKQDks=
X-Gm-Gg: AeBDiesVbjgpW8MNiYoQ9R0kmEYHcasUezWMNKurr0Ypw6fiWj90wt3sOunr/WtqQAp
	EP0vR3dnHWkWxKvl+pxWDGRWz/MEpWrTpiiW29am9XvFHhJtsHBtjUaPKk1OfaezjG8DBc07HKZ
	sFD8X2SXq2Pydfq9q/w0pkcMr0W5me5yQ4iuj2vNGf5SM25FHCDa+jgJU1hFl95lIniEq/rtYAg
	K7PfjYiU2Rq7JXG3Ym2WKDp6Z8Wg1MZBQ2gJhJj+3gLZhfU0G8q4Vqyevw1m5OGYD/fk9KiYaQ1
	9H1B83BeDY6ZQ84=
X-Received: by 2002:a17:907:d09:b0:ba7:7a1f:1096 with SMTP id
 a640c23a62f3a-ba77a1f52a9mr604591266b.19.1776837432114; Tue, 21 Apr 2026
 22:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com> <20260119-patchv2-k1-thermal-v3-3-3d82c9ebe8a4@163.com>
In-Reply-To: <20260119-patchv2-k1-thermal-v3-3-3d82c9ebe8a4@163.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 22 Apr 2026 11:26:56 +0530
X-Gm-Features: AQROBzAs7FAeBD4enf-d2fMmvL5o4M1AgFGifNPyDM3Z4riMQcMNULcXuvp1c4I
Message-ID: <CANAwSgTOmbb+Vzhck1riVaFM89zYLdMe3dn6DRHrc7p+rkR2DQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuwei,

On Mon, 19 Jan 2026 at 08:13, Shuwei Wu <shuweiwoo@163.com> wrote:
>
> Include the Thermal Sensor node in the SpacemiT K1 dtsi
> with definitions for registers, clocks, and interrupts.
> Additionally, configure thermal zones for the soc, package, gpu, and
> clusters to enable temperature monitoring via the thermal framework.
>
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> ---
> Changes in v2:
> - Update compatible to "spacemit,k1-tsensor"
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6..0fe7396ea6e4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -338,6 +338,96 @@ osc_32k: clock-32k {
>                 };
>         };
>
I feel the thermal zones appear to be configured at significantly
higher temperatures
compared to the thresholds typically used in commercial-grade and
industrial-grade device
test environments 1.2 Test Environment

[1] https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_hw/avl_veri_sop.md

Thermal zones should be defined as part of the SBC board design,
with the option to integrate PWM-controlled fan support in the future.

Thanks
-Anand
> +       thermal-zones {
> +               soc-thermal {
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 0>;
> +
> +                       trips {
> +                               soc-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               package-thermal {
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 1>;
> +
> +                       trips {
> +                               package-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               gpu-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 2>;
> +
> +                       trips {
> +                               gpu-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               gpu-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cluster0-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 3>;
> +
> +                       trips {
> +                               cluster0-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cluster0-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cluster1-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 4>;
> +
> +                       trips {
> +                               cluster1-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cluster1-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +       };
> +
>         soc {
>                 compatible = "simple-bus";
>                 interrupt-parent = <&plic>;
> @@ -434,6 +524,17 @@ syscon_apbc: system-controller@d4015000 {
>                         #reset-cells = <1>;
>                 };
>
> +               thermal: thermal@d4018000 {
> +                       compatible = "spacemit,k1-tsensor";
> +                       reg = <0x0 0xd4018000 0x0 0x100>;
> +                       clocks = <&syscon_apbc CLK_TSEN>,
> +                                <&syscon_apbc CLK_TSEN_BUS>;
> +                       clock-names = "core", "bus";
> +                       interrupts = <61>;
> +                       resets = <&syscon_apbc RESET_TSEN>;
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
>                 i2c6: i2c@d4018800 {
>                         compatible = "spacemit,k1-i2c";
>                         reg = <0x0 0xd4018800 0x0 0x38>;
>
> --
> 2.52.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
