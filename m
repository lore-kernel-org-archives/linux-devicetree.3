Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2A540862F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591487; cv=none; b=hF5NXlRCqh+i+cTRMj38OU6oImzANyAfrU2eNEGx7eW6Rf7HsX89p0aUt9RyUva2Ij5c3Y59rYgdELZMKAhPictmBwyn/D70ppFHuR3ls3KywFpXot0FWenNF75znfhNP722gaiclmHzripY05xi7qXCTrASOvBv9lEynLHV7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591487; c=relaxed/simple;
	bh=jnRthcRh18ECwG4Qubk9hDmz59sP/LjpoR0YrTy21w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTx+7t4qTFwvILPZAGjrHk5ERotjKXeJ+pfC2TCZQee2z0Aho9KLCtEsRinxAwm+gbaamv0KPGqGvYxHWcYUjS0B1k72MS4p9CfSPV3oqUR9t9NLQjOEcIrtOI+uO0pTLYGjbtSEOut/d0m3D02wqxOvCCNJa9z8b+KBvynPiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/BOI4ro; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/BOI4ro"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15b75c9e48so232682966b.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783591484; x=1784196284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVm4IvduA/DyKHoGxNy4y6/zPAWfmeUpt6Sdfg7MdY4=;
        b=u/BOI4roAJCkcmxvCbpH6tTU4zGCxVYdUknBr9dXtno+1HA6Fn//ya3alj9d14RrI/
         QuF1eSS7v0ZoROcpofhzj/ixiXLSwhgBI1YQyTjR8nIpUwYb7xrg/Pd7viSM/aaPkLZH
         qIDNR0TN3kgeFo7NUA17VXmSGqPvLH17KPH/yq7A+awuEAxq+EGCrISyCCj1N7bwTPeh
         vFf662lyA/Gdc6s910ZU2f+4lNrgHOO9S6iF6fViXMl/b8h6uR+rnuPg7r+hCOiP5XJK
         1IaYkG28xwNiH4G4KJxVTJiErF8uRMoTimgAaz3WrywdVbdheXnyazQw40yk2Ej+mEUe
         wShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591484; x=1784196284;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVm4IvduA/DyKHoGxNy4y6/zPAWfmeUpt6Sdfg7MdY4=;
        b=E5ZGYPR7R32MX9/dISGaIAc3OkvfH1OZxNn+uTNYKs5t4iqbZRxAqdUXX3ghY7LhdW
         9Lm2+5tZl87SyRW/NeXMNVdEOVg02U5j7n8caxbL7I3FhiCYipsDpEs4n2MOC7KZvXv5
         CWx5mNJuzRn8vnrX+bvGYxFehJXgrcbkhqlIMuSa4h+0dbTdGupYBjNjgvbZTpVkc4Ii
         uSCHg8+SKS1kRJgN10wcLpw+4efGDHqAtmUPTfi24+NeEc5EekqpITH7alCaZN36JRdf
         KmljZE7z5KiO7xaOfYkwP5lwTm7zJMWfuw2vuwUtD2YR8RjhMDq9BEe0E6OyopOIljRI
         3cAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMLsgv10ZIalsbhIzJIYsZbga2OBpXwIjWdorTQVqdY/f0LM7DY7D/DrS5LZ3Zsa1g7wcVYP2WsVkr@vger.kernel.org
X-Gm-Message-State: AOJu0YxWKkRvhF+nLiRdtmrpy+/zidR9dxJgCaK+zNekYf9eeOF4dFtx
	y19rcqdXMvGSwG8qu/0FmkTF10Ct9MyAYA+2xZWsFsMU/wXS4QNBLNZW9j6aDb8Lzes=
