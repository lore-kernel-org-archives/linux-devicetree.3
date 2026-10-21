Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614838;
	b=VvWHEpKcmXz2vPnhx5cNzHvZ6FIgs419PUe/NviVCiPV0Veb41lC9hXMsdwnttorRlcC
	 ngiTHyRyugXvlVFswP6ylkI5BEsDMZgtHmJTIe30Qus6VEkDbRCAcbI4ceX832SaHnSsk
	 9CFsY7BKhEGdDCS2icQ2KC1ecIUI9TF6Jt6GUXWStsKM0qaOxgKgCUPkP7kijIcT0fOp5
	 ORy4VFrSX8XD4GQ33Ik6qa3DCfDo1oZpndmWJbE7u4M+5zqUglJH5A1UwpQUpaABMatZJ
	 DOr0N3Mz8+I6WrU7cnOwraHEtR7UOqfyQb8N547VXNKTG5Gsbz+abt5SsiAxaUFYKbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
	b=tD4MGLip2e9MjZWC4PDGfe340G7ak9uYBjGEp/dz8OzhQqfXZzw27jDus/z8Jgz8s80A
	 zyg4DlEEnH94FVWNDwSL78Ez/ahnJh5nP21Ct7s6I/RY89y38omV2RqTDWQHK+GuIeUqn
	 0FXTTz8ahnVUd4pCKhPDXdVjB01CN1B1UBUmlO0Sw83VEKANTAucniXiZ2AseW4FIirIV
	 GXAYuMUbDRoe8QmNd3jgt8c32b/1JH20X4bhBl1SiH+J8S56/PCMG6/eNmYc87C/B7cyK
	 dzBqMqwb59pH0duL9txe0CK2p7MC/0Dkpip863cn47B1alkQ4kfCLt6umiGneGbI1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1GCox7h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdbjUuwk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF6606A326
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 20:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1GCox7h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdbjUuwk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHpN1B996455
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 20:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=; b=P1GCox7hGAIm/O10
	RkUKDcUdwgBtJh5DEYYKv2HJLQFB7IZ6yjgwRq3u+8yogg44VxbugAedosyDvBlh
	f4S95RgA3DUHI3BYMv7lUVAdEqXn2SHk2nYSxleKRHWja2aLoVpu/KdGw0QSR7Rf
	OnBKGSwq00QT8XUJ6J0xPbGNMsXaeqMLzZ6+Zvs+FQOPrL8kq0bTv6Dz+oMKphns
	D+olk46YyJ4BJCqWT91yUwNmbtYbvU/n0vYB3TMWur7D+P7DlzZZy0Z8IrYZCtum
	XMyXmoU46tAriNOpJzKgExr02iNrdV7Hq5uP+NKf4fI6VFnmXruwzacR2w32ELJZ
	nO4BNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vsrnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 20:33:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so236171485a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792614835; x=1793219635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
        b=RdbjUuwkP68wlv3KlKj+BEX+ODK1v6F3OgVoh6qRfdlfBtdxLxZ1Mf8P5eNIMw0APU
         FrHq3xDtGpW5segmUAdyuaz6EkhK4kkofM3DKNfYrZ6acyY1smsiD4fBNK+BKfwasOQz
         4hm/dxmtvQGEbMh2jT9axYGXBuH/ZtWKBx6AqZaYgAx5ElB/ZCpkL3HOgdZh1R7IsmZG
         UsfcuELITGi/ag669QUeKeinfMx2r3MTUeRAM7yVl0ClCn8QZZzWdm3PdV39seKz+kUM
         UnaqWhfCFemxi6UDwzGvH1OTi7P9EVKMUcLRUXnG1ACZ4819wYJkKyW1VI5hRkgHQ9VG
         6rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792614835; x=1793219635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ych/Zf08x28o9LLrYkYPAjNwcDM5guKZUT1kj8rPdFI=;
        b=RYrh8b7I5YlVt+fagJAeeaHCOXIGz/Cf+/+KtekUc6Dy74/kZa0mmuNR5zCPpShCbb
         BYARm1AwYIiWx3h+g8MbGi06+pVfpBRZl811UBhHXrLB045sHTCXEJujKjv2JfDaVqvs
         QJo2Cx5OJJj4/+4vDtCUyOgrXyMi9bMPPl4ENlTMHCWmNx8aM2fX+sjv8x4/pTujZmRq
         mQwzh2Hj/99/ONsaRkQhi8dVHwl55xSkJEx9Z/8AxoKvoRIFuqbDeRTOLNtjwm0vL1cI
         6OzdT2YT9//fzKFQWhWrupp+lYUTdg/WHtUMAx/klQNkGmi9cJLdcMVaz0jo8BN5yfld
         O/Gg==
X-Forwarded-Encrypted: i=1; AKwUvBw4fpckn/GTGFJuk5wfHIwbB+sIhllGuIkZlNurgqNoBgtFkPpWIdIFS1QH7kux83YQE7ixvoEKCF5w@vger.kernel.org
X-Gm-Message-State: AFq9FYLf2731pEVDcOmXjcKbVSwFitRYrGPuAQGdzmg2qy+460ERGKDl
	fRJhZJrvlkhiEpD/Y5ucmLdPDVhy0A4IQ5HmeqtWJW30x2l525xeiovV+fdw9gUBA5MhuCRHnar
	fznKvnxm6ddBfP9BNyRMy6Jf2Ga98XotqV/jsmh9Lb35iAv72kwhFQaEpedvC8X5+
