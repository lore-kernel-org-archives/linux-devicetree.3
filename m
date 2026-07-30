Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94843C1403
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785445933; cv=pass; b=e/a5TWsUksPFrZISPrvtt5Ex62rl+ByhDqQ55tFKkil+U4XXT4lxiWC/gTpdDwU5ngfe+HPuurnm0k0YSmMKNocIrYvJoT25o5tAWo+EGLIG4PQHFX9fXeIw8q8hWo+Ra431dIKWSkpFQ423/xdOC9eqObJsqRDlfH07VyMP9Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785445933; c=relaxed/simple;
	bh=iEk4wpw9FQcrEvdQXfSWeVmHqPtsb28Pgjf6F+uacz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0Ckb+fFl4NYCoXI3CeQOUdOIlBDoLR4MW+2Baxjsnoxmmkeepd570nQq4kuYDxLY2txHlKGUrPNb2oOYSOH94pcAEMjoNQjRfTTxXFJrKJpomc8gzTkc7q/jjKLpqICbEj8nMcbehcw2HcFLgUbeDVBmSG3Adn3eipgB49Cql4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDHdSGWU; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDHdSGWU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so21632466b.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785445930; cv=none;
        d=google.com; s=arc-20260327;
        b=DfhXf6jftNl2qSklWzB02nA91hve0dUWWLVBlkvjWQhklqcLBmJVnLjj46HbhhLRyJ
         TBimC8ANU9opiDs7eRMRVvnDMJ8pp4R9yltNeAsI23dnsphBjvMm7rd9oUGez1qthCq3
         j/B0Fegziny9nOtDHcx1kFVPD8SaXajrPo3sWgFpr4NlX99U0ALTxmel9uPEUxbdYdXv
         CdtTM/E6k1AshOFcNsWifH4MbCmhOCaSF7DhudTUZq7HkzYePomGFYUdd3R5WmSx/myW
         lohf0Mj6dvTIRm6y+/TeZfqYSGboXzUshUG909gbU4nfhyfIaJbpYxS/PivKmL5gfsYL
         IaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dc/ptklzYhJxPB/24UBcqyDH7hAbMtvydGT0r8k5oY=;
        fh=6sBxyZsn3Q/WcDNVlWzzOtgVy+pTGv/9QJlfQmqSivw=;
        b=lroJH9Z6lLAt2+Jwn7No8ayPurLA6PmHoLl/OOFZoGYyA+yyqm2OdS2m0XiFXTC6T+
         HefeV83Qt3sD1VlHhNO98/rAHtuVZp+oiNJIKTPTjYhqzoQKeMoAcZ4fr1GbM+YfvKFV
         h1K7FlJGfh0VKVlU93b10RRQkkgVj+G+NMXDs1MMfAq56eCQ+2QSe1RriiFfAgWmd/87
         gUqYZXq3L7eJmKzxRm27Fc4HMELM7yMz1HlcM0wuZVrnrWbhQnK6rPzDITxVv8xqGN91
         /81w4tgkR63lCxB12k4rVV17SLYr01mQANPHvp1M7V2bjwbSzyS4S01istQpocQfgydT
         jaUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785445930; x=1786050730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dc/ptklzYhJxPB/24UBcqyDH7hAbMtvydGT0r8k5oY=;
        b=XDHdSGWUjdgbK9XtauMeau0k5VXlRL5iUpIHnjb4TLgA9+tEh7OumZq5xH7NIfJOQl
         52pHqsLeJPynQvpbf8xjGfI2wEq2LvG2RF95Vj6LQ6eyLuEio6MgS28RZj/C7xDgkYTS
         zkUrgjo8lWqYr/xhnFNF4wScB9iH9JbuPfXHVAbD0qZJmYusr4U0hcZ6e01eJB+ngCyQ
         W4bF8jAKzN1bSZsJdfz3rsxa+eArP11uzSb1Jf4J7XfoOpHZD6dUGLETk5XAAPGRuIF+
         okBYtqHsWNep+W+GgGiKt+ia5jFXOKQ7R9a17u3m1wHK4UIQnquIbrQFb4l46m6m9g8B
         W8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785445930; x=1786050730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dc/ptklzYhJxPB/24UBcqyDH7hAbMtvydGT0r8k5oY=;
        b=GWKLy819giFqdhCIMTohR2BWVl/Omtmf5PaXVTP+rkMUtSdjc/7F/0mx3KgQ2kGiX1
         2Ph8oId5fhMH+09G/tP3BU3ZGZF4MrIP1T9WiOzBn7obxfuXOcqlr94wPNf+f6nGMZ9O
         NY8ZdFSteOXWqUvO8JoHvEDSSADgfujVkRC8TZABWmw3tyboQUiqYF3N60zKLaysirN+
         oTZPgCwhzkXuiJ00IdJqjAMq/0ekq1wjG+7tdTcEuTdfZwLar/GiVNDgfO40gZ9mLU/v
         4gPKl1wHQNiAFvHgtNkntctab4KgpHegHgjDNBmPsUVWzYs06419/6x+sknwVIhAJxWx
         KEpg==
