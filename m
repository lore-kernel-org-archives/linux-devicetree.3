Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA7131282F
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300359; cv=pass; b=EZ0fO46YeEELrCeG3nvtpWKbS6RdXGL8vDjAjvrzlX+Ks5kxdKfGhsYlppsFWc+XRO+LEs+hov+ZkSma4lofEuFerLsCBsQJSkMitDJmjGXF6OkeWzBpEL8Jdn6qSLjcYXRVZO/US//XAzHHMiFGJyUSBEYdX2tD4j/IxsrAUsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300359; c=relaxed/simple;
	bh=TWU8vryfQeA/MKw4NADKO2ArzyxCXV4H0Tgo3gyI/pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnnJd8NgjUawof9AaioNq5Zoeai7VdxwEzWzaKQBa/Nj6X2ana/1WHZqjrPRNzJhoQJEcj6rpwAIz4Iw1NjPb/TtGG5q89TjHEXlkUwY1l3XqZiDpb59l6dFGlL/r0bMisrz7REBDKQk7vPKVB8TgibMf4/iYOmCR2XxAWZGmxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg75JBAV; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg75JBAV"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso703749a12.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785300356; cv=none;
        d=google.com; s=arc-20260327;
        b=Qx+P9qXm20MIG+kehwnHIixy5YB4QLd7fHTWUG1yhYgzRZ8QBt+exflyaqAJyGAk9A
         tH0GjlhCbyoBMl/m2mUHvSXwSYnCrx4w7HHtT4dVp2OHxD9RfQt1jKB19P6kP90clK9w
         rQ4S/VwgZKFkTS5EPWNSydkToJCyBNkB7O10Gne26u2I95da2optRQZkCnPnzrrmfOie
         ailhber2qoc5not86UwScI0v47q68vEvPG3nHOuvbSTj3gjUnA6V5c1dr8jFrYGOhMEM
         H1pRK5OyT5eC+d8woJJsEdqmX6CTuCQp5mhj/Xn2Amm/Mgsg5gOSN6k0j8CeZAUECHPY
         rIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kpGwAc/zS1Z5Ybg4YnxkG9yP5l6pon/d5qwt4j5rY3s=;
        fh=OXkB20inigESnT6gIhia5dYBgLf/8OZodSc3i/wbxNY=;
        b=nFM2XUCB4rsjlqMtDY5KUiSr/TNrHeUz8JuzZvolDRYTM/3e8OkrwzOTM1tT4XGs2R
         mMYE8KMPOnrOeZzMi97TzzAyN/86vecgN8do3AJlX5XFqpMrrH6k9GEjuH8pn7KowVCy
         H0n1YU/IL7lBsNNQcI58V76mFjeeJCrC0GrDAAhgMZ/A0xUDk0aZtSOfhBm8gtWxTYu4
         EssGKu0pb1DMaDxsuV3p0jbx3DqVc7IzabpR2JYm6LbTellM1CSU/vc3BHJxTarkCCJk
         ExssD04iDRrRdkX152a6K2hGrAI5t62Ts8apsy6lqtJnzahJ6PCpJLgLNu6dYY83fT+Q
         5Zjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785300356; x=1785905156; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpGwAc/zS1Z5Ybg4YnxkG9yP5l6pon/d5qwt4j5rY3s=;
        b=hg75JBAVhes13FzVBTmeu8mnh4XqFQtBEx0bjuV7eoV/0syqJWyqKaKf54v2B7fQMn
         W54uHQhHuWAwloOvW5EBUZIcmIBi1xAacGP7jPbxCDbhJRhepoSI5BFu/ZVJPT0mKvwW
         k9b1QTGOEEWaEcIg76QMYpNUY9a9kB/83O0CIDvjKz5p52CCUSstHI3fv0QFYCGsoB1r
         mH4SPs2RtyqfjdYYApuaU+JTzYQ/PFlAr37vidxvr43sY2sGrW731sl28RrSU9KhUuMM
         jR5r1WHQYOLjtxTDJDqz3qTaB3E9zVO7BECmPBUyp3Z70i5+U3qZRFOrwL+tqbYTOU7w
         6JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300356; x=1785905156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpGwAc/zS1Z5Ybg4YnxkG9yP5l6pon/d5qwt4j5rY3s=;
        b=pXmau3xKQtNH8l4HLyLlmIMUTUuWuPtUpKPmOyTF0XmUFEtRY/EVpXLE0PxqXY2ZHM
         5pykKtLlcFDM+4XPTStraM02iBXYLszZSjeN3sAyN+w5ooFwwX4jPpcKda8LZMuuUckc
         i2vYoTtBHAYDBeS6GMQoFxrtK0TauACN18TbJGkX/3Q8m/2afousIRTV6Go0eQwwIJEA
         6W2C0L9ZW44743b3lyYJCx9XkflG6IduNjDSpMJAR9TIoRV1F87dnK9taISHaH8kmj3f
         OlcQZLO1+AMwEj6VgcYXVGapE/clvcohd2iOcpZEKqXTcDxlLhLJSwi/n63CX3adsWmm
         j/EA==
X-Forwarded-Encrypted: i=1; AHgh+RpevvazpudslMoQeZ90HqVMJwbN46e0gu0zlidipjOZ8Ebvagk4ANcmd/gleivtG0Dt9gzpurwDGsPi@vger.kernel.org
X-Gm-Message-State: AOJu0YwPmdjuPfXIfP6D+2QwRhRZly7Yz3dxG1lZWvftHAhZvJPMjoYd
	T9lh0PWaIUOUeYZ8LxR5GfjvIaFukoLw442xr7VGHkgcpFQFUiPY/bDdqRDZs8dxNGcJTipawot
	M8D+MtL3ced/mpsms6nQY2TfhbBDzRhg=
