Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A522332637
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781851511; cv=none; b=eQJwM5m3DubTTP8gPYmWSBbZpDEcN99gceNzgD9Pth7UGSQ0zKRjhUJoJAGJEpVYNCus0sgSUEPIdMriodNjEOoK0alPDuIykv2mjfVm6y1kwakzFeIB+PHedyb7cO6t/H7RtYAADnY4pXZQiL40DqCNN0DKkvDt581eWjDXAbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781851511; c=relaxed/simple;
	bh=Hckp7srdJ2LRcrqr9h2hUZOxxARFEJYif+BcJ1ig0xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSHEZdQ/oId9xlmoq1Zt8nCPqKGvOO68wsviervblkidJ0prJa8JzZa+pqhhw+YTyspQocwQbfzLoujWouF6A0s1L+nEpyvYDeV/UhF2WZk9yGLFVN5ZJtZ5gElV9QBG9Knw3sTDSJIzhS8AFqg99eJcJZmWt4Pnn4nqHsTb3hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYQmekwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9IBjaa6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYQmekwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9IBjaa6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2tT0s3041485
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIsplPTUbXHeA4Zorpq7Kgqnq1vnUxBBxXkBvDyePAU=; b=kYQmekwnm3YBbPvH
	CHfD+dTq6/r0MDn4wLWtczltNYwWQ0Idv7CYwuwzksZ5uvOW7HR+xx4pBRV+Xz5e
	ynAaBH78oH80nacHIdynm+vCDE0rxuM8r1ZmNJ03rfKKxzXDcraV+SCL+3HeGsxe
	ng45KSy+CHR0MbWan2VErbHnS1NaHgq6CgnFsRXvNpxPsJCgPp4+aMFHShTSF1BX
	TLy4hKFwpOInGQ4ImX/LkPGTgViJ8goBMcmub0GUJDIaj/C7EiIp+/ARo4GaRnt9
	Cw0TjVa9L9S5/8Chlc1yxd2l7Z9vyH2Ps3zfaCjS6FCBbc4vD+1MoByp4JVDXQNv
	Kpfcvg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evkvf2t9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:45:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c891ed872ddso1242062a12.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 23:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781851508; x=1782456308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIsplPTUbXHeA4Zorpq7Kgqnq1vnUxBBxXkBvDyePAU=;
        b=I9IBjaa6QW3SqEGNxALxONNauHdg4Itz/RxVdSzQlDd0lJtgjNLBbL9ahq6P+9FURQ
         8cCh/0nUc6dFAyhE010oN7ykrSwJP6z9aGqpFGjQZi+vZ3QMnb1idweDd6fkPhfCwGuU
         Xf81azcRv5MfC3kzwjWpT+ped/lt11SlnCUXp1N0crCM3DbrvbBRPcUyzlDfWdNdxl4S
         CCfF6A73wewoCqdO9d2ee++PbNBnU81Ej6jCXmEashM7ZCnEsPqLdvltFLXuVDmLgAL/
         DYlSvEbbSAaC4tGflXd64xaoNIYvnxXL07VI4lmZcE5I4uWlvbszDmlWSyWSRLtNtBIr
         EFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781851508; x=1782456308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIsplPTUbXHeA4Zorpq7Kgqnq1vnUxBBxXkBvDyePAU=;
        b=ecDjSyyGq87/2VC4gOCbuESJER2fkCSRkM3IUDvr4f3FbTBkWqDziU2wAOT0DiYS2h
         BmSGq5QcSoeQIxEqQd1z81QqCg2ScOkSDVG8pSiZDBEXwv8Bax4oDN7hS/uEJApo2DIB
         FaYGi50T9KxyQayTofrBmZUyifNsKtGw7ICiN3f5bxyCiHPUU7fumt1HZoazLfr4uUHS
         l7/asPrhic+VSNJ/8utHwSi5b4bHRYQ7T7x0Pw3HSgDZIMmUjTF3jJuGfB+0GskefH1M
         4kH4Sewgk1L0gqKvKkTHOsSO70MYPet3QlgHF+T0EVqn14bTxo81SUs1VcUwPlJjknkU
         Iv9w==
X-Forwarded-Encrypted: i=1; AFNElJ/mmyIDGqrv5YE2odSF/qlrJqLhvI2mnD5C5rVKczgY836zywiippOhvCtSJXO8TrC2ey67Kt7eHeMy@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXrpbMOSr6NntsAbSld3hS6ssj1xsuuCwFpeDc6H+m0VSW7fy
	uz6jnwUptRj7Zz6OfmakEUVWLGlhJOUyFEmolyrEqLT753iQca4Iw4jmLOGavWwcXVrFyp/EQEk
	6bSavvP3FUd8oG6u/mxR7080q7ZayeuVMmq5t7OKU6KXmiJvOfvBIVbUpCZ/gw2go
