Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D8526A90
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651682; cv=none; b=mW5v98MgOP7PjQBmc138YpYdV3debjfy4coipPAzIE63LE323BkH4/aeBv3XPBNmOMsRbqduSDjXOhtPxo08ep0uYIR+QRGl4YPpkASKwb29OSQulN1i9yHOCx6LELZKEr/OuNULfzI/WrwVkoU+QUDkA8Jan2OG/i5IEC3I4As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651682; c=relaxed/simple;
	bh=TX6xhS4Vhis/cVqkO7iD2bmIOPGH7N8MJNCWfFGrVr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVu13kv5OzucObu4Rr9py9u/zg2E2ubRL7upq+IcWKDv8nXu5OIhAVwMFu0pvyd2k6UhZxPjHm2tsrYBcXlrz27Oobl76WuxLhancTY2cEkiMYF3GmHVn+hFbw5H32IgOCbjKOxERbZsvcfS8RIgfynUdlcyY9xm270OWLULmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJPx/VkR; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJPx/VkR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso1344580a12.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651676; x=1790256476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=OJPx/VkRtQ1fIdASIxegqFHT0i3xYB+awFm099+ZIEeVsYTarq+xHv0polyYdj22JM
         BHvYD3HpW5LLY1/Aq8nBlVzmuN57UM6PNT5gIDypU8XJwCcRqvqCmU7RAddDDNNjgdrS
         l+cZxshTdscz6asGb3tqJaQeBOYVFwmuFO0GPKGphIrO9LfQv81y+dlfRDREHa1+jy1Y
         ALBFDSqNVCwkuWI7zjO2/kwMmxKRnYoe+9z+Ugs8VuwC6HHpsOkYI48vRu0NwfJ1pk75
         M/AG25D3IuNO7Ftmcd8Oo0IgT18PvFy/PPpoj833Kj7kh8Eil9yogKdpr9WEo8d+BaXY
         8DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651676; x=1790256476;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=YJqqdpUs1sCzX1AAuk4qJcfNAtZEcC2Otw0yAkj63pB1yKbLsQDZChMFAHLRgFiZ8S
         7q4ZdleOwloCWPmHDdHrQ2jZ5uOFmV+m+3Nl+/g0VaHBz3SdEamc7+NVj7lCin4joAq6
         OiCvIG/YqjFmXoz9ts3+cAxAmcsuHG4tTwlcoqtG5NmFsQFxG28OSknBHYFsYya+JDyt
         KaZT1fHmAvo+8Rwpqxvb0yrTW6kt7x8KaW5Vhrb5+03gCCFRuQS6mLMrx9wb/ybJU7x4
         0BLHTv/3PgXH97RBrXfozGO/PNNIW+/vKNdndEDa3aZKRFsXQr6MfuR8g3OOmVPwHjOU
         iIyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZmmK2GuGnE7bLmaSr/DwzCc/H6FaqkL32CYv2L+yjiNr+974ZzPH6w4RjDG5kLVYC3aw9Ih2JdRMe@vger.kernel.org
X-Gm-Message-State: AFuF++lC2q56MgzgyUGIsKXV9B6CfEMsB0IFC2ooVj+98u+rd/BRer5b
	PGEnMynw5E/lkkV4Tgjsdq3ZL/sscRJdtE7IxlQmzt4bcdflqgQvCzmC2UzC9+mFevo=
X-Gm-Gg: AYBFou0ht/6SZcDzJuHR60djiwz4cGuRqL556sfTgexjIukeTLC7iN9FGka7Djs7oyr
	HHrlyDLLeTZ5tqU4anBN+X2sndnROkjz7r+1OTNGzDKq63Yo6OmMquQ4kGg6+qXCxgJ5lxm6H6p
	7IE2KYUfqL0kR25pjxhMvZzeEb2/ZAp9buB1B5sVa+oM2uYAzbNA7s/jADns6XGvxT5B0dE+EY/
	cuJvXGgmFCJ/h8cNuyXDIIVAUJnCun2GBGG7CtyJ1MeQ2zOrmvvaqT3hctkT7nONrO3GulDSVFv
	NNOxQpAFmsEgBNLBfXrkcXRzLS9TaciRIg5eXo232TWNe0wkjnPfSNyaXm1jqLzDmFNGM3mOzSU
	vI9Mmdl830OE64Bp/qsIn4yLhowfyeQSLpkJV3tIJl+hOBvgPG1bJLIc6vMsEKaVPUVKbiB3pG4
	Gc3wwUjI+b1/XSRY/6qb2eTvny3kkeXYPBDO+KVBA7n8qCNaAgFJp2JXaugmGBwkBGQVl1x3Crn
	zaP4hsZen8=
X-Received: by 2002:a17:907:d0b:b0:c26:19de:9acd with SMTP id a640c23a62f3a-c29e5308381mr463526666b.37.1789651676039;
        Thu, 17 Sep 2026 06:27:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453f04sm293940366b.15.2026.09.17.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:27:55 -0700 (PDT)
Message-ID: <37f182ad-a137-4066-9e94-b06be2cd03da@linaro.org>
Date: Thu, 17 Sep 2026 14:27:54 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
 <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:32, Neil Armstrong wrote:
>> -        dev_dbg(dev, "failed to create device link to %s\n",
>> +        dev_err(dev, "failed to create device link to %s\n",
>>               dev_name(phy->dev.parent));
> 
> This change belongs in another patch.

Doh Frank gave me a comment on this and I just changed it without 
realising this isn't in my series at all.

I'll drop this altogether

---
bod
