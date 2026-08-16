Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F0D1E5714
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786896054; cv=none; b=YyU7vietbSL/IKZF4mTMLkQrA/RysyfzIAmZQMAAqkdPmy5sqh5R7THeVQTvkD4V95e1ba1/g/xZkAHXvJ56qlcP5JfxIaV8BU5kQJg53tK8+GWt+Hhk3AwW6u+pi57Qi/e67HeUH2hLsHq4GXNo8+FxcbV4YvURDTcW1eNhcxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786896054; c=relaxed/simple;
	bh=5mIqHEDSAbVA9cPjCk8gWbfzC8c+xOZxPsT7VO9k1N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewoU2PLWeJZLSdLS2jLVaJ3XiAByph13qsM6ceuMntdT889G4yTCH/oU/cm1VNABf9Oy3FWlOM4mugVS8Gp/xsqQg/S0m84ohZ1iRhakdlv96z39CskCIJ5jViDHqZCoO8nZcp5DjHrNQw3jdWcEJM9TPxwuRBFboKgDN0tQngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8+vjuuT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8+vjuuT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf50c6f235so31529035ad.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786896052; x=1787500852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkirOfVRfO6V0utP9IJiT/V6RJ481m8i7Trlbe9HF58=;
        b=g8+vjuuTLB0zddHL6yctESRpDEzfa5C0jsHkQz+t6Wt44tEWrLtNgVPns7tNMD2QgA
         q8eiBtE7Nd59YkCMhk27pbNdFh2QT8q3mBJz5wrRewD7qVPaU7CX3XcqgJsQmXHi3od0
         R3ttsI9NKR7bL+FwcugelgGBxPL9Np4uBzO+z/czJIVY3fW5suiOrNN0DDvPYiTv9NCv
         cHJP/BCxdRDHoZl1hn+QBC2EcHWNpXnZlm9DqjnUUb4CNMMEz8GA3AcKFfu5jOlHVM5R
         PEGe2Bsu0ZtVdQcpRIQ7a+8nIikkJm4Txl4CX4QcV/V5Bb0VDwlf5ZTbTRBKVcNO9kmZ
         eS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786896052; x=1787500852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkirOfVRfO6V0utP9IJiT/V6RJ481m8i7Trlbe9HF58=;
        b=Z9GzXhi9wIr0pP5+C4x4La+UDMiIGJ3hqSWS597Cmdq0oaw9xPAtNnuK5esNAglSWJ
         9D847pwvKfw/aJVFf/JY2NbdiV/lJap0OHOp3fQPbzQ3c1HF1T5gYYf7zLNytl/rGi2J
         EZCjMG6UHGD3zB0cc/0txEt4Hcc73uFiRxX+gtDKjro4s/A+gFT0hPpaN6CmlvQu00eL
         GNb+KMQsnNvV7ulWqKQATou403AMIJ6TCzFwab9J0t/Gj+YtKsXzSnMGXhEg+okF1Pet
         Py8AjEVnLfeFW3YrbGMLLGquD2dQ1I4WOoEWsJHFSOTZZPsM8odL22tYqJ4jhyWjrtxy
         8QqA==
X-Forwarded-Encrypted: i=1; AHgh+RposTJUrJUrYyRc1IA1kBccWB3YaHv7fpkzVblWzZUGV5keSaOoj6UuMQPxuVBDfkr3qVeItrOvQACA@vger.kernel.org
X-Gm-Message-State: AOJu0YwoD2/wf2ADhSZF7OqSkLwr+Ro1D0dLr549U4iFX+Jsl/9hHp0S
	m+eaPreuIEvn4lOQsKZLI1pvRySUi2F6XsPGbcT7i98bCpt5pBdENrDN
