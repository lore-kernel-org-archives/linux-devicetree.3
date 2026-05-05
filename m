Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B13C871B
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007058; cv=none; b=fQgDiwAxm3k784O22s0t2l1smLrehoyJdVs+huomkFZNh8lM7VFHPshtxlUFAz+KNKJJzYq4ICdsdfk1kH/KiqPtMu9cqntMBHOyvpC2xVXSEeugvHG2/9/KtneJniR0BaKOXsn8vj3JVdyKJWepux9lUtN1QobomcC93sAgeaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007058; c=relaxed/simple;
	bh=v8iGX/lK8aQ2P7nXaRjT3kEbed4ilCzF/7HTS4aXDT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDcbQasCqGtBynlj/iLjv8Ss+pFDMilQTp41UeurxenwfHQDOTgI6ty8pNRuaN0r4dRi34/rs8z+q7l+PxIBZT/8ngnhCeW3GYlK3LNfrRE6r2Ezl9bOXBBvbFpIP2RkbFbzP7BE5JFe1t39iZKT8BcjPfNj+/SZMQeRpr7xXKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4NCLeUN; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4NCLeUN"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ee0fe3bdeso3860891fa.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778007056; x=1778611856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWfIK+4R3Bk95cHMFqzFQqOhwZinnDbYjtH4XgP9PxA=;
        b=i4NCLeUNUHr0E0M+OteFwvdviHFXUnCieUEXLc7fp4Y3I/hZK0Rml77Oi4TIW3j+l9
         lTp9/O8Nox4tvn/RV5mCbkrasbXsiAEKEvFW1jjAForIpFfPxv/SbdwxnmPsCQIt6dcp
         0UWH4REYIL53UT014m85NV/BO4spok40cjv335Ycd/64yAqbYLy6t2vTEhycLuShNGht
         rlNqZhXBR755+3ww2ftkC2+ej/RmNfwECpTYFIq1MUTrOBrTB5ussG9orij9Dak+e9oM
         0gDnFiEFeaeoCa8cmnRvm6GUDoCGgilWbnnRTg1K/+e6H6tkea0q0bZHaONcJlQFcdmv
         KG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778007056; x=1778611856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWfIK+4R3Bk95cHMFqzFQqOhwZinnDbYjtH4XgP9PxA=;
        b=MSWkht4iq1uI1IzAOZC48qJDsawuwdOcc7imcyd3nSJ7pYvwEUdUwHEaPb9ZA4OJsH
         48JbMohVxlVBfhIoMKdfrVPJujDADIeDKMOa981dHdtjqi4vaDrVBSmxedmGb8ahqAJJ
         xylO7u/Y8mc1bCGZ8sDHOHP47rZ6I26s6KA5dAaxgh7Be5/6nER9ygpgWTmIqyQxE4uW
         RgjbwLhO2Wz5Wqr3mEym49nxSGBVSP+y2BidbopaRNs7XZc18/68J7VCCMqchmOcISYp
         XAsdTHaJYRrfQI3m/kppnUOpwLaN4ToLRkAEqyV5MqEQdXtQL0dduOi7hAQXzml3PffC
         xNfg==
X-Forwarded-Encrypted: i=1; AFNElJ8VNnU+94dZi2RT8EKvcpv1N7/scxIdBzZy8Skjg99mTgxk4pdQJ2gjLSGqoRDz1Knreq9T/SGzd+NU@vger.kernel.org
X-Gm-Message-State: AOJu0YwJkvUWtfIk/MozWPJQAwbHb+Fj91XNZn9v4USH0aPHKBahSTg3
	xiiOa6qIsSj6jmKSOIs81NGJxL9b4uuogQ4SWtdE6kh0Im2UPUm0UzVn/NNlaYdoTP0=
X-Gm-Gg: AeBDieuqHMc7xx6S/PcIDStVTytJ2nOveSKB0qigga0VI2XeNWCBH48kCEGHbGJlTmm
	ZA4m7oNnlRY2xiVl2ERWre1K4iTYw8DZhpXimYmPwGhnYZ6WJL9lYx99k02mcG/mDQx1VqXSVcw
	8j93S+mYsLv+VdgIsXmXm+TIJfl6j1rtPJ8sDyrg7X8XkzvYEJjgRPROPEsTr2eO5WnJPC4sjyQ
	zAtoHALdkCa0YFf4z+3YQse2scfuluaoF+wWTLMW7/22kX82pdZX9ApuM+uVjxdUHF6h0Rz9XAP
	OQFa38ulD84R3lB2Nw8hxD4W+uwZTDKSsiE0+n6wNgdfpupiOQCy4PcJuCv5OzwxSZ2lBUy59hj
	eO+o1kd8qEXOPTsbxeyeTPCXA2hHEcXmiSXhlusKKFRWK8viqoE043Qy8gXDGxt+P3rvRPKOC8j
	MDvyE/YbDDIqCO92fapo+3HS81BUGHDRYoImLytjaOFbW0RNJNJmb/svYG6fxgP7jni4R1hFs0Q
	ux6WM3FsfL7VlwU
X-Received: by 2002:a05:651c:4103:b0:393:c17d:9cfa with SMTP id 38308e7fff4ca-393c435d22cmr388041fa.5.1778007055403;
        Tue, 05 May 2026 11:50:55 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936135e578sm45101711fa.38.2026.05.05.11.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:50:55 -0700 (PDT)
Message-ID: <eaff3bd9-0b75-409c-bc5a-5013f9ce1495@linaro.org>
Date: Tue, 5 May 2026 21:50:48 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Kepplinger-Novakovic <martink@posteo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
 <c26246c1-0f90-499f-ba32-34159baa5dfb@linaro.org>
 <CAH2e8h4Y-x_4BAcgjytNj_NxZKnF1=y9GuaUnWdjzJ-MQLyCng@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAH2e8h4Y-x_4BAcgjytNj_NxZKnF1=y9GuaUnWdjzJ-MQLyCng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/26 15:48, Pengyu Luo wrote:
> On Thu, Apr 30, 2026 at 6:49 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> On 4/25/26 13:52, Pengyu Luo wrote:
>>> Hi846 is found on my Gaokun3, descripting it.
>>
>> To the best of my knowledege there is no 'descripting' word.
>>
>> Say it simpler like
>>
>>          Describe Hi846 camera sensor found on Gaokun3.
>>
> 
> Ack
> 

...

>>> +&camss {
>>> +     vdda-phy-supply = <&vreg_l6b>;
>>> +     vdda-pll-supply = <&vreg_l3b>;
>>> +
>>> +     status = "okay";
>>> +
>>> +     ports {
>>> +             port@3 {
>>> +                     csiphy3_ep: endpoint@0 {
>>> +                             reg = <0>;
>>> +
>>> +                             clock-lanes = <7>;
>>
>> Please remove 'clock-lanes' property from above.
>>
> 
> Is it unused? I saw it on some devices and v4l2 related source file.
> 

It is unused, and its selected value here is bogus.

-- 
Best wishes,
Vladimir
