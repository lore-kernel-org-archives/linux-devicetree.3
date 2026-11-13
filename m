Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571689;
	b=U7Lx4VGeUUdRlauFJtGUnqQ3hRu1G9bwMm+bFGtqLR/98vG8ZMU1LqI6+lLvHh5jDLKI
	 yhTLabh1J+Sed0V/6PAZv9fmvXFpcOxWMh+MgX0DaCTtPWW0WUsz5qpy52eXI9AAU7VOx
	 FdRNeVVp1I2I7m4nD2InYuymzbXtZR9Y8eStq1rBlEu+WMzilakuMAXV+nZI25FmWqemT
	 QTTsAZtjKQWfdf1EukDbNV8aTV4ymhnlF37hS2jfSFiQ+Th0jq5s23raK9uxJhqvfjpsl
	 dXomXQjV+8hp8Qf14YxbRNUzAuH/tQgRjU231xOEOTsme+vRgeNbHoEGPTpL8/Y+Pmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571689;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Akznn5x8/2l1e49bpMLHpotxCwIi2QP3ICBwS80oL8w=;
	b=pDUsLO3gQJH4fCcaSVwnMIpZk9qBU+ROHBT7qHymBcEfg+a9oeuS6D7oZ/NoS2F8HyMj
	 ibXpGer3HGsmYhUnTaodGUTt+6celfFK65jxT3wQt5LnDoIrc/OQK9naS+JtiIdH0Bmbc
	 6/+fBH4PQwkA3R6vDADAGAJ+KVa8MO/5F6CRt1GnY5lyq4Q9T4gLa3EbS7xkeeyiRUL5T
	 AvGwMrr68mqU9ANWJavewb5aN8N7FPcSWJ1J7EmarA0CNivLfpqtxVActDhxbghlDPQuO
	 va/oCokULqEl1yKPWwDKJe/fisq2GXZubkZtLTzbnTVvm5RpP95+amJYvLJFZ8264kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65915606A88B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65915606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67c58f18765so615757d50.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571688; x=1795176488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akznn5x8/2l1e49bpMLHpotxCwIi2QP3ICBwS80oL8w=;
        b=uC26celZqRz6DdA7BSOSFqs1u3xHAAd7Br9wpX3Y+RF0GDCOz6q+P6A1qUQPGmMlDv
         CSVZfPKtexaOI3/WhMOTMlPR1VSTj5SJ7nfED6Rm4sNjRp1l+9GKYx78hRXszNszqDyq
         rUlyCJ4h7fyiR2PsRY+YDkmB2aj4QzAmi6Zx9NeTbsoq7WSjMyXHvGtNmxNnn1nReVGe
         oP+CUkIZuYLwupISMt2HD2a20fZtFxXeEiqwpUwZu4sTnYhzUNX0e/zoQFtuskLNCfEV
         di0OebXbYVs8HdkOjq/P/XPBZhc8ghq/4ahNQyOQKqqy3C3psHzeY1ObFw0EioSnb/AG
         BD8g==
X-Forwarded-Encrypted: i=1; AL+hErFpQ6BUqGe1l9ebpwkG6FNILVrg2cOulxoeSUGofqahh1TF2wbgrhc+9uywr9BFRQ5M4g7lbAkgdhpq@vger.kernel.org
X-Gm-Message-State: APuU4Z/+EeFomJEznIxmInN02U4RHV7l/gSZbxuZo2aCvKtUoYjz1L+G
	hQcfjzKqWP6Ej1U538RXNbFrcGwZxL895LnoAKYTOOpbHFgRGdCipSQSIkXjzoB14qQ=
X-Gm-Gg: AYBFou1tvUVNpQfcBrE4KLTEKHUTXGmbRsOLOmKVu+jRtk0HCKdG01TnFJFeCyN+G4W
	+jQQjarw2K6MAgnbssk4FgZP5Z/kUuap9FerSsZP2MSyhbCtssrhzJyr8lAChfUBjF98B7A84hq
	WSAZiouVJXTXKXfKMrFmScZuLuBVIcBayDKt010SauIxFKaZ/LNs0botcxpwq1mxCGOxlR6dwuw
	mG1kwXZrRoNs0JU6N1wblUbd2DDcUtGyfYpjeEjVXmTofw5D02ABisp6xyEUEIxuxj8cY4d+9uF
	hWbcvasox3OPPeiAIAeHn5raVvOpuAr7yR97160DMU5WeVWcIXeIy5pweOOgu6TdzINZG6yNTV+
	9YaDrxHXQyruqCEK/oZEf3GRBLZYS3GwstFvJq0EeLjuzuPEldj6EgoJHq13hMZFVi1hY9tGkvP
	Tl9UqTUfHNEd0bI8Ez02W3q/XGXUkFraKjLCc4bozAFH7HNKXhiCVid6osfioUWp+dhjqvmZ2EZ
	IpXM10ehDq2S3UQ1wJlK4yZSgYqt/Stu1nldxI3eolKBb7qzetazCA9OlU21kSmpSQFZeqbDWXr
	HMAZYv6UKrCJRjP3XBNq5YseGDqG+bQ8r2hNZKK01Esuphw4DC/YvK9awJVJ5qcJJIbzAW0vJ3e
	9GmrrDBUrfRgqUyarF22GYpQYJMW0GPuKm4WoshU2DtGLVj0N8xHExfpVBA==
