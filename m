Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46056437842
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621011; cv=none; b=Wcyl+YpRn9W8pfcy58P7sQJYX4i6HUDmeNAMjlHf0FFgGXKNC6fbx/PNYHashCpjkBjTTWmrUTAWUI36Kmo5QBLYPIyW4baZHfJHOXtjptKm83jgk+NaOGaytNbfu0+Jx+WsTU3BeMwLzOtgEvC3goHcW/F+qqWhAIckRiLCB94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621011; c=relaxed/simple;
	bh=0Cbw2gXFjpOIEPOY/4kVuvN9KhzVSRPu/bEgNQbmbnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ui+uT77PNF3avq8zfPkKNB9hltsm2fuif6BiuAGEz80dLGwItDVuJNGUszrkhNbHWKPa8oXyNW59kl0OLd7aEehn7AHAT1kRAyqF4a8w0TgTNUaGOulc3PQgIc+wgVVt3e2TmbWErEsaEJs+SUmGmDTjuPNzTBsB/J/Et8maTbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgLCOL/n; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgLCOL/n"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f73d9c177so1844039f8f.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784621008; x=1785225808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQW9nOmQRNCmAQpN47AcJCe9kdEEIZC5I+8m11r1HjA=;
        b=JgLCOL/nXI26OSR7/+twJ6V9h3yG7vvwqbLYx3My9qGzF51G+2RJAmJ8pVT3vDgB8T
         jqiiLMPPiWcC/CyMpV7I3ES9+7OaG7b7KdHYBeoz9KI7/mHQyXthek5bHzjRFbAzzujV
         dg9WXtd7D5pSh1rRFHycGozTs24CC2C/CxqcDMxVdzzBD530SNXZqsMF4axEf6XRaTp4
         nNHwJEz+TeaclqflbaDM0YWyS0QGydkH/CH3uCwN2oeqQ9K/uf/A+VShlJJ0zouwQtHQ
         SutVVUA/4wWzlnbvXl9PcI1Lo5IUXVgxGb13yyIUAIx5Iys6fEyBeFyW9zhAAEGS1aA2
         zdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621008; x=1785225808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQW9nOmQRNCmAQpN47AcJCe9kdEEIZC5I+8m11r1HjA=;
        b=JJLWFjvQudEmPsl4q6ImP2ES+x/Gfvvi/sGrfgIXBGbtyTF4EwZUEgjz9yRzvPZHI7
         Adt237upcMwLkakeBUw3ZD18s3oMXQyAGlW+ZY4I4yK+/0HqdnDcdIARER39u9m63PHw
         +tFNdg2ox5QB9CjeTpAF8cel4BmnkLfDmqes5vgvb1Sb0E9ZfnX23qFCKjUQ6cPOckwl
         JaYwzJYSQ6YQD68mlMErltFArZ8em+/M7L8tke2IhaPoQOBrcuFOlKSQozQqauz2XnDb
         vJ31zf2wCvl1YUf7AVKd3e2g5cSs5eU3D0NSM1bDTix69bbSjgy6KANjUQIMGJvadXaa
         8XXg==
X-Forwarded-Encrypted: i=1; AHgh+RrcHcIu6RAQQzlFlhgL+slp1iij2Uj2rKRpm6N8/jFmf7aBL8avyXkKcDLe10Cgq+fxva3poxGa3it6@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgWBi9ElMmqLEeGh6WQJvKzLCdfcVdNhecKRQsYFks7FDs9+W
	3QGs73Z3WUXRc+D4wLTRq2mDrzcw1xEG14jdd8fNTeIGu116ypw+y+mF
X-Gm-Gg: AR+sD10qBFXbfbaduft1ElwbcTerA44/lu4TrfUUK48Bg8MHZg7S2mDU0RBccv81Y3A
	1cDrqml0pG2PPDhKj5qx6/X0/Nyck6qwfOSgjVi7J+igKp8565msORC4tFcuqjQ5+Ows71isuWa
	PDhss2AwC8jjMpAfNlpuxImuZNG7klNm+nYI+nlPZplymcsIqyV8/q+DEEGtLOAEwJTXzJSGPAO
	uageZwFguG/f99RJ37ubSxIkbOr5if0JEAGL3QYGqyzmmX3xzq47iQaYCbzUGgRYMs3QQGGnCtX
	pdbVCgOF7v+DOIcRlk6cJbTDSHOAOaLm4k5J6EqRm1G2CCJDK93kf9ETrMzjmziurimq88KiBrs
	J9Q8xqCTtPSMTshcZYAQBsoJ+ZbZ9Bw2mxwU0FJHnbbU/+rKZdPJqd+35RdY7JTRnJk4wwLJpDC
	EhH2mrR65kXSjtss2TzwJlw8pUJPW9+zRp94C84fcLMKLP5UN9m/2DKnxGBTXFkTJCoQCnWBbss
	BUF6va8aTBTUUpVQXc=
