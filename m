Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344226FD9B
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234212; cv=none; b=uyj+s3y2mUGwjtVJHG0bqYEMqPOhtUAIdsRoAdOXOhZWh0UBlCvdiogHG3gz4vnZzZLho9ZBlX+mXzabWwu4s7Vxn5/VWZZ3OmzCbnOnt66AWKWZ8COkKVUUUWs54gHKmNpOp7NO3n8GWXBgLzVjswdpaHJMo1Y1hZ6iDkdEu+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234212; c=relaxed/simple;
	bh=jV0KZXzdYT/FvZQlJNY7glDuMFn6g7DtU07NH4UUTds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR0pZiZCHlpWvxcG/jmFbICSZfqYH2if4coX+tBeOEL+drRz67/00yNLjF0Y8NGemGgbefwrAThgXuXoK7ggQz2lkTqceoxz+xlXb3ya6UAGGcoFHvme1v1LTIbT2nj30MTYnmpIr31Hu4M3pr9035kTbFjskecPKLEvrhK4Ovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHbJ7G6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX/yjCmE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHbJ7G6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX/yjCmE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648732bF1062618
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LthUShBIHS42cUrm3J5+M2OZFyxtHDBOPDKRpNCvYB0=; b=RHbJ7G6rl1o2sNff
	cu9ZNq4MZfvcB3LoyZXB0D8K8pfGvyixUcS7uzrrbEeAmXLYoGCKs5Y4PhXLbHhC
	GSjk+At+m/TkLm09wQe+ObsN3fe5jywrbvvB+GWq3MRWn7pmqxOYjZhH+mh443j0
	MPws4dDV+vNhfAeilMy/opjCulysby9ysCfISt97MxzIONVMGym7QMLOWKxsLm6y
	PXXjcBrM9Zq5+DOqCbG412cltmNnkFsfXqb6xCr8YN5UDKNqPdPFJ0Jl87NK31/2
	LtQV8ETZ2vCjwMnDpOv5WhUndk6aIQQwnswslTQH+geSIa10FmaH+/hafHXk4NAr
	v2/5FQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1b3fgnkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:56:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso7536531cf.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234210; x=1778839010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LthUShBIHS42cUrm3J5+M2OZFyxtHDBOPDKRpNCvYB0=;
        b=jX/yjCmEQN5VALWc3B0CkRhEVPkn9yRle+V2ufRLZWLabwQJHHZQljDuPOr7+CFO9+
         c1yEhi0PRI7hyHqCsmKmS+kHfBfJjfEQKTqSH3G2vtWVs0+AaLQ8BgFxnqe4/AlOmR/2
         PZphbXtKpTAdZNIY+Kk19o/W789vQi3DQmMgjaZV6uiNvvCVGZ4WhxyB/plBncDLyx/m
         BqYFTKXb+mm8SC8DZz4kX1RH5SPs3ZNVbjmNrilTHwN2fQF6MGtRtel3iwOexqS2YKAb
         3Jfz4eAEP60NotqrfAQoGQmDOq6JfRLMm6qrD9ClTGvdWaNZ1c1UlTg9GkBnY1/DX6FY
         gzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234210; x=1778839010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LthUShBIHS42cUrm3J5+M2OZFyxtHDBOPDKRpNCvYB0=;
        b=sNsVDAmzqezSzJXr1HCOP3QNskkLiL1RRbxh8kNr6scvViG1pC6bnCpIl1fp+/6SQs
         Bh3fxoRg+IGMf61zkvJ+quN8SnoKFAzmF52ybwTc7U37RkO4Jv7lnx7UhUBLxtbXy/Vh
         XSS1/c8Av6zcauQUU/oIkooD7lk1Ck82FJnxynYNSyUH5c7khXbhgFTTK8veNzrelQ+Z
         i6/2rOApxB5B9ryv7PuHp4eyDt0ci5unAwmyWTTeOTLDjBusomr87XxTEJhtjtnTEjIY
         cS/4DEQnb8IQ+NebCgLALU46x140nq+8k8+SX4U2eg3lhSsQogahk5KMeNmcqYBU4R/6
         i4ew==
