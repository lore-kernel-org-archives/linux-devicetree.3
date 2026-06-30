Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C613AB272
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806500; cv=none; b=Qco9OJXAueaAVjZ3G2zVGAy5CzfZblsjFdm960c4bj7DeC/ORfDUNQOGDZvSFXoOB4KyW5KulKB6BXLect3TsEfb6FO39YFOgBWgCeYDSylSeBecXPbZKkekQDeBsD823oyuSI29jDfB/JGFz86YSA23sXueUQP7cF1oC3nkihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806500; c=relaxed/simple;
	bh=cgCorLCAb0yDNWSRu0XQEpaIFmCxSgaLAb5jZK31Fsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCLUxoLPWgUzGe2HLqCjnyF1kyx/bP8JP5wAJkhvd1VK+a+m6wP/aAg/xVwpTsN489za9z1naQg5VsNKNZWGdn7N7ohtQC8mdhxN6gW3A6uNqAIKxJ4srA0BN5D3wMKSWUYIEVE/Wfagq2p5rmNYQvk0oqUetVpbXYfYh8Zv92w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmeaAAvr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjdMzmGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmeaAAvr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjdMzmGv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CHhx1030629
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=; b=BmeaAAvrms5eqOmg
	W+Vm4pbG8ytGREDBf7XDsDVHNLsWl1UasWjr1y4eugEcs8IWbhO2z+GYX5TesBWd
	9cWRbuOHDncliYAH9kpgN1HHh42DviBt0pRQ4tGPsh33c4b/y4pG6+jv7XFF6Lr/
	uLr8vW7mImeRJjXGz7Krmhlef5u6XLYYmLp1GtpbzDJ62Kq6RqfPzUP66tHB4Dfw
	H8tX3PDkiR+kWbmHPVSJgwcMsNDCtOwbrsu72Ix6V+L+/GIa2MCUHZ5ydl4AP5dC
	+tQ8c2ZUeHq2VODRHDOzZjLoTvac9QYLVqlRnQ/s1x6KYPGSgxu0gelXmPDgSLIX
	mi4eLQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp180c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:01:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a483ea41so495671b3a.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782806497; x=1783411297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=;
        b=LjdMzmGvfzGjpCmRXwte5GtWT5Zc5ZkKgYgZqK0FswS6Xpqj7FL/mA8XA2NJLj5Yix
         ls3TmULBdJ6rEjvYgh6YpjpmMpRPK80J/Ci/BMIvhqE8SE3pX/3bUKKQTnzoDxawpt8B
         /PmfESuygKbHTHd9h4SbYGpmFKEXXW9sFKZnKsq+FTtcM3vSGBNwOhdHmw/2JCHXTaw5
         5k49RuCjRMhaxrS95K8hPxX5pfSC5UoAOFGCC4XoQBbVUXmkTEt43QciUAybjL+iba/j
         GeqrxTCFdIeJ+rDHyDCSEYqh5uiaJl+3dz7puhvJGhWLyq0W4TqDX9QXcVlRCys02Psk
         JWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782806497; x=1783411297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=;
        b=IjYYtc7WzU+M3UnQelzr2YRmDX89rvu8HoTUMMhCHcfeBTRoCstd0UZYL5+dbSF4Z8
         7um+ZfX8Rjo+d27TPBlQk3kN1ttZRztcrfPfXkmNNlwygN5xh93KRIvg6P9dxdJeM7+B
         5alK04Nl0aow6uSoe4YwDktFAOkGY0KuRLeIZ1ACKaS3ebtlBhDAtALAP63l2jSIfR7C
         lBiHaCF/pzEdN21rX0qsxIz74hniSY422IZ3zWgkQNGK1hP8oxcLSKIGrGN/5vfhLrVU
         ECiZ0h4P0XmVTvAP90n1oW6V/tc7nGuJSWR3yLVUpmP7afkaZE5dcVI9bx7tfG8N80ly
         hoXw==
X-Forwarded-Encrypted: i=1; AHgh+RovNewBZR1Lwdy5aJfpnUAhGpDf+mj1UDKjLK7m3FaFD73Kq7aXQxNRfagL3xqWWFEJ/Kt1uPwpP8Sm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Ils/m06NXa32CoRK+q3T87K1FErsVf4PuYbj+y7hEX0r77Rb
	W1eiFG1D19sK45bPSY9dvuKByIk8ZdVCiezS8GIMNUeq2f2xWB+dMimkvFRphdH1mEy3IyKfzbB
	RU+U+Dp7SKLntN93bCWhMYdhL/yGzDK8bdkSM6s6D5NAKwEYXU0+ukzCA8ZZ4qeKN
X-Gm-Gg: AfdE7cmWqgA8mN4VXuyZoS3aAhOVDn0xQwRryhB6uFDhpScM+PTjkuFe/Us0iZrieig
	/6Tnt5POE2CqTDD3008nj4DlMW2kXoQyKVZKCMu9j08EKVdv+Ky5rXR4tfrcRLsjuaUt0m2LhoM
	clNcp1J5Nx0OMvXAbfqpAFJZYNhmsDNrmD1S3ztA1ewmmXkoNZCKV/Bc6CC46TvBTnSC99Lvc+d
	FVWdP/YG5Y5MjRUk7t2qGVZQwueJcO21gzJspSiKyNGVQHxs9G4tArgqjXU6npxY6E9aXDxbk2t
	UASEkp++mnzHwZ6iZW+dlfxImv6QXOmaPE6At7VbwoKBfH8Be2HvBQJ82V/uhhLKp4pxZWPU0Dw
	GJ/U8I+6DzEtP1bCviosHuPA55iTjrH3SlHwSPwG/QzWBNYJQRrQ3HjwvAaBdFKadz02RlZvHjb
	CA6cF/zLA=
