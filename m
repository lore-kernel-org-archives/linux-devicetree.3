Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E982F387364
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090065; cv=none; b=J/omBLi9IsFjjemQ62wuMHMOCjc/a47iXN7kJgGz6MqrLV2yal8g/NkrHMmFItHvEPOAh3FEQwnUVGg8Zx9XM26Wx/u2jW6lLMiFKx1Vk7x3x+GWbUOW+Y6OwGBl+0ZT3kluVlzVyZ97ExHuyDEoJmJOFg4JmEaFQPiIzC/Fssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090065; c=relaxed/simple;
	bh=mKPAm9lSrRcV08N0bMDOn/x6I0AzKpQyWCO4ViNMFDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/96MkBIe8tOhjvgqOX7A/IJsVzkdAY99Hyvw4vJZcnpT6+pRwCID2C+ODS69czSVKnEHiCbGNg2UnyQ5at545laHHgV767ajP5y5UQB1aASVZQgHSoHWzsm26io9EpQwUVV8o3JiOmSfLKHE1LF9MAuhM59DRIHVuHYR3Dfg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c9031e714dso1648989e0c.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090063; x=1790694863;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGvRLKavNp07IDObK0x4MyNXPYCHC6J8E0NCLAikfuA=;
        b=pndoJB+eJST0N1F07+Z1M003x2Pyv/Y6tI8iSMD9pHwHEFhzIZTXhtG1S4RDyGcE/L
         bnWEy4FNHAGAz4Yjl9cjjg+wMguwzMz9yCLM5B/64E5kKFTzquKFPnXRxXMbUEb/yLVO
         WZGssccPs5b0TEmscsA8TmxHLowqwZmuTwMGLsW7W5SuQstcpEGD0EJyhck9c/WryedS
         EWIg/hClmlSdVfjKWP2dFsP+0e9mONZq9mT4levy6Zrxsc/wgwhy5r3+Fap+c6x1h43E
         7LXDEw4KyEEd2InkEj3KMLXWgSp5ldDwua2ZTWfwnGrEqWBqyAFMZLDR9ARDhkNDU8R1
         bUCA==
X-Forwarded-Encrypted: i=1; AKwUvBy0LeDFVYrAHj0JBNDf8COEYBQAqvtdCbUWE7aM7lrkRQD5hSdMdC7b+4OqKiKYAxLaZQggCGzZqFwS@vger.kernel.org
X-Gm-Message-State: AFuF++kQ7Ue/3ZchfIJS8/Syg2DWIpDYfSL0xj4A38w/PSLAqgGDJOax
	7gbuMgA9Y9Zvs7n+mRNXoMrf9AxkgAMgkt0LhSjB4c4CZkxFMrTQOTaCneG6Ji/i
X-Gm-Gg: AYBFou1nicVoqDQC+oyDrjPqGWt/T/mfZqMsA8h3ecYHjw+rgVTJZKGQRBweTC5z5z1
	9E73A8alyn2xb+ikxcSt0n0wtcqUhMIPcTyVeRPN70NTgxcuiIN1/D3PKu8dkWKdcL6bEUFCwc2
	uMdRmxNVvObWbBERZRmM8Ox/0v2r1j1laPKT1C+GUBti3tWjFuqe5856Ch6LAix/QKGM04t75mM
	chr4V4zSNIWVdK+9Q/2CAD+Ww7S27ucIV6sIvJ3yqYSV8t2eUbzA/7YaEFhwtc0Qv9rfD2NDzLP
	rBemuF0P9g75lVHsUZiX5nR74yR73/u9eurEO+55IlhpeR0eF1a1KMfp6ykOVgW5taVksTi1O7r
	YlfPIx6e8q9pQUrxlg+xxJ879vTsE9Ia2YqqXpB6iKTUgx61CdcLYtWV4ZCKg4QtcJknZgy4udF
	6XqYpWGU3NW41oQ2NpynQe6N1yWq9cPO/yWYHAf6i2pGhADIAA0QTq9Q3+8hHAOVRb/GKaZ0vvH
	/3hWkcLT0bAyFrqhrE8r7czNHkpsVjJfWsM
