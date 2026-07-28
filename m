Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE1542A7B9
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241559; cv=none; b=Kd9enDJmiEV/7lvzNC6DYHoS+Nae5Nw7uRjQeL/UrrZMkiQPgF6CMiWB0XJusFK8eKlN6Xsz5JtvnmRr0PFqnRvSlefUR26h6vU0X1WY1TyBgv52dq2ECnq1zUwKe7i0w2LsBEq6gHzDfo9SUblnvfbCEImBXtpSFkyvl//T7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241559; c=relaxed/simple;
	bh=G/woI9Q47jogCzFfhduFoZMD5TPthjdX7zwCwHvy1Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3hlVspneCMCqglvzzE3OiyZBhC48bKbHgnmH71gF8lP2GpgIa3xlpldVUtaxU9J+xEKOVZDJLNYF2ihL2dljuBQvRlVvuzwowYUVit+shlShVuQBgtuc2QsQxizJPvFo15lB9EfLoF0lsDeeFoWgLfhok518XH76ib1+tAhNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=heap4DMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WN2j9f/1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="heap4DMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WN2j9f/1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBI4F42122693
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcRITBA7JDI6PKJS5pcYOCNKwYysxM9dz7iOzLdqem4=; b=heap4DMyr/5u/Aed
	7lSnS7JeVni2kShBec9ucNmp54Nfd5TOIb7uUU2pS+QrHk9ZIz2by2RHRJ8/ItBU
	u4/fyjLchirf6dAmAATBke7EAw80Ap0eG7OUKU5cCnbKOAn8GmVX+bSRaOvdaQX9
	70YNpV9LeBZGeqvpTVZ3QT+V/2Lnvwl91U3Bb+DroXWB9IK0JGPyJJuwj0m+Aptu
	Z/OU1SCmivHA6mx0ySmCfBWAFAse8g0Aj7H0hqFjIh0gL64KMSGMtVoebPpM7E4v
	QbVo3xHe2Ry1WHBIsC9mZRh3jVvM6LnhZHQlu3UTIq2S2ufcQ/lb/UQriVPMBpql
	5OYHEQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttshba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:25:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so1684990b3a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785241556; x=1785846356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcRITBA7JDI6PKJS5pcYOCNKwYysxM9dz7iOzLdqem4=;
        b=WN2j9f/1b1ep4jxn1GAxMgdagYhlkjj2ZTNoM9pfho7HoTCnlP21g8eqrqLE1jyOhX
         fqdo0ODaanDrR/aDau2wH00ufvUYOAOvtc97kjjyC1l0LWXmx2x6g5xTZaRyT9rFPUsU
         U8YnrAng52GMyewwiQVZAM84pMzPda6tatj68zOE/nm+WcSTLarofbdumDCThtGOG0zh
         9IGAMIYh6PEpACpoeMIbbEQrq3tRc29EDua+VYaZzB22bSh8aeTL+H657VrysC2I2xHl
         1rGJtJUkPGSiTu8+ujdfhqhmc7YHOHLvXSzSqbZ6lNuXOxle040NHZG1B+4D/W8PsC0K
         PudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241556; x=1785846356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcRITBA7JDI6PKJS5pcYOCNKwYysxM9dz7iOzLdqem4=;
        b=pdoXBlp+mQgn/oOWQcewdYyoIrVZeh5jSVqsPI4Q0QIualuCaF1PHLAlKUGUkXwbhM
         8IPspLgabK52YuYgWtVv4w99RyNDLbHTNJi2Sk2Z8YN6MTpMdd4AZgiW1AJUvUjCDRVi
         HPo3UG8d9we+AqGjRhCW+wEgORrGmDr+SlWx6UhUN8aOkdtQN2ddJ9p42hF6LntbY2YU
         1PI40NJOom3y6nin+mk56I8LevlI//lurNfys/YkmUD10i3D0qVfOHdgMNkZm80l9t7K
         g14VH+wOOVDw3lBA7M+d2cKfUFH1jt/YEAxBJlUdf7ysCg6231gXiBaatu+htAIacSf6
         hAGg==
X-Forwarded-Encrypted: i=1; AHgh+RrvgNby55ClVa96MusfNL4iZ2zQctHvjjah3W24aMuSMb+7xhqRuqoqEbjtuAixhQtCb29OEyLJKGxH@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtQBVYibMYupukyfzhgA9Yxv0qO0zPxZCxC/2WRJ2VxRnIgVE
	EglcbLBErjwDQUjS8aJq3O8cF0XYknFashKHjqDOy/y+T4VcmKxD0UMon8AbIwS745ZQ3YVBOsJ
	lXsCiQ85z7NBYsTUO2/p6bKURlGYzCrTweXHZ+au/3nSYEY2CeZPEFy2pK5GQSARp
