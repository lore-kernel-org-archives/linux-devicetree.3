Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEEE423E97
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128677; cv=none; b=LmlWS6IS3t+rz9EcU0pKILJ5vhIbWqWyIVZ11PjHGYwpTfKmeCt/aTQ2xb8wCuN55mFIpB4FVt5hDFAAUr/vlAhovdOnIH3CzNev1UGYJzo82GclTjSdNOS07nkPgfY+s3w8CjXAHIz/ko4L2RqjXtILFUMf5b6qzMKS4dvnLaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128677; c=relaxed/simple;
	bh=J8OvenS2hCs5THMJYtmCxf16EEHr+bum+fX8PSaJgqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTw4CnhuK2BmxFwp1xxFHggJ1LTHIghKEhFLsa20MCmd7y0A7W0v3YPFS60Ff61Fz0Q/vKJTROxBoE5NL2ERWP/K/gwfMn/XpVlB8BVLkmx0FVTcjzqtcc+ewHBF6mZ+eK28U1bP/W9pnQzJBCbjLjyGzp3iKhDqxGHEd9MLGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak616cRj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak616cRj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15f020a223so104668766b.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128674; x=1787733474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWyG58LZRk0FpypFIgr97MJusUzcaJB4SA6RQG40M3M=;
        b=Ak616cRjhRj8soNDK7wk18/0mrwuHmdnqpxX9rrWLfhizs9Iqf4aYqJbi6lgW3v1RW
         BV65ktICdj4HQYf8U4oDZnXSCvPtQyEUdxbr8WuDAZ1kMo6lP+laox5xnAFgKppfUWvm
         1kRQ9oMBpOFimzkWqsEbddmOlvbwpm+b5/ftM7Gke4OnGpSvzYYGJ0MroM/bOsJilYRc
         6zNsJus2INwTfkMb7hKoy5Lwdckmhn8y5dghJhWU00EYEkavTQVsbvMahvvLP0uTm3RO
         NpfT43vvnK12MTUqQGurkY+9Bzi/+SlAOnVsYpuoXUUlOsuHVudpqdf7DzcQR6NTjJsF
         g9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128674; x=1787733474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWyG58LZRk0FpypFIgr97MJusUzcaJB4SA6RQG40M3M=;
        b=U4X40KlZNJbv9Aqub0mv/dvZOB1MA5lIpvc+zTShlWP6k4qE0Dw/9VAZRycsZWnZfQ
         WY2GV3+Vq4/mjNfYGzfKbVBnNdHOY9EgLmSzI7VPiErEi5KhiBeSrjv3K5fYYf2ttM6m
         a2Ki+VpNgmsPVmhIqlzfLTDnnqO2Nh0eDIB9YYDfS3QruHvLiVq7jsvvHMCGOi4rP+Z6
         OOrr36YMgMib1+LTqC/VjrBC8zWO1w9g3c0BAHQP5uTvcetgFJAhKbpBCAiqpccgD6ss
         MmyVHwNpt6mWfY8tSBnMDO7de4g/C3bow8rXz7ADMB6HFRXaOGacwc2JvT3D4PAz6kU7
         Bmug==
X-Forwarded-Encrypted: i=1; AHgh+RrjhQIOQj0MKo9eYcrNsYptI9ROg6P+t2vqcOSbfR1EAhLBDYKtShNfTkNVzqL80R4lOJKloripHDeD@vger.kernel.org
X-Gm-Message-State: AOJu0YzDWPeqvyht70Sb3hZe2HLxx4EESRxadW7Z71RCF+ZhEeFVjtVn
	L+mTyVt1rtSgBFpFyevaZyy5rXsVbvsXteqB/jv5BIrWyDV51ogNPwrp
