Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C650C346A14
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781848781; cv=none; b=GTYrnwJFVdxvbisYA0kj+AZgS62IO28WUtZZBBTabQZbrNS03EFoP1+LCnwN8WwuNZlD7Yb2+DPdB2FqHLF3q14K1N7LansAUPEGU3Pug/wzW4mWc4dnuBcf7i26+2DxY4JlQygSWVRN6zNH41tA4eUxz252wFGiWaV0/nvlYg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781848781; c=relaxed/simple;
	bh=fEyzOrCThWgarJPoycF9QcuaJndtT00vfgVkEpq/DXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvzKD/84mLTr7KFqqTHDUnGIN3qM/qukt+RImdZu7yTdu4hmryA/4oAeOVAXziqa/7b5GogQ2mT9ZrLoHhnSF13Ut/fMZoYYkhER4iZKTaWA93lcBlCDgtrSt1oB3HT5gpWRL6ow0ylfacYAx5PTrBGVUJ4UL9VEQ9KZc1IdRYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEi/PO5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoUxzg6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEi/PO5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoUxzg6L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J4vnWx3338257
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1LAW38Z1CsutV1AW2S+IjjxuMHjg9mfmTBAH8Mvre3E=; b=DEi/PO5e29rhClwv
	ZN4v0InmvHItIrNu7M+lRLhGeOVOfO6x5YuDOYmtA3NvFdcHQ5U8y8nUP9uF87up
	8Am6RiKKVWHlS8sz+ChXycU5DvpXSP8UACNCmop55j8njz/ubBfMTpShTVmbJgqr
	r8kvLgTTcaVjHSGHBsPKOAhtE0RiLEdpyNMV9VdgrxyznBcoUC9u4fKR3/2iuV/m
	vbvq6A7KdG7S6IhG7oXnh1wcRKiPQuU2pcZHChKZ3KlcCSQs4JFizFQczJG8XTtq
	hdv8haGRuRy4NP9+1MRWxu5jdi6HlSnPm74x5I3MtADyQmZ1SEmLmMOyUyYAvozu
	j3Z0fg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evy72g4pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:59:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso1212554a12.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781848779; x=1782453579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1LAW38Z1CsutV1AW2S+IjjxuMHjg9mfmTBAH8Mvre3E=;
        b=YoUxzg6LUUuNHatDoQK0nW+/wrNiU1wdFMTZ1SZihNJgpmKj+Y3GLSA6xehf0ntAmY
         EBlH2Srz9Hual051Tx6Vl8F/fvptuZ4OaB7ot6RqkR4+0qvqs8YpzkAIrxepmRaLBxy2
         LP5d2CMl/nIJDI4xf/jWwWlc8wlLBPhM4NYZe8pxqPGLSA5V3Z0Q2KTRktDRY42+5waT
         t57pURZjvicFTJ3f9e17VaHNwCLTA19YFp2hRufuT3pbjsHFvDIg9kq60FVnvMd8eQ7t
         RuA4ImuFYOn0Af6NZ0rpRCOhyBP1ciL8YXMIDKF+wYTfRe87PZTLuQiU6VTSvkJMsDpR
         I3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781848779; x=1782453579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LAW38Z1CsutV1AW2S+IjjxuMHjg9mfmTBAH8Mvre3E=;
        b=e5IeUXdGQLYsU/eMYLZm4ZhiiTM7w0kSvNhqWT106E48bqpf69j2gYrd3Kcm6PZYZ+
         obiGi2REx3QcrWdhZchKhyL+xuPmff+0ZiHZkePdpFFXpg/FU3VigdGkfwLakpL0Farm
         IpmOMskXDNKpzQUI3PhUZ5tiDTiOEyFWFC6nux3f6/Pun7oeJd1VasxWCvoFHT7NWO29
         9QY5EUjJcmHZnkc0WLftR1VrlthWqCGoWrC0hhSkk6vv+k9reBYhFM4+7DnRgUN5hAvS
         R1ydqjIpDIY1NDwNQLgw4jgZjBHK7JeFeAz14EC1eVeHpi0At9VJ/I7R1Bd4BKwTix9g
         TG8w==
X-Forwarded-Encrypted: i=1; AFNElJ+NEajsc+u/3crer6h3e/xAr7rX3n6KUYYznQW5SFX25vltWpDVuS3ERyfvXtYeUpWjGpK2iXJCkOg5@vger.kernel.org
X-Gm-Message-State: AOJu0YyS5yCtnMp8lCVRX1IjPb4NNZBIRktd21VLvcr8mdXulmEZ5h9q
	mkxzUeY3IiBDJhVm56StjEYGdMZIA/ApOXzugTn9CTU4CbK672lO5lG0xeVAN1oAFoJg0j8DhCS
	bQ+OgKb2tpybdAzyGBLw3d7v++O73Qk0UXtkgJHV1MymuvEXiY+wiQLuIXhb3dRVFJdGXZEFJ
