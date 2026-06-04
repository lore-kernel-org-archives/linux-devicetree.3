Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C0C41B34C
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572201; cv=pass; b=jXoo8s9NoHaPgyq/Pzfyd2yn/DFSSawHfixKcmQt4G2WYXXKd8zWXjJJ2TbK3GGSvYQQI2dOali+DtauX4YgEW/ovU2BDj42aIcAPHCCsB93Wa2u9q5JsceESABbv90T8FWyTfys1bkl7qp6BAIUq9tLV1EHAglWrdFn51Sptns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572201; c=relaxed/simple;
	bh=G9nFh7v8j7acwr3OyC0fVYembfzlnZt3C5JR+74mpZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7B2rNmMVFAJC1Q9fZ/2LLP8WebTJ9l8zXsvDfERevcm1uU27WrsdqI90wWr5kjijFxkP8afm98yDTeB8/8vmbE65y34KPRQh5RPESp/SWspSwNeVuQ/mOPjgH9rzhWNsfgykRWn2IULedAa6BIgU+1whRbTq/Re4q1wDgGXRtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCDTTn/i; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCDTTn/i"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so774910a12.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780572199; cv=none;
        d=google.com; s=arc-20240605;
        b=FRszx55rrx2DwL3wzFrN707Hs9FP/TTqyRPV167PrCfJZDV8a4dT/KqBKnEOtnGto/
         gIejSna8fnCECcczjLDQLmtNNNEYD/iCini0hkD/ASlbAUB0WAhj5uCnidq8fLW1w0ue
         VZXedtiNG7M1a3X//fQwHlSwk07Za5UaOx7dv2X9I0JI3rr2xZZfv3M/cExoZffrAdLy
         jVBXG0kjawQ6jB4ym/H3aRWvAA0K5JcGAtzlEDUNDK0Ma2Ju7HEx0N6W04BwalVkj59g
         MynjUm8otv3vtQBfwHn8a+gZ52xzALg7qCtDFf4HSkg5sltMUTjn3Jmk52519vgkqcwj
         83ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        fh=mAg1l4MrLQAFiRVRMLkmAvHEQETo9nxDl9bvbrwPkT8=;
        b=AmF7dlvxRj7V+t3GLuW/3haw3lbFLNadsLYVPlzAYD+fAxaSD681+5syH0Pra3dXiT
         qum0wMJv21kqgpnT86SVvytWqgXBMJCqF7jSO2vZwYvLXJVmwBHOycZK/9CDnB3en7Re
         F+UPMQt4ePlnhtDAzCKj2cNgJyhLGNSsBeSOYyThpnu33xcjcLyxXC/9Znm5sA628DDN
         X0Cs+5jXV8CAUVYhw9xlZ9UM4N1VMr1ETqK4qEAONbD9hUxnbTYOdIb3qdHJlOVRnXHX
         4wML97MupXK9W9VLXPWcbJ1q6By7OrUCjbxbIToJTfA7BVRZxbutAZsVuXEV+GQIZuqQ
         xWPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780572199; x=1781176999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        b=gCDTTn/id68R77pSDdc6rTL+6Ih+T2UAt7AVqNPKqUf2pAsafqzIFF8HcMskm0HG5A
         cfLj5uwQEpu3IwgKgjzforN7ZKRLWU4wBCbuV2ZMnwozWJvBTIJ6dnhn7Uh+1WKQdxNp
         Oev9ISvpdXVxm8/8W2a0UQqpm33L8xU/m2I8qa7xys1Er/zwLxOEQu+0V8K8/ulKq7FI
         eLWB0IspLO0BBpic5BqSID26CvTrjQodpvkaTA6i5WiXtpz0vkHJI+Ced4hMoWm/WZaA
         jSKYscB+DVT8Vw0CaOkagrYz5f61u/guqI2wERsZXufcFyedf6eLGVKakBWIUdYq9Is4
         dblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780572199; x=1781176999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        b=qU50KmV6Z3b6T6zDyawv7yXeCfRTUp4uqqko0jiIHpdjkitH81VU3gqS/5r2YZQimA
         Warhf+K0gPey7Iw0hikLGFgs1UwpFToVec2lqbS++vDopSFMX90Z/ZhPDOysyOAV3f/o
         MZVH374OXuK9U7jX9mpnShfMQT1hFbHG1ClIikJx9uhdLPpvH4o+uhT1hXF/SlDDisWs
         J53jCfDy+0Lz9RrP3Qmn5Zz1JyGR6+aLMeY9h4y5+iUGm6EhHLxtUGh7wyNJHdE20VEX
         Rvu7tRYzfuPYp7xZrjMs+QSx8bIe9DcdCDIiB7Don0+tHi46lwFXDasSN/NoEYADilHr
         em0g==