X-Gm-Gg: AR+sD13loq8xd9ZMT+Nn3Hzmcs/8LRW+4StAhmHuHK7vPjg8EKxD25y5DOF39KlsUGS
	xSgY/DvNCf3K1MemkYQhH16uQKyWeuXTfqlkL1pcOQGV1RGG97CeUTOESqWfcVjLOXvZzzUTZ09
	z4L2DE7SQ0JKJ9t9yg9VaAbzI2ioSH0pfLjknQkYX6HBEE6CQdvXCyzFsJkLGQrnadewTpSt71W
	ZqXio4I9xuDyh8Gk7QtFlW2Fq2yEmYSHhvUza8NfmzQKyyT9ytxjesQWzr33xxnZKwnr3FOQOLy
	aRy5xnL61q75FZas6WExIYH6wlx6UYn8xEa0DXNA0Gs2b0DzNbbScW3exjNYHSvFGJeH68Bgr3A
	XOLcPp3Jel5zzBaxr2VtNShmIgyYARBi4
X-Received: by 2002:a05:6a00:4003:b0:848:7a8a:48c4 with SMTP id d2e1a72fcca58-84e932ec00dmr2212699b3a.40.1785241556414;
        Tue, 28 Jul 2026 05:25:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4003:b0:848:7a8a:48c4 with SMTP id d2e1a72fcca58-84e932ec00dmr2212652b3a.40.1785241555953;
        Tue, 28 Jul 2026 05:25:55 -0700 (PDT)
Received: from [10.217.217.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532807ddsm4362773b3a.21.2026.07.28.05.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:25:55 -0700 (PDT)
Message-ID: <147593cd-fc4e-41b9-83cf-2e42988c5e74@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:55:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
 <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
 <afb0862a-04d0-4171-887b-7f32ee64163f@oss.qualcomm.com>
 <c714e746-8b58-42d8-8c37-160f8c5b5a59@kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <c714e746-8b58-42d8-8c37-160f8c5b5a59@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwOSBTYWx0ZWRfX4vF+QI/407uB
 uPiCrLxVjfoyWcJN7Ltu+hID71J+U0pEHOwFKUxNDb83174HkpdvTQltRRTqVNR4h+7WFyIC8zD
 MZbTeGx8qklXeWGsG6VxYQc2lMk1fWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwOSBTYWx0ZWRfX8SpNOJ+C8Tse
 NYUqEXn8A1JWBFyYMn0u1s5YSiK3Vc9DClYGKPTQLk2abMbUrwyNvj08QcSewpkqTgAAav0/2Gf
 gUiWbxia45MNOB+OWNgYHpVYck9KPSGVREVGqgS2Po3d2WDDYYge+lHGbCbyH5fSjnBiSwy9g5p
 4BP50SPq83fFcUvTxiFiIxanF5Mjcs4bpHRgNunPAyZNjfFdpqYIj3XssNMBrs4NEM1nh04IqS/
 z6RKme4vKT14z6JY7DFAr9j9+k2FwkAQDnIt1WaegO8uYG6DM0suyNWQOJtDhf7xVxxog0oqrvn
 rA/XfTmRyjtw4gtY6ThpM1B3aZhDxKuGDl3yMlnbN2ZYrE3mnAwpb+JA3iBeXQWdylTFcbQZkco
 1OrlctbepNJy1x5rnbHqtFzB/bispoqCnhoBNXthY0zncSNe5SrihQjkKSeDYL6d6xNJd9dome4
 k4e3jBOH4J10a5DTo/g==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a689fd5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XEvzoQxivL6IAxnHEBIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: vxTOayN_5FUyoZbrdUw0q7C1qqHlxSuy
X-Proofpoint-ORIG-GUID: vxTOayN_5FUyoZbrdUw0q7C1qqHlxSuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280109



On 7/28/2026 5:52 PM, Krzysztof Kozlowski wrote:
> On 21/07/2026 16:30, Monish Chunara wrote:
>>
>>
>> On 7/8/2026 12:18 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Jul 06, 2026 at 07:43:44PM +0530, Monish Chunara wrote:
>>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>>
>>>> Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
>>>> 'qcom,glymur-sdhci' compatible as required by binding convention to
>>>> identify the hardware and reserve the namespace for future SoC-specific
>>>> quirks, with 'qcom,sdhci-msm-v5' as the fallback.
>>>
>>> Drop half of above sentence.
>>>
>>> "Document the SDHCI controller on Qualcomm Glymur soC, fully compatible
>>> with existing MSM SDHCI v5."
>>>
>>> You do not need to say anything about some conventions or reserving
>>> namespaces. We do not reserve namespaces...
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Sure, thanks. will update in v4. 
>>
>> Just for my understanding, though: how does the suggested wording capture the 
>> why behind the change? Per previous comments and understanding, the rationale 
>> for introducing the SoC-specific compatible is the reason we are making this 
>> change. For future submissions, this would help to avoid similar back-and-forth.
>>
> 
> Why do you think you need to document the "why" if it is 100% obvious
> (and I did state it many times)?
> 
> Best regards,
> Krzysztof

This was asked because it was suggested on first-post to add a why. 

"Same questions as always... why? Don't explain what you did. Explain why
ou did that way."

https://lore.kernel.org/all/9bb28a60-2c01-449d-9456-bcf2d780b68c@kernel.org/

Pardon, if this was a misunderstanding.

Regards,
Monish
