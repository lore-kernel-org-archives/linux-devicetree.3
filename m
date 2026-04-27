Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A018386441
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777329411; cv=pass; b=dd3CjTepWqMfF8Dj/igEYVBFZRV6x8SB6iMM5gUQGkL0mdzRudxX0dpHZmABaDueRrTuBVbKmKYRsgVu95UQF7r5wmrn9IL7Iy1/g9tFtNUV2Xee2+vK/+fzggug7IZxDKmfw4lE/gBgf/8UidAuYNkUV4/VsmgpvrEvRJbnKso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777329411; c=relaxed/simple;
	bh=KU+H8n+k3fh/vRzWZNdtPrnyyVuczsKwihEjQNWxkp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3H37HUVAz9DY5HT1xaITe8Z93AKmWXHi/eRraglK6Ge+pbjXM/hpFlvYoe2QAzp9fRhkufOMoW9oyl6dTKmyuvFu96kQarnvHoiRzHGCrbLhGRu2caP18LV5UjOSD/Tv+/LSfp1bXTjMDe4okI4bC3RCLdzjB9sWaAJKQxbTNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHajpzPL; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHajpzPL"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e9653b580so119554101fa.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777329407; cv=none;
        d=google.com; s=arc-20240605;
        b=EUjSqYdtSOo+CAmXPin8YQUWOsLQIOff5+pSyTG3v37JuY7WIEsTPOEty6CxjDJFgl
         QmjbFHVKT/owDu2to2O0a7uz06AyX4spWHN1RGX0kxgpR3fyNy1s4ZMhkPvBJ43lGpQT
         k9cuAJTRE6IlRlm2+ucaFLQO9xgUUSGK2xTn4hhwGMQzR/euHpxS1VhkSbJmwY2aCzsw
         AbB3EQ+rwC+XW4U16jVwaf9P6JkgRrl+zL+0/M8qIamViz7FDFQiyxmDoz4i7jVkTsFn
         OFGOWmCO4iUdy6QCYzMRdrfce40IG5WFuX4Fo4LhWmbj7ulGmF+o4vr+CnrK9MuNR6eW
         Duyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WO9kHGE+hekdYqyvMyL0grB4aNKxPDxwjf+xYVdptx8=;
        fh=d4a0MqGjo407o4dVLdAy2Zez/Bh7rXg2eYXWe9Ir72M=;
        b=j0AEm9URGljwVjYKkag5+WLzSIKpOR9izlT3oP5Uy7D6lHLQkw09tWjewdfh23QNf5
         +4MTNKBydYwDDn8GKB7l3Hg2RzEFU2sbmOxT0+Y1YChAfcnIL0fpGRx5abKSmDbXXPmX
         y7TjzkgUHt+MB14OOPAd2DLOEJDMbTh7DUHlPQo6HQyRYANaLOA/+MYe3lvZrqNxJG/B
         HxtESK6v7ZjVSwZFzhds/ReVmdfDRcERt2HgWS8Yi1Qsxivjn8+6pWtPQl3p7yoYNCCM
         PUFBE+oWgDWLM0slQ/G1ZvziPcflrI6t33IhQEeECllJN42oSqAkBvRWawbaqL4OVbVh
         OUDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777329407; x=1777934207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WO9kHGE+hekdYqyvMyL0grB4aNKxPDxwjf+xYVdptx8=;
        b=lHajpzPLVrDmpD0n8RzykwPiHrz/kTN7bTK7j0FHXzR9g/sCzp1Vy9qyoayW+8aoyM
         uvINEIThYBog5GcC3ESMrbdiXyd9IVNhnhYMPPoLmEr0CH6zo7xlGilc2kn8zktbjo2s
         W78MTHw8YhXomqC3V/IKNAp33hOzJXM3/mW7zENuPZdkIQNnvsm2eEoOyTlBQuIFn11W
         Bb3WSyBiUEbR/P33MhNqCrbNn2PUS4Uz9DXo3eEpKj506XjLDfdOMEYHh09LiECmM5ag
         wOEehoggCK6ervQU8YlGnp12Qh1E8guZRNWIiK67mdaBNB2tuzmaRd1Z1OWMVgTlDoJl
         VYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777329407; x=1777934207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WO9kHGE+hekdYqyvMyL0grB4aNKxPDxwjf+xYVdptx8=;
        b=GTYq5iR7TIGsF4zNvEjzf8yHE8DPKzV2DWoyAw39bJUW7RpclBrn4rlOpKJf9RNJiO
         QF7w/5Cm9VnPw8ngA+HyYm/vW7ODcSDYDedX02zv4e3/VsoYAOSVQUWexw8zTdYR4uXD
         5sk99vVPEsT5qon03mmsLlPG7eXq6d6KQSUdBEcKt4UtPdc8Igx8/LBbzIOkAYEu895q
         cv8G52HGsh0ltg1VsdYuvJwB0N7jgrTmhlPw1MTyQj31jDVgJ8oVOZj2UR6XRAXR+Fj9
         lcjpfX4O2ENl7r0DJ5kdftipOhL8uWRCI8hpb35hARt8+hFFMfRI5F9Gx6yHsOv6P4JJ
         0Qog==
