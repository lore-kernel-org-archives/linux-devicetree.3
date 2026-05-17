Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46352F7EEE
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028047; cv=pass; b=bHlZY3RL8qbB3wWbxoaHc2h7fgnCzTCup9y9cU59b2Br7BCffuZhb5ZJRG9vrnxz5za86UUg6fB2NXZ/w1l2EM/8S47NPhJqwu2XxHGa5O19LBehAHk0ykRXwIuvEWshkIN2KsZkb8mRvGepMTEiX5SVZK9kUuQePIsbdvgzALs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028047; c=relaxed/simple;
	bh=IZHMWs+8Cp/KOe0MB2/iet7ivwJo1nP+BQO/cuxTsWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLuMeGLrC20etzHr0yLwY2aLfJ59AOVWTS0VPHC31WLvVBR+B34d4hRX8WRuyQuNahElXH2SwdnzVgk89xPK+Hx5YFeeWr6ptaXrwj5BvsGqDKUihNiLbdZqNslLu9gn/tupZoBLFkNrXdXTZLjUtm1LRNKU2qfWUCPPmXZ81lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFi8kcNN; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFi8kcNN"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-135200bc7d2so3425546c88.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779028029; cv=none;
        d=google.com; s=arc-20240605;
        b=FH2e1uzb22Lq759cXCV2+mT6VDJmNdplipMh1sveR7C4W+JRTW42hXDSW/7hEh0pyN
         /YJBV3PSoZXHdi+cpxb+57A3KaWO4oKZaF8k1bY1sxI+o7rfEhsZsoD650Bw5DWbc9Go
         /u1fSoEdPXd17HUqtk1BaPRnkvQDC0gVjVPS9SjvYzCK2cNQa8ZIp7WJxHl7doGoJ+F/
         7BpAwTu6VvWvSaK9adQHnqcG5P8rHW5ZKauE7748JFs7VRexUIythKnLSFXtyXD4iO00
         A72vlUuW82aS3mPdVROF3fRTF4pa42eqxzwh9QXKs4KIHkM/U78ZzPiaXvIOegpOP67W
         e9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/a8k6USexvPeSs3shg8rdzm72XqtvkOnD2zVZ13eQgA=;
        fh=aFtKljGC5QMyticNOxxmF7JPlYWRXMT4jv1qKl73ydQ=;
        b=dI7EPSKA44k9xQLSX8VeO0GUrrLlE1BRbVL3oidt2zFTGJWHX5RBrRVFSnm3bjAVuF
         oj5xNTS3CTmviwX+L2PBFkXPrjFAk1+iuUq10kqpMvFUmLAGOv3sYEcXMjiS/IKhpal0
         YxyV+clV55A40jx3PPNlEZzpBm0LTnP14sORDWtEn0tjhqHbi1hBCdkGuTDYG9J9wE8r
         3Jn2D4UyjJ3IYDWmAcgDDwkvfzgkStl9QJ8NOTiE1TieO5XsQSVv3zyEbfQvJI2lrtai
         4PPfglJxNWG6zYzvbnUKgSrUKBzB3IpeW+HO5t73qXt304h7KScr+lIgPL9JC+wr7UOs
         DSMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028029; x=1779632829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/a8k6USexvPeSs3shg8rdzm72XqtvkOnD2zVZ13eQgA=;
        b=LFi8kcNN3DmGtdifJZsCdIXVMuz9BXu6AWo42tERT5aeZAQajuOZObh9y4TqR/I8EX
         AT/seDSYZr0I1pYQMHeN49IMfkGU6SzEdMNVep2hXD7/zUWvmdNAlUC/Sj+Fx24bkJzo
         MbVFCm8aiBsZ9y1otZ5s6ul5RtqaW5S8iFW4kLPFcdUJ0GaBqx1L7Siu79N1FB6SDlBi
         15YF7TI3oYyD9jBmbH+WxspMMvcU56xqagV17S0cK4XGnZIsPmPSzwmAnZhzGa1YMQBB
         HZh7yFZ3OMkOKwz5EUoG79Gz0FC1CcuvOuoLcmiQ5WrC0hWen/gJkWOjzgmjcP8hKdNs
         Xb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028029; x=1779632829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/a8k6USexvPeSs3shg8rdzm72XqtvkOnD2zVZ13eQgA=;
        b=IznjE2LMUtQHnW6+gZ/42Nk8szPfDk8ZJjHVN8uysqQgdUvXUn8Qqt7F/NOL6TTfe0
         Vq3m4mgROITSLPGOshnJhEphbW0AMNyWyKXmyzxoPKq4nIEU/HxOEFiDZ8+mjMHTz+10
         IHbtrVQjYOLtJHXyrL/KowsBHxaBJqw303WAxJYIoKp+VJKL3R6Xiwr/WQHmrxwaL7NE
         O8PDX7J6vjUM0AyXSlX/HqORR1upxoYp4lUOVJZrxkx711AEMFHnnhD/kxPP1I3iM6Um
         /iyerZw1Em2KAwJbLl2zdOS2UKqMVbK1+deKhzWmeCV/wU34qlV28grhwIjyOr+LcS4v
         LXWA==
