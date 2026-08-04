Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A287B43B6D4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832174; cv=pass; b=jxZ9j0JxQaFtqxHHZkUcfDO+VqyAHC2Lnp5bfc+nFycH2HZqaLEuURc3dELJyOi7onJLaIAs8SB0dS99IXzrUkpTXcW5QWkMk3BFc7eh2cmYagMFAL+bLZiXIn7Ex7sml0kPLsFTwgJTZHV0qiKB8YErzXAw9pKs2p9QE8OhhGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832174; c=relaxed/simple;
	bh=JbREwa63WRi45t2mfJ3BlRKqeRupdVkcEIbr80t1Rm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrIEza3BJ1aeVqy/cXY2iWzGQFAnacNiZDHAgh6cNVB7u0qI+slcXr9RiOqREpzk9cst14nmyZ4Y6OLBJGdfG7EBab3b67FEERZdjxOmkUqLg7fV/1C6n/qeKL+QBAf0vsMdcvI9Ko6NwG6XVB2/rdZJ0oTj8R9x1kAtYlzbWgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDxYRrbP; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDxYRrbP"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca957432c7fso3010011a12.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 01:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785832172; cv=none;
        d=google.com; s=arc-20260327;
        b=l6qy6KuQaBgybpmq7BkP7yIrGkXR8TN8FRBaAg93bUExoxtvxRP7MSYZ28w7iDnWWr
         2h+lVcaxHomdCzSqdKIG4HS3n3CbOBk/pgGArf9udxdP29iY1kAG1nRhMDbzfCkvIAS2
         HJqR2KGDyw672Di0tlY0qei0nm0Wog7PSXJ8bHwKH1+637xfM5AfmEwIT2Yuvf3zJYaj
         ibXDgvh4thmPcXCWfRtxRZW0Be4JQDNvhyScmIra7vtBhE1dWKTs2gXYyHpzbaUl0rN9
         BHlTqHWvtJP/QrdiiE5fr3DX2HhCrROoikMPfhkfVzlGY3sONj/uHsKRAJkh9A94z2On
         bhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        fh=JrmTkAqSvmhcexhORX+AxVyqu4nVIv2stcSx+BrrOAE=;
        b=cTi9D/OVyY5pZL6tWrzBUvnYJlzQNe9QlI5ulxM8JL50LoVKZIdDJnLbFBx8HpY3f7
         9GaIEVWA9kqLHplmPlATiHxU+uKnLaaqCu7msb/LNm4atqemFTRIGClSyTBtF0U2mUP9
         tAfwDYKHCknEN0fIOepAjcLKyJ7juJ9GFUGz7P0fPgjUNBeKH8Ya+K1bUCaSxQjIZMGy
         m+WI7SRCRXTfaYqk+E/8kDaPH+rWYiotbepUl9i2MAOh6o+BxkzkXGPHgd3zJIyJFXsU
         ZV6IRJ2TvEhqSQCJkeO414aRtnsXvq9QVjGOvQqwBxo51IJgtxvZzWqGtCgS58xSVtFs
         CP0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785832172; x=1786436972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        b=QDxYRrbPpM/WFNH8PONYCM1qVqEfAjRsALpx3OruSVLPavLOYA+r+iWoguu1NM6pon
         dTQNHdI7hpdXhPcggupIhV9A2/CFRTe08mEVHPIKssGnyAzX91kt+L5fRn4v06ewbk8Q
         BnQS8g6VVpj1MAMLxLuDRqR/fFr3iuJXxvdTdbR+Pr0/e38ZR/9AZaWAr1DW4CYx+ILl
         ttBHLoYShg+7bLB8SuEloyLQQ489muMwWiKoV1P+zxVaGwDfYvxLRkwJFn6X3+elureM
         glf6u1QCbjwzNA3NBiXqCt/VeUAvIBNniykG2OFFCeyyPcrI6ooMK22ZcvKKS3R2X6OY
         JtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832172; x=1786436972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        b=P8TtUe2BmfmHZlyrzgmjFM4grMeMjMWaPWstoY+T7fJ3wquPbUwoKvyAtmorQXr+1T
         GzUTWLeDEmSgjX2fp7Ift/wnLG1fZ0IhQ1iaQQ4CfaxuGeDljlzUm1NcnWRh7Ric7nEA
         MLEhaDSy1mxnBQimBHdvY4xvJ5/i3/GnaNutP+rzOkkkRd85A5SQCukuWY3W2CZ6rxpU
         v91EizjZ7GCkfsObBI4k+6Oh1/K3wxaZu6wHw0oQRgvP1tB9Qf/R1uscELvl5tK0GOZz
         e/yte/Xb4TYAgxzSVh9QsNnH/djM7mwvoXg0/mJCrXAU1REvZIJfDWjYc2yN5uTBjbUC
         LdSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrn8GcQ7n1r8hh7VREW3/5jgvECfSFaULkRygSX16VrqcTIHu5s1R6GBILZ/xszyBVoHoLMv7ccJd2m@vger.kernel.org
