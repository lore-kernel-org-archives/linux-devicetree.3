Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F639EB7C
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886103; cv=none; b=CvDZ1jqp7vyJfoJfqMgQfcoRs+6g/XtdHSkf0oYhclM3pd0DyK3usACYeSRKRSPWCC5xTC5i7E2scuMM2MGmGM/4ZwqqGObyPk2MpTGXx80xkOkx+KctEVtbkz42S8n2YcJX4DGxrD05c6wmlOyODPvOUPnCQPpkJCVea4MGY4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886103; c=relaxed/simple;
	bh=vBuWnvtzMvrDmeyEogrGTe7W0secwvLtSQTRM8HkCP4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UzmNHJmrqWnpe3vZ2JqRvaRzCqBiiGzI38276mIJkf+K4RIdw0XYJmXDcwTC+LiJ6t63PGBqALvGsLQOciC/zhGUWEKzbTURs/B1yMfoP/qd86ZUPgg7VaKfP+OjVzP6zrCp4J/8Lg0WyO1uEqQir1SVyop4K+NDVP7PTIyHKuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYIfQ9ls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXdH9xyF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYIfQ9ls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXdH9xyF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lXop025781
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 06:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=; b=CYIfQ9lsAw5/cTEO
	1n201Gl1zCy4ZOigz9S+E8V8B9IIR1fzed/x8bMvFM384f1/7dJNGI0tZFHeOnaY
	SqaLjvRpllfLIV1FV9h9jtMys5RRqdEw5FeLPw4mbII8Xa0eXQgkE79U2sJugKVB
	+NkQSFCvP6J0t7Lnptj6rBPmFupWVunwbrulFySwvHvQ4kkHEnjJlzGcatoq1hvh
	fAejf1G+9zv6bxGhte/E3huia80acteUMFn2RzLhcC4EepXBNfOPGwCHUsIqyZeW
	n19guOlhI56/wisx0CtpDiyVTbp96u14nL0nAw9vGVBGNVYjXvWJwtGYf8qMcR4X
	I75low==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd3194-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:08:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847ac21582cso394807b3a.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 23:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782886099; x=1783490899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=;
        b=CXdH9xyFYoGxO30ha7edjh7HRQac0OXalggiQE0ddTUxSYZrL6mNg/DTxmtBlMsiU+
         C5IU6rB066uq7bZpDdJEOJH6xbVwVm0TY9GwioFpL3Zq888/W7bSFBq1qw1LqXKIXQ/0
         dfi25ZTO2bFUBbRh/J+947kyYhTx0huFYhEa/LgjOQwOIlg6bf2neh4kaOPSC/6aVBLx
         kYk9vAuG98dbeyOVaWdNFLxKE1TZCML47OY46TOVi2SLcQm/T33cps5kQVyH4FAXCqEP
         5XmyLk3p9uFFvegbm4cLLvLQ1iEZvM6e487f2SUl1MP/Ol8rJlV7dmyruhgl+5Q+9oU3
         UQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886099; x=1783490899;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofou19QbyrdcTBD9IzbCWECuazAfQMESoAqczJbChhE=;
        b=g3GlngNAsgLaRBW9xaIjiJoH3SM0L1L0b4+ToteC2MKHkKdD6dF8eu8iOH0tB/Gzz5
         bOmhd2JU6Xk+Sy77SauJC2UENfsI0iUO6ZckTmBSGdXKUSam3xs84Sycco3ZXVys4H4I
         X/EbKJ/ODUYlbr8V7+rO1csztcFqPtc18sy4qqU4ik4qA04A3U99SgiI9qCHABVt+5qY
         Z+vGWkJOTNs6/npsLmxYs+TqwzmGKf1b6eghNVdD8W3O6nwW/R2frlPCB6qu/kHmQw7n
         ArSt1rra+eozY6jBvFbTrkbAWQW+r0Je9XdxyHcEWhXEJlXHapf2+TCvacfTD/VFJTP/
         RMzA==
