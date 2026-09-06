Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8CB3630AD
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 20:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725790; cv=none; b=jx+U5jOnHDhLtQLrtzXPadskzwtQrk5TdIIDTl/bv/csWAStDVy5xQxCLxM7kB4b5cTTRuoDQ0QiMq0YCTxroaVEjl9M5BDCg5MhQBcd+YpAqh7UTiwGKTBeeVvjw7jd+ghA15811Irc4O4f4d1rUbWdAmuyx0UU4Y3mnGkex6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725790; c=relaxed/simple;
	bh=/wj5OkijtfWbGuEcdD1xNBw5S+WlnsfIp4v0woF6s4g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=N3x99vX0aUnymrwxnJxUvtUEYJsAiBS/mZdH4kIl5ub7Mx7xn0zWBDtAxvThPh5A3U2qxT6Z6DNIFP80Fxr2Pu/SRcBBurZT1MXX2KGZ3B9zbHudS+RLXFFa8imAhxuSdnlrqzLya9QUXvGjtRcerIr07RBKefrS9cC66e3pN1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clpDbweS; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clpDbweS"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso2348434e0c.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725787; x=1789330587; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/3YAKshQBMHkaUZVm8z/vkmvM1MdD+QwhYNoLme4eGQ=;
        b=clpDbweSp+vGyYZd2Ly/yrl4ThmJUnzr+q/smAezSp6spBQi2Taj/wT6N6XHxsySVD
         nGXe7ON/ERR7+1zCFV5nr5FRdTInBNQnznYMnUDLLHziMoAJJ6AloZTWz4gsN27sLyOG
         zrKbUBoir7WUPskar34wnNhQfz5jJY0VR2O1Sx8EF4ipphWSfCc4fH6coIgavNGJeXm0
         sR4dF4VLauFM819c0fxRmulcqxsrMOvgwkQbnI87pe9zu5QUshhp8PF/M4m/5UyiJNCK
         +1oHLLToReHzi5CucHHR98TkeCcez9XNVMPmH8GKnqmiBXohnvbjQg+b3dq5lv/h9fc8
         ZdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725787; x=1789330587;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3YAKshQBMHkaUZVm8z/vkmvM1MdD+QwhYNoLme4eGQ=;
        b=LZvM020ew1OztZCbt6M9jqkCu1dCeXcMFBkcJu8BD1wt5c15lbrrNzfPz49Rk4kAcU
         Nxt0Lt9MteeTgZIgzgEZXgNE4996oOzFSila/MYhzv2GJaA6YxZpHFHDqKTnd8lMkfsN
         6AU0Tm6ky6ao75MinY9Rd4zZQlVGvoxrSh2c7pXu4DU3Rk0ELktg8YLiEUvqtgg1kNgy
         zJL4a63xbqCkWNoCOOeJcjvJ1KPOTcVgok8WwSYK0ahoxxQFFYPqAwi9ka53BrG4Wpb4
         s30MJnMI6GP5KHJaDL4oZA2VTRWcUrZaUHSOxvvpiXOLh7FLrMTW+nuxex8IKwtG0qYO
         H9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxFYJjZQgkxN+WTgOKX82r9Xv0N3phlENQhkfR7FVfJnrCqUvsPrAc5uWIuWKvniqANDOxwiGP1q86X@vger.kernel.org
X-Gm-Message-State: AFuF++myrSi9T2mLk2xcU+scGFRo7l7W5bb0YMoxP8aIDgxj2XOsfZRz
	iG/aZZeRhmkD+4vf3khgQhVVaOw3noaLsp0w4Jv4j06Tmw2g8pvtGzbq
X-Gm-Gg: AYBFou3uHWBbWQfiTeVGrx5tljr4OV+pBA9ICXTvx/tZNm5chr6xiPnwNm/EdRtysRn
	+XUffl4rKXor03/Bwr+XLjyUKb9a1qgSqkAT/hgCsR9vdMA3hODexeJSMBuk7a7bYEqyoKH3v5C
	zO+3WkItsYaoP4VxbSltMhlbwrp8QGEXNZ+1C1jnn964Mxzjej6w9paf3W4EH0UOEF1xDIT+pa9
	dyp4sPgewd0PyvqS4GRP39LTInVg8IGKesfzk6+loAeX4DRDtc6l/OCaYl29JemqjjXq6/EOKSh
	wamXBjkk0hpQVeC2jS5rI+MkEN1A342jxv884Q/EeZpVNtuSQDbrMRfyCaPqhjJIvm2aPsZGd27
	H6uOZICkwSzxQpW0U5hNwdoSuszLfRLOJ6Qnj308tN+P7w17pSL+0eNqvz3ZukyJSW4S7wMLa5b
	iJOTj/PrnD2O6wqTJSXEchl3sDLXf/RVd7doawf80aPqB3kZgkcT5/Nd9mpUnI
X-Received: by 2002:a05:6122:881:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c7ed7cba16mr8892978e0c.6.1788725786754;
        Sun, 06 Sep 2026 13:16:26 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9809e56231fsm4799735241.2.2026.09.06.13.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:16:26 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:16:21 -0300
Message-Id: <DL8IDBUQK5RV.1A9NGJ2K3X7FZ@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-2-1dc27e9c0260@gmail.com>
 <20260830025349.04ddbd1f@jic23-huawei>
In-Reply-To: <20260830025349.04ddbd1f@jic23-huawei>