X-Gm-Gg: AfdE7clMhUH3jWHZSCLA3GNoRuduUbdAXYHxzlcWN9jaS5oeGD25CCjwQeX/vBfE90Z
	08EKsg9tuaYboTBreYbyXiePRf/sCTcvpuCcpzPSY43HryNng9WY9fQ2EJfpXt+YnQa3dA/jBK1
	0iFwpR0ZIHGNJCuSBLiGs/w4lTJkyhtR3E77j4gtHqtipuqtQENkxQ4odQryvqubmfW6KExslp4
	foNM6U2Qt4NGq3luq3c+Nn9O2i5zUxwdITjxfxrfqMJUiqfblMvMMBT8jl/Rzctp4VjbPL0XTo7
	HhqdW44L7OVhV6tXkR84TvleXGRdR1SmBhyHTOzqSW1Sd/DrTHhKQgaCMSTt2jjnjB3QulEB+Xt
	inHL3lzTK/L0K47u57p5zUZ6yvnoxcBHKKqUqTvzP
X-Received: by 2002:a05:6a21:513:b0:398:b433:87ed with SMTP id adf61e73a8af0-3bb34a7d301mr2958744637.44.1781851508002;
        Thu, 18 Jun 2026 23:45:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:513:b0:398:b433:87ed with SMTP id adf61e73a8af0-3bb34a7d301mr2958688637.44.1781851507509;
        Thu, 18 Jun 2026 23:45:07 -0700 (PDT)
Received: from [10.92.184.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a890ad726sm1286070a12.28.2026.06.18.23.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 23:45:07 -0700 (PDT)
Message-ID: <4d643a18-a044-4350-b7f9-2c61f50cb792@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 12:14:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
 <20260608-sweet-powerful-ibis-8b2adb@quoll>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <20260608-sweet-powerful-ibis-8b2adb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA2MCBTYWx0ZWRfX/IIz3mgOCF+v
 f4IGP8L8+bcH48kXMqZPY3dN826f9DDAXoV1H+G+E7EJXSj3eheYwIIDrONa+ehxH39QgZAaWD7
 BYeRidJUjywK/Y0O8xxBDmSq64bUdzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA2MCBTYWx0ZWRfX4amkvVOw5MTl
 WH9tW37jUCXS7+qjcPFW99fMtveHsy0UmMJGH8Y4Iz3C9tZb+77RXOnCibJ3WdOA1AfjcqNDR5k
 /gTeJ5NfnQTNWzw3FafKNPwjaGmURJJLcY4yippUgvKK0dQ7NgNwyMcNAmsh3Ybe9K1GC0hxzk0
 UWbpsyVqFZtBfGqsMlSHfY7OSnlD6kQ+3Qia6j1GAMNzm7jbYOZDDepTu7vUrgkY3EH/SpVNAIM
 fUoCbcjkbWIyjIFAdnXav6vFIkRKUp4B5GWBPv5+LIzIEfgnoN4IR9h5ErAfUgyzU/X4SzNYUor
 0qx3en3O0Ea+oTVLHer+mjs8flXFvnGXBvp/K0+SlAdjZbaEdyTucSBGZfewNqKyFaqRdhPhZKC
 ZfLXzxwWRkVA5FuWgclWdnw+3pN/IF4irCmq7gTgEP4Wa7MPdvw57EtPEn+6SsUo8JBojoMJSM8
 cC/3hGutA58jwANyrGA==
X-Authority-Analysis: v=2.4 cv=H/3rBeYi c=1 sm=1 tr=0 ts=6a34e574 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=0qyGmKY7lCQY0vYQb8sA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1Y6snWlvyCOVidMxHoDHC6lhbJ81XQ36
X-Proofpoint-GUID: 1Y6snWlvyCOVidMxHoDHC6lhbJ81XQ36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190060



On 6/8/2026 3:37 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 01, 2026 at 04:31:18PM +0530, Sachin Gupta wrote:
>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>
>> Add bindings for the Qualcomm MBG (Master Bandgap) temperature alarm peripheral
> 
> Feels unwrapped.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 

I will re-wrap the commit message in the next revision.

> 
>> found on the PM8775 PMIC. Unlike the existing SPMI temp alarm peripheral,
>> the MBG peripheral supports both hot and cold threshold monitoring across
>> two programmable levels (LVL1 and LVL2), with interrupt status reported via
>> a fault status register over SPMI.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
>>   .../bindings/thermal/qcom-spmi-mbg-tm.yaml         | 72 ++++++++++++++++++++++
>>   2 files changed, 76 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index 644c42b5e2e5..5f409fe700b2 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -193,6 +193,10 @@ patternProperties:
>>       type: object
>>       $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
>>   
>> +  "^temperature-sensor@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/thermal/qcom-spmi-mbg-tm.yaml#
>> +
>>     "^typec@[0-9a-f]+$":
>>       type: object
>>       $ref: /schemas/usb/qcom,pmic-typec.yaml#
>> diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
>> new file mode 100644
>> index 000000000000..a0ecc9f35cf6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
> 
> Filename must match compatible.
> 

Thanks for the review. I can rename this to match the compatible naming, 
but wanted your preference on scope:

Should I use a generic naming scheme (qcom,spmi-mbg-tm.yaml with 
matching compatible), or make it PMIC-specific (qcom,pm8775-mbg-tm.yaml).

Thanks,
Sachin

>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/thermal/qcom-spmi-mbg-tm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm's SPMI PMIC MBG Thermal Monitoring
> 
> Best regards,
> Krzysztof
> 