X-Forwarded-Encrypted: i=1; AHgh+RpEAIViVB8Xxh8DHVyG+1T65CgvAgZ1qO5D9fX7bQqmRgLYyjdAJsxmMbA2ULJicltmMb9DsbKPpPqv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4di0TgDzkwpV6fIYd1OcgL8/NfTSSTLnXCnr0L6ZdtJgBAK4/
	BAT+OXb5Df/PlHkDtZpGuGGq+nFynbHal3Sw2gAE4JJnYgQFTMjeUJJU6FRKnGb18mzoeBTNc0S
	18X0IQIuC153RD03wxMX5E5PEIqjKso4xJxmrnP7zAjC0S5q87bMQsE4RGOcK3FJC
X-Gm-Gg: AfdE7clT4oPWXUrOU3a6vUb0zFx7tqnTPgQxxwOvIDFgOH+kTwVNbY4e8G8MvPQAaZY
	x2I6TE1TfKXPrn8ExhfVY/N6eSUh/z0UN0iL7mJR2RI9oGI08EHseOhvgcFvHjZrE26DuryePHq
	JSMeYAAc+RywlM1q5CoXbB4EUFg5balfYL9LiURDwgfx2MHnxIsIpTZSS5/TKPDJ254rhGN4fcf
	hCBaw7KU0aHn7yo234uJZ96xgHfYsF2A/CxMBHsXfyBCmXy4ZttnQZdzYc6Wf0eIF8tYMb2mYcr
	AV0aXeGZpn+oIPe664OKvan1EjPm+KORoT2QGOrA2bsQ/x4xZiBPtyX/S1RDu6V/UQTsLYl9wiZ
	bp0pKLhE5H4GQ7oFWNuebi3thA7MeHT2dVsWCQcyYZxDTMHW14farrcKXKsk0voRjC8yMAbp5dA
	kwhMozDlA=
X-Received: by 2002:a05:6a00:4f82:b0:847:6ff4:da97 with SMTP id d2e1a72fcca58-847c0a2353cmr178441b3a.61.1782886098583;
        Tue, 30 Jun 2026 23:08:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:847:6ff4:da97 with SMTP id d2e1a72fcca58-847c0a2353cmr178414b3a.61.1782886098098;
        Tue, 30 Jun 2026 23:08:18 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fcfacafsm3318955b3a.0.2026.06.30.23.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 23:08:17 -0700 (PDT)
Message-ID: <ad5b766c-acde-4056-9328-f95f945d2f11@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:04:55 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>
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
 <e7d83356-c9cc-4324-a65e-fda3bd27af76@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e7d83356-c9cc-4324-a65e-fda3bd27af76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX0tjegMsjrB5V
 kJAs7iNO/uB8j7ZU9gPFJ7HrKNl+BIem5qqZIhSxqoU0qLz3RqDynW8FtICFlPpeEvMr/kQY7Og
 i5NMxMM+cW6DkG6yST4ZPwBaKHpOiJ8=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44aed3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7OR0-vqQ_RDJhF54Gb0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 5quOuP6uMN1jB0fkcN1hb2wAOTZF2Ydp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX/I07RTBy6vZR
 okJSr16u6vDVmD0xjIrDloOrJSDTI0f0CkNout3++vbRxPF33OyTb16rVtr88iLzL/m9KmDl/5J
 PXkVzzCew5IDa3iBHhE1UAIYNPG9ZK+m6CjIi4CTsj1hWJYnJTwPeeol4TydFcHmCTDeD7jE44Q
 q9lHhDCZfhTgu+przl9xcy8iAgrt6dK3cCSRuC3OK3kKQTWmVur2cMCAremUwv6wBUbF2cTx18q
 Ib7Ee50zgHuvFqpfO73joPcyajFEreRUd3nq+CYd8cE85bEdSc/bL8ZIoTtwEnKfQZTV/Akr6Hr
 8aPNM1WjaI4e3lsGD3rfZUgCFm5Jd4VNX0MEnRVoG4AYfTvO4BMm3oYjx0W1ATbQfdjlB3dnGXM
 vH5/ly7jgq7S70p087PfpTGGe8pdVMCpJ56cBO/aaUvJG/D+ahD8swzP9vzXvp4ttU33kZnFXx1
 MBxmygJQYYMZZyg8VBA==
