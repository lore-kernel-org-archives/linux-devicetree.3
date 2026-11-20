Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204967;
	b=RayskYlgqJhVNM6Lj0ttGk+bXwW+eDlvvLNtOnEmIoiBkYd/knlhOiCyqb4ZaZ2W2F7/
	 ZJLbiBtDquEOAkgOji7pk4FfDCgbrrJ5KE1QdNF3Q8RHjS9Pei/gFT6eDJu5dDIwSBed9
	 Y1PicPp8HMol4P4beQA06oum2vCM4F1M1bju6oqofbjpX5tu3wdALDdkHUMktU3trgAIz
	 JfSrwLx4dKb8lSVM8i6rIRLiCbFHEgts8EMJnBtN2gk/v7gbpXhd78iCuXjVbcqkW2mTF
	 scfHWS4LbTXOIYgpVW7jTz3gzaI5p2UqwVnEYGJmRspnRPF+r0hAGON2BWTIgQIBDLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
	b=XmcrGBV7pxsEbBtQEntyCyU2z8wZYlGVIny+aiIn9fouro7Q+jJ7TYirvcz+a5kXSmJl
	 9DbEAGx0UQgPCnRF2YgqJaEO/57nyuXq34c1kregh7xBzxzZLIZifhosycJxC+QPisn9v
	 jBYYYMz0s/ECMJ/yo7rCOPxDvP1tYMDOXjK6kd62MUUnKNWkCcVuNEdt4pSpZGU5kqDkp
	 SqjDIB1UlnJS8AOJeAt4Hk0uo9W+JpPOQwC7oDpmUI01bk1UhapIodybsS9YsYORgDsNu
	 JTROalnlpUBj7tPij1I56bvl3NAbhiR4yytLGuoa7R6YNVJ+5ljlR0ldzt5rmKuKBTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WaMYcHhB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396F6606A6E6
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 20:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396F6606A6E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WaMYcHhB
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b335ef6441so9565187b3.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795204964; cv=none;
        d=google.com; s=arc-20260327;
        b=kIxq36FberwrWrGdtvE1g2nq4PD9ZCmVnNKsNsaZCVpAbQ+pGm0kGHcnq2ncPhq8bJ
         28HdHLwZ+n9IWbgUDLgpXVdTLkbqKDsopmVaIm637GUyneAX4lUssOwW7i/1mEJawdJD
         t01C8jj+XU98aXNaT/4PEdDckB6Q6sKLygPiUO4zNR6/69w54DGDIzITucaZ+zAGrlBJ
         zxTeAFrLHVYr+ecgUjA6kdg+GSa5Otxp0+xZ9+6+J/zf7VW0a48SvQXvG3zxtGcAKc7P
         p/99QAuCIJyYYUwDivvoe9Ul4AosB3pAxTVESTdSIWzpULaqMZURrA/6WxhNPa2xjwDJ
         S1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        fh=4G4VlsxW1cZdO+JMY6FROYRDwZDqc5Ag1PNOTU6q9qM=;
        b=jHA27OtIeAYh8OMYq47S5MfLMaMTJzHptK24FdvVaSXsChD+5meQawPLzVDNGbt3kD
         F8pF8n9DYjvz0stT2spxObpusRK89gJK2NTd5jbIUXqg6EP/OKPM2/80cV0vCLo70pA7
         /shgu5p6sIvpTRbOk1IdlpWp41cV6+WjCv+sLphvt/UL8gyTvrK3l0ls1sWq1w01yfne
         Exuh5H3GiUS5iBpPgQeZ0tTg6Q2LEVd6cRbF/FW+hd/zUxdYFHT6OViPuCQro6C1rWE0
         i0trn0rLwkiEgxDBCoxXa7y2JVyZMPaiZOdnbS9FlBCHZmf0E364qXTXA1RUClqnfWLF
         31uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795204964; x=1795809764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        b=WaMYcHhBNZ+35v+6wpg2naLtL6eDcZGWsH/op1cQD4c03wrQ8D9MdgfrpovhVdIVdA
         2vQEBszX+L485tw/WsOjNI6nY9CG5gIGG0K7OjZRK2gMC/7bEIPYyrqsu7ZYpm9MYQC0
         3I6OnJRjbJW1M/wIfBUqPj0fZpDXE7cn+bncY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204964; x=1795809764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        b=urOzyIiHYDldSUUvsy6jn4PBqc0aJ8A0ky2r8GTm1X2DdrMfShfUWV9W6SRjsIiWxl
         vyh+pfPysZho16vmUu+MYXPYXwgAU4e7rNlKqzytDh/o0vGXpurBKXkRj1de5qIcOJVA
         re5O99HK2/ILc7KFiv4tgBC9IMp2dSjtjaWD3xoxeYzQPfUgeKZgcSaHRzcseYnn2I0o
         SzgBVX++I3qcE48J6R0IhSSrgdxMmbGcveo/Iu2OrHaOFtDUgwNTK7qXE4tdMJEQJckM
         xYz9eIspAiqpkr6hSZ6UAP21+c89JFktqHgkB3ofjOJTHgwCjO++OCcOTO7ygre9Dw60
         LPbQ==
