Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5630FC03
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 02:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724259; cv=pass; b=mXhspbgINC7g/iGp3yoDEke2p36sVErIvl7tjUaZF3TaQGUeqxDSGxGQlDqe1WnnTXuCkYQhGU7tiGs/cosPFZmGi2DjLQsdvzyF5ck9IVMFk8JCTdNG9Lp2bQA5HXdf65JgepoqGEVqT4oL3Tn6aOzEj2Op8IpOQrjxSf48tKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724259; c=relaxed/simple;
	bh=jNyNjdk9PNgwREJvOimkD8X6lwxWtmK86IwlK0nh5Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl/LAFEDAA7PIYYmmnpNBEfGyxdLEcA9RZ6iKHHLO160DaklrTu+BLSHiAOJ2j8Au69A1FYIKy3ljJGNYUtLNzOfjzdxZBs4Q6RfkzlJcMVnx1Z+rAXSYx3LdV3+aL5y2Ung7H/ApPiQLgo81KG9exn35CAdyJkF0FbHeLFhRC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o50OZRYO; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o50OZRYO"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b015532f7bso2371823e87.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 19:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785724255; cv=none;
        d=google.com; s=arc-20260327;
        b=IpMB+sOf9WZ7kc2LukKhAbSv6kVDX1p1ktEcL2udVccc2GGtbAzbaFFVvdVK5hqrF0
         LwCp9P11czO7QkuBy+vJj+5p+tNogvfICd4P2GHMIVzQ/w1XQOnNeKJgL/kM3OUOEZj4
         J3OXcy5HsmWMbg1lCukG2W5O1gPk4nQ7LpCOafTDxFWOcfGqzsZVEhu3aTLhsVB8Yc5/
         KVtyOjkxb7/V0SoBBaDgvviGE07sBGMTlIX6Ve5tGjZU5aoaRZy+amuf42O15aAf5cll
         pSB45Q42G8qR6HlpuW1yghrslIinHdyGOS1ralvwyvUrSbhHpZmwh3Xe+qwogc/W7wBT
         N13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RnMU7IHc6px78a2zQeM08cBItnOh1w1M97WR78ocvnY=;
        fh=QwSZs1ehrBersG0pYXsPJk14uaiH5/8bgpSpxt2em7E=;
        b=CHKyzv3UNjtjOB4484xP4pyyfSrQZdmsi5GWltma3bjukddWTWOQeKiE8YUd8IGe8d
         JX6jhgxqDwki8+XYtgLc1InRkMhShbPQwlkEY3Qc45P7h61kH7BtTslBUmc1AhxfehAs
         32GJirrrBNZaDwomrMOd93/1z4PrSgKhgPztaC8dwY0rx6NFoDDk4DN1Eh1Y1+H3FTOe
         zSkQ4/f6zT6OlQvTi5EcMx932tV/aBz8gRYaFg5+m9lTHtym0bI6RxmdfSKK2C2NcChY
         a/MH9IUzThuOO3qyFrmjFiLcPIPOGQhvAVZlhiqbbl4M95kHYF33h7rL3e4wJx7i1tPc
         Bodg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785724255; x=1786329055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RnMU7IHc6px78a2zQeM08cBItnOh1w1M97WR78ocvnY=;
        b=o50OZRYOzqlLy/v3oYD+/Mho3TOKqWJDKF85QFyTeDL+K5SBGeZ6o2E0z0+bgE33J9
         Wb+s9N/kuzKDQu53nNDVDwKoEKxgIT1fI5/mnM/4uL1qpD+FhHpSnEqqtiQyflVCCZyR
         CoB8S09SuZL5/XfTdYT57rKKJE+vDPzzodwtKNI3aA2RUCDAB8fGmFySyD2gNl/pkYUo
         fR5PJ46QVRTnzaIGeSoyW3jqENlKCXv2gLekRpVx8yakDpOFvLdnT5zwDdMUhNTjmzrd
         eIjpvCxYyyfLyYm7BX/zsO+xCLMxL3zfO0nwAa82/d0yPm1WZ7WntaFS9u/Z4q/sCNaj
         ZAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785724255; x=1786329055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnMU7IHc6px78a2zQeM08cBItnOh1w1M97WR78ocvnY=;
        b=JE+PgX84/lfQ5J9oAEpgzVXjIxU7JJbgUpHyISnacnajidhVLn+vHmejI/dWswGKHm
         p9QYRve9f6gOgnZgdNNP1ySRRM2cu/afmWjGfaJsvzDZZNwsW8g75YNrGhpPE5ZZ/UiR
         JzYrM1dMcPG9xUva8vNzVmYZ9PF89qEDxSdAG6rBgEOyeXP1IYrz9nRoIk4+gGdD8WdK
         4aojzVruCfbczQBc0/ZBTZ8ivlrh4AWuI4jNn6jDWXCqQZl6TM4HExh7fvh+PfUtTWyC
         7TrLQGMZeVC1vp9B553xgVGRj84R3c8UefTra+U+QvTVcuECibUZS0LYizwEpnECidOs
         Pgvg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3VkW+Ci3Jo7wZA8lcWejeuIZVZRyMMUyNeC2gCjbH1S6A/BDDU89BFClnQdoxJrUB0xK3srEZk9w9@vger.kernel.org
