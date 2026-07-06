Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93460397321
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348518; cv=none; b=DK6o2+Yo2XOeWjc1RzK7ZcVNlPTreQMOTDm74rLnYTPgZGXbS7YH8xYChwFcLLziugO9/VENxHngbs7L130OvKBsqmiBAmulto6URAMSUUtjustKPomUxqFI0HvYmp9fHkCQ5GKjHZpP64sV9X2J8kBH5QII7/bVHqxFdAS+7uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348518; c=relaxed/simple;
	bh=qbcykGapVHfJqKgmk81AzQE5m3FAmFj5hgBqq4G2K80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ic5fnuTdzEWqjxfPnNM01vFhdEQxewGlEEejZ5h72Z7OkmNC7nL3uUPQGKavMU1T06esQDhSKMyH204b9XyZey0gKTvNMBufc9JiQSfy0te4M7lCwXrCF4RcRcy1g/23XODGjbpbvunIpq9JTKJiuCsJ8ltqT7Kh5mcM8RwDIP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BMgJFb73; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BMgJFb73"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso274152e87.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783348515; x=1783953315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4NvKO6c1aWnO7A3eGSV7QhwSsdTS9m/BEA8j1DxA8pU=;
        b=BMgJFb73KuX+uJomEoYRx3iLRbw4WlxBxrRGOWglEJuA6fP45IHv5VjKFT455Grvky
         rRY3imrwdYW0UfR/Zpu/kTLx6VXsHZ654QgxFAoMoBQ1glWOFneQ1UgjtT/5r15b/PxT
         pfOiiGbVaTjs/wZZvZaxOP+/eobY9RZ2OMB/boyRJQ8zXMGaaprWZMJd2gUExA8BM9FK
         O8Xl/EKQbhTtiFkALC0q6ocLTpdwqREw+xYP3ufkASX1/OKFbFOjmWHJkxxHp3arXohS
         GcRAnq3k9HBYLpEb1viDb7v1uU3cc6y1vAhxJxIxUcM6xHsmTUxargiN8ogPSZ9HFbzp
         o90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348515; x=1783953315;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NvKO6c1aWnO7A3eGSV7QhwSsdTS9m/BEA8j1DxA8pU=;
        b=J02krOB5JaV9ZIMve14Yqebkbg6pZeffOnWGgqu+HwxNc8+S8/3KU0yGXI8QVxayQh
         W0JgLWKtl8wHLgs4+QNHAxe7cjUs6ORHX0XjeglS8ItsW68pJa75kd2Q28XpNnn908qg
         8oDOJiqqOi8a/CY7lKhpx2s65ewb1/XImzb+DABAPWyfyd0YNcR07YJTAPfcptALfKIx
         Ofu8gmwO9BWmeWovL6isEzanCQf+PvA3JjRz6haScxH0JsA+i8vljG4v07OAu1BDtoxS
         T0Ut3TsPWgma0o+8MIu2KSq9Fg7lkroR1rueY9/X2cFHHwScGCT2u665vz5VNbRRcPDH
         ezYg==
X-Forwarded-Encrypted: i=1; AHgh+RpT5xEimPCRPudUeARKjCekNJbDIhv9mXRqcrWcOGzJYLVSffljFdLp/YnTWfetUw2zQqRJfoVpO9BD@vger.kernel.org
X-Gm-Message-State: AOJu0YwKKy187yS7JdIMSi+Ohwev+1mZ1TQwKDW627bcRg0RwrATuYMU
	IWVdtjysLoA+TCXqPFSMc6MWcaatXBo/ozRDMkkzq2f9XgsFWt1n0mVvDfgoKC2A/sI=
X-Gm-Gg: AfdE7cm7dlo2k3cXM7otE9L0fQDu8KZJf98nhhXUELRErRATC3s9qIiD+0Ero2EBL1n
	yY7uArhw/6tvDHrFhJZGXRr9wIb3yWfNZpDiARcRrCnoKZ+oFRBaE6AQqyERVsPQ/e16OQa6neI
	NsHtf4zGVp32RUNR0GvRX91OpTzcE5D479VyD7a+AhLoTcwj+LunFcI4fSEXEVWnwbhn1PV01ab
	uXfyf9nPddy0HlVlFyVsN5+XmJOFPDa5ZH6f34vYeO3d6qAIz357ccjNkpGUjZisaPDtU3QIFz5
	cr4ZxclFxTGaHLFcvo6m1/TIF/4kRz2h3QzCg9xROJLJfNgFMBlyCUSP+hLSXdpXE1BWwQ77C64
	ABGBB8SrXO4Z6XkeU2MFoJLAhuZ6MpgeKSl1lMZdwXCVGTu6vKARmPRWQswm/rQYSM3NUtmI1qY
	VYUm4j+y9aQghgL58aVomsfKLTVhe+WzGOnM4zDgvozxyYSPPZI8JSAP7r4z6tI/mivA8=
X-Received: by 2002:a05:6512:8348:b0:5ae:ba8f:ad39 with SMTP id 2adb3069b0e04-5aed454f924mr837407e87.4.1783348514716;
        Mon, 06 Jul 2026 07:35:14 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bffcasm2971872e87.61.2026.07.06.07.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:35:14 -0700 (PDT)
Message-ID: <3b0f7a36-05d7-417f-8efe-d6ba06488406@linaro.org>
Date: Mon, 6 Jul 2026 17:35:13 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 17:12, Bryan O'Donoghue wrote:
> On 06/07/2026 14:57, Vladimir Zapolskiy wrote:
>>> This debate is going nowhere. Check the downstream you don't need the
>>> docs titan_top_gdsc is provided by CAMCC.
>>>
>>
>> There is no debate, since my arguments are not debated so far... Why?
> 
> An odd claim, since this is the fourth ? level of email reply.
> 
>> And at the same time you didn't provide any support to have N identical
>> spread hardware property descriptions instead of the single one.
>>
>> What is a good enough reason to prefer complexity over simplicity?
> 
> I'm not sure I parse your here. The core fact is there is no "thing" in
> the CAMSS block that can be modelled as a provider to JPEG in lieu of
> TITAN_TOP_GDSC.

That's fine, I have never said the opposite.

> That GDSC is provided by CAMCC not by any other silicon block. So

That's fine.

> omitting power-domains for individual nodes is incorrect. Best practice
> and in fact the _only_ practice that can work is to list power-domains,

Let's step back and discuss hardware description of CAMSS IPs, so far
there is no point to jump to the practice.

> interconnects in the individual nodes themselves as - I've pointed out
> multiple times now - those blocks have to ramp clocks and scale voltages
> dependent on their particular use cases.
> 

Right, you've pointed it a few times, no surprise a straw man fallacy
argument resembles as is, because it does not address or debate the
initial point of concern [1], when the absolutely excessive complexity
is proposed to be implemented for "CAMSS power island" and its IPs.

[1] https://lore.kernel.org/linux-media/e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org

-- 
Best wishes,
Vladimir
