Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B443DD85F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960734; cv=pass; b=RQKKhYCgrezwrYbbUIUSfOp5oHtK5WIDRwghYGvmcE5+a6zVaoAVhT1QHSXEiloZ0QJbuiWzd4KKOjVnVw70cUQiiejvhgXzkvf0gDfhOtKaPYRC3HG34TMyFzRs58312QwsITv0WzSTdxeyHeq7y9V10555I0lUpMpdVxUE0NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960734; c=relaxed/simple;
	bh=f/xJ9b6bHOUYIhetMlxLu3Jlg/uG6SyeIHZM9qxQeIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opDxvbe03ItWD2RwlzQppNclQtsWX61j1GaOvPiBJNbbv1p0GbFEAqDkX26ziZDR7OhEfDDbFmvrcjefClK4J+we6xUvbyNblu6flKrMIyeSJEXMfia7wBsVSyjqR2ccHwscmQ8JlCGAuMlLXeBdWt65E7NNaRUNCYJ+LLkfUIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjxMcA3I; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjxMcA3I"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so4254044a12.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786960729; cv=none;
        d=google.com; s=arc-20260327;
        b=fdbl/8NfoD50UJObL7SN623byq+DdBPK/Zu+xJt3wqTeb4so9zPBum/EY5nj2/5c2s
         Q5ivMr99ZzFKwnX8BKjsrVTrWZrv2z4Ud5jsMwNckvG6FeLXnlOOlAg0p4eZxNtT1GaQ
         zoFygq1R+v9CtNO+LWBiLgvkC1sIBi+hBs448TqnYCz+NYC4QClPzH5u+zpuUtRhK0Y5
         RovbGU/B5ncexLHhWKlIdu4t6yiCSVKbDbTxoonGO82SH+ZAN06do47yYsgdyU9cs/u5
         zcnNHGLRt0yKqOMwwIPqPpZdhz9i33IBpx87z1XnbfbjiEWAyZtiWN4j4ZQw2Y2JXebm
         ZbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFDATddCGKGnePTPiCSWY4/Z8ThU+uYOoHQ9cPmzOgc=;
        fh=jZhTQlmw2eRugzRgBtnoLMWxIrNraRkzfPmAse/fOBA=;
        b=cfaHAuks6NPuEAbYdgStaeDKXMl0jEKcp+11j+XRHTFQHr2hCgpyuKCS9XIAAOqE+t
         uDi4hfTqT6fW48hOY8KQlcke8dp8kkE6k1VPANzg+KtcKbkrbVxd2Jmtb1YIUWV+V0l1
         buKyJlQ+Z5BKv6U69Ss3fWHq6CruOf1hN0wfzcIEEEDbojXHNpTXF3ySVKvIYXGGU0GS
         +SY/5Kx7X/mWc8r6e5TYEnwQp8QWCrO+mh7hEXDE9Y/u5ZR1oleZZF96NqSwAMzo2z2S
         KixvmB59pidbBD4io5IqbAV+V3oeKWtelSUbxPu0aM7mclsIU5vUej1WSRdgHLiKMHZd
         5ehw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786960729; x=1787565529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFDATddCGKGnePTPiCSWY4/Z8ThU+uYOoHQ9cPmzOgc=;
        b=DjxMcA3I5YNBFcDUfTgREQkC5O/ecs7/iwP/Dr78a8SvopoEfZ3unWnXwKZzdgPzOo
         eJ+OqCjz3kKXTol3ULjBVOLdX3ryeNc4WqkpoauaDTqVXiHAX7tADDnILmSkbiE0nqja
         +PMF012QlbHyLO+bxJtMwAvkad850B4BCEd3CEZJ30daANlT2QFYbJApn/o9U0moeYKz
         s3DnpqJqLg3Lhurc/8qtm9VkESxRzTNBWscRz0uC3VyOI2QzzLtCNgxFgtLSzQsaFWWe
         9kyEMpsCZE0UeZz/Yz5fKcNv+PglufDCoPF5oB3WRhH9tiOqYKPwmTHGFCcp4Ftqd7b7
         l1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960729; x=1787565529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFDATddCGKGnePTPiCSWY4/Z8ThU+uYOoHQ9cPmzOgc=;
        b=q7EaEIZV5eCz52iGU2nQBdW7dyT2HOdo7vBxB1nh4JeJNmBBZwY1Cj49mOyo0dQJRO
         BdXvN8NV5SgjH0IOysRCBYmxqu9ELT8x7vKTjBYgE01a9sS/pofexLXue//mZqlPv/Sn
         IvbDokEYWHu+TtLKkA/QLng+QIL7kJ3uJZ3mCJUmzN1wLmmVB4KZ6wWRyyQ60PVGYI8j
         q4ZQBbfuVVQSohjHrpwQDhCxkH7crGwP7O0WXDVDMz1raGPK+9yr2df1fsKGqe5zpfh1
         sNAEwp22pvApnNBcIhnmvMOa3wba5sPcafzOzUqU8x2nMKEjC6a90te4udsZBtaiAS2x
         reug==
X-Forwarded-Encrypted: i=1; AHgh+Roy4N1z8Pr/0VnYinvfsxmZ0nv1YeY42tkOoZQnb4GOHIUdqjXWwyTAB0wC/nWWggSq2EFS/1F0+Z6p@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjzs9Vy8FYNJR4oe7hqp3y21KGfffH6/0w9hbbtyJ/0NN48X41
	HQW/cE05T+9HxBgFI3MP5jFQpEELF+ayvOSwZnQeXNlMqeZ4J2MUUd0+6MKerAp9fpD6lNh6SqQ
	W/qLHX42GSCNyhoEd67s8HkFzal6pyBU=
