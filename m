Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612663DAC13
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535164; cv=none; b=aIHcsJ26baukR8vRjznH+0fdR425k0GKPXGqjdtyc/KNDbeXUFEIPHWl48O60QsrFz1T5Qa09EqzM0b2mAl2bOkIEokA6sg88eJh94yrTAqS1mYo92JDE+PllkXwxXLBctnNh/l10WYlRofmANXcA9Tqs1/A9PKPIyaIPB9zaJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535164; c=relaxed/simple;
	bh=+e4H2njOhdGoAJi63SmPW8H1YZ7+lUPpHguznv3trDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1+tyGCNcL3WDUJuqIyM39aZDlPjnFBHEtP3wNCMmU7mNZcUwrHBEB7FRruCidC0HjZ9d3zZpvry8ZwrH3A6oku1rGefzZx2AIKd0ntbbSZL678jahhv9555LEfgc09pmsPQ+9tOgb5xhujAwjvXqkohLkVoLvbUf0pwJHJIQYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyKnmoP8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyKnmoP8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so5426287a12.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791535159; x=1792139959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+vqQSz3CWMehrnqKQx0wIXwhLvGj+tDDI6FZmqwFVU=;
        b=MyKnmoP8osjJjnTq5n1sqFyk/h8RL2ekclvLPOpQ4xihAKJLebXAsadFS2WfGs/8Cu
         hdPZYyVsomXvfJb0xwo+UwdWQIpzl3jNcULeN61QzsamL93HwR8F+Paat0MF6NywGS2a
         Hi7YCO5+QdKQeYXDoWRwUiimzM842y2Ofseyov5y4sF0fEMs+41xlhi6OgQ4vTgqacLO
         15t7bH/+fYAGxP5ZNDS+QaY5A8tGxZeDJfQAdJ+aX79xf+6LKA2D9SQcRGNh/3QjUZ6K
         9RgnoZ95YTHfQi0QA6x14pAiHsbqmdf44Hvq4ggT6+JK04N2084RmaXOEmRefIc5w22S
         xG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535159; x=1792139959;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+vqQSz3CWMehrnqKQx0wIXwhLvGj+tDDI6FZmqwFVU=;
        b=LcI0N3IRuSBrojaQlSO3yO8e95gWPxFIBzMTRrEPKfpg9Do2d04JDWSZ0suSFzHSx3
         uisLV4H0Yh06ox2ycIEUa8qRal2empT9jPugMl4TWrMHwEFMyXFK/Ht7K4/a+XAQxPSb
         QvqdIHzrcWSoBiv6COsBL7w5dxvpDFR5tSSaS/MRlwop5+Q1/6mmD1oFtKl2s3Ya4bOA
         DYAZIXsiXrUnwGd0C+8rp7nTU9KOfwev3pgMFQS94Hz1DVQS2ElmkQ8Fin4EweNxjPA6
         sG+qJiwzwaqWTZnyUyErvfx7DRa6nScFqvfWcl0LfJfS2ujSikpx+IzBozQvssvCo++k
         kQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvByI/w7R0fDRUt/Q+p7ihub6wle2p65PY9WznlEm+NAt/GbaxXiXupAcyjkzq+/IXsEvDD/2d5L1Lg/C@vger.kernel.org
X-Gm-Message-State: AFq9FYLDCyKLpw6v3F83L6h/0xb4DeiktzqQSkg6ww5YVU5K5LHEazHc
	WZwlU8mJ7sA05skUSK1edKS9/PhIbACmcFkV+hiFl6kdQ29IQr1v3zYzpz9kw0MIn/s=
X-Gm-Gg: AYBFou0blWmKBdWxL5iLrCJhnJ5o4jW8/CrXX81TfDX4dTV1cccSKzEg12Qt/GfMifV
	ne6h8+16n6TsZG6vA4wGomdx72dTX9qCn2JjkcXLIeViS9L/BZZkyxK1DV2yG3K66j1bc065KyB
	TCoA1XrLkdv4aeypG5zQ2EjPgk9ZSCWbal6fAPZ8PJZEQSLE6zHRj8flsXlV1Tm5FGDqEEkRfFv
	k/KZn/o2trC5fC0k/BH/GaHGshXF20FKsXAZpw9XwVv4rbYfl0crrE0RK5Doamj+esWxM6O4TG9
	J7kwrCuQm1AurAIiR5cmcD4mF+EKIMrmE7OVFfhekB6ahK+CvMhhgIBOGPqfFUOX3omMCTCCgJW
	qVlufW+bFPIhBh86SNpOoIGjlVlt/yFKQOhk0GeK7gBMqH6pF8thO/e5GUfxPBBHf6KWcMY+hU0
	EAVWiVMyAt+oYsmPtzycEJx44AkCTUwT8GKXj39dIO7BqdlQBbvvJYnNGDCvB2rnPtm8Qn2hxxJ
	0V/aK0Osg==
X-Received: by 2002:a17:907:3d52:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c31aa0e93bdmr117241666b.49.1791535159415;
        Fri, 09 Oct 2026 01:39:19 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.78.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae32sm64239766b.28.2026.10.09.01.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:39:18 -0700 (PDT)
Message-ID: <8a2ff836-57ce-4df6-aaae-0db3f36e8b58@linaro.org>
Date: Fri, 9 Oct 2026 09:39:17 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 08/12] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, bod@kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-8-b2c583ef50e0@oss.qualcomm.com>
 <179149982796.2596899.756044515233442982.b4-reply@b4>
 <7452d85d-83a8-493c-8d74-5020ab72982d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <7452d85d-83a8-493c-8d74-5020ab72982d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/10/2026 03:59, Hangxiang Ma wrote:
>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>>> media/platform/qcom/camss/Makefile
>>> index 218ba3a95939..42a14e8fe1b7 100644
>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>> @@ -26,6 +26,7 @@ qcom-camss-objs += \
>>>           camss-vfe-340.o \
>>>           camss-vfe-480.o \
>>>           camss-vfe-680.o \
>>> +        camss-vfe-1080.o \
>>
>> Can't say I'm 1000000% clear on when reg_update() is supposed to 
>> happen in
>> the flow of the logic you have here.
>>
>> I'm a bit suspicious of adding a new flag which skips the update but
>> assumes some other bit of code executes later and does that update.
>>
>> Can you explain this some more please.
>>
> 
> Thanks for the review. These points were discussed in an earlier 
> revision, but I should have explained them directly in this version.
> 
> Vijay once clarified that the configuration principle became more strict 
> since Kaanapali. We can back to <https://lore.kernel.org/all/662a21a3- 
> de8b-406f-a15d-b8a572aa79ab@oss.qualcomm.com/> for more details.
> 
> In short, the hardware guidance asks to issue the REG_UPDATE after all 
> of the CSID configuration registers are written. Kaanapali seems to have 
> very strict dependency in the hardware about this sequence and with the 
> original sequence, no RUP DONE or BUF DONE events are received at all. 
> While other chipsets can work normally.

But how/where are we saying that happens ?

---
bod