X-Forwarded-Encrypted: i=1; AFNElJ8w5Gc+h3kmAWZE43wbdq/uWhBL/mA1qwIHU+2d1N3nV9qff6RKrzdoSue5Ecz23//j7BX1dnWKCSMK@vger.kernel.org
X-Gm-Message-State: AOJu0YzPzqACJxxMEz+DI135u7vn0bTPk7FxwRmDkZvRuTFKWczuHRD0
	ExxbV4bccl7KajDu5U9rpqs/oCPwWliYSVkbPqx2bnxKKW83G7oU6Bp27L0fojzqvsHKLKM1OVR
	bZ99kaacTkd6wtgT0cMy2lX/3GY4ZuzmqrpCPvILw+s0slUXWvZMSynHq6Pw6EVQX
X-Gm-Gg: AeBDiethMijbd5Kr+IuULxKfdgKnjbEi+8ULwgRvF3cOH3FhHjBdkzJKbL8ORkN7iYW
	xdS1Kh6Ohl5mXl+An+iJUVotSeZ7N9FuHCDjAGcr52N/HVu0YIAt4MTAfn2eXpBFkeMy3TQI6wi
	XGpDUYbG2pFI+TOpLxfqfkkru4R9cgL1Ur0X0hrID2XQbFJejQc148ooHQ7k9IQNpZB9ewHvrnZ
	YHzsjdeez6R3prwjE6v1EeCbYvmWKXuObinXQkl0lM9g9XgF8EIaRYTLU5fTB3W/+TmK/Pkusqz
	ykKNNLW4TqizQUAUuOqrkKWb0exIWzLEKcHa8VsJ/5kH/ARO55DxctVoVfkuhGqOWI8NgF5H9Nr
	FfXTLuKhrmf77i5CXj3ry3i+NFTTK7dipzfQfd1l98VAAVPNb7IykEb9uLxl242F1+t4iMC/bjH
	T/1Hg=
X-Received: by 2002:ac8:5953:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51462611830mr109956171cf.2.1778234209654;
        Fri, 08 May 2026 02:56:49 -0700 (PDT)
X-Received: by 2002:ac8:5953:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51462611830mr109955981cf.2.1778234209109;
        Fri, 08 May 2026 02:56:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a3f3sm467056a12.10.2026.05.08.02.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:56:48 -0700 (PDT)
Message-ID: <1e855b70-cc2e-47f8-a820-877622620016@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:56:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8996: add blsp2_spi5 node
To: Christopher Obbard <christopher.obbard@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lnfj48JSFCsPvyor1xGQji7TGEs6mrf2
X-Authority-Analysis: v=2.4 cv=YMOvDxGx c=1 sm=1 tr=0 ts=69fdb362 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=QEXdDO2ut3YA:10
 a=TF39JM0BPuoA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Lnfj48JSFCsPvyor1xGQji7TGEs6mrf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfX2KfFNgYa5IbG
 vwLNkfJyL3/b/ia96dtEIK9FySXLFC9ZaJE8TqT1puHx2HiRqH6IrjgTPmqj5VThjEGG2d/Wgfo
 kB77G68e3V18s3dBVzQyXZIdnYsSIZOWdpVlwG0DU/mbvZtL/FwYd0475GoDtPXtJJ0DGDGKgLR
 lzraAoa3+LKhu6xVM4TaZpOIzq1dxLw2+8w2MyXyep23DzHpkT5IxWoE1gQndVHdTGJTc3qi+AC
 WxFjyDMhZJk4UOXNGZ095cTzzmiIZyhRy8JdXn8raCCgZhIQVjf0+GtiVQR3VGxBM07Wv/zDAeI
 UPP/eAI41FxRRhkLY6oxiO3AABuAtmr8NdaNxN+MOv+sH0VRNoOkyX0zLFW/7Jp4/DsLHlUl0l7
 Kh7YBCD27l9dFZ+YTuNpSdOvl6YsIk08HbRuVhVc+iHIQTGqfDsleM1NWcf6hYd7+1xvVAI2wl0
 7Bf6xP65vNsI8Kf/LbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080102

On 5/8/26 4:30 AM, Christopher Obbard wrote:
> Add the blsp2_spi5 SPI controller node together with its default and sleep
> pinctrl states.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
