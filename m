Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A62B1F4174
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 00:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775260841; cv=none; b=pKWeJOp9l7xe+MEJant4BVZmrEVCstvT/3psq7/hCpC4WmGVuYbNmdz4Yz6DilIvm398AC+1C3WiZXN2EbP9efrnRwPhUAxptfKXX/SS1SRXv+CQ/arHYPuT6m/4wHHbBQUrkhraTbju8ztcttPdhzQcjxJXpsricrXLJszSEPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775260841; c=relaxed/simple;
	bh=xHxijxgek5mfHjwCdabAUrjt9AfnXDUiySgG8SMzkqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4F31V0zXuwpiiPwanNnTUqNnD5j2zi0hmzwti3u7s5GS5ho+mdd5BVbSTrBYSb7Fwja4i9ihzYe7N9rTuiPkiExBIjRehKNVxzSajcOI87jOSz8py2vMbjzdMWFvBr7i64ctaP9BDKy3raEydL2/zJAj7gW9IcVfgPR289ztg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Te5Y/3jh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Te5Y/3jh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a041eae5so4764235e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 17:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775260838; x=1775865638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vPREYlvR5Y5BvzTLzoCRE5R4pDf7TpilW49wGVrQaeo=;
        b=Te5Y/3jhDo69BxMw+yPGk0FeEtGBgd62OTrm+a2xU01PA2AFU6jRfAD1bnDD3FjfVl
         NI6vPnjccKxEDRb3kYJe/0MS94ABDwxV7eptqE69b6MfH7lx61aY7HfqmT717CTMvuOf
         83gJ7rMbBakbasGFbzGJ0FTEHH2WytY2pYrLYz/laQbpu0lRUzeX0y1KXh7DaLq1nYLK
         BNOCVljMyQ13sh2Nq1BUFZh08nfN2FTz5tpGs9iBRC78WgGk1njGFUjGsqNsNsIZ4u9S
         2Sjxs4AW1oFaWoGANzKYu67y18qvi2Tkd6DANYQ6K/mq4vpKIWw/ORtaMB7rxfmMaWez
         CV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775260838; x=1775865638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPREYlvR5Y5BvzTLzoCRE5R4pDf7TpilW49wGVrQaeo=;
        b=EeqECbt4g7FFkAtq5zi5oiEIK/suHMKQLGpPRxZ5Bl3BPvKvRuv2PaGy03xExl7w18
         bZn/ZQhQf1zs3dPyhrLuF0ZjLBlfNG/zcHxR8c9BoBQzzNA2c2bemZ2KBk8c9ApjtbeC
         akrh7rWyT/zCbdo7wzIgqmaPqvDTtsh7oFDWh61qIVFq/CacNGTC6HCitvhGWohBVD85
         NV79+DIPcT4SY6eeba+USpe2cLYsgG+piTcpJ5egFRVOJ0E59i0/j/H+3x7YgPsPgIpC
         2ObUNmWB3Ux4fh9V0PJgsU+0KnPeOzYEzgsrxhX5pjws1TFnJcdt4MRm90BOwhw1bWAu
         hBPA==
X-Forwarded-Encrypted: i=1; AJvYcCVbsDZFSwpksMbECLeLys3/d8iuenF2pS6l0Cz3FPs/80TfE0w7vnWDdGDLMrFfDVD4RYKcXjLt3rgC@vger.kernel.org
X-Gm-Message-State: AOJu0YxsU6TcSc9S2RcmGJ+WM/tQH45nEyPCzDrjN+ZEla3venbxLCgE
	EKv1T9nZXG3JH8GSv7Lymat+r91/dX4mz4vm4VttRhPz4BDuNykpYapemyykb0OD9U8=
X-Gm-Gg: ATEYQzwbdWT00JxS/Z+UoWuPqONpCmsqSCPKRx+GyNhkPeisdpEpIHyVciobvtWKNo+
	mQWSu2gyY+ilCMXUUtBr1xISqNG9ijFz1SgFottDbZn1mUjQdc56h4AO//mluFvbKxL19/URu05
	WZD0Oghah3quuQv8DAxa3ljv+MKgv2KoKk58ROhLWIys2RsgiQnkg1cggD8XGoV58/tjAkxwsBc
	R/zuczeqGBSXh4caGHUtZ55PhQ4u6xJgP2TFhyXw9WZIoU/a1C/a4MwvgWFtPxILAET5qL8JIdH
	/UImedo9uejOJkFU/MGCtMpDEO82S7kbqUuC5sZF45LSW2+leEeDo5UPcjWneWOQBpcqJQb6FBh
	a9/mcVw7yWneO4k9e5TBWMjSwBmPPV8f26tRj2JV6fRemYTxFxynuIh8dVuYwGbc+/v1AlGw7pn
	ZDobuq4a601Tsv5xSLch+lsv5AZpuQU0+mJlW3Wr5jowsYGGA=
X-Received: by 2002:a05:600c:a318:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-488997dd54fmr46727505e9.24.1775260837924;
        Fri, 03 Apr 2026 17:00:37 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.207.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e967badsm395691065e9.14.2026.04.03.17.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 17:00:37 -0700 (PDT)
Message-ID: <47061b6c-8589-492b-888e-3550c878e072@linaro.org>
Date: Sat, 4 Apr 2026 01:00:30 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: iris: enable SM8350 and SC8280XP support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Steev Klimaszewski <threeway@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
 andersson@kernel.org, bod@kernel.org, conor+dt@kernel.org, david@ixit.cz,
 devicetree@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
 johan+linaro@kernel.org, konrad.dybcio@oss.qualcomm.com,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
 <20260403214140.7307-1-threeway@gmail.com>
 <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2026 22:59, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 04:41:39PM -0500, Steev Klimaszewski wrote:
>> Hi Vikash,
>>
>>>> This is not just with totem, showtime shows the same issue.  If I let the video
>>>> play, it plays just fine, however, if I attempt to skip forward, back, or even
>>>> play*after* the video has played, then I see the smmu fault
>>>>
>>>>    arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
>>> please log the info about which "iova=0xd51e3e00" buffer is faulting in
>>> this case
>> I will include the diff that I applied against my kernel, in case this isn't the
>> correct information, but I get the following output in EL2:
> 
> But these logs don't capture, which buffers are causing the IOMMU error.

I'd be interested to see if we can run this test on venus - instead of iris.

Konrad's patches are still floating around somewhere.

---
bod