On Sat Aug 29, 2026 at 10:53 PM -03, Jonathan Cameron wrote:
> On Fri, 28 Aug 2026 01:38:17 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>> integrated PGA, internal reference, excitation and burn-out current
>> sources for sensor biasing and diagnostics. The ADS1263 is compatible
>> with ADS1262, but includes a second auxiliary ADC (ADC2) to perform main
>> channel (ADC1) cross-checking measurements, system background
>> measurements, or temperature compensation of the primary sensor.
>>=20
>> Both parts can configure per-channel voltage reference source,
>> excitation current sources (IDAC), plus input and IDAC chopping for
>> offset and IDAC mismatch cancellation. This lets the device drive and
>> ratiometrically measure RTDs and other resistive sensors.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> A few queries in here from me.
>
> Jonathan
>
>> ---
>>  .../devicetree/bindings/iio/adc/ti,ads1262.yaml    | 376 ++++++++++++++=
+++++++
>>  MAINTAINERS                                        |   6 +
>>  2 files changed, 382 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml b=
/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
>> new file mode 100644
>> index 000000000000..7e26572388e4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
>
>> +  '#io-channel-cells':
>> +    minimum: 1
>> +    maximum: 2
>> +    description: |
>> +      The first cell selects the channel by its reg. The second cell se=
lects
>> +      between the main ADC (ADC1) and the auxiliary ADC (ADC2) as follo=
ws:
>> +        0: ADC1
>> +        1: ADC2
>
> This one is odd enough I wonder if we just say it is always 2 and that
> for the parts with out an ADC2 the value of the selector cell can only be
> 0. Also, does this ordering make sense?  Maybe pick the ADC with first
> parameter is more natural?

I agree. I think its simpler to just 'const: 2' and validate its value.

>
>> +
>> +  '#gpio-cells':
>> +    const: 2
>
>> +patternProperties:
>
> ...
>
>> +      reference-sources:
>> +        minItems: 2
>> +        description:
>> +          Indicates the reference sources for this channel. The first a=
nd second
>> +          items are the positive (REFP) and negative (REFN) sources of =
the main
>> +          ADC (ADC1). The third item is the reference source of the sec=
ondary
>> +          ADC (ADC2) and must always have a positive differential volta=
ge.
>
> I think it would be good to illustrate the 2 only case in the first examp=
le.
>
>> +        items:
>> +          - enum: [internal-p, refp1, refp2, refp3, avdd]
>> +          - enum: [internal-n, refn1, refn2, refn3, avss]
>> +          - enum: [internal, refp1-refn1, refp2-refn2, refp3-refn3, avd=
d-avss]
>> +
>> +      ti,reference-reversal:
>> +        $ref: /schemas/types.yaml#/definitions/flag
>> +        description:
>> +          Indicates that the ADC1 (this has no effect on ADC2) referenc=
e voltage
>> +          for this channel has negative polarity and thus should be int=
ernally
>> +          reversed.
>> +
>> +      excitation-channels:
>> +        minItems: 1
>> +        maxItems: 2
>> +        description:
>> +          Selects the pins for the IDAC sources from 0 (AIN0) to 10 (AI=
NCOM).
>> +          The first value corresponds to IDAC1 and the second to IDAC2.
>> +        items:
>> +          minimum: 0
>> +          maximum: 10
>
> Why do we allow configurations with just IADC1 (minItems: 1) but not thos=
e
> with just IADC2?

Hmm I think we can get way with this for simplicity. Both IDACs are
electrically equivalent so if only one is provided there shouldn't be a
problem? I'll try to think about potential issues with this reasoning
before v5.

>
>> +
>> +      excitation-current-nanoamp:
>> +        minItems: 1
>> +        maxItems: 2
>> +        description:
>> +          The first value corresponds to IDAC1 and the second to IDAC2.
>> +        items:
>> +          enum: [50000, 100000, 250000, 500000, 750000, 1000000, 150000=
0,
>> +                 2000000, 2500000, 3000000]
>> +
>> +      excitation-current-chopping: true
>
>> +allOf:
>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,ads1263
>> +    then:
>> +      properties:
>> +        '#io-channel-cells':
>> +          minimum: 1
>> +          maximum: 2
>> +      patternProperties:
>> +        "^channel@[0-9]+$":
>> +          properties:
>> +            reference-sources:
>> +              minItems: 3
>> +              maxItems: 3
>> +              default: [internal-p, internal-n, internal]
>> +    else:
>> +      properties:
>> +        '#io-channel-cells':
>> +          const: 1
>> +      patternProperties:
>> +        "^channel@[0-9]+$":
>> +          properties:
>> +            reference-sources:
>> +              minItems: 2
>> +              maxItems: 2
>> +              default: [internal-p, internal-n]
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    spi {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +
>> +        adc@0 {
>> +            compatible =3D "ti,ads1262";
>> +            reg =3D <0>;
>> +            spi-max-frequency =3D <8000000>;
>> +            spi-cpha;
>> +            avdd-supply =3D <&avdd>;
>> +            dvdd-supply =3D <&dvdd>;
>> +            #address-cells =3D <1>;
>> +            #size-cells =3D <0>;
>> +
>> +            interrupts-extended =3D <&gpio 0 IRQ_TYPE_EDGE_FALLING>;
>> +            interrupt-names =3D "drdy";
>> +
>> +            /* Typical common mode voltage configuration */
>> +            aincom-supply =3D <&ads1262_vbias>;
>> +
>> +            regulators {
>> +                ads1262_vbias: vbias { };
>> +            };
>> +
>> +            channel@0 {
>> +                reg =3D <0>;
>> +                single-channel =3D <0>;
>> +                /* The VBIAS is enabled on pin 10 (AINCOM) */
>> +                common-mode-channel =3D <10>;
>
> As above, I'd like a dual reference source example usage on
> a channel here.

Sure!

>
>> +            };
>> +        };
>> +    };

--=20
Thanks,
 ~ Kurt
