Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9F02EC0B0
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779053061; cv=none; b=tcJ5AZ6telFlmBoV+yrwyyX2e9QHTUBd5s2lmo5AEZZ5W5LIjKGuLU/rGYeB9IHCTxsjHP62W6QdwH09xOtVWiNGjDX14FLeWOgpUhsB4J76yU3u4xLNBBUYTcnqfguEoaQHB0D+6U70WFP41we9SrnPuYU3fK5knqTs15id6F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779053061; c=relaxed/simple;
	bh=B7jPCLJ/AY3VdwjS9DGLe3moJCZhMvixpnCqSqOJ+CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMkvIVS+GzlJHszq0mDkfDj1Vg5yc7ird93l/YKG2vaxH4ijHOSv8N3kYIESks9JjcnkCf4wsPtfC0gSlw09Et5DbciPlzMUK6Jpmn45kOq6FvNjBxUtEyta6tV1qFGuKUtJIIYZYFf+28SwW2Infndaa4A4o9blwR14xoHqInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=EVV/mulT; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="EVV/mulT"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-911af978bf2so205267285a.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779053059; x=1779657859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fhKtdJnZR9ambe1a43m0SWf2eTjnb6OKaQaqgQaWMmI=;
        b=EVV/mulTcFBvrxcQvBexA0JxmfKuv+4hp+wg6A+cBU2CRWP0SEBn572wCn/AXsMyMR
         jE4eEtzYGzNO8yca15TDn/+5MZa2mjR2wg1tK96V3mQG4oTfXGSar/8JEBu+twXo2Oxz
         I8V5KVhpC36n/+1VNu1ZI6JJiHJr4fMpKNDvw+AFk3IUuNcRdrf/vhs+J/3acwkwJAAT
         NMZ9bURAltQNRb8LtNIC6bs91BQCqsOBujeIwaQCPy5Iak2l1ZnoyjDKdXtgAOe6EWS7
         qp8K8xPwbszYVG/rSNFsIUk4uZpxc2svPkp4XNduQClWHyUEoVWT4ihkTYwsUJ/kbGok
         /TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779053059; x=1779657859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhKtdJnZR9ambe1a43m0SWf2eTjnb6OKaQaqgQaWMmI=;
        b=p+b9pJq10NDdBCvirJGp77Ol4o14AYBrTtDf/1/TMW6w9R78FqeQCryrGDSU8Y5IrJ
         4NkmhFooaFqUO/Fcc52wD1RBUzFETJUdwRi3evUBmq3AEyXyybvfo1maMOFidgwPTcS9
         uyZG+LzofBMOcG0HapDx9XIM2Wagk6j9Wd0QrvptnRgM/jwIELGmhLjWEQjLmInnuCad
         YK3pZKSd2FpXABAv4v3vhYS7mVmZuaiDgoMoEh2yTAcjnaZVZXtuZMoh8CSvNBm1u85h
         HZN20kXFw4jfl91m9qHW9zIDygQLWK7AHCxKCSrH2hghPTNT7SapxF8wlQ51T1DorsUr
         vErg==
X-Forwarded-Encrypted: i=1; AFNElJ+C45KYMotKhMXinpli7ayFGR6eEGg51e3T/QBf6nPRDwuXvEYZ6EfRzzAkB53aKueLMwu0TsxuUkh3@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPX75PFUYXrQ1l+zFqfEGWTYeMLVkzfd3vHYg7o39bBaHIbiJ
	ldDlsaPxtl0o+RbCcySKqRrt6FghO/vN/bLjFUbw+eXWUk+n1s4hCDFy6Q5s2rQlcgZT91bQFpV
	sZOUw
X-Gm-Gg: Acq92OH0lYjOKWE68CDwXW61S4X+hVshF5S5St9HquRGKseTnHZFGgHxn8zgJz1v4Cm
	gYs+XHSxwERu1rITDKEDZWv9ofqN8HHBRI5x/yWORF97zXCB2jOfxm5EUo6ZzT7rOnkO54yUF0t
	BKyW0AihMQgIwHGRg+UjXqS9D3tpD0TfiQiptjh7XeD3mAB9dFchlwEG2s9iejtC78OeEjiTcHg
	JNLLXqQs5m/huP0Oz9hhJAqh82jSY/I29FWT/xZBWvLKpaNQze00jRo5B90EIQCCLrn8tPQ6pNQ
	S/M/QvRwSCvM48DMJ4m1x4WASU2sdX+IZ+kxibDJ3Hhs+VSsQ8f35hfnjh6DvYogFqmZG5GveD3
	dnjILE/zHYJd0s12P1SgKWpy68ybuKecisOyQIaPRWb8NqblyftJ9dk4Nqz0au9WfWUA2r738vF
	CK+d/AsgPkOJzrokPc5xu+q+JhWc1cVoLPWUZFqHnhq+2BQX/3WFS2naHTmMjbexye4O2XqhjJ0
	3MwAumbL8OyE2A=
X-Received: by 2002:a05:620a:a8f:b0:911:e1ab:a3c0 with SMTP id af79cd13be357-911e1aba5e4mr1370917285a.60.1779053059232;
        Sun, 17 May 2026 14:24:19 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bab32bd0sm1282821385a.14.2026.05.17.14.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 14:24:18 -0700 (PDT)
Message-ID: <9576f728-f66b-401c-865f-a85f272b109c@riscstar.com>
Date: Sun, 17 May 2026 16:24:17 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stanislav Zaikin <zstaseg@gmail.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 9:56 AM, Dmitry Baryshkov wrote:
> For most of the platforms the IPA uses qcom,gsi-loader set to "self" and
> requires a corresponding memory region. Move those properties to the
> SoC DTSI files, handling the outcasts (mostly from the Kodiak world) on
> a per-device bases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

It looks like the *only* platforms that delete the
memory-region property are in patch 6.  Only three
(old platforms) use the modem to load.

The entire series looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>





> ---
> Dmitry Baryshkov (7):
>        arm64: dts: qcom: sdm845: consolidate IPA properties
>        arm64: dts: qcom: sm6350: consolidate IPA properties
>        arm64: dts: qcom: sm8350: consolidate IPA properties
>        arm64: dts: qcom: sm8550: consolidate IPA properties
>        arm64: dts: qcom: sm8650: consolidate IPA properties
>        arm64: dts: qcom: kodiak: consolidate IPA properties
>        ARM: dts: qcom: sdx55: consolidate IPA properties
> 
>   arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts                     | 2 --
>   arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts         | 2 --
>   arch/arm/boot/dts/qcom/qcom-sdx55.dtsi                        | 3 +++
>   arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 3 +--
>   arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 --
>   arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 3 +--
>   arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++++
>   arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
>   arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
>   arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi        | 2 ++
>   arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi                | 3 ---
>   arch/arm64/boot/dts/qcom/sdm845-mtp.dts                       | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi           | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts       | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts             | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi  | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts            | 2 --
>   arch/arm64/boot/dts/qcom/sdm845.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts    | 2 --
>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts          | 2 --
>   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts              | 3 +--
>   arch/arm64/boot/dts/qcom/sm6350.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts             | 3 +--
>   arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 3 ---
>   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 2 --
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts                       | 5 ++---
>   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts    | 2 --
>   arch/arm64/boot/dts/qcom/sm8350-mtp.dts                       | 2 --
>   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8350.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 3 +++
>   37 files changed, 46 insertions(+), 55 deletions(-)
> ---
> base-commit: 230cbc83bec52234e456f33a01f400f78bfac0f9
> change-id: 20260516-ipa-loader-403567adc3dc
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 

