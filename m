Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491313D9DCB
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314001; cv=none; b=knMj16xOGXbXGWqIAn2Z3ahy+gsLPOc28CjSuYHFxDAGdpnU5RmdeypDjvHWCJoGlnsGa1Hl3FqBEh8+rbtwaGeSZm6Yy/SDbqL0xeET59n9C7QUmbIhlvtuCRMlm/A1qDHoKLAg8E3tpTU3Ky7vmEAI8jEmO0ft7JvXOFtjvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314001; c=relaxed/simple;
	bh=S7HTvQJvi9q3ObEnOv2xXX/hy6wHNAPvkD4FGpz2B8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfczPVesJ2LtD12D5WljT2QIfDClSS89hoS24ADKWZc0NJLnxCNGG0Mq20XACIWP+RNKrt55CYNoKZyKxg3dnaf0nwT+4gt8Y8TWrH+TelJJQHZKFrf/pHkDZXyNUqRZTd5gFbNyoOkOGk43/8nsOfBQ7c/MEa/W15d4cMVUI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U/5Y866A; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U/5Y866A"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6b5c374e5so1040734a34.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782313998; x=1782918798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HAsvraZ6mLfXZddrVTxKfH+cnaP/AcM6qIT+GUf0HZM=;
        b=U/5Y866AWO1pTARc3qO/TlN8hRIZ2uffotr8pLtTxATWLKSvnEzSrSM5+eXw2UmRPF
         c0/LfCHSx0rUIsEY+8qvjXTh/YC/iBBZISXAXxGGWfJaWRNo2oGs0OjeW4oXdGG65GCP
         yIYKwJpWKJ18OMQuvW7Q8cPaNdUfGlBONDRPKy84A3oaB9jVZWrIvgrhiD4DDcRt7T2x
         vCGJswsw7jTz7KkZwPcKnXT+Zu8R63mlRIIOkMd0iyddFyW6vQZNtOdffEvUrg6ii43T
         fanr2wAbfy4iZGfBxf7CVhFP/zDvnRRi/KNmA84lXWu7TihYTOVjnnJFEChwgWY/GvB7
         D8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313998; x=1782918798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAsvraZ6mLfXZddrVTxKfH+cnaP/AcM6qIT+GUf0HZM=;
        b=D6jGFHGknalaOOU0dpHEebpVitQMjuQKY2AZj4VZab6RVji8OdL4Pxc2QjQQSITi1x
         6ywt8IvR1whloSKnwYYisnHHVxkhLGNcXwacDzkMgT3/sehmXTMupRp25NIyFYF2op7a
         cYn9JcXK1FBZoGSIFcXbq7J4kIohfVFwpUMhTW6fREeJm13gHHFhWDgGBC8FAJJbBTlc
         39FwKe36syxuZdZ1Oeeibs00hAaBRdYc+2Dgmf+vbRFy37Da4XQ3e+aRlrUcCmnOQ8/R
         vsc+27LH+bljW8CxKYreBURq7qS5T4HAPu5TxHgTeVLccp9U8BYbUctPa0MyNxnU43KC
         7csw==
X-Forwarded-Encrypted: i=1; AFNElJ87ZbleVP5Xxnkm9lNCPPRUGGoOTL/AFB535yaagg5zes8JIP7mNpaNI+HNJw/lnjPiFjeZdAFV+kTW@vger.kernel.org
X-Gm-Message-State: AOJu0YyxNclx45Iw8EJXjGMHMFc16ckITZwd6t+dQY6X9f9fTNJK72Ua
	PcgDxGTF0v5fS5aiBGYepsiHE2lZk2j4OALiIzexocQkCwuLvvnwPy8NHjAiuG7d63M=
X-Gm-Gg: AfdE7cnhJArufSEAyJPssDs/aHSfn4maCIT/uAAtIqxAISfco3Gyb8lg/oMg2hpc+jB
	n24Q83DmMmPZGhZ/+NOPqvqbaWjUE4aLLu6T4p8hIA9QYbg+dC7Wdl8kiVj9sZvPToZRaGL3LxF
	x4/QBH5+FxIcVZOE/zIjqxxFCLNUjrS+O15jHwZhUoLuhr9r41jY5OY+T0TBsYHa2BZkeSngNWV
	uRqTFNdBiysq+isyFHrupqLEvqEFRUXrAUCTOCs/wmAcoHQnf1SnD3+E4CCTYLB8xogiEEwMe1y
	BsyrTyo4phL0UKuj/XVeDPmztfx8PBVX9569pFdA4Cj1J3IzLACy6WfQFykVyENbMMpX/PMTE4g
	/dCWI0MGDf4Q5UWkF1+n0m7sqo10nlmW88oidYiLX0zIcoKp+pRsFfW4wS5NfjwQWChnGSkHOAr
	gPDStrjzjzNO+wHwzK3jzoFp7+AulUMSiuzHfOpGfBSUHPoJzSUgQDfE4+fpgcC3k=