X-Forwarded-Encrypted: i=1; AFNElJ+OyaYjt87vsjFinhNsWL49r7jJn0WFdA8HISaCVPfJxfVPXcb7bG1Bro/Ub0kyI6rp9tzpOYDJw7Ev@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Cf/1uAxjDeAHK25t3COcbsMe5IhDEHCQsC/DTHmOoqggE/f3
	8Rh/j86gbsGIRA9GmOtD2sDRIG/Hgfbw8RivRnEdeRAYd891vbZaYOaNBhA3SUOeDuOzQockhfX
	GcYz5/98pnO5viHnEh7cLhnCQrYPGUucMUMvi
X-Gm-Gg: AeBDieunagCMsEEYXxzdPfm9Bs2fgBmU9vkTfp7OSG03LTqwLFZqDzvyDOKmalntWkw
	Y143L8572A0ND1WGZI+6hoKouCk9zTHCR+x76Mt2o581gll68E1jteEhO/ID9grD5jJqfKIvqxl
	24znDHB1rdN9klIpLc8XLlxWEhRa9sFFuJEk5cFzMp/MZI/zsO6qwltU8O9Gxqy8/C1+7WSik4c
	QPajS9nfBJR2kws5ZRtnrxJZ25644l4C04GdNvLK1hKDtRfmPvY3idTdoLNn+eUfeL9Gk8cINUa
	WBI6o7YeWbOLh8rJC19n8ZkWWTfSfcPooktKyrLrVb2pm0KcAJ25AxGLgzScofgmBEahSUfVDes
	FXxg=
X-Received: by 2002:a2e:a994:0:b0:38e:9277:6990 with SMTP id
 38308e7fff4ca-39241005c6dmr1031461fa.30.1777329406920; Mon, 27 Apr 2026
 15:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
 <20260427100950.33936-2-piyushpatle228@gmail.com> <93a7ca0d-46a1-4b14-8f49-348018c4158b@baylibre.com>
