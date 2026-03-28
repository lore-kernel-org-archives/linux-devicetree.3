Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602E01EF09B
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 00:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774658488; cv=none; b=rh6JFbcVvEsDZ2rEFACqB2ceFNtMovZE9DejjH3Gkm/eMZ9L/bhcXLdrN3MDCylgh8hUckfNt1eONDmbex4RJCgXOCpsVlELSLSm2hOVA/OrRrZW6Re17FBpasX2ObULnETjqZhL1osub8sDKhuB3Rl4Ad2s8YBVpLd/WIz2YV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774658488; c=relaxed/simple;
	bh=vWi5PsX3/N3kIUZKJo1GpcR0ab9hV2ov2mnFXm2V5+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEB/v249rx5ZGszhPPJ3DpJTsO+wc8hFeZ3YuQzFRB13uAps0BnIO5/H9Tewbv9VnrX7qe1gLKYMga9LXvyvp8lD7gq0d94+3T60O1dfkaN7KkGEene4OWCVSjQURzUtfw7ogwDhUwdKvqjRNnUZok5IQzVr6b8M6Ndw1Y6mX/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=viLd/j5O; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viLd/j5O"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a2fb8ad36so1047171fa.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 17:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774658486; x=1775263286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGqFSu/F2IhY+ii28nyc1IJ0LboHG+irAmTUkiXh190=;
        b=viLd/j5O2afh9CeeL7DUdhStyVjJFcDF6ElR5yozqSLwFVxltdeipYPTM1iqpOs4S8
         g9GsGm3EWDd++XvTgzutVAxDs5PWlCYE8iwpsr20wVhGW+syqxXc91zb7A/Wrv8KqMwB
         ce+TfK90UvO4J7mcE1f2IQGWsa2oDkPI/8tUD+ZmEW8w9p3RVf2IDk449ZRYjsAj10P+
         HSkBpOQktql+AC5srfbOj5lW+eMmdtIHEYIeT3Z9h7UjbYxH2iah2Jl9AO46jsYTTyPD
         FIcAlepEXvAEItXFvoH7twz0c4pBbfOdO1VbfobrczypBqYVghDP+X88afwuvrArF780
         IvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774658486; x=1775263286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGqFSu/F2IhY+ii28nyc1IJ0LboHG+irAmTUkiXh190=;
        b=TrO7sQCwO7Hy6WMd0WF/Cp6+az34kMXGjUAkLysX8u7jJ1fmOcAP0Ozlx8C+2yC82O
         67NQmaId+GO1mvchAoTNOTi6yBO0dg6V6GHK63FCfoCMiT+6lYEIiHYmWTpBf0lnRhH/
         dAlHog2LAUCoeCNTkWalkZ3QmuUmMNxWTzRvUh7zbiCHW78tB2PUzbqi3BAoPlSe2015
         lBtYfXsXPZTxyRCT0GhJpcMu9fl+u2uiOsUrXb+4QUuSoY+FxtFd354T6BxT4SehrWUu
         f7MXq4LJNhxEbRLTWzb/7qnpymv/z01M3n1N0n9e8tBujxOT+QDKfKg6m2Ok94r80DJW
         xHeA==
X-Forwarded-Encrypted: i=1; AJvYcCXDSWvcFqQVFPfxTLARdfz+13odvmyhFqXsuUgxrrQK3SEpMJsxbJXETkMavEBps2Nu0npBY6D7aVfZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86dX6F9KQJ8l3azh2kYHbWcOUuckGcZh98PToghlmeJ/irkFI
	kvv5Au2IorMY9Msp8ZClywt63Jx3MzOsSq4lxaj96FVyfKC0tp9BxeHFq1wlQDXuIMg=
X-Gm-Gg: ATEYQzyYKhOHajlqI/WXyJkRtnWb0Vb/hW3gtQlWMMF1nlOby2ZsQ2h+F54WCVMzKXj
	U3QUAZpkT5+/3l4wA7EdVWPX1c8GA5518mQg39YBWE1b1PgaA5ZqTxR/vQ8rqCO3WKU7EegTUQ1
	FrZI/dcNdrsnGPDNNUr7552Aj93dS5j+nSnRJj45t5FLhF0xKrgph9vmy1w3YII5cY9050uFWf/
	Cix6Gty77PoHV4irbeXJ8mpQWPf/1w5gP35B3E1RQ3v3BesMMK6PtQkYXjgKXkMmlJTGPZfYyS2
	gCdDccXQltwUnbxmRUDeY59FmWBENEl3Arroibn47xUFoO8f3oMaJZ91o5vivyxQSR6TFYL87Mv
	uHmqw52sU7307hk9FKYEGLbgfJq/8mpBuzQJk9xhUw68TwItfHrfMGFbZY6Eg51TAfefm6a1UXL
	lD666zdPyJegMF5eLkCrl9uVtFkdsFO/8LDE6jD3MC6RRBSdo7r8aeNeN7gaSoUnjBCSVUPEr3y
	ygHJ7L7z2wLMXv/
X-Received: by 2002:a05:651c:4cb:b0:38a:3473:526d with SMTP id 38308e7fff4ca-38c740675c0mr7346841fa.7.1774658485521;
        Fri, 27 Mar 2026 17:41:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm1397891fa.21.2026.03.27.17.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 17:41:25 -0700 (PDT)
Message-ID: <d2ebd15d-71d1-4063-903c-2b5971696a5a@linaro.org>
Date: Sat, 28 Mar 2026 02:41:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
 <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/26 01:23, Dmitry Baryshkov wrote:
> On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
>> On 3/28/26 00:29, Bryan O'Donoghue wrote:
>>> On 27/03/2026 20:51, Dmitry Baryshkov wrote:
>>>>> That's just not true. If you read the camx source code you can see
>>>>> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
>>>>> PHY to support.
>>>> This needs to be identified from the data-lanes / clock-lanes topology.
>>>> And once you do that, there would be (probably) no difference in the
>>>> hardware definition.
>>>>
>>>>
>>>> In other words, I'd also ask to drop this mode from the DT. This
>>>> infromation can and should be deduced from other, already-defined
>>>> properties.
>>>
>>> It still needs to be communicated to the PHY from the controller,
>>> however that is not a problem I am trying to solve now.
>>>
>>> If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
>>>
>>> I'll aim for DPHY only and we can come back to this topic when someone
>>> actually tries to enable it.
>>>
>>
>> DPHY may be the only supported phy type in the driver, it does not matter
>> at this point, however it's totally essential to cover the called by you
>> 'split mode' right from the beginning in the renewed device tree binding
>> descriptions of CAMSS IPs to progress further.
> 
> Okay. How would we describe that there are two sensors connected to the
> single PHY anyway? How would it be described with the current bindings?
> 

An RFC example was sent about one year ago, it allows to specify one or
two endpoints under a single phy port:

https://lore.kernel.org/linux-arm-msm/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/

-- 
Best wishes,
Vladimir