X-Forwarded-Encrypted: i=1; AFNElJ+7vEYlCzY0V09Q+8bNu2zTbHg2txWapiXR3Cz6ivieKLVFZbytkfyUPsfXYuEKxxHc8RIj6rjC/wLV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lHZffXtz4SpYmsxKcpbb0VYUA5f/k68ulI+ElCho4Jaz6YHD
	yhIKehZq0oDg93XNHSkVPOulB4iTP3mjs0f02E948+MorFe7WCl0R1Zy0ZH2Pbayg7h3XVW7x9r
	O2aUFUxem5e6cltMAtS8ip8cGHcK+MABY4fQzMiRj0xAGCOJO9K/49AQ=
X-Gm-Gg: Acq92OFsxBsefTbtKAGhkq/vsmonGdcUsqP6xk9XmIOSVow1Oogqp5lywWeoQE+VAZn
	lEHF3R+4/B9Rs9cHLA4/yyTtC3jbOacLLb6x0YkcrVITs5ytaI3k9J6zVPzqDj6yB3acx/5A9iW
	Sn0qWwTq5vlQmGiA2P9rHAiAKX26XpBgFFgFGzHhL1+0vJ7rc+qhgzfhwbata2c2LPQ32JSMMS/
	fK4owSLugsSrTUcHYoJKH4O4V+7HdlcGgR5+WqemUzpRwVPiCnt/Ed71/HmIiysCL3QU/zXtFgc
	pTQtOI/5hTeQfJPndm7NLJxRKJTewAdMK7z+509IUG+7z92x
X-Received: by 2002:a05:6402:3215:b0:68b:539c:d269 with SMTP id
 4fb4d7f45d1cf-68e710ebc51mr4043117a12.12.1780572197841; Thu, 04 Jun 2026
 04:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 12:23:06 +0100
X-Gm-Features: AVHnY4Ia0mw8gm7Hj0ZlJv6TfIxLHonorNGMBp2ITPuIwQPM__6LAPjP3GLorns
Message-ID: <CADrjBPqhrnMv0xoMK+K=rMmd9jKAHYqFkn6y7EKoqm=i9o656A@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.
>
> The GS101 TMU utilizes a hybrid control model shared between the
> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
> firmware. This hybrid ACPM TMU architecture is also present on other
> Samsung Exynos SoCs (e.g., AutoV920, Exynos850).
>
> While the TMU is a standard memory-mapped IP block, on this platform
> the AP's direct register access is restricted to the interrupt pending
> (INTPEND) registers for event identification. High-level functional
> tasks, such as sensor initialization, threshold programming, and
> temperature reads, are delegated to the ACPM firmware.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> new file mode 100644
> index 000000000000..75560ebca48d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos ACPM Thermal Management Unit (TMU)
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description:
> +  The Samsung Exynos ACPM TMU is a thermal sensor block found on Exynos
> +  based platforms (such as Google GS101 and Exynos850). It supports
> +  both direct register-level access and firmware-mediated management
> +  via the ACPM (Alive Clock and Power Manager) firmware.
> +
> +  On these platforms, the hardware is managed in a hybrid fashion. The
> +  Application Processor (AP) maintains direct memory-mapped access
> +  exclusively to the interrupt pending registers to identify thermal
> +  events. All other functional aspects - including sensor
> +  initialization, threshold configuration, and temperature acquisition
> +  - are handled by the ACPM firmware. The AP coordinates these
> +  operations through the ACPM IPC protocol.
> +
> +properties:
> +  compatible:
> +    const: google,gs101-tmu-top
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB peripheral clock (PCLK) for TMU register access.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +  samsung,acpm-ipc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the ACPM IPC node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - "#thermal-sensor-cells"
> +  - samsung,acpm-ipc
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/google,gs101.h>
> +
> +    thermal-sensor@100a0000 {
> +        compatible = "google,gs101-tmu-top";
> +        reg = <0x100a0000 0x800>;
> +        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
> +        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #thermal-sensor-cells = <1>;
> +        samsung,acpm-ipc = <&acpm_ipc>;
> +    };
>
> --
> 2.54.0.1013.g208068f2d8-goog
>
