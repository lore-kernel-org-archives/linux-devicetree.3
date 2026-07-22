Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847643D300F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713395; cv=none; b=rnfnLCPnM4w2rq1abHUGSaSwhSUIeQu6RIz/07x2vnehEABU0bCcbpuMJui8ZvjDeHjjn7Of8eXQy1BuRbAJYYptGkxJGpe91aJWmckEzBZKFf/x1eZCKRwlZPKNLQlXqZEG8BXlek0ibAtJAEd/Yl6wymkRZJJLzUNRv/31M7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713395; c=relaxed/simple;
	bh=U+PGb6aIFUkkwFis3Hkvn0up5svo/RYtJBDhQOzvuYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJakgPJlfLu5LJfRr8GvbZ5KcXbhHHQIGLr0enXezGBB2vyYltLB6E+9Dc7IN+SxaPNd1etF0uEqbOQ2U1JGniF9JucqkP9+l1nyoB15bP7B11U5JcqRlNr1elfK2fyMzR5xAXq75h/QB3Kje6E+/JCEONeFVFUuv6PugREYw6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Avnx/QEG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Avnx/QEG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so12295637a12.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784713393; x=1785318193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBmeLLqRW24OAr47eslDpBbvu1uL5Oy4qRjOe70Vezk=;
        b=Avnx/QEGzy/jX0hjH6PTuxP2fjMJWuYsCIfr1tDig7G1CmiwGdBX7rsyQovv3xR17U
         +caNZbFthz7lzqFPxDm+TrvndfMEcc81xNkcFRn4Nh+Qsh6nihoCgjo+qpGPyebJKcuK
         MGHt4/eNVoLzLUyIBjdtwHBWsaIFaof9mD7bxNXNTBsAOM508HXkn4yBDcGcxHPEm+ka
         tYzHvdpNt0auhnu2NHBnjXMTzIzVksJJuQ1w8CKg/t2722KTDYi/u7I9qi5i8fWQTb0e
         c/ewS+hLUgI7eaZLbqWhpJ2ZpEIo2AgNlER3wN9BG/RwKx6lwgoiXlpN3SCoEMVy8+Ss
         PTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713393; x=1785318193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBmeLLqRW24OAr47eslDpBbvu1uL5Oy4qRjOe70Vezk=;
        b=g8KWha0B2HcM0SS8Q71kFZyyEqwGMCgG9eA4L2SL1zRfySTUU5nJaZJ51teroHRQnA
         fTZScFe3PbJ7iCscGCimPBYx97OsFAOSwCYOiZlDzeOtRX/Mi4ysgV2gfKubZlJWh1k5
         U9Zt4ShZvbQag4+iFTyAoiQ0phFdxyCHa4qGATa8faYN5BOK+TzYh+tGudH/gvw55xwv
         ihg5ilnZZ7yaAxPGUtvisLtQ4XM2SPhb6/m5kVJP2HbRUfLK97jiJ3gbf1qas23lTXJ/
         rDlwMki45LyK3/Iw9HShKNTdlaIie+AEAxij+r/RTVfCgX4HIkkjWPTZl7A0fTacX6WI
         Mznw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3idQ6FWbodRlxmV+jRQEDoWixsdvqe+5lx/NTVf60HE4vtaiAC68E9Hj+0HjrgQylKDvA8IRdWzEk@vger.kernel.org
X-Gm-Message-State: AOJu0YyBm/O2Nh4DTVSEapv4xsEZP4wj6s0U2NVVJa44ShDE78/wE3/5
	/lupx4I5Izm9WhvjJrQlThabjesUpH+5urGXW3NRB0cSA/5csOmg0Rjcazo5F6l7HzQ=
X-Gm-Gg: AR+sD13QeQFkAQBuXT17F0872Fy/x1+YDx/yWpa2Ia/s2vE4wGq33Aw/md47EhMdsaS
	elZ3F1Wh3ktgSSXW7CMcUEu0K2i50qqxSjo9zNd7LfJ+KqA3gM/62t72kY9P26KmUV/FwdFsObn
	83YuFwueMv0kglVs1yxa+GFtjyzVgopWqYjo9mh46GEWA+ZSDlD3eArYqKOOxxQkfc5t0A87hi+
	vrKlHndmQtbI44BmUYbVkD11huznc19ihs0Uc/szAN3+JEW6LYZnxX5BjLcasWR95wSiJFaqJid
	DOyg25dacnKSmPLyA16JTq+O8EmO18ZZ1MchSv0hgTOCRu25VPbDheExRezQCEyBEV+No3/kH+8
	a035D4IIzoRaJ9hWEjBUOl10Tacp5pFWVG9OojyLsTfflwOnPwxIaYJRAsc0kR+PIjz5yNLR7Rm
	OP+shJNi7twkhibw==
X-Received: by 2002:a17:907:c0b:b0:c16:8931:245c with SMTP id a640c23a62f3a-c16b4756003mr1081440366b.21.1784713392626;
        Wed, 22 Jul 2026 02:43:12 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebbaf5sm77858966b.44.2026.07.22.02.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 02:43:12 -0700 (PDT)
Message-ID: <95d6ed14-d2c4-4b3c-8320-9307b5ad9d6b@linaro.org>
Date: Wed, 22 Jul 2026 10:43:10 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/8] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-4-c0b1c1167c5d@oss.qualcomm.com>
 <ZjDt97YCI6QX2gXf-F4lYaIj4po25RZtKf27ElBUOzGcXoPUf6mR9uSVb16GcrHYpJdCJg5Ee0IX6oJvQx1gFg==@protonmail.internalid>
 <2512aab8-fbde-4b95-8619-6c32d60ab500@oss.qualcomm.com>
 <f5b9bf18-1bb9-48fd-8168-b5b82cac08db@kernel.org>
 <d91877e0-3b41-45c8-a9a6-6ef8456c3c13@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <d91877e0-3b41-45c8-a9a6-6ef8456c3c13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/07/2026 10:11, Hangxiang Ma wrote:
> On 7/22/2026 4:07 PM, Bryan O'Donoghue wrote:
>> On 22/07/2026 03:24, Hangxiang Ma wrote:
>>> Hi Bryan, could you try to add this change into your PHY driver? This
>>> macro format has existed in old arch. We once have such discussion on v5
>>> thread.
>>>
>>> https://lore.kernel.org/all/bc6abd24- 
>>> d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com/
>>
>> I'd be obliged if you could generate a patch I can include and mark 
>> you as Co-Developed-by !?
>>
>> ---
>> bod
> 
> Sure. I think it makes sense to pick up this patch from the series 
> directly now, especially since I need to post another revision anyway. I 
> don’t have any concerns with that. If you have better way to handle 
> this, please share your thought. Thanks a lot.
> 
> Best regards,
> Hangxiang

I'm asking you to do all the work :)

i.e. test the integration

---
bod
