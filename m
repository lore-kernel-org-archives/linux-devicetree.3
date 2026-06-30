Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DDA331EA7
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823302; cv=none; b=fu5dehymy6/W5MqfeNTKuDUC9/udkx6ZkEyitA01Hwu9wEtEDl1HL+pj5iZhqJUX0PYgNX+BP48zOFbCC4DQ97a8mDPz9r0+KgoDjzGyoAaih5wwa9kruDPcOSAYVT6N0Y10Hs9Umk/JNqTshCJv5ZX8hmQ4IlDGQk17tO35uOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823302; c=relaxed/simple;
	bh=/qQIhp6ivqT+2HKiI9GiNz6XwQD5DVyFYiJSHPh2nJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyXYFTiMppQTOEXu5IWMzftJlOjTr2hAOIapbRQPbvWI3l1rPo83S5UV433ZzkhsjPotbHue/vrzUEcyGElmw/1n+RXUQ7XOu3zed0UtQvQUre3eeNA6BxJKmaTEr1EoU2nzEvGf3fmdpuNJ0DfO/aUcH/klDbrlMuwEerSDlTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eX41QCLi; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eX41QCLi"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebd7da975so118440e87.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782823298; x=1783428098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uCmcPvFsUj9ce5Hb9FUW8V5ardKixIrXr25AUWrKNw0=;
        b=eX41QCLi2zRk9kHbgo52eDnI5I3W4vs++xHKRG5rGY3hXct7AQ4j643DuypenEGBKp
         KROqNZM+93NLWASk165IKvE1Nw2nVRLjBd6mzx4I8RlVVJFIdCVq8ShxRYlRWb7b44SC
         x48HJtWcDMWkaQu8HeNsZG5JLCbmnAC5VNTPfXVc/Z1bTdJsAmN1WR7X7EzwWCFckIBo
         AORv5d5ET3O01z8YcDFaydwJx2iv3HmVJ7enPMEOGpffv+GLWFvM6arul1zRkRp+ZPlS
         hJl410IjUCYca7ndFwMOZLAHpu9BgpFxw/Unh8aZi7w37E/5Qix2e02DwtgxTp9nu3A3
         haxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823298; x=1783428098;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCmcPvFsUj9ce5Hb9FUW8V5ardKixIrXr25AUWrKNw0=;
        b=AQ4o1pM8dpAZ7gs4ebkhRyciAmdgX3WwRZU3DIR6MdsXpQJlIHEe5DUDzDv+DZ1ife
         WcPqtCE8eAnvszwWFORdmNEQQN0kWoDuW4X5S14CTl8cnherHIaDHZ2eV675dWW4DK6y
         KyO3aF0D3UCh14rbUm4u5u0QYRXuZEh0yciu5+oM6iAsLRh30LKdhcVzUkIBIiD9cqfn
         2O/ivjysOV8UDOMw0Kdax4YveRxjL2GgZU+dCaVR+ioPzbMkHmU3TIS0jFCiodEghnS8
         mEbbtPxIXSFfLPXLGv8050bCOn97epJrVBJtfDnTDzb52eXqTTDfs6OlQjn3Vy6kmIDd
         0qWw==
X-Forwarded-Encrypted: i=1; AHgh+RoI0ZWvb5bOO/H+Q5jbPpgJdy4dVKucwaIagDlvo3mZRRkgRgJLbTJ+h0lIu1A29C0oUAWcEejUhne6@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXZi2mZKpxfInWxSCc/Fb1iJOGEJKhIxxK8l6NSJ+PXhvU642
	mkT+mtEViSRKnZIKMaa8XJ5QwnP1SfQ6947cMRZPYLlsYgLwok6zmdMwjJqmuu62Gbw=
X-Gm-Gg: AfdE7cmtnvrW12m/BCD4EiUSM+Aizi/gkPSGzJr6jXysYwwTPlSMbuN11mNBb29272A
	GFdwY/2/N2VUJWsJ3sptWmsHeMvuxRcsTj4DwOvtZIPs7FjBoVBShmIqj+dFAL96+lKFnYcNo1k
	a7BuqNK/saZ3sd9Zdsx7wGIZoG5JvbJTHUP1snaV1DVRYZfmDgUM83Yzfqi6wNK3+RIh/lG6fqG
	eWxEHGhSlO96lnOBDwYZHO9ssNmAkY0/A7uoi37tR7jRB4q8qsuEd73/amldXufhiCzZsc4hxYc
	uT+7h6LzAh5C7Dcz+2bLDNgx/4CCukvaSoXvn59vlmkNasi4cQOLrmwtksGH5h6vLOdp4BcU4qq
	yrKVDB0+dvpYT9NX+80mqSo0Z9M3/yAlK7X1O6roqKitOC9HFAuu1IDZM2C3PsWrGsIB8opsJ/D
	14dKkCf5O1NfGN2LkHJOcH+r1mAWm6L8/NZ4SqNPTC2hAlERniOmTijdjgdbpmFETVxd4=
X-Received: by 2002:a05:6512:1253:b0:5ae:b8bf:51c0 with SMTP id 2adb3069b0e04-5aebdbb2232mr564127e87.5.1782823297830;
        Tue, 30 Jun 2026 05:41:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe33ce5asm513831e87.21.2026.06.30.05.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:41:36 -0700 (PDT)
Message-ID: <fd78f8e8-07c6-490b-a9bd-d581a28c1f04@linaro.org>
Date: Tue, 30 Jun 2026 15:41:36 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 William Bright <william.bright@imd-tec.com>
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
 <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
 <c9f7b597-f083-4438-bf9b-a19e2f39436a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c9f7b597-f083-4438-bf9b-a19e2f39436a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 14:09, Konrad Dybcio wrote:
> On 6/12/26 11:11 AM, Vladimir Zapolskiy wrote:
>> On 6/12/26 11:47, William Bright wrote:
>>> On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
>>>> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
>>>> what may be the rootcause, I believe the lower bus frequency should be fine,
>>>> so it sounds like a hardware issue, but could it be PCB/board specific one?
>>>>
>>>> If you find a chance to copy the SDHC driver (and its small dependencies)
>>>> from Android and test it on your board, and if it also fails, then it might
>>>> be well concluded that something is wrong with hardware, still it won't be
>>>> quite convincing that the SoC SDHC is to blame here.
>>>>
>>>> Hope it helps.
>>>>
>>> My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
>>> with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
>>> kernel [1].
> 
> I have a "feature table" and it says SM8550->SDC4->DLL [Y/N] -> No
> 
> no wonder it fails the tuning if it's not present (or that's at least
> my interpretation of this doc..)

So, is it a hardware problem of the SDHC4 controller, which reports "SDR50 mode
requires tuning" bit in CAPS1 (see SDHCI_USE_SDR50_TUNING from sdhci.h)?

https://lore.kernel.org/linux-arm-msm/aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8/

> There's some notes about the frequency being limited to 75 MHz in
> SDR50 and to 37.5 in DDR50.
> 
> The supported modes are DS, HS, SDR12, SDR25, SDR50 and DDR50 (with
> the caveat above).
> 

-- 
Best wishes,
Vladimir
