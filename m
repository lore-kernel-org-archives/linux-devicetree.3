Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36339D6D2
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557002; cv=none; b=NuSs41XRi4F8DbbZ3cRA+hM3C+uuncXmadzya064sZMfwvzxLYJ45KN35ca35JcVoGx9JuxH42+iuUwwi7ATvaPnpN1/gqzIySXtMQV7HE/dqUSbh+893ZxH7PJc21LqpDqL5R7EqNM3kdxoXPR7hBKQB0dlyBYVomAOOMszs3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557002; c=relaxed/simple;
	bh=kyte8Uv93kBGE6L7jytsmKq4nIPwhHVQjTryvIrMlyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6G5/dwN3osPxplCL+vJsyEAFxQBDx4vWq5J1u6WYqiRqaGsPuwlsnssgM0HFrbXVZ7XROawhoE729eD2jMhtFtRKQnwTYE4GemHH/KgPA08grMiKN9JrX0LgA7QxskKzFhwOm7/M+cPOWocjEqdKPnHaOJHtKQ84NT9jVbeI5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyyIOL2k; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyyIOL2k"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so2830708f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775556999; x=1776161799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYgo64gQdukpszABBGVuc7lkqiZyqohOn3FB0D8IAmE=;
        b=ZyyIOL2k+7+h7Lfp7J8jQV1H1TNzCcGi1hKyk+tCaAMff8tBprz3No4I0uyIKU3QDA
         OP53g0rJ67BN0gHGMUfR29LD8VN4f5xPfj7c9X5jCYMkdnW4vFua8RS6wLgI2iO3ART9
         tr+ZruMJJIKpV8myiGJr410a31FxLkVistm8WltwtLF6Hl10Y5+oI47pK7JpYBjJNhLH
         vY6BZCR5w6oKFlH8DcOl+ZrUCw83SiZmasvLG4mLFGvp+OCcVCGlJ0v0kbVxA7XQVOwW
         KPWRDImLbJ2NVCqWQFqpukAyG39mEkoxi2ITwYzF6evqsbYRxxzRh+kpgx97wRLUpRba
         O6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556999; x=1776161799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYgo64gQdukpszABBGVuc7lkqiZyqohOn3FB0D8IAmE=;
        b=o0tqeGYWoC65qJCQv4Wg8GJObTGETNBM/FMMmovSxuz+UMSzycaobt8PSuBv7h/NGv
         TI/9fVTh9kJO0gWJt9RNnInCGti5JHoPmw+7+A8/899pQ5eXNLd2XlO3qb3KbAxXn0up
         JIzhSdaJl4p/sC01nqnzUSJ6MjEccZpc0sYXxXw1ZboK5GgnlMkcvCxvMEB29mN30erR
         7BodeRYxPlK2QpnLCPj2T61wFGh2/TKcewUw7R6Nkt0BfAirscHrazCeCylAkWqW/bkB
         D946klCq2GobBAJtGj21KKlCqjEI5v8yanAI4rAGuvnLCvUCI2O+6VRa6Fq/3d1m4bd4
         a+fg==
X-Forwarded-Encrypted: i=1; AJvYcCXK0rbYBv6NI/d8KJq6ar5Hl7D1BX0HUpAvhf4MGJ+E0gvgFmGJk/uCnkJsLm3/3IM/5tHIzU5Wl3Ok@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9kMqYTLB8MDBFIt1cqwQpDAYeyKhmooZ1QfIV2twphMJt+zh5
	6A9v4/W2eT4eZPRxe9JD3Dc2xm2ST2Ebv4IbeA2ABPTnq/z53hfbSHw4
X-Gm-Gg: AeBDiesRjsv1dwu5Mo8nSWChPwlky7X9o54xKD0WcyU4ncmYwET7e8K9z/XS00r1Xcx
	LAHCfWTRljoe2SMd4H2IUhLJprqGfbN1Cxv4Goi3t71cgJiNUVPOtJ8TpMTEavmLL3l0JsGsomb
	rJtLkkklN+qW+oH1E8V+39Kl2V7nfEP4u4bQfNey3s0yOSzC0thn0sNUROsinIp9tF0nXiP9ltR
	cUsfhH8QWa+7MmJ1NR2+NFlXKeiUxHszo15P2Bhsuu6NyNDFZf8UNKVGzi8/DzS+UMdkpe0eHfo
	iBYPT+9fqDujeOk69FmqR+d8gdSLvJi2R71fr6ac5y5A/vQE2dzFYBKsYmAHLOktQObCwDOhloe
	7O4R4jO7n4TESc/rvNf3vRS8eJelD6r60/7svdDh/8ycuoMRfcsbIqLSHH9pvHqoShrCp9s7am4
	H5ES6NEVEiCCi/Lmg5yfVwMrkfpDMpywkILx8tK9bVNQ==
