Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA4C3E16A9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546397; cv=none; b=q27qBLUkx2MXO/R+r7DUowqMSWiy0drNWwAf5S6ZkH7eh9aMbOJURVUA+8nxoJGRtKD8dTqXIUZWPXYD/fhOkp+BT3mcJpfbGxb7PMiabdRWAgvbdlZER49vIcFh/GMSec9dGtM1BjqjoT+M0BBGI4MshddKRn9SffM9iFg/d/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546397; c=relaxed/simple;
	bh=NXwOCg+eFKxCNu/u5zqiZjTXNblVDIV1fQBBNSYRkhE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=THJILDnR7a0PuT7LFKJX6OCJvPNSB9aU8nd/f+mS5ZE7bZawrrHCsUFgUrgw1d61dsWkda6OMwOyqKFZy/cJoSvhNFsD6xvhFWfwxjSg8WTeG20XPudLTSymlxBqgORcs1VtClwi01K1BkloE/APk2w4SWOa+IBvMKeO1iuwGoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFgQeYeF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFgQeYeF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b1710405so7242925e9.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783546394; x=1784151194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rrOWcnkCxSDr8uiZZdnumYL6A9xsmstIl9Ie1VxD/4=;
        b=uFgQeYeFbmPZBYb1bJ3QhS0jVqOR21bi0MQnAXZEIOFUShghP23iCglmG8dYTllUnP
         SHKKWm09rf5Y5dKOZxhdDVM5KJTZEcwwS1Zf0GPbB00rz58eFoO79/L8I9kPTjUhaEXQ
         oOfDXa8kwBUUbZew0/YSuejrKFRl2K+MqMqqjw5pwGhdCCYMBCB0lDaoOiqbMGKZk/t4
         3oGKpfJI0v2CL09ulc+memKFK1MI64QE7KR5L832NIikWflehAwXZTu18HyGyjEZVbYn
         XKBXWqfFXJeoFQf+ilOCq4OK6I7z1MHY0YtiFQwZLbSVbkOgL7uwlH/3ske26uKiHn/m
         KQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783546394; x=1784151194;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rrOWcnkCxSDr8uiZZdnumYL6A9xsmstIl9Ie1VxD/4=;
        b=CAA/WRv7vDdGoDK1yA2qahkG90q9sfUv13yytNFhLk9MdaV+pXXNiGl7KXQz1h1ODV
         YKXKMwavjLn3ywnLKuYKY9oIQIpbKOxK8fU5Qr3c8xltq4uYXyjzNexaLf8/Nmo0KJ7K
         k9wSjvgRJygL2sXVe3O3DEDscMhR6RWTGkjKGbEPOPQiUj9+WYOqhBa103ax4IoJOKNk
         SiGaV1ahgSl03FZtDQsObz8AHHThg5cK8OsheNIfa1uvWYiy1LbsMPiCcq0Vd0DHCGeW
         KqT7Hlr4Z1KbKRaFbFPody9BLRpB7RbMuyPrfqVoc6HaQadvqtJgqARD9a6CTmfhwDKy
         G3uQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWzp8KpRQqPAi7mEmZ1q9y9NFPda5uj6igdMLQM/aunm3WBiw0tjG7GWJlNxALCx7z8PzyEXzWl7aF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxq1AsJnJNlxa2Y1X6AJ5//f/ZRp4eU0mHqi4sr5V7ek6Zw7JH
	3A0SNWkdDvAhrGfnPh/ysrGP5hDY5ADpyi2qJbfPSkSA0ageMqe6RzjMKx4oE0gfrkU=
X-Gm-Gg: AfdE7ck91CAknbG45xSm139+2hx0eLdv8j6a9mjjmfg8+xojX1fuyImCsLyJQTOVVdV
	x2kvmhW+XsYLPiPyVK93XIEKzc5aCty7Nyegbnu+DKkHt0O2s0ydBSp66vTJKdZS9P596BUdRi2
	LLxZXZU3gm6SweGufgWosEzdmRHumurmcaSfrJmwnbsbiRZpc0ehXUremUSuA4VKB3VKrkLMt/g
	0/CEajoZ7qA5VBo/O9b7OeeFS3M3+LrpWIOXLE/Z+9v/792PqERIhPblnyUTjA63fJytCqvhuq8
	wkKQT3EqLYrVCwNAKYCUEO4GLPBtgF5AjNigqZq3VbkynGkfnu6Zt5K0Knc2s8yjtY6tCZ8qG4W
	ir1aUOmFrXbPcl0NdoE9yzOSoPLRqIezoXoNZ83dRJt4yT/DpYXECUitEW+pdUEuBRH5hs7/t9V
	4zHp2Me9BEuC8R/3JaNZfBw6Cshts=
X-Received: by 2002:a05:600c:4455:b0:493:bb0e:2832 with SMTP id 5b1f17b1804b1-493e687fb61mr40754675e9.37.1783546393918;
        Wed, 08 Jul 2026 14:33:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.204.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm46531519f8f.15.2026.07.08.14.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 14:33:13 -0700 (PDT)
Message-ID: <e1b25b3c-ff3a-48f6-92f6-a81f7df24e54@linaro.org>
Date: Wed, 8 Jul 2026 22:33:12 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
 <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
Content-Language: en-US
In-Reply-To: <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/07/2026 22:11, Bryan O'Donoghue wrote:
> On 08/07/2026 15:56, Bjorn Andersson wrote:
>> Applied, thanks!
>>
>> [01/11] arm64: dts: qcom: x1e80100: Add CAMCC block definition
>>          commit: 6a3568f938c9ff2cb493f82dc595b4dc2760f517
>> [02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
>>          (no commit info)
>> [03/11] arm64: dts: qcom: x1e80100: Add CAMSS block definition
>>          (no commit info)
>> [04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m 
>> regulators
>>          (no commit info)
>> [05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
>>          (no commit info)
>> [06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with 
>> voltage levels for IR and RGB camera
>>          (no commit info)
>> [07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on 
>> CSIPHY4
>>          (no commit info)
>> [08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 
>> camera PMIC with voltage levels for IR and RGB camera
>>          (no commit info)
>> [09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8 
>> voltage regulator for RGB camera
>>          (no commit info)
>> [10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB 
>> sensor on CSIPHY4
>>          (no commit info)
>> [11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on 
>> CAMSS RGB sensor
>>          (no commit info)
>>
>> Best regards,
>> -- Bjorn Andersson <andersson@kernel.org>
> 
> Bjorn.
> 
> This is v3 from March. We are on v12. I don't think you meant to apply 
> this.
> 
> ---
> bod

For example: compatible = "qcom,x1e80100-csi2-phy"; is not a valid binding

Please revert.

---
bod

