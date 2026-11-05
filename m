Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837695;
	b=hORC44OOnWmtUWG16WvgJhlQ0KCY44gbj8TJpSd3DnCAsl2wHfNkMJUWxpvzZ/h9uKOi
	 iJw4wwM0yvi6PqQvCYasMkITYTk5OJ66ec1hgKA7zXvQeb5a01NLKTiD3wDhSZ7ZhKPgd
	 ID4K/L3mkKy2KqiNTfGJOtG3gRHBN9B39oH6+bie/FRISFFTx/5QFScrDcPxIlndvhuPR
	 AFPCL/n3PxriiBJlgbLfzznHkk91r6JokWi546GKH1PrLk40t0eIIou/JAqpIzyn71ah6
	 lYS/vldOIJ63sHw3RVMYqssOAHlyGI4HI3cSdncYLvK95xG1pdxguqi/jjxH1DtBRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mGc2vAFhLjrhjQgo4ZedaQEUC/gPM0pIwb1vV2XkbM0=;
	b=nRu0XoAmOXo+xfvihgsqNoc37slx/XEOZ7l2ySoxMN+gtEARraKvZg/KxkzDHJgXOyO7
	 RU/Xu9GErTnIgy73qCfiCFiP5jLRiL39coGLdj3v0G8YLWR+nkrVjrIYjnAbVv65JoBW2
	 D10iJ14tgDvc1uPehbzJdpfvEc0IzILix9lzbzBpB+OoHr5Hejxf7K8Fq5cAM4VcO1q0m
	 z3prIYLlqsfjpcZDqrxNv23UUQ4JLTqgsP9b7391iF6KsD1XSEWal+NU7NcB01F0HBa9J
	 cyjyf72UN60wPWs5atEdQwukYVhCXklfDyOZBJEATh5CqndaauhqK+sjemGG6JwuV8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEYMfFoN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9C0606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 00:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9C0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEYMfFoN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2420275eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837694; x=1794442494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGc2vAFhLjrhjQgo4ZedaQEUC/gPM0pIwb1vV2XkbM0=;
        b=eEYMfFoNspCoeIoNJY/b+Xve+xQTdefKAOBOHo69CfVlhXO5RRGt7oiyDZ9rQ2JAXc
         +rKLYOgD4O1o6ey0v/5apJZyPckwCN7shQ44vm1fC2PV4b2OpPbTQOCkjwGDVq3EEVM8
         H+w8U084nlAju7ObwISQEKsM3LIXoB9AE1BPO5dnz/yH/PofFMUDWafsWtgFlISeslVB
         gccWZF+3rRQFnwehdP9vevIAYQviLvVBOoD2VyTAqXiY/lklaybqqwJdQoVJCqrq7+RX
         1/faSvnVEy0IknDRynJ2edkA146IykKE/c2rFUP2Su0rYvVrBvFw9lMm0NC2zIa9WKMw
         x8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837694; x=1794442494;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGc2vAFhLjrhjQgo4ZedaQEUC/gPM0pIwb1vV2XkbM0=;
        b=WdS98M6SfaaO4iL4YnGw0O2RgTMsiPXeCaS70X+18cPnDTvvSdYYPrwyPjTlAOEDN0
         ted6cEzHK1lvKWRoxKCTGjWE5l+HQ7fUgwvcMyI6Mp+sm6mDkndJZfey8emFdy+GL+SK
         pEb4bkJqVbWU1+jiLnnh6sp8Ah+qAJR+ZGhnLReDv4VKS6nDvTyoyt66DBtRxPDvUmIR
         6QzELYQmZiM2E5RIa02JtyAVOVUxJWskkDDVgxNibycu+ZKn2oyr5uzPf9ujN1rU47T0
         35y0benzLrnD/zbf4YFDs8FZEmalgJozJY2aqSNI5iSsPxwwRmsTJJ9dLGk7UpJl+OX4
         RP2A==