X-Proofpoint-GUID: 5quOuP6uMN1jB0fkcN1hb2wAOTZF2Ydp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010061


On 6/30/2026 3:59 PM, Songwei.Chai wrote:
>
>
> On 6/29/2026 6:44 PM, Suzuki K Poulose wrote:
>> Hello,
>>
>> On 29/06/2026 11:17, Songwei.Chai wrote:
>>>
>>> On 6/29/2026 12:22 PM, Greg KH wrote:
>>>> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>>>>> Hi Greg & Alexander,
>>>>>
>>>>> Apologies for interrupting again.
>>>>>
>>>>> As the TGU hardware plays an important role in Qualcomm tracing 
>>>>> design, I
>>>>> would greatly appreciate it if you could kindly take some time to 
>>>>> review
>>>>> this at your earliest convenience.
>>>> The merge window _just_ closed, please give us a chance to catch up.
>>>>
>>>> Also, why us?  Surely you have other reviewers for this code, right?
>>>
>>> Hi Greg,
>>>
>>> Understood, thanks for letting us know.
>>>
>>> Regarding your question: since this introduces a new 
>>> drivers/hwtracing/ qcom directory, there is no existing maintainer 
>>> for it.
>>> Given your scope (and Alexander's), we believe you are the most 
>>> relevant reviewers.
>>>
>>> The reason for creating the qcom directory is as follows:
>>>
>>> /We previously tried to upstream this driver under 
>>> drivers/hwtracing/ coresight,/
>>> /but it was not accepted as it is considered Qualcomm-specific and 
>>> not tightly/
>>> /coupled with the CoreSight subsystem. Based on this feedback, we are 
>>
>> Some clarification here: This device is not CoreSight  so we denied
>> keeping this under drivers/hwtracing/coresight/ - Not because it is 
>> Qualcomm specific. We have TPDM, TPDA, TnoC devices under the coresight
>> subsystem, which are all Qualcomm specific for e.g.
>>
>> That said, there are other drivers in drivers/hwtracing/ which I usually
>> merge and push to Greg, after some reviews/acks from the respective
>> people (e.g., PTT HiSilicon PCIe Tune and Trace).
>>
>> But, your proposal was that there were other maintainers for your new 
>> subtree and you were going to push this via ,linux-arm-msm ? to which I
>> didn't have any objections.
>>
>> That said, I am fine with pushing this to Greg via the CoreSight pull
>> requests (similar to Hisilicon PTT driver), but would need someone to
>> Maintain/Review the driver (with entries in MAINTAINERS, similar to
>> PTT).
>>
>>
>> Thoughts ?
>
> Hi Suzuki,
>
> Thank you for your constructive feedback in helping us move this patch 
> forward.
> As the owner of this driver, together with Jie Gan (who has extensive 
> review experience), we will be responsible for the maintenance and 
> review going forward.
> I will also include the MAINTAINERS update in the next TGU release.
>
> Please feel free to share any further comments or suggestions.
>
> Thanks,
> Songwei
>
Hi Suzuki,

In the latest TGU Patch series (V15), I have also added you as a 
maintainer so that you will be notified of any new drivers under 
drivers/hwtracing/qcom.

The review responsibilities will be handled by Jie and myself.

Thanks,

Songwei

>>
>> Kind regards
>> Suzuki
>>
>>
>>
>>> exploring/
>>> /a dedicated drivers/hwtracing/qcom directory, similar to intel_th, 
>>> to better/
>>> /support this and future Qualcomm hwtracing drivers./
>>>
>>> More details can be found in “[PATCH v14 0/7] -- Why we are 
>>> proposing this”.
>>>
>>> Thanks,
>>> Songwei
>>>
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>
