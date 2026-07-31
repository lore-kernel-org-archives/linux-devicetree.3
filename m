Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25834575A
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480088; cv=none; b=RCAOFShWERhngGEKvTpaLy27s2/qFsoeb7UUf9UdzqvYJ+Y0BhdggggrVxYTJcMHDVz3JVG205EbzxRfYsWoKaDvx4mokmkXSUEAxnTgZkx2j+bK5P1WAnErjK3UGPMK7b3Hpfxk3qlnrGS7qLpA4YVbWVvzvyXt+Dc07KgB2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480088; c=relaxed/simple;
	bh=Z8Wzwu/qDjVLAbj5sVnInzz8cWKjNC5ww219jZP0Gec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwZDn3ELIMheD8zndbY7pKEZKVR3we1aUZwoh+z5QdelI2Xvo/TeVioLzytXrTNc4g/VMt+PVh0/eC0MzhTeFKiRox6EbJcPxCoUn0soiX2jmZkYVBw3TvEJfWWLjDCQMMKqc6oG4TZk0PJlXRCzMt3Rys1rd9zawqHrtxLR684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5aWuhdr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5aWuhdr"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso74604e87.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785480085; x=1786084885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h7FkhS32NSyO09VeQz2XUFxWjFmOBtNNLtYtgPqX4Ro=;
        b=Q5aWuhdrqTzMeBY37qduGDlCJ0jRMwAIgfPZFPZ3qKFiYQyUJhsRdeq2jGQ9AgYAKs
         /w63K4Gq6B8kmC0F6Jf2OOI2hLBZmUb76gXJsvTjJSIxsid6Uwid/e0DLWwqmSw2i3fx
         +ix2IodMqlk8srXKsF1/HUKlKRdMaBtd9ah8spK731SIzy59/2G0R50X9mlgXzRwP0oB
         QrwvsFaLhPUHRdaq2CzQHWxj2W+yxCe0lLfk1D1tK8MAKzhJBl02iToLDHejbUpBuJin
         QqwRgjktqAEUdQQ25CFPPzVxyF+OwReYGr/07laedOLC4EMtKi8cS/bOvIdTyT5gNhQJ
         CEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480085; x=1786084885;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7FkhS32NSyO09VeQz2XUFxWjFmOBtNNLtYtgPqX4Ro=;
        b=hxW+mUduQjXwZ90O/SPbk1xxa+vEXpA3WJxyxAR7yBMTtg1XEjhcfHsy0CBaJpvU+W
         uf3jMNiWu2Nqpv8FHJMEWEu+0H+B+oMfLxuHQZY5HUFq/BWq/sia/YdOysEBFlOxiUEj
         UNQzoJi4h6WB0BHXAAkunNP5IQ2SB8C0XmmZARHU4cGb080CObKFOYl49+4qmyYJfRfv
         uQ8e8nJlUbeRl5VpEXLlVxarrKFCfh83AN5y0a+AB006YJFig3CDwrELSyRWAgEKFESy
         jMQDyeYxj0znBdtR3NPY07M3qt9q04BaccwKhPalvcDl9wSPr/xS1RfYS87vI355m67s
         grCA==
X-Forwarded-Encrypted: i=1; AHgh+RqhIe/4c3R/iLw/ZdjiL7DDhot7hX+r7dIDlVYTG2it/ai/PT4l9omwEFB1L9vIAvyu0ko3rrE+7bMC@vger.kernel.org
X-Gm-Message-State: AOJu0YzT1zEbCOBhPqCb3L4DdLYX8V7lt6veH6NqIeevHL9eivPV8XI/
	tUHrolkdM3YnCRyavp1Lj6BVW0PC43uFb/YiflejOnbAb+38WxySJ/bwSEwoX9NCDJ0wc60rjX4
	188bv/8Cglg==
