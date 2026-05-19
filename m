Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4B33F6C4A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182192; cv=none; b=KxnGM2MlbshEf+QxHkZPFJTJTFRbxw11bLUqOD3wK9QYTn19qCXucGvX4A46iwt8dJRhAp6f8Atg4fGzG5ywHnYKFtKor0+xR/i3a50BXYyrwqTSITlvYpKLduO4DB1rF32SltnClo5CD3hAg9WuhNvZpwuVB17RAo1bjUPv8Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182192; c=relaxed/simple;
	bh=meiWCPHyURF5vDzlM799sll2lsGfBrKbnf/hnAW+oXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmjxPzXawjhZ2JX0a17UhGctaO/QsfAIODje5DW77EGMg47/oz7wV9sDwNUD41IlrcalwCV6BfvShKmuX1wfHXV3daRce0v91oq60pXd6txHGPa2vGuAJ2n2vkB8h6wHUIQ0okCrqdJus4Ffmr1soQQJao+lMRshEhWbbtqUc+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WV79AhLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VR4bPjdx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WV79AhLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VR4bPjdx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J96tm92091264
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4jAbOofP9LU2wzeFyGIgRya0ftzPYY+XoOJTSUa8Gk=; b=WV79AhLxQEqsZMv+
	a//NZ6xbPX86W69ez5T5GUi3ZkdWx2qDNblu0txR/sCQBTTr9nqJuy+Xo4UvXyHH
	LZu6G1dOi1o1L0QAUwCB95kgJwKxkJfc4f2BmtZG4EsB/EA0xnnjEaWVIVUaEHm/
	7KznTSE8BHljEbOn6QS4Z4gXx/9wnF/y7Vz0aNTrBihtnSod5hKSV0CRVrg1fioO
	EpWPV5IYNppyYgDsb4h0CAq8tPzKkqbvAmeEruArsWqfvF/s7H3aIVu3eyTclb5F
	U7JGKh6eaDquuTHuaQTR8WjViwHCbX2IX4Bf7AGx50xDRNTlh/9utVt2YVgl3OQs
	z56ybA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpmtr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:16:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83544d05c5aso1664383b3a.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779182188; x=1779786988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4jAbOofP9LU2wzeFyGIgRya0ftzPYY+XoOJTSUa8Gk=;
        b=VR4bPjdxxQWsqyOjxQZnVUBo4hmrDpZIyOOP0J7mS01JAhKqwhNoXy7dUaZsAMAnnB
         7S3k+6zNZCHUXJT0cQO+7xX/fzEg5AtqqRzDUzv9aWyjMRnfUXJLA74eYnAkUDv585t8
         2jGNSAM+/WpfMYFFCaQ062R9fLIhDOjOnG8K78uHM7+4P4GtRs1tPUT8FyDrd/Q785yt
         skCTXQeb/H0WJmO61bSJPdVXrqwdI/DudDpesVk0Bk8jdahtZ4Vr7MB3+tcEoaLd5Ld4
         /P9hxIekNy6vNx8OfdE55j0LchhFDPSuRUQi+TGlFTPCF+nSk7pefuOKKoFvqBVP1qc6
         GnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182188; x=1779786988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4jAbOofP9LU2wzeFyGIgRya0ftzPYY+XoOJTSUa8Gk=;
        b=O/Xgz1MSrO4Y1Zpk/foESscb/BzTRXLKDUTEKIPLtBQzBZLxSH52NcWRF7l4yhlGVW
         b2nizC9MEWZX/AUbfluFuVvPcX80hf+RbY3vo4z4DnH6BirEUiD2K3j4VDIcPzQEEd+4
         OfFI5k3WCIzFWoIgdXbo5amMuQe0T2skOy1KwBCMKXji8kp/zjz6gksmZGAG0HOZ47Mg
         jqH4Ay0iOK/l52SghYdJCZP41FGcc3gXUUwmwpFfBK1kCl7LBmK0OUr3k9JpvHIDkTY9
         3GsFel/Sdb2CZ/P5cJnKnfiXtQywXpcQAQcZPePiXZj7i4wP5BIJdjhgosTDRa6/xIg7
         kabA==
X-Forwarded-Encrypted: i=1; AFNElJ+FxT1XT+72wwwsfbv7A3CKFW/rfqCqn29gPPizmB8zVbF0/yQMmQY/2euy2/DiGuWrlftfxlPtY9Ce@vger.kernel.org
X-Gm-Message-State: AOJu0YxK94OFx1BFareynGjkVqH25YEsNwo9dWTHtw3HyzsGu4aTIy53
	QkvDGp+3rq1lA2mFr/TB/kEXP6H+H7Aifw1mlQQ0BcQbbJt6Ha5zu5Qec1I+oRFk3kUVVFBzXSV
	YtKreWrYxXXbJsmJdzT1PKVziHGCYP/aHgtG5eFftGPoNdcQkteemOl10kXPCmyCE
