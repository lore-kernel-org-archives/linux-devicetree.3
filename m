Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF24483B4
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113884; cv=none; b=JQsNtmrlxZhJVwue/lbnOuPZt5YU/LnaaMZkGqW0baOLJJcamcZbahEE7L4xJqfZLzXy70ntUDeXJ7Wox/qmXeLRNHWzS+lCOgkYdvMB+R9p1m/CZoyD9KMseuhXgByst5/xypLLtf9L7ouDcQHKITeFYnF69VeatHorASENzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113884; c=relaxed/simple;
	bh=ED3ztITYFkjSftAVE3W9ZxSnMCOxdw3hbYaGKs/t4uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVmH2A51IRc3M7EQR/rg8IKL0oOsvsCQA62LN2nG//xGkd7EoKq2rImrPPyGfcoaa3UElRbi81x2/fDbVy2xzlpGMIxVxHckFO4iyGP4E+AhXyNlDyuaWANtlfP18dMoxZnGDXKqKcuBnKlCaYXDRT/jUpfJ+WPFX7r3LV3t2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opeyULVF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bitc66zR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opeyULVF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bitc66zR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FB8dpU457159
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3BsJrFbv7+93TR/LL0rpXgeZlETcEgAVF3/gxGRN4Y=; b=opeyULVFMtZk6RbK
	P4xC7bo7gP2GfIhG5np5HD4X32gOtxa9Y1udN4uCPMQHh9b582TqiJ4iouFbwQQI
	YoBnf1PTkK9/LmIhEO/aLSaJi1cjGuWPgdo4WJ7YGGLIneFevDYnpWoktrBhKYdl
	FZP2n+TSyNkd3yTRER6w3kan8Ignc8Ifv9PBl7U7+fuwvmLEg9TsVTGQz9dN8OQ9
	xkVjNmOKaskv8FUu5cHUbE5yPaH6lN2VUH0iv5bPq6RRnzUcZqeWPYymU5tpDE73
	fZprfd7/ArjG2GRiRjJDTEQ+Pfeqb7riY5hBRPZ+zOOYrcklttIKp7SGXMr4DXKV
	jTU2Mg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrr8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:11:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4ecd1ae4so88516385a.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784113881; x=1784718681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T3BsJrFbv7+93TR/LL0rpXgeZlETcEgAVF3/gxGRN4Y=;
        b=Bitc66zR9uBBtDRmg7+NEv63a9VKHauE4bcIhnqbyLSwT1uiZuVrtYQY4c/SGnwqov
         IsT48CT7VoCQkYEXUEzfJjyFwuQ+W3eo+BmJX1ihQUKZs0TSoIciMlldMoALlJdBXczE
         SaBo1pqE4CJH6l/hsABRPPX0eY7NR3TfmV92yVXZe1GTsksbD4mkDwAs2zIIkbPEpJht
         ydmrVHMwAJydGaVZMGguwOv3BiPEtqVKzm+ub6Davabt/+2jDOurwAsP4HW790N30ueg
         W/j8WV1s2ee8wxTcPXa0Le4jJagNQCUY2jL29CepdnNFXOqSgJLtwuN/gcYGHG/X+ifw
         GkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113881; x=1784718681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3BsJrFbv7+93TR/LL0rpXgeZlETcEgAVF3/gxGRN4Y=;
        b=hJubIvBgkZFAaHRJLu+K7ZdzpD++3SkmYGvoMQ4ngMIZUmgr+oK/6ohGxqOZv/Dxas
         FRNXwPgF6U0BMehaaTfxQJOU0rN0mJ3HUIHtmHx2Xk+d/8iapZzND3HJbxeyYJ9JXNhH
         sjAjy1ddtkpZkxoBIlF/dq98gTeSCmj0bGK14n/T+K0JQw7yyAz8IV2VgkUOmX1mYBi4
         xp7He0JeNAFtloPBrvvYGrF0HRxbGmMUePcEYoU9CelMItlRvNjC+NwbP3edfyBaPL4V
         +N4MIq0UqT3yhgnBxvr+lRJNTDBYsz9WCkJZhHbc893k0kFewkmDAMKrONDGblvh3OkH
         nLeA==
X-Forwarded-Encrypted: i=1; AHgh+RoCOxXDNV+zowl7H/dSDxWAbSAL6VKjFaC/jTpTh40KXGj1JZjZ2gxbw4V8PekTuIgenRooFW9zV4Ou@vger.kernel.org
X-Gm-Message-State: AOJu0YzhdRAMSMN9zju6oueJhYt3Hs7rAHSlVAVSXHaHH8+Y0qQoPDHx
	nxyesnly6q+z4h7Wf0yh8/Vas2fnMsO5ltMzN8kVgDROkIiv1YHI82zNbNas6vdUtyNPB7at2Lg
	/qYkSqEIOUnvwHN1I6gNSmThku8zv1fKDk6LtooScsHb+pNXmpzzo5eIQqZHhCBhv
