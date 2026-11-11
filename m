Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399730;
	b=SqiWNx18E56e+566fq+JP9QndDzw9MUU7pLF42jIhu4ccyPRhKdzO5XRJjjjwp/gHwNg
	 u7n6NdKCLqeMRQ80pHek+OCvd1RbjM50o32iiI7nRzsNJNDZHnn2bPVkJ9t9ZISMQnQHN
	 w2D2quHU/NBqBy6ffrBSPxq6WSQtGlfmjL7Vs7WF905KpZqacJeLgnp/MERuImINjLMXb
	 fvnlOn27Db5xSW/ZRFAxpQA3nV3iOj6EUrTncmKOdSFfpv0HJB4scc4gGA+wYtjQHdurQ
	 FQlGhZvhgtpei+b2XWSVLiyse1l5/OczsmcQOAs6M3A4jrDFsL7MfQeVSDg+/2pjsoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
	b=x7pD04fsKfZDb1GUX0LnWJYFuLoElUyT4I/em4GaYODoRgRhbX79F74Om/HNcCPDoUz0
	 Qu3GZEUrohrK+C6OOQRMZMXGoRTQMLJyCZRh1sWvKgrh5UPtH5U4N5bzEHNlqaZ3H7mVK
	 99xhxLmrWnaf1KrGfuW5rQA/yOLFc0e9ihxqzCltQLDvlnRo7Ay/BfugkyTKT/CvAZCaJ
	 pxt5Po+DR3o2ssExYGAJBmghvtj4mQcjEdgQ5B7DAX697umzjmHaBvK8SmJ7z1Vm81eh+
	 XROkNExcxQ8p7PeQWR+p6HyVkwPX2j8oAfB8tQrWnoojeqiLGKkya1/IWPRkVfWF4kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v2fr2S1D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F698606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F698606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v2fr2S1D
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3344521a12.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794399727; cv=none;
        d=google.com; s=arc-20260327;
        b=MY9SmC9oSW47FB+ymHk79UvY7L8ygwPO6AP1tEUTwgKMU2GBOVyPiXnzvlTK2NRNjk
         tXT/uM6Z/eZjdLnvzgxTNfkmHlAli5Qvh9yAhUJ3noFnUdbVvvoVszbObI/iLyr2F1XP
         g2cwmtMJleM7ca38k/1LhgAzkYFN/cxDF52wR9qHXyBRrrIGNk6JSEGOikOGSUgSDyiX
         PPcZ1Aii1nWgbcAGok0pBz2FizeKORmNe/dRo8hsCsGv8KURmoi9SpME9lJAXpvNWhEj
         QYYKOmXjCcpbKSVKsfbB0wAFcjc/oETZAHQ8ss54Pw7QELktZsTnvkE/EM0/iAzxsQfY
         T8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        fh=qGpNbNrXzgiEngz8liFI6yOFPXmFn3NJDVmbh9uJBSI=;
        b=Dpmv8jSfQxpcyffPFxGOLdQz2I3OsgGYsyK282JvUiIi24MoRmYAXboq2masSOttSa
         T4b6l+yNWjqsJUV3ACuHI+6I8PEVgYFxQ/eh5eO53F768G+KoIANfFCX6vdruqI5SQOB
         UyL3n9GxAI+PiSJU/QM6IPLs2sXnHYZsmbYRAeVPQTK/qjzKOKVDMOzh9OwHR75ovGYs
         S6bess0qc7HSPeaIBBg4pTQXj++WKdd6IjjgVnVpUEmna+drhcr3E4q7rwzgVpOEZrJh
         01695MDf429SMj6vt8f2T4a//i6vEZ4Lu+MFjxhxXge+wC20jXwmcvmdEPgwe/vYZ88u
         31tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794399727; x=1795004527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=v2fr2S1DGDPqqGLXJM0kfi9ZIPOyU1UGWmpu0npSnLbA5WBR6hpH/rG4VU2hltU8zS
         za8CRsV2O3JrFsFAay/QLnZET+MOOqogxpuwOCnkNqfpmQ1OOjk6EHCFNLyYmjNRHzxx
         TjP2pgMjGCIpG4tTyOZQcbXI4Nnc6nxvSqEiTiO9cRC3v2Jnu9cqa92QLc3o61kNV3VX
         WVc98vaFKG2XP3+d7F6GrPJEPBz/iC8AXu7cLYI90LbSCgcfRB2tVGGcX908son6zGil
         OfTYJPETnoL6UbrB/bGrDwnZFdamGY1XML70HVqyz/T9w0IzqnV3VYZ+yUaWUciFuudI
         n1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399727; x=1795004527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=b1BtWSkRE88oFnRw6EYN3TtOLzXEKTWRvsYK40Git6Ylq394ODfh8nSfGPP5Y8rlsk
         GUh0MhWitvDcaaldOPR33ydoL7kNhuEzqhYpgZ20JC/Yk2fNCbek3jjzkhfCVKJZy/3h
         Uq8/JvvuC/38ZKdb2dfxB+OsuIOkPt7j/sHucWA7ntArjqk8yUeec37jevLkcQXmRUaY
         tg3nr1oAUAggNuoDB1h2/45ZAIy4DRWsnQD8GenlqLbXiURa8Edxk4nfnfMetxjuJzS0
         xMFMAGzZVx/mx5n9Tdem0ZUC7uB/cr2dhZEbWxKJ+5pvikahZvGSU1JWWrhJJHeJuzqu
         OlVw==
