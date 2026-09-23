Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E35251CF76
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170955; cv=none; b=AFPCqe1e2OaPexts0WhrLYwApp7uDTBpFXozs3pTN4QRjqi9d6owEeb+SkQ1qo10aRXC9+WOaWuPkHIJpVSNlaZI/sw5cAxGxDCWPNwPO/73+TtA3f4ESwRKYeXEftbVnGRVJsviLE3g1ydKxF3ftL8V4XWcPFiB8UyguzwE+0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170955; c=relaxed/simple;
	bh=zQLNcKwt8lnNKrUhZWYc0UbpzKFARTsV6kXIZiSRVZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqt5Ffq376b4LLaCeaMAGRFZ1iI3OTEAhz5OIgE7VG4z3rbeXOQ9YWetqITei7hjdqSZ8BxpfEskZCdWccg07wii3UPhfy8WSMXS9fNEYB1VPOQb36H/cDctac2c0UF7VNxr0/6M8fztfQttW2cJLg/qxFci6qU6Z5SbcfBsLXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9b0bdf5b5so414758e0c.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170953; x=1790775753;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cZcaHlSLoWG/YlsEmorJF69zsl7G8OYYQpV3ToGZCjU=;
        b=g6IoBtqZjp9OcOk6s29JDgRUoCHKPbHx1Ll7+iODpsjsxVVoBlj24rAyO9d4HioFfK
         LnwvUUG/UIImmbWh4Xh+fYJl0sqWEMbgZ6/MOFLhfkwjx1Apv2cgjmNTXh38Mt+XUXWj
         E7m3gtKz/6QjV6SdbCEZJFhp6BmtMwrIqKOG7by1IzniA8fLT3SPykALT7S5KlMolVUB
         BjaLYumJDDyDuPAQElo5DPOQg1ldat/sWjvF0wYoM/dzSAh6JgKuya3h8os12d9ssNyL
         OCh9PBDuj+gtZogDBfpxq0nBEX6Vqzh/g2zEjVy9BN45vbwTB1eSOi3Qx+yaKCBCqsGO
         h7DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQYjeErSTOpwn0ptj3vXQotUQqF+ZyCoPILLQX+7HJ6im8TxCyZXZ94f6fZShCuLMasgNnt/USn2+f@vger.kernel.org
X-Gm-Message-State: AFuF++lgBExq9DvPt3ddT0SusMe+D4AN8dWSjlBr9kj4BKmOLDue8OkC
	haVcgcT7nl4+H56TiQxY08vOXJxm2nSMQO/EfwnZxMu2+BaIKvIqgN2WSyuylIIbpZ8=
X-Gm-Gg: AYBFou209ebhVXekYJVzLxc409Q0rkUXWrQC4kZPgSIVQzlA8QrlWeOO+L1XPqMqOtF
	+5PWaiSJ5WodlF8kVUq6IWvxH9yJTSsABtFmsGAIO9Vbv/KLVUjSBUl5k842ghl48nfw2yrY3um
	CJz2SzvMoU9JccftoPZkXcUOf8vkPbh0xxWbyCG0i3plPEsWBLLN3t3cfTT1nj1N9WqLwf63u2h
	WFO8+Aw5XdT2nwq4qtPNcULUX8wptzqEh/lw/zXPKwe8dFD2j09elZrJBFz3NNvLnYO/daLmsm5
	8oyKIKLTsWvc9dIeuZ/oTEL6yrJq8Ix9MhvNO56gi2pDrC23czAtu6YrpHmHlXrfhx+gfhPZYPJ
	o79XxkSoHc5pZ7JH9yfLatMKqb8kvjaO3uklrAACa8DgwQpDa87EB6x5PgNFWPS9ZiAuj4f484d
	nVuKTNTe5mlCEA6TWz7/TKdjlLMcRjgaSbbUYwwulwZA2LKAG2nQl3GTjrqSxRjNNOG5fnnfUfK
	jzp139G+lp4jXZ2QwZNAdI8MK0fAI/VWNapTQ==
X-Received: by 2002:a05:6122:8f8f:b0:5c9:c60a:e9ac with SMTP id 71dfb90a1353d-5c9f168ad35mr2923319e0c.18.1790170952298;
        Wed, 23 Sep 2026 06:42:32 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cac7115b29sm20111e0c.11.2026.09.23.06.42.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:42:31 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so302493241.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqo9cEFV1GKbK3+kuK2hFk6L5h016ykL/XwAW/m6xvvxnNdxtxjHULmlGyBc7Id12WueEkDGfJbGZP@vger.kernel.org
X-Received: by 2002:a05:6102:390e:b0:7a7:195a:1b26 with SMTP id
 ada2fe7eead31-7ac1de3a707mr2471914137.32.1790170950472; Wed, 23 Sep 2026
 06:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 15:42:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
X-Gm-Features: AclHuK-TckegHvHKUKBwHK2truVsVTBXY6gTl27m7I0mB2ihxriiWdVUDyPODHw
Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add bindings for various SolidRun boards and System on Module built
> around Renesas RZ/G2 family of SoCs:
>
> - RZ/G2L SoM [1]
> - RZ/V2L SoM [2]
>   (shares PCB with G2L and has very similar programming model)
> - RZ/G2LC SoM [3]
> - RZ/G2UL SoM [4]
>   (shares PCB with G2LC but programming model differs largely)
> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -508,6 +508,14 @@ properties:
>                - renesas,r9a07g043u12 # RZ/G2UL Type-2
>            - const: renesas,r9a07g043
>
> +      - description: SolidRun RZ/G2UL based boards
> +        items:
> +          - enum:
> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple

As RZ/G2UL is pin-compatible with RZ/G2LC, I guess you could have an
RZ/G2UL-based HummingBoard IIoT, too?

> +          - const: solidrun,rzg2ul-sr-som

Is there any special meaning of the "sr" in the middle of this and all
other SoM compatible values?
If it just means "SolidRun", I think it can be dropped.  However,
you already have that for various SoMs with non-Renesas SoCs.

> +          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
> +          - const: renesas,r9a07g043

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
