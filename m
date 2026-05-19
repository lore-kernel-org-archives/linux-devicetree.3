Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4587E4C6F18
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185762; cv=none; b=lVkY6nOaS6D9oozj/wMrMqEeC4DwEnXvpfjKR2mLw0mSKUiQ/vVCOQd4mgDNpfxo7VBcblTQ8LksChyGQaEVCTaFGB8d6KNoVW2CJiwH+dX1of/5aFjeVq4a3sPpnqtOHRp+8PYSlAP+0RdZBXuS58sJhRke3VlfPGhwoKKJZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185762; c=relaxed/simple;
	bh=f8ALR0y3q5fP6vwtXgP9hBGv5oAQokxYrhtup0bsRmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o8NUKf5W1WQBkP/Gijp6gwl8O/3P8BH6JRKkY/mnEOB+BSe3cz9dOno+oPVn+Iqs3OEFQ/wgM02AhbM6dY2NddDx/4/qrBmeNaTIceo7JWaR0hsKc2JVmqHw6KZWyyad1nq3k/MYuDP/+SKnrmdJK0KI3bf+YplE7NxPVivsdpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXmQU5YN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXmQU5YN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490229aa522so1495755e9.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779185752; x=1779790552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5UZMUsOIuR/r+RRcuKln7+BwOOWAw5VkzUXX1sCtOA=;
        b=AXmQU5YNNvOnLnq7VA31jNKiWyi5cHbCjQO1E8NGxEk2GQ4/GjhXcxyUg5kDwy29r4
         OZdwzC61iM1F7qYqhnOKbgY7mfGBtcz5KY7o4jUgw64pt6+xgUsY50KPU2HuuVcJnN6X
         /wiav/XRokBbp4CJsYiRVVcfo51BgbNw0ghEDa6foVFnAbZJ1o1JWnjRfhmF8rJ6+fSa
         ECFHJx8hvv4yEvAVgHlPj05uhv+P7EmCUb48HlQEM/9jZVPzTQZ/ID0ihhGl7HDsvAr9
         +rAZilb6/AeaKO5NOOwc102YwWRveM0itRs3wb3EEGfvzetpm5QXkOAWn4AlZbKk12G8
         9CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185752; x=1779790552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5UZMUsOIuR/r+RRcuKln7+BwOOWAw5VkzUXX1sCtOA=;
        b=VMvv1bfwbqAK2hAUSvknsBqmE1ToYtpyn1k40lzelJPVux+rPTin1d/DAgWCkPRcEO
         gkXf+TcVzctwez9N4tLfZVOFZuvvRqqE4iQfbbCkTDvGi48BcprTZNYE/8A4MXiqgOSV
         Hb7abDwKQuH+5wt2Zq41HH3XzQaX8B/w4fAO5g6lTdS79N15pQPPtqJMpDq1iLDay6XN
         8AP44+p6nwJBh75Gcc8ni3J/6m0oeFhU6bUm85c5FvL7O4AlKLPA3aX0RB0uL05kN82W
         m1+/IY1Qi2BPcn3Mq4nFxmer9N6GMuop6Js2Ca40RDVrJJhHwP6NWGfsvA0LlSo10/iy
         fnew==
X-Forwarded-Encrypted: i=1; AFNElJ9Y1RRY9PVggpRbi3EvhkLlZwfpLxyR396MuIm58xmfx4+rfzof983I3J1fxVa7TkXWCvpJgzWtFRLg@vger.kernel.org
X-Gm-Message-State: AOJu0YxhXzYahgoayzIlVUhJXsPA5J/5wrBAgCZag1bbUctMSEZDAC9j
	pW2CIpfYo3OX48unupMhHWFjpWJ9nvfMoJaufFJ+nwKofphJ5i/NP8J62jXpFID2Ffc=
X-Gm-Gg: Acq92OEKAyVwhkmM9YVr4XtCMet6wsJLBGLK/XxclUXvdMX1riKHHpVtpofwSdztOJD
	iQvahbwKfvmiEybgqVfzUoRhNL6M3kTLi51ZQAWAr6sO05h0hapgPHUHwgoC+iJmnNsjX4DIzzU
	Sm9Awc9YqcuChbwUy+TnY2C5y8+32XX5/f/skOkvDYqU2e5RSTEtz5FiuAcFJcs/FCfprdAfAmt
	S4p4DtpKNVX5xPPE6Lui/rznicMvcPvJwVxOvp3/MibFk+M4JXAUt2yYHpANI0kx4q/ygUsPo18
	9udaA3nLra7LMMpi1MhaP+AK2ULsPRH/Jcgm11TEjO4UnqotAd43j5S3+G54uRcAJcHOg32KO7a
	UmV26mPNnnqQQfUiVAQBP+WcrCv9AAWqIPwPTKox1JwQdy0hoiggM30thT/pJbtGms+DEcElJ0f
	5/O2Y0YD9O/eOJE4oxAD1x9QvGX+OGnb2suA==
X-Received: by 2002:a05:600c:34d4:b0:48f:e245:394e with SMTP id 5b1f17b1804b1-48fe631f631mr307476515e9.27.1779185752498;
        Tue, 19 May 2026 03:15:52 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm311206415e9.14.2026.05.19.03.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:15:52 -0700 (PDT)
Message-ID: <48daef97-de8d-452b-9f1d-e3306fc46ffa@linaro.org>
Date: Tue, 19 May 2026 11:15:51 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header
 includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2026 11:00, Krzysztof Kozlowski wrote:
> Unlike other units in this module, this one does not request interrupts
> or regulator supplies.  It does not use OF graph, USB role switching or
> TypeC muxing APIs.  Drop redundant header includes to speed up
> preprocessor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 3766790c1548..35320f89dad2 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -4,19 +4,14 @@
>    */
>   
>   #include <linux/err.h>
> -#include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_graph.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
> -#include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
> -#include <linux/usb/role.h>
>   #include <linux/usb/tcpm.h>
> -#include <linux/usb/typec_mux.h>
>   
>   #include <drm/bridge/aux-bridge.h>
>   

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
