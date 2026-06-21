Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97A129D27D
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 23:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782085446; cv=none; b=Z9lv2pnMAcNyp4O0kgwXQx6TX3B6a6tL+GTNkj6cCGB54WxmgVgiVrxV/mL1rDX93T4x7/pxSvCXsZF4cngQzcgDHY+jer/jYtMifAh2DZ/3foqQ/6PLDugmqSvRp2ywJcj1oARgG+M/ieY9vQ+JEK0zeVp/ZqUf2HMmHsY6Z5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782085446; c=relaxed/simple;
	bh=qC4ItL5aFduGXaZLJdmviE/chPrLA9OluRNtb03xoBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sqdWLvAsHKBfxCsFc1OJsvO/qkzSBVp+KLvuF1miVUN1379pyGjSu+O1DNFjT/CKVif75uGHcTyFHs2EZRP6CBHGucA/I7Upz/rbg3ZxQIFIM3hNthfipwe6fbl4MvqszZSTa/TLkj8idND8JFRvnkwcMtRhhC6JRJTzlLsLedg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdBDrtA7; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdBDrtA7"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59d7db12342so1158903e0c.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 16:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782085444; x=1782690244; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMTEZuuJVYsmFX5xK+dFlO+dYqsMUYWoJOQqbQ9vGyA=;
        b=MdBDrtA7yti3wdyYxt358jnfjrl3ONeaSjROjPbBzqrpOrfmAyui46fPFzJW3D7unD
         4i2+NphgSzfUMeeL3gDy5lIPxNfSju1NXgcd2X4FXQrFsr1dAy2/+tVzpamQT0WgECQF
         Z5OwtXdUyEDaHxg47ywJyDKUInj0hYcNThwUmdcIfo6SAnihIpjjIQoFT3CI+PQEi6so
         /Uo0fgQjRvCxfkI69dYP2hkq7InxsVw0F0tzpEm/9k8fhhbQ1stICEj3cJ6MRNZUtEdx
         b7nu+4Vk763OWYpBRqhKZXkaqkNSJDH7ZNJ7FHUNlOipr8U8J/piRST/2Bv+2WihT9aV
         oU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782085444; x=1782690244;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMTEZuuJVYsmFX5xK+dFlO+dYqsMUYWoJOQqbQ9vGyA=;
        b=ORIr0HJ17KF59rLfLuBLPEUNNzujmkd+FEZQk2RmxOSDoUzkJZIR7Il9tGd4N9qMDE
         3jl0vQLkWCswMBhN0A1VlMtvUuq4rjeWaSC/IjcE5A5S1UVTLC2eywalJRcbSZ0FiS55
         sHYDwvHhMSHySx05v+eo9gWqwJ8MxVziu4OVgQjEV2yIb5mhg78emMyXioxS+v6G30nG
         L/cmaRQVeaJh4V66XkeMnrGWA9Yawxb8CPNSRRnQk1raDdxIrij3HNJYTmKIZOSLaebJ
         Ve9+0i9cdWFE7z0o408/f+DVhVhclGhfsRO+SFoBQn0DrAgWb6j7/ufkmkEdDhd6AJFV
         moJg==
X-Forwarded-Encrypted: i=1; AFNElJ80SSCc+Y5xIxDvVAZ9oYUanWhH+lLaKp8AahN5GBVuQFxc4JykBY+iZ5JnqDqBwALNmiaqZ+v6k3Jc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JpPKxLCjIwh8pIMJ2/QYYgJSOoQmHmR1BTSQJe+lmr2OGyeY
	h3qbEzCIB6i7vJEDHkGOrzlZPKpL4pt3+2fFYmZnBk2ell2TryucQ0dk
