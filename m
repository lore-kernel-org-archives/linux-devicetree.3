Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D631ED93
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625572; cv=none; b=tfe68OWtco1ino15RIvwMTz97ifsoeSDi0BqAmHy53VOb/b0ka4XF5eSA6PeDizpBS3VvrIp7zZnVs2DN8fODdErFtRegTx+8me+8wrP9HQjBr+o7qDuD1ikLr0OsQP0PqdT5AEti9LWttf4jWGmravcz1s1cj+XUBc0PJgnO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625572; c=relaxed/simple;
	bh=30xKD38o73VXa/hJ0JOvY2xHjIVXoiWOnOPEV1JWW2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YV4o4kjFFiy3fjnWmy5NR090ogiBGWsoghRgTrQJVoNvHdBzxgPY5qT47rvM3avJx0vtIw3Fyw++mz9DhIOoYR+OCiw+az9HPX0S2xEksufASk5fnbor0ZALOL0quqE6jQUZseoPXmJENTLkT5or/5a6HtS/mGVp3hckyW5+eHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3iG/7UK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWCA00AR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3iG/7UK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWCA00AR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2QxVc624777
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqoeoOu+8PfjGTZBzhg+XakMcLe1cSmMdGUV9GViNyg=; b=X3iG/7UKzeiRBoaI
	VmGc2DyxCYAbbvzfXRLabwbVi7hdkpTr5t4X3iJN+Ha+D2LBOXEgTyo/d9egZWfg
	ktzK89fNSq+/1cJuT5Sw1di88WTsPCPOfVKs6O5LZ7uQKEED28Vvq9lkUfcO0lSF
	LmxjnNmnToVBhSm9/S2yuj5N3xcEvTMIIHHCjtrOAYT+ulNawIAw2upjzcYnDwtM
	ocDoNMFefuiNkZSHhsxGC03zL8aNP0lZx6TPmVeQgRjnrtngtbLA2Q3RnBezAUKV
	dOHIwfN5Ib6wfa9dQTIiRSu7ih1gXP06AfihyvOLO3DpQ6/E20L8GTbXxIDUVLXA
	z5cIRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdju48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:39:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so6358503a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 19:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787625568; x=1788230368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqoeoOu+8PfjGTZBzhg+XakMcLe1cSmMdGUV9GViNyg=;
        b=TWCA00ARyL/C5wIb0qcBv/LIKGlKpQduxIsVihAP0OxyGBDoAVLfDnMWa6sGvsbOmM
         MbelUo2A9dBtNs9NSfe8pQopnRXWBwNzLgpWLiz5wuovv3SXaJcYWflAYTm06vXvJ3v9
         j/55ss+tTqLVEZ+8FAh9X5/ILxzs0NYgjvH4ZzubbswS4/bi6rBkmJR2j5mXtgYud18H
         LLPUUbWg6NbzzZyglHrvI3WoALV3pSNa04Wzzl5WQw1HfeJoC8WYa9tq8SQIffkF2NFA
         l4Cbcf5xgvB9LCKDO1fMQLAG7wQUa+3inrBJBJOfTx/zqCo3T1CGqvaXsyifHOQo30vm
         /Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787625568; x=1788230368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqoeoOu+8PfjGTZBzhg+XakMcLe1cSmMdGUV9GViNyg=;
        b=CSjw1S+0y0hg5WWnCDLGpQbohAOzf5eycOQCaQIwjyZtZxcWCfKEyYXwn1Ldz00gRX
         XbKYAayB47XrAFb6nR6lYxKMlENIbzDYOfoXvfA4mAXy8fPyaQ9bxhfPQ4kJ7vNrTggP
         Dyhj9V5iU5z5J5Nf8m8EPffbD66x2sW/8FCxnh73ftUSyl/Lf0U2UtLaCwChZtr78Sb7
         Fgru4qayORW2cX9Np9mO2NYamdbMKpjNv58A3yPYIpeOIOoXxecQpmTUbk1c8sp+nWqJ
         pq7I4rJEt2cHeQHIdd70ViWwP6V0GyNcIE786P6JHwWUTxCL5xaWVJ1DnaHtqTbO3nsb
         WiDw==
X-Forwarded-Encrypted: i=1; AHgh+RqwaCjqNtDj6fecP2Zzx9qbzS+DaUe3+77pWPbkj9k7jIoOKHg8g6YsSjxSj5R8rp0zLVL/OowIaS1L@vger.kernel.org
X-Gm-Message-State: AFuF++mC2diwcz5U88V2hG7ZmALEpz9oPXJqVQYE2zw16HSIdekKF0OU
	CfZmw0uPu+Sltwb1rfZm+Bm7AiptzhCKYT20gyJQnSw3QuxHXR4Ud8MD8UnSPo6aez7Cle061P0
	kvD8J0Hc+PGyq0WTJ/mtygnSiH5aw3WMYh3VDk2yj/qiDUF+4tmQeTT5rUFTV+UaN
