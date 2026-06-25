Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D4379EE1
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378398; cv=none; b=N5Jk2Vm/S8ZUBgIZ+wzkkRBezw47kO73LzrwS8t3EXT6OuSUEmq0+7QmM3FlxEsK65LrbK9K2w3/bw8qF01GbjyB8vR16z7QB7asBx3QTPwbnnmwb7BxTVgZmNGYGuEYrVapyWGSaqfKjfZa3D4EAAooR0EYQfVkk9iGsdPRRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378398; c=relaxed/simple;
	bh=pp9eaPjv9rnptr1WI20Uc/j6CcRHM7bBBfaRB0Z2w1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JaBezCuX0GCwdlEhZH/akXYS+bkuoNvIXOik2MqL3gx4oRkyH3QGjYlujmDdRn7dOhOznn7vLnxvDEt7BBe+9PDT1Yw8FITljFpC34hcBxtJdWs8RbpGJ2Vt+S9AbEEVW3Koj3abc/5f4at3rd+2UML7LNI4wDhd8vFtmHtaRcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHSS0zPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORvd5kcO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHSS0zPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORvd5kcO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p65e2951483
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=; b=VHSS0zPKAZ5zHAO7
	ZIgPyJNV9RROWn6xI9xkYojFGHCr+CYAvDwq3DwDbnE6mzB4K3fnJpdJsjPx30f5
	Mm7ne3afzR3iq3QzfVgc9LuZ6nAIqmGUTIM1NYlJ6lznQmy2SvAIx1KgLG1Pi2HR
	5cwj8dUH/l6z4FpBTCqrha/Q3eTTOQDkR1lF9gENtaQZryP09B/+5l5+kc3SsNnX
	GMIR1xlV7rD51ARgKtGnNfLYwYo0AEnG8dh+/Q8feKVEQFcnKhHgTb7P8wePJxUZ
	BhQQBQ16qH5bwsxFOWefyKZv5ofFN8waXO9m1hVTfFD0s66KFG8IPCoDSH6sfzww
	xG0BPg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynrccf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:06:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845ba254a4fso218444b3a.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378396; x=1782983196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=;
        b=ORvd5kcOsbBG388ldSB43xKv+240uEYl1TRk+PQhPx7rltvyccz720TMtkz2s5J2sZ
         rUnY3pHoSI8R3c7pN3gU9K1DM/JMZBrafFgoZSI0yHAWOKPlsKysttkZZQIzplwXIRu3
         3wMkcJgbdoxGcTeAHDc0lgxpgOMC8GTN/lMWZSSwG0z30SHBkrVi7ucODV1gp2mCj0ck
         pfUcitieJDxTDlbBMF6RHqKLBgE7d2PdRjhBHxVxodUKZHtXdOw1M4m44SXSUui61TXa
         ZBtxtK8LMTPaE3U6fJKQCsGgeL8+ypoH1c+epYeL5cxiNCN0zN3ugCqrt5Jku7T8MOaV
         jldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378396; x=1782983196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=;
        b=YuWmV4fI9dgCJuvsaHVEl5rN3+WEcmU/vuqKzDQOCDGBGNIWORHc8yOIRa6UMuREHG
         c8KJgPlUK1oNiqGKjoHsRaPEnv1bOaaED4kqp4PcBOLTEAU0dnuB8Nli/zRO2WML0FPA
         1pBroFu3p3w41Z2QB7VdVdRq3vorvBABWTtCjLfwEu78ffxKV+fPg36AXioqA60R6hiy
         WA7mRpRRq7PIUfpB+8aH89vBarZpT8jEchMsSOQSDM8zHQ7qdOCgWSFsX3r1lNEL2unX
         6ZICkxx8Sn96k5Sf1rpy9UY85L4opkL7+9duH5Y9okYbW0MoN4K+mYEdmJY9ghe97jp0
         XG9A==
X-Forwarded-Encrypted: i=1; AHgh+Rru6uPTp8blzOk7O5Ht+yMvNhQ6bvdl8pBsd8fGDMfAQ/cLK1ZDqO+4ci0oXonAfZqycq42GNc1XFrl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6QosHWM6FgdRE5x+pZQZhfh7M8vQQmRbImQH2VuYPzCppc/A
	tPjX+9AYycBSccVkgEXxE2iy4Pwi75GBZWXjPOdh3Hl9mP1UpDrxnL3gsNgLk1kFHwu4Ae3oyvC
	kMiHxNxGI5iiMkjHu2nbdrVwRRRBtqm9QhtKRwZ4UVkB81n8MJhvY46cr4dqV36sI
