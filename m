Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EE83C8708
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050422; cv=none; b=SnrU6YbbMXx3lwnagrXV9zDcmC7aifEsB773CWsFLhZIkwc3lMzmn90iGY8GX8Ms42FwtVHpAt7/UqDvJi3c6buTkHJB2b1wBo9QnjLUAA0iTiKeoPSW1iqlAUqX5Tai6ztBwJCnc7ysb6NyctYK5AkMnIlyTYFMj/eSpWuVoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050422; c=relaxed/simple;
	bh=GoudkZUV5bL6tBLR1WtpWYzy+F1/jpCD3JWPQneE1Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWkMojPFG3220QHQC8T/c8q+VR6o3nyqjc6nECUQpcHoGjym95Kfa8GMF++Ale2wn10S3n5BFN8/aZozHQFGLBq6sYyy7FrR5W6AiJFZtV/tIxa/tfyf3FqL/WLTearDMStDsyPFXOAx47BlUzu308nCc/1dJFlMQOxG+tlqs+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnjH83pm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8lK8B3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnjH83pm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8lK8B3Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7nhV32258001
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=; b=RnjH83pmAiHippPc
	S8Rpcc0JtoOlC00V7WG6iwGfN7zy8LACGNPmwF2lj4ssIkCSQKTe2lp3ydgghZSh
	2vsEzkgpI/6d2JE6zfXYawhB4GdsE94tpo7cEAsIzd6Tf2acI5kOq4wrvBuxR5q8
	qt2f/tu20x7cOvyoK9ewN4wRskuWQCnWCTIe6xFr5RDLOyHejlf5mraiVL4RbuOZ
	lfHt6yeT68OKQOrphefe0GhutNGdUwhbBeRXpIuep7mB637G5zN8bKrtTl8ZbJFq
	Nfh3BqAD1JpjIWdISZLQ8PVQtJ8S/96C8neK05tGTeyJ0zcklezAMcWXOYiJmUcS
	Ay1XlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety53kv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:26:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso12460440a91.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780050416; x=1780655216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=;
        b=R8lK8B3ZkyUEuDcCnRBM6yGa4S9nOVQ/2OAyymih40cF7HYQpRlmoomqAK4eF5UAdh
         200aCPaT74gHnyM4JF9xxcfcnfmcRMJbIDs4en4z9ajPcsWnwz7C8KoD1dSFuz6SBXVj
         VkHBzX3CxfP/lPZv6v1uF5uaCIWI5OMVAuH30aPZznXt52cy1N4nZpvPGjHq117aCdDh
         e5IQP/+1HSEBQyhTQQgarIzGSZaN+tjXuRqQJsyKIflrG++jttNsif+B8iT/tbUN17Ao
         xsLG2XmGWxUb/wVhZRsCPesj/QWw+1V8EuOcHg7o21DWztKt0N2BfcCmQv+LE7srHIe1
         /flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050416; x=1780655216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=;
        b=YMWxZx37mfoN5PTkGBnZlSM/wpFrdsOychI/nuaOITJNqYUuR5rM9uP9LkSUyDVEzH
         TbqZB/OO4MC6xd4hjkpZfL5XsNHiIEf266Yfr9oDN6HM4Ot8wYgTFAo1mkrHnpvqrtgg
         RmB5GnxZZA6EwfI51lX6Kx/CAoGE+ct2+ftr4vHefiVILDTEhrs7EovTb05g0UxinZKR
         zeHQQ2yJ9oR2+AtFFJfxS6YM5FTUXsVz/pbi+B1WzIqAkA1tWTfd8u0z2Wju2Hf7a86k
         g1Xbdk4Ky7WGnZxAfjKKr5oq97NWQ7ap/FbQ2oOzCJw5L2DMBV6N3/7ETU8gByrgJ3NS
         fLbA==
X-Forwarded-Encrypted: i=1; AFNElJ9bY6hYPGJRleZHBlailwP7MZsaRzMvmllS9snr4ahan+cSiJyl28DNpxWG8F5CgW/3yAg6MgDyK4H2@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdWiSFnGNZioqoP6mIM6fOmxunwH2R/zrVcRnKis8K9CrKkoy
	C2XTwHN+34MY1SlWFsbryVCy8jXOKsMcTJfcSNBZpod1q9QtwFaqSSCzO9yBPUv6SD+kK7ypvpt
	ACHOyuMLOB+1YaBwi2r7ys5b+09MYUDe+AltrANc7ujaNud8M0HGYDZgmvaPoUOGM
