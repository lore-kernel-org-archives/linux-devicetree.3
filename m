Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF553A759C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433233; cv=none; b=O7TdHnJfR1CgajvHfD0veu4STkU7M2GFsovoJ1rRyjVl0WQ/wCbce195+0dVcUDqtFCXQYMHlHgjjaJjagVnfA63TnufSvw1pmaaVbDxCOClyNKFf/hyJrwdgbmxf9BfBwr1VsrCNXsTaA5MwlUdTgvSAaHpk/YPs2emGAM7yaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433233; c=relaxed/simple;
	bh=apamlTRhsBViFoeuvdnfL5b+zzJNBiDoYI4efu08/KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLFUH0SOagOs9Ro7IRiv4+YNAuhfm1JsPCzvhKgURnYDfQxnYaB++4+qbt30sGorFG29RmjmlKic/GKE6DI6fvU7HDRl8Z7Nyxr9Yx/0oRNs1PLnQwWFU+BgiyZF6rW2lmnzrXHRWgK0wbYK0VW/u3jsz5aq2Cztxvl7PGqez9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fWKRmQCZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fWKRmQCZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso43222135e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774433229; x=1775038029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spPSeOBKCjDbgacjZSL9Rf9EOaB+Mz7lDWKQPHUIwrI=;
        b=fWKRmQCZZKxerEQ+WvLKH1nEKuw8Ebx+17+zsRwFxWCYMdNbFlCKwoCTV5oo75PGNB
         z7RHlK9t/aWlUOgcSghYvqjWFrAbquBW7a9yA7RHoAM09sVB1IeS512TE63U3aB0UFFJ
         yoRSgT+Y/4zOMP9oaL5pIzyRz5JgTNllbjqrgT7pN0GAfNE19Iwi9PDmwtDRP2Qo8zJ9
         pGLyDxDRVl32rqkFodMMJ/cSc586Ad57EisJsWStWcMlXf5eXnJd8DeSVRCpJUlrDpy5
         g/Ohx6Mldxi1LG7HymiMZmYen3y93EDUYhGK30HFY0XY6oAqutpLTwQxT8hyN7QBFc/o
         R1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433229; x=1775038029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spPSeOBKCjDbgacjZSL9Rf9EOaB+Mz7lDWKQPHUIwrI=;
        b=pRruF8zbguU4o+caWwLWgJUvRjX/RK+Ff5mQy1dv13mTq2ZJVHQgQOe80A77xRSRtT
         1iLiaX07OSgJpY3XV5fgRQlcISXRoWmwcnYc+7pFT0eUw3cSRLR9MuBWUPgOP6ZoVrhY
         y4IM5cZcnVEEWMHFtGj0C0bVE0S8yee0IihTzPJJ6fdQxFzGQAf/kfEjh1kANV0keMN8
         fBL6g6rknfrpKZ3NVxPubBvjNg0WPBIioWSm6kLN8B6PKM20pJYxst0yth4HIawgRZyX
         a+2bNvMIzoNfV2m7llMt2SfBFkv3RcCJqj76C84ZgpVQOyCGqUkB4FofcDx8tvjkaqDq
         ShbA==
X-Forwarded-Encrypted: i=1; AJvYcCWwqC+4DwiCt9VtlnrdXhPz/Ez/AadTrzZvIwiYMqfor/VHp117++xGIsCPLaAzC09AR8JZ3R13W+qR@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLpmmvNFcF2ppcWxq6EfhTs9LnUuK/WhbW2VM1aMOvhsnoE+V
	Gw+ODa3kjjFwaoVouCsughKoV1BvI6bzokJV1b/5oKDB0Zl7caP8M/OHUqWe/L9LhOg=