In-Reply-To: <93a7ca0d-46a1-4b14-8f49-348018c4158b@baylibre.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 28 Apr 2026 04:06:09 +0530
X-Gm-Features: AVHnY4IsI2yvvegTbDUOQtSlGuLVE1gCectp15dfz7NDja_TYvYprrvJaurSLjY
Message-ID: <CAMB+xkbh0V-qnxq94r6aefJscVwqh-8XfnKUR5mFPTsyz023JQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatible
To: David Lechner <dlechner@baylibre.com>
Cc: ak@it-klinger.de, jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 8:59=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 4/27/26 5:09 AM, Piyush Patle wrote:
> > The HX710B shares the same two-wire interface as the HX711 but differs
> > in its channel and gain model: gain is fixed at 128 and the number of
> > trailing PD_SCK pulses selects the input channel rather than the gain.
> >
> > Add avia,hx710b to the compatible enum. Document the chip differences
> > in the description and add chip-specific supply properties (dvdd-supply=
,
> > vsup-supply, vref-supply) and a rate-gpios property for the HX711 RATE
> > pin. Add allOf constraints that forbid HX711-only properties on HX710B
> > nodes and vice versa. Clarify the clock-frequency description to
> > reflect its actual purpose: controlling the SCK bit-bang timing.
>
> Krzysztof gave a Reviewed-by on the last revision [1], so you need to
> include that here or explain why you didn't pick it up. If you just make
> a trivial change, you can still pick it up. In this case though, I think
> that enough changes were made that it is worth having a DT maintainer hav=
e
> another look.
>
> https://lore.kernel.org/linux-iio/20260423-famous-tody-of-opposition-73c8=
af@quoll/
>

I did not carry the Reviewed-by because the binding changed majorly
in v4 (vref-supply added, dvdd-supply removed from the HX710B forbidden
list, new allOf block forbidding vref-supply on HX711).
I should have mentioned that in the cover letter; I=E2=80=99ll do that in v=
5.

> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> > ---
> > Changes in v4:
> > - Add vref-supply for the HX710B VREF reference voltage pin.
> > - Remove dvdd-supply from the HX710B forbidden properties list; the
> >   HX710B has a DVDD supply and the DVDD-AVDD channel relies on it.
> > - Add allOf block forbidding vref-supply on HX711 nodes.
> > - Add an HX710B example showing vref-supply.
> > - Update description: avoid specific channel-number references in
> >   hardware text.
> >
> > Changes in v3:
> > - Drop the vref-supply mention from avdd-supply; no such binding
> >   property exists.
> > - Drop the clock-frequency sentence that repeated the schema default.
> > - Restore the example node name to weight.
> > - Remove the separate HX710B example.
> >
> > Changes in v2:
> > - Remove driver implementation details from the description and describ=
e
> >   hardware behaviour only.
> > - Drop unrelated punctuation cleanup.
> > - Add dvdd-supply and vsup-supply optional properties for HX711.
> > - Add rate-gpios optional property for the HX711 RATE pin and forbid it
> >   on HX710B.
> > - Add the allOf if/then block forbidding HX711-only properties on
> >   HX710B nodes.
> > - Clarify clock-frequency as SCK bit-bang timing, not a crystal or
> >   external clock input.
> > - Sort compatible enum alphabetically.
> > - Remove redundant example comments.
> > - Update the HX711 example to exercise rate-gpios.
> > ---
> >  .../bindings/iio/adc/avia-hx711.yaml          | 82 +++++++++++++++----
> >  1 file changed, 67 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml =
b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > index 9c57eb13f892..fddd296bfaca 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > @@ -4,49 +4,91 @@
> >  $id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: AVIA HX711 ADC chip for weight cells
> > +title: AVIA HX711 and HX710B ADCs
> >
> >  maintainers:
> >    - Andreas Klinger <ak@it-klinger.de>
> >
> >  description: |
> > -  Bit-banging driver using two GPIOs:
> > -  - sck-gpio gives a clock to the sensor with 24 cycles for data retri=
eval
> > -    and up to 3 cycles for selection of the input channel and gain for=
 the
