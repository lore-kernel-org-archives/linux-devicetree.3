Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706374;
	b=FfIAV2XktZXXUKXGWz5muKmKbgczk6eTkGsgl360uQmg0fS3zO2uZEPCMQR1bdJnoOxa
	 NmO9luNYihcnFv0jCoM1n+qghBdw4xX45UodtKUk5+Rta1K+2JWcZDitThNB+1yaJ+RvW
	 tTQAAwSW1kD27Fl24nX8wDi6RStsZNH7paLTmGuolgv8LFyEM2Q+5qz/9wn0OAi4+h7ud
	 NNhdRv4CuKSfveE2nrWJkKbUEBw+JkgY7pWz9KEmXGlckN1IST3lQG6P7iy4LjigMZ9Zv
	 1trW1UBfwHFR5eGkD4pMvRgXHbQSUF37KV+gu9qS1R1iWj63est1ZoPHnTe+hkYRcSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
	b=ll9No7K4jVj8szpjw7g6jXyxb/E/a19UzH/ZY7DlWJVnt9/Ncxzi4aTGPeCsnMy9EO3s
	 KZeYnpUCOS2EGhc+g0BQF9Bp+wgb044J6teQJ9E/ZngBy/TjXzo6eVqaxYiVhgVqwaxcf
	 B7OI/J2imagbCU7zVAg4LmsYTU+0wbbgZQMTTsRjL1BIAvWyhCOopfDY9TnhFvv4wAzQZ
	 VuGXxo8TpM/FuBx2bPqEfC9+tSJG14LCC7+4va3qrsOK+1s5v7YDf405fZZaimw9ooaNi
	 4btYQT19pR+Ckwom/N9knSCG2amVzzS06/LogwU3m2zz8YBztuSHfqup9XHmwskpeNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbbYeYW;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC44606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC44606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbbYeYW
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0213202fdso37756445ad.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706374; x=1796311174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
        b=CrbbYeYW7YZVgHercljukVu0b6JUMTJydB1LSJYAif4Z0fixzzCK03EWR/r37zd3Mr
         D0LO+Zga2qR1DP/qDPD4yyFYP0lzvabXVzmET6fDXDCC/If+2BgSHj5nIlaLFMjDy0iJ
         Mt32b2xqkgR9CnaHnBWEy4WnzxApp3Hy5lw0ry5Eg9UYILoAXBJIgOiy1Ts5ZJ1GzEKL
         T2RLvAvLFCJ2Q6q04CLlsDeLU0wfyhGEiG7yGcOqpDeQhGy2/AKLje+obkISeSfmV0WS
         +j7R+lIvzq3u/TijnwL/K8zWogjL4jmO9BZuzlCyHlWjsc/IEh5RjqW4XtZgZLytyLp1
         H5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706374; x=1796311174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
        b=Q0Os2pTi2AKa3WNXfvo2823etdXBL4S1MtV7ghZ9M/E7JdlqS/w/RYGiKent5fe3aB
         RTAi1h9x+zvjAECzaGRASbb2T7Qag3vpewCKVk7eomjxEpD8VapPe/JxnY1MLXsX9vEh
         Ou+2uSMJyAgzpVqNe5pIIIpUl2Wzo28LGGvrlCkr3VmNi2yPj03mxYB5F3BNAG6GuEZ2
         O7rm7UFGUMH47ka0d9I/yzquqb6awLDaBPQLK+aENKgwly9mCfoaO1c4bwY/k8+BGz80
         0KfYriq5b0OpcFgrWykViVd5SHtya59bzAmkQNBdO7PoLbv1scB55LIYd6OmNjKijRnc
         Tdzg==
