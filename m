Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18162F39B9
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095357; cv=none; b=MyQ0hI3n4F+utSehGwsNwAYxtaBksVePoSynrFEDWJAXwWI7ZOpUYbKpY75HAxCS+9WY1ulZDGxJOJ9+1UBt5d7Z2NReucMhan5rZW4Hqk+xl3NpK+dJB7aoDcAIj0/0gl57eI08Oq99Oc9xc0sRShBoYLaBNcXbcu9XA4YfWDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095357; c=relaxed/simple;
	bh=HutDrZoyIVX95cda8p8zTvBwg9Q9t+kX0D6sevWm/Iw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WB9uy4xTb3DdrU2wr2WxImLd7pg6sEPtFgYTflehfAnKe2A7zIOTOBQoy54Tt30DksLi5dX75YUhPtjYqcygcrgywjchoxMdKvk18EPN757OxuKMgF4Mr5s6A1aZt8c/GV4aIGjbO8nIU2ELPhHjIyplMuZXLVq2jR5YzfJAvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZzDiKen; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZzDiKen"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c276bd3692so1476077e0c.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 12:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785095355; x=1785700155; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=khUtvGXsUTKuBTJZfp3i7v8Cg04JI/BZbPu+3nRtrqQ=;
        b=HZzDiKenTvynzfR7xzZKD5GW4ZUYTjyIqYxQnZM2ryVfEdjIyZEJzZ1ZVzsVPsV5/n
         PpwgwHIUYg9R9n3DVnGd8Ayeq/xS+lr53J0LuDbQjsZ5maPfyyhe7TwR1cfkX/b9Gfuj
         PHETVVSdvDpSjqiRlOxjoVg0awwuxB2dVxSuz9iLyGQyEV6afiasY8U1qEhlrUKBTkDV
         s0VT7FxbsUzgiO8TeF5ddCmF6xvaKngXEzolcxbXhOM9Wj9wDeAHrFyom2no4gTG3Foq
         LSO3MOv/cXuti7EDIhDIes+VMZicN5GL7FLVnEkdLlCDu+TeWn1EA9a7PZpgEr3DbN4z
         owSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095355; x=1785700155;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khUtvGXsUTKuBTJZfp3i7v8Cg04JI/BZbPu+3nRtrqQ=;
        b=IQ05kevQiNY55wOUPOYFpEAA0oPxVhxyh+IXYuWb7lA8lYs2YahVQrz7awTK2+zgBg
         hW3IRSJ5pRljg6IbMCI96n9/qdZcA7W+LamczOg96b8mBKUKbSlWfO+NvYfhQi3L1hrC
         wuK1rOoZfIEZYHaR+mlPylmcmUicypHTsPrWTNG0DHFBmowP9o1SKj8yg2ikWBet8GN5
         XyCvU3PTF/By4pMoiiiRZbGjqgdHlDxFFDFFX5leolKYXHm/+IIMILeJsj7gnlQSVPs3
         JMQjkgIO88Gn+Aohi2XwNb6gcWaH+WQaqLq9mQgReI41Zxevgcrh2m31ESvVc8SAczWm
         Nhzw==
X-Forwarded-Encrypted: i=1; AHgh+RqB7hazY1VNIjc0Ov8bScXJgx/EhY40AR2suTXWDFKBerBxs4jVrQUJpZRWE+/awf3ypI5PovmYBaJW@vger.kernel.org
X-Gm-Message-State: AOJu0YxNS+9fJuPJFFYfBfg73GYh9vIiiKAPbU4+xiLIBD6TULAtc9hd
	i2XyWcVmPVQERArFUZRAwr26bpWFl8dWKPevSJSkYtwONzTa3i4xjJMv
X-Gm-Gg: AR+sD10EhZOWJaKIljukRdge4L/aAZadNeUscnxw9ldpRe5F/0+/JhiJ+xpOYkk6kvQ
	mctgyaKzKMzQDSVKIVO1sFL3v2ES0VG3GrVaElt0Z3AHRK1Zfd+ciRyVp3q54tMIdBK5YF56lG9
	bCajQqA6IaxN650I8oDAv+oe7IsP7GwgWgiSFO/icgJ94epmTZWY217Ag1mMiq0HNSo743YUC6S
	1VFVJO+WMsvUsxYE77HefB0b7tMOOAXFFAyaKdCut5jd/v2QsCW9DN/H63rg3od9e96oDPJhOVo
	KwvzVq8zQriSMoUXbhfTroKwzteUsXKsJGbzcQgGO86E6nTuHrqp09vyPVJvBFrI+DF+kpm/Qjp
	FIzrWdZ76b6ioemjNT34wbgawBTwinDJsUe+u6p3HVCFpqtlVe0p01LN0VQzBIxHTypVe
X-Received: by 2002:a05:6122:7d3:b0:5bf:bc5e:e24 with SMTP id 71dfb90a1353d-5c306d72c10mr2846830e0c.12.1785095354812;
        Sun, 26 Jul 2026 12:49:14 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305706b09sm4803276e0c.13.2026.07.26.12.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 14:49:06 -0500