> > -    next measurement
> > -  - dout-gpio is the sensor data the sensor responds to the clock
> > +  The HX711 is a 24-bit ADC with selectable gain (32/64/128) and two
> > +  differential input channels. Channel A supports gain 64 and 128;
> > +  channel B supports gain 32.
> >
> > -  Specifications about the driver can be found at:
> > -  http://www.aviaic.com/ENProducts.aspx
> > +  The HX710B is a 24-bit ADC with fixed gain of 128. One input measure=
s
> > +  the differential voltage between the two input pins; a second measur=
es
> > +  the DVDD-AVDD supply voltage difference for battery level detection.
> >
> >  properties:
> >    compatible:
> >      enum:
> > +      - avia,hx710b
> >        - avia,hx711
> >
> >    sck-gpios:
> >      description:
> > -      Definition of the GPIO for the clock (output). In the datasheet =
it is
> > -      named PD_SCK
> > +      GPIO for the clock output (PD_SCK in the datasheet).
> >      maxItems: 1
> >
> >    dout-gpios:
> >      description:
> > -      Definition of the GPIO for the data-out sent by the sensor in
> > -      response to the clock (input).
> > -      See Documentation/devicetree/bindings/gpio/gpio.txt for informat=
ion
> > -      on how to specify a consumer gpio.
> > +      GPIO for the data output from the sensor (DOUT in the datasheet)=
.
> >      maxItems: 1
> >
> >    avdd-supply:
> >      description:
> > -      Definition of the regulator used as analog supply
> > +      Analog supply voltage (AVDD). Also serves as the voltage referen=
ce on
> > +      both chips.
> > +
> > +  dvdd-supply:
> > +    description:
> > +      Digital supply voltage (DVDD). For the HX710B, DVDD must be grea=
ter
> > +      than or equal to AVDD. When DVDD is a battery rail and AVDD is a
> > +      regulated supply, one channel monitors the DVDD-AVDD difference =
for
> > +      battery level detection.
> > +
> > +  vsup-supply:
> > +    description:
> > +      Supply voltage for the on-chip regulator (VSUP). HX711 only.
> > +
> > +  vref-supply:
> > +    description:
> > +      Reference voltage input (VREF). HX710B only. When omitted, the d=
river
> > +      assumes VREF is tied to AVDD on the board.
> > +
> > +  rate-gpios:
> > +    description:
> > +      GPIO connected to the RATE pin (HX711 only). When driven low the
> > +      output data rate is 10 SPS; when driven high it is 80 SPS. If
> > +      omitted the RATE pin state is determined by the board wiring.
> > +    maxItems: 1
> >
> >    clock-frequency:
> > +    description:
> > +      Controls the SCK bit-bang timing. The value is used to derive th=
e
> > +      delay between SCK edges; keep the SCK high time below 60 us to
> > +      avoid triggering chip power-down mode.
> >      minimum: 20000
> >      maximum: 2500000
> >      default: 400000
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: avia,hx710b
> > +    then:
> > +      properties:
> > +        vsup-supply: false
> > +        rate-gpios: false
> > +
> > +  - if:
>
> Could just be else:
>
> Probably OK either way though.
>
Will switch the second allOf block to `else:` in v5.

> > +      properties:
> > +        compatible:
> > +          const: avia,hx711
> > +    then:
> > +      properties:
> > +        vref-supply: false
> > +
> >  required:
> >    - compatible
> >    - sck-gpios
> > @@ -62,6 +104,16 @@ examples:
> >          compatible =3D "avia,hx711";
> >          sck-gpios =3D <&gpio3 10 GPIO_ACTIVE_HIGH>;
> >          dout-gpios =3D <&gpio0 7 GPIO_ACTIVE_HIGH>;
> > +        rate-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> >          avdd-supply =3D <&avdd>;
> >          clock-frequency =3D <100000>;
> >      };
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    weight {
> > +        compatible =3D "avia,hx710b";
> > +        sck-gpios =3D <&gpio3 10 GPIO_ACTIVE_HIGH>;
> > +        dout-gpios =3D <&gpio0 7 GPIO_ACTIVE_HIGH>;
> > +        avdd-supply =3D <&avdd>;
> > +        vref-supply =3D <&vref>;
> > +    };
>
