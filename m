Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FF3322C6D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435877; cv=none; b=D5xBjDLYgkhNcfQ2wHsb0OPyW7627FPEcU9/P3W7ppL+KvEDLfBUZUwu5M4X+xj0QUevcxcrjaIx+8JsNRkbrwx2QonDR04+dbxtDc1f4S8gb6fmGPLiNUKQUn5GKs5Bp4pAorYD46gjvQqcs4/PjH3/8n80KbqWMqxjI7bEgp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435877; c=relaxed/simple;
	bh=RuEaLadIoZsuJyS6ZmkPuRWYcQxb5NYbj/XZuDX8dGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWhoU74Bjp37N55AS6Xq0Ex2gVlJvERxyixkVm6xVUoQip2+ZyP7z3APCQTXdpl9EuLiU0z2DJwblF3smv/6hfc4xEMqlJK9nT/gq6dXwn+Ymst+enAmonFohKJAFCsoWaFrZ5IO51mT8dhJwAUW+gPxcQl70hWC25EzJttRXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlLhrtPo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYeBleh0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlLhrtPo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYeBleh0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8tZi3749579
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 14:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=; b=PlLhrtPoG2XGfQwL
	4rgO+c1M5c+royndMjQkIioTQdMavHjNcypq+vUq47rfP+FlmO+bEW92DRQ/6/h+
	peu+r4mZroQNbvESHdytzd1uDAjopmuxY/VhQ86ericWxHiCfH/qvVDGm4TR5DiI
	FyQOCvHWQnPyvIwdYFF0rPgbx6/NO0/MD/KuCg77Yxpy1aEKrkkSR2nI6wXgnl/y
	VpXwQiJJdJXLNsr3fVbbUxnGcsPjYmuggY+wFekr/9si8wc8W9NSVPaLkuR8AASk
	mW5dBZsrHR66C/dZc3vaMGrq1DvbgvHINJHqr89lluvdjNT30tGmUhiJbtdiSFAh
	PORlpQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9yds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 14:51:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efc093d7e5so50151056d6.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783435872; x=1784040672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=;
        b=JYeBleh0+426zVSiRCQyuRwwDkO5P3PYrHpmolOIt7++DjBIs1CbuQvWipcY4NSBHz
         TQjHyxm6UtPwmWd4exfwb2wXc2Nwz/r5NcABpgInkhVXJCwbtnkCxdbqOzUh2m+mJGk9
         YsSajlkVHTest6hwlkKIeoj6zPB/ygnefI9uEAYoyT7ZI68EV7qwu2X5LPc0z5KuVcEV
         +xKnvn9Su5AEMDAc4HUr/7MCst1GwaEmeVjb+1ah7UbH73CauqBibc1j4V4Ro+M9KjfB
         VMpDnAP0OhiCRLXdeJ3HVslGXOlueVqvk1Nfue7BmtzujcNb6rflgh2qeJktZ3EZoE1S
         vYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435872; x=1784040672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=;
        b=KBldjZ4OKnr8ntUMtbe7jpv63EgT/VDpJaVxCvuKvd4635ht996WCq3DKuCIMzk9cY
         Qia6mGf6riycqx9T5bEQ9XiVhsEjmKet+T0J1J2MUOBIqw4tLuIo5EDLFAFZWYQYGVdI
         QidiZmrqRpVbSn3S5GvQDVSiE6qL84N/C3n95uidnwbeZM9siukKeTCpbqZyBt28fUN3
         48j6HUPIB2E9+9097ht+CUPOoK9IBeyeK9TFJd/ZleUK1yLyGD+82pUYb5q44KsTKBGN
         yjijU9Z5YvjdkInAas57zZMToOQ6uK1ZpCUrh3wvwn5BuUZikCE5yE3DZCLiI5JANgzs
         WS/w==
X-Forwarded-Encrypted: i=1; AHgh+RofbT9WCq2M/m4+LgdGVUMIh6eUY3LRhEgSUiAQr7U9tSPc+KXWVkm+MrZsBcPU9TRu80A4ZVyycdBb@vger.kernel.org
X-Gm-Message-State: AOJu0YzeAtHs3dUeodTyllW1MhxQbpxLzZMzaOPItBs4lnWjLFA1hHUQ
	Gj6FntWZ481IDv/mDY814/dipUpa0CzpZGBXytr6NkH97vLPAE0wRl96KLtEnHY0Q3qZYbxI6Qu
	mr8RykCcYbFW6Xj+cyna0rwO2UxuM7/nbFForkLOMNtmf7NDZy+Ma1Fak3XxTUSZl
