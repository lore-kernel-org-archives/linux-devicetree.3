Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215A35837C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736614; cv=none; b=ejX2xXQMxoX1WRnUnPkEZNFbTSeFyz6Pom6vLAyiKosxjpbP2ktvDb67aJM68wNMJUuOPm0k8cT27RSv6mNtFUesw/arEqrIAJPqmFyA1wncrDJnkLIUxhYbVnZmiOE+Rw9pDVGzqMpzX5kVqce9irOZ167mySNUqMuXetnP6f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736614; c=relaxed/simple;
	bh=ygsI4zv/jW+3AX1zDcDFKyDT2frDw4My01kgEz4hjOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpH3MBwLwFLgigtRbjnSUdayr3wCWjyGfq4RgJ9vXtrkNk7BTsfpfxak0W8sywcCEmfYpaTy9VlrrYjv9HjPhYUI6yRyOYwItqtdD+AmPaJQi7bmeUuHLLfNsoua7FVzJM4zM+wxhldUAHe9dVbnIuRCk4vzcaL4xVqujsOJeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcVkMAgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGMuTHk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcVkMAgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGMuTHk2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXp9m1259130
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=; b=pcVkMAgsaSsCHVhA
	uoc6RFvZ8ScHTvSEt+1cCYKdWiBxCh5gCx8RF5CjewSL9CJ587SBR1WV/sI5ozQl
	7VWLOK+T8QT8mfbbgYGYigw5cKaMimgjhPSbslZCpDLpUlr8E9EE/I5Z3iV9AOIa
	CDVndRxFhTgdS2J3ARS0iX8prYlxxEDn/BXOPphfJF6EOYF02hvCONtfKxSF1KNu
	NlK5AwB4qM6mSNVZeh6xaxjukqT0Qjf3Rp4VlF0qkIXcCzMMs1mMX7+bHEhia3JS
	CMx7mMzvwHdyRX5DNDgWvMwXgb8lpjjvr7LUuvTgxtlBIsygvoXGi6mkD1Rt12Ck
	s3DAvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu79fn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:10:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso11399971a12.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784736562; x=1785341362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=;
        b=ZGMuTHk2dpU/J5nUIXAEYdx5TAWyFKog0OQzfgaKktWoXiexiqjLHB/o63rlKRu1qQ
         WsqubdlEkdziYNIsyKchOUfXGXXY6jcfCMNcLJ7jobBGIV1XiAMOtHypuR0px9F3gIA0
         Chmruka4149+8gwj1ROiUDGNpAEi8ytsuvYP+W4Ho9f/y0JKTiaHbuWtF9dERMDCrMKC
         ozco8hc6/dcZ0AtAw4jQv/lRVzgXoLBliCz61rZfvOQ3Z/kh0yg1hyccmjmjmZCVvhao
         9N2wR+GIZ0MCVWfkVY26I5zAL2iuqy9y7RkKGgUy1yaU6dxuvqVnyWKAhVGZwppDqIo9
         rvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736562; x=1785341362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=;
        b=pEQfecF9Ajc71hUeEgbi3bofT67OuN3KZ/hhWhs7zjAbd/r35rOWhBawmEASeRsShV
         CxUGrxmwZH/iuepmrgNzTAkmuBNUP7Cr2tMKTz/3+Y8TGvKvl0CljKbZYoEgZZz6fbfH
         jUjZpaim7y1pWkZKjUxlLLfHUgT6E5cM5o7rXopYhhV2Hzrg7E2iQoA870M+SVtdk4Xz
         E57Dbz7kJjidjHyV1o5weUi2lb1s+PUYr/QV3QJ0Go4ZLVPIPpm5whE0bqZ1ID57v3Nm
         P4FbQtSn0HiNv+rCLpMvW+7YDBsKkPsyjXe8krL6Zt52uupfCcKlYCQZfukAi8Rxq/Xa
         gEmw==
X-Forwarded-Encrypted: i=1; AHgh+RoSUuTvVXVmo8/VSYuI8YEhPwx4vAAiRqLxTfQAD2cMpNp1XqqwrjXq16KpKcL3GnpYDpKKtkwdM9ds@vger.kernel.org
X-Gm-Message-State: AOJu0YyEYuYQ6P1eDhY/0woSwxXkLShPjJx1CVodZTUOyoD6HwCJk5vr
	V8N3h1Iy0gEDbrREQv8W1pYpNXrLhvxI04KpF9aIZLTUYVXNSjP/XgScTDldTEN5uXlyphdTyWK
	a1nN71WYbUr04wEiI76278Dw/PrtpYMBi44MUEX6EKkYivXa40c1wtCuJhRf63YPB
