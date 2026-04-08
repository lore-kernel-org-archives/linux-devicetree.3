Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B627F010
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639671; cv=none; b=Cw5KJ8Oxv7LiMngqXzTycsKgk0rmMWTN5SXLlWI4+9gq9gZcFpcEGnUTBGRdEAC1Ic9ynGUiHTDHN8ZI6qF2D4mFsRqSkrRI07k180kvR7BuZRk0FfXMs/uf1HIORRP4ygwWHnbSqId2Eh8YotQ3YSu7plCDvfOcdkgAkcSvEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639671; c=relaxed/simple;
	bh=YvtodDdplKMdW3PBeWJkCqYTAkXl02h8pr2K+T1smhY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Kcsc30eX1cMOlJfKacPh910btkSWc49ieML9sJKlddSnB38f2kAiuwkLAmR+PZM0TrVyEyy0lmBjvJ/tbTPaQX+OP9VqKE3mmkKwBzxbifrcpYtcqbEKUdt+iwzFyFzxjoRlI+gGVubhNIE1BQXhB6e0c1l2Tc0x9iROvnVzLCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b00s5HsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfkKCDT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b00s5HsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfkKCDT7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63876ZkU1619750
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=; b=b00s5HsLbAeWD9rF
	OgTnWAL2NbNVpiIqljY5NG71G3Bo3Lepj7AmAgwB0vHEs60/jPB864tCHGtWUOiD
	Is8fDK/+9DnL4y4eiEAtfw1Unz9HNpqFkdOhiIcEbgUBwIDR6wYIJsiun832V/Vk
	JXXx2l1P4vc55kT9F/1/E07be5xnIKVe4KfBxrsDHBoKAIEFaMtz0O1gdjCkFHIw
	vrcsXme/qpbjHZrK85P44qlIsqS8LZQdpSH/a/s3urHUDxTvorKF87lmd2iaC5rk
	0D9XnZEzoouqfh+lYHfdWpwYYmu6gIK9OAsC8m15RLzc3ndEMBU53Yw9WFisAVBU
	aW5nxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrj1d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:14:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b23af7d7e8so164477545ad.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639668; x=1776244468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=;
        b=bfkKCDT7yPFTurXmWjkJb4eT2hTxa8fOOvwNhNnkEutO5N4J0MaVb54tHwVoOuTzHY
         98g4naa61MsyjyhWUno16/HMDiMOp3VO1m3zxUuT6vmch4CnLmqwy6MQSlPtUWFfXoYv
         xpQAHyx7AR6zr07NAL+H1UAhShFbQxiq30HM8qUgEMds7dkXh4gYE9tlHcwDHmFAKE3J
         kk33MJKzNIZd1ozwkyQCF1HBbagy0w77D701iaBpZ9ZtKsEPpoqWhxSvJu+ZPjFpFz45
         vMy0Mzy4R3yL80YQQR5mSYuboaPJMT+9LO6nd3OLlUBfotL1ILaWHAekBYNWkzaJL1NP
         y0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639668; x=1776244468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=;
        b=q8kf+CGsg2nNx6p0IOAuJt0KnS8IW9Dg4D3qCvEW/lvFu8x6vuO5dJlZoGNVE8aB5p
         OW/VwJw5lngTFOFRiX5ZRe+Nfoe62CV2FIxkE+PFTHXEewqSaVRORi6tEM9BrmUO+YIT
         ZmqpOiox6QnYbME7Yi+/VYPsmNqsbYCTy9mbpedqlAMpl/mrEIPkAG9p3tV3yZsCp4bZ
         4U1mcesVB8haAHNbHCa7RWcsUSaAOr5XhUmqI0tfODkGO0EVb/8wEIciDsZmgp6KDKxn
         WI4KLQmPZz0Vdv3rndNJnfuSzSIeMSs8AvEsCiTdhJJzBTn1t0H8wl/NUeCAl/i5yxb5
         7H4A==