X-Gm-Gg: AYBFou3kTdyaEqmFcL6bWrPr+KcaTtWpieaTKAVKYCeDLa/HpvohPkhy6h2cxFhYFeF
	SsOekLciWJo0VntmWoNkiQ2+0/+2eo9IljTuPDjwhwut7dxmz5UCOEIM/7I51h0KAZuInYJSrsx
	4N+Y1RkYFWtCCAJ0HEYgi55dOleQ3vxukE3B0YHu4Mzdf8ip28hhnzJBNIID2JlGrElVqv1akxe
	OtRb+G8g/OF/r6jJGkIUY7ipuobVG0MzWozelPo9eJFU+ZsWn9TE6qikGDrCcL5fAe4yNbNzas9
	L7QW3hDITDiGCfOIwoEjH7dRF2oBRO2QaAXIxRK7WuSFLsbYwewfcRtq5yIArhrTJXaA9DWUeRQ
	W35Rfz2lKl1JYFMyCMDM1os7h0H76wQJ/uLEuL1QsaxlkkNG+62TL6e+wgUJ4rw==
X-Received: by 2002:a05:620a:6605:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93f57f9c47bmr614752485a.48.1792614834746;
        Wed, 21 Oct 2026 13:33:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6605:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93f57f9c47bmr614747785a.48.1792614834122;
        Wed, 21 Oct 2026 13:33:54 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3887:4025:a805:2ac9? ([2a05:6e02:1041:c10:3887:4025:a805:2ac9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254ef1bfsm8068153f8f.6.2026.10.21.13.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:33:53 -0700 (PDT)
Message-ID: <912b3de9-cb81-4d90-9d2c-9b99297e2645@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 22:33:52 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>, konradybcio@kernel.org
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        johannes.goede@oss.qualcomm.com, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
 <ath8tHxHOdA7G-Bx@linaro.org>
 <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>
 <atjy8ZVUW61VBa26@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <atjy8ZVUW61VBa26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RJ3tJS9PrLTZijvTtmBnln0J38idanC7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MSBTYWx0ZWRfX2979Osb9P8pS
 iMqo0GahXcCLUth4Hirjbgsg5qX0EjhUkLWxoqTkK/6fUVy35GnA3C+jxjMWbWIwbXV8P4jTGW5
 ElVN8Jj1O9txm6kda0O3PvKsfgh0Z5c=
X-Proofpoint-GUID: RJ3tJS9PrLTZijvTtmBnln0J38idanC7
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad921b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=DpSQHuFe0l2nUacwF_0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MSBTYWx0ZWRfX2YYtFdZSpWws
 HyakO4DXYlAwaVSQc5Ta58N/m8WKra0Gdnhu5HDBCwHUgMsQGPxf5bqx8aezuGNGAbGXjT2CpUl
 6UhrRA9ooPWZcsZ/qRURkZhHJwqg4XlxAAjYZyM1DrL0epj2C1SFc9TOkjKNiAbyghrBbEHuYXA
 evzmsQR0n5Kp0PXh2LVOXPvp33xtV9NxJ/KOCXZPpnaCKgzBe/YnAbdjrXi1ATQJ+g07lVvPm3B
 tmS9J3Pd9/W6kfhur8BktOvivtBc/MU5hL9wKJjn5ndcUCZQHrh7cibWTfFpfBcHFiaf2I3GErX
 Gws34wOdabFJh16qLl/Gkj6S1fqbL7e4wIzwZ3PtKvPmw/CGhLGvit+mYBOg8uesCYz8HEha1ww
 jV3a/eFPKqRmTUY/5GRg6VA19VcIWfriinGSF+EDJZ3II1QSElym2RtAHhZrkRQFEazU46pBqrz
 tcLN3HTe+vCnumxzKWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210081

On 10/21/26 19:14, Stephan Gerhold wrote:
> On Wed, Oct 21, 2026 at 06:20:55PM +0200, Daniel Lezcano wrote:
>> On 10/21/26 10:49, Stephan Gerhold wrote:
>>> On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
>>>>
>>>> Thanks Stephan for the additional information, that's very helpful.
>>>>
>>>> We currently have an urgent thermal issue on this platform, and getting this
>>>> thermal mitigation upstream is important to prevent overheating under
>>>> sustained workloads.
>>>>
>>>> Would it be acceptable to address the sensor naming and description
>>>> improvements in a follow-up patch, so that we can get the thermal protection
>>>> in place first?
>>>>
>>>> Of course, if any of these changes are critical for the correctness of the
>>>> thermal mitigation, we should address them now.
>>>>
>>>
>>> I have no intention to delay this patch. In fact, since I'm using the
>>> latest unmodified stable kernel on my T14s, I'm also suffering from
>>> these thermal issues. :-)
>>>
>>> On the other hand, we are at the beginning of the merge window and Bjorn
>>> is unlikely to queue patches until that ends. The changes that
>>> I suggested are purely cosmetic (the names of the thermal zones), there
>>> is no need to repeat the thermal validation. The throttling behavior
>>> will be identical no matter which name is used for the thermal zones.
>>>
>>> IMO we should use the remaining time until the merge window ends to
>>> correct the naming to avoid any confusion for people reading the patch
>>> once it lands.
>>
>> Ok, fair enough
>>
>> I propose the following names for the thermal zone:
>>
>>   dram-board-thermal
>>   gpu-board-thermal
>>   fan-board-thermal
>>   wwan-board-thermal
>>   chg-board-thermal
>>   cpu-board-thermal
>>   typec-board-thermal
>>
>> so we can capture with the name the ones related to the non-on-die sensors
>>
>> Sounds good ?
> 
> That works for me, I don't have a strong opinion about the naming (maybe
> @Konrad has?). I guess people reading this might mistakenly assume that
> these refer to separate "sub-boards" in the sense that there is a
> "mainboard", a "Type-C board", a "DRAM board", a "GPU board", etc.
> But I can't think of a better name either. :-)

Hmm, yes. That is a good a point