X-Gm-Gg: AR+sD13vqoNLwFZ11FvfZ/4lSJFlFKi3YAVCHPMd5uCDaZWC4NCb/JQY30SO07R8OZE
	94JkHF7gESjBJq4GQ3MUDsgjtRFUiMq7Efj1+BZ+2xiTzAErs2hHxlrYbSs2BMMgS0sbSaOXe91
	0eaGYg0cXS4FqIln1lNXgSVH61zkJ0W+gwZppOugd31xpppEydNaSDfXKfBd2XK2vGOXr6rMPcR
	RcZ0FU3SYHrsJ2gdaIa7vUZoaO4oRIWRz2alJOEujUZ/tsRLJFaMHQtZWsnWAP1K2fpx1+q1O2y
	q01E1BUkz2YEakDlMk4FULzU7WlDGhmQ/FDqdsBCWWPP4UVYQQYxM4B6WZcSWz5XfPnywRTgVDW
	Bl7F9sJvNabYNMevgJbRBQt90OVx3GVE=
X-Received: by 2002:a05:6300:6702:b0:3c4:302e:803c with SMTP id adf61e73a8af0-3c4302e81c8mr4231475637.61.1784736561806;
        Wed, 22 Jul 2026 09:09:21 -0700 (PDT)
X-Received: by 2002:a05:6300:6702:b0:3c4:302e:803c with SMTP id adf61e73a8af0-3c4302e81c8mr4231428637.61.1784736561391;
        Wed, 22 Jul 2026 09:09:21 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.203.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm10322604eec.6.2026.07.22.09.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 09:09:20 -0700 (PDT)
Message-ID: <b99f7d35-c54e-49bb-a477-577ef61ef553@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 21:39:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
 <5houmyc3fu3grxqajn6ivucct25yz34p66lwha3icmcuj2fb7f@ypz3r3mqwzwe>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <5houmyc3fu3grxqajn6ivucct25yz34p66lwha3icmcuj2fb7f@ypz3r3mqwzwe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hUxbOSfqpl4uOgAMLNbqlKv0nfRnmylC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE1OSBTYWx0ZWRfX5SRNpJ+uwLfh
 DXQZk37iGRjoYNafguSKUUSoyXK74Agflf5wzW/pYjaPDzzIPmtC2XUhJXYqM42IvK4p/D/xd31
 pjutHVAN+15KGKzrVxVaEybnoucv+Dc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE1OSBTYWx0ZWRfX2t4b5wox4cav
 bvLsdbidM0JgK7ABC0PCl0zWh99JoB/QNyhfBzGjOJ/4GS6ZSyn6Jzce6C3jdow7C8Ohg2GklaD
 oB0ZzYBMWoFb9joKeLjLOu1xXLrJ5kr8gDQirZaN2UTvUIPCTbmhD6btFJKx0+Nj8vmVf59YgK/
 REeVStTKYOBhnn57vMDIbAog4haQYpLQ4vL0oMmESSyooSj46PGpu+BllPoaicU5Ufb8BkXnAA5
 WsJ3OGccoUFbZu/qIl29u1SDPY6lIOMewIu9DTRWpilDt/pCASkI1rB7sRTFzkUep9+2zLH/Q9y
 P3g7KNQD4537P+qKN4QadK0u9Eemrpd5YPUHCFY04TbRb/4cxWyRWgyndl51xR2pitMSqlgJTbo
 Hk5RbsqFuTmPqH7Sy4NdUfJl1y3ZLDNIlwTf7ctQ3Vv6uIdjYuqWmsS8Ck/RUNmAyv4BacrbQVx
 BXkT6kVYCbOry5hy1jA==
X-Proofpoint-GUID: hUxbOSfqpl4uOgAMLNbqlKv0nfRnmylC
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60eb62 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=WGt2SA6sb8UO62j07QM/GQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aBxXs6P8EyRdFk8ceQ8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220159

On 7/21/2026 3:49 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:19:26PM +0530, Komal Bajaj wrote:
>> Add gpio-reserved-ranges property to the TLMM node for both Shikra
>> SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
>> from the non-secure world and dedicated to fixed functions.
>>
>> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Who is the author of the patch? Why does it have two SoBs? Should there
> be a Co-developed-by?
>
> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

You're right, I missed the Co-developed-by attribution for Anurag.

Please add:

Co-developed-by: Anurag Pateriya <apateriy@qti.qualcomm.com>

Thanks for catching that.

---
Komal

>
>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 6 ++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 6 ++++++
>>   2 files changed, 12 insertions(+)