X-Forwarded-Encrypted: i=1; AJvYcCXTusWfF0xlnz2BoF+s/Y/Bi7CRqBY9Z+I+Z5yG9qlVVplmTxFobyVM5d1sa5iMATzRxo9sqggUCzbk@vger.kernel.org
X-Gm-Message-State: AOJu0YwCO+CXyGWsQsDsaFxN0ewtPuhodf8JiHH1SB/IH2zFfwjwkG09
	3QpwcWr/AH65Q909FPaX0xoFdcstbfq4LWjaVavCHWZgGoqJ4vZl+4f+rgcKFDQBWxjFW81yf4a
	h701cAEEDIB2bJ7ZET6PhqPPPWaRYrWP+TCi/8GVLsqNErefNSyfpUvxqGdHaFCHw
X-Gm-Gg: AeBDieuXUpokJpCjCjWIMB3yUZ8hpSANPabNaGda+q8c2OdXOO/7d2mZcB2ANFiZYNS
	XIb1vJTF2LmiLd/IsQ4cpYF3ICXiiu//1YcfQkEmxBMt7M6WPMNqWWCvw0/E7yh0VSQHtIjmxGw
	dL58vQEAqdIxEripn79HJ7OvPmaN24/mCtyS20nBsp1SgU022JLDvLRjkq/opuc2TbRHacmgqyN
	KpJEPotkkMEVn9jBW7mjt/W1WL9x1EbOA0046BlxZrQhnkSkXGgm+Na5WRelavZEd2Jz+fVIWmy
	ajU3kLrc0Dgi132IK+0BVXiaOxm1R15YNLoyyMilOIH7kwv+kSVhtSAtwyTPQh6/7zXO/eNDUch
	FT5wOiw+caappGkj66J0x5jtla8N6IKt0x4RjhWWQuIOjFkonW7QRuMuzpI/HYkBSB/DeORMppV
	d3SGhSsJ53z8JoWEw5
X-Received: by 2002:a17:903:4b28:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2b281867dc8mr185457285ad.16.1775639668340;
        Wed, 08 Apr 2026 02:14:28 -0700 (PDT)
X-Received: by 2002:a17:903:4b28:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2b281867dc8mr185456875ad.16.1775639667873;
        Wed, 08 Apr 2026 02:14:27 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477a13dsm199169575ad.26.2026.04.08.02.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:14:27 -0700 (PDT)
Message-ID: <ed08f1f8-b820-40d7-956e-b346942e9ad2@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:14:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
 <9bfaf15e-99c8-a98e-d0df-9df86872bfe8@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <9bfaf15e-99c8-a98e-d0df-9df86872bfe8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VCkkrwpM52uriLXnI6_r5_j3TI60E0Qe
X-Proofpoint-GUID: VCkkrwpM52uriLXnI6_r5_j3TI60E0Qe
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d61c75 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=uc885YhAzpYNqufBhGQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MiBTYWx0ZWRfX8DBfWwZSIUOc
 KmZ5QLGoUIOyvUxsI6h438bw2UO9quh1Y+sQswAfSmHwDpgN+KeM0p63sj59KVd4JbMlRNWFGb7
 8YhdLF+oosK3I8JIioFxDF16MnU0X5YKMnbhv/7/aKRXkL1vDnVLYEnrrrMpUfv9dsFewNrJwfq
 FuRqL0XBdAANGkwLRimz58YMJU11lMwr9vwyMQmTQmfz/TqjtaULc3Al3gGes/itAdKzjbQcRn7
 /4i6wm12/F4sGWVnRkP+BFKmayx5ZHkxLBfVMHzF1K8RjLkP4Jejiexl7o0BCtamBuw9YGjz1J7
 MEM6m6+mw3omO0wMWwVxkOpjFB2pq+Di+v49cZKESnTNt9RD/p4WFLDpT9mvn4X4P4/fe2YNpmB
 UBef+bXSNppVfINb7EPUbYG9EXyaNSkftBg+fVsa6WUTtcg9ljeSm/G245v2WsmCSQHjNZ8Iaot
 7v252ESOWYr3fjyidmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080082



On 2026/4/1 20:37, Dikshita Agarwal wrote:
>> +
>> +static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
>> +{
>> +	iris_vpu3_power_off_hardware(core);
> 
> this will eventually call iris_vpu_power_off_hw which would try to disable
> IRIS_HW_AHB_CLK which is not applicable to purwa I think, will that not
> create any issue?
> 

All VPU3s will call this hook, but none of them have IRIS_HW_AHB_CLK.

-- 
Best Regards,
Wangao