X-Gm-Gg: AR+sD12uLlRmBi/cbpZK4DUvt2y6/6g+sA9WfSD/Nd2ZUcAiYjgvBPLn736s8yKCNbw
	nTgzqPH6Ad/4gaQIH+Kx3iD2j9nVTLxTWD9/YKS+cveV768R5GzcB0/iqEVN7On4+/1B8qt7ZGT
	hdKCF5btRtRIy8dKb3G/bonHB8A/3OZjBRgSyox/epbNmI2GmXQjkkI1iqMnieaQYuJiCG6nPyE
	8bdndzXdUOPmU19TYj7L50Fqu4c38uedAwkPkb4XmY25IAtAnATvZBHOlK4CxVOjKuwT15Weytp
	luVPkXoGsUZtHfyBlP3WWqaFqoFFeGIDVJvCPOuLDhRggwGeDB7C/RgvX+GoIYy5vOXUF+uONNv
	7NA==
X-Received: by 2002:a17:907:d408:b0:c1c:4d59:2b03 with SMTP id
 a640c23a62f3a-c1f71eae0e6mr258727366b.3.1785300355708; Tue, 28 Jul 2026
 21:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
 <20260728-adt7470_thermalzone-v3-1-d4586478cdba@gmail.com> <20260728-meteoric-quixotic-sunfish-0de2cb@quoll>
In-Reply-To: <20260728-meteoric-quixotic-sunfish-0de2cb@quoll>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 29 Jul 2026 01:45:42 -0300
X-Gm-Features: AUfX_mzeoGI1TquWNmmBg4ZCCnURWWqxT7S385nR9H6VYiwBt6Kck6h22oP1jNU
Message-ID: <CAJq09z5CQgzzFahoiteh9ykjdbsYpP=QZ2AugzY4tQ79RpA-cg@mail.gmail.com>
Subject: Re: [hwmon-next PATCH v3 1/4] dt-bindings: hwmon: adi,adt7470
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review.

> On Tue, Jul 28, 2026 at 12:07:09AM -0300, Luiz Angelo Daros de Luca wrote:
> > The Analog Devices ADT7470 is a multichannel temperature sensor and
> > PWM fan controller. It supports monitoring up to 10 external
> > temperature sensors and controlling up to 4 fans.
> >
> > Add the device tree binding documentation for it. This includes
> > support for the thermal framework by defining the "#thermal-sensor-cells"
> > property, and models the fan control lines as PWM channels by
> > defining the "#pwm-cells" property.
> >
> > Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 55 ++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> > new file mode 100644
> > index 000000000000..bb2375a4a490
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADT7470 hwmon sensor
> > +
> > +maintainers:
> > +  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
> > +
> > +description:
> > +  Multi-channel temperature monitor and PWM fan controller.
> > +  It supports monitoring up to 10 external temperature sensors and
> > +  controlling up to four fans. The fan control lines are modeled
> > +  as standard PWM channels.
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,adt7470
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +    description:
> > +      See Documentation/devicetree/bindings/pwm/pwm.yaml for the
> > +      generic PWM binding description.
>
> Drop description.
>
> You OTOH, miss ref to pwm schema. Referencing here in description should
> raise you questions... And then use unevaluatedProperties.

I will drop the description and change to `unevaluatedProperties: false`.

Regarding the reference to the PWM schema, adding `$ref:
/schemas/pwm/pwm.yaml#` enforces the `$nodename` to match
`^pwm(@.*|-([0-9a-f]+))?$`. Since the ADT7470 is primarily a hardware
monitor, its node is typically named `sensor@...`,
`fan-controller@...` or `hwmon@...`. Importing `pwm.yaml` causes
`dtbs_check` to fail on existing node names because of this mismatch.

Since we cannot override the `$nodename` from an imported schema, what
is the preferred approach here? Should I skip the `$ref` to `pwm.yaml`
in this specific case, or is there an accepted workaround for sensors
acting as PWM providers?

> You most likely miss ref to thermal-sensor.yaml as well, but that would
> change the ABI since hwmon would fail on missing cells, right?

Yes, you are right. It would require #thermal-sensor-cells and the
device might not have a thermal sensor connected if it is used as a
pure fan controller. Likewise, it can also be used as a simple
analog-to-digital temperature adapter, with no fans connected (and
"#pwm-cells" might be missing).

To address this without breaking the ABI, we could add the ref
conditionally if "#thermal-sensor-cells" is present.

allOf:
 - if:
     required:
       - "#thermal-sensor-cells"
   then:
     $ref: /schemas/thermal/thermal-sensor.yaml#

I just don't know if it is ok to ref thermal-sensor but not pwm.

> > +
> > +  "#thermal-sensor-cells":
> > +    const: 1
> > +    description:
> > +      Number of cells required to uniquely identify the temperature sensors.
>
> Drop sentence, you never need to explain standard properties. It only
> adds bloat and more places to fix/change if we do any refactoring.
>
> > +      Valid index values are 0 to 9, corresponding to temp1 through temp10.
>
> Only this is needed.

I'll keep only the sentence regarding the valid index values.

I'll send a v4 with the updates mostly because Sashiko-bot failed to
merge v3 with dependencies.

Regards,

Luiz