X-Gm-Gg: AfdE7cmvqnlNuMjm1CiEbv8nhhLb61oHCxejF1ofBGMpO0UoMQO/reB485/7Ov6ldL3
	h852V6/hwEkBhmUVdlyTm4gzunLKNY9QLCDA4J9R3d8Abf/0XT//TzxLaIer7QPJet5cWP0QWih
	H4WbY4P3BAo4erNMyHPYaFcUjg7e0sL+PZ3vxho7Cp3mIbvJs5PdUe83cnrPRCvwYH7zj5XGzFF
	ZTEInfNQvAYRNQfrTW7HispIxoSxXu8JSyjX5CrpjC1o/Lhp/nksFDWn//EnW/dI/PQcArLqYnQ
	oGMjigg+OH8DF8T9Xbs8OZcFcKdpfx8U5TAG+ZbS10dTei0G/cBgfEmglsmLBtN8zF2J8P8nd7I
	FSVMj/Y1FjN0K1cE3+dn92Kg1JFthv0AGv/R3PCOOMJUicHGfk3D0xpSCGioxih7eKV1wD0/dAT
	DqA+jSLLVFKNF8xfSNmfj6hmPg
X-Received: by 2002:a17:907:960f:b0:c12:8c27:e2f6 with SMTP id a640c23a62f3a-c15cdec5297mr323277666b.13.1783591484174;
        Thu, 09 Jul 2026 03:04:44 -0700 (PDT)
Received: from [192.168.0.101] ([93.107.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15edfcdb9dsm46291766b.61.2026.07.09.03.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:04:43 -0700 (PDT)
Message-ID: <2ea78bd6-5abd-4ba8-8f8e-24057a587cdc@linaro.org>
Date: Thu, 9 Jul 2026 11:04:40 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org, vladimir.zapolskiy@linaro.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
 <CAFEp6-0rwuRzXM0fu0uyrvSvgG0ttpygOULkKfTT7aw8m_HUog@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-0rwuRzXM0fu0uyrvSvgG0ttpygOULkKfTT7aw8m_HUog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/07/2026 08:45, Loic Poulain wrote:
> On Thu, Jul 9, 2026 at 12:30 AM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 06/07/2026 08:11, Atanas Filipov wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> Use devm_of_platform_populate() so that child nodes declared under the
>>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>>> platform devices. This is required now that CAMSS is modelled as a
>>> simple-bus and ISP blocks such as OPE are described as child nodes.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Looking at my commit logs I see this isn't my commit message ..
>>
>> Anyway.
>>
>>> ---
>>>    drivers/media/platform/qcom/camss/camss.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>>> index 2123f6388e3d..95e655a8b6aa 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -16,6 +16,7 @@
>>>    #include <linux/of.h>
>>>    #include <linux/of_device.h>
>>>    #include <linux/of_graph.h>
>>> +#include <linux/of_platform.h>
>>>    #include <linux/pm_runtime.h>
>>>    #include <linux/pm_domain.h>
>>>    #include <linux/slab.h>
>>> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>>>        if (!camss)
>>>                return -ENOMEM;
>>>
>>> +     devm_of_platform_populate(dev);
>>> +
>>>        camss->res = of_device_get_match_data(dev);
>>>
>>>        atomic_set(&camss->ref_count, 0);
>>
>> Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do
>> the same with the CSIPHY and Loic the OPE.
>>
>> Modelling for subnodes is nice if you have the idea the camera block
>> should be a bus.
>>
>> But for what reason ? As you pointed out it should be possible to both
>> compile and run JPEG without the compat=camss node on sm8250.
>>
>> Making the camera block a bus is a nice idea for "reasons" as this
>> thread has shown, its a problem to implement with an upside we struggle
>> to define.
>>
>> When the facts change, I change my mind.
>>
>> You were right to argue to have this as a peer node. Lets do that.
> 
> Having a camera-subsystem bus/parent still makes sense, especially
> when dealing with shared resources. Whether that should be the
> existing camss node is indeed the question. Today, camss effectively
> describes only the VFE (including the CSID) and CSIPHY, so using it as
> the subsystem parent would introduce incorrect layering unless the
> node is significantly reworked/broken. So yes, for now, keeping the
> components as peers appears to be the simpler and more scalable
> approach.
> 
> Regards,
> Loic

I would _like_ a bus but the question is how do you mutate the existing 
IFE only node to a bus - without a big bang integration ?

There doesn't seem to be support with colleagues to gradually transition 
so we're best off making individual nodes - why BTW isn't wrong and has 
upsides - like clear separation of JPEG and IFE in this example.

---
bod
