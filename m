Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA71142376C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234116; cv=none; b=M9ZE2NK/4gVrRzpGI98yGwtP+REeQ5acSRwlaIGPXgnst6Og+ukaiOrYgz9YWZ19tvQzNQFhTtxOGpxROKOcUZaGnjM8lu9opDZnxkLXLH3BuodSf21XNbVf93TC0HeVCA6OyTf9Pg3+vVPQdWPumcVB0wdvFZhxML9koLJ1PVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234116; c=relaxed/simple;
	bh=Z140N4DvbE9EARvKoaKN/y8p/SDNEcqELF71ArNYrwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aq7NlVQuZ+9dRsUPLXX3lWIFOuJ69attu9wWCmI9FVpy48bcAqpkM0UACcWD4Hnv221cN0mY2t5T6EcmLE260ZS8sPFu6WNrvlZdV4PCoSkQn4+vQVnBTdM3OXLNSqKdjj8YaOWc7PtBK+5rNvDLaCufl8JbhnUR1vS6lSN4X0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lSIeZeX7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lSIeZeX7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1712a04ddaso590717866b.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785234113; x=1785838913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVzux6UVfcA+2FPkP8ofIMape/wgcKMMpR+shB5OFes=;
        b=lSIeZeX7NH6VUPIDR+RrIIcEJ7yw/G7dBHIItR0XFq7AkE1YxFS8uk4HIvRQVnpHBM
         wnbeIxPbXbW0BSN4vWA8ifwuJU/3g8k4DbawqkxHzrRBSm4qdv1fNsgnCg+spUKHiW7b
         CXpqmVGIH3psYAku2du4twRFtCvh0E3F7FG/W+aQ6HLpmPboC3heAoFKNbFKktitWWMW
         rm2yqO3EMFnzCHk3k658Xjqq5nYpCwGww6tbjEt6YHy3jcJE+c+38Qs4hWzXYxHT2wlx
         HfZPFFUw8ztHKtM2WVLUarYWYiJfFTCvrDwimbOt4b7llM7FUPYI6gvJ3s9SYlFiDMlo
         /QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234113; x=1785838913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVzux6UVfcA+2FPkP8ofIMape/wgcKMMpR+shB5OFes=;
        b=XpkfRphH7N2/wOOao6yoNSJV1ZvmMTLGwdxAfS+xxndkqAL0y4ZW85iQ+ev9DffSfb
         aSgpTyjylUWVi9EfelSIgmSvh9HfXipV0YmoyrFXkeIoSLndnZwygdcfOyTCIpWMcTde
         6jx78HCnMEvxEll7tUuToP0AGjtNX80kbJNcn6pmzQblq7J05Y8dDtFw57zTbphC8OT8
         IO/GxhlaBDL+gQP25euMTsrbeToY8WjjYWPcqVuRtSYoKB68pCDPvSqaPcKtmTx/aaNW
         ncknzosQrBWRW0u39kLHTjQBegkVAqEo0dYpP3L5nDhcMrQwageLiTZeez7NAJLlriX/
         oUHg==
X-Forwarded-Encrypted: i=1; AHgh+Rpwu6QB0IJTgOw3mYkxzngvDTthP5KMLnYONtWJSJd4uXT1oJ2oFb2VhLcO64K0zvK25M2zWLeg8R3R@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3WHsRX++HzRuAYqOkOPq0lUREqoVNauqNWFDZ2fjVHb648Iu
	8Y3kkia0RR58NrRClPpsD5eCg7wH/MqVy3UzP7Q0NHtOsoHSlhMZJVOFm3nTjH7ZUv8=
X-Gm-Gg: AR+sD12bQ6aA3f1aEAsEtnpHkeQKw3vWK9nDQ7IE8BKTG2Olvl4MS2DtE6HfOOfrNzd
	rA5pY3Nkrkwmo+bphlooxRyAef5Hp3vD2GX4sworMl0xTnwbUZm37dztJJtAPALsi+7mocfkP4Q
	fhSrc8KczWhMas0iaS0RsFPvIJmtRMPaNT9vm1Qgp41G+p/RfG5mxd3R7yIx73xcrRtdCLaYeBD
	/svL49lkPz/y8S0qW2Y8Zj5q3jBcOeVbj2NppRx5B8/Z2CVYSvb1XYEg6bPzNjgMHf+mR4KKGE5
	D2JZHb6xzUSRd7JHUsKlK7v42Lg5Cn/Tq8ZzX9ArbztNi5PQrhOLoB4Pl6jCg8v+8BQqzwXyrIi
	im5llUeem5KHoIdxp5ZlwM/ZtjOCllwTMeo5XeRIqFiNVnVR5S5g6gArncn+hbu/UOtkqsGQ5EA
	vxCW5zq/2c0ommNA==
X-Received: by 2002:a17:907:ea6:b0:c16:1901:6ba1 with SMTP id a640c23a62f3a-c1f720f92f1mr101362666b.34.1785234112728;
        Tue, 28 Jul 2026 03:21:52 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac7eacsm751144366b.17.2026.07.28.03.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:21:52 -0700 (PDT)
Message-ID: <4dcc3b8c-8702-4d23-91f2-e3f84567dee4@linaro.org>
Date: Tue, 28 Jul 2026 11:21:50 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/5] phy: core: Add devm_phy_get_by_of_node()
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org,
 media-ci@linuxtv.org, linux-phy@lists.infradead.org
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
 <20260728094717.DD9A61F000E9@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728094717.DD9A61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 10:47, sashiko-bot@kernel.org wrote:
>> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
>> +{
>> +	struct phy **ptr, *phy;
>> +	struct device_link *link;
>> +
>> +	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
>> +	if (!ptr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	phy = phy_get_by_of_node(np);
> [Severity: High]
> This is a pre-existing issue, but does a TOCTOU race condition exist in the
> underlying phy_get_by_of_node() that could lead to a use-after-free here?
> 
> Looking at phy_get_by_of_node(), it calls _of_phy_get_with_args() to look up
> the PHY. Inside _of_phy_get_with_args(), the function temporarily elevates the
> provider's module refcount, calls of_xlate() (which returns a bare phy
> pointer without incrementing the device refcount), and then drops the module
> refcount and unlocks phy_provider_mutex before returning the raw phy pointer.

This is an interesting idea.

Sounds not implausible and I haven't taken the mutex given in this file 
which is used for adding.

Yes taking the phy_provider mutex seems warranted until the get_device() 
completes.

Actually this is a result of functional decomposition so, I think I 
should add a patch prior here to take the mutex and hold until the 
get_device() in the existing code, then decompose that.

thx

---
bod