X-Received: by 2002:a05:6122:1d55:b0:5c9:c60a:e9b3 with SMTP id 71dfb90a1353d-5c9c60af4c2mr7231871e0c.19.1790090062685;
        Tue, 22 Sep 2026 08:14:22 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f5b93sm86738e0c.8.2026.09.22.08.14.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:14:20 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so1567954e0c.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:14:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2/W/T2l2PSrW4aDUTqOowkZgTcTMPZBDMemboxU5EY62sqy/+mFb3BODDuuwEgvqohZ6PKhiMuprr@vger.kernel.org
X-Received: by 2002:a05:6122:6b0d:b0:5c9:c60a:e9b7 with SMTP id
 71dfb90a1353d-5c9c60af4fbmr7493050e0c.23.1790090058750; Tue, 22 Sep 2026
 08:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com> <20260921131951.187981-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260921131951.187981-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:14:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUx5-P97CFEH3Dif1g4K=NPfkDkE=3vrzjZB-TsyxqO8Q@mail.gmail.com>
X-Gm-Features: AclHuK-rCbm16AlWI6NRQzJvntZXC9gv_oZQlkAlsfHFavMScH5L1qYsY-ROQQE
Message-ID: <CAMuHMdUx5-P97CFEH3Dif1g4K=NPfkDkE=3vrzjZB-TsyxqO8Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: can: renesas,rcar-canfd: Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the RZ/G3L (R9A08G046) SoC support, which reuses the
> RZ/G3S (R9A08G045) CANFD bindings as a fallback compatible.
>
> RZ/G3L has 11 interrupts and 3 CANFD channels compared to 8 interrupts
> and 2 CANFD channels on RZ/G3S.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> @@ -47,6 +47,10 @@ properties:
>                - renesas,r9a07g054-canfd    # RZ/V2L
>            - const: renesas,rzg2l-canfd     # RZ/G2L family
>
> +      - items:
> +          - const: renesas,r9a08g046-canfd  # RZ/G3L
> +          - const: renesas,r9a08g045-canfd

I am not sure it is a good idea to use RZ/G3S as a fallback

RZ/G3S:
  - Selects receive message according to 128 receive rules,
  - Sets the number of receive rules (0 to 128) for each channel.
RZ/G3L;
  - Selects receive message according to 384 receive rules,
  - Sets the number of receive rules (0 to 256) for each channel.
These differences are not explained just by the different number
of channels.  However, it's not clear to me what is the real impact.

> @@ -270,6 +283,11 @@ allOf:
>                - renesas,r9a09g077-canfd
>                - renesas,rcar-gen3-canfd
>                - renesas,rzg2l-canfd
> +      not:

Can you really stick a "not" here? Yes, apparently you can.
Still, I find this hard to read.

> +        properties:
> +          compatible:
> +            contains:
> +              const: renesas,r9a08g046-canfd
>      then:
>        patternProperties:
>          "^channel[2-7]$": false
> @@ -292,6 +310,46 @@ allOf:
>        patternProperties:
>          "^channel[6-7]$": false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-canfd
> +      not:

Likewise.
This one can easily be restructured like

    if: ... renesas,r9a08g046-canfd
        ...
    else: if: ... renesas,r9a08g046-canfd
        ...

to improve readability.

> +        properties:
> +          compatible:
> +            contains:
> +              const: renesas,r9a08g046-canfd
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 8
> +          maxItems: 8
> +
> +        interrupt-names:
> +          minItems: 8
> +          maxItems: 8
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-canfd
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 11
> +          maxItems: 11
> +
> +        interrupt-names:
> +          minItems: 11
> +          maxItems: 11
> +
> +      required:
> +        - channel2
> +      patternProperties:
> +        "^channel[3-7]$": false
> +
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
