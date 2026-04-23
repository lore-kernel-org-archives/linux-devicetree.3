Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE20434EF00
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943210; cv=none; b=eszGVK1MX8Pj7JFQ7GcWEFstG8MpR9Y/YqkyUUmlf7qiMl+9XGCYcAA8wE81yYHGDCjPrv7gNyl/sOnnKDb4j0Z31DJFlZWmqUeabdLgnjFiiuIeQyLSQnr+l8zsMzKDyt1cH+GxYCvmeVDjBFtsQLv9rChat5tu+DUgE/8mFRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943210; c=relaxed/simple;
	bh=GP9L8s3+6Dna8OPJunaRkww/VynNPAuD1ynp9SUd5jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Amr6JvfBHCa2uvKZjHYJGeVTBTt2ODupFnJjL2Xdomkx/uXSiS6ojqPgAH+kI7aIjOukiSI7xO3HbTjKCCJ8At90BH0q3jQbJ2L6AHzo4YoItCgcnLfkXBTulcuQ9L4Fag57GDSDGdq92Ygv5JmZG8RsJ4+JB+LRJ9sAi+ECPgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvLo8/Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpAjG6s2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvLo8/Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpAjG6s2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uNaj1565720
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eyjs36fm74EJZijLcHA0ssTPFQ4dZB0D3TOhVHv00JY=; b=pvLo8/Gd3m6MMxE9
	aLhoIUoAjJwWxJYyIdyrDqh/x+ivNhy+EKA8XoOtKhe6L2ZgGvP1Gpm1RDp4Ge6A
	2wzl6KJYJyrR8WrqRWkI4TTZ4aLTPZ4prthp658Qw7etp09gKHQxQc0nb6/3acLT
	VCl7k5jy2YRA/0Y4AGUr4piHI5BFqtSqIAlWOO8JPFMAuTwr33hx5wKKsDg2j/7W
	W9ssAH3K+jdiEA1TOJNtz2Uf1PlN79WJNo3k5YmQlr0PLXSgMCgvtUZexzH/m6fl
	5TbwtSJP/Lg76YXsfV9K8yOZwaMBQ+i7oxIiWnp3Zziz25O/zEnsU61mc5MHojF3
	sKl7/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wupwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:20:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb4b340f4so17796616d6.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943207; x=1777548007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eyjs36fm74EJZijLcHA0ssTPFQ4dZB0D3TOhVHv00JY=;
        b=gpAjG6s2WlTXMzJHkGT/6JVVWAFUMMRzHKYfw/QUnXrMN5iGs66bubbNLncRZ4/OG0
         iWveFMtQiEf4QlVgyVm/SE1UL8gsCS9S6OtmXcckCYjlEg3YfHfpTy0UpadA/dG1/g37
         Wokg8gE5fQGa6Q5uZzQEor2ELQfvvpSRe6cFqVcxjQpDECt504WeZ8wHhQ1ME+yF5Vf7
         i1iilrUWCJlL5Vtj8LpbPGfUUc4c3LY0GfeoxmEP3NbLuhjFec7BKMCqgw6daCaDC0kd
         9LkHLnWCSgg3G/bDgHveNwVypsKyFBYoIJLdpx3lflbZjcX/QzPRo8GM+FCn7VBMbSs2
         E+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943207; x=1777548007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eyjs36fm74EJZijLcHA0ssTPFQ4dZB0D3TOhVHv00JY=;
        b=UVc+qbZUsJKVcPDNbTptMbpfBN8IVOjduUEjO2iipDf05NN4DsZm8fF6tJwnbPmoqa
         kk3KHMT+LrvN6OOKz9bL7Uq0e8OVkdh+/9i75vpsjAhwp5cdfcX30tCivbnnnaxgrYsg
         2AZjK/y+kRHUZSF3o9GcbVeuKkm6MtDO0dQjZ+nucCd7hDzimNPzjwt01TbaEU7hq657
         TWG380WS70Jy0kJYerrePPXp+GdLRs8OZdsJSxmvYLtJDWX86QZgBIFxZZ+7JbNjJwQu
         ligk7Rd1kdvo29d1c+bDbeU1lB9N6y4MKTuEGfS8hyUa83PdoYhJGNQBPQq51UIannOr
         uqYA==