X-Gm-Gg: AfdE7cmB0RQcSuSTnVErw7vt6PxiOxxjP+UZ5KQATUSd6DVNOqJ9/k3sDIz8g4g6/ZK
	pG64jJGs0/0Gkxax5X4RV5U5H8RbRnUE+6MGz8UlcGEp9XzjFhyLMAV9qPCQZwKZ34PF1CGMTyP
	Ga+67okWHvyARRAe0CxKhKlJwbAUERjbAcRjmwMZno0MlvPZvk/jy9ba7fDhe0K9odA33XvPg4L
	KAnTrr9oCkzlfqiOHM30BIyHZOpx9NyBpvQFeixzyahTij3EOi6CiEbjADlIoya84J48LPG1Hlj
	SINQv7mrU9EI7h3f1qSvGHU9RhaeAe09PJmHHB8dnM82/SdeepMRxqX8TPI1mElA1FOsBfYbkIA
	Cxf1Xrz49d3xLg8vpodnJwKbsbnIFYSc250/IcaOl6putQp4UB2DD5nRjZ5hEMN85n47Xt71YVB
	1McWk=
X-Received: by 2002:a05:6122:d22:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5bbebb8debcmr5801964e0c.7.1782085443832;
        Sun, 21 Jun 2026 16:44:03 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb7d30besm5441275e0c.2.2026.06.21.16.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 16:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Jun 2026 18:43:55 -0500
Message-Id: <DJF4KBA0LX3K.Q3XDAO3J1HMP@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 3/3] dt-bindings: iio: adc: Add burn-out current
 properties
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
 <20260618-new-channel-props-v1-3-963c1b5cf40a@gmail.com>
 <0831356f-76ff-4eed-befa-7a35ffce921d@baylibre.com>
 <DJD6FJQUX2V7.SZWF8VSKBCPX@gmail.com>
 <38c5e5eb-2113-4a5c-ad14-348dc7966a1c@baylibre.com>
In-Reply-To: <38c5e5eb-2113-4a5c-ad14-348dc7966a1c@baylibre.com>

Hi David,

On Sat Jun 20, 2026 at 10:57 AM -05, David Lechner wrote:
> On 6/19/26 11:46 AM, Kurt Borja wrote:
>> On Fri Jun 19, 2026 at 9:28 AM -05, David Lechner wrote:
>>> On 6/18/26 7:33 PM, Kurt Borja wrote:
>>>> Some ADCs incorporate burn-out current sources that provide current to
>>>> the channel's input pins for open-circuit or short-circuit detection.
>>>>
>>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 14 +++++++++++++=
+
>>>>  1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Docu=
mentation/devicetree/bindings/iio/adc/adc.yaml
>>>> index 106b1e317411d5..6b63aac9ac04dd 100644
>>>> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
>>>> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>>>> @@ -106,6 +106,20 @@ properties:
>>>>        This array describes the current configuration of the excitatio=
n current
>>>>        sources or the single matched current for all sources.
>>>> =20
>>>> +  burn-out-current-microamp:
>>>> +    description:
>>>> +      Burn-out current sources provide current to the channel's input=
 pins for
>>>> +      open-circuit or short-circuit detection.
>>>> +
>>>> +  burn-out-current-polarity:
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>> +    description:
>>>> +      Burn-out current sources provide current to the channel's input=
 pins for
>>>> +      open-circuit or short-circuit detection.
>>>> +    enum:
>>>> +      - pull-up
>>>> +      - pull-down
>>>> +
>>>>  anyOf:
>>>>    - oneOf:
>>>>        - required:
>>>>
>>>
>>> This doesn't really work with chips that just have and enable bit to
>>> enable or disable the feature.
>>=20
>> Maybe those devices can use burn-out-current-microamp with a const
>> value? Is that okay or should another approach be taken?
>>=20
>
> Maybe better to just leave this one out of the common file?

IMO burn-out-current-microamp would be nice to have. I don't know how
common it is for bindings to describe this kind of properties with a
single const value though.

On the other hand I do think we should drop burn-out-current-polarity,
maybe it's too specific.

--=20
Thanks,
 ~ Kurt
