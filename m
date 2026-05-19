Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6551238B125
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171883; cv=none; b=rLU/N4yn62xpbKf8x8N2sNz+mYXMc5aKjSJJU5fMFw87wj5fNZ4um9Gv1/CWdSh1Yq1aDvNYj1FXx+alx3e2rt4d+EBj5SiHL1wXhkm0VLp0qc+jFMc91FHq+9liefsNXt24fglewIvQkvfqdZJIqDjsnnq3PQA3Qf2nRm8jk0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171883; c=relaxed/simple;
	bh=ETi7lwNArEN5RcmsW98Yn9KiVogT7wbUsiY5AWvxxY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXFYLfpPL8TeWVj9s7oF5LpPpc1aCB05RLqdSqnBXSlJen8L3lSgGtQq1VlbYdqze734GIord6Hm3gNYUqjlxqbhFjagsCXUMskj7AWOMFUHZZ1jHbJFDzpAkA7jgWNWoljl9TKOEayJf77TlGDCzRozHfgQNa/OBGUnBxF/lm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fd6D9Xxo; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fd6D9Xxo"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso25037991fa.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171879; x=1779776679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfehn+9PkhGKFVZuq9YJWpl/FHglNOxtCRjIV6IYwkY=;
        b=fd6D9XxoencoRpTa13HKfDogDPwSX/ivrNv/ZDdFDQeVGRcvoVUoNfUjw322R4zzSC
         m9hGE45xxaF/CGRhJGS+IxKbESma80/5MbM4NW7Nm4Krbc9vBrrMryvYj5LFQ/fIEOI8
         8kE+LhmQtw5wBQu1qAA/LJijNKlTJc+7KnslQigKPAhkCfk+YKfPz80aieKrljHiaFoO
         Cwovu5bD8AUj4qDV+l/E2JomKnl43Fj5WFg/ULZ1PP236Q8vCDlvESQGRmttQptATszr
         KVTlKNUNMceZd1eHzcFKYi6U3Vy7p5tUUspnC9b8Rd0rDtHmsOcTxe2wILgUXEncszKg
         3QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171879; x=1779776679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfehn+9PkhGKFVZuq9YJWpl/FHglNOxtCRjIV6IYwkY=;
        b=UYru4GDxYbJuBgobkDF23cX43ugU5E0f/hSULwQOd3dkPXYd10DM+YEiHofn9R+Rk7
         EiclHTY0YycYbq2oumh/m49o+NCEy++f7Wj2QGA8RaHkfc/Zpj/qWuhM962Oy6KVXdAD
         baqAjXUisk5LRPEPgUiaa68Qqe/Mk0ilmOh9vF5x9oD6vA+rp7ApRQG2RGD4g9J+v4bs
         lCfrJg3vvqIs/6pC238L9IKrHkh6/fpCLWnog+abqfoKn9Y1NPqKO44D3pAQgdqQRk2O
         8ZM3XHc2LgAHaNvGvDaE9L8fF1o3GK6WFjsik050BTOtovxfkpg65koqbeyw4p0aSPni
         Te/g==
X-Forwarded-Encrypted: i=1; AFNElJ93JzAs7Vim4793dCZWPlFY1Cc5eVAYNf/2mABX/qbM+ASOPiJLY6JJat900htvmhJPjbND81ThKFnC@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoY4RhKvvUA1uvJgzI5vnP3R/Eko1F0/TDvvF+2THt7+wqbpS
	5+Ok1hnwGbPokXd1iijL8Xk0Hm+IqFsztvz27l0d/+IzjrRr3r4ZtYDE