X-Gm-Gg: AR+sD13MCY/hJ0j2Uh7bFMjjemzQ1jlh3osTmREVFceI2sauKaID1YtR5ngl73gX082
	/UAWR5eIGi0eG6NcNoy4tUO5LkY/aedueJh9ML208mC2Y5AQEdtmU2AF1Jc734jVPTW99Vd/rK9
	f1WC4j3kIVNm7Ag9h2GvfXQ2XvVsNqUccmoQPB/zTRG80o9mAUs2DcuqTMi5NsFgCHjp3c5zgIg
	hCuiAG5nRUYYOgUgfIcUpMyr5Un4KuDJRkvcyrdarn9Kr8sGT6vHzhjFUxHwf20SwEThEGa0o0L
	DbvQIvWCW+V0bByWrg3gHGfBjhxZrfR8JpNXBHsdf9qJCRYiMxgYxyX6KPcdnG1Dj7wv6aP1i6L
	5i/97QCuZkB23oJzlp4suyo+g7ld1W2Zvmg==
X-Received: by 2002:a05:6402:3708:b0:6a0:8885:e6e2 with SMTP id
 4fb4d7f45d1cf-6a38a90da8dmr10858787a12.9.1786960728872; Mon, 17 Aug 2026
 02:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816092847.2522994-1-egbostina@gmail.com> <031e1ccd-c4d6-4dfe-8920-fa7b0e5deb7a@gmail.com>
In-Reply-To: <031e1ccd-c4d6-4dfe-8920-fa7b0e5deb7a@gmail.com>
From: Eduard Bostina <egbostina@gmail.com>
Date: Mon, 17 Aug 2026 12:58:36 +0300
X-Gm-Features: AcwNN1WLvoPFCjYSsUV8RlVbrVMgXmJcp7Gzohczv41aTBBn-L-WhXmQsK0KmuU
Message-ID: <CAEFOc62qU514Nd095bg=8E-yLrpd4QnRhpLp-12WKvx17A_dCg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: Convert TI TWL6040 to DT schema
To: Dhruva G <goledhruva@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev, Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 7:00=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wro=
te:
>
> Hi Eduard,
>
> On 16-08-2026 14:58, Eduard Bostina wrote:
> > Convert the Texas Instruments TWL6040 audio codecs family bindings to D=
T
> > schema.
> >
> > During the conversion, the following updates were made:
> > - Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
> >   misnamed in the old txt binding.
> > - Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optiona=
l
> >   because modern platforms do not require them.
> > - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
> >   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
> >   twl6040-vibra driver.
> >
> > Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> > ---
> > Changes in v2:
> > - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
> >   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
> >   twl6040-vibra driver.
> >
> > Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbost=
ina@gmail.com/
> >
> >  .../devicetree/bindings/mfd/ti,twl6040.yaml   | 142 ++++++++++++++++++
> >  .../devicetree/bindings/mfd/twl6040.txt       |  67 ---------
> >  2 files changed, 142 insertions(+), 67 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.ya=
ml
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Do=
cumentation/devicetree/bindings/mfd/ti,twl6040.yaml
> > new file mode 100644
> [..snip..]
> > +
> > +  vddvibl-supply:
> > +    description: Regulator for the left vibra motor
> > +
> > +  vddvibr-supply:
> > +    description: Regulator for the right vibra motor
> > +
> > +  vibra:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      ti,vibldrv-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for left driver
> > +      ti,vibrdrv-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for right driver
> > +      ti,viblmotor-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for left motor
> > +      ti,vibrmotor-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for right motor
> > +      ti,vddvibl-uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibl default voltage if it needs to be changed
> > +      ti,vddvibr-uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibr default voltage if it needs to be changed
> > +
> > +    required:
> > +      - ti,vibldrv-res
> > +      - ti,vibrdrv-res
> > +      - ti,viblmotor-res
> > +      - ti,vibrmotor-res
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - "#clock-cells"
> > +  - vio-supply
> > +  - v2v1-supply
>
> I think the vibra supplies need to be conditionally required when the vib=
ra child is present.
> twl6040_has_vibra() uses the presence of this child to instantiate twl604=
0-vibra, whose probe
> then unconditionally gets both vddvibl and vddvibr.
>
> Would something like this make sense?
>
> allOf:
>   - if:
>       required:
>         - vibra
>     then:
>       required:
>         - vddvibl-supply
>         - vddvibr-supply
>
> This would still allow TWL6040 users without vibra, while retaining the d=
ependency for users which enable it.

You're right, thanks. I'll fix it in v3.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        audio-codec@4b {
> > +            compatible =3D "ti,twl6040";
> > +            reg =3D <0x4b>;
> > +            interrupts =3D <0 119 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-parent =3D <&gic>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <1>;
> > +            #clock-cells =3D <0>;
> > +            ti,audpwron-gpio =3D <&gpio4 31 0>;
> > +
> > +            vio-supply =3D <&v1v8>;
> > +            v2v1-supply =3D <&v2v1>;
> > +            enable-active-high;
> > +
> > +            /* regulators for vibra motor */
> > +            vddvibl-supply =3D <&vbat>;
> > +            vddvibr-supply =3D <&vbat>;
> > +
> > +            vibra {
> > +                ti,vibldrv-res =3D <8>;
> > +                ti,vibrdrv-res =3D <3>;
> > +                ti,viblmotor-res =3D <10>;
> > +                ti,vibrmotor-res =3D <10>;
> > +            };
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Docume=
ntation/devicetree/bindings/mfd/twl6040.txt
> > deleted file mode 100644
>
> [..snip..]