X-Received: by 2002:aa7:9307:0:b0:845:df5c:2567 with SMTP id d2e1a72fcca58-847a82501afmr606105b3a.25.1782806496999;
        Tue, 30 Jun 2026 01:01:36 -0700 (PDT)
X-Received: by 2002:aa7:9307:0:b0:845:df5c:2567 with SMTP id d2e1a72fcca58-847a82501afmr606054b3a.25.1782806496280;
        Tue, 30 Jun 2026 01:01:36 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cd5c2sm1384983b3a.61.2026.06.30.01.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:01:35 -0700 (PDT)
Message-ID: <33ee63e5-c1df-47b6-bde1-4fe6b037878a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:01:17 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
 <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
 <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5Ked3UxVzQA5QNQmh8aEmvITS6u_gS8I
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a4377e1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fWFuU9I0zHhLgkhYlfEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5Ked3UxVzQA5QNQmh8aEmvITS6u_gS8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfX88VefwnHNtXX
 XWLxZcjNF0x61mfQq93MT9/Hcb6Xu/Ka/FZsprjr5ozaKsFeUCFLrUPwa2Rd/3RZucUSe9DOfKJ
 9SsiNVfEuKHBTEswMGUra8QpoBmVcd3JXdaPViOFK8pmZK9DGAcQhwCel6nqAhR9eJyejd7Gkej
 jx+sglHsOM5CKN2veMYhxOIzE/lHJ7iv2SyHCgemXSWsE8WmnubcmsZ7HgCfWmlXY8Zw1Fj2ejC
 w9WwxLLM/RupwLLz0bXdJ50THsy/xPdY9oVJIlXabikTt246CSXdVvLpTiC2ExLYTHsAdbI6B9U
 +B9h+rtIdJONE6m72WFtqDINkHqgpNNIMWXWaBNgFsGjidFW57ZDauI9ESMLy6jedUjwJ2OrrDj
 iCR67VkILWZc6B3l1ODiCOunuumDiPIbjb2PBdb6w8mp3HJij7qmuSNrnJuWzWR7w7tpI6wboIe
 frN7UtfgoWAZND6yN6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfXwDSwt+d6oVdZ
 J4iV35vy7qREhHgJL87hzjc4lKxomW7jO/9dnzDuszr8UCrd4yyltooxvl3qd8+7VQklx7ipU9i
 eIwc2WQE1AvDV7mLzvSWdTiGraThogM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300069


On 6/29/2026 6:44 PM, Suzuki K Poulose wrote:
> Hello,
>
> On 29/06/2026 11:17, Songwei.Chai wrote:
>>
>> On 6/29/2026 12:22 PM, Greg KH wrote:
>>> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>>>> Hi Greg & Alexander,
>>>>
>>>> Apologies for interrupting again.
>>>>
>>>> As the TGU hardware plays an important role in Qualcomm tracing 
>>>> design, I
>>>> would greatly appreciate it if you could kindly take some time to 
>>>> review
>>>> this at your earliest convenience.
>>> The merge window _just_ closed, please give us a chance to catch up.
>>>
>>> Also, why us?  Surely you have other reviewers for this code, right?
>>
>> Hi Greg,
>>
>> Understood, thanks for letting us know.
>>
>> Regarding your question: since this introduces a new 
>> drivers/hwtracing/ qcom directory, there is no existing maintainer 
>> for it.
>> Given your scope (and Alexander's), we believe you are the most 
>> relevant reviewers.
>>
>> The reason for creating the qcom directory is as follows:
>>
>> /We previously tried to upstream this driver under drivers/hwtracing/ 
>> coresight,/
>> /but it was not accepted as it is considered Qualcomm-specific and 
>> not tightly/
>> /coupled with the CoreSight subsystem. Based on this feedback, we are 
>
> Some clarification here: This device is not CoreSight  so we denied
> keeping this under drivers/hwtracing/coresight/ - Not because it is 
> Qualcomm specific. We have TPDM, TPDA, TnoC devices under the coresight
> subsystem, which are all Qualcomm specific for e.g.
>
> That said, there are other drivers in drivers/hwtracing/ which I usually
> merge and push to Greg, after some reviews/acks from the respective
> people (e.g., PTT HiSilicon PCIe Tune and Trace).
>
> But, your proposal was that there were other maintainers for your new 
> subtree and you were going to push this via ,linux-arm-msm ? to which I
> didn't have any objections.
>
> That said, I am fine with pushing this to Greg via the CoreSight pull
> requests (similar to Hisilicon PTT driver), but would need someone to
> Maintain/Review the driver (with entries in MAINTAINERS, similar to
> PTT).
>
>
> Thoughts ?
Hi Suzuki,

Thank you for your constructive feedback in helping us move this patch 
forward.
As the owner of this driver, together with Jie Gan (who has extensive 
review experience), we will be responsible for the maintenance and 
review going forward.
The MAINTAINERS update will be included in the next TGU release.

Feel free to share any additional comments.

Thanks,
Songwei
>
> Kind regards
> Suzuki
>
>
>
>> exploring/
>> /a dedicated drivers/hwtracing/qcom directory, similar to intel_th, 
>> to better/
>> /support this and future Qualcomm hwtracing drivers./
>>
>> More details can be found in “[PATCH v14 0/7] -- Why we are proposing 
>> this”.
>>
>> Thanks,
>> Songwei
>>
>>>
>>> thanks,
>>>
>>> greg k-h
>