X-Gm-Gg: Acq92OHLyPJKul588cyD2N2iUqG6RRSX7h+bC3WraRRxPWlDBTxa5wZSYFh2L2Qn77w
	IVLa0jKhwuKoaJijiOdJBqXbqi+GWnwDeqmLB73xODQwcWorDtQsyWQdOT/VYgK/Lfu2UnMJvBV
	1PXIlJfhvQ0VxrvobiDqXtrxwv7zWwFwKBm4JswUxMJPWH7m7VNc9onkk15c/1YiCQcTcaCew1Z
	zM5O4C85RsTH39xecJQKEviFX8Yw8aZHC4d6uewaNggb/cnnBTUI8i1pYNfyejSE8nxzjITGlPp
	XlXySDAHaDKx7BDzkzonWoVLj2M8UwM2C8GlhU6tLx7V0GChwa0d9ihrfzcl345sgotetjZ5y6H
	aMlUJvwOrgv5+urNSucnMzdelUTAZTZS7EUodIiYUjGdCPuJ+
X-Received: by 2002:a05:6a00:2793:b0:83f:2568:d456 with SMTP id d2e1a72fcca58-83f33d277e9mr18248169b3a.29.1779182188306;
        Tue, 19 May 2026 02:16:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2793:b0:83f:2568:d456 with SMTP id d2e1a72fcca58-83f33d277e9mr18248149b3a.29.1779182187809;
        Tue, 19 May 2026 02:16:27 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197815cesm21166287b3a.24.2026.05.19.02.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:16:27 -0700 (PDT)
Message-ID: <2f490d31-07c6-435f-b96b-0857471c03bd@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:46:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
 <20260514100608.4E1C8C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260514100608.4E1C8C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4PNDNMwJ3T-OjXTAHq-birq6TNoeDUs-
X-Proofpoint-ORIG-GUID: 4PNDNMwJ3T-OjXTAHq-birq6TNoeDUs-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4OSBTYWx0ZWRfXwaD+gl2ma6zy
 +TFOk9wlXRlyZ5uLadyThStFUq3jU489gf6Jxau/9dDuwStgQZoiBX9JiAx+u1r4UmwPZA6+LTG
 V+7fXlKawNV0OvuVBvfbNAFyWslCzm0PSnCvViVW7yrnP2Xb+SD17rUhlsKEHc2abTXwXZZU9Od
 JPYhpMnEq4VNP3dblg1noPuLgzclL8YE6Puy3nfDWRYhgaC7/STBttoOtZ90ZP6UIntaRbeeRbg
 aoYINMtnBONAD+sUZkh+SZY1ByFb2MiiQoj9lslQulQ+bDEXZvJbLc5EAoHa6IK8EJzASWMUP5u
 XwUDYUQ5frFx5gkife+XhaDx71WFmh1ZIRZ+tM1Dc7gsZkUqdyCApuG1tp5SWsBm3AaYhtG/iWE
 zyfEpTlbb8/0ws6aui6owAFdz5h9S5c0u9KrMsJtKllYoIy28h3f2JcpFtucKo+qmFynZE5JUNp
 AY5s81MDQBpbZmQfL+g==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0c2a6d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s87QuijNsyLxGFwhyOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190089


On 5/14/2026 3:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The device tree binding example provides two interconnect paths, violating the `maxItems: 1` constraint inherited from `qcom,pas-common.yaml`.
> --
>
> commit 6b248da80633195199f478d98724a0590dfdff63
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs
>
> This commit documents the bindings for the CDSP, LPAICP and MPSS PAS on
> the Shikra SoC.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> [ ... ]
>
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> [ ... ]
>
>> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>> +        clock-names = "xo";
>> +
>> +        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
>> +                        <&system_noc MASTER_CRYPTO_CORE0 RPM_ALWAYS_TAG
>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> Will this cause a validation failure during make dt_binding_check?
>
> The qcom,pas-common.yaml schema, which is included earlier in this file
> via a $ref, restricts the interconnects property to a maximum of 1 item.
> However, the example block here provides two interconnect paths.

This seems correct — interconnects constraint in qcom,pas-common.yaml is 
currently set to maxItems: 1. I willl update it to maxItems: 2 to 
accommodate SoCs that require two interconnect paths.

Thanks
Komal

>
>> +
>> +        power-domains = <&rpmpd RPMHPD_CX>;
>> +        power-domain-names = "cx";