X-Gm-Gg: AfdE7ckSgZG6R/ZHqM4cUOmwciLNU9vQBfGE+NnXj8SqtsY9hGWgOCxltGI6eCamOXD
	sNzo+kNRCD3wDvDdqBttAWtGKJLZ3ZuM/hscOzo+CkTWkJQ9brnZE0PXF4cniKDJz9B0VCemBUo
	pjB5+ZF3Y/m+bT7MuzBSnB//clgYgjNfxb6aj4/NGmbgwbh3X012lgVq3ycPN0Ywrs/08ZrTf34
	SElefQPtJFbXXxRhYupH6KbzY9yMVG5tWXBoX138GZ+019QQeJ+DOvdnoS6EBXrXTjumU8o9csZ
	X/MthKvoTXpV68BsdMCBLf+WnEsxQ+2dpqBgM318rjq16PWHnO/KWdmPfz0Jz8MQupEVP6/50au
	WtVzqaBtG3H8XF+buURNeiGFBLGpsri05RtCTem5zEjQ9YEzUARR1bbRrkiIffQWTG0YrdZfW1p
	T4tfRAeao=
X-Received: by 2002:ac8:7d51:0:b0:51a:8c9c:7f51 with SMTP id d75a77b69052e-51c748df6e7mr57992311cf.68.1783435868965;
        Tue, 07 Jul 2026 07:51:08 -0700 (PDT)
X-Received: by 2002:ac8:7d51:0:b0:51a:8c9c:7f51 with SMTP id d75a77b69052e-51c748df6e7mr57991801cf.68.1783435868305;
        Tue, 07 Jul 2026 07:51:08 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada05d4dsm156219366b.49.2026.07.07.07.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 07:51:07 -0700 (PDT)
Message-ID: <84f593f8-eb28-435f-9458-55aff899dc1a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 17:51:04 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
 <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
 <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d1260 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=MVBuJk07v-XTMpK2hJIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 2RXzSCSKnzanQI4bfNk7aYAZI9cIhITZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0NSBTYWx0ZWRfXwrnthj9Hofwx
 X+VaJwC2oDGVWXtg5KJdXqp9zD4zD9jwYWGiV2kSLlYeLjp3YDApGkbLgWp18InUsDlH/3teAZ5
 dQbQVmgc8C3I11Es8QPNM3gIC+xBtrBR0w8Vpbb7vumH9Aru4MFNjatCa0iSjFrcokgchiCRPgc
 JE9ZGMksK0r7jfRlh9AHnNEnCOjaE8DU2TWj2JjjNiyf9RZLU0jB8g9nfffGbpjHt2evifk8/c/
 QImKcDYcdrgxPJbYNAAcI9L+/2d8LtEe1sdeXYREEKG64gKZX9t12qbc1KxhqwIlne8p7agWSP1
 /CVoIfLIujqkBjdEtt+lmpUVBiwpk2JdcnfaJFsG8kz2r7ndJsEKxe4gafsIxgKThULI+rCLc+N
 AdKK3bR92o1q01VvmNY6PmJnvfCKsxsfNUAs9138pjZv1V8ZX+XbTKuBGzBSh4UdWp07reIYaet
 7ieOfe1ViSYCozWCrMA==
X-Proofpoint-ORIG-GUID: 2RXzSCSKnzanQI4bfNk7aYAZI9cIhITZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0NSBTYWx0ZWRfX2tIL0TA/+4fN
 GWFoEoFlYaRWbgJA6Ra8AGm6MWL6yKDgtIWJPAPfzbHUIKi2HAMUf9qMbMaFrGP+JCJulxVUDgK
 RhxzjFTKYkeTttEmHSS17i1vsnCqSz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070145



On 7/7/2026 5:47 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 04:47:07PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Dmitry,
>>
>> On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>>>> Hi Vlad,
>>>>
>>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>>> <snip>
>>>>>>
>>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>>> +            interconnect-names = "cpu-cfg",
>>>>>> +                                 "hf-mnoc",
>>>>>> +                                 "sf-mnoc";
>>>>>
>>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>>> the device node, they are found and should be allocated on parent's side.
>>>>
>>>> The interconnect has functionality to handle bw requests from different
>>>> clients.
>>>>
>>>> Yes the best will be to have camss interconnect, so jpeg and other hw's to
>>>> vote
>>>>
>>>> on that (actually it is possible in icc framework) but what is the benefit
>>>> of moving
>>>>
>>>> those to camss? Is it not better to create camss icc. I understand
>>>
>>> Please fix your email client and stop inserting extra empty lines.
>> Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
>>>>
>>>> you want them to be on parent side. But how to vote on bw? Most of the time
>>>> it
>>>
>>> If the driver actually votes on those, I think, it should be fine. This
>>> patchset seemed to add bandwidth voting, but then it dropped all the
>>> votes in the last commit.
>>>
>>>>
>>>> depends on the jpeg encoder configuration based on resolution format etc. to
>>>> set properly average bw.
>>>>
>>>> So i dont see how that can be done with not explicit dependency on jpeg with
>>>> camss and some exported
>>>>
>>>> API's which we discussed with Bryan they are preferable.
>>>
>>> Interconnects should be fine to be referenced here. Especially, if JPEG
>>> has its own port to those busses (hint, commit message).
>>>
>>> As I wrote, I see a bigger issue with the clocks. You need to have some
>>> API to vote on them (and then let camss driver aggregate those votes in
>>> a platform-specific manner).
>> Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
>> for the clock voting.
> 
> Please discuss it with the Camera team, working on the camss
> improvements.
Thanks we will discuss this topic.> 

