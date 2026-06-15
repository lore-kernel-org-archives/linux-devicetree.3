Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBEB3E9C2D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527483; cv=none; b=qMZS8Ju3c0/IqhQacGhMtk2HusX7bO6iDdKeu6sotxaN0OTkzb9rvAo5/b8V9a/uVMkxZM7f6gC50PIb1tz0BK/S7UEQhHzmi8WDR1d1tdzJoqxetPj7ZSGvf1QdzZ8Xw34A8pUXbZcJYWPf44LM5eORL81Fow25N5yrG1BhE5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527483; c=relaxed/simple;
	bh=yDGdisoGHqhD2uNAQsftXw6XhtevjF9h7iWT1/+N3UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnKaEo3mU1cOrs9gNfI+op7gAinCAMRsrAMhUKMOfKFRIgVuhtNCw8qVqLcRVlHhrjY+ndF7ydqiDES8MARL9vyE1N8fXhv1pG5MB2RgfkgsPTPYt18xrPjuNIi+lKyBAxaaUjzq5JoM1cP1iklqzB6WTb35jpG+Rx7iEGE/Z90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1Ak06fV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5M5yOwg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1Ak06fV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5M5yOwg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZj4G589904
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=; b=m1Ak06fViKIwFILv
	Co/xwH7fiS9HD9OYETBUVU2iXiUojNj6MpfAkTLzWAGahzdWglPtnjrKb78TUyXv
	ig29UFBH9D+tZTMDIamJ3BNG+I0sxxoPZRvFpWN5XRaCPxUADByKmszVXNkAbXga
	jZaqW/1tVlfjcCIQkfV/YhyJptLmgfIWZYQ1pnlbgNULaugrcQ/+pCUimJGz/6vJ
	Li/XTuVW/rJPQEH1+qKclKGgCWrbFjqjeyCZYJf32sYXk7msuPS//0egV8UxxjOO
	ZljI26+U8EtDJi0LqmCKL4oty/6ms3tAllk4J5aFlsaCmdHUrXqfVkZY4yp5vIRi
	xmbTNA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c96mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:44:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso5533639a91.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781527480; x=1782132280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=;
        b=Z5M5yOwg3OK/+adcqmCm3S0FRH6gXMRNsmJsyGUlC3dWCJHCu0VdRWIWTWY0em0IUO
         sMei2NNtpYo07LYXFSESIyZ7+wAYG81IGno7tqSxwNWt/FweDNna80pGE3cfxMKH+r9W
         kxQawJ33X4B5nkUYHLrVIJ2JjZ7ZhcbcEkJ3ON29fZ7fN5fGCdrx2FNUdL9j0Z1eo1zn
         LNC+C1QjLmqrDa4aHJSJ5VD5oRmuXGcYlbJ70CvPcbsWMxFIQbcaGECif6ynykcbZNkW
         qBrbgtrREJg9jZDUWg2uH/m1pRPxIJBqpe7vR+B1xbW+bdgaipZR9lggeM5UcpwvOaR1
         Yz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527480; x=1782132280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=;
        b=EAWibp1B13Dwz5AwAsIdOSBb/3JQT0DhXpUEZ1nQJdxb64+b83+rXNwQNV0M0qHHgo
         1rvBz1RTqW+G2Z70PMFC/cwlP2YKu/K44kWj9vwEVJhSW9BYAsbmBo1EhkZVFra3ewWw
         uL27Gn5dFjsbkCWIzAgkEGa46DXRl+XYmttfprkjPvFNCIDnGEGL97iIyv7Wd7GTn7HK
         VzLY15Dk5+EsZ/4r8ZAJyrtU1RoXffL/2loPwWEG0e+FnimaVjHcYl/gyLvDv7ZZBGiN
         7O0j0KtRJ24do9i4GMYBMtImsCX4X1hx7od3E9zW3oLGqpuQ4+eq/1eO5ylZZwuWWdCS
         IhuA==
X-Forwarded-Encrypted: i=1; AFNElJ/QSWBDUAnxLAJpOvUXTQDV3Nq8bcdAzIUOdQfDSKyj190aiZNZcV723u2TUdDObi2NrT5lUg0FEpKW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0bj0i2Hb0Qvb9yyRIyaKA4bAU7U7TfWBmFcy7vm8n/npQORn4
	EneZIZVL4vdETd948jxctceyNRHUpE+ZRWXi0xw5ikFVY2JVjdGeBsXHFHSqbND3VLne49ipSIx
	QTZgRXTBiG654xqQvQGGqyACMFyUW80m2weBOUi8GSR6ZPdnrOnB59U7qVGNXUmtz