X-Gm-Gg: AR+sD10YX5Pt4C8N9jFMzgiuRyq79RhDIks1AtrD0PN/lPMlpok+du9mRJKxhN40Oi7
	vRJ4u5vJoVj7hTbppq5XVTipKMSBqSTjKo//nRiqy6g7e4pTiQ4ouimL3kxSgXZu9BUzok4NA+/
	YqI7LT2rn1KERD8NiI1tDKU27A8SLrbgmkwvKCupZc0xqtLiign7bDsLnFe7gwjBdHXnLBTEMxB
	OxotGY98QfpS+t3lubVeF+FCFU8GiES9zeu0AwaMcG/BipEem9g0okWkMteFVPFPWzW78tquwtI
	hxAoqDERRaWipBu/vUE8Eubzp0MfRmNXRHxs8n5Kl0dIsDjbNPTRLR4gbq39Vllm8WeDWfvlb+/
	yExUBtxtzaBvRNXs31/dWI7neSONyk/FhQ/u5TVbaU3qhwimBAeNLgIRUPm/MBdx9iNKCcJon2+
	/MFgydMgOZ/IQJXe9N+zq4u4MHWbkRwtKE1A8g9IBY9fpD7wUsaDs56SsL+zwANjd6YEJL6KYQN
	dQZ0ACavIeNeAwhuw/CGDppfCG99flrEjc7poxxGUwK6Z4cUxdbUA==
X-Received: by 2002:a05:6512:2395:b0:5b1:5c72:2f0d with SMTP id 2adb3069b0e04-5b2e1fe7701mr220391e87.4.1785480084698;
        Thu, 30 Jul 2026 23:41:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2456506sm106050e87.68.2026.07.30.23.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:41:24 -0700 (PDT)
Message-ID: <b44872a8-dd59-4f0a-8665-c4f23a6b86bc@linaro.org>
Date: Fri, 31 Jul 2026 09:41:23 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus
 frequency
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
 <111bfc31-7f02-4875-ab58-e92bf1ccc44d@oss.qualcomm.com>
 <b690426c-94fa-43b8-a805-7413e45f2849@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <b690426c-94fa-43b8-a805-7413e45f2849@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 17:22, Hans de Goede wrote:
> Hi,
> 
> On 24-Jul-26 1:42 PM, Konrad Dybcio wrote:
>> On 7/23/26 1:48 PM, Hans de Goede wrote:
>>> 1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
>>> to 400 KHz which is a more reasonable default.
>>>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>
>>
>> I guess this is a question of what's more common among client
>> devices. I assume you have some that aren't happy with 1 MHz?
> 
> Looking at ACPI tables for many x86 devices 400 KHz is the standard,
> with some devices going down to 100 KHz. 1 MHz is pretty much
> unheard off.
> 
> Note the official I2C spec is limited to 100 KHz anything faster then
> that is an extension.
> 
> My specific reason for submitting this patch is imx219 sensors on
> Mona sometimes failing to initialize at 1MHz which is kinda to
> be expected when going for 10x the I2C specification max value.
> 

1 MHz I2C bus speed is in the v3 of the I2C specification dated 2007,
its name is Fast-mode Plus (Fm+), thus the statement above is invalid.

As it's been said on the list recently likely the problem with sensor
controls on a number of platforms is due to invalid setting of I2C bus
speeds, e.g. out-of-spec 512 KHz I2C bus speed instead of wanted 1 MHz,
or 204.8 KHz I2C bus speed instead of 400 KHz, which is done by this
applied change.

The list of affected platform .dtsi files is:
* kodiak.dtsi
* lemans.dtsi
* milos.dtsi
* monaco.dtsi
* sc8280xp.dtsi
* sdm670.dtsi
* sm8250.dtsi
* sm8450.dtsi
* sm8550.dtsi
* sm8650.dtsi
* talos.dtsi

An example of a "fix" (it's not a fix, but a simple workaround of
the flaw in the driver) for SM8650 and other platforms can be like
the one recently published:

https://lore.kernel.org/linux-arm-msm/20260729112719.1151700-1-vladimir.zapolskiy@linaro.org

-- 
Best wishes,
Vladimir
