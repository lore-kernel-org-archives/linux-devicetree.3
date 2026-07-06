Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCF03911AB
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347131; cv=none; b=PHHTc1WUAtH5+FL67jII1C8tELhHAWggLSfyDlUtPKKcWLWEMpzNQhtkvUJF0Z/zw7vr98KjtGOLLFYxxB9mGPwW+k2r+fCmfJPV5O4XSsL44+lgAKTXOghPj323qrziOmEnfcdroQYbkP3Qm4JvSdZ2FVUYyPUDYiRrEwDZY2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347131; c=relaxed/simple;
	bh=AUKedEW8L364I8JPQAlKye3yP1O85tY325vvcI429kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZB4st4vhqmpoUX+7xUvwGxD/hzz1P4WUWImcll39O4mJcVcKTVW5STMwPzbpODsLEgz/Yk+KD1l/B9Rly4kMeX/9LK8kFF5J9T1qta79aQfKQUFk/9ggYm2etReLYkROIEhNGGbzDIrEHan5sf8Nk4rChWCHvPCkADFCcmErnww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MA+Tf+UY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MA+Tf+UY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso21467005e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783347126; x=1783951926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRglC65mYb/1PKnmY3GPB+Y//IKYaoRtYD9DfcwlSuc=;
        b=MA+Tf+UYpjIp5PwnmckYY7d65jEoi6xAkwBfJEDSFfM7S0DeC1DSCJnqYtPfxFWpK7
         SaW37deSkncxbWk4Vjiy0TX3EVCkZaypDiNF3OV7Z0uC1JxtpzQv7VdkdqFXk+yKuKZg
         sWo2+opfDfCtNmEqmukrcKYZWj0zfHdMUlHftTiwPTZSP3tLVkRYxObUDCypYNMJC8b0
         NHP8iwxXSKdy4TgU8SZOPUrDEWwrhIZiwIDTcY0CePmwqtguer0l2lzA5DG/xVlKGc8e
         T0yvlpOczcurrmZJtiApFTLgS5X8aYFgthqxcoCOu3UrBEv4hTFR0evrRCoL649V7g9F
         BzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347126; x=1783951926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRglC65mYb/1PKnmY3GPB+Y//IKYaoRtYD9DfcwlSuc=;
        b=Xo6LQt4a9bTGGU9D/4JUp1kxPB3aZvi3ylyvIGgzmbkXZnaZL3ZYVxw/ODeNcFn3jT
         uIOFBL/H0GM51vEjlovhITZXN1MnXFZfKUf1h162mVaavwm7qHk/8huRGhksrzpWiOVJ
         ZDGxEpSm1dipTxl7l3gcZ7hBgd6HGdQ41k/x7W3OKpDXFdhs2Vqz57sWiyt6KbSWuOg0
         QV5+ESCcUyBu4F8i80XaK/LK5xgdQMn0ZvMNdd4zCI5iUToGiM3V2wOaUNcDun0565Ug
         nO/Pq6DRz2RGtYHoW+4AYxwPlY6IVZC+0HauvAcFz7R9ZM+TkyFhTUzwoRsmfafo1mn7
         yBhw==
X-Forwarded-Encrypted: i=1; AHgh+Rqs88vaCPsz9Ehp4Ikm4FznGjO66sH/Z8byfLtvcFGQqCunV8KZIeDUSKXhb0wSwghotH8lpzC0TBMK@vger.kernel.org
X-Gm-Message-State: AOJu0YyswOM+EJk0e9Gqdt/W7yY9DS2/05ah+8CUcXJdqKhavbFTK7W/
	5y9CPSWirN3eTGNh6qZxwmDvmKGdDpDRPpWV+Icv2OMJ6Pe6I3GOXgdxp7GXK5mdFLY=
X-Gm-Gg: AfdE7cmBRF9RVYHfuAEhvcuXdXMAiHQKYbQAs6YXfNntVHWIn4kEF6ooe3v8ZQOx4Rd
	XHscxxjth1FbjlO54/l4BUE+vCTRwt3X2JF/+/PnLT2ltyhqYKhXSz2iW6o5tFpN++yBFAVIB4l
	gU3TC82rZRPia0DxmL1SMiMC1eSTnl7agtrurnrIXRreBy07Xy4imjQNZZMsfgP72WvakpTAwBt
	xNdWjeDgvVgFObW0/jAKclxj2jO0639CafhAq0tyuwxb1wMuNhhkRPe7OJd3dB2IBuwGvnFB66u
	tzPb4/RcUqYZzt6BXoAGl8R5FF6CiZTibENbbN/dgsl9EE8WnZCOpJp0fa2vSMWWkYdOXCLvtRX
	pfqYe9QYaydZsoIy8qn47uei6CmmuvwJOLsDGr/LwktYKE6VhnnZOcyBpntTUoghMsbb4oMLIGl
	y3UCDFEo2yYjOJAsI51ZRGs5vH+w==
X-Received: by 2002:a05:600c:4747:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493df093146mr8495275e9.21.1783347125751;
        Mon, 06 Jul 2026 07:12:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm25651263f8f.13.2026.07.06.07.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:12:05 -0700 (PDT)
Message-ID: <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
Date: Mon, 6 Jul 2026 15:12:04 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 14:57, Vladimir Zapolskiy wrote:
>> This debate is going nowhere. Check the downstream you don't need the
>> docs titan_top_gdsc is provided by CAMCC.
>>
> 
> There is no debate, since my arguments are not debated so far... Why?

An odd claim, since this is the fourth ? level of email reply.

> And at the same time you didn't provide any support to have N identical
> spread hardware property descriptions instead of the single one.
> 
> What is a good enough reason to prefer complexity over simplicity?

I'm not sure I parse your here. The core fact is there is no "thing" in 
the CAMSS block that can be modelled as a provider to JPEG in lieu of 
TITAN_TOP_GDSC.

That GDSC is provided by CAMCC not by any other silicon block. So 
omitting power-domains for individual nodes is incorrect. Best practice 
and in fact the _only_ practice that can work is to list power-domains, 
interconnects in the individual nodes themselves as - I've pointed out 
multiple times now - those blocks have to ramp clocks and scale voltages 
dependent on their particular use cases.

---
bod