X-Gm-Gg: Acq92OGV8Gjn1UmDV+jJDlnVNSV46/kt+Ak0rUjU+hcTCPlWXXy+NMcRXJm2QEDS52r
	gju9guvZWScSj9jsdgxBPEOyeqSEQ2ki5o4d+MxIOAejV+fOv695/8tAdBMeDy7T9m5dFTCh7CG
	ckRuG01LrNmmIX8X4wyOfLERvBsLSMppD/td9BUF5rCWE9abyn4PSoHJq3eAWCMiOuvjCe6De33
	Tc4xz2Vo21rtoQu1sTMvefJksT8z94ds7IqaSjlof63xibyjfOJPHZhO1ADzKTKz9tN5qL9cQuM
	cJCN5JOea6+n6b3Q6uCIAOw6FRffzmQeoLKBC7IB77CuZ5fkFZpx447rb+Am20qYxGoPQFMw9AQ
	siU+eix69CKQBvFdYA6s612k9RlU6pK/iA/d1afFpDCvGyQwxvQLNd68j8r9aBzb0NjZAaXnTRO
	tzSsKjYmYA99VwJxIkbC+oR3NaYuMwqwDJq5xN2TFdRuki/daPWZvJwY17dXKIlk9xFi1N487q2
	OiZ6Q6tK99RTDp8bWA=
X-Received: by 2002:a2e:8e70:0:b0:38e:9b7e:edd7 with SMTP id 38308e7fff4ca-3945b6098f7mr35935391fa.17.1779171879360;
        Mon, 18 May 2026 23:24:39 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887df055sm17666761fa.39.2026.05.18.23.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 23:24:38 -0700 (PDT)
Message-ID: <16cf96a8-f559-4f2d-a50c-1c6a14ddf63c@gmail.com>
Date: Tue, 19 May 2026 09:24:37 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] iio: light: veml6030: fix channel type when
 pushing events
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
 <20260513-veml6031x00-v2-2-4703ca661a1d@gmail.com>
 <9bb6db05-43c7-4bdf-88b0-b92525ad5cc9@gmail.com>
 <2a0c777d-05ef-4721-b8ed-88297630ea94@baylibre.com>
 <20260518162255.107faee8@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260518162255.107faee8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/05/2026 18:22, Jonathan Cameron wrote:
> On Mon, 18 May 2026 09:48:39 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 5/18/26 8:12 AM, Matti Vaittinen wrote:
>>> On 13/05/2026 07:49, Javier Carrasco wrote:
>>>> The events are registered for IIO_LIGHT and not for IIO_INTENSITY.
>>>> Use the correct channel type.
>>>> This bug was introduced in the first version of the driver.
>>>>
>>>> When at it, fix minor checkpatch code style warning (alignment).
>>>>
>>>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>>> ---
>>>>    drivers/iio/light/veml6030.c | 8 +++++---
>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
>>>> index 745cf3ad7092..855f052b60c2 100644
>>>> --- a/drivers/iio/light/veml6030.c
>>>> +++ b/drivers/iio/light/veml6030.c
>>>> @@ -871,9 +871,11 @@ static irqreturn_t veml6030_event_handler(int irq, void *private)
>>>>        else
>>>>            evtdir = IIO_EV_DIR_FALLING;
>>>>    -    iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_INTENSITY,
>>>> -                    0, IIO_EV_TYPE_THRESH, evtdir),
>>>> -                    iio_get_time_ns(indio_dev));
>>>> +    iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_LIGHT,
>>>> +                               0,
>>>> +                               IIO_EV_TYPE_THRESH,
>>>> +                               evtdir),
>>>> +            iio_get_time_ns(indio_dev));
>>>>          return IRQ_HANDLED;
>>>>    }
>>>>   
>>>
>>> Is this change reflected to the user-space? If so, is it safe? We shouldn't break the ABI, right?
>>
>> On things like this, we will sometime risk breaking userspace in hopes
>> that no one was actually depending on it. If no one notices that we
>> broke it, did we really break it?
> 
> If it's a bug we often just break ABI compatibility anyway.  If we get a report
> we'll make it spit out both events (and someone doesn't handle an extra one
> we point them at the docs - that hopefully exist ;) - that say you must handle
> ones you don't expect).

Well, you guys are the ones being grilled if the brown thing hits the 
fan. ;) So, if you're willing to take the risk, then I am not complaining :)

Yours,
	-- Matti

-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