X-Gm-Gg: AR+sD138KoJfSTeP+xGopvXnq+L7CA9A1oyt6VlDnfsaS2v8YcOvkrg1Aq36vE/ZSlF
	kyWSaxeHtMS2Gt0RQK+NTappmAMGuhzWZrI8AWAx75hCb7XB1s2dXr2MaUV4+5IyOMNE0x2pIuW
	Ee03mdOTYNhviGM9GK0HlaDj3w4nMCsb+CgFvJx82TyblQa3ODPO5COXFOHJd1JodUDnX2fLtP4
	DMjSse6LpB02NNeFcq5a4M3tBjoUVV2iAoXOIFIhuSpmfi7b7lh4D6DMq+cmTwcmR9PjgocJobs
	O/rJvYa0pJQb6LjFMcbPIX8PtLy61a6y5vmG07RfYFPMoQxmfAdIynGeBZfr2G62JJYOHuxMqMz
	TtjrWX5LxEwEX9Fd69xwEYKQVItdapJeCm5XZBdY9KTdLT1u4JzxyaDFdAmK5tPIQ9JJmhJCYJn
	NA4/s0D6oWIkIzCUXQjb4nzhNQv+5CSYZE14w+ndePcAfK2t2LLxDojDwTqrui8QsU4c9e/3uK4
	UNzJmayHgAzzavxTo5LHsvg5g==
X-Received: by 2002:a17:907:3e1e:b0:c15:fc59:cdf3 with SMTP id a640c23a62f3a-c242e206084mr165876966b.12.1787128674163;
        Wed, 19 Aug 2026 01:37:54 -0700 (PDT)
Received: from [192.168.1.30] (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38b379sm43248966b.39.2026.08.19.01.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 01:37:53 -0700 (PDT)
Message-ID: <590e7881-de96-4de4-bb50-1e91439b92ef@gmail.com>
Date: Wed, 19 Aug 2026 10:37:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] power: supply: qcom_battmgr: add Xiaomi taoyao
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260818151039.409767-1-zstaseg@gmail.com>
 <20260818151039.409767-3-zstaseg@gmail.com>
 <20260819-slick-spotted-chamois-962510@quoll>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <20260819-slick-spotted-chamois-962510@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/26 9:11 AM, Krzysztof Kozlowski wrote:
> On Tue, Aug 18, 2026 at 05:10:38PM +0200, user.email wrote:
>> From: Stanislav Zaikin <zstaseg@gmail.com>
>>
>> The Xiaomi taoyao firmware defines an additional BATT_CONSTANT_CURRENT
>> property (ID 12) between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting
>> all higher battery property IDs by one.
>>
>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>> ---
>>   drivers/power/supply/qcom_battmgr.c | 86 +++++++++++++++++++++++++++--
>>   1 file changed, 82 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
>> index 490137a23d00..390d7c75e36f 100644
>> --- a/drivers/power/supply/qcom_battmgr.c
>> +++ b/drivers/power/supply/qcom_battmgr.c
>> @@ -24,6 +24,7 @@ enum qcom_battmgr_variant {
>>   	QCOM_BATTMGR_SM8350,
>>   	QCOM_BATTMGR_SM8550,
>>   	QCOM_BATTMGR_X1E80100,
>> +	QCOM_BATTMGR_TAOYAO,
> 
> T < X, do not introduce entries in random order

Hello Krzysztof,
Thank you for the review.

Will fix in v3.

>> @@ -1381,6 +1453,11 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>>   	switch (opcode) {
>>   	case BATTMGR_BAT_PROPERTY_GET:
>>   		property = le32_to_cpu(resp->intval.property);
>> +
>> +		if (battmgr->variant == QCOM_BATTMGR_TAOYAO &&
>> +		    property < ARRAY_SIZE(taoyao_to_canonical))
>> +			property = taoyao_to_canonical[property];
> 
> So device is or is not compatible with sm7325? Above code suggests that
> it is not. How does it work when bound by sm7325 compatible?

The device is sm7325-based and when bound to sm7325-pmic-glink it falls 
back to QCOM_BATTMGR_SM8350 property map. However, due to shifted 
property IDs baked into taoyao's firmware the parsing of roughly the 2nd 
half of properties is broken.

And any userspace process that reads the battery properties via sysfs 
suffers from 1s timeouts and it basically hangs my DE.

Since this is an RFC: do you think this approach is better than what I 
described in cover letter? (manually shifting property IDs)

>> @@ -1617,6 +1694,7 @@ static const struct of_device_id qcom_battmgr_of_variants[] = {
>>   	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>>   	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
>>   	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>> +	{ .compatible = "xiaomi,taoyao-pmic-glink", .data = (void *)QCOM_BATTMGR_TAOYAO },
> 
> And here as well wrong order

Will fix in v3.

--
Best regards,
Stanislav