X-Forwarded-Encrypted: i=1; AL+hErHwTuqYM13b87DVlqFca3ruGUzyQBydc6IfU3nLaZ1e4bk9z5KO6I4vyXzod4KHntrslq0twlxYlITV@vger.kernel.org
X-Gm-Message-State: APuU4Z/5DL5g1EcIiQIGCKc+EDcEM8SfYMwC/G2/uz2uLFFFAwxpCYYd
	QipVK+nF5tZJ5D+sWCff/Jm2BTwDB1N0ln7BTeQd6i7olvzolj3g8IJMwBd5UU3k
X-Gm-Gg: AZFdTZcLf/UTtm1/SRq/V4Mf0DcKne5tYz/mZIpiHRu+E2kSbpe7tiIz645Q0HbPALf
	POfu7UBFeEpS0+e9v83XeD/rw0fbbvwg/Phd7tWdg7GcCZNYQv10Ak5iuI8cC3q9nIlHVSl5M/V
	bCnpQ4q8llJeI1zLGveemnO9kl5ME71cX6DhYsH3GmRYII+zJMafndheVMGwKd0NmdLWw92k+Hj
	pw3eVI6dd3xs8m/DRphI4l0ZqvebZ4oICVCVbHHhborIM2eOnD7GZOUNAGEZkUfgYeM3lOAJY4y
	8mXZNJBDdY55RUhCgUeo5xl78Kih0W4o9rJdneWUQrymKm72sfRaQbRZiMiXIiiW5rCiiysB2pM
	tH7b18dZjn9w/C+L3qDupddIoT+vGbDIN9p68gh4NRolvjbDStJl08wtqWbl2c9siQAD/V6uvil
	UH/iBDj4VgBjYWrwdaH2TznDEUUhuiIVagvzmznhS4sBX3Nx1NJkbDaFuLK56U/XZIbKCxCLYiZ
	mtdvcBeRsB+MkSogVaTVRkZhBS51qY/LUPveZmohyY1AskVAHQ/7taRTzJLS5ExRImzQWjqA8s0
	h5q7U6cQ/EJmjNSX1MEExCkf61fjxGZ3nbeazYCKOpZhPWnxv/T9Mf3PJq+ieft2+Ghv6DtYpPv
	06lbxeWldq/bEhL3PN+Gk6CtYzTqKg4eFIqSP/BOtvL81OFgNeHB4y6ytPtDpS7sD5s9L0GA7mK
	sUiojl+wXf8UeZOb9tAE35CR8=
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr214437245ad.54.1795706373704;
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Received: from ?IPV6:2402:a00:163:2ce9:4e7:3fe7:3a21:f3c0? ([2402:a00:163:2ce9:4e7:3fe7:3a21:f3c0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm11015263a12.19.2026.11.26.07.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Message-ID: <2fbeab27-f57c-40f6-8f7d-671cd8a2604a@gmail.com>
Date: Thu, 26 Nov 2026 20:49:26 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add
 ext_mclk1_c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
 <20261115174237.48908-2-surajsonawane0215@gmail.com>
 <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
 <9997e6c6-2e5e-4314-88b2-a8547ab035f2@gmail.com>
 <3682be02-3e2a-4e01-8066-15b51215854a@kernel.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <3682be02-3e2a-4e01-8066-15b51215854a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/11/26 22:09, Krzysztof Kozlowski wrote:
> On 22/11/2026 18:22, Suraj Sonawane wrote:
>>
>>
>> On 16/11/26 18:10, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
>>>> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
>>>> function ext_mclk1_c, matching SC8280XP, but the binding enum does
>>>
>>> I do not see it in the driver, so are you sure you used correct reason
>>> for the patch? Mentioning driver means you document existing ABI being
>>> used.
>> You are correct, thank you. In mainline, gpio5 in
>> drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c is currently:
>>
>>     LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
>>
>> so ext_mclk1_c is not implemented for SC7280 yet. I described it
>> wrongly as existing ABI.
> 
> Did you just paste LLM output?
> 
> Best regards,
> Krzysztof

Hi, the wording is mine, but I refined it with an LLM to make it more clear.

Thanks,
Suraj

