Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491AE3E0754
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913098; cv=pass; b=YK+c2HdZHRgHRq4FacQ/F7iWgb1xzki9EvILjvnKh9H2C3iDgo5bMI3hrev9hHHLvAomo97m5xaGExqzNoXCV0Z7+9wkvaDu60upikZhW3pXdQBZrCXTsw0/d3C5DYY7+9a4yF/ECpfP+XQJEVw2rXddAD6Irhl1AYf9XeBMQ84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913098; c=relaxed/simple;
	bh=OsodnEMx+zgh9b3FFSBCG8xEUSroGixsC/QWoJUzxBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCdheQJt9/RolDoiTZI23Nci5aFDNAG3qakbDwu9iZhJvGO0y3JI14Knzbj0MZLjq70/L+Y5agBaExjUr5OjIkS4A4ZKwlBstqi9XZMPm6FXorTBcPkBjrfLbCmUsHjopTeQlchXcZOX9d+XOgrV+lYjVv1Ak0T/M9Gi/hauArw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okFpB43U; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okFpB43U"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d032846c95so9083245ad.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 23:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785913093; cv=none;
        d=google.com; s=arc-20260327;
        b=khEc4EbbeF8XgFvIS76VnHLEjVkz7TwZukPsLxG7z3f8ZNyLDxSZwdNlvFtSLqPCD+
         CcsRiwAMWrWaGZFh3AU53zA9PqT4dG6/NSUgfgJSKOq20BkesBMN4shiXmrjgm6YAm62
         6Xoddw6u/HuU0es4FW+uAeIvlf5kEcLSD8znxG4J2uFgb1KkVAoaoEKHlboL8g4huVHM
         YghoDefT9GN7mBCEVmxNb855Z4xX9efxr7Zns/SSH35taC1j5zP7p2F+K7CoWoXKnrug
         vV9jDW4LfBcS1ujbIDFoYix5o1il3ilebgJeLMYc0tMbyiN5gIjl00FDloe9UoWA7QJg
         6bQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        fh=p2hEzezjanLP2zoQ/jJyGlyMVZ5DatTzRtHdP6Gaang=;
        b=E2CwnLFcfTS+OJX+zYa2Nc7SsNF9TxuU1RPqwnETsvmw2QO2IQ608SU9m0/Ug6Bxbd
         TQSE1X2/QwlqzITU1FYE4iIaqGSWlxC9iz2vLQ2KXvj0jPYGhB7kw1xO+JirerdulBTn
         HcPoVMCR9ulRzSh6ScX5m9HlYIEhW+vL4Boyjcnwj9Np99G4E9A7Tf0taGqbJM+zbQ6J
         uX/we99evMmAyEmuBAdBc2bZxyDmKCiVsY/a8Axf69LHeudgVDSJFLHdd9vT/4B/KORh
         5Fi8I/q2hWJdMTboNXUyLAKvab0hsrTT33m2MG9FrC2/8y9X27C60jiW2E12QOgoKJnt
         ELwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913093; x=1786517893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        b=okFpB43UclaxuPZwZdH1OeHkRZtAOUIy6z0dKIyqHLafML6nGL4mQpeyrK7s5/3z6a
         JWjdgntm+bkY2v+cBGJh72bE3VvwIM6gu6Xl2fK9rHNVBFO5dxk7hAHuk+Z/HNl+qD28
         O41DVzcNLy2AEXWMfH7Et8ADiIelxcf9+V5oYAJxHwcLoXaszPnNl83fejFxYPMMu2MC
         +INLGWAzBgAB3Zh2rDBJqUGz25zdySwS4jLKwBo8scfmtCc4J6/oqDMdxPYID4l1omxG
         5zQ9iogLOdNjrDFZr4m7q6FJ5YbH8vRdk3r7I17zsWsVfnZNHp2P8V9F+qGLYqG2KOh3
         3D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913093; x=1786517893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        b=ALAEonXUywZAbfrvx/lqu5/GgWiu4EunTEdOcqPCJD8oo/JUB2/GTSOlzOb4xqiLGG
         MtDAVvdh3DEqThjt19/JTzksKfI1mdhzFX1qYOf7X2xYqKD6wiCYYokoc3+oU2QhiJbI
         z32WpzZNLLz6e/rtLI2mp2wOU7hveNds/AC3EphIATqapvA+NUZOHbJn3YbYa4F0idAD
         6cacDgGtR1zMyjf0a5TbNhD7XHqN/60ZWu/qI7LTqdNFdb8NOOP7SsHr4K+NUUsk1SFn
         RUraRlKrjBvvswPo74IDJxyCmMrDqclLEBOjwEIr8//MkO/Jb681MiyzPoOTfKJN9WPz
         wvbw==