X-Gm-Gg: AR+sD12kza5teBbNbVXcjBAeTNg1dEo3/O/VNwpLp3odly2SL1fy0/RuRCTOgeVLQOl
	cBAwf165Ci5DN2LTUkNI1g8srcoZlN5zKrQxKPKViidGwMBZWTnQ7EXAFo69Q/0B5P/VU5MDVBn
	ssKzFeVKHmEhwXW6kInbAIqZbPoYAGnP0zMObiHddeM1hmmJ0FkR2GEpwAnvHF0cMenh5vtr0Kq
	HP6l3AXVyoKXf/8U3BqCEaHnsWYNjisRBZ2TJZgFoAalKoVm0JKq6IGUymOXk3tCepDub5HfnZw
	fbZr2jrA0lJrzhW+bRMkOqdAZSkBNo6v6Vy9GmPNY+4gk6OoOuR2tuvuNsCC0P8C7GNXTQB1pr6
	xWp9jes47NGdu8Qqasl1M3SafNeh8YmusTjW012XVxGMGRFel6stlz6yTYQfAKtmaOjpn
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr5422592a91.1.1787625568406;
        Mon, 24 Aug 2026 19:39:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr5422537a91.1.1787625567955;
        Mon, 24 Aug 2026 19:39:27 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39646138f87sm1707105a91.3.2026.08.24.19.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 19:39:27 -0700 (PDT)
Message-ID: <d129ce45-0769-432c-bbc2-76e992325dee@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:39:24 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
References: <20260806-qcom-spmi-haptics-v6-0-19fcecd5204f@oss.qualcomm.com>
 <20260806-qcom-spmi-haptics-v6-1-19fcecd5204f@oss.qualcomm.com>
 <20260807062927.548EF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260807062927.548EF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyMCBTYWx0ZWRfX1K90Quu40NTk
 UblCuF2YnXBj1WUJ8k829Tn6gHwe/5cBlH5OSOep/M9M6/tx4i21yT0Ea6SROTkGVAgK0Sm3ynt
 1cmTgG5RxVs8uzkY4hKcHvcARUkxaV8=
X-Proofpoint-ORIG-GUID: vcdNCCmo0VkGBRllV-xv9TugbR8ZmWhv
X-Proofpoint-GUID: vcdNCCmo0VkGBRllV-xv9TugbR8ZmWhv
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8d0061 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ED_tUBg3TPI6sqZwEIEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyMCBTYWx0ZWRfX+mxUrvGx+4hM
 4W9t4+2rzCT0UfuCfsWo0RJU6brhxTa7p1DUV+DMHtvtMQddQttfVempgghQ55Oi0erg6VjhNzV
 SfQoSwzoNEGqtJqQJvi4JE5ckhFc2QXU3zlBp05oNEB122f9jd971mLo6V78bf4SU9++ww66C+W
 T7BTIRYPxlYWmNp2m66LSI1qXgkaY3YgQWkit0cxyqjnAYvnxUyqVyaF/VLDCZiyLSloDT29Q/T
 CujFhinx6eZHMOPNJF2/ZHzwFYMRfxBFhSbHtw4vVzFxVWe8arZriMIupXKfe65anQT9eolMw5h
 +bAWePE1p7ZNJk6SIHjTSPr7C2OglK10rJ/xLKJn21NnQvOknnPCBcfowLhBYJtnHk+eONGEhyN
 oOTdol6DZ6nfcgwGDYwzx1Ci8s0irfbD4b1uEyUbtLIP3h9FbhxFF09sOZfl39DlIfmcQFhtdye
 ngRzeJnoDtSfJoTdgEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250020



On 8/7/2026 2:29 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing update to the parent PMIC schema `qcom,spmi-pmic.yaml` to allow the new `qcom,spmi-haptics` child node.
> --
> 
> --- Patch [1]: [PATCH v6 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics ---
> commit eb446753c24c30e9b557074281da814e0e94aa51
> Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> dt-bindings: input: Add Qualcomm SPMI PMIC haptics
> 
> Adds a device tree binding document for the haptics module inside the
> Qualcomm PMIC PMIH0108, which drives a Linear Resonant Actuator (LRA) and
> supports multiple play modes.
> 
>> diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>> new file mode 100644
>> index 0000000000000..b1a69e9886ee6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
> 
> [ ... ]
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    pmic {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        haptics@f000 {
>> +            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
>> +            reg = <0xf000>, <0xf100>;
> 
> [Severity: Low]
> Does the parent PMIC schema (mfd/qcom,spmi-pmic.yaml) need to be updated to
> allow the new qcom,spmi-haptics child node shown in this example?
> 
> The parent PMIC schema has additionalProperties: false and explicitly lists
> allowed child node patterns in patternProperties. Since it does not include
> a pattern for ^haptics@[0-9a-f]+$, will device trees instantiating this
> haptics node fail dtbs_check validation?

The change which adds haptics child node in the spmi-pmic schema has
already been applied, so I dropped it in this series.

https://lore.kernel.org/linux-input/178602255123.2917765.7426706813083510078.b4-ty@b4/

> 
>> +            reg-names = "cfg", "ptn";
>> +            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
>> +            interrupt-names = "fifo-empty";
>> +
>> +            qcom,vmax-microvolt = <1300000>;
>> +            qcom,lra-period-us = <5880>;
>> +        };
>> +    };
> 