X-Gm-Message-State: AOJu0YylgZuDsqVbuvffa2ZbynDiT5nznthJDm91IpBBLTBAgKv1SZpR
	DxLsPc2bVFoDJ1kd5OukErCzHfKU4g5ttwdzy3t4C11i8FpmoeyjcOrF8BcfaMSqVmlgIAee74N
	A1J4kXRwaaymIsRmKrYqSKTk6dp+mNos=
X-Gm-Gg: AR+sD10rxD7CXzB3vR4WWq2BbfObinZw6IspG5UEZc7sF92vif+6HohDYbnC5aO4joA
	pkPxcab8Xn4ADvt/LlUCDvC+RwfQCXi6uyDT6ZSGyohD0MCv/IfFMedBMTfKyVEKG86mjDSti1u
	KHn7oNXn21Dhb9lVx5tzKX0BRsxKINmNSmCyMqlrnh9Njv94oc5qF2hRPd4+NXWKDEBig+5Egqy
	po03qrRPIG7PTSa+UaF1nasZOD1ThWyIU56MQk+Ykz1wquIrDI1KjbwqHNdwLxkZwBjLI5LOQSc
	iVJj98U7vKuWfoZlgZqH4e/g7rV+PxO/NOQoRP/TIHeQKU19i3jRfJWn
X-Received: by 2002:a05:6512:6614:b0:5b0:eda:de25 with SMTP id
 2adb3069b0e04-5b2e4f18512mr1212646e87.6.1785724254914; Sun, 02 Aug 2026
 19:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
 <20260731-ti-ads112c04-driver-v2-1-aab0168c3c01@gmail.com> <b2297241-e0ae-4058-a406-348440798e38@baylibre.com>
In-Reply-To: <b2297241-e0ae-4058-a406-348440798e38@baylibre.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 3 Aug 2026 10:32:45 +0800
X-Gm-Features: AUfX_mxvBmWr20zpVeWomwBTghWXfR5czaw5n8HLsdzKC9VbeOD2hGqhKXv2nj0
Message-ID: <CAF7HswOr1CbsR2+K06NwCNty=xJg5mgCa8mXxY_nSP8um-YBRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 9:52=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 7/30/26 9:58 PM, Kyle Hsieh wrote:
> > Add device tree binding documentation for Texas Instruments ADS112C04
> > I2C Analog-to-Digital Converters.
> >
> > These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
> > interface, programmable gain amplifier (PGA), and data-ready (DRDY)
> > interrupt output.
> >
> > The binding uses child nodes to dynamically define the connected
> > single-ended or differential channels.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 122 +++++++++++++=
++++++++
> >  1 file changed, 122 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yam=
l b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> > new file mode 100644
> > index 000000000000..6a5ffda84b80
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> > @@ -0,0 +1,122 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/ti,ads112c04.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments ADS112C04 ADC
> > +
> > +maintainers:
> > +  - Kyle Hsieh <kylehsieh1995@gmail.com>
> > +
> > +description: |
>
> The | isn't needed in this case. (It is only needed if we needed
> to preserve formatting, or if there is a : in the text that would
> be interpreted as a dict key.)
Understood. I will remove the `|` from in v3.
>
> > +  The ADS112C04 (16-bit) are precision analog-to-digital converters (A=
DCs)
> > +  with an I2C interface. They feature a flexible input multiplexer, a
> > +  low-noise programmable gain amplifier (PGA), two programmable excita=
tion
> > +  current sources, a voltage reference, and a precision temperature se=
nsor.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,ads112c04
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C address of the device.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: Data ready (DRDY) interrupt output.
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO connected to the RESET pin. Active low.
> > +
> > +  avdd-supply: true
> > +  dvdd-supply: true
> > +
> > +  refp-supply: true
> > +  refn-supply: true
> > +
> > +  ti,refp-refn-resistor-ohms:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> As the bot said, don't need $ref here because it is a standard unit.
> (So don't forget to run `make dt_binding_check DT_SCHEMA_FILES=3Dads112c0=
4`
> before sending.)
Yes, the `dt_binding_check` robot caught this right away. I will
removed the redundant `$ref` and resolved the warning locally.
>
> > +    description: Resistance of the external resistor between REFP and =
REFN.
> > +
> > +patternProperties:
> > +  "^channel@[0-9a-f]$":
> > +    $ref: adc.yaml
> > +    unevaluatedProperties: false
> > +    properties:
> > +      reg:
> > +        items:
> > +          - maximum: 15
>
> This chip doesn't allow arbitrary combinations, so there
> are actually only 12 possible single-channel + diff-channels
> values. So maximum: 11 and channel@[0-9a-b] would make sense.
I will update the regex and set the reg maximum to 11 to strictly reflect
the 12 possible MUX configurations supported by the hardware.
>
> > +
> > +      single-channel:
> > +        maximum: 3
> > +
> > +      diff-channels:
> > +        items:
> > +          maximum: 3
>
> For this chip, we should also have excitation-channels, excitation-curren=
t-nanoamp,
> and reference-sources.
I will add these properties to the binding to fully describe
the hardware capabilities.
>
> > +
> > +    oneOf:
> > +      - required: [ single-channel ]
> > +      - required: [ diff-channels ]
> > +