X-Forwarded-Encrypted: i=1; AHgh+RomWY/xgbvNXNdmt/v4keyJdOWUoY2fVMr+D5YyqDauo3IBrBdk3+Mm05z9yiST3rfz+IAw0aZf3Nwx@vger.kernel.org
X-Gm-Message-State: AOJu0YwOOhtiqtR34utWP7QWotB+B+BddtBM+fQtwd8CAZVxD4ugSmbR
	fBhy4BrhyY1L+3L/tdAFq/ZyXBgZhV+37BEfLszsbZCVG/isD3g2qLWvTtb+UA+vFXauzx6yGJv
	yA89u7o3MyuyjvY3p+yhwpOcrPjF7npw=
X-Gm-Gg: AR+sD10BK0ZcYhdBYNtRznCuenQuTEfbIW4aTPmTuJotDnwLJty/qQW0ouo4mvManmk
	ntKFZElEwRojmt0sJdDdVVWwYIigNipgr5GJXpQRNeNfrtY+xhU1MuEUmdYB+kVf0ZMfpteWd9a
	XirdSQDXpbvUsWbBSTMaEwC+PEeWasumaO3Fhn8okVwX3zNkoJ7uRsU3gz3j3j9Rs9pcoD+vGq1
	v3pKHQ3nmMLSQWP+3xdenT7Kl3VWC9x59SZ6V9K2TKo7Mk0Q1TIgYvJuoZj2YNTJ64bB/jMQiLU
	7GPZQftKSmDIFwcrTwSXdDTKeYsMhD8LSwifZVc8SsXf
X-Received: by 2002:a05:6a21:3a48:b0:3b4:61f:1fec with SMTP id
 adf61e73a8af0-3cb85df12ddmr5759243637.2.1785913093306; Tue, 04 Aug 2026
 23:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <anH5i7y3JkB1moee@SMW015318>
In-Reply-To: <anH5i7y3JkB1moee@SMW015318>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Aug 2026 14:57:59 +0800
X-Gm-Features: AUfX_mxtqJzMX_WVEhniuKHoKxDYIHB5iQVu-6lJu_NKLxZB1goSegJJZEResBc
Message-ID: <CAA+D8ANCoc5qOUvTQPRNkvrfqAY3n6x_fbfUveP8Sfv+SL1NVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:39=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pair=
s
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
>
> if no existing upstream DTS file use it, you can direct replace with port=
s

That is to avoid any downstream use of the 'port', so not directly replace =
it.

best regards
Shengjiu Wang

>
> Frank
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx-asrc.yaml          | 45 ++++++++++++++++---
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml =
b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > index 608defc93c1e..67d2826eef3f 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > @@ -78,9 +78,19 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    patternProperties:
> > +      "^port@[0-2]$":
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for an independent conversion path
> > +
> >    port:
> >      $ref: audio-graph-port.yaml#
> >      unevaluatedProperties: false
> > +    deprecated: true
> > +    description: deprecated, use ports instead
> >
> >    fsl,asrc-rate:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -125,6 +135,10 @@ required:
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
> > @@ -180,11 +194,32 @@ examples:
> >          fsl,asrc-rate =3D <48000>;
> >          fsl,asrc-width =3D <16>;
> >
> > -        port {
> > -            playback-only;
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                playback-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe00_ep>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                capture-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe01_ep>;
> > +                };
> > +            };
> >
> > -            asrc_endpoint: endpoint {
> > -                remote-endpoint =3D <&fe00_ep>;
> > +            port@2 {
> > +                reg =3D <2>;
> > +                capture-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe02_ep>;
> > +                };
> >              };
> > -       };
> > +        };
> >      };
> > --
> > 2.34.1
> >
> >
