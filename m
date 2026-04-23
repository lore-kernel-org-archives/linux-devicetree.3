Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49C314B6E
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919279; cv=none; b=Ik1fCAsuBBKYUgvFiSVkGLi9FoHAA4mgiC/GleVl1F2qeOODyzYN8D7sKN7dEtG8raMmZexNBC+CEks3YvZJnLl9DbdAF0hevbb+rVCgxOtqZUJt+ae+kBTLXFvgXVutAZEDWSiWpPywLX7NES1RgpRXYxAvR3WS2M8DbkqSl90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919279; c=relaxed/simple;
	bh=9J4BxM7gtyEKauNKqbRS21TUg8P0EpQ40xplG6+3a/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZfzy7drrWFbYttmvGMtvMgrUfQzGk7zH1652TCXGbgztf6wYyWrAndIzpq3gdruj9KDLGDR250stUhy/N/oXhDIz9rRFQGITnPGW8vLLwlIL6dXraUOJdPNpC6X7CYyVy95pR/8O64/aGPGEQ2EnmHMJL539iyYyAKwxz+Clz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIThHOPj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ks05OSAI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIThHOPj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ks05OSAI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N28Peg2956090
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXcarQ3/SORvCcBXZAV2XtrZqcRRpX62RDXzsLa4WYw=; b=bIThHOPj8YOdhejd
	7i9zM1dNoAy4uU2h3aT58PQU8GGeJ1Uv8c32GfIJ98HfX9m9mGeWYOS9hgFeOvid
	pYI7PW8a+Pqnedab+41b4os6XlqvubiHjFSL0gT7y5YsMJ+lm6dSjTfewvgcrnZ7
	yG67bRtb7nfJYei7VXaiQNtYS5Zso9XIpjpEBt++0m9aHi9PLcZma6PXLDaMP4ZT
	X52mVEPcu1ZnJoBUuRBJFmyt0IyxIzlrkRlapqAUF+QZNHuq/B/6fooSpVsyFr4P
	8g7SFKlRQJY55U6lHaaV02eiAFpmrmEGVa4dHnYNMqVlijFTHt1TJh3kb+o32zI9
	jwzm9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q27pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:41:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so6141615a91.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 21:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776919276; x=1777524076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXcarQ3/SORvCcBXZAV2XtrZqcRRpX62RDXzsLa4WYw=;
        b=ks05OSAIWzSYL8SjGV8ej7Kw2wU7O19mp+EjOTSVDZENF57AB07qmxAM0/VpeeYiXt
         NuyUoGxQ7cXwJRbPGCEf+EjqgZA1t3tq8yUx2EGLiRsb2ewj4TLd7YWOgBEwbkVLtS4A
         CmDBQTGsf6bD0QOx32rP7tqtBNAB8zOLwzEdTUu0bThdb7o1nff1IPU2Nbk71huYjQrZ
         Gqz5IG/iSVbvJyM+3onSCETsQafWd6xXrtXcHdELJjlLJ0oI7tUEZ/1YqG2bmsEiBNqg
         iAWEsG8w7iPSAejdvwy2Vrm/Io8xYy2/psAvPVHT/jY5YZ2WYgYbAbwIMQF2Qz5YrGMX
         qRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776919276; x=1777524076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXcarQ3/SORvCcBXZAV2XtrZqcRRpX62RDXzsLa4WYw=;
        b=FKSk3LhN9qPKCxrfG5sm7ja2gQcT1jSwQmTVmSBuE18j/7W3VqXDQK6BtN3j+sGQQm
         LmIN1UE0QwKJLbp4iGmcrwqXjCQT7fVAm3aXLggVRA2ECr5JcNcOHy8R0/LO/CE2Fmas
         FAHhi/ue+L5vY1qZ6xaOdYHFYhvRZO903DqM8Mk5qlcJ6T38uPoWx3z+FgadD94JQ1q1
         ZPCtvMTUKy73CRqdadk2r+yAoth7w7Z+IDBj0X1WF5WuKTezIrINpQwKQXcqHo0FUcBf
         Y1+RsnxcdjJHaM5CWj5FjmCw0LbtaL/iR52qEBhHyyBTxgxnUn6+mEmzuqkoJARrMIj2
         oqnw==
