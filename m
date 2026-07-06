Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632142A15A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340833; cv=none; b=BMqyxVilxP80NpdP8ZLhnfJ/FsGRC3mBj0jNmhIHEHYjWi8k/lLE9lXmXDSiRYi3qqcQ0wZsQ/lwRioB0NgaaM9MX1ib0tleSw5lA8iHtjC1i5XGU2EaKlWYeVgCzg9amsaXz7g4xBTdWn0kDJtLfsCFP5DPfULScYhT+pTyhRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340833; c=relaxed/simple;
	bh=i3On1m+1xOP7BaqxdPfl0e+BIrUqtmSgKy1W2+LpuX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYmPqhQBraEMo+5t8KXwuuQ8Lp6zEdr3w4Vyy97xexvkqBmNS82FU4Z2mrjrU9G8pK1DBD8ztTpC9K5BbQLRHgVDyi0nYvYB2ol5QCXey4HCb1J0RJbPWn3iINIlrW8I8zHshgODwBIq2g/k6PhzdMm+fDjsErf/baJb/tqH8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JmQ/2JrD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JmQ/2JrD"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so5502570a12.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783340827; x=1783945627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqZgOHmUP2WhlukFUJpUWMWTr9sro7DNP6QMMUzHrZc=;
        b=JmQ/2JrD+d2kvtqkaU22bC2mWFrRlJ4H2FnVSktcJN0erOtu29cej990y36xBDfl6g
         /5dlt3o4eb7siCqhl5dNTGgoUcrgr4O2VB43aUlpVik2gYDjiaotg7bh/M2n65kKV2Bz
         ugswnz83dkP2pLwsQsUK75XSMU8njWzBpUwYjTaGzDJ3vGtc7taG0QNSy9OI1QvxhPRT
         NYnNI5nu4eXrFC5s0qwVoy2eNsXrJWjeQ2FQE1vqg5nZIVJJ2x6KyaM8HoZSBiJAwrv1
         8t3bPIsKcPyMAcKEe9I1R4SDYOleMzEYa6J/P+3ouANVbyKF1rm6x85ihf0gl63zpi18
         mgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340827; x=1783945627;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqZgOHmUP2WhlukFUJpUWMWTr9sro7DNP6QMMUzHrZc=;
        b=YtR6YhqFASuMMHmFxHmZGGhTErgYVXFPH8+u+Ba2uWiaoxef8eGRei5zbgtbLmDG6t
         QdPSHBZcCaXUZxLhDT7Ertzy7LDioymAYhNsi8tFzj3s8yf+/gqSFgi9L13RvBCkaGbe
         74T5PygnUpm7TJP2abV6l4FmiRbA21SaCB+7uwHDXZdJlZ5p9l2R9EWaXWNg0tHfpBFf
         qZS0c0kg8L9Vru4VR6y25+130cgPwHnCy1VLYSlHUC4Z8lomF+mBh0togga7XFGQr9p2
         Cq+4q5+8VUgCCzftnjfInqoU5ZGxZX1BWyh4Esvs7mh4Nyn80YCl7v7tbO2QF+AmXtIl
         hk+w==
X-Forwarded-Encrypted: i=1; AHgh+RpTdKxuq00iu3Q2D5LNNeURR47uxbOv4yq09w9kVlo8ektDFI/P/NlIRzhpztcYmbCZza6reKZRNcfc@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGYa3baXY2KEcoOpmwxzSLilpKgompv9K5uND2mqmIYABh2iz
	dVUQy0XFqpgMkJDSonTdmu37aF3hiadqRj5tozMy2SS6mmUFvI+X7TzuKOj6s8HHpFM=
X-Gm-Gg: AfdE7cnptMWKa+ATo7BystfDLq8g6Wf3DcmoRvDmzWldG9ZJixBENcyt2FwhWDoAcI/
	Sr7IceJ8GqP7l+oD6OVipRvIPe9AOYNyDAh/CotbBOeq0OJWe3vQHB6HufDwNtwg5BROSA7IWdr
	0Y9/esafP/WXxncoYQrgX6PJ9qCxoX61xPRa5/kr10sfTRTOvnNBasGnidJfQbD9+2pUgsXvToo
	Far5SJhj7Dwif43B9CKdH3vOFOWa2PMZxXLNLMCJS++uff0/cRaquD264q638s3S496oFsJ9vKH
	04f87f/CcujcQDwNRtrqO0xSbSwCvP5UNvtSRX0K5oNbbn2kcgwD/+QQZmKEQxYJUsKkIxdhLW0
	tTGIjIe01QIv+MBqRkd10LTpwmM++zFw2DM/GkeZponnmUtLXiXxtEa5gahZzOBkl+Spz3ouLsO
	btbOI5kGALR2N3LZ/sU2LuVDR/Lw==
X-Received: by 2002:a05:6402:2115:b0:697:8d48:7fa7 with SMTP id 4fb4d7f45d1cf-69a85ba021bmr238124a12.22.1783340827234;
        Mon, 06 Jul 2026 05:27:07 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4a60sm3946787a12.8.2026.07.06.05.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:27:06 -0700 (PDT)
Message-ID: <8871f6d6-6102-49bd-9758-faebbd9fa19c@linaro.org>
Date: Mon, 6 Jul 2026 13:27:05 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 13:09, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices. This is required now that CAMSS is modelled as a
>> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> I do not understand this rationale. How is this required now? Are
> existing DTS broken and do not work? Then this needs to be explained.

Required is wrong, true. Existing DT is not broken no.

Should read something like:

"Use devm_of_platform_populate() so that child nodes declared under the 
CAMSS device tree node (e.g. OPE) are automatically instantiated as 
platform devices."

Why this patch ? We also discussed simple-mfd but then settled on this 
way instead.

https://lore.kernel.org/all/0f898ad3-156d-496c-b2c1-88646edc7ab6@kernel.org/

> Best regards,
> Krzysztof

Not withstanding this series, I'll fixup my version of this patch ;)

---
bod