X-Gm-Gg: AfdE7cn2kNwscPSzgk5+ZfzpMsaZ0Kh/mDbFDlNQIosn5gQvUJsAiLBCtDtLLJ2GD4E
	bV1hn4VQTGAHnVQJm+1Uw+ANEbNcHZyjw7GE7FPMJMGRLOPZC4Xhifk8/zj3SccguMs4xT/nb1z
	PfGyJr8KQXPq14YDNUWO4aOrdPiRk3g98fWiJG/TLHbGyAWAn3Gc1Lk/mydAUu/nweIQrrPzDHq
	f/sdnbpsxD4pXRH6k+2/rAdxlI1MDQZhnBLEkq4rJmLnZBnBJeW7VbZTrISFFjQev6b2llU80mT
	vGtR9QedvSIazIMdNSuFHHAT8IgmQg5BshzvBYb3t4k6qG9eNZQhhdimXo9+jFeP8ZKQW+YmOLQ
	gxoOJgWzx1zauxzciX5imOY9XP2lGb/d0npn+y3l/
X-Received: by 2002:a05:6a21:3990:b0:3b4:813d:dae with SMTP id adf61e73a8af0-3bb32321893mr2465237637.16.1781848779328;
        Thu, 18 Jun 2026 22:59:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3b4:813d:dae with SMTP id adf61e73a8af0-3bb32321893mr2465215637.16.1781848778901;
        Thu, 18 Jun 2026 22:59:38 -0700 (PDT)
Received: from [10.92.184.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a89681011sm1192675a12.31.2026.06.18.22.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 22:59:38 -0700 (PDT)
Message-ID: <cbcf72a1-cdd5-4cdb-86c5-3f40cd79212b@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 11:29:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
 <20260601113009.38FC81F00893@smtp.kernel.org>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <20260601113009.38FC81F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1MiBTYWx0ZWRfXy+FR7pmhx0qI
 eZ/iIPXWrMIeYxmSrtiX4K9EsDrc44EeEE0nfq62RavL1NlOw6EUdSh6KlK57WpJhyKimg0+8hp
 vMpeUQtF2bMD245yWXZpQoBxtsp1a9QKEV4KcX+Xhvdx8/upNvTdqjJxRbakMketGr8xAltV1g3
 gjkjjFe6HOo9yu/JPfNcduMMR/yBBQzZtYo/50o/y+9j8Kw+xlVT6L1/qYIIqI8lEsva4lNvar3
 18ZBCs+ArwR8I/EQC/LpKvPSE+DNQ27S7qdQc3eeZcG1mMoiFazszdSYtBRWbzvd+TJ1cmBFz7P
 HdOVhoy8lBHhMU5mCLoBXTCJttguFcmTKDAh2a21uy2lydQDQ8RTWRnfFX3+/5m/zz1POZa7rgL
 607Yp0UVoWL2FdzlMYm0Hh1Bn0tRz6fbMD3RToq6TExhdnyqMewDScbRkUPfkE6Vbri0BHrzAT8
 SrzwIfa9u4l332iY3Wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1MiBTYWx0ZWRfX0ELiPKkvAzys
 9dfmvMRiO3E5tQB1Tj0qtjy8CdYWOzO+dwit15iX8Eim/ApZsKmgTslDgwxgs+G4h1Hg095pNeW
 mJlndk6dAsynGqVtZ68+JorG5OhsqDw=
X-Authority-Analysis: v=2.4 cv=I75Vgtgg c=1 sm=1 tr=0 ts=6a34dacc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Mb7mJfqsfCWBU2XDFAEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dKG2y4OEw7w4K8AfTp_qjv3txvV5UmLZ
X-Proofpoint-GUID: dKG2y4OEw7w4K8AfTp_qjv3txvV5UmLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190052



On 6/1/2026 5:00 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The PMIC schema restricts the standard 'temperature-sensor@' node name exclusively to the new MBG TM binding, causing false positive validation failures for standard-compliant legacy nodes.
> --
> 
> commit 1c6b45c4d32f87b04fb868a977041acc92be3854
> Author: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> dt-bindings: thermal: Add Qualcomm MBG thermal monitor support
>      
> This commit adds device tree bindings for the Qualcomm Master Bandgap (MBG)
> temperature alarm peripheral found on the PM8775 PMIC. It introduces a new
> schema for the MBG thermal monitor and maps it in the SPMI PMIC bindings.
> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -193,6 +193,10 @@ patternProperties:
>>       type: object
>>       $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
>>   
>> +  "^temperature-sensor@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/thermal/qcom-spmi-mbg-tm.yaml#
> 
> [Severity: Low]
> Does mapping this generic pattern exclusively to the MBG thermal monitor
> schema cause validation conflicts with other thermal sensors?
> 
> Since temperature-sensor is the standard generic node name, other thermal
> sensors under the PMIC (like qcom,spmi-temp-alarm) might use it. If a node
> uses temperature-sensor@a00 for a standard SPMI temp alarm, wouldn't it be
> evaluated solely against this MBG-specific schema and fail with a compatible
> string mismatch error?
> 
> Would it be better to structure this using a oneOf block to allow multiple
> applicable thermal bindings to share the standard node name?
> 

The reported case does not seem valid for this binding update.

temperature-sensor@... is intended for the MBG TM block 
(qcom-spmi-mbg-tm), while the existing SPMI temp-alarm block uses 
temp-alarm@... and its own binding (qcom,spmi-temp-alarm). So in 
practice they are distinct node names for distinct peripherals, and a 
normal temp-alarm node is
not expected to be described as temperature-sensor@....

Because of that, this should not cause a real conflict for standard PMIC 
DTS usage. A qcom,spmi-temp-alarm node named temperature-sensor@... 
would be a misnamed node rather than a valid legacy form we need to 
preserve.

Thanks,
Sachin