X-Received: by 2002:adf:e195:0:b0:475:a4ae:e630 with SMTP id ffacd0b85a97d-47f623364bfmr20547113f8f.37.1784621008290;
        Tue, 21 Jul 2026 01:03:28 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-246-161.092.208.pools.vodafone-ip.de. [92.208.246.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeece9sm35822439f8f.37.2026.07.21.01.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:03:27 -0700 (PDT)
Message-ID: <d159cae0-b11e-49e9-a546-023ed61b900e@gmail.com>
Date: Tue, 21 Jul 2026 10:03:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: Add AD7768
To: David Lechner <dlechner@baylibre.com>,
 Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-1-44e1194fd96a@analog.com>
 <36df7c4f-82ea-4ed5-a4f9-3a29c75dc99a@baylibre.com>
 <9dd16bb5-7a30-4024-88a7-4a4bf47c35e8@gmail.com>
 <e791f4f9-63dd-40f5-aec4-5b540bcee5ff@baylibre.com>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <e791f4f9-63dd-40f5-aec4-5b540bcee5ff@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/21/26 03:39, David Lechner wrote:
> On 7/20/26 9:00 AM, Janani Sunil wrote:
>> On 7/9/26 17:43, David Lechner wrote:
>>> On 7/9/26 3:50 AM, Janani Sunil wrote:
>>>> Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
>>>> simultaneous sampling ADC
>>>>
>>>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>>>> ---
>>>>   
>>>> +
>>>> +  adi,power-mode:
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>> +    enum:
>>>> +      - low
>>>> +      - median
>>>> +      - fast
>>>> +    description:
>>>> +      Power mode selection.
>>> Unless there are pins that control this, it seems like it should be
>>> left up to the driver to decide how to set this.
>>>
>>> In this case, it looks like the power mode also influences sample rate
>>> which is normally something controlled at runtime.
> Looking at this again, there is also an MCLK divider that influences
> sample rate, so sampling_frequency to power mode is not straight-forward
> anyway.
>
>> Hi David,
>>
>> The reason we'd like to retain power mode control is that certain ODRs are supported across all three power modes (low/median/fast), and the RMS noise and power consumption differ significantly between them at the same ODR.
>>
>> The higher the power mode, the better the noise performance, but power consumption nearly doubles for every ~3 dB improvement in dynamic range. Silently selecting one power mode in the driver would remove a meaningful hardware tradeoff from the user.
>>
>> We'd like to propose the following instead:
>> - Remove adi,power-mode from the DT as suggested.
>> - Expose power mode as a per-device sysfs attribute.
>> - in_voltage<N>_sampling_frequency_available dynamically reflects only the ODRs valid for the currently selected power mode.
>>
>> This keeps the DT clean while still giving the user explicit control over the noise versus power trade off. Would this approach be acceptable?
>>
>> Thanks,
>> Jan
>>
>>
> Jonathan usually pushes back against userspace power controls. We do have
> this for accelerometers, but not ADCs currently.
>
> If we can't think of anything better, maybe we could use this. It only
> has low_noise and low_power options though, so the driver would still
> need to chose the best power mode of the 3 based on the other requested
> parameters. E.g. always make all sampling_frequency available  and just
> pick the highest power or lowest power mode that can provide that rate
> based on the power_mode attribute.
>
> I wanted to suggest maybe adding some kind of noise attribute instead,
> but I'm not sure how we could do that in a way using SI units since the
> value would depend on so many things (at least V_REF voltage, filter type,
> temperature and even the physical input).

We considered the low_power/balanced/low_noise approach, but the customers typically use the datasheet alongside the driver and the datasheet explicitly uses the terms "low power", "median" and "fast" for the three modes. Abstracting them with different names in the sysfs attribute would create a confusion- the users would have to mentally translate between the two naming conventions.
The noise attribute would not actually configure anything on a register level- it would purely be informational. Furthermore, noise performance is not solely determined by the power mode. There are other parameters (eg. filter mode) that has a significant impact. A power_mode attribute directly configures the hardware register and has a deterministic effect on the device.

Jonathan, could we keep the power_mode as an attribute in this case?

