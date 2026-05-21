Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B869C3FE657
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370416; cv=none; b=tZEwrpDxxRTWGOEgyfr6PFhyjQDxKtoejdX4INdaKJ9VPs0A5eGhQUo9lhZ5GccRWt2WXzlIxau4DGR0/upz2ZjLi9LM1cpdtLSlrjAf+PWU169jNpLvQ6aP5/1KM2JcrA3k3FcSxqbsLW0Qpf7YQUAhvMCcyRVOhffBrKEjcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370416; c=relaxed/simple;
	bh=omTSRI5QDbAE48o5gj/pF9REcCIQsYOtUUvqIJycswY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHHyOb+QCDvYkp3+dXVhlnrKXexzFcC9KTSC1oxG7vVnXN0KUvbyy0v/nRQbnMq/NMfOJbbgKdMcRJ8/w11VlySYWqMYogIIzlIKEX7o/pZ8GSkHc9gHQX+Qyd52k7fsjmkopZbeB9iUXZd08IAFFMKH4X1Gezsy8/waDoXvXpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1tjIUmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDcxoX87; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1tjIUmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDcxoX87"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99xDx2632717
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdH3GzdWYwa8Q9g94MkFFyBEguHq6S6gLpwxGL6T8Lk=; b=N1tjIUmdoMUeArtK
	wv16fhVTlZgeOgT64/QAU0TQmUtrNWAI7InzUUnlZegw71TxbGXHq7q7pcJAVJic
	K+uivRbB0JV3lwhVzgEMIVAhMpIHP/yc0ZxCdMlQyn5WxSRwNdA2jyGpTixiRF6i
	cFC4rqskn3u+LNMH/lA5F9W82UlvMVtOgzMoj7jJARaIWd6nCX4wZ7LrWIjVKmOF
	BEMuY7k6XugMo0me3LP4lZMIAdMH5lnMGkQFCeO8bNesQgQ2uMX894t8qxqXYUvW
	14kiG+bSmYr0GgzzS1+c18Xw3CWKjK7KFzuaXV9G3c29Tbsu4wR0GhUA56CM6No0
	9xSHBw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8d79f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:33:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba86e35aa1so103138415ad.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779370412; x=1779975212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IdH3GzdWYwa8Q9g94MkFFyBEguHq6S6gLpwxGL6T8Lk=;
        b=cDcxoX877jswhPSTHmxgsrNPDefRzLoSYV/nc4zY2FUEcSyXBueboIygErG7josP/n
         qKfqMVfDfQj1SMDrge0mXCBk+WnOkUwZNplJGyfB1wRYMenHHFh4XEwtJ7DRVUE28YN5
         fXb4XUdOwcs+xwzd01yi1RWA8qUh8ePsQjlCfOVvpuwZmPl1emlBog3QsMgrCl42uBqU
         dW9c7ceSQPihINH52jYkhDzdgj87tNlBqW+TLAkv+CNNfz4ZJGLeNxWlDtOws2a2ULlS
         wBMGoFkqXh/BfwEjVVBAD4rFyQlBSKafHEbWPmdfANqf2P0Rm8QGw+qGOvVWpGj4E3iP
         7PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370412; x=1779975212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IdH3GzdWYwa8Q9g94MkFFyBEguHq6S6gLpwxGL6T8Lk=;
        b=aErb8aHbLQ5VoadIHOLsvxUpBcBCqZsg1M72hqk03uCNeUgeTg427nzdCrT+YrGYgE
         zJxQ4YNjKOGg1p1swKpf2cfViinsmHJRqZes+pM/NpyF++ORDUBWzvi71yvus2/on6F0
         KpDDuQCQeO3Ngn48xaD46E/RJTQdDPUDdYtxu97c+rWx1TBoUUQBs7Z5PzrL6CEEzjBx
         yMGFLwoqMrYFxuaehrs4la6ISx05Zrr2XjeKkUx3rLBdgTHwgtCohZaJZLKfuqVK6OMT
         qO/GulCslWZeOcgxYOTEoVjoLi6wuuqKY4mTzJPufnoCiovUMH2s7RaI85hJN8tgrkZ4
         qpWw==
X-Forwarded-Encrypted: i=1; AFNElJ9g8crapWtWkphq5bh8Ok64XyfN5Jntosr16QN3Y+B+2+AJjsXu1FMfGUcJUg3+OsGQ1ihJOSQh1HmO@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIW1vlXmQfckXCstw8IitWdq//LMMot/pTVTE4N1J9rtjc8hX
	KhPDgfCSgdTntoZi/27F8oOSRnTs1/tKhAAYRXH0byYVmGcXIcUiBOCz+Sg7VeBCfbaZafuQhSr
	uMzBdfJ3jBE1DZjuTGy97UZPd7lB+iH1NF3kHJ/HHNxYLu/j1T9Z8pcWCRRtRoMtSh+URJz/W