X-Forwarded-Encrypted: i=1; AL+hErGd5Lw+g7K7VXWSk0H8dxlpJy0bpXgGweKK30uOeUv7ZrDs2SMgBOHV2X3W40yjVJL/rQfWnwVWsyQ6@vger.kernel.org
X-Gm-Message-State: APuU4Z+KcfHq5UIs5ts48QzlwaOm4mv+pQVMzlPAYyfJWbkTBKN4pSdg
	NFRGXk9KjR1SGPL77oxImpJCDvHJjVAxyWzdGFf0MOhsT5RyKvzpqfqaCraTUk5WkoJ5BhmVEPI
	bU1voaMbIVPdYV8txQTh+nK8k0b/v775FPZKi+/hf
X-Gm-Gg: AZFdTZe/17uFca0mGZjucpwW+sxDwN2a4I9jvd8yiD4WaKj77gxIPiH+KQTJftM/ok/
	JsHASByyg3v2vWIHJ49GStf3Dc6qshkzJSdbZeRW3N/fyChvwYprvQaCzTpDnd9Ujhzkq6V3cin
	6ZuHoqpe9nDioU+Ab6Pf4I93hGBk/PgKNEjHvN8GvqZKWhxSFNLpJS7XqhrGiQv08/ru8nU2T39
	YAPGY+h43hvwK2BfHTHkJHoiTNxcQk11rKzGBiEYbWnrMGjcg+9ui1x2r42bTx1squ3C5/BSz66
	BpzlLo35CVgZBoiXxmjl3MFOPlON3n5xlgytQmsJpyC5C9ONPSJR6QtvV5k7mfWtFj3dBmdmHzL
	BMVS04Y/3QQZiLmtM9/Jsm9uHMIQLDpbfQIvJIlvzzdWf5/t0CvIs9XmN4QMn29REiQFA
X-Received: by 2002:a05:690e:4008:b0:67d:e36c:6bc8 with SMTP id
 956f58d0204a3-67df44c1825mr1431647d50.146.1795204963908; Fri, 20 Nov 2026
 12:02:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
 <20261024-send-upstream-v7-8-abad13174b43@chromium.org> <20261027-silicon-unvented-a0c8dc394e87@spud>
In-Reply-To: <20261027-silicon-unvented-a0c8dc394e87@spud>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 20 Nov 2026 12:02:32 -0800
X-Gm-Features: Aa3M54pc-1DTIKZ-A-hc9wj9AlprRrg4PvxeOwd0_HsaV1fm3yOGyT9vmhS6ZyM
Message-ID: <CAEe3GZF+P2hHHAQO_eWq=yv83HYw9ebEdkO_RZ4zPkQ6e_bAeQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/11] dt-bindings: input: Document hid-over-spi DT schema
To: Conor Dooley <conor@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Dmitry Antipov <dmanti@microsoft.com>, 
	Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:17=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sat, Oct 24, 2026 at 12:51:42AM +0000, Jingyuan Liang wrote:
> > From: Dmitry Antipov <dmanti@microsoft.com>
> >
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
>
> Personally I prefer how this is done now, but definitely worth those who
> approved the previous iteration taking a look at this because it has
> changed significantly and no longer contains any of the properties that
> cover the timings etc anymore.
>
> Worth noting that this changed since the previous version after I
> pointed out that the second hid-over-spi device did not make use of them
> at all and needed specific handling in the driver.
>
> > ---
> >  .../devicetree/bindings/input/hid-over-spi.yaml    | 75 ++++++++++++++=
++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml =
b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
>
> Typically this would need to match a compatible, but I think this is okay
> provided other hid-over-spi devices actually get added here - the series
> adding the second hid-over-spi device didn't do so but should be able to
> I think?
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
>

Hi Conor,

Thanks for the review and suggestion. The intent is for this to be the
common binding for HID over SPI devices, and I hope more devices
get added here over time.

Thanks,
Jingyuan

> > new file mode 100644
> > index 000000000000..bed0746f004c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HID over SPI Devices
> > +
> > +maintainers:
> > +  - Benjamin Tissoires <bentiss@kernel.org>
> > +  - Jiri Kosina <jikos@kernel.org>
> > +  - Jingyuan Liang <jingyliang@chromium.org>
> > +
> > +description: |+
> > +  HID over SPI provides support for various Human Interface Devices ov=
er the
> > +  SPI bus. These devices can be for example touchpads, keyboards, touc=
h screens
> > +  or sensors.
> > +
> > +  The specification has been written by Microsoft and is currently ava=
ilable
> > +  here: https://www.microsoft.com/en-us/download/details.aspx?id=3D103=
325
> > +
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - microsoft,g6-touch-digitizer
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO specifier for the device's reset line. The HID over SPI
> > +      specification requires a dedicated, host-driven, active-low rese=
t
> > +      line. The line must be flagged with GPIO_ACTIVE_LOW.
> > +
> > +  vdd-supply:
> > +    description:
> > +      Regulator for the VDD supply voltage.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - reset-gpios
> > +  - vdd-supply
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      hid@0 {
> > +        compatible =3D "microsoft,g6-touch-digitizer";
> > +        reg =3D <0x0>;
> > +        interrupts-extended =3D <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
> > +        reset-gpios =3D <&gpio 27 GPIO_ACTIVE_LOW>;
> > +        vdd-supply =3D <&pm8350c_l3>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&ts_d6_int_bias>;
> > +      };
> > +    };
> >
> > --
> > 2.56.0.257.gf7497c7d27-goog
> >