X-Received: by 2002:a05:6000:1847:b0:43b:9903:2ba3 with SMTP id ffacd0b85a97d-43d292e1e8emr24866383f8f.33.1775556998861;
        Tue, 07 Apr 2026 03:16:38 -0700 (PDT)
Received: from [10.10.10.101] ([87.125.10.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f5bsm44461885f8f.7.2026.04.07.03.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:16:38 -0700 (PDT)
Message-ID: <9f04ae8e-e15a-414f-a436-987d02d31cdd@gmail.com>
Date: Tue, 7 Apr 2026 12:16:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
 <56b5bacc-7214-41aa-b969-4f622afcd9f9@oss.qualcomm.com>
 <103424579111FE76+93c3daf1-4bce-440b-9048-74edb833031e@radxa.com>
 <cc8ba407-1d44-419d-9171-b6911f673772@oss.qualcomm.com>
Content-Language: en-US
From: Andriy Sharandakov <ash.ashway@gmail.com>
In-Reply-To: <cc8ba407-1d44-419d-9171-b6911f673772@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.09.2025 11:15, Konrad Dybcio wrote:
> On 9/12/25 11:04 AM, Xilin Wu wrote:
>> On 2025/9/12 16:56:04, Konrad Dybcio wrote:
>>> On 9/12/25 10:03 AM, Xilin Wu wrote:
>>>> Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
>>>> computer, based on the Qualcomm QCS6490 platform.
>>>>
>>>> The board ships with a modified version of the Qualcomm Linux boot
>>>> firmware, which is stored on the onboard SPI NOR flash. This allows
>>>> booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
>>>> supports replaceable UFS 3.1/eMMC modules for easy user upgrades.
>>>>
>>>> The board schematic is available at [1].
>>>>
>>>> Features enabled and working:
>>>>
>>>> - USB-A 3.0 port (depends on [2])
>>>> - Three USB-A 2.0 ports
>>>> - RTL8111K Ethernet connected to PCIe0
>>>> - UFS 3.1 module (depends on [3])
>>>> - eMMC module
>>>> - SD card
>>>> - M.2 M-Key 2230 PCIe 3.0 x2
>>>> - HDMI 2.0 port including audio (depends on [2])
>>>> - Configurable I2C/SPI/UART from 40-Pin GPIO (depends on [4])
>>>> - Headphone jack
>>>> - Onboard thermal sensors
>>>> - QSPI controller for updating boot firmware
>>>> - ADSP remoteproc (Type-C and charging features disabled in firmware)
>>>> - CDSP remoteproc (for AI applications using QNN)
>>>> - Venus video encode and decode accelerator
>>>
>>> You have a number of features that depend on several other series, and
>>> as Krzysztof pointed out this is difficult to merge/review.. Could you
>>> please create a "linux-next/master-ready" version of this series and
>>> separate the changes for which the dependencies are unmet, putting them
>>> at the end? This way we can take at least some of your diff.
>>>
>>> If you still want review on them, you can also send them as [PATCH DNM]
>>> or so
>>>
>>> Konrad
>>>
>>
>> Thanks for the suggestion. I think I can separate the changes that have unmet dependencies, and mark them as DNM. Can I send the new series now, or am I supposed to wait for a few days?
> 
> Since we can't do much with this one, please apply Krzysztof's review
> comments and tags and feel free to resend
> 
> Konrad

Xilin,

The prerequisite for the "USB-A 3.0 port (depends on [2])" feature has 
been added - 
https://github.com/torvalds/linux/commit/f842daf740114a8783be566219db34c6a0f1d02c

Could you please check and resend the USB 3.0 port feature?

Thanks.

Best regards,
Andriy

