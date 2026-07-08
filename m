Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F0D403138
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500474; cv=none; b=MJRXQxWlU7Y0DJtV37O5c5tMY+0n/09l8XS8BjkgEtMELnfJxYzcgHqKZfHFmBoGdMqu5saNz0hMmNPc+tzKIpWS1f3ChUEcNf7na9l7HKDKFAvdCmeLvb4JpIfStvYeFk2DH04if4pLUdUWfWzMbaV5Cad82D3BkYr4QsC77o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500474; c=relaxed/simple;
	bh=pgTToACliyhAjJ+F8jyAnPofAyk5eqWaiRJY56YFv2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFKDrYdi7zpouqu2+2XFD0olUQF64hbEFRk06B22MItUJ+8hI+g9ZPFiWGtFa3npjL6ugCR79rRNbfkGVk3vfp746dJHLJlePf1Cx/fw2sm8LGFzN2Z6HxAbHF1OX46jvwq5q1DJ3mBs29MNsZ3N751tJ8NFEc6+eQTybyKX11I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RxrPX+n/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxrPX+n/"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so98530e87.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783500471; x=1784105271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5slyaMHZZ5o7vhI3SEoNR1OWEg/jwQ9URJD1346nvf0=;
        b=RxrPX+n/A4GaSldXQp+I096fAYHlqrydyT8tuWtG28E3lwqFhWYygJQKp6e6QXuWmo
         ndmEdg5CS/bwCRJxOU9DbDW30+xWb8URzDvgGwD40yBZz9zjVynfu+NCwWTJ7XmL+IcR
         S+eiCmqRHF3gb6EcMXXWQgT95XU/rHwkpg6as894WpfVVr0hfT+3B6tKW8Z9OgJ4BgPp
         dLlhZbJDhmtLiyAjh9C/5a1qc8hm6SBVKombKObAv/ug2P9RpkgG91wqGhBLfLnOyQBh
         mpohm4Ctswd/cFeT8WKgIrTrV0CvpyGQ8vUQaJH94TBCLX833HVZHc0fHIBJmizTdxO7
         l0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783500471; x=1784105271;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5slyaMHZZ5o7vhI3SEoNR1OWEg/jwQ9URJD1346nvf0=;
        b=nCqFeYFIiwDk3P0q5KHBrZLKFYP5dwThvE+b79TOPd9PuQejgeTGfmJmCuv0HyVwZU
         X4R3ohPeKrmYQGd2hXL03QfMnegZLfBNCTqqbgoQI/cfgeU5ZAvHr9zcggjyueHzG6nu
         y9AWoQP0w/YESP2c35Yh2IjdvR2IlefaF2QShl4eK15R+hehOjpWnBZXYJ6inivCJm9t
         E1rATeiqdDUcKt7Yo9IeMI0XufZsnNBaZQHxQNIjAebkA0m1Qd9lSduJZG/+EhYXnuxB
         g+M10ouPcbkPZIq1E7s9pgWxAXVa6942FBnjlcl7cjDEAVVyS0rwY9qq/QLQR1fzN4sU
         +z/Q==
X-Forwarded-Encrypted: i=1; AHgh+RothTlEEn0ez4UOWVQtOTLiG47dmzRHkXiUOS6gprPIkejfdhI4ZRupQc64c0R9UkRiR2JqQcmsgkga@vger.kernel.org
X-Gm-Message-State: AOJu0YxSV9f2XwBhjoPi74hiRim8kS5nA3mrk3Z6vJluj3Di7KWkAx4c
	BuaCn07Vgzbkmgf+J+xeoUjQ6ZRNhayqRNEWxSP4Llhdzg00nh+Cl1wB5A+7bzVWrg0=
