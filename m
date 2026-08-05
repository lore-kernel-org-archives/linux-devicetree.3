Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491DB3E2752
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914088; cv=none; b=ODq6KBITp7kBje7M1hqK8qFki3YQzSUY5z8SmrnDZZEGB+gvfazi2f80SPbBDpjKbhm1NzYZXV3LYI5lcedUuqXWn+JQrQ5I6abhvex0/NsbxFEbQByfZGBaG4aunapee+05PHzTZ5jC1rP3fJvza0gnSc52XeDdYIVCay6ZeZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914088; c=relaxed/simple;
	bh=uepu9acxXvQl5sYD1/Nq3WCCzgCd4xSS+zMYdRJKUnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pa/S72LD/Xg7xApSL3RVTgcGZ5GSiZtOyZDlpXJqHDKMzwGPV0AMdeU+/Todh+fcsu2IydmIG0bNT86djLRVd8TxvEDUVTxZOnqhNS5Gk+qP24E/nU9TWrVAAt1y/OxIOCr+WH0qzA71BCgIXTjecb7UxnLGB5Mmx2nnS8UpWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pS3DNko5; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pS3DNko5"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so6133201fa.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785914084; x=1786518884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WwkS9i7GNpI0kimuglDAwrHsAV6ybfyNHVpUwpH78Q=;
        b=pS3DNko5CooES3VAwd5B4STTaWtoMwBPiIjWO6v4VZBwao5PSBJMwD3XigGjBD3k0j
         zHzMbirqM3N5BBaQISEwCuS2SUNx+WIR/v5SF/5IvURsol7yqqHkRVZcJAvtc5gOwWXr
         agw8EL5e+OJ6boXLHfOacejsMc9tdFh4TVTseT1D5kw6WWOLrxTh/ldg0fE86uMahvBQ
         AMFPhjZKaZD+QNMqoedT2N8H3YbMY5jgaMu0xCp2+XsLfYHFQRK/VA2H82ogpIlj8aAt
         wjyyiM0sRzHiZCKwD1l5A3kvO7GDGYwiYmnpw0zplTuVH/4qj46kDQHVseQEr2awBPTz
         WrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785914084; x=1786518884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WwkS9i7GNpI0kimuglDAwrHsAV6ybfyNHVpUwpH78Q=;
        b=BoJ45suX1iegZEaoW2D58aBQVR1GD8UjSxldw9d2pz9A9RmA3jfw5oKHhLp2kEwS3O
         y9s3fNhCxmLJBdA3L4zhMgCn3wGt7v6sCSgt8O27HfnVEKlpZ7XWrQLVIfOx2fHHBLwi
         TIABgHkETYSXypAgBUstTjFI5OKf/My8/Ga3dj2h/Pi+DrEPWlZigFhnlUw6KeIZZiVW
         vEzPoItImb+K2PIuqiAcPyuUXw+isOdaAOUVW4KZM4mLtOMHIHjMKr5df3XvAIzqvQAf
         y7M70ekcy6lakgJ3GQUdVXiEihjP2klvM7tbPuJrxi0Wx0CxlmA+qCqU3Y9Vaathx4nl
         rDeA==
X-Forwarded-Encrypted: i=1; AHgh+RqITnb22vfO6SPJoN6P7Iti/uctnCO7Upvy4P9rZX8kWJm0X/QHjjV1f/wq1LX4MH6ERwynQwf0Z1J3@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1qoicMXQuI+JxTmP2gEDImHBhGXG70vdVZyXn0KbrCZ5HUFO
	eZI2Vx7E8FMMFNplBKOU7FbnQ6seS77PqhdvfoHNRaoPtuXipXeGCwKz
X-Gm-Gg: AR+sD10e3sIg/2IOrlofq/3Id/0cWki45vaZ8aTIL8hZ9hU9DQsOWe4WxOOIvMgDTML
	zEZ5KT5tgFnpKtCD6kx2Il1AMCF1CuMuqBdx2cGt0aPyEqRxqtrUHEuRnI3rXWT2XhBOnZMNYmx
	cG9Nw6Hhb7rtPiXJVIcY9CjzkxRRkMG/H2JD4ysze5KDiuelffoTGYRHsLD6kIuydnaEAVht239
	olB67EXR0UGJnKfxeNvdLodzKnotn3fvKl4IR2jjCneAsBLp9SjDRp62B5RWrb4DY/RMb04Eib4
	LDEzBPH6CfWjtK+b/WenXr6GNsd1sc0IU78oZnPEoE/rqNhQJmMNBKuTFKgvgucP2VJVfDbMHy5
	tXhhROo4w7aqDwla626U9tbF5ZXssK6HWJEd/VszRCzjygcAZjFHSBw8s9v6pPmFGujBvqM1JAK
	WQqDRlUhhP9CgAwqmJEt/e/JjFdsbN0zA2StP7weMAEyqwZeOYulnXNYcWo7voPiTxhO7URg==