X-Gm-Gg: Acq92OH0OYn2p0OHhCFEDTgvE1iEGurgOpGYJPpEWx5gXzgRg4lg5iev5Nol4CFjPgc
	lUfFFULNwMGCiLVHvJrFX9G4IZh6iEQlX0HvI+S9Lt1hXU+3KEa01GnUn2HHqKGnxH4JXuRN7Zy
	la8ar5/hWnGk+LMIXM+Nx7Bhr8utmif03Aj8c4nL977LUqRACVXp3PfMXy+vzdR17QGwj5UBGap
	5IqL4LTTbc/iKfeXaPlYeaGkcPiCw0sjbajHiTwGk/YzWcImHcs35RlS1Bk6EjcHdGD7HYOEQ77
	+C0tKx+xl+RNULe/RgjLx7kp60q42Ubbnl8VF2DQhrXvv33AXzSXntdGyQ/aNxhNdTnz1TQk1yE
	qAa2iLRjpd0cdEn509u8dmHOxeyebH5fxuKLoAvTtGCqGoGp1
X-Received: by 2002:a17:902:da89:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2bea32d02c6mr33845145ad.5.1779370411841;
        Thu, 21 May 2026 06:33:31 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2bea32d02c6mr33844565ad.5.1779370411223;
        Thu, 21 May 2026 06:33:31 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9172520sm13349495ad.6.2026.05.21.06.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:33:30 -0700 (PDT)
Message-ID: <1712f500-d4a9-4387-947b-b02853484d21@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:03:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        neil.armstrong@linaro.org, vkoul@kernel.org
References: <20260519-shikra-dt-v2-1-c01b90fb4395@oss.qualcomm.com>
 <20260519113234.BA75FC2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260519113234.BA75FC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o-uF_fGtP_gaTHQo5BVvVGeo9FfBPqCL
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0f09ac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2bXR4lxtNcP_XfbIfakA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzNiBTYWx0ZWRfX0Jc5JYlrrloc
 0VTW2y/QOg2ys8Si3C7AlWxrUietieQhnMAQpEjI1vhXY8FrcuHjYOQ+UvjxteWGWSJO0q/yGWY
 navyzv8W/atQIkRgrwihUIVXb9l45J+lJ//D5a5jdUQ7KvraQt5hKnoOgUvUO2urPk2Rk+aKA00
 hYGYoRDU7w6JMHOcyG8V5UbUF0qhoZ0534R9pPSCzB1lncCqblFd5y2S3qWr7Gr2ipkSVIWCmTz
 rAgYlJEZF+5xQb/AjOp5YC7Aw6WG3pglziBBC3FZ4Hc3M3Fy0BpgkwyR6FQ+zvKPUq7hZLUu1lV
 8uVY3D3VxLy5CoP+vlSJjlSKxmTlQAPBrbZAUzr7+0K0uT7vZFNO1QUAvR2887ETDPdFlRKlUgE
 NWQrUfPkEQJ0/E0pbxVY3UIBJSdx4KLR8saEDGhF2x1VxBTqV9XunZpuE7CJWWGfaiC5klOhG2n
 XGLIaMwCd1+GowIM9sw==
X-Proofpoint-GUID: o-uF_fGtP_gaTHQo5BVvVGeo9FfBPqCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210136

On 5/19/2026 5:02 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Device tree compatible strings use generic abbreviations instead of specific hardware part numbers.
> - [Low] Alphabetical sorting violation in qcom.yaml.
> --
>
> commit d5de85f1dcdd73430dd4bed54ebebe0837ba7f5e
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: arm: qcom: Document Shikra and its EVK boards
>
> This commit introduces compatible strings for the Qualcomm Shikra SoC in
> System-on-Module (SoM) form factors and their corresponding EVK carrier
> boards.
>
>>      Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and its
>>      corresponding EVK boards.
> Should these compatible strings use the specific hardware part numbers
> (CQ2390M, CQ2390S, IQ2390S) instead of generic abbreviations like
> qcom,shikra-cqm-som?
>
> If the generic abbreviations are kept, can the schema map these
> abbreviations to the specific part numbers to document the ABI?

SoC number 2390 corresponds to Shikra, so using shikra-cqm-som style 
compatibles looks appropriate. Same applies to shikra-cqs-som and 
shikra-iqs-som.

>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index af266d584fae6..7c5c5f4fc30f7 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -968,6 +968,24 @@ properties:
>>             - const: qcom,qcs9100
>>             - const: qcom,sa8775p
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,shikra-cqm-evk
>> +          - const: qcom,shikra-cqm-som
>> +          - const: qcom,shikra
> This isn't a bug, but should these new blocks be sorted alphabetically
> based on the root SoC compatible string?
>
> Since 'h' comes after 'd', could qcom,shikra be placed after qcom,sdm845
> instead of after qcom,sa8775p?

Yeah, I missed it, will correct in next series.

Thanks
Komal
>

