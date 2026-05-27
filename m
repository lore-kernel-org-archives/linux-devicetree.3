Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0C36493E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779915030; cv=none; b=Nz6X/umlQP44Vh4nf7qpmHyFwRZyoz9P/oepvYBZQwgSdVHVRyzoRvfdDgqKnZ4fL1K+8bUrK+ZQypB3cmT251fjVbrCSXNhdkeiZIjgxkqwTbEDft0ZcUQEt3hxHFIhNRWqxnx/ZO0c3Pl9CkXlQCEOosajrZLuk3TGvdRlpDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779915030; c=relaxed/simple;
	bh=Ch8UhebV/5NRICmqkk0vKbCURGtEelPdnGUhUTkn1IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQnQzzKF2ciXMJTAF291etNhhbVn9X7uwMlMuUmbmt/Gmr9+856iAgc+YxCJ3F/FiCWZ4p9RW43IeWqRlH9AsQjgeNqbeDILWQqOWSrT6dp31bnLyEUzEPunLNdiCcKnPwSKQCsqWhHSZSrxtqDdYZaPa6gkvUPvYshwAeBLbi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d25owl9M; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d25owl9M"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c80170db7d6so4854804a12.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779915028; x=1780519828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZgmT2PCf8Y8jhcdcmTfOPLMXO+NaMPZbn+px8TLtHg8=;
        b=d25owl9M9gAUzbprJP/KeN64nKRsHbaEPMext1UdfEZCzxThUz9sFsuYFcBxzdHuVI
         HYettf2/GhgNHafxo8p5mHfRuwBHQFHcKzq5z4uveVvyn+Ygp9XbT4NCGJY8KmWtJf6Y
         5ApaYWeXa0Q3CqMDzYEhzFPlljMqbW6rIscDfincsU/74Bui2tuxXk8NniwG1I1nEJnf
         7uOxGe6vw8Lp1tBwJWAmScxUUrqBDqAPoVeAFqRJesOjfq/QAd+C4IjOUB/VIChWKWxL
         5oHFadOFHK5BBvZDctpGvx9wmfLza3vS/FfpB79NjXuuA0FcOq3FYrtT+su/3IkYPBVu
         As0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915028; x=1780519828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgmT2PCf8Y8jhcdcmTfOPLMXO+NaMPZbn+px8TLtHg8=;
        b=rnEibn15wvI3utzEvZ3YwRoR7jF3KU696fbbDwWRhJMgTXYZqxSzwQyiXB0NTVTPF3
         9zBKL3CWG3rGT3eTJXLw0iqZP7dgIV+O29vtoitEsHQBoyyjVNUtQMRzXDxuWQfzzypN
         Rv2xGYqAnntKSWb1+iyn55sDKYhMM0CHoQWg7eK1dmyhC1TAAFTdutTeeWXUKZFF9LSd
         BPqTLetVrPSr42U8L4+30US3gICvvr0D7WW/9HSDJ+JeZ0klslRFN4YECwFKp8F2F6pg
         FtrE0rd6faKvVNoRLUgoZ/adjo0Fv3JA31yLFbK4M1rRiHNbh3eK7GcUF1bqJLrjL+6H
         tZig==
X-Forwarded-Encrypted: i=1; AFNElJ+zpv9NQIPyQGoXOK/UC7r/fiFV6pIlv+qDQG7KXLcV9kDTeDHwVerxkbe+ynTcXhQ9XxlD859E+Iia@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2oJXhW2+xR4xjBzxPhjM8TOhAjpvO0/Dc4HSUD0IFZQMJnVQO
	dBtTSjF9BtAACA9lxi7Iwx2vwjGLyJ/4rk/EgxpCLTgoGosM0YRZOm5Sr1c9U1Hy
X-Gm-Gg: Acq92OFbteBrJ432hchtvddScEzCoypxIlsuARKh6KVGL/ihFc6OHlHNZJb24FCbkDm
	JF3kgtFiLwUBc9YfVinuMnGm29muByK0YMxqDdefoz3CT1RNOFu/qZuh/hH+gTkDlYO0TmLQHkF
	nRE7lAEwKrb8hmpkVsodK6QdwzP9MUE0sivZsi8c+bY224fIduRHdnhRQ5l68pxf3MqrGu9GTV8
	VntVEsqVtgZBpNjDaFijFDkBr1bRvtbsmZ57Dxr4xOb9/S1gY/OcmkfGpZ2EKZ+ND2fgYEm7ohM
	nI1qwzNSAikEjr1F0/YFmaW/wrWa0pQFqsYT/2Th6mAWaSDZCfMlBAL+GJC4a1t+UbGIT000C+1
	27Goy1twvuJMCKjI4PMKSuCAZovv3YklpAb1BUc4wl86kXY6NwFg/Wl4KmtX/3GHmfaaVDZk3uA
	6MThcrI1ZdZUt7dR3+valsO0iYvcN3svuYIbsCpRysWMy1UhU=
X-Received: by 2002:a05:6a00:f03:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-8415f588372mr23987407b3a.47.1779915028339;
        Wed, 27 May 2026 13:50:28 -0700 (PDT)
Received: from [172.18.227.108] ([219.88.198.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6eae464sm4078935b3a.20.2026.05.27.13.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 13:50:27 -0700 (PDT)
Message-ID: <a727e1e9-777d-4372-a087-85a721f174ba@gmail.com>
Date: Thu, 28 May 2026 08:50:20 +1200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/dp: Limit voltage swing level to 2 for RA620
 bridge
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-4-graham.oconnor@gmail.com>
 <7e435e8c-ba0e-453a-b95c-450446dfc0ff@oss.qualcomm.com>
Content-Language: en-GB, en-US
From: Gekko <graham.oconnor@gmail.com>
In-Reply-To: <7e435e8c-ba0e-453a-b95c-450446dfc0ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad

I completely agree.

This patch is a temporary hardware workaround for RA620 bridge support 
and should not have been submitted. Please disregard.

Graham

On 22/05/2026 21:28, Konrad Dybcio wrote:
> On 5/22/26 8:06 AM, Graham O'Connor wrote:
>> The RA620 DP-to-HDMI bridge used on the Radxa Dragon Q6A does not
>> acknowledge DP link training at voltage swing level 3. The bridge
>> requests maximum voltage swing but never completes link training
>> when the driver attempts level 3, causing HDMI output to fail.
>>
>> Cap DP_TRAIN_LEVEL_MAX at 2 to match the behaviour of the vendor
>> kernel, where link training completes successfully at level 2.
>> This allows the RA620 bridge to establish a stable HDMI connection.
>>
>> Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge
>>
>> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_link.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
>> index 76125e9c0..ff0d8e99d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
>> @@ -24,7 +24,7 @@ struct msm_dp_link_info {
>>   	unsigned long capabilities;
>>   };
>>   
>> -#define DP_TRAIN_LEVEL_MAX	3
>> +#define DP_TRAIN_LEVEL_MAX	2
> 
> You're limiting this value for *all* devices featuring a Qualcomm
> SoC with a DP controller. Instead, if this is really an issue that
> results from the bridge's capabilities (which could potentially only
> be a symptom, not the cause), this should be somehow limited to the
> specific bridge itself
> 
> Konrad

