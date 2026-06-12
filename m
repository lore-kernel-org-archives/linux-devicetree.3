Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5AF39DBD0
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255510; cv=none; b=kaM59PJyhbN1c1aJVipz8ag1NAnN6KP49Tf9vV5i53r8GbYpTbxqxHOUbQXPJaluQBM8VdAmXat+d0MZOmyOwdXcdD5fTTrtlGp3uwexvrHfvC/KaxcWfbs8BP+feYdSGe7vwBdLva/i6Pu36YihxdqndnoarM9XJcCyrerJj7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255510; c=relaxed/simple;
	bh=M2Y7gN389qMGTyy+yo/flfjZkxz6y/4EIFKM+ZT7fgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1SxcD3QNt0mIJ9Y5eb1x4Ts11PTG3E20UT4H1bTqklRGFhLceqnX4hGpagDzFUJq3j0L/CPFv9uFNFWJYbpwhVYgC/HZJWHBecLkSB/gP6RCARANyBLIGWEPwZgUCUiM+rQzrtANXCwEbl96b3Vxh8nnJe5uEAiCE/R30NjQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g9DslKmT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9DslKmT"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa6091635aso104021e87.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781255504; x=1781860304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yBcNvIE7yCQii6ic3E0c4VVkUlJG/VlSUkVp+6fpIo=;
        b=g9DslKmTv023wXatRi729A8rcsz048im4daipJsG72+5OLRWdSgx6KRo3WOqKaUoeZ
         iNdsZkkyZep57ZxH90qb15mulz+z4F/tHwiYsbpEvGCcCW1Nt8vWjFo9o2PEMMUiCo+3
         OSiA8fnsKlfPOEedTAMFE161gio/Z7I7teGdh5/wgX8YEO+CVIxjoqSrLP/TA+Ze4DJ/
         lwUatb5o1yM2p9PBIDMYkzO36LdkQ/GMciCTVpSb4ECsf8psIBA9TYTaWSq+pLmFxgCi
         EUxa/gvNyvKlgvIeXzL8nWLQaomIyfXF9ABwtwwW5vEOnnYGGk54c6nhbjIIrWm2JuvT
         x2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255504; x=1781860304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9yBcNvIE7yCQii6ic3E0c4VVkUlJG/VlSUkVp+6fpIo=;
        b=jSjojkSi6DW3y4Ntoxi3fjOIvMxLTdJLP4uznSFEoSw2jYM+C2Y/DHbrcoXXNBSxl3
         GGg7LEedbVYz0o7H7z7UDCxYmR5hKgSC8k2lC319X+a9NDHlxP9I3U70BjutctUgGzz/
         THVLq8DAizZIt7M08o55Ny5yDJ4vKIpHmDCN9CFkqpQ+Se4R0QRYlrxWsJz1C0AvEgSh
         BJOXooOnc256mxiKJh1vcNFhil1XcsFpXH/p7EnTbosXnxtQRcOWMq4lrZWOwkpVuqIY
         UJ/oYjoMv9KR0dP6xxOUTacJ+O0xFJYVlPQrGMocoU5Xt0mWD97syN18nIoWB49iBGMZ
         VuSg==
X-Forwarded-Encrypted: i=1; AFNElJ+coWP8rt6Qvfm33vee+Uw9mtJ05eVQ3YvBAHRChnlkqA4hy8UxRMxkmWfmV/QUZRYwbho0TjRX/lBR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz99mnB/pTLe9tESw7QXzG0UeesmTIQyqPGFhzRcSvSeziLKRA9
	4HulAUL5lhRvG7Ls8QdsrdpohNuDSlPjWIRddU4UOu0+UsWnV6m6a/4fpbqwx9H5hpk=
X-Gm-Gg: Acq92OHbClvdE8gmf/xyjSquR2eO/JMkFfSE2xUf7ifnd9vipfeaUQKA3YwSyiiwQoq
	VLem6LVb0L/43hX9YNM0d1cFp8Pusb4IUxL+k3U4p8BXAakCDjsUAqwTAhwkfojaV7Fyb6VA4Lm
	c1WFDEAZopPP7sKNDpPHiUjFgTPVFyhroKeA7qM7YcCmUrzq2I71r/6EfhbgFKXKYgs80EdNC1Y
	bSrryFW0SN9JLjdnm/Pe9pp/1UJdPhpXZvtPSAmTqpwGAyLo92uzLyr7KZiRXqwtKE9myCVLSw+
	ns0yVcbgAiQtd81O5gd+9iac5JSFTwY78zyt+PkQE5EhSenzGsMNkXAPD8mGa3cfdIWzeNxB26p
	IDBty90Z/SXYyoXr5U62RZZxiRYAg9+oPJ8IcD9VV2JywyfqGDa6941tmsJF0bdcuJZ7yWTKj+k
	N77qQuZqDSgsFb2Yrkb0Rc1pJkKGxZYrmxWBH0G/KYZinbvrv/0TH/FcNWUM2Hpfu0FPFSnJ7V2
	V2SIg==
X-Received: by 2002:a05:6512:2253:b0:5aa:62df:cd0a with SMTP id 2adb3069b0e04-5ad2db71582mr315660e87.4.1781255503542;
        Fri, 12 Jun 2026 02:11:43 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16fee3sm375352e87.31.2026.06.12.02.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 02:11:42 -0700 (PDT)
Message-ID: <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
Date: Fri, 12 Jun 2026 12:11:42 +0300
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
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
 <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/26 11:47, William Bright wrote:
> On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
>> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
>> what may be the rootcause, I believe the lower bus frequency should be fine,
>> so it sounds like a hardware issue, but could it be PCB/board specific one?
>>
>> If you find a chance to copy the SDHC driver (and its small dependencies)
>> from Android and test it on your board, and if it also fails, then it might
>> be well concluded that something is wrong with hardware, still it won't be
>> quite convincing that the SoC SDHC is to blame here.
>>
>> Hope it helps.
>>
> My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
> with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
> kernel [1].

If Qualcomm supports their downstream Android kernel running on your
board, it should be worth to contact them.

> It does sound like a potential SI issue so I will try the following:
>    - Sweeping the drive-strength values for the sdhc_4 lines to see if I
>      can find a set of values that work
>    - Scoping the lines to check SI when performing dll-tuning, our board
>      is very dense so this is challenging.
> I am guessing this patch is only acceptable to be upstreamed once we get
> to the bottom of why dll-tuning is failing?

Apparently if Qualcomm confirms that SM8550 SDHC4 actually has this
discovered and unveiled defect, then this change will be accepted for
all SM8550 platform like you propose it to be done.

According to my experince SM8550 SDHC2 operates properly in UHS-I
SDR50/SDR104 speed modes, this can be verified on the reference boards
like HDK or QRD, and for me it sounds oddly that there is such a problem
with SDHC4.

If the proposed change as is does not enter upstream for SM8550 SoC, you
may keep it as a necessary change in your particular board .dts file.

> [1] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel/files
> 

-- 
Best wishes,
Vladimir