X-Forwarded-Encrypted: i=1; AL+hErFv5rtye9KUXb6qO8i1HTs4Y6VnYrBSwCwe0ekExZ1FOfQzfO8VUkmhnLSDziCzPr6vOVHUU9/TA8OG@vger.kernel.org
X-Gm-Message-State: APuU4Z/ris9CKIvC+YIjk0wGpt1BwVlU3gKW1CGIO5/N5UrrnoGipNeQ
	aJzb7JqQFXXucz7ZebLFsm1lksWHcufSjAoeAN/1Zo+KLaz4Qg+y6u1rAm7LOgQdRj9E+rSoIds
	PFlY6jahhj0bPzU1Ne/PUpx/s5qgTNeAe8KB3Xmjb9w==
X-Gm-Gg: AYBFou3gIPqhQowmjZ6XAE5sbFwsK3JFfttv6AVtB35XimhWBSOdKw9+JdIO2MmGARU
	I/YX9Q8h7A6dBwOVafj5AXls49khMjql0EHTRjxclhw5V0ZRJmPVmbk8KMmti+Fsm29XlSrxoW2
	hPcpahAuDHdJ7wzi5PGXACVSN6/NGdodL55kzbA7DpVS1xO5StUq+8EKZ17KlIrrs1WTk8YydUl
	VSpid7azF0Z1YblhGPXG2QdCm7740IFX1VVm4jqrYg9DI/ZRt3+ekxc0gxP+/28Hwt4ZXwTas/O
	QTautodUobRCn06y8yRi4esRATk6+l0n3aKsOzsQnnJGfIflGlC9a799cy8vlirQvINFkClKW/i
	mTTTf79UurHC1XfQqZlHvFcSX+wZrLlQHWOzZ09P/63s7RlDgKXi6dAOoGD0D5LXvDLmWjW6QnQ
	9J8cJncSq6+JFOolTJzg+mNigJNJ0IF1CXv6eCQ8yVuth8FLAsVS8sGA==
X-Received: by 2002:a05:6402:2b92:b0:6b6:eefc:ae78 with SMTP id
 4fb4d7f45d1cf-6b777341867mr1845043a12.2.1794399727628; Wed, 11 Nov 2026
 04:22:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261110145414.GA3828324-robh@kernel.org>
In-Reply-To: <20261110145414.GA3828324-robh@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 11 Nov 2026 13:21:56 +0100
X-Gm-Features: AclHuK-NDRpRb_jYg5FQQ5B5fgUCjjm_CP_VsQUIeOlFZDuAlC2eNYg1mYw5Bfg
Message-ID: <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> > The LAN969x fan controller has a PWM output and tachometer input in a
> > register block separate from the Sparx5-compatible temperature sensor.
> > Describe it with its own compatible and binding.
> >
> > The optional fan child specifies PWM period and polarity, tachometer
> > pulses per revolution, and thermal cooling levels.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > - Describe the fan controller in a separate binding and compatible.
> > - Keep the existing temperature-sensor binding unchanged.
> >
> >  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,l=
an9691-fan.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-=
fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.ya=
ml
> > new file mode 100644
> > index 0000000000000..0b7d38a6d20ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yam=
l
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip LAN969x Fan Controller
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +description: |
>
> Don't need '|'

Hi Rob,

Got it, will drop in v3.

>
> > +  LAN969x fan controller with a PWM output and tachometer input. The f=
an
> > +  child's pwms property references this node to specify the PWM period=
 and
> > +  polarity.
> > +
> > +properties:
> > +  compatible:
> > +    const: microchip,lan9691-fan
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: System reference clock
> > +
> > +  '#pwm-cells':
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: PWM period in nanoseconds
> > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      cooling-levels:
> > +        description:
> > +          PWM duty-cycle values corresponding to thermal cooling state=
s.
> > +        items:
> > +          maximum: 255
> > +
> > +      pulses-per-revolution:
> > +        minimum: 1
> > +        maximum: 4
>
> Drop. That's already the max in fan-common.yaml. minimum should be added
> there too as 0 would never make sense.

Ok, will add 1 as minimum in fan-common.yaml as a separate commit in v3.

>
> > +        default: 2
> > +
> > +    required:
> > +      - pwms
> > +
> > +    dependencies:
> > +      '#cooling-cells':
> > +        - cooling-levels
> > +      cooling-levels:
> > +        - '#cooling-cells'
>
> The dependencies should also go in fan-common.yaml. Perhaps
> cooling-levels without #cooling-cells might make sense sometimes?

I removed cooling-levels requiring #cooling-cells, as it can
technically work without it, its not ideal, but it works.

I am not sure if its feasible for fan-common.yaml though as we already
have schemas for EMC2305, and more importantly
DTS-es for freescale/imx95-tqma9596la-mba95xxca.dts and
rockchip/rk3568-radxa-cm3j-rpi-cm4.dts
that have #cooling-cells without cooling-levels.
EMC2305 driver even calculates cooling states without a levels table.

I would appreciate guidance on how to proceed with this.

Regards,
Robert

>
> Rob



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
