Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63047D92E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845304; cv=none; b=KmqUF8J3H/SSqCHTjCo1Mvy2zRJ47unceJBQf9Ct3el/RviymtwVTnFRBm+Q3xg72eG8gKgtbZzs7SXwDbA9936/qEsfsVi1WeOQoiRE8niD3cs7TOJTt30dm4+4G3TlKArIWrW9+RVJuUdnEaqvrjMsTMzk24h91d+ZBqkLhZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845304; c=relaxed/simple;
	bh=CTwiBTXgKo7K6y0K1Dx2UdK0JxC3dCcCpJUx4YVxSM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKi8PXVVWqk4UJLwjpbnT1D8P4PyBD1NBaL7yBobWHnsE8wSWbxAiPWrD2fUpdvx4L2x039OMnymkX6pZQ04hYPEyNST6xAw6ih/zoKUEH6u2i7vJ1t19kOrDsBROk4wC47vDsqEhvpv7Jn/6c2HgJ8QAx3vFaQuXPEBCCXx/4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=o2hkzp9L; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="o2hkzp9L"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso15558829a12.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778845301; x=1779450101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0YuC8NLk0JJSjHe3iGG0tkbsopOL75mgPP59FgiTls=;
        b=o2hkzp9LAx5y+kXSG+qoaGv+0i7ZgiLkzhAo/CibsDYs8RQ4yq0jkysaY1lOxLzEqF
         ccaXDINSjEbYfWdn7P4o/2NKTRkmPULCB0qG4mUSW5F227Jt9KJP/Z57nbFlHf2MaEZP
         ptTBeMTRU003ORlt7aIVLddhZKE6AyfOlb/OJ0TcSIDsQdKq5s7Q+Fuin3C8JRr4O53h
         feefA6yVTyH9GimKO5mMwuhhL3AMD5xfY7qtU58onbNEfNl/J+DTAPGbijWvowl4JReq
         hvIcgf66rOiEjUkHgGY5C5Y24HRXPSS5ja+WPRBIiIvcIkd+wuVXZDYJof4Ubbhs2j4l
         e0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845301; x=1779450101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0YuC8NLk0JJSjHe3iGG0tkbsopOL75mgPP59FgiTls=;
        b=FBjdsvUkye1+7tURU5nR2HtwEVxYQlZTysEZAp/XFf+5ioVOXfe4TzdHzun8p6ClzL
         lWyITiJhHEHvRCK9S4mLqEILYz25TOIsO2kNpBG0Uin9Vb1zLlSG3c+cGZY3aXS1JvFC
         4mcp3vQw3PiMRz0Mth3OQQ01gGoHenIikMfVZhLDxwxfL1EowWrjFfAQnMLidxAaCjRv
         qz0dexeOIUUgfTBl8ohfPbe1k8fcrERQzWBfnxdRU8Uwpd3JgnQUMDkpwQIyXZzlO5HI
         WQNAEEeE+kNp6s4fRALpwESmMDrYSC4D9qRUvdT/Ny9NNGZ/yRhVYedEjj7pHHM6Qc08
         j4mA==
X-Forwarded-Encrypted: i=1; AFNElJ8UouhixWT3feRmupwn8FZnSrlA11E40ZrGEPBxhUxn3V6CyQLHLfd9jaq4fnBeQCKMLqqUWaBXnNaA@vger.kernel.org
X-Gm-Message-State: AOJu0YytTPn273h6ZhVqvbStW9gmjgPY6bs8yuO1IO+0qYzflKTomhtr
	CD1f+cmmGl8VMExKEKPpmfaSf8FUrHNjT81rYB90VlpsI+RsIBEEjNMt6L3OglBDnVw=
X-Gm-Gg: Acq92OG8ZLQdg3kq98Q76T01yvNJUvXwNMDhAY/GB6Z8rd0mpGUhr9M/hYJk+FKcDVL
	JPIsse3+s3z6DsxIzWzSPb6zdOB8RDHMke0TL+x3E2GYvRoQoS3vP1v5RWBBA8yShouOFns1xpN
	AcQIE1+f/PB7CmbAQkWUXQpI9VLaEbBaQSJbRrk6eqNoaEwl54VrOZNjgQd2Rnrs9guV1t5328J
	sToKdmw1wIE7n6Ex+6A3gE+z4AUuYnOUesnd7BUCZO8RhQFTpRSSnqkYev84NqnfDyL0Jzm8Lr4
	HDjZhwVr9dJaOL/JsyWnWeNzIMlQ39LKTqF/PHhBtr6cAyUhpejTXfXyhUKZKke9OhRPyR7dijC
	MGLAQ0uc9DPprrgoe04YtTpUWWh7L46GxipSKbLXlv+IojVUvzI/lTlleMd3xUWQgMn/4M5blEU
	6j2TXMQusbG5AFX9yPOR/vmsl9xdnoTFSxrOGTQakcT/eU7juqOqmLajIO/QXabMuU2DTbng==
X-Received: by 2002:a17:907:c291:b0:bd5:7a3:a58b with SMTP id a640c23a62f3a-bd517994249mr190506866b.46.1778845300966;
        Fri, 15 May 2026 04:41:40 -0700 (PDT)
Received: from [192.168.1.105] (164-6-132-5.ftth.glasoperator.nl. [5.132.6.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c31494sm215043366b.20.2026.05.15.04.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:41:40 -0700 (PDT)
Message-ID: <21308d1e-712b-4d3b-b083-251c8d755470@fairphone.com>
Date: Fri, 15 May 2026 13:41:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] Input: gpio-keys - add regulator to gpio_keys
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
 <20260508-gpiokeys-vdd-supply-v1-3-0bb32e8e6428@fairphone.com>
 <af3oqSshbXrUYMnz@sirena.co.uk>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <af3oqSshbXrUYMnz@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 15:44, Mark Brown wrote:
> On Fri, May 08, 2026 at 02:53:15PM +0200, Griffin Kroah-Hartman wrote:
> 
>> +		if (fwnode_property_present(child, "vdd-supply")) {
>> +			button->regulator = devm_fwnode_regulator_get_optional(dev, child, "vdd");
>> +			if (IS_ERR(button->regulator)) {
> 
> As well as the issue I mentioned on a prior thread with this assigning a
> non-physical "vdd" name to the single supply that these components can
> have (which has had issues in the past

Our Hall Effect sensor IC does have a named "vdd" pin, but we are 
totally open to changing this to power-supply or whatever best follows 
the standard.

> painful) the fact that this is fwnode means that this opens up support
> for using this with ACPI which is very problematic given that ACPI has a
> strong model of how regulators should work which is that they should not
> be OS visible at all. 

Would it be more appropriate to drop the devm_fwnode_regulator_get() and 
replace it with a type-casted devm_of_regulator_get()?

> That probably needs more addressing in the prior regulator patch, that 
> needs a bit more motivation and discussion about the issues with trying
> to do a regulator interface firmware neutrally.
Thank you for your response and feedback!
