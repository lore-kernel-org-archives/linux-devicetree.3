Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2872E7F25
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817578; cv=none; b=Z/9foyXVFwktCQJr1oTvEQ3SqSxQCR1XrwnTVBXBSb8Dnb7eG30EIhNtRkO9E7fTbqxCbIRN4o/IbOe4gG/EtvNzLA88iV8iObWGdCQVfeGPDAj4zBMU1ZzYu3BNCjbzqcnS1a8v28wWAYADNZdxqmR1uNxePBPDyg2aa+qxIKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817578; c=relaxed/simple;
	bh=AhF4RXSyKUiCoAAAkiY5QzzA273/YmWbFz5K0WcWd3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1SghiAgpNytik/b3SF+4otAeiXC2fAIYUUmGB0zqPv51acR67Ou+vkCVY8PCbgzCRmJN6joPw4FVjJfvDwY5cpMeuOkR9D4sshv/fTDiNPUxP2XrFqS90S0OG0fxIbcK4sX0cimsvRLb/pVVAsZm4kKFZ4SpjWcrvQHgQ3npjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so1584690e0c.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 00:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817574; x=1788422374;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=veOq8nn5oPUxcnaWxlmevqsZxizj+SHbK8Mk08fVSFc=;
        b=iX/eLHcQcWfHGL4Cu/SpmVj0pBXjTUH7MQzR7hqRDdKqJfsrn1/rl6eYsGg/qtA6pQ
         5swOlk1y9SlOfU++VSrEhYuVRwwC8aqRfksFiU5gyu3xhQbAMQc7IkBcaVjCqq33k11t
         G5RWSXk3/JG6CnQKpPix2yXfTpfIDAWFbg0tNllRXk83qSim8dllHqZ1+RAgZsDps0oZ
         SuZcqdMIrxlkOus1y75xNTuxirSs3Y4+s5xbL4xUrIAIRIvhDGOuRnxn+jBbOaivzjmG
         8+cOLgVljbUhejhya/Ia7cxpSf0u/nODaj3VT7KZzpCi1MCVQ8FRXh9MTl187T2weLxR
         SFPg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4D6JfP6R3BWg3I/ZmRZJctM1dy4HWNI6Ax2ccY1j85XGqxBsoiz7Ce0Ewt0lQsgb3/3mkYFMN/Ymo@vger.kernel.org
X-Gm-Message-State: AFuF++kkutkHPFGF0tEwKFEcKMVyySgCCCk7M4X0KNoheJYy0Haj28Sn
	0MANlKdLtUXPPuLJMlaqinZEztAyJWNf5vB58/LGgGvTk7Vr10hJBb0Ts+P1lZpk
X-Gm-Gg: AR+sD12tVyryWkziF+kzPI1mgqRMUZ+LxybarJDQc3mdtyZdTHYbofcgNwCjU1SUx3Z
	RWm+VCg27WQoKY6urC9fyYfufIgk8yhh0qNIifU0ZwyQJBNiCzsuqxXwndw8em/dFuXv2sEXOP7
	PD2odW5REyJCUaYk6kFGiNkbb2zu+L/+U9Z9kwQBhAhNao1tKE1Fc9R34GS/m3Sq4R6x8S7pEEY
	hjMbZByqUr/fjxJqCsJqizaQoAL6QbXW4T9ldrWuoualBYQ1nkug1CBDzD+UIAIbmKwnzn27Lrm
	VJJQS3gLf6qEZgXq2P+sTOLNrLxT7/FumRcyzBpnQ0+1kEgBQl/m4DkEgo2yUxFSC/cZJZsADPi
	Qo6nCBPzh6UkQO/HK5wwKFolWWq16Rk438FSNy8gRqyrheozQSrr6Kk6FV9ao0i2N2GBMrqKqeQ
	WBN4JHOdfaHddEU+txyTw+i7REtaMrvyT1miE7KjVTVjnHwmQgsgEG2MFVZisu0/VOdYIQ2Rq3R
	IDbXCrtLx2bjtSJaSjPZQVRFA==
X-Received: by 2002:a05:6123:2e6:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c65ba40e65mr6208806e0c.1.1787817574034;
        Thu, 27 Aug 2026 00:59:34 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe30fd79sm4121162241.8.2026.08.27.00.59.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:59:33 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97bf8e907b0so1061320241.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 00:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RobjE9eaCPWI8LN/9wznCmetMvbT24YPo+61+yeoBPcRarHBlQ5MGsG9F+JKVoha1VX8F3TpKDNB3wV@vger.kernel.org
X-Received: by 2002:a05:6102:162b:b0:778:459:f215 with SMTP id
 ada2fe7eead31-782bf9a8e38mr5448748137.3.1787817573651; Thu, 27 Aug 2026
 00:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826083524.6056-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260826083524.6056-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:59:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com>
X-Gm-Features: AcwNN1WaiSSDv-J3T2K0-5_UW8SuowFlCQq_EI49heAklJYMtVZ13OyYfT4lCnw
Message-ID: <CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,rcar-i2c: allow 6 DMA channels
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 26 Aug 2026 at 10:35, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen5 can make use of it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> @@ -83,14 +83,14 @@ properties:
>
>    dmas:
>      minItems: 2
> -    maxItems: 4
> +    maxItems: 6

Shouldn't this be 8, as there are 4 SYS-DMAC instances, and I couldn't
find a limitation w.r.t. I2C and specific SYS-DMAC instances?

>      description:
>        Must contain a list of pairs of references to DMA specifiers, one for
>        transmission, and one for reception.
>
>    dma-names:
>      minItems: 2
> -    maxItems: 4
> +    maxItems: 6
>      items:
>        enum:
>          - tx
> @@ -137,6 +137,20 @@ allOf:
>          dmas: false
>          dma-names: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rcar-gen3-i2c
> +              - renesas,rcar-gen4-i2c
> +    then:
> +      properties:
> +        dmas:
> +          maxItems: 4
> +        dma-names:
> +          maxItems: 4
> +

I wouldn't bother adding further restrictions, as these are not related
to the actual I2C block, but to on-SoC wiring.  DMARQ is just a single
signal going from the I2C block to one or more DMAC instances.
The number also differs among I2C instances on an SoC.

BTW, all I2C instances on R-Car V3U have one DMA pair ;-)

>    - if:
>        properties:
>          compatible:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
