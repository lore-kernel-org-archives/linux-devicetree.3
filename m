Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D33BD228
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490418; cv=none; b=Rs3GP2zX4Wof5OnOtfnogYxBK/bDBb2Bh8RMUqTrdsM/4/viJhAK0uZBh52Uk0BOuBXMO/TboEEnGL4oevfcgt8wC/ji8M2NvIfkGx7IDX4p03AYGehnKInONzYk42+TyM1MKr+rx+ZcYAC/V1GZjSGNVRw07WE8ycwZI5lzdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490418; c=relaxed/simple;
	bh=FfPwtqgOkX1uJ3sUDZ6sGSPnCIcswR5ao4yfyyYEf5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlhFOQ6waDybjlBjUJEr/gzuVCf96paYs6NWgp6+0m7HB3uv6FfVMJVchrydkkdmkUwRay1/v2I43rHaJxvnp/WLeL1AFzLoaWq36/JgAqo9hDp+ObggnPvxftW+aQBUwfz7rJCxMY0V3AynEW1dnylZM/VvCzT9JUHyVj6Vaoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDV/ayRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvdROHih; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDV/ayRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvdROHih"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6pumB3556059
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r81hLdy+5UdlIFvYJjAgeru8301hA14/IjYRO/7rU0=; b=jDV/ayRU9lStkFP/
	IsYT4lXV2wkPsNhXCTWVXX3oILJJjC7q//iDCpEvyIBYoMH1tswQWtE6JsOCqUky
	cKLvZY33QC1jacSUNU7ecJG1Iv4+b52VusW4t5Su1tiVpJiG9gtzk29rM7cDkuN3
	rSO5PtPBIogT++gTyYPwZkenW4QQRrzmnin/uHcytOUP835i7uotfqi2sWeRhgOz
	2TYq2rx+7arHfb1C1gOw7Qk89Fz5Ys+zqrc7CDtBBwXFC0gbXjXrdd/KRauIOXRf
	1J7lYvw157nGj7Az7gtaACYM6O9SU2uhYISg6uPUjCXKccj0txtMxxMaHFQlk4mx
	v6xDJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79n609-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:06:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so2543577a91.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778490415; x=1779095215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9r81hLdy+5UdlIFvYJjAgeru8301hA14/IjYRO/7rU0=;
        b=bvdROHihc/xVsWRLslYVQLPibnC0VBlq85jsZcw9wjjl1hwhTFNwDrFxP0P231aPHd
         ARyF/upvSA4u3Vjb4pFZSTmbBXZOxUEClwQJ5d8pqe9O2/v/GfATN4hzHvyY73cLT61W
         1ScjDp7KeBDUzFlmeW0yQliASLWL5t8aIiZKm/zokgEeRBoe6Hw783QcV2EC6sBkvW9h
         LLX+UT2W4qhtpcIezVMwoHeyA5q7EssHwDF6tmzO5CbEaZpEvquujcqNXln7nvAETGoc
         Ay4uGiBY32++OfYJCXhsT3GMoObAjgC/hA6Hd39FtXvwQuiN0Ma/a218s+xr6uitmQPL
         Ppjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490415; x=1779095215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r81hLdy+5UdlIFvYJjAgeru8301hA14/IjYRO/7rU0=;
        b=EGbp7+1qqg2ORMEwy1O1DmU0S5T/QI0ifagLidVWwcHiROlT/5epabgzf26JOCxXmd
         m6Q9SgZUYCIgolsjkdAJJ9pt3BBwAw2iRMX+Um3LSd3Jp94h8fxEtNqkqTnb6xkHIYJ5
         1R+ovYb7Nv5fs83SBHIyruk+2wSV7n5Na0ueRPqKmhu0Bv/9WDcz504eSnVgF3mZDsRC
         pcm+l13hjklkiRDVEHxgvIacABVt1w6iiLdnhAVK1jMmagiWzzr5oH/d3Z9ATkexhVTd
         uw6SeTIZLeYc0MUrr7jOrRjlDRftSPz5xDfTqIGf5/1kbAp0OO7/YKux2P4cz308XpRQ
         i07g==
X-Forwarded-Encrypted: i=1; AFNElJ+Rm719i6VgVVjJ/hDfrBFFxqWd01uKQ99Ci9LUWtLQSBrvtDDQ9Sf6ucn5nuwSkWT/fiWqLSHXqIiT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhrnr75+mkw+9WaQtsWWjEaU19pLOsqvj0p7kQCAqyElw4lP+C
	JNItjqIka9FNxy7PmvSRUGnjwA1hUrLv/2bBFi8h3UHWS0IsbU6DizF4XmX8prkdTLrsDYr2KJ4
	mGcN9ikb0w3QXdANhX0hhJnhl4Tn5P4zD3xZKNLhVdnXcARQ+EugaHPA1zdubkspj
