Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5263A4F58
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079725; cv=none; b=EmrqFRP5h6SdWVIUAQkoXO5orV2Us74YJzi3VOb8pldCWUubq1HQZN6yqdSdKBleehp+fVR29ulcRkAhOvhyuDKA20VLIA9bW4hbTJu9xkKrVoZI1awxgdcy4hkMRoGRdNktWLSArJxBeQUXP/hZ/a9CL/GHwqBlW7kBTSQwCg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079725; c=relaxed/simple;
	bh=nE8gNuplIhw6p4dYDUNxSa5zUE0zr4R5hqpSrc/T3vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ywi/Lw2pWcVM9VwaXMbw8EES/Mm9wGkAxnGAFcjoZUotEkbdXyIpqMpaPIelHZvgo/pbFpf1Dr5TqNYSrnAUw7oCILKr1zdPOzX+VF1K2Bl0qMCEQNljQG5D0/IZWsQSw5eXdBLn1FMQxQFmUI/rV/CluNABqC6AfQoa/a7W3EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VgIleMGE; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VgIleMGE"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-396aa835272so4378071fa.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781079721; x=1781684521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ujN0Hk27ShmSn5usfdP+E/0ZsnXl4co2IQGGfBFpB8=;
        b=VgIleMGExBkSnjjOc4t/4oVkLqb/wW3BDN5gIuV0n2IIkmcqVs7bs/K2pgOMleaNJg
         u45VT7CMx65c7dLyf9a+tV6DOAs+zCehwZLk10kvE6gFedHTrHjez3IzToivnbzWF8Cx
         JzywrjkAkjLo3bLgXtfEOxQfpdDb7NrYyc/ojjSFqKv+y3XAL1Lcil51ayZ6935mnYv8
         5+cdCICEdaSuUjHh/fY2319gL3ApNFFTM0w4KNS3U5Wn+E8UGKMBurtjgsxrgS6hUJQj
         BEFxvDFrnqS/u6IY6E93HpqrHDiqOsAWHhD42FSIdVvRPS3/EpkCArXN/q+u3Q1WcD61
         pEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079721; x=1781684521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ujN0Hk27ShmSn5usfdP+E/0ZsnXl4co2IQGGfBFpB8=;
        b=LBB6vD1MRLKxcHyfpeG90Mr2m8/45URcXVS2zWO3YQDzoKqz2nx9bO4mQvHBCGwjFy
         ADW8seKOCr13E+SXKJiI/lp4VoNw/n2pT1gLAhg+QpbJNL93MTjgdLMT6HAPgVkgyHH9
         qAv5MLLwLx7NAy3z3NQVgsHBjWHnVS1lGwUtl4PmGgRswAaqiSRLYWqICk/YBy/CUC1G
         HTOxfG1Ak2bXs4OIw5pCafqYmRhnUz7J8CWFbfiscpNvE3oENKlZUYvCdgyg+Uvb8pP1
         YPLDF2ioI4IP7c6xVMJWPD078RutVWuN0PUo627LXsGqejrUxEcpxD0yITJFewfVquGh
         PsHA==
X-Forwarded-Encrypted: i=1; AFNElJ8+iJzvNpbsr6EfdqI+9UPq23SnikM5AocjtB/8khiRVJ5A2OM27k+xVpv/oNyAf1bNttRp8IR+c6Ho@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmPMHH6cknyS5EakMyn66rzHJoWQYI8naYltkLZb3qWdnVLrI
	oYv4R66vlkb6los50VuTkmhfab5MlLMw/NO08BbX0fd1c9L4qF0FyVOkfB3sDe77jJE=
