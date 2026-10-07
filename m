Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B548382E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369339; cv=none; b=EtVytyDJxcJVDetUzLBteCXzJxSiLvLxCS4RlsMrsHZ1WGbjQmryk5FfbaBb1lNco3Lib5w+H5S4iJbOn88tS3Wp9hPzNSp7GfXQgfNbHIjvUzzUNbv3fokcabTiBNaGzNwtr4Sj0LvSKUWqiPxn8MkR0+NZECJniKkprQRaTN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369339; c=relaxed/simple;
	bh=VfWUNXmqwxTTUICoAFmFvG8CY3df8em8roJTzWczRys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIARUE8KjdNGenLs5GfvHCpQkhHULoe0MjCDeB9l2g8zxoJj2trfB8S6hW1JKC1doPuSJh6GGDXKXZqyXRIixviTAtU+/SonXKvHF/tm9++JQBXMoUGKXaXLBu/h0IGB386ixu5/JsCtO1LLU9sHXAYPTgYicprx7CqhUG49oSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac551be4d3so16944557b3.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 03:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369306; x=1791974106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WbqPTpVsUSqxzGbhEjJKYLBCr4VtJGNv2jZWAZtG8M=;
        b=pPqpm6wzjeX2yOyd2tjXNptOvjcD9cTCoeCNfiiBG0P5u4VwfXFrnQKvFEZGBsU6H5
         7K94g3gQl8uRNnMlRkirFxa7SL4hixsnsEQVvkHtCCw/BmiSERhLq3fo5N/zz1NfxcE5
         KUFvH69gWYbB02TgcJhQqt1Yx4jbDCli+IB6biDtgmCqLHA3bYLFKT0vLq//cantm00X
         mLDZH5NIeRxP7b74HQcqlPz0b7tG/MOLknbMNzJ6NViHPy9YlPTPl40dZbA7RiAb/Xc2
         +kgmmAN/DZTDDff4ZTpt4jGPiepJb9mCMiaryeNL/Ec03y/ZThbqLSgmbcWjwnkko9wf
         2bzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy82BIZ5UEfqVyDzrA9UYAH7E1ppyhpliYbOqpGe1KV0nJ1lhHA3Sj0CR/fH5aZuXyg+pHWElI79iDH@vger.kernel.org
X-Gm-Message-State: AFq9FYLLA4QqsA4os6HS1dqoLHmClzk7hRT5nZOb2NnfaObIJLWk2v2S
	Aqyf1Qtn10wFH3TkSyx5NzeRJmNPxLqcuvos/WIF0YNzEZfMIQ5puEsiC1Pv4j9D
X-Gm-Gg: AYBFou0bLFq5+8zrfLHDPw0jqF6hkog428pz9BfSBWBS4W+8yB7QBB+dRHS6Um4AM7R
	F2FxEkDeKLR3rleZMcZ7LkACxYQRq3RMd73/OsHu1uXDr6l4oWwqpwQ0mdCZcteoE0CyvUHOwA7
	34ZvLHKZJIFwU6Eydnnd2PZp/x7k63oEjhYloOWwyzUuXqmb7i9sEeTzpcbycoJ/HzgzJuXNGqL
	KaoJx8Wn79s4bML7JQz0ZYMcuMCn94yH7mLxmiAfhkUr5kfyWKyjkILO0OGHMvME68Eeb7DHR0z
	/w48TPec27xuVgGAxIt23lx9hemSYhvb8oj6iccNhRifVJTOR/pF0cCpUGSVTfsjensRIXJIWI5
	qvWMr1ValUEJlFh3cY3vWdeqFSyghDFAgxky/cQsDot11WUx4SVeHIPjAPC0vvnLUuePfNSHscK
	W23dohaM508elfoqr711urXiIeLSPhfikGPpUA04ITsPWKy9Ku4HJGT8b+iZ8itIZepEfyIy86n
	vqkjh9/y/qFhveWfPdmCxOoJUKbn8NPX6E=
X-Received: by 2002:a05:690c:6d81:b0:8ae:b617:7138 with SMTP id 00721157ae682-8b05aff184dmr18333047b3.49.1791369306248;
        Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05abce3afsm6984737b3.36.2026.10.07.03.35.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ac551be4d3so16944507b3.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvRZ1pkoGRjFkl5VGlcebSy77JUxP7LzBJWZTzwSupc9ospsR/zTU1wmxbUB8OfA7fnf3u5+70ynSt@vger.kernel.org
X-Received: by 2002:a05:690c:c748:b0:8ae:c60c:57ec with SMTP id
 00721157ae682-8b05b04e271mr11794257b3.61.1791369305826; Wed, 07 Oct 2026
 03:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <20261007082627.63807-4-tanure@linux.com>
 <asYWEwjFO8g50o1i@squawk>
In-Reply-To: <asYWEwjFO8g50o1i@squawk>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 7 Oct 2026 11:34:54 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
X-Gm-Features: AclHuK_YBbfO7x4D_vDdU1kkRmRoPOMNGgSI5fmJQcVUylonsGY7I5HRmHvp2sU
Message-ID: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 10:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Oct 07, 2026 at 09:26:23AM +0100, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A, but the controller
> > reaches memory through a pipeline stage that this SoC inserts in the
> > bus path. That stage has a gate of its own, which no other member of
> > the family has, and nothing else in Linux claims it. It is therefore
> > switched off as unused, and the port can then no longer finish a
> > transfer.
> >
> > Describing it needs a fourth clock, and the fourth clock of the
> > existing list drives the timing adjustment logic, which the T7 never
> > uses. So the T7 gets a list of its own with the gate in that place,
> > under the name the SD and eMMC controllers already use.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
>
> Didn't I ack the previous version?
Sorry, I didn't receive one.
>
> What changed?
Nothing.
>
> Thanks,
> Conor.
>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index 90ef79161ab1..96118b4d1560 100644
> > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > @@ -23,6 +23,7 @@ select:
> >            - amlogic,meson-gxbb-dwmac
> >            - amlogic,meson-axg-dwmac
> >            - amlogic,meson-g12a-dwmac
> > +          - amlogic,t7-dwmac
> >    required:
> >      - compatible
> >
> > @@ -57,6 +58,47 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
> >
> > +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enabl=
es the
> > +  # timing adjustment logic, so it has no timing-adjustment clock. Wha=
t it does
> > +  # need is the gate of the pipeline stage the controller reaches DRAM=
 through.
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,t7-dwmac
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GMAC main clock
> > +            - description: First parent clock of the internal mux
> > +            - description: Second parent clock of the internal mux
> > +            - description:
> > +                clock of the pipeline stage inserted in the bus path b=
etween
> > +                the controller and the DRAM. Without it, the controlle=
r cannot
> > +                complete DMA transfers.
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +
> > +  # Delay definitions for Meson8b and newer (including T7)
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson8m2-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +148,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -143,6 +186,10 @@ properties:
> >                - amlogic,meson6-dwmac
> >                - amlogic,meson8m2-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
> >
> >    reg:
> >      items:
> > --
> > 2.56.0
> >