X-Gm-Message-State: AOJu0YzCdkK4gpCxW+xgKJ98sDlZH0+uu7HMkfJh3M3ihiufh1a+mgrK
	cnh+lM3g0igRpV4PtlzsMw+0RubB+TKLL7tCg2lHXMPnmKNqzAsruExcnbd4oSbg3Rxm8wE3mtQ
	pIFGmq4ObUmAcVI1sEXaMYJnrvpskWZI=
X-Gm-Gg: AR+sD10SgPHT9m3HSqwJBZQB3Vzf49hUPp/3Pumy7nveh8L3UW8zxmf+oBcRn3GPZBR
	XK1DNRPy557l1H1GDpn4wUVRCx7X5mwqCGGL+ULdDBVaZAOBt0UEqeCFqM1H9Yv0u9SVaPLNokS
	ETLjnQp2kQXeJoQcgwmn7Px9KoUVV9B94adf94a6tECljJUf8H3VAtT5nYn3ojL0R43TgcbVsof
	tWD5CTbnd1PwucUSgELUuK9MyFjSY8AEdXluXbEPgLPpViqADCx3XDSzs8Qmm1svDXemsPEhBO2
	trzowdXmox/t9mmSzLGMt045+MVp7zuK7oQpPrAy18yzi/sEsBOf970=
X-Received: by 2002:a05:6a00:8d2:b0:845:e2da:91a3 with SMTP id
 d2e1a72fcca58-84ee480ae81mr12824134b3a.30.1785832171759; Tue, 04 Aug 2026
 01:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com> <20260731225930.GA2098187-robh@kernel.org>
In-Reply-To: <20260731225930.GA2098187-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2026 16:29:19 +0800
X-Gm-Features: AUfX_mwxExGCC8sRpN6-vbVB9v8CNcSex_SykavnhYOluP_E46GIp0w8aQWy9oQ
Message-ID: <CAA+D8AO1D6GJ8xwuKf797rc41ymTZp2d=LD8GEQALHhdpToCUA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port binding
 to support multiple pairs
To: Rob Herring <robh@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 6:59=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent the individual pair endpoints.
> >
> > Add a ports container that enumerates three named sub-ports:
> >   port@0 -- pair A
> >   port@1 -- pair B
> >   port@2 -- pair C
> >
> > Each sub-port references audio-graph-port.yaml as before.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. Update the examples to
> > show both the new ports form and the deprecated port form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx-asrc.yaml          | 78 +++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml =
b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > index 608defc93c1e..18d252722aa8 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > @@ -78,9 +78,29 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair A
> > +
> > +      port@1:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair B
> > +
> > +      port@2:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair C
> > +
> >    port:
> >      $ref: audio-graph-port.yaml#
> >      unevaluatedProperties: false
> > +    deprecated: true
> > +    description: deprecated, use ports instead
> >
> >    fsl,asrc-rate:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -125,6 +145,10 @@ required:
> >    - fsl,asrc-width
> >
> >  allOf:
> > +  - not:
> > +      required:
> > +        - port
> > +        - ports
> >    - $ref: dai-common.yaml#
> >    - if:
> >        properties:
> > @@ -188,3 +212,57 @@ examples:
> >              };
> >         };
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/imx6qdl-clock.h>
> > +    asrc1: asrc@2034000 {
>
> Drop unused label.
>
> Presumably the existing example uses the deprecated 'port'. If so, just
> modify it to use ports and drop the deprecated part.

Ok, I will update it in v3.

best regards
shengjiu Wang