X-Forwarded-Encrypted: i=1; AFNElJ8AwAOgZlTn236NHbQnXZ8IO3lfhL0WSZ1pA2Y07HeXB0+wI5GvYZmDgLfJvX9EzFejBGHbae2tBLga@vger.kernel.org
X-Gm-Message-State: AOJu0YwWrVK+hG0XhSdPomcl32ZeeD+e+7ndoPmKU40e8+0PEFdPCOnj
	0zVpLjVS80iH53qPnentQUE/OqP9cJkmHRYFq34UGZfmG3m+moNlLpPYynicoTRSsCSh4yucDeU
	P9NgQFFm5tVeEWLEeMEd59riLnwDlA425+0SHhPv6NN+ohloYldLpTYOPsuQ1BYvG
X-Gm-Gg: AeBDievYphdYcuEeITdzyexsBHCBCNb4bybyzSn3rcWPdTrJDHGtl7y3dN+UCVgZM7B
	wsV+V1k1KqDqeFuWiralM1850NVr+28N0c3aXksApKtAUJaga2oQ9fz41KS5ojN7y2kgvEFhe0o
	8ahCvb7HFeH7AWQkNYb1YiveMJeN55m5jCR7/4Ud1ZEFVsG89V/xGaQFIF3w+5MUvznTQl+6Spp
	CqrT3LqokcTlwfn6CJKDrvRrYCr11Os7t1HlN4E1X0IXtRFM2c4EztK/5RoeLo4MDtfx5kYZGa/
	rSVGBS5qB4N85QDoMe5HO4fwGfAIC38trB9UQ9lpOCVHhYlYddKh+Ab6ZbXhe1X1DwDxz5ufom9
	3LylHq6xQLMgFqmKG/XSUVwQHTsEq2cektdnqXPBrZKnROFDcy1PM2wUCRckHaAm7
X-Received: by 2002:a17:90b:1d50:b0:35e:599f:aef0 with SMTP id 98e67ed59e1d1-361404254c0mr23419613a91.11.1776919276421;
        Wed, 22 Apr 2026 21:41:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1d50:b0:35e:599f:aef0 with SMTP id 98e67ed59e1d1-361404254c0mr23419574a91.11.1776919275975;
        Wed, 22 Apr 2026 21:41:15 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9fbsm24124355a91.11.2026.04.22.21.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 21:41:15 -0700 (PDT)
Message-ID: <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 10:11:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
To: Mark Brown <broonie@kernel.org>
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
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9a2ed cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ktr-gnuM6ESvd8fC0OUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Kk3eJibyp1xoERB8_41vkVA1RCy0Oguf
X-Proofpoint-ORIG-GUID: Kk3eJibyp1xoERB8_41vkVA1RCy0Oguf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0MSBTYWx0ZWRfX4ZOXTX1EV402
 VgG2Az5EHmM6q7zAw7O2pSgT8Q61A1B2GqoAiidEum+E9UKltJStvd+ivA17BQ9FQEcEEPtU3oc
 RfIp9LHZOg2luRmx4M+TAe55vaN6He9Xb15ynhvSp+0WjXfJ/NkS2Vl+DV3wuqtOHprCW947BJv
 vCDBtvYd6oum1KCMhiKLEFIaFfv3g5iKcGkPKxH/HaS/lpwXWsZ+3h+Fkt1VnQ6vyf65oNDm5tE
 pGT/OAE1/dErUmdVtuCwClCpcjADzCCkcMNuv2D3ZLrWYM9hlSGH2o4oCvmE0IXD7poNsYJl2PX
 OBL1RCuwHE53UoimKozDaSjT8+A+btTMbqoVUz+kekvxqzPMWYDjVYcd01kje7lEhRMSBSLlfZa
 2RN+NUEiBH7gKXXb+7Bd5v7ZsccuAoyZzrtnWohXGfHQgBMF8VTqBtbQ7D+HtJGM1CS/VFskdFf
 Nl7AmQkYS0gJxkvtSJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230041



On 4/20/2026 10:14 PM, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 11:42:50AM +0530, Viken Dadhaniya wrote:
>> The QSPI controller has two interconnect paths:
>> 1. qspi-config: CPU to QSPI controller for register access
>> 2. qspi-memory: QSPI controller to memory for DMA operations
> 
>> @@ -729,6 +737,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
>>  				     "Failed to get cpu path\n");
>>  
>> +	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
>> +	if (IS_ERR(ctrl->icc_path_mem))
>> +		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
>> +				     "Failed to get memory path\n");
>> +
> 
> Does this handle missing qspi-memory properly?  It's not conditional on
> the compatible so it'll run even for existing devices.

All existing device trees have been updated to include this path,
so there won't be any probe failures for existing devices.