X-Forwarded-Encrypted: i=1; AKwUvBz9BgjLogRpHEYeN+rTqXOMFar3E9Q7HM3vsfUINbR3mnhjuy2HndOf56Xu2+ANBxXrFXRTjF89U6cQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/P+/Keaj/pAoT9yE7PphfmKG+UPFVXyQDHjI6XIKQFnzCd6A4u
	ngtcCUkCxGJqCDbcMgfV+bknPUYoDMU/Fw5tA0Eru0/9yK+FFNtOhw5q
X-Gm-Gg: AYBFou0+OQrRF+3MuhbFoEUDgdHO4PksSi3bHSIQJjweWut7DztoWzlzxYBhAFV5qYq
	J4eftuRbyw9ghkEPDT2mqmUYhxbApaUAOKoLaTlUZ7y8wU1Aj1Gd+u5/I9zMfqEcFNOYlJBi9xl
	wDLNfllsTFEQnuAXgWduZ0MFuy4j8C+Voxbm1OdSVlqTQ22Ea+s/ruy2twFOtjyuTqSA7F89/o3
	E0iZQRK4sajEd2B2+njce+Byeh+hgJdZVHDlPk5auaNuKOuNDoWnjHtfJfKq06l3kqT25Nu0Sn8
	+vfJ8jpvvqybudZ18GZy6MioeELXkzQeDZQNVvDBB7o33HaQh0Q/nMWdoBDA/i+kTMNzWtN5H8F
	BTfilcywX3bBtlBPJ8YXKDFk+sf0CBPdfap5M+dcJLyqaL3ivT81mAZcgAKcS7WxHU8UCrJ3hzW
	cnC9sciJm4eSGsKFxxIPIRsbdkVQz4TlyUSyFnISvhKFBvTOwLgLQeE3Nf5GntHY/QEYVd8nY2c
	T9J8Z0mXF40hVdab4tuymcAj9/Ysv1PkJt0UtGd5wuAzo5zQrFKznvlW2VTUT4lgB1imjBkbshf
	qcSnN0rV9TQglZZ6rLcNdO7wnaPlbqPhZfBVMNgDKna/AIX6MuzXKV95wDxqB555KnEt1ym8eJM
	Kn/I=
X-Received: by 2002:a05:7300:c00f:20b0:36a:4ea9:19ad with SMTP id 5a478bee46e88-36a4ea91fd1mr23802841eec.9.1793837694081;
        Wed, 04 Nov 2026 16:14:54 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39972d4sm18304920eec.26.2026.11.04.16.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:14:53 -0800 (PST)
Message-ID: <0093d120-b966-4ece-be57-55a4751e17be@gmail.com>
Date: Thu, 5 Nov 2026 08:14:41 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-2-shanchun1218@gmail.com>
 <20261104-vole-of-legendary-plenty-811cf1@quoll>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <20261104-vole-of-legendary-plenty-811cf1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Dear Krzysztof,

Thanks for your review.