X-Received: by 2002:a05:651c:19aa:b0:393:d6dd:e8a1 with SMTP id 38308e7fff4ca-39fbb1ed3demr5005791fa.2.1785914083978;
        Wed, 05 Aug 2026 00:14:43 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a33c88sm6775331fa.30.2026.08.05.00.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:14:43 -0700 (PDT)
Message-ID: <da3aece8-3ede-40cb-8f63-45614a965cd7@gmail.com>
Date: Wed, 5 Aug 2026 10:14:41 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: mfd: rohm,bd71828-pmic: Use generic
 power-controller schema
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Dmitry Osipenko <digetx@gmail.com>, Shree Ramamoorthy
 <s-ramamoorthy@ti.com>, Heiko Stuebner <heiko@sntech.de>,
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>,
 Zhang Qing <zhangqing@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Julien Panis <jpanis@baylibre.com>, Alexander Kurz <akurz@blala.de>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-8-a440783c2e78@nxp.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260804-mfd-syspower-v1-8-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 04/08/2026 17:16, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Switch the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> index 09e7d68e92bf..9818102e02c7 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> @@ -15,6 +15,9 @@ description: |
>     single-cell linear charger. Also included is a Coulomb counter, a real-time
>     clock (RTC), and a 32.768 kHz clock gate.
>   
> +allOf:
> +  - $ref: /schemas/power/power-controller.yaml#
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -79,8 +82,6 @@ properties:
>         used to mark the pins which should not be configured for GPIO. Please see
>         the ../gpio/gpio.txt for more information.
>   
> -  system-power-controller: true
> -
>   required:
>     - compatible
>     - reg
> @@ -91,7 +92,7 @@ required:
>     - gpio-controller
>     - "#gpio-cells"
>   
> -additionalProperties: false
> +unevaluatedProperties: false



If I am not mistaken, this allows all bindings from referenced common 
binding files, whether or not they are declared in this binding? If so, 
then this is probably not aligned with what I am hoping to do with the 
ROHM PMIC bindings [1] [2].

I hope to collect the commonly used ROHM PMIC bindings in one common 
file, and reference it from those PMIC files, which use some of those 
common properties. I would like to collect all of the commonly used ROHM 
MFD bindings in the same file because scattering them around in tiny 
files feels like a bad idea to me. This means that not all of the PMICs 
referencing this file, use all of the bindings from that file.

Hence I would prefer not to just allow everything from the common file - 
but to limit allowed properties to those that are explicitly mentioned 
for the specific PMIC. For example, my proposed change [1] moves:

rohm,clkout-open-drain, rohm,pin-clkout, rohm,pin-fault_b, 
"^rohm,pin-dvs[0-1]$" and "^rohm,pin-exten([0-1])?$" to 
rohm,pmic-pins.yaml. Only the rohm,clkout-open-drain should be supported 
allowed with the bd71828. Keeping:
additionalProperties: false

disallows the properties which aren't explicitly mentioned for the 
bd71828, while making it possible to keep the description, type and 
other common stuff in the common rohm,pmic-pins.yaml.



Also, keeping the single explicit line:

	system-power-controller: true

to denote this specific PMIC can act as a system power controller feels 
(to me) more descriptive than "hiding" it in

$ref: /schemas/power/power-controller.yaml#

- which is also a single line.

As a summary - would it work if you added the reference (for 
description), but also kept the explicit system-power-controller: true 
and also the additionalProperties: false?


[1] 
https://lore.kernel.org/all/838486b443af9188410d8b802a818dc0af20ea9d.1785838585.git.mazziesaccount@gmail.com/
[2] 
https://lore.kernel.org/all/d419dcf8776f7ea88e4a66b9a0f0087f11e6622c.1785838585.git.mazziesaccount@gmail.com/

Yours,
	-- Matti


>   examples:
>     - |
> 


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