X-Gm-Gg: AfdE7cl59SgW3JpU0ez/RqEmTURKJ4hZQAeZY7q6PX+OxenTzwqFMcdFPtXNesZDIKW
	+cFleRFN4YNXPPpQTXDXr1HImOiTXzgr1YWNpzoBlNFALHnKYrtoxJOrW7WZ6ZW+yO+A5C1CoDy
	uRDo3lXM3Z7d/HgxZEiA/vNPwwVgioc3uMXD31h6VrZYMUZ5gMltvIQ3VmQS3GRXxa+EHHrc+aP
	KNT3Y2nRh8x6S+WV9wN+oU1OjWnAvjh5Omlt9LvAkUtkvmg/5AvLbvvfKUaSG9GDeUZbimVXcTa
	V+oUoPwMH2R5Q3obmgr8p7DP+8rhr3slVspIa3FYLkBqor75GupIuRGwTdsNUGdHc02ppf0k8CA
	ptb0nFhOsTJejULdBwr3gXJTBmqj4OgVA5nvhPPMF+Pz2
X-Received: by 2002:a05:6a00:744d:b0:845:b3ca:2cac with SMTP id d2e1a72fcca58-845b3ca316emr1705603b3a.2.1782378395733;
        Thu, 25 Jun 2026 02:06:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:744d:b0:845:b3ca:2cac with SMTP id d2e1a72fcca58-845b3ca316emr1705352b3a.2.1782378391573;
        Thu, 25 Jun 2026 02:06:31 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d1b0fsm4240804b3a.28.2026.06.25.02.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:06:30 -0700 (PDT)
Message-ID: <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:36:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
 <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3NyBTYWx0ZWRfX0clk7Z9qkSIk
 OvIRLCdvRPE5jxkBaLlN9FRWrLpkf3rsgh81/Pgd7WXjEccwj6T1Hs5Il+JcMkiqYImUyWE4Uhh
 2PS1r9W41E6v1+ueGLqaqt9rkP/JwLPVpjQ1jvXyDeQYMjGDQsabgxNOeS9GRrwFQkNlCwJR6jl
 JWs98r9FKjQLirIbhgJT38L0O3xdA5KJa0oBUTO/tpjp/EsG5la9M6KFGnM5tPm4jb42a96GBFR
 tujIzl8jyEdPrTKkTi1pOac5s1conUUeqGR9pLa4KL2qE7cYG5Gsa6EsMXDq2Tppma3JyulqWJJ
 tI/lzKhdqk3Ad/hZRKMfOf0ayBPO8TYb6oWYtJUVtcynYthVql5SYM1gFVEamC80vnBwNMfnaMT
 tpX+JZi0D+rjIqK5BbmsPXxl2NGRqdT3XqcI+QVMfUbKDXqx2z3acK7BfKPr9677stIyuh/DvuO
 +r6GRXlyza865MKmPxA==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3cef9c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hIrod8inOkKnRalxuPoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: vGeWeR9r41nIy-lzLFwhcS3JoT69AQG9
X-Proofpoint-GUID: vGeWeR9r41nIy-lzLFwhcS3JoT69AQG9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3NyBTYWx0ZWRfX9sa6lAco9G6i
 DiQBsFeVPuC2ItZ2SfP+lU9xHrr1ssTRmemxF0j2G4ulLWsdsLKa0ietgkEcy7y2hpcTy6JDaEG
 rMDxrPyInu0s5GLYR9qu8bHqby64pUo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250077

Hi Konrad, sorry for late response.

On 6/15/2026 5:12 PM, Konrad Dybcio wrote:
> On 6/15/26 6:25 AM, Pengyu Luo wrote:
>> On Mon, Jun 15, 2026 at 5:18 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>> also support GSI mode, which is highly preferred for certain
>>>> peripherals like SPI touchscreens to improve performance.
>>>>
>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>> the controller into GSI mode during initialization.
>>>
>>> Ideally, this should be decided by the SPI controller based on the
>>> requirements. Another option would be to prefer GSI for all transfers if
>>> it is available, ignoring the FIFO even if it is not disabled.
>>>
>>
>> I have read reviews. Can we check if the compatible
>> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
>> presented, then we enable GSI mode.
> 
> 
> This hunk is very odd:
> 
> /*
>   * in case of failure to get gpi dma channel, we can still do the
>   * FIFO mode, so fallthrough
>   */
> dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
> 
> In my understanding, GSI DMA mode is always preferable. +Mukesh, do
> you have any insights?
> 
GSI mode is preferable but if for some reason it fails, we try to 
continue with the FIFO mode. Just fallback mechanism.
> Konrad

