Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1722486620
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100685; cv=none; b=tHT0rb5dBbMnXmFLJEobg5SPMBcRiw9HIDYtgYn2hjLbMzdhpzNbr03efwscMukDPZJ4KOBiX7F7cW6duUOTyV7tOqxOJe02Ebi950XaGPA5aWWq/xXky4uHyVP+wW8VURLOebRLVZERZZSqkUIDomd90xwUztDyEr7PPfzozqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100685; c=relaxed/simple;
	bh=YKr6r9TaiLIpPUWDV0xkTF5KFQVZkNaHc0UaH2PmIW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQpPimgY+x/GkmX2YfKQ76YRikBDkMjPFst1evKnIu+eoAetbvnKkBRmsMPLOn3dk2MIdYsPz1sPLNwwFaeOt/yW428YVKDnW+Yqwhl9Dii4tXfHr0y2co5dQbCDLT/SLwAtcbughBLikRZzk718XyJlDEnNFadjvt/gRoyLzEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mq5xR74s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLkBJ344; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mq5xR74s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLkBJ344"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6rNq178647
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=; b=mq5xR74s0W1iC71v
	Ws9VU0XAi9kOtRct7TTaPdoE8RuEL1VVSPqK7qk0nybUd3UX+hHdBIWBMfVzrWja
	7Tpsz6h1G0PdGMgtV4dtbzWBtqQ5bBQV9hro28fTJjsrHssFqa37sALSzSnZ1+EM
	jN2T3cgXUVT+F1mfaCskhJxcvQn5C5m8quVh5KMY4S9EbYQfB5IPNOzJKTTqIbWY
	NtNuQMRxA0BhBzQpPEzIuMF16WxinLFR47a8AwHUD8oqzCmujTfSBlkVfDzTcTjc
	kj81I4PQqA8LdZ9rpXhzB6cZzMczvMe5fdoOG6u+gPAWTgKixNOwFjYDuw7HZU82
	RLOcvw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec17ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:11:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3284bbaa89dso250980eec.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100683; x=1790705483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=;
        b=CLkBJ344/9RjGT2lMNEFFSjJCHnXZ9B3VZHAk0Q7t1HEgUwKSUbEs2h64iIijdwLXD
         yRC84mxVDP6XyS9JLaTz4OdSdaCiS/YPJ4PkEYCntUe3es5ANTVnUp7lZdI6cc5XXL/W
         PDWLWWnxFy24RpKWOuTRCVQKq2Dz71N9TCgiWasmtEKnMnvjg4YlOlicOop6cRFzozR1
         HL75cXEFBhmyaKWenvRV5lhAifsQBi9FG4o6+laFvaDve2seLyVv0eBG7Yguu/a8faPK
         qgXm8KWkYSm7V3b6d2eeerW8ngBPCjiGZDkB/1URkWDXuvFr+pzrYMZWCqtujHCo4xL8
         BMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100683; x=1790705483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=;
        b=vqywpleBmz/HDahFOUXExhv2txSTOhROG4E0vOv4yOU6eyU9kRaVWnfbnf2RJ3uu3U
         XqeDBeZNVm1zHVqwkqWsbaT5h5xydjXzi07gjrqHWNVUj08U7cOKr0yIP2eDpjcR6W9a
         bCXU0SR73sHNTCInqPiTSZbaDb3V+FvHs7U9I2mtF4bOgD/HJskhm5IcI3cGo7puBK/K
         GRpXgDmfke6pt+EH0huQb8Tzz4nRdQUjsYGnpwVAVgJJOuGqq+AnmkkvzqQCWUEQd2em
         wtD1pIJQ7bpNFq4XbPbbQOhAmYON/Y8mF49OVxZhBdE6YBUNPQvDO2euT98l+JuJH3z6
         CHPg==
X-Forwarded-Encrypted: i=1; AKwUvBwIheIhdY4XYlWlCO4eSPwV3ekUOcu1xZmu17LaLG5VCvCGscdhSaCP7KQAsdOVCWJUXDor/A7VrK/+@vger.kernel.org
X-Gm-Message-State: AFuF++nNNBtlFOnl+JMmNl2fEoUo9um92x4U5iPwKvIhQUvrHJLDxJjl
	Ixk6ZX7uY/uqApPvXBGGrXe9hvu8vr2K2thHa3OR6bpD0jkDmkc0/mlSqoLiPrEq8UeMhMqOAyl
	ZV/mfiRkTNJLzfwlppaEj6lEHqtlTeO1DOfMuGnG8/1WrqW+ONR0uU2ssokvEv42M