X-Forwarded-Encrypted: i=1; AFNElJ+nPRCjzb0gROqQ5FW6glKS3VZM1hpucsbl/l+7M7bXw9mRGkdBMkc4enF5FuPX3OM/r5gAodchxg75@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4E5W+3ADIlf0riHXNa+YzbOATj9eITmkhDebdlHBtVRwuDXZA
	hmF43sMhK9kPzIc3dedaD2maTLAa1chr3SIVTrX+WNdvF7QFhnrCD7bpcf9kaHAUM1Z8H9deJSr
	cmDi6COreUB5iXaYZtV4zKkRALPJyjsgbas0K4VYBNmuJuIoxNiXBsAzexquAsTUO
X-Gm-Gg: AeBDies982nfVaWZxEkOzPD2X43Rwj8oiXNLTW8LmPqweAHo5n3FM2v+l/t5S5mGWLn
	fpv5628Pibq0Ll2asyJkyIpPuNnN8xhzdT+WyL/XExQmFGwb5RVa3peb11vtikKIEN7ve/8ZjjH
	2Qdz9Mqz+ud2kQy0SLrlFt1oQpp9yABWnG2EVmh8UD1oRcE0oe8k4HsDqCvLm8QaJX4ix/A25FH
	BOOUSdh4Hrs5Cs2FkD6th2u4zxNsuqA0qbWMwIDisb9cV21VeBXFVwrbBNkCcpzaX/4jrcYxnYW
	PgD4+p23qoGbgeNsHqMFyzqh0IV75yYtQ9U4oYJmCISPabtQpCWZTqQ/k++ZLPIpfP2vqTgD1vT
	GKh7gQKIGtxjTS3rtOANYZJbYu7GcrMJyUHT/9tJFgOG+2/EN0KP+BFkxRSOBctIDn0n3spBkbw
	XABh7CqmPiIKepYQ==
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr256855381cf.7.1776943207102;
        Thu, 23 Apr 2026 04:20:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr256854981cf.7.1776943206696;
        Thu, 23 Apr 2026 04:20:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-678974e23adsm61612a12.13.2026.04.23.04.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:20:04 -0700 (PDT)
Message-ID: <8ca34203-68cd-4e5a-a4d7-de36c0c35f91@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:20:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
 <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
 <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMiBTYWx0ZWRfXx5p7hUwa2eV1
 YPH3np+bIql4vhkWDE0cXliM/1HPbldDTF7vSFFkGZkhD2JTCYTyza0nJfQY+FZFFIGjK+Bs9kj
 KT2ogSqblwQp6hfLnkZIdRWFd6jqUATSWfa4XJfT7Ik3xIOXt671OsnVGQC4PS4lzXo6LHN3zgg
 GrMPlZjRyqfQ8O/y7XJ/qL00E0uFNQqz17aSa28gRZjQqzGRUbjNfKFfXmGOIuEq7VXW1HrK6Bn
 OlehXAlw7pDxZWk1E/p0UFZ77svD6wlVTlviIuTuGZQ6MupfLxmDVUFTOSmbQuYwJcIhkte+cw7
 blRAZ79pXfBtnxi94vlCAtBLtBUa68CTogRejrqn6qIs+ZyPjl21qSkjXsQO63iL6C6/X3Hc6Mv
 Bhx5VbxK6v8BRq5g1T1xumSCPKgBiPBp/eMD98B1Kt01knRBXRAZ7zehB7+8c3GAcOkhQPo8San
 NGpNvu9x4IsLhnSosWA==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea0067 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=X9vs7x0jcKjliShTIuoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: UHDeTq8ywWsKEqDxFEQb-M2crPxbqcU8
X-Proofpoint-ORIG-GUID: UHDeTq8ywWsKEqDxFEQb-M2crPxbqcU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230112

On 4/23/26 6:41 AM, Viken Dadhaniya wrote:
> 
> 
> On 4/20/2026 10:14 PM, Mark Brown wrote:
>> On Mon, Apr 20, 2026 at 11:42:50AM +0530, Viken Dadhaniya wrote:
>>> The QSPI controller has two interconnect paths:
>>> 1. qspi-config: CPU to QSPI controller for register access
>>> 2. qspi-memory: QSPI controller to memory for DMA operations
>>
>>> @@ -729,6 +737,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>>>  		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
>>>  				     "Failed to get cpu path\n");
>>>  
>>> +	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
>>> +	if (IS_ERR(ctrl->icc_path_mem))
>>> +		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
>>> +				     "Failed to get memory path\n");
>>> +
>>
>> Does this handle missing qspi-memory properly?  It's not conditional on
>> the compatible so it'll run even for existing devices.
> 
> All existing device trees have been updated to include this path,
> so there won't be any probe failures for existing devices.

The problem is, not all users of the new kernel also update the device
trees

Konrad