X-Gm-Gg: Acq92OH3Wkb7RdCWAVEwj+c3V/aLo1elYkRGXbEL5j28T3Rw/6mF5F12zm1KywWCer3
	AKm7i1EaL+AuWX7vl9pply34U0kvdIvspw4JgbzsFFPlmjN1WmXseyqztyFkMesdTdFiLMRIDZ6
	9oq//QpGnHvoCOEuOUGaFqVwaHQcHtzEZ1N6QPOIJWMP9uOiRe+YfPLXqrA/Lh1jEa+NXWPI9I2
	/2y1aTnhUD8+Vx2nyHZJF0pJjyFKAlLS6f/tvSUsVIEk88ZXm1VCbYubLoIzoAAVRnrtdhJ5u+x
	ES9ckZg+KCDPxfmodlLhfTpmvYp7Ix/yxn+N4EmnaB6vzh8/51GE7RH3oVv9prvC8ahLcg4XXCn
	coeMHIz4Zs32v/W4ICjmk4adi8Db03f9zlxpGHtKnQ88s1UnOj6UJAp7Ftx/VzzqFG3AWnKZQoo
	Cwfm/vzLyQyLly4P7YKssbA7Vw2N/QjaC7cSP7YBPfEiVvkWvSESFfEb8HBhfeaqZuOucTu4HGo
	y4UOkNtPJDNFx0y
X-Received: by 2002:a05:651c:1a2c:b0:396:7eba:a8 with SMTP id 38308e7fff4ca-397f78270bbmr7911561fa.8.1781079721231;
        Wed, 10 Jun 2026 01:22:01 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be04esm63290161fa.25.2026.06.10.01.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:22:00 -0700 (PDT)
Message-ID: <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
Date: Wed, 10 Jun 2026 11:21:53 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: William Bright <william.bright@imd-tec.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ram Boukobza <ram@imd-tec.com>, Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/26 19:21, William Bright wrote:
> On Thu, Jun 04, 2026 at 07:01:22PM +0300, Vladimir Zapolskiy wrote:
>>
>> How do you know that these modes are broken in hardware and not
>> caused by something else?
>>
>> It was stated before, but it was proven to be invalid as the statement.
>>
> Thanks Vladimir for your feedback.
> 
> I copied this statement from when these modes were also masked out on
> sdhc_2. I see that there was progress since then and the caps mask has
> been dropped so I agree that I shouldn't have this comment that these
> modes are broken due to hardware.

Well, it might be broken due to hardware, but not necessarily due to
Qualcomm SoC IP, there is a chance of a PCB design flaw.

> 
> I have tested this patch after rebasing onto the latest tree with the
> recent changes that allowed for the caps mask to be dropped for sdhc_2
> and I still see dll tuning failing. To progress, I need some guidance
> from qcom as to what dll-config value should be used as I am uncertain
> about this. I noticed that ftbl_gcc_sdcc4_apps_clk_src only goes up to
> 75MHz so perhaps this needs modifying for DLL-tuning to pass and maybe
> there needs to be schematic/routing guidance that needs to be strictly
> followed as-well besides the usual 50 ohm impedance rules?
>>> - Forbid SDR104/SDR50 via sdhci-caps-mask, matching the previously
>>>     existing sdhc_2 workaround in the same file.
>>>     The SDHCI capabilities register on this SoC advertises SDR50/SDR104
>>>     modes that are broken on sdhc_4; without masking them the MMC
>>>     core selects SDR50 and fails DLL tuning with
>>>     -ETIMEDOUT during SDIO card initialisation.
>>
>> Which one SDIO card do you test?
>>
> My apologies, I made a mistake in the cover letter, I wasn't testing with
> an SDIO card, I was testing with an NXP IW416 which is hard-wired to
> sdhc_4.

FWIW due to https://www.nxp.com/docs/en/data-sheet/IW416.pdf "10.7.1 VIO_SD
DC characteristics" SDR104 speed mode is not supported by the module, thus
the selection of the SDR50 speed mode on the host side sounds to be correct
in your case.

In SDR50 speed mode gcc_sdcc4_apps_clk clock frequency should be exactly
100MHz, and since it differs, it has an impact during the tuning phase.

Definitely clk/qcom/gcc-sm8550.c says that the maximum supported frequency
is 75MHz, the same is found in the downstream v5.15 kernel:

static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
         F(400000, P_BI_TCXO, 12, 1, 4),
         F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
         F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
         F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
         { }
};

Can you dump CAPS1 register value of SM8550 SDHC4? What does it say about
SDR50 mode support and need for SDR50 mode tuning?

-- 
Best wishes,
Vladimir