X-Forwarded-Encrypted: i=1; AFNElJ9HEh3p7JedFzhcf67u3u+NrkJG6rjlqNCnaRofg/D5Yfp8bRGp1cb26LI13sni3dppx458Pz/YNlfF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2AmZfVwhbmASd5UDh2RVsk1XJHxy/ujci4E2vNZ3zAjV6x0p
	BBBrTg3hBFiU86+/dhFkK94YJZy+nZuqCnwo/0ZNizyI1oJEgDdq+s5bufVyPS1wvV9QyecuVcF
	uOqcYohVG4F5FldGlkwOMEshjlspkA1E=
X-Gm-Gg: Acq92OF4Y7OlFoxeWtxyj80n4ay7SZKeBZ6B/qL4GJeBOZPiuzjnAJQnIeUafpE4HrS
	IWb1f+clfOvyBDAR8w+A7hKgbDUUYu67a6Qebn+FE7oNDdbI4O8dPsIkByhFIP8iWtCWQq2y4k4
	wG7CitUARRGbsqoxIakHe7Pl9/owwuaf835CDjrYjbivHjEh/uVEnh8trgaj6sXVUBt5CjEv8Bp
	84rnP0eatGGrm15L1w3H8JL8LiTKR7vaB4HCKYVRAlcikT5HbGmdxQWvN4/yL3ewTXnKmdSBqCc
	ybd7Axk4
X-Received: by 2002:a05:7300:a907:b0:2f0:c8b5:3dc7 with SMTP id
 5a478bee46e88-30398680c36mr5240683eec.22.1779028029014; Sun, 17 May 2026
 07:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <20260517074306.30937-2-clamor95@gmail.com>
 <20260517144453.61cc210c@jic23-huawei>
In-Reply-To: <20260517144453.61cc210c@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 17:26:57 +0300
X-Gm-Features: AVHnY4IEMjYjQh2-EeqHWPNZxgaMpOfNHnP0k3ytWy1tFi4KeKl3gs6PRb7odls
Message-ID: <CAPVz0n10naSo_1n99orPGM4U8iDkOn1DW9Xe_RGE56CMpLm8kQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: leds: Document TI LM3533 LED controller
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:4=
5 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 17 May 2026 10:43:01 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Document the LM3533 - a complete power source for backlight, keypad and
> > indicator LEDs in smartphone handsets. The high-voltage inductive boost
> > converter provides the power for two series LED strings display backlig=
ht
> > and keypad functions.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Hi Svyatoslav,
>
> I focused on the ALS part.. A few comments.
>
> > +# see ti,lm3533.yaml for an example
> > diff --git a/Documentation/devicetree/bindings/leds/ti,lm3533.yaml b/Do=
cumentation/devicetree/bindings/leds/ti,lm3533.yaml
> > new file mode 100644
> > index 000000000000..2e200f172400
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti,lm3533.yaml
> > @@ -0,0 +1,190 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/ti,lm3533.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LM3533 Complete Lighting Power Solution
> > +
> > +description: >
> > +  The LM3533 is a complete power source for backlight, keypad, and ind=
icator LEDs
> > +  in smartphone handsets. The high-voltage inductive boost converter p=
rovides the
> > +  power for two high voltage series LED strings for display backlight =
and four low
> > +  voltage control banks for individual LEDs. Additionally, LM3533 feat=
ures an ALS
> > +  sensor support.
> Mention it is an interface for an external ALS.
>

Noted, thank you!

> > +  light-sensor:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: ti,lm3533-als
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      ti,resistor-ohm:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Internal configuration resister value when ALS is in Analog =
Sensor
> > +          mode and PWM mode is disabled.
>
> Good to note why this is a firmware thing rather than a userspace control=
led
> thing. I looked it up, it's because expectation is the input is a current=
 from
> the external analog ALS and these are used to convert it to a voltage wit=
h target
> range.
>

I will include your explanation.

> > +        minimum: 1575
> > +        maximum: 200000
> > +
> > +      ti,pwm-mode:
> > +        type: boolean
> > +        description:
> > +          Switch for mode in which ALS is running. If this property is=
 set
> > +          then ALS is running in PWM mode, internal resistor value is =
set to
> > +          high-impedance (0) and ti,resistor-ohm property is ignored.
> I'd mention the ALS is an external device - so this is saying what interf=
ace thing
> thing connected is using.
>

Noted

> > +
> > +    required:
> > +      - compatible
> > +
> > +    anyOf:
> > +      - required:
> > +          - ti,resistor-ohm
> > +      - required:
> > +          - ti,pwm-mode
> > +
> > +patternProperties:
> > +  "^backlight@[01]$":
> > +    $ref: /schemas/leds/backlight/ti,lm3533-backlight.yaml#
> > +
> > +  "^led@[2-5]$":
> > +    $ref: /schemas/leds/ti,lm3533-leds.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - light-sensor
> > +  - backlight@0
> > +  - backlight@1
>
> Similar for the led nodes.
>
> > +  - led@2
> > +  - led@3
> > +  - led@4
> > +  - led@5
>
> Curious - why are all the led nodes required?  What if some aren't wired =
to anything?
>

This is limitations of mfd devices. If it has subnodes, all subnodes
must be present to reflect mfd composition. Unused nodes should be
disabled.

However, I have asked Lee if he is fine if I will program dynamic mfd
composition based on the device tree. If he is fine, "required"
props/nodes list will be reduced.

> > +
> > +additionalProperties: false
>