X-Gm-Gg: AfdE7ckvreTyCN/I0J+mDLlp6SJlpIjRrPoFfMAdOeW9P12xa6siy5KTOgHwiWGvy5e
	JFYI73mjU5YVy7wpGk8E8kTbH9hIzKW25uAbZPb1m1fJUCDn8NAaLZYgvEYa5f6aoDEI6tfoQDj
	w3rbvCSE9xUhE8mUshkhKdN8WUE2dVB/nth+VFB71ek2mPCTqWl0ArWEOYZVSfhVh0Uojngitt4
	4HSSi6MVdMae584Dnb333y8FaKHyQsbaH5uiEQ6jzQEUrWdW/qsq4qOywroskhTVqTNEhKaKYer
	OUkh8g4pCKaCSaJHQUq1DC88pOpdVh2IGTR8Ew4XGcSsGSU7GUPkeFtt3F1oZKCsEgTzzdhvDwd
	cGJextWZp2TTKhSDQJAQX+q5WGlGHmOfAPuajb90TCU+UAf9JwMZ+aQdzCIxU1USAaS8QtiOzTL
	URe3I1LMfS2N0CX2YhEN6eGcQ3qfB863AO2P0SsDeKvqF+8fZmyZ0mn/rGEX3Cx1eDDG4=
X-Received: by 2002:a05:651c:2228:b0:396:8c78:3d53 with SMTP id 38308e7fff4ca-39c79832ce7mr2061261fa.8.1783500470732;
        Wed, 08 Jul 2026 01:47:50 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad18b5asm29411131fa.9.2026.07.08.01.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:47:50 -0700 (PDT)
Message-ID: <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
Date: Wed, 8 Jul 2026 11:47:22 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Gjorgji.

On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Vlad,
> 
> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
> <snip>
>>>
>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>> +                             &config_noc SLAVE_CAMERA_CFG
>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>> QCOM_ICC_TAG_ALWAYS
>>> +                             &mc_virt SLAVE_EBI_CH0
>>> QCOM_ICC_TAG_ALWAYS>,
>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>> QCOM_ICC_TAG_ALWAYS
>>> +                             &mc_virt SLAVE_EBI_CH0
>>> QCOM_ICC_TAG_ALWAYS>;
>>> +            interconnect-names = "cpu-cfg",
>>> +                                 "hf-mnoc",
>>> +                                 "sf-mnoc";
>>
>> This is the topic, which may raise a disagreement, but I'll repeat my
>> position about the need to remove all "CAMSS bus" specific resources from
>> the device node, they are found and should be allocated on parent's side.
> 
> The interconnect has functionality to handle bw requests from different
> clients.
> 
> Yes the best will be to have camss interconnect, so jpeg and other hw's
> to vote
> 
> on that (actually it is possible in icc framework) but what is the
> benefit of moving
> 
> those to camss? Is it not better to create camss icc. I understand
> you want them to be on parent side. But how to vote on bw? Most of the
> time it

Let's concentrate on hardware bindings description, no APIs, votes etc.
at this point of discussion.

There is SM8250 CAMSS device, which serves as a hierarchical parent (or
could be considered as a "bus" device) to this new JPEG encoder device
and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
get hardware descriptions as children device tree nodes of CAMSS parent
device tree node naturally.

Copying of the same identical information about clocks, interconnects
and power domains from the hierarchical parent device to children devices
is not needed, and practically it only lowers signal-to-noise ratio.

Since information about the actual defect in hardware description is
reported, the problem can and should be avoided, the handling of a better
hardware description and dealing with any kind of complexity will be done
in the CAMSS and/or CAMSS children drivers.

If you need to get a bit more formal point of view on the matter, I'd
prefer to see descriptions of hardware properties organised in a tree
topology rather than in the originally proposed star topology. By doing
it the system complexity is reduced from N to 1.

> depends on the jpeg encoder configuration based on resolution format
> etc. to set properly average bw.
> 
> So i dont see how that can be done with not explicit dependency on jpeg
> with camss and some exported
> 
> API's which we discussed with Bryan they are preferable.
> 
> Maybe i do not understand properly the proposal but can you just add
> some pseudo code
> 
> how you see the things?

Let's define and agree on hardware description first, then the path
to its implementation in drivers will be clear.

-- 
Best wishes,
Vladimir