X-Forwarded-Encrypted: i=1; AHgh+RqKoHdepWek9hlWZcL1vAfkgoBkEqWwNXr9jGMkLtfgBCOxQz5bvb/AOfPkpsKdOykQsQtuMCozBNUp@vger.kernel.org
X-Gm-Message-State: AOJu0YyGqh7V+j7FB1pq7nBOHWtgzpsN78lKx175OlN26o0AeLRHzscv
	DOipPeGUBlATqK9tZtspoBFxjRhO67jacSdhMSGpqF4D8BhLiwfNGskO7lim/LwCD6oYnA5rHgW
	KZFCuHMEDFFfxg1aY+QBkS9LdR2WwiRE=
X-Gm-Gg: AR+sD106qRC3c0K1t2RSVbL3+1yZiBms0MSyPi4EnOQ6YBee5tr94Z82lc4xaWTlkjH
	hVQN3TU0G67YGr1+4KDRQRJroabN00+xetVCNyODWA065RY55AxrHDc4vVUkACMMuUI+zigkE5c
	tkdmY+P0wxfRUkse1sWmZWJIhbKRvlij7hG9D+B+S5o9SbcJRL7NiTNdwhmkUUu5Qdxi133dLW0
	mY/B4gso5zlwAQkv7smHHFfrq8g3hKSoasquoZ/MSF2ubmWeZYjY4fBYy7sKsyC1wTmd414DhjN
	VHYLP+gnH/4dTIZ9uAHkqPwSVtZlJPMNEzPx1sc1AUFzJFrh77092EbvQzYqNG/ruAPUoL+d43l
	p
X-Received: by 2002:a17:907:d0f:b0:c1c:3705:dde9 with SMTP id
 a640c23a62f3a-c1fa580990cmr214119066b.64.1785445929666; Thu, 30 Jul 2026
 14:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
 <20260728-adt7470_thermalzone-v3-1-d4586478cdba@gmail.com>
 <20260728-meteoric-quixotic-sunfish-0de2cb@quoll> <CAJq09z5CQgzzFahoiteh9ykjdbsYpP=QZ2AugzY4tQ79RpA-cg@mail.gmail.com>
 <6cc03c4c-2d88-46f2-aee4-adb769d10cbd@kernel.org> <05b7f116-25a9-49b3-a31c-15eb4e6ec838@roeck-us.net>