X-Gm-Gg: Acq92OGaLOGHbzEf5SMIdykd8Jol/GASpzPRXr6c3r46nQKGf6/J85tob/k3aVKPa6u
	MFfazx5oykX4SotWVDR65dbW6VRnWaEiHQ1JUThs5rOFT8kmUe/+7DuGQmtd7CWIicZyM1lPRGN
	3txT3YfvywDYQ13OTOxhxyKcfxgZVu2jtaD3uvz8f0A0HrG3KKXDC1U/wXLrI7+vujoCE2Q+QfX
	cosL6GxMYgMl1nwHMRnEiT8IY2bVYOLUOjo65kTN+2ghnKORWRdv5hpjGnmo00gGgRh3QMhP1VN
	54x4EEjcsnBUmlc2pg7u7vTvtLAthGr7kN+M8u+6w/3/TUb268f/AZTHPCgwcbEO5allENYwOTs
	rxzGLe1xdxEtmSQDMVZlAVl2GQezL/LwiK2SodYx1D5KfcJ6BwREC72J/N3cG
X-Received: by 2002:a17:90b:4ac6:b0:36b:293:68d1 with SMTP id 98e67ed59e1d1-37a036ea487mr15256782a91.16.1781527479561;
        Mon, 15 Jun 2026 05:44:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac6:b0:36b:293:68d1 with SMTP id 98e67ed59e1d1-37a036ea487mr15256759a91.16.1781527479070;
        Mon, 15 Jun 2026 05:44:39 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm10350807a91.0.2026.06.15.05.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:44:38 -0700 (PDT)
Message-ID: <40d9d0d9-978d-426c-b463-c05faae1fad5@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:14:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add
 qcom,swr-master-ee-val property
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <7bcddc82-f46f-4366-a4cb-453a213f8bd4@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <7bcddc82-f46f-4366-a4cb-453a213f8bd4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzNCBTYWx0ZWRfX+ORzAOt6GB+S
 HhnGLiL0sabbfREp4sHmU9B4kDTNXGfx/lbgH9t7gBWe1qLWCf13H+9p9nHm2XtCYjdGSg0/zXC
 9oDA2o4NdAMKInMRbPM8hqJowdacGVqKVKNHxw+wIWaEH92Rv3Wfo5VyYEu1YDSW66BR4CY3+F3
 w/YFEdabAadk2EdHPRPSZcfDovbFAGfPly/RBOVH+0EPDpNkXg8CfY+uWlx78mhsDI2N5DdgHEI
 RPP03vsO8OPZ/AGNGyMykDJW0fPgVL3EkaVdYc+AtK+NUzn+FVFH4djE7/k4z8wy+9nSkjza5Xc
 edkwz1QG//pUMRTu4SR3hpdfKZlNtoYG6nojEh17awmqgipI0UBrhMzVLaNZ69O7VNZ0SitpKg2
 LzBVnvYUvmlIHvg2mQtvOcFWNcrivckSkyOn5Ee39Q5592Y+NLFCgw9qWT7Sz/DTki+88zAJOhb
 mFlByJAkp3PhHiXERJQ==
X-Proofpoint-ORIG-GUID: PovkTPnvjNUYu1KDwJKFMCEHZPrZKHnd
X-Proofpoint-GUID: PovkTPnvjNUYu1KDwJKFMCEHZPrZKHnd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzNCBTYWx0ZWRfXzhfj+5ndUlXd
 yRf2WfwTj0zWtRi9lpi12bT/zSHtYPfpxeQHf+m+a1K4lS9Ytq6vj5UWMoFN8+NAd8y4SEFwp54
 AssiatzdH/+2KSk9lBVNcwAfRBVjIMY=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2ff3b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sVLjvJnARbnZsx0J9w4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150134



On 6/9/2026 1:47 PM, Srinivas Kandagatla wrote:
> 
> 
> On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
>> Add documentation for the qcom,swr-master-ee-val Device Tree property
>> used by Qualcomm SoundWire masters to describe the execution-environment
>> value for interrupt routing.
>>
>> This property allows platform DTs to specify the EE value used to direct
> 
> this sounds wrong, this should never be platform specific, this is SoC
> specific.
> 

Agreed, this is SoC-specific and should not be described as 
platform-specific. I will update the description accordingly.

>> SoundWire master interrupts to the appropriate CPU target.
> 
> Why should this come from DT, driver should be able to make a choice
> based on SoC compatible string.
> 

Currently, the driver uses a version-specific compatible string rather 
than a SoC-specific one, so it cannot reliably infer this information. 
That is why the configuration is being provided through DT.

This is a hardware requirement specific to the Shikra SoC. The DT entry 
was added to retrieve the EE value required for this configuration.

Thanks & Regards,
Rafi.

> 
> 
> --srini
> 
> 
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index 9447a2f37..5b06cc1a5 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -215,6 +215,12 @@ properties:
>>             maximum: 4
>>           - const: 0xff
>>   
>> +  qcom,swr-master-ee-val:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description:
>> +      Execution-environment value used to route SoundWire master
>> +      interrupts to CPU0 or CPU1.
>> +
>>     label:
>>       maxItems: 1
>>   
> 