X-Gm-Gg: ATEYQzzxXj46I8yvpZv8jRYk6QgLi0VK2dZTprHpfJ9sEqfYhKcVGShI22Dc/+Q3z2i
	xkhtHcj/bLhPgwzsKlAjZbfU0D2R1xHg2ri/Pca/dir2ZTrRX1sTCI+Kx4eaAN1rQBX5ZMZXfgl
	VcHsSdubIxZVbhxJ/WO6uB5u/XlzOiI0mDsG4BRFZmAs9rFj76W7VC9Ze1/gldoe0Et2jSjjotM
	MQ68/nXN1AlghKx9l8OB1SB8oUMhBB//RzYujOoLuTBAjZHEqdEsqlQrK7HQotK3HBtn1cC/v0q
	n+Uqy9xgzKMmPbwsk8KsRPx9R6/QEjfCyv3lnTgoGUMmstbsT1oj5KwED7gHbprMH2tkl2cmm0l
	b9yST3pyU4ae2wu+MXQJZd9NbZsfk0d2nAuj7Y03HK+1bLMQ3pjj9eTSdM/OSIpVruZUFo/GI/6
	fLUoWFE8qpV9meArIT8GugRFWNHjiRH+o=
X-Received: by 2002:a05:600c:5020:b0:486:fc61:541f with SMTP id 5b1f17b1804b1-4871606c94bmr44650615e9.29.1774433228747;
        Wed, 25 Mar 2026 03:07:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64711f58sm47028348f8f.29.2026.03.25.03.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:07:08 -0700 (PDT)
Message-ID: <e0e4085f-4a9d-4ae8-80b8-d798c8408d84@tuxon.dev>
Date: Wed, 25 Mar 2026 12:07:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: pci: renesas,r9a08g045-pcie: Add
 RZ/V2H(P) support
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260318124450.163471-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Prabhakar,

On 3/18/26 14:44, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the PCIe controller found on the RZ/V2H(P) SoC. The
> RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
> additional registers and configuration bits for PCIe lane control, and
> supports multilink operation selectable between a single x4 port or two
> independent x2 ports.
> 
> The RZ/V2H(P) SoC supports multilink operation, in which it provides
> two independent PCIe channels (channel 0 and channel 1). To correctly
> configure the multilink mode and per-channel PCIe settings in the SYS
> registers, make the "linux,pci-domain" and "num-lanes" properties
> mandatory for this SoC and restrict their values as per the SoC
> requirements.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 22 +++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> index 858ec02e6d62..57807d0abd9a 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -14,7 +14,7 @@ description: |
>     with PCIe Base Specification 4.0 and supports different link speeds
>     depending on the SoC variant:
>       - Gen2 (5 GT/s): RZ/G3S
> -    - Gen3 (8 GT/s): RZ/G3E, RZ/V2N
> +    - Gen3 (8 GT/s): RZ/G3E, RZ/V2H(P), RZ/V2N
>   
>   properties:
>     compatible:
> @@ -22,6 +22,7 @@ properties:
>         - enum:
>             - renesas,r9a08g045-pcie # RZ/G3S
>             - renesas,r9a09g047-pcie # RZ/G3E
> +          - renesas,r9a09g057-pcie # RZ/V2H(P)
>         - items:
>             - const: renesas,r9a09g056-pcie # RZ/V2N
>             - const: renesas,r9a09g047-pcie
> @@ -220,7 +221,9 @@ allOf:
>         properties:
>           compatible:
>             contains:
> -            const: renesas,r9a09g047-pcie
> +            enum:
> +              - renesas,r9a09g047-pcie
> +              - renesas,r9a09g057-pcie
>       then:
>         properties:
>           interrupts:
> @@ -236,6 +239,21 @@ allOf:
>           reset-names:
>             maxItems: 1
>   

There are empty lines b/w the above if-then conditionals. To cope with that 
maybe drop this one here as well.

Thank you,
Claudiu

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-pcie
> +    then:
> +      properties:
> +        linux,pci-domain:
> +          enum: [0, 1]
> +        num-lanes:
> +          enum: [2, 4]
> +      required:
> +        - linux,pci-domain
> +        - num-lanes
> +
>   unevaluatedProperties: false
>   
>   examples:

