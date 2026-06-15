Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338E5388393
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503878; cv=none; b=UiRLXJAZ7vLOf9btWRq310K0hg6Tn5J29Y9/b0oAXUoyxZep00NnlX6bv44fcARH49KZP8sOx7mS/7QWdb9IjeDnbWl/DbYYJ3D3msQ0NRyM8VQB9p8b3qCK9k2b4bPCGuQHzOIqb3ls9QVJaBYcumAUBWWJ7oMgEOAPW+UBEX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503878; c=relaxed/simple;
	bh=fzjJzwjz485Saj6HPlarx9ASscbSys4xUoYsx+i0r2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5EXXxCQfYE15ovltIg3ekeylvd10pE6itULXFdX+roYKLDsqnogrO2uiwcddzEyneDxLpnW4LXF/RA8YtQE4FT13KHSdon2MwoxbRx1TfBXwuj8aeA64zZDPz9piPh1YGMvG6yQIzfCE2i15Tt5x79JKGPY0+WIGAJzDdRcnXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPj+BG/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJ4jjg1a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPj+BG/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJ4jjg1a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kAPd3307885
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=; b=SPj+BG/larudEZzU
	5vnucjaKmg36z2vXouXE2woNUU5bl+KJGjwFEQeLWbhD2N0bEp/3Wmvskp69RhQw
	DQfTWWUu1fGWAuOl8EnjN3b5nNyVCS4hXAWt+iSATUOwwc+FTcElDf/tgNX3OQOU
	lC7pU+67u5inNugb5NzkiFUnYTWTFOnBUoLoDaX5oeeUfWi99weQBANvCpjTEdhK
	GQ0vFwpnLFPWpvxFIHk7KMaoOxaZjn4j1tliv2juY67vkG74WaOfettF7HMGnwsl
	sPBCkF0V8WIU1mGK3tYa3y9LqBqzxqB20DyhCmACPPX2k6Y92BJMuuYs7lGKIWJW
	irfsQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6wufr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:11:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156ceb551eso474453585a.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503876; x=1782108676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=;
        b=EJ4jjg1atOLbxfQuO87dpWpmXhp8YKI/IhzKTOWPmEyjpFWJXlz3hZdWt0MONncvxZ
         PNKZebqcmhZs8vRlrYQ3sLAhoNi4CJVNUdtNZFvAhP7ZU87/2v7bFIebCRwvC/mzif+t
         cXqU12RvgK5aH0IQPyal/Ghd0a5Xb6ds/0/jfFGqQt//x0u8IOvTrbUArtTCXPTDMg9u
         8k8tW4I/sNuZmPipdALjEvQdbG5/AyOdHNreFM4nSxeubmatwRLN3o7M+tA9hS8++RF8
         AxPz/TSQngVJWB/DEzFMg8wBK6Vss4V4lM/jtkH0N2jR88cqOxJ0lgRxWnaC4F0oOICf
         rC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503876; x=1782108676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=;
        b=JbKLAk2qyMsH92P2QCqnZBKN1Jzk8K1ifaKwq1xzh6lX21LPioJcxg9auAOkpfQyPN
         4pOFVR+6vHnoOp5RNYfUbmsn8mwUZUqWCIL6toSKrusEjzu7oKRwymHmMHHTKfgKsrJQ
         s9RP5IfPjqkFH1+Itf7je6Twu9nr/DbOqarPWXaRQxbbgY+3/oBpM78HAPPEEdbv6qrE
         S6DWVxbvKv62nmMCLj3cMLyys7vAKwXH/F8CTchsfx6QxbiuIR0tvOrHkjdBPTa6MJZ7
         X9a4Yc4ky+9kUp4slIvxC3hZO4AWIFDfRZT/9m3uGN75q6rh0PlEE8I9yWxs7CDmioOB
         9WWg==
X-Forwarded-Encrypted: i=1; AFNElJ8ec2qiWzP9GjR5VrV3SKGx9ibNqmZcHMibj28qU+RYYFvKOk4zULmBr9tSd8LNlVOlcpHMJX8jJ7fX@vger.kernel.org
X-Gm-Message-State: AOJu0YxSIF5cDkSw2PT7fBR6vTWRipKA+0Sl2cVPS0rRVQedcZN+ANNs
	3lzNzDlblvYeLNCJslIG9ugViunWRdEhEjAqEID1Hu2caPOQkdsEZ8/xrMAlmJkHXccLLfuz6Eb
	tIge5FkXmau1fg0fT0/yLS2bEtvueOG7+tcbxMzftmR/dCc5fr4lXeMxMJaUnLUlS
X-Gm-Gg: Acq92OFHTUXeI2spzTTcA6xgH2zUjG76jcjQ+JeI1z5z8MrqKWX5uyQYryV1XIOb4+u
	3Bf714rpqEguiJOU8IHpYcr2geScrGZTTiBUTDeSfUEutYfIWsQUcTNO7MBfdwJwLkt/n5JJCAS
	mS5JfyWEqavN0UAEdqnxjol+zMu+kvQBNH4q2Yv/odZTUdmyBgxaD1XCi6Qzla/gj6E2gpIQofH
	KE/XIJQFSB7zKg00Fi4XAsVS3s/0U7j7dgNZNTdVqfgDgp7cibd8dptQWWHj6YyvxuH3Ovjr6pI
	+/yMfLukt3/18JDD36+s2VAeSSDcDbvUY+upRwnNTgP7kFeo6VAVTaNp0WGnDKcEEUMNo3TMcxC
	w4BDW/bosmL4kdikGQ9CTBW9C7hSKjar76R6l1JkN38UaZkZJ8o5QO7dV
X-Received: by 2002:a05:620a:440c:b0:915:9de3:226b with SMTP id af79cd13be357-9161baf7dc6mr2006477685a.18.1781503875709;
        Sun, 14 Jun 2026 23:11:15 -0700 (PDT)
X-Received: by 2002:a05:620a:440c:b0:915:9de3:226b with SMTP id af79cd13be357-9161baf7dc6mr2006472885a.18.1781503875073;
        Sun, 14 Jun 2026 23:11:15 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b556sm2791009a12.4.2026.06.14.23.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:11:12 -0700 (PDT)
Message-ID: <a0a74410-e729-4e82-9fef-d72115bdd801@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:41:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] media: iris: Add platform data field for
 watchdog interrupt mask
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
 <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX0/NZHIppoMkj
 2Ejdh3Jh1WGqiKD9s97y/4vV3HCaqmi78Gh1ffogIj1FDo8WBFf8LMgACzgSyMn8M4UxUk5Z3sx
 fJwuWOkH9jpyF7wdYN6H2EkIueS78kE=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f9784 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=1BxbLvcILuCGMxPr/bnfdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sQl9ibgnB-ql-ZCiWtgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FrrJJ4XokO8qQf4I__FpupQu5HKMGAQt
X-Proofpoint-ORIG-GUID: FrrJJ4XokO8qQf4I__FpupQu5HKMGAQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX8U7vAIt49TTU
 6aQjnvPEsMx2f2f8Cdjzl1kiloqgUF1pi15izZAs0ZmsLZ/1nPM7gP9tMbPE8WvlCCNxL11vwSz
 YaVV7Q0a1IrmEgFrZLfvpLe3wKf7V34yT7Cgpc+I9CjjQiOAckF2V/uXJbN06sMZN88gZU+11dj
 vRWFpbM2DvdDI4WDA9kHc7jXimxEzxNk9VHGK3JlkwSaasMVHdqABad+teE8YyvAp3jq8dPTEFr
 +V3pTvhBF5/Z1i2aSoGiE9GGiz6E0qSNWV84Plk+IjMBKOwjidUfHGD5U5j24psEXSQljIq+0tT
 69Tp2CIdlOgjklJ486PO6iiuhU9dWweTxejyno8wH5+niSpNuqwo/dOjrAyrNLY2+vnOo2vTp40
 L67jhMNM7D+cKKMM/mVnvIbzoT1C1ZY2nLYse2zd2kQqVU3+obvDUJWmNmWfQUhYQ+KEqVtecx0
 2LJkBq3bg2B6hMgp5rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150061


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
> from the currently supported VPUs. In preparation for adding AR50LT
> support in subsequent patches, introduce a platform data field,
> wd_intr_mask, to capture the watchdog interrupt bitmask per platform.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
>   drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
>   5 files changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