X-Gm-Gg: AR+sD12PwOrph4wFm01CxrE2nTbXwf05ERJH5zf3Z/6ZvImSY3IhcaUqmjA7uV2nrd8
	b+0Z4hNaG0Hqfbg6erJ6SkV54tiCXmL6E0Q/nz4ku2rDpuGhLZBsXS1h8Kq/ZexKZ3/RHs/VcnL
	72dwhFwv3kc78rduA8mMLqg+6xFLZx5VKmQKf6uUm87QHcIZWpBz0ZQPd7QqkV4TzeLbJkGMKPm
	ARU/wseKP2RoJj3GAP9puvJsEYPeLvHdyszFZaK6vYiJ4vP6uwB5sFfbDpHeBFMBCoB5ypeC/Co
	NoZmc6Xw2U61ThNIBRCM/kObFaNLDEjQxoTE5sFZIELm8y5FJLfAgWAqmCNAdl5d1zVCd2Wlrv6
	9KXOOPjcmGcfxTHBzvxjn0ier9Rq4ndb9/zMFL9H3DziH4nZ0gxtMnI1z9IxL1e/zmANT1kUtLf
	5pSAB4cHHeXpoJAvehrjSbDzflx/y93hBrDokUkpw2b29JkBb2F3Kwbl04YM2pryfkYaVlUGpOe
	BXjeEWF962mMLh9WW5CIKaAJARpcosEHd3wDUE=
X-Received: by 2002:a17:902:e78f:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d3b0c93b91mr210811775ad.11.1786896036704;
        Sun, 16 Aug 2026 09:00:36 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:403c:f88f:3e17:55ae? ([2406:7400:56:e503:403c:f88f:3e17:55ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7a32bbsm26462705ad.26.2026.08.16.09.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 09:00:36 -0700 (PDT)
Message-ID: <031e1ccd-c4d6-4dfe-8920-fa7b0e5deb7a@gmail.com>
Date: Sun, 16 Aug 2026 21:30:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mfd: Convert TI TWL6040 to DT schema
To: Eduard Bostina <egbostina@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev, Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, m-chawdhry@ti.com
References: <20260816092847.2522994-1-egbostina@gmail.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260816092847.2522994-1-egbostina@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Eduard,

On 16-08-2026 14:58, Eduard Bostina wrote:
> Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
> schema.
> 
> During the conversion, the following updates were made:
> - Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
>   misnamed in the old txt binding.
> - Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optional
>   because modern platforms do not require them.
> - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
>   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
>   twl6040-vibra driver.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v2:
> - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to 
>   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
>   twl6040-vibra driver.
> 
> Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@gmail.com/
> 
>  .../devicetree/bindings/mfd/ti,twl6040.yaml   | 142 ++++++++++++++++++
>  .../devicetree/bindings/mfd/twl6040.txt       |  67 ---------
>  2 files changed, 142 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
> new file mode 100644
[..snip..]
> +
> +  vddvibl-supply:
> +    description: Regulator for the left vibra motor
> +
> +  vddvibr-supply:
> +    description: Regulator for the right vibra motor
> +
> +  vibra:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      ti,vibldrv-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for left driver
> +      ti,vibrdrv-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for right driver
> +      ti,viblmotor-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for left motor
> +      ti,vibrmotor-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for right motor
> +      ti,vddvibl-uV:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: vddvibl default voltage if it needs to be changed
> +      ti,vddvibr-uV:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: vddvibr default voltage if it needs to be changed
> +
> +    required:
> +      - ti,vibldrv-res
> +      - ti,vibrdrv-res
> +      - ti,viblmotor-res
> +      - ti,vibrmotor-res
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#clock-cells"
> +  - vio-supply
> +  - v2v1-supply

I think the vibra supplies need to be conditionally required when the vibra child is present. 
twl6040_has_vibra() uses the presence of this child to instantiate twl6040-vibra, whose probe
then unconditionally gets both vddvibl and vddvibr.

Would something like this make sense?

allOf:
  - if:
      required:
        - vibra
    then:
      required:
        - vddvibl-supply
        - vddvibr-supply

This would still allow TWL6040 users without vibra, while retaining the dependency for users which enable it.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        audio-codec@4b {
> +            compatible = "ti,twl6040";
> +            reg = <0x4b>;
> +            interrupts = <0 119 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-parent = <&gic>;
> +            gpio-controller;
> +            #gpio-cells = <1>;
> +            #clock-cells = <0>;
> +            ti,audpwron-gpio = <&gpio4 31 0>;
> +
> +            vio-supply = <&v1v8>;
> +            v2v1-supply = <&v2v1>;
> +            enable-active-high;
> +
> +            /* regulators for vibra motor */
> +            vddvibl-supply = <&vbat>;
> +            vddvibr-supply = <&vbat>;
> +
> +            vibra {
> +                ti,vibldrv-res = <8>;
> +                ti,vibrdrv-res = <3>;
> +                ti,viblmotor-res = <10>;
> +                ti,vibrmotor-res = <10>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Documentation/devicetree/bindings/mfd/twl6040.txt
> deleted file mode 100644

[..snip..]