X-Gm-Gg: AfdE7cmo+3p1mwfnYdJ0DRFgGVxkOOVz6QY7URGcDluGSKJpBIwQkRYCtziSygYizfV
	9Cfo+fEPANsQvGEHcegxERPM4WT/KjmGCOzlgJKYgUG2kh8XdCKfOHy8l3MBGhCt4q++bQEa+B7
	5WYuJ53E6gdodEifDD2ThX7Ld0VdGiK5RLB15zbq5m9TnhxQKBkYYvgD942o9YLqDyxv+MuoqWa
	Tr+kE5nEBFdIlBdMHvYNxkbB2j1bSmSxYMhkya1wBk6JTYWQnRdu6C/ygJ/i2RmFnuNpH8bVskx
	r1fK/YYBIpbUCBoQPelQhyVUV8Oe6bqI6k79+RJTbAEMJ7YnXxOCgRMe9P3jZanl6F/83ZxnnOK
	mFlXNpKZeQN/TbJ5q/y86y6Ip33ocV4LmF+w=
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr1181436785a.7.1784113881423;
        Wed, 15 Jul 2026 04:11:21 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr1181434985a.7.1784113881036;
        Wed, 15 Jul 2026 04:11:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871b3dfasm6877666b.28.2026.07.15.04.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 04:11:19 -0700 (PDT)
Message-ID: <973c1b29-091b-4cad-a066-4f0bdee2750a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:11:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
 <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
 <aldlu-Qdf_T9uwbf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aldlu-Qdf_T9uwbf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GeIVW_ASlxMGP6tEIIIxhx8M9n6PqXJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwOSBTYWx0ZWRfXxPZvq7+Mk/Lg
 51RVEX2NpodxP4WrGPwd1lDXn+Cw8aYouP1GQ+4KLPXfM6RTAv9rz4T1LKh6Ya5J3kj5Awn5WXW
 1SwjOWzUX8k22Yo1wVgH8iMHFXt2A43deVaHCKV5A87ikgU2GhAh1Md+Ol6SCRc9kbznCRDfupk
 6kJ8LGbh0EvrIcvyzf5m5Gwg0shMx9vsFo2b3Pi6h/F3+XIo2AzrVK6Vo5E00r0VF3C+//vHxPW
 IWUL3CPSawGy7LlDsdHkrf6DonXXso73QcOfRMPLVa1oQsSBoV4Flo14Cd1B7YCDmMAtC4kfA7e
 5TzAaU3VK1aTBqmDur4qZktV2qLQkapnajac6DdNzM4NbrFdkfLsSS4/dBZpyB/zeOeZe/DyrqZ
 C+vnEI2TG6uc6cArOeWF2RbQUbnB9bOIyx2GmdNYJbWnY7JF6FbmyzBccgMMcEFEV6MfMfTuZwW
 ljZcNphbFr2qlawdSHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwOSBTYWx0ZWRfX6YkLyRVhGYfh
 1h51ROI9RKyRKr8C+RU92pRDgpoYnEIWQ5UR+R6diC6HUD3UNao2qa7651X1VmZQqTy154AIf87
 dWP93wPFF/IqqNqSrNdi4/lI85WfXgc=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a576ada cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4pV_bLEqcG6om8-7b5EA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GeIVW_ASlxMGP6tEIIIxhx8M9n6PqXJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150109

On 7/15/26 12:49 PM, Stephan Gerhold wrote:
> On Wed, Jul 15, 2026 at 12:45:48PM +0200, Konrad Dybcio wrote:
>> On 7/15/26 12:34 PM, Stephan Gerhold wrote:
>>> On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
>>>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>>>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>>>>> the latest wake up capable interrupts when the CPU cluster is entering the
>>>>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>>>>> implemented as .power_off() callback by registering MPM as parent power
>>>>> domain to CPU cluster.

[...]

>>> We probably do need some fallback for the old sm6375/agatii DTBs though.
>>
>> The sleep logic doesn't really matter without the platforms hitting a
>> specific power state anyway, so I'm not sure we actually have to (i.e.
>> the regressed path can't be exercised today anyway)
>>
> 
> So are you saying the MPM is currently assigned as parent to some dummy
> idle states in sm6375/agatti.dtsi, which aren't actually triggering APSS
> shutdown? Or is it just irrelevant because other power resources keep
> the whole platform on (RPM clocks etc)?
> 
> If it's the latter, the question is if we might end up fixing that some
> day without further device tree changes. :')

I wouldn't call them dummy, but I'm not 100% sure they can trigger cxpc
entry..

The latter most likely also applies, although that's based on a guess

Konrad
