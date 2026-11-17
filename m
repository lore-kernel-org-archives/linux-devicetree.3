Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906185;
	b=P4FinoBq9PE+5KOwQ2Jk8mc01b7Oa09RaWLuK/ad89xTD4Ktsj/jE8gKfdNhzH+cRv9n
	 UIiEWern2SPadntlv1DGdWsRVtZTH8OVEV0XxpMP8kpQRmIboVeo+TWK7wY56lyL6iNan
	 2na+9lQXQliByE5gD3nmZbft0VzEGZodMS2pOjl+NfVlvSXpgVWV66DQpJavScpkYrSfc
	 G1QEhz4amGIKEekVa/w6PRPdsK0rTytxULeKIjr/AiVQop+vE7NfdPHUogJU60xTNSmqw
	 Ky+G2t4SWGK+oDNKFMC2uOrNEtrVb/9R2/di0Pyuc2xJSDeQYWZ+yJO+S05/Vwy5XyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
	b=JvatuWBlR2YXQVfuXgLkzSU4fd1jYGPTjPJ+IYHiFAVv22Ctc76lXfwYTJF1ftarff2z
	 2N0JOPPIgXin7L2p06mgVgTPunovQkoffIFHDfk7NhpzNtKa7wYttAoe7OYaPtejeELVn
	 i/xjWGrZKWgLjKRqKKg/dFiNtZgWFE2JOjPnGwbD3cOp/D1aSxWc/Cx5RkdkCiP2WMe/N
	 g2rl9goRd0EaWwM8Evu+CsmTVV2anYnpsUKEbjjqnK66NFb60F8QHZLcZTHKs2hRF6r/B
	 tFyuKL4SEB04ag+UyjP1WEwoaBh771rQuNTKFi11yDUTeGftqwgHjqA0jaRaNUi8q5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P02okCnL;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D7B606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D7B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P02okCnL
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1793368b3a.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906185; x=1795510985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
        b=P02okCnLOX7GQFg/FdyY1inxehwiUGMREuCWwjos/1ThOA4/pD0rqRQNGvoKrmJBLi
         jrPE7mYXfKmBLqYxDEzlMN1iQMhpO4rwtnClO63o6PidRV6Q1UDy3qAQQet+KE5ddlU6
         GhMPJ57s47bvZ3aty0Os6yO50Sacp7WmosuzBY8Yv7t5hLtXVX2gJrio3Ya6i2aluIyD
         5hip/jBIn5QkgC3WesUImZ7jrwRLs3c4LK5lBH9plIYqZE0IqpOfDKX7BQSQ8bIX2xEK
         3QGA2uwm02LMchE9oMe8vExBqjODkAwFXg42qRk1OAl7RV8wd1gsbSz8qxi0HcWONXVk
         nPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906185; x=1795510985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
        b=c5cT0cnFZux2N56cqSTWSHH4Kc7/FTpVi0BZEXb1EjQmRYuDbOiXfm2sTKjf1nvTe7
         neRqMzKv2NvK6ZR02TSBHVKAU+Q5OmTEdesbcvgGiF1VInJ7PKJPCTnPqSy8yn6T7CVV
         kmoEyo31s3NDBAQAPHNEV+u2gqCSMIQWO6c2EmG2cEGZL9C/Ffwj+6qO/WKDNEUB2BHg
         RDGGsryzbzFH6lwUbQrrNdBt5WgH21XIcHL+E4jhpK7Hd+k+HwO8tDR+4W9N8gDHnehC
         fRXNva6zdo4JyGJp0FJSraGDpcJF6vwDy/mHSXEgSbkTFFxC8NFql/PwS5gEx0xhkT8Y
         RgOg==
X-Forwarded-Encrypted: i=1; AL+hErHmAVCfwAfnQvgcb8OwIBJyj0ZEAjk2sxxJug8hxy+nEYgJbGGW49GAfzt9v/lrdhLNb4wm+FO86LGr@vger.kernel.org
X-Gm-Message-State: APuU4Z+zRMDfhF2Bas1rHbgcZDu4z4ccWWxsPbc47b7xhl/MdZTwx+zM
	V1mrm/PWP7JEexNx+flUEgmcXUURY3txogalfEJIoilxKaXUy9Nqgd8k
X-Gm-Gg: AYBFou0jn9MO572kgvQYR9olHv+7d04lWPjotK1HIQBTlTyOIc211a71YQ3wMJocVVv
	iHJyPIl6zIs2OCukXBaYVYO1YBzph3ZoeAL6WkjjtOuGHIb3yEOp0CImQTVcEvJKXiPJdihUF2K
	kK9kllEys6q5Y2mYgsIUIMn00l2X85JFgtTRxNTyVIVcvF0hCp/GNNlP3FmrYMtnhW/EvXMUKdo
	vLDX4XbfmekczIEwIoeh7uQgtzhH7QXR2neBe17yUhST12bjb2D9HGpWT5nKMyxYkJexLe7Ykkm
	sftg0bhxb+3xjsUnob19Gnm0G7lLZIufa1TlxR6ojP4KZurcQB2fGFEDI6GlIedT3J6XdLH+sjm
	k5XNTpbVwk5D08o0wrD2o0sw+5WzH7tk1PBiXB/eSwtKp80XRUz0xHnVnb779tsS+SvAwV3gba+
	dlS0aXFXE5hNPZd0MWoMSYMOSWm6h1PcmjBwBYFHUyDj257Ls4vgNF6ViB+kG6U2DeVQhh/yhNv
	w8SeNyUW2e2KYFdVaJpK1SSPa3FMY2kBPhKB2YSEe0Ot5I07Asw0F+UnmgjoIZ/uKBsu/xXy/tg
	UesOYuR+LqKRxYlF2Qlqrz/7gSl+xst1imp2i+TXGMvyxqqihbatFKoEjKOA5BVpA4mO2ckQ8W6
	vnfVMSA==
X-Received: by 2002:a05:6a00:1c9c:b0:89d:5a80:5256 with SMTP id d2e1a72fcca58-8beb56cd05amr11614200b3a.9.1794906184648;
        Tue, 17 Nov 2026 01:03:04 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2a20fc8sm4517468b3a.49.2026.11.17.01.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:03:04 -0800 (PST)
Message-ID: <57e46e27-db98-4f9e-a657-1f224d3428b7@gmail.com>
Date: Tue, 17 Nov 2026 17:02:45 +0800
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
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Frank Li <Frank.li@oss.nxp.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
 <avtum_vwVClf7xhE@SMW015318>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <avtum_vwVClf7xhE@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank,

Thanks for your review.

Best Regards,
Shan-Chun

On 11/17/2026 4:59 AM, Frank Li wrote:
> On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> new file mode 100644
>> index 000000000000..d05971662a5d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 PDMA controller
>> +
>> +description:
>> +  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
>> +  has 10 channels and performs memory-to-memory, memory-to-peripheral and
>> +  peripheral-to-memory transfers.
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
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#dma-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the PDMA channel number. The second cell is the
>> +      peripheral request source number, as listed in the reference manual.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#dma-cells"
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
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
>> +            resets = <&sys MA35D1_RESET_PDMA0>;
>> +            #dma-cells = <2>;
>> +        };
>> +    };
>> +
>> +...
>> --
>> 2.25.1
>>