X-Gm-Gg: Acq92OHWQPIv8WhgxenzLBBomvLk9AO3IeEQ7hIJ2Jvjo2RNVU4mfL1dvlnpyuTAsNo
	7rI6j2PlQuF6Pg3na6JdQ0fzUkh4a2czDjttoLBtTqOkP99ekJ8/TtUfmv3HgeYP/tjrtCuIOZM
	1FXrbfO6JZboVXH04jszQHDz4z/3e1Fdvr8d+O2sGZXW54y7WaxGm0DRRhhKfNVshvbixFP1yWJ
	/vcanecnk21k3JJX+axE6waMlQ/uMrlKqiIx5017vyIOYUu+YQb6j2wUYmV7cACcEssvCTqsb+V
	q72hCzaRm8SCSso5gbAqycg8ayfgl7tlgK+P8nCFwrPmhUVdt3TqkJXAev30xHBIC0ckYnUPdd9
	dtowzZQUJl6cL7eZ/X/6c9sft/rupjM+kaACHdXBZ7d+DT26zVXcDPj1hf5HajJjAO9EIAyNEZE
	/BNOzdSZCqzkUSJhPVMa0njw==
X-Received: by 2002:a17:90b:4ccf:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36bbcad635amr2645391a91.4.1780050416340;
        Fri, 29 May 2026 03:26:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccf:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36bbcad635amr2645363a91.4.1780050415867;
        Fri, 29 May 2026 03:26:55 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02b8b57sm1804194a91.7.2026.05.29.03.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:26:55 -0700 (PDT)
Message-ID: <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:26:49 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMyBTYWx0ZWRfX+GAqZHzAS//Z
 vCiRIVTmVwneNzLUf0dRU1Sau5x7mewMRFjIxrtLzPXhbrHpQ0AJxb5R+KTUOf3xboQJ3uMzqLr
 py/uID6MRoCdZl0MJlTZmtCkowlHby+aEWKhrSqUQ9LeQ+1UXmZ7A0jp+uJVToVE8Um+LCfOTt1
 2bXxfIRJKobDmIqw2VnSmY7y/oVxFMx8IIp5GPStWRI7huV9QM9YxEnSCIfVcbPNZXvRLAyEet3
 RysImRZ4hybL3fXr1ctQ/RkYTaFQ0XbeSR2LGBTGARq1AeoPDuN9ETEdpPtG369KHebpsx4YTBD
 9GIAK1BrLntqOFgNIRu7T3J2WVlb+r5kZJL5v39CDAjzo9uvRRzyqMYpnY1ndgrgGsXTTxS8QbT
 LZWT4jph/br7xvsKzYAJDlhOIRRDlSjzyXov+IMU+HIZMH0KvmP26dSPOcfWwi9IXjuk+DKPvGA
 euaBGwuA5y4Hr/zti8w==
X-Proofpoint-GUID: ELqWMXIP67ND05VemiRebunCAHNUggYx
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a1969f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=nTQ8HVyESOUA6E9D-IoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: ELqWMXIP67ND05VemiRebunCAHNUggYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290103



On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
> Hello,
> 
> 
> On 04/02/2026 02:22, Jie Gan wrote:
>> The DT‑binding patch adds platform‑specific compatibles for the
>> CTCU device, and the following Qualcomm platforms are included:
>> Kaanapali
>> Pakala(sm8750)
>> Hamoa(x1e80100)
>> Glymur
> 
> Given this is predominantly DTS changes, and there is very low chances
> of a conflict with the binding yaml change, I would recommend this to go
> via soc or the qcom platform tree.
> 
> For the series:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Hi Suzuki,

May I ask is there a chance this patch series could go through the 
CoreSight tree?

Thanks a lot.
Jie

> 
> 
>>
>> Since the base Coresight DT patches for the Kaanapali and Glymur
>> platforms have not yet been applied, I created DT patches only
>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>> and Glymur patches once their corresponding base Coresight DT patches
>> are merged.
>>
>> The Hamoa‑related patches were posted in a separate email, and I
>> have included them in the current patch series.
>>
>> Link to the previous Hamoa patch series:
>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - change back to the numeric compatible from hamoa to x1e80100.
>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>
>> Changes in v2:
>> - change back to the numeric compatible from pakala to sm8750.
>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>
>> ---
>> Jie Gan (3):
>>        dt-binding: document QCOM platforms for CTCU device
>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++++ 
>> +++++++-
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++ 
>> ++++++++++
>>   3 files changed, 340 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>
>> Best regards,
> 