X-Received: by 2002:a05:6830:7003:b0:7e7:24f9:55c8 with SMTP id 46e09a7af769-7e99152425fmr450926a34.5.1782313998318;
        Wed, 24 Jun 2026 08:13:18 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:68dc:b788:b3ac:e34e? ([2600:8803:e7e4:500:68dc:b788:b3ac:e34e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e94406d488sm11520762a34.8.2026.06.24.08.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:13:16 -0700 (PDT)
Message-ID: <b5677860-8e14-4c90-b26d-32057e93b6fd@baylibre.com>
Date: Wed, 24 Jun 2026 10:13:15 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
To: Janani Sunil <jan.sun97@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Conor Dooley <conor@kernel.org>, Janani Sunil <janani.sunil@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20260619-obstinate-polo-a230bef97fda@spud>
 <20260619-bunch-diocese-dd7805cc17ff@spud> <ajU73_TkKrSbqD4f@nsa>
 <20260619-concierge-doozy-9c161533c369@spud> <ajVlD-j0nIGrRVow@nsa>
 <20260621153330.79b6600c@jic23-huawei>
 <5u4dnsgxwcwie45f24cacyzf3dko4srhyyyhcpom6tsvhqtmpc@y7d7gmex6n7k>
 <ajkMBh-R_7pYaoAn@nsa>
 <pifhwgj3cp2vc7ia4m6penh52iekzjljrp75y5b7j57vvtooad@32wfqruiqqjl>
 <ajklksIDLsj0BZul@nsa>
 <5guhkvoxhkzevjm4b45hhk3772akpnz3givr3gb56x5ywamzyf@oiycreun4y62>
 <20260623155732.318f34f2@jic23-huawei>
 <9abc53d0-432f-48fc-9e21-4d9a3c5e129f@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <9abc53d0-432f-48fc-9e21-4d9a3c5e129f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>>>>    
>>>>>> But yes, I do feel that the whole feature is for aggregation so seeing
>>>>>> one device with 32 channels is the expectation here? Rather than seeing
>>>>>> two devices with 16 channels.
>>>>> Yes, I think aggregation is the whole point there... so that the IIO driver
>>>>> is multi-device-aware.
>>>> Which makes me feel that different pins per device might be possible
>>>> from an HW point of view but does not make much sense. For example, for
>>>> the buffer example I would expect LDAC to be shared between all the
>>>> devices.
>>> That is why I would still suggest the multi-dac node in the middle...
>>> the parent node can hold shared resources, while the dac children can
>>> have their own, overriding or inheriting stuff.
>>>
>> Before going down that path I'd want confirmation this is something we
>> actually think anyone will build.
>>
>> Jonathan
> 
> To directly answer your question- we currently do not have a platform that supports multi device topology with independent supplies or reset lines.
> Given that, I agree to start with the parallel wiring assumption and defer per chip resource variation under there is a solid use case. I will also drop the "adi,resolution" proposal and proceed with "adi,device-addrs" in the AD5529R binding.
> With all of the above, the proposed binding for the multi-device follow up series would look like:
> 
> 
>     dac@0 {
>         compatible = "adi,ad5529r-16";
>         reg = <0>;
>         adi,device-addrs = <0 1>;
>         reset-gpios = <&gpio0 87 GPIO_ACTIVE_LOW>;
>         vdd-supply  = <&vdd_reg>;
>         hvdd-supply = <&hvdd_reg>;
> 
>         channel@0  { reg = <0>;  adi,output-range-microvolt = <0 5000000>; };
>         channel@16 { reg = <16>; adi,output-range-microvolt = <0 40000000>; };
>     };
> 
> Does this look reasonable to everyone?
> 
> Regards,
> Janani Sunil
> 

LGTM. Seems like the simplest way to handle it and should cover most
use cases.