X-Gm-Gg: Acq92OGd5DWlNuZaiKP3zz3eg/TpV6jRnBv1E5B+Dm1NG9bLq+SQ2kRMAdslDeuI6Yt
	D9/X1kX2BbcfbqDIpAsid/SmvbxN3zmj/86cn14XcnRi6Zz/3JUz2nGIXYT5YUKMW94dfMKOo1a
	d9vZ6SYS+LG+HT6yj9OS+5Nz706imLY05IMoTCZ35FvrDtu5KlFf/hNn4hUtal6CyHhHCBq/R9Y
	n8kJbLBHhDu6/QjZmFcUkDkLKQR5+pPN7cFKpJDxZSXgCbdtGPuz0bCCCS3CFpkxNEeUNivcXLA
	0leWBYBrryogexXllv+4GlnI9lARQNwCeFoAt6xucua5RJabE4e9tH8szNa4jHUo/KSAmWeha4z
	28w3d/lh1H0JlEAL+FJ//7YyFO2xDYV6UlzZVnH3fsoI4Waf9zEG3rq6X33JgiidYDiYQeeWgYF
	QwHMe9ncPnY1HTQQ==
X-Received: by 2002:a17:90b:2888:b0:365:d46a:524 with SMTP id 98e67ed59e1d1-367d46c601emr9621808a91.2.1778490415328;
        Mon, 11 May 2026 02:06:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2888:b0:365:d46a:524 with SMTP id 98e67ed59e1d1-367d46c601emr9621690a91.2.1778490414692;
        Mon, 11 May 2026 02:06:54 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687a2a8sm6936179a91.15.2026.05.11.02.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:06:54 -0700 (PDT)
Message-ID: <a5a97989-0e5f-447b-906d-c09801aacda8@oss.qualcomm.com>
Date: Mon, 11 May 2026 14:36:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add USB Phy driver and binding changes for
 Qualcomm Shikra SoC
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <agBP_HeLmVAKLFUh@vaman>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <agBP_HeLmVAKLFUh@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5pILMiwUizuIlPZea9j0RmSbIwEWiAvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMCBTYWx0ZWRfXw03xCfpKZxRi
 fKMKQLc7vl536m7njOJ375p2fn9hayXQi/lfq6OauPLJlpSPjwm7SLwKctVlPmrFuVs9fTtPC5/
 aYs9dcglzIvepEtGC1eQ6o4uQZZ2eLjnG3RYf3un5cidO9mIJfarNs3Ja5T2kWIOV9Qzip1yWnj
 381LfDlBG68d16siA9zHP3ZptYXpKlgU76dlhjHjfA5XksjzK1P+nLu8nVAXzdhbd9pQC0Glk34
 he0lrQiUQvxkAcD1EP7COqmOTY1W3HS0a+Cgsu719Nx4jsQbvYTjC+YldTgQS67Yx0Ymd6aQIsN
 kPdsuriGNlMsDeD6ywVsvBV9OmaMpbzRUxYuLM1BnAfKjlfLgJLFPG2SH6lZXU6o6C+ejhKseyi
 jGmm1OjrlJqaaTP1epdMOPnu3KcpeEPbHcg18ltG9s3bHbzpy6MidnwmOxX3KmKZJ9+VWcba0AY
 rh2DM3uRmuTEZyzg2GA==
X-Proofpoint-GUID: 5pILMiwUizuIlPZea9j0RmSbIwEWiAvS
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a019c30 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WzJcQefkPXJgcSUdovYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110100



On 5/10/2026 2:59 PM, Vinod Koul wrote:
> On 04-05-26, 22:36, Krishna Kurapati wrote:
>> This series adds Driver and binding changes for USB Phys on Shikra. There
>> are two USB controllers - One of them is SS capable and other is highspeed
>> only capable. The ss Phy init sequence is same as that of Talos.
> 
> Please check https://sashiko.dev/#/patchset/20260504170659.282532-1-krishna.kurapati%40oss.qualcomm.com
> 

Thanks for the report Vinod.

Will do the following:

1. On hs phy driver patch, will update commit text to mention that 
register init sequence of Shikra is same as that of Talos and hence the 
qcs615 init tbl is being reused.

2. On the super speed phy driver patch, I repsonded to Krzysztof 
comments as to why fallback copatible can't be used. Will update commit 
text appropriately once comments are all resolved.

[1]: 
https://lore.kernel.org/all/d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com/

Regards,
Krishna,

>>
>> Changes in v2:
>> - Separated the usb controller binding changes
>> - Updated commit texts.
>>
>> Krishna Kurapati (4):
>>    dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
>>    dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
>>    phy: qcom-qusb2: Add support for Shikra
>>    phy: qcom: qmp-usbc: Add qmp configuration for Shikra
>>
>>   .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml  |  2 ++
>>   .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         |  3 +++
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c            | 16 ++++++++++++++++
>>   4 files changed, 22 insertions(+)
>>
>> -- 
>> 2.34.1
> 

