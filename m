Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E293B14C9
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887595; cv=none; b=pf46E7Cw5dDF2MhP7+G2j2dHLs17xk0RPk8qvmTj+Hxw9VZH+SQyIEABwf0aKpQYf06rowk1WN7aJqc4J0VRKZyDWOTwkjb+pDuYB/e+WDY3HxIUI/+ukhrN3dUY52Ucsjsd86HQQ5yvq/LIuOUwXvd8/aqmh9TXlSyHPziEb/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887595; c=relaxed/simple;
	bh=ydErqryufbSp4JR5LfordVoaP44V76N2SqyLsji1CLY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=imhz+mJsFAws4KEI6s2vRAT0vrIl22FPTakRv2pS5JtNWWtJHVb9f5Iy0QgWS04F3ZZyidPuUor7dL/GpmKst8jr5FZfhFv4hmmyH7glHgA8DzuYXTkV7/3+NsvJF0v4xvZ9ARIcvYSZxzZVQj/0kSKAQDOfi5QMKEfsWifXAJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDg0EokY; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDg0EokY"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9670c23ca7fso72006241.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887592; x=1782492392; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUJL1hpjWL5/WFjB+cS49WeZgfqaRuQjbx9N+bg8FNM=;
        b=aDg0EokYqtu21dPMMjelf4iuWhGvULAOSHQfjBqW2C1b/XPTqxWfkFgkF8ZpFsgySa
         zHXwBG0y8P+Z8rkQRwHe2D5xN7luHgPiXlJFqnvNrEM7bJVCOVBFeeg/I9dGRoiLiSY4
         1SWUSMYORFQ74/8sN6+veX5wMsNPLYZPgLy4VcXO18B1kP6RsJ6btGrTZlv0yXo1BYTs
         6X7t9aI5AVNl7LwRDuKMCA0k5MVcPfOhB/ABmMBHttACDCehwMgeBzQ8bk1w2TAnjkqd
         BE7KCYgOLu89h1aSN1o3zL0y2Agqf1bUEgC2Cpo2AC78yrCbuRET6cNtBhWqnvULv6G4
         IY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887592; x=1782492392;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUJL1hpjWL5/WFjB+cS49WeZgfqaRuQjbx9N+bg8FNM=;
        b=FVimD08mr4oMZKUwevni/0KHIXGvTEMojEvHKGDyU59GEFyUfSCe2dLmFdf47cHMuO
         Q5cnbLs3009deSxZu8G3yxnjiLHpsIUd1HA7kthYVYfbymksYJWebKOOUMup0nyWZ6+O
         StZayGkFkbwrdXPFBR8/gkUAWF86peK5nCOPg5zvxwu5oESYKRzs01gAVGozZOdS4D2C
         KhP5t/4kOPrKixcGwxmveGCZ2XLDNLsbNgplnFK1QwfrKL2N2bUqXFFLxv0rI0y/ydtC
         VJtGrBGdFzGFIFCMtXYC8x0CtJck3PijLFtluY2kyWNZzesrOkIX0uIg4ezc0CYFyVF1
         xtNA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rn68BHsH5lnvPmlu8dcQkAELaRs++ItHkZZha4Hrskb1GVQvaCLXEHg0CGzpA9JOVJ2hcRp+Hg3xD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsr0zz1W8pMpnon7nBVOel8QxVNiEeyHJ/x2fzgefvth8N7zv3
	Gwn1v3O8tAgw3oNrVuBnS/MHBR+o3rlSI6D1BlQBIVoQC+/k4lX+VyLgdFej4A==
X-Gm-Gg: AfdE7ck8UJnybBApCrU+CaQZYpiJVm4PUFuJlNsm7yWyYd0huYmbOHbr2b1MyH7qbMe
	m/KQVtzUGlriJXSPJ113+sbPfGwAplKA83HZQtF0ADN7XSGPbNjTh4EH9t/IA/9CTLBzT2gX6xO
	782xgUgJ1zpRFDZ8N4pv+iVunTpU+OgUwMAunuCG4OnnbfNBET7gSKjrQej8M9sFhTLscXlLXPD
	AmkHrnt8xTi7vzoC3mIEPmOIwS0l31d7h3OKyEWKaT2xCJN4kSHw8MWDj5RIzVj5gPPZPqW2Paa
	Ze+6F1jFS9nQolTsTUlc3Zpjr0UCFjVGxr4NQGZNX8RqP8f4vXfA7ZhTJD8efx4Yb6mcoO0vDYq
	FVo3kNhLf6YPO3+6AQ3TKMOgrb3TVAeDnQcwB1cixYcQXo7LU96sX/svrgvFAw9qL/jAZAaHfl+
	cI2EU=
X-Received: by 2002:a05:6102:f9c:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-72a03d9e389mr3148036137.20.1781887592125;
        Fri, 19 Jun 2026 09:46:32 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72a342eeca3sm2081276137.3.2026.06.19.09.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 09:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 11:46:24 -0500
Message-Id: <DJD6FJQUX2V7.SZWF8VSKBCPX@gmail.com>
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
In-Reply-To: <0831356f-76ff-4eed-befa-7a35ffce921d@baylibre.com>

On Fri Jun 19, 2026 at 9:28 AM -05, David Lechner wrote:
> On 6/18/26 7:33 PM, Kurt Borja wrote:
>> Some ADCs incorporate burn-out current sources that provide current to
>> the channel's input pins for open-circuit or short-circuit detection.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Docume=
ntation/devicetree/bindings/iio/adc/adc.yaml
>> index 106b1e317411d5..6b63aac9ac04dd 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> @@ -106,6 +106,20 @@ properties:
>>        This array describes the current configuration of the excitation =
current
>>        sources or the single matched current for all sources.
>> =20
>> +  burn-out-current-microamp:
>> +    description:
>> +      Burn-out current sources provide current to the channel's input p=
ins for
>> +      open-circuit or short-circuit detection.
>> +
>> +  burn-out-current-polarity:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      Burn-out current sources provide current to the channel's input p=
ins for
>> +      open-circuit or short-circuit detection.
>> +    enum:
>> +      - pull-up
>> +      - pull-down
>> +
>>  anyOf:
>>    - oneOf:
>>        - required:
>>=20
>
> This doesn't really work with chips that just have and enable bit to
> enable or disable the feature.

Maybe those devices can use burn-out-current-microamp with a const
value? Is that okay or should another approach be taken?

--=20
Thanks,
 ~ Kurt