Message-Id: <DK8RHLBX32NR.AD0TDBDF1HNL@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: iio: adc: Add TI ADS126x ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
 <20260628-ads126x-v2-1-4b1b231325ba@gmail.com>
 <946a30c9-01e9-42f1-bd2b-b7934fda85cf@baylibre.com>
 <DJKX600ONL4O.1YUTCD1L9FU8F@gmail.com>
 <a16f61fb-4e98-4c30-8d4f-da084e27ebeb@baylibre.com>
 <DJLOAISPZLG7.VZYX8B16QU4K@gmail.com>
 <22e1e1c2-659c-4991-857c-b38d66769c7e@baylibre.com>
 <DJMJX5FGSZ9X.1GQK24K6CI60X@gmail.com>
 <2a0a9fe9-b3b5-49a0-bf58-5035655fc16d@baylibre.com>
 <20260701012842.16272045@jic23-huawei>
In-Reply-To: <20260701012842.16272045@jic23-huawei>

On Tue Jun 30, 2026 at 7:28 PM -05, Jonathan Cameron wrote:
> On Tue, 30 Jun 2026 13:38:30 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
>> On 6/30/26 12:14 PM, Kurt Borja wrote:
>> > On Mon Jun 29, 2026 at 11:43 AM -05, David Lechner wrote: =20
>> >> On 6/29/26 11:27 AM, Kurt Borja wrote: =20
>> >>> On Mon Jun 29, 2026 at 9:21 AM -05, David Lechner wrote: =20
>> >>>> On 6/28/26 2:12 PM, Kurt Borja wrote: =20
>> >>>>> On Sun Jun 28, 2026 at 10:45 AM -05, David Lechner wrote: =20
>> >>>>>> On 6/28/26 12:36 AM, Kurt Borja wrote: =20
>> >>>>>>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs w=
ith an
>> >>>>>>> integrated PGA, internal reference, excitation and burn-out curr=
ent
>> >>>>>>> sources for sensor biasing and diagnostics. The ADS1263 adds a s=
econd,
>> >>>>>>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>> >>>>>>> =20
>> >>>>
>> >>>> ...
>> >>>> =20
>> >>>>>>> +
>> >>>>>>> +patternProperties:
>> >>>>>>> +  "^channel@[0-9]+$":
>> >>>>>>> +    $ref: /schemas/iio/adc/adc.yaml#
>> >>>>>>> +    unevaluatedProperties: false
>> >>>>>>> +
>> >>>>>>> +    properties:
>> >>>>>>> +      reg:
>> >>>>>>> +        maxItems: 1
>> >>>>>>> + =20
>> >>>>>>
>> >>>>>> If we want to allow single-ended/pseudo-differential inputs, then=
 we should
>> >>>>>> also allow single-channel (positive pin) and common-mode-channel =
(negative
>> >>>>>> pin) properties.
>> >>>>>>
>> >>>>>> This will also require additional common-mode-<N>-supply properti=
es to allow
>> >>>>>> for the negative pin connected to something other than GND. =20
>> >>>>>
>> >>>>> Ah interesting. Why the N though? wouldn't a single supply connect=
ed to
>> >>>>> AINCOM be enough here? =20
>> >>>>
>> >>>> In theory, any AINx could be a common mode input by connecting it t=
o
>> >>>> a constant voltage supply. =20
>> >>>
>> >>> Technically yes, but there is a pin named AINCOM intended for this
>> >>> purpose. Can we do a simplification here? I propose having
>> >>>
>> >>>   common-mode-channel:
>> >>>     /* AINCOM pin */
>> >>>     const: 10
>> >>>
>> >>> That way we would only need one common-mode-supply. Would that be ok=
ay?
>> >>> =20
>> >>
>> >> Ideally, we shouldn't limit how the chip can be wired up in the devic=
etree
>> >> bindings. It doesn't mean that we have to implement everything in the=
 driver
>> >> though. =20
>
> I'm a bit confused on this.  Arguably you could wire up any side of a dif=
ferential
> pair to a common mode signal, but we haven't had this binding applied mor=
e generally
> than cases where their is a setup where the intent is a shared common (sh=
ielding
> on cable in some cases IIRC).=20
>
> So why is this case special? I see AIN_COM can be wired up to an internal=
 vbias
> but other than that it looks like any other AINX input.

Hi,=20

I forgot to respond to this email!

As you said, there is nothing special about AINCOM, it's just like any
other input. That's why David suggested to have a common-mode-N-supply
for each input.

I implemented this of course, but I still have doubts because there is
no precedent for something like this in IIO. I understand the logic, but
I'll personally be inclined to drop it. If there is no further
discussion I'll keep the 10 common-mode supplies.

I'm finishing v3 and I'll submit it in a couple of days.

>
> Jonathan
>
>> >=20
>> > Makes sense.
>> >=20
>> > I just have a doubt: In the ADS112c14 bindings, is there a specific
>> > reason why you didn't describe common-mode-<N>-supply?
>> >  =20
>>=20
>> For singled-ended inputs on ADS112c14, there is an internal
>> connection to GND, so it isn't possible to have a pseudo-
>> differential input like that. I guess technically, it could
>> still be possible, but wasn't a typical wiring described in
>> the datasheet like it is on ADS1263.
>>=20

--=20
Thanks,
 ~ Kurt