On 11/4/2026 10:03 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 10:22:01AM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
> 
> Looks like valid Sashiko review, so only few nits, not a full review:
> 
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 +++++++++++
>>   include/dt-bindings/dma/ma35d1-pdma.h         | 113 ++++++++++++++++++
>>   2 files changed, 185 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>>   create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h
>>
>> diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> new file mode 100644
>> index 000000000000..cd752571242c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 PDMA controller
>> +
>> +description:
>> +  This describes the devicetree bindings for four Peripheral DMA engines to perform
> 
> Do not describe what the binding document is describe. Just describe
> that directly, so explain the hardware. Look at other examples.
I will fix it.
> 
>> +  memory-to-memory, memory-to-peripheral, or peripheral-to-memory data transfer
>> +  capable of supporting 10 channels, implemented in Nuvoton MA35D1 SoCs.
>> +
>> +maintainers:
>> +  - Shan-Chun Hung <shanchun1218@gmail.com>
>> +
>> +allOf:
>> +  - $ref: dma-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-pdma
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#dma-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the channel number. The second cell is the
>> +      peripheral request source (REQSRC) selection, which defines which
>> +      peripheral is connected to that PDMA channel.
>> +
>> +  dma-channels:
>> +    const: 10
> 
> Why isn't this implied by the compatible? Drop.
I will remove it.
> 
>> +
>> +additionalProperties: false
> 
> This goes after required block.
I will fix it.>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#dma-cells"
>> +  - dma-channels
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        dma-controller@40080000 {
>> +            compatible = "nuvoton,ma35d1-pdma";
>> +            reg = <0x0 0x40080000 0x0 0x2000>;
>> +            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk PDMA0_GATE>;
>> +            #dma-cells = <2>;
>> +            dma-channels = <10>;
>> +        };
>> +    };
>> +
>> +...
>> diff --git a/include/dt-bindings/dma/ma35d1-pdma.h b/include/dt-bindings/dma/ma35d1-pdma.h
>> new file mode 100644
>> index 000000000000..0ddc99d29661
>> --- /dev/null
>> +++ b/include/dt-bindings/dma/ma35d1-pdma.h
> 
> Filename must match the binding filename.
I will fix it>
>> @@ -0,0 +1,113 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_DMA_MA35D1_PDMA_H__
>> +#define __DT_BINDINGS_DMA_MA35D1_PDMA_H__
>> +
>> +#define MA35D1_PDMA_MEM			0
> 
> 
> Hole
> 
>> +#define MA35D1_PDMA_UART0_TX		4
>> +#define MA35D1_PDMA_UART0_RX		5
>> +#define MA35D1_PDMA_UART1_TX		6
>> +#define MA35D1_PDMA_UART1_RX		7
>> +#define MA35D1_PDMA_UART2_TX		8
>> +#define MA35D1_PDMA_UART2_RX		9
>> +#define MA35D1_PDMA_UART3_TX		10
>> +#define MA35D1_PDMA_UART3_RX		11
>> +#define MA35D1_PDMA_UART4_TX		12
>> +#define MA35D1_PDMA_UART4_RX		13
>> +#define MA35D1_PDMA_UART5_TX		14
>> +#define MA35D1_PDMA_UART5_RX		15
>> +#define MA35D1_PDMA_UART6_TX		16
>> +#define MA35D1_PDMA_UART6_RX		17
>> +#define MA35D1_PDMA_UART7_TX		18
>> +#define MA35D1_PDMA_UART7_RX		19
>> +#define MA35D1_PDMA_UART8_TX		20
>> +#define MA35D1_PDMA_UART8_RX		21
>> +#define MA35D1_PDMA_UART9_TX		22
>> +#define MA35D1_PDMA_UART9_RX		23
>> +#define MA35D1_PDMA_UART10_TX		24
>> +#define MA35D1_PDMA_UART10_RX		25
>> +#define MA35D1_PDMA_UART11_TX		26
>> +#define MA35D1_PDMA_UART11_RX		27
>> +#define MA35D1_PDMA_UART12_TX		28
>> +#define MA35D1_PDMA_UART12_RX		29
>> +#define MA35D1_PDMA_UART13_TX		30
>> +#define MA35D1_PDMA_UART13_RX		31
>> +#define MA35D1_PDMA_UART14_TX		32
>> +#define MA35D1_PDMA_UART14_RX		33
>> +#define MA35D1_PDMA_UART15_TX		34
>> +#define MA35D1_PDMA_UART15_RX		35
>> +#define MA35D1_PDMA_UART16_TX		36
>> +#define MA35D1_PDMA_UART16_RX		37
>> +#define MA35D1_PDMA_QSPI0_TX		54
> 
> You should not have holes in the ABI or this is not DT ABI, so drop or
> move out entire file from bindings.
I will fix it.>
> Best regards,
> Krzysztof

Best Regards,
Shan-Chun