X-Gm-Gg: AYBFou0V513iwPzthKGScv9UFzv3ayI7lBoHYInGg+vNKop9S9iTvwbtOVX7/rAz/Uc
	Vl/iiPJ4A1Sb5W3SDnSwp33kjueNb4c54r3LqxEWnIswLcErjXVvsBpvqZciQSQItVwMxK8HOEc
	SSfc4vPc//GYa1RV+3wOB50SuhAQnrD/lGs68tyhfwg8UJjKAMXhXiYDbOyXJ0CgfOE5D6SUGeX
	JnoveP0z3PrU6nMdTOOMd/FnWzBHUSMm1jmv3CYDmbMzYC+VJXHpXUhKtM+LQyGeDbKeMoq5Xe2
	D+lKcsxk3WH0BRwBlGXkCMuHfA3eh7/QtIlN8RvZ+EKU672hLRg2WTR7hiueRyx/GVMfAC4jq3x
	1BndmKsMZGSKV/l5ZpJH8mzJt62YPYayIVg==
X-Received: by 2002:a05:7301:8605:b0:334:30bb:5e87 with SMTP id 5a478bee46e88-33e8e3af1d8mr90120eec.36.1790100682465;
        Tue, 22 Sep 2026 11:11:22 -0700 (PDT)
X-Received: by 2002:a05:7301:8605:b0:334:30bb:5e87 with SMTP id 5a478bee46e88-33e8e3af1d8mr90065eec.36.1790100681597;
        Tue, 22 Sep 2026 11:11:21 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm16349eec.9.2026.09.22.11.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:11:21 -0700 (PDT)
Message-ID: <7bcc736f-e994-463a-b363-9854aafd5649@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:41:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/9] media: iris: Add support to select core for dual
 core platforms
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-6-e0c8bc914742@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-6-e0c8bc914742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX70K1q9QoV3Kf
 lPWDgNrxL3KRKjYrloDs63PqFnKVjdPEb5Lih5GsGXKyPiydjj4OEgiPySwLorMg891cgo+52P/
 ZTLCu35m+CrmDFWEljJDaCJ5lNcTUcug5yMMl3GKhUjhv5fa3eSu1zORdKCJCagzMVe36lVEnAT
 hl12vE8HeWlU+1fDl15yIb4JwVn4fH4iExrov5OG1uOPLo3/WTT1Y9+jAS90npDliYGEZvx9R0E
 do7x7jP0UIxoIxm1+O9smxB7kiyCrmVRLi9xOlYinhbPbEFjkb3SEVTXtFOFQE9rmI40pEU/ov3
 oUNoKNQSGFUSE/t7pICZSDFNKTvfgksEPSfdWAMdVTplvJOn/Yc2OnRws3RlGEfR/EasLlAHiIO
 gJo6S2R5RwTkNbLY+ODW+HMVaNVA9rIFhZfFHagMKEdYPMkGgPPckYysd99AKB5TMLNU2QFmwDQ
 rhc6Vmk0MyFUFXTyCgw==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2c4cb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0GF_beopZQ-buuiTRkAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 15uqwxM9Ab_yM1YMxInRNunyOXszPpA8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX0naBzgcp2wwA
 CS9vklaNSKXeIL9ec5EublhjtGVcMLeSAm6lwyi02sYSBvtlGVw76N7CU0lYAzyqTNWYu2bRwBB
 Q1EI/b0fAye0ijI+VcXiubtZIboVAso=
X-Proofpoint-ORIG-GUID: 15uqwxM9Ab_yM1YMxInRNunyOXszPpA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265


On 9/17/2026 10:30 AM, Vishnu Reddy wrote:
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> Since both cores share the same clock source, the required clock
> frequency is the maximum of the aggregated frequencies across both
> cores.
> The total session count limit is scaled by the number of cores, since
> each core independently supports sessions up to its own limit.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_common.c     | 10 ++++
>   drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>   drivers/media/platform/qcom/iris/iris_power.c      | 20 ++++++-
>   drivers/media/platform/qcom/iris/iris_utils.c      | 58 ++++++++++++-------
>   drivers/media/platform/qcom/iris/iris_utils.h      |  3 +-
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>   drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 66 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 +
>   14 files changed, 174 insertions(+), 24 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