X-Received: by 2002:a05:690c:fd5:b0:8b3:b57f:21fb with SMTP id 00721157ae682-8b4aa323f3fmr13334717b3.71.1794571688481;
        Fri, 13 Nov 2026 04:08:08 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa96b441sm18287547b3.23.2026.11.13.04.08.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:08:07 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0cf2c0785so8927477b3.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:08:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHBwJ2A2wiYBy/6odvZTeZ+rgDb7YTsVxyv6QLy9ilHnCwLqfBZRpcQUcRus2QX05IaDiUlKzD80iAj@vger.kernel.org
X-Received: by 2002:a05:690c:9413:b0:8b3:b06d:68de with SMTP id
 00721157ae682-8b4aa3b2d79mr10574347b3.106.1794571686768; Fri, 13 Nov 2026
 04:08:06 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105100322.37816-1-tanure@linux.com> <20261105100322.37816-3-tanure@linux.com>
 <20261110175451.GA833369-robh@kernel.org>
In-Reply-To: <20261110175451.GA833369-robh@kernel.org>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 13 Nov 2026 12:07:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
X-Gm-Features: AclHuK8ofQ5KQ8mwVSBPN6RHiYMAZFp4eZUj5gb-QcBMy0mlvdZGEaaXPcOEhAQ
Message-ID: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Rob Herring <robh@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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

On Tue, Nov 10, 2026 at 5:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Nov 05, 2026 at 10:03:17AM +0000, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A but needs two clocks of
> > its own. The controller reaches memory through a pipeline stage with
> > its own gate; nothing else claims it, so it is switched off as unused
> > and transfers never finish. The glue registers sit in a block clocked
> > together with the MDIO multiplexer, which probes after the controller
> > has programmed them: the writes are lost and the port keeps the
> > bootloader's delays.
> >
> > So the T7 gets its own clock list, without the timing adjustment clock
> > it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
> > the 2ns, and only the receive delay line offers fine tuning, so only
> > rx-internal-delay-ps is valid here.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
>
> I tend to agree with the sashiko comment, but am fine either way. Once
> the if/then schemas are longer than the main schema, it's a sign to
> split.

In V7 I will split as I think it will be easier to review.

>
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index e769c9bb70d8..ff5e50f65114 100644
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
> > @@ -84,6 +85,49 @@ allOf:
> >          rx-internal-delay-ps:
> >            default: 0
> >
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
> > +            - description:
> > +                clock of the register block holding PRG_ETH0 and PRG_E=
TH1.
> > +                Without it, the block reads as zero and ignores writes=
.
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +            - const: pclk
> > +
> > +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.y=
aml.
> > +        # The RX delay line of this glue is fine tuning in 200ps steps=
,
>
> Sounds like constraints:
>
> maximum: 2000
> multipleOf: 200

Yes, with maximum: 3000: the field is four bits, 0 to 15 steps of
200ps.
>
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
>
> Move this to tx-internal-delay-ps. You can (kind of ackwardly) do:
>
> tx-internal-delay-ps:
>   description: ...
>   not: {}

dt_binding_check does not accept "not" on a property under
properties: or in an allOf entry: cell.yaml allows only description,
deprecated, const, enum, minimum, maximum, multipleOf, default, $ref
and oneOf there. It passes only inside if/then, and the new file has
no if/then. So the property stays false, with the explanation as a
comment above it.

>
> (or "not: true")
>
> > +        rx-internal-delay-ps:
> > +          default: 0
> > +
> > +        tx-internal-delay-ps: false
> > +
> > +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> > +        # properties instead.
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -106,6 +150,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -142,6 +187,10 @@ properties:
> >        - items:
> >            - const: amlogic,meson6-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
>
> I would drop either both or at least 'snps,dwmac'. They provide no value
> because there is nothing to use them. IOW, there's not s/w that works
> which only understands the last 2 and not amlogic,t7-dwmac. Correct me
> if I'm wrong. Maybe a bootloader with simple needs.
>
> Rob

Right, nothing uses them: the generic driver cannot enable the
pipeline clock, and no bootloader drives this port from the device
tree. v7 keeps "snps,dwmac-5.10a" for the core version and drops
"snps,dwmac".

Thanks,
Lucas