In-Reply-To: <05b7f116-25a9-49b3-a31c-15eb4e6ec838@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 30 Jul 2026 18:11:57 -0300
X-Gm-Features: AUfX_mz2XCdOnosHGQc59ddl9-gEcC1_EFpjzuEeLq-UVrlScXWGcDPbsI2vkYk
Message-ID: <CAJq09z5GL16qQ6smjEHsiYxpXn6MaBkibwsvSR66cJ4kEx1M6Q@mail.gmail.com>
Subject: Re: [hwmon-next PATCH v3 1/4] dt-bindings: hwmon: adi,adt7470
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 30 de jul. de 2026 =C3=A0s 12:38, Guenter Roeck
<linux@roeck-us.net> escreveu:
>
> On 7/29/26 23:17, Krzysztof Kozlowski wrote:
> > On 29/07/2026 06:45, Luiz Angelo Daros de Luca wrote:
> >> Hi Krzysztof,
> >>
> >> Thanks for the review.
> >>
> >>> On Tue, Jul 28, 2026 at 12:07:09AM -0300, Luiz Angelo Daros de Luca w=
rote:
> >>>> The Analog Devices ADT7470 is a multichannel temperature sensor and
> >>>> PWM fan controller. It supports monitoring up to 10 external
> >>>> temperature sensors and controlling up to 4 fans.
> >>>>
> >>>> Add the device tree binding documentation for it. This includes
> >>>> support for the thermal framework by defining the "#thermal-sensor-c=
ells"
> >>>> property, and models the fan control lines as PWM channels by
> >>>> defining the "#pwm-cells" property.
> >>>>
> >>>> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> >>>> ---
> >>>>   .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 55 ++++++++++=
++++++++++++
> >>>>   1 file changed, 55 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yam=
l b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..bb2375a4a490
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> >>>> @@ -0,0 +1,55 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Analog Devices ADT7470 hwmon sensor
> >>>> +
> >>>> +maintainers:
> >>>> +  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
> >>>> +
> >>>> +description:
> >>>> +  Multi-channel temperature monitor and PWM fan controller.
> >>>> +  It supports monitoring up to 10 external temperature sensors and
> >>>> +  controlling up to four fans. The fan control lines are modeled
> >>>> +  as standard PWM channels.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: adi,adt7470
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  "#pwm-cells":
> >>>> +    const: 3
> >>>> +    description:
> >>>> +      See Documentation/devicetree/bindings/pwm/pwm.yaml for the
> >>>> +      generic PWM binding description.
> >>>
> >>> Drop description.
> >>>
> >>> You OTOH, miss ref to pwm schema. Referencing here in description sho=
uld
> >>> raise you questions... And then use unevaluatedProperties.
> >>
> >> I will drop the description and change to `unevaluatedProperties: fals=
e`.
> >>
> >> Regarding the reference to the PWM schema, adding `$ref:
> >> /schemas/pwm/pwm.yaml#` enforces the `$nodename` to match
> >> `^pwm(@.*|-([0-9a-f]+))?$`. Since the ADT7470 is primarily a hardware
> >> monitor, its node is typically named `sensor@...`,
> >> `fan-controller@...` or `hwmon@...`. Importing `pwm.yaml` causes
> >> `dtbs_check` to fail on existing node names because of this mismatch.
> >
> > If it is a fan-controller then it should use common fan schema, because
> > you might be missing several properties.
> >
> > Device having PWM outputs alone does not make it a fan controller, thou=
gh.
>
> It is a fan controller. The logic used here is the opposite:
> It has pwm outputs to control the fans, therefore it should be modeled as
> pwm controller and use pwm controller bindings (to clarify, this is not
> my logic, but both DT and PWM maintainers insist on it).

Hi Guenter, Hi Krzysztof,

Thanks for your review. You are both right about the nature of this
device. While the manufacturer markets the ADT7470 as a "PWM fan
controller" (and it does have internal closed-loop capabilities), the
physical pins are multi-functional. They can act as generic PWM
outputs or even GPIOs. Because of this flexibility, tying the binding
to `fan-common.yaml` would be too restrictive.

On my specific hardware (Edgecore switches), the vendor bypassed the
ADT7470's internal temperature sensors entirely. The fans must be
controlled by the main SoC's thermal zone (or any other userland
daemon/script).

Regarding the architecture, while I looked at the `emc2305` approach,
delegating the actual fan management to the time-proven `pwm-fan`
driver allows us to avoid reinventing the wheel (like cooling device
registration and state management) inside the adt7470 driver. It also
keeps the standard PWM consumer/provider relationship clear in the DT.
It still feels strange that emc2305 declares #pwm-cells and its
subdriver fans pwm properties and they do not work as a pwm
controller. Other drivers, like aspeed-g6-pwm-tach (with similar
bindings) do both: use a fan subdriver controlled by hwmon sysfs and
register itself as pwmchip. But this is exactly what Guenter asked me
to avoid.

> > Since we cannot override the `$nodename` from an imported schema, what
> > is the preferred approach here? Should I skip the `$ref` to `pwm.yaml`
> > in this specific case, or is there an accepted workaround for sensors
> > acting as PWM providers?
>
> You can skip the pwm.yaml in such case.

OK. Thanks.

> >> You most likely miss ref to thermal-sensor.yaml as well, but that woul=
d
> >> change the ABI since hwmon would fail on missing cells, right?
> >
> > Yes, you are right. It would require #thermal-sensor-cells and the
> > device might not have a thermal sensor connected if it is used as a
> > pure fan controller. Likewise, it can also be used as a simple
> > analog-to-digital temperature adapter, with no fans connected (and
> > "#pwm-cells" might be missing).
> >
> > To address this without breaking the ABI, we could add the ref
> > conditionally if "#thermal-sensor-cells" is present.
> >
> > allOf:
> >  - if:
> >      required:
> >        - "#thermal-sensor-cells"
> >    then:
> >      $ref: /schemas/thermal/thermal-sensor.yaml#
> >
> > I just don't know if it is ok to ref thermal-sensor but not pwm.
>
> Feels ok.

Thanks.

I'm sending v5 soon with the current approach. If needed I can revert
back to the subdriver/cooling device directly in the adt7470 (as in my
v1). In any case, both approaches share the same #pwm-cells but the
subdriver would require a new fans property.

Best Regards,

Luiz
