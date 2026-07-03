Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AB83D9536
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088031; cv=none; b=J96Hzfdu4PcoPVG5aZWKmP/0u0sDBNk+bp5F/Nf3uOVaSWuVgsMnHJvqkIGPKhX9RZMVCURfa9M14hm/tVb3GkK+YF+cVGa0zPGV5CrQ+Zp7NGAlO3Ms8TMykbSjWqI3TU5VUkSZ7cQWYU7B/niC7c5vjXb9UcxA5fo1CsM++Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088031; c=relaxed/simple;
	bh=jZH7Z/Hh9/KA7OFIOvJ+Blue//Yx5ANVh8OHRWIHUL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=II3BuzgBgxeDQsaVuN3P5nqS0Dq9xPilG8nDFRDzew2nx3enuqGv+Vt8zsFmJW+vH4P3zmzsDqQVOzSl2+O3pKLq8uAMUr0BPyrIHiAtkRg4sEgiHn45O9PAGzNhxMWi8pXf0/ELNuXSS2iTM756SHCo5ZmkPz6agKIdRQjN108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nih+aH55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eb4evn1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nih+aH55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eb4evn1j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663C9tjH3144214
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 14:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHZ92YcdPWa0r97qjH1sqNLcd4z27ftXzdTvY6KflVg=; b=nih+aH553/jrJcar
	AKW+idlmhmgME47w/cwuMueRhmbaO8B9JNsBqMR4C/Z8MxXFGlAdQsUERPv7kFzq
	apt/yG0BKz1j6weTVQh/2edOBnAeV9blSk16Owz7culb6ZvvpjbLjQ8sS/rZ1pYD
	UueElgcDlxqSbqaAz3FpuAEjQfcDbwcrTc3zLDSiGnsNsF0jAdMBMGPv/OO/xUwf
	O+ztrxHvkolXC/oAg20uqZRJ0anFMH22m7p0uksWPiLpw4Qt5oio88vDEb9EwkLs
	1hEd9Mw9+sPBNqAT0oUw1xI0DtS1Dy3b9gVV33BX2ZwTL/ZRiEA4KwQiZb7uMq5B
	KTkvZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bsmqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 14:13:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c81db324caso13755475ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783088028; x=1783692828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHZ92YcdPWa0r97qjH1sqNLcd4z27ftXzdTvY6KflVg=;
        b=Eb4evn1jP6AXqJy6AodiSm9En5UNNizCsst9IYF4h7ZI0sJR5mvpcUEoEjiJkvT5y+
         ur7XIH0PJhqnhLEb+22apuFgJsnPukD9QwJWa4zHX9sOfyCUIdxP8D9q9gv3sQPDgjo/
         i4/OrBbZp4Ekz/dNyFZfCE3blZXGtV15HhKXFjLjmQZOKhT7Sag4YuTOAqxbhA6bQe3z
         Os4eRd8nscR3lQuX8KKCOQPz9P6pfJHBrRtnYp+tNNpNjqTcafSO/L+2lwJVRkcp5PyA
         n+zGoyrPBaea2Eu+ueULU4Za4f5cGP8ntNIIFqYRlvWH9Jnpx+G9vxrvjNASQWUGK1yq
         upow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088028; x=1783692828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHZ92YcdPWa0r97qjH1sqNLcd4z27ftXzdTvY6KflVg=;
        b=o2Wq5VtDCvswMOf5DcZjRmtIhfq+iuhdMCD/dQLHV28ZoUx7sNYOMS5ZkX5eOGm2ZK
         +6T6K58F1+XYaQAddYwa17yn12TzVXM2eRbMo3cBvlG2NDP25RMO8HRGSw82gY8iYH6l
         nu8UJSaJeIOG6sy6WAJAbSsQxqIlOIL5Nvy5Snz8kGrsVsCEuXgtihZmyyHe++/Yk49T
         Nvj4aqVK5T4nwMdTLbAtEtdPaDHGGBo08YpnedcUokARL4vAgSTXuNOMrrHW9B8sA4t2
         X/I5+tKxKA3w3n4rGxSOgdWvWAan6FTj/EmflEz4cF43zX3Ua6tAidcOc1GKuQbOI4Yz
         xg6w==
X-Forwarded-Encrypted: i=1; AHgh+Rro4scfD/IGiLm1lvFHc9XAYF7qG7+w9k/6+7/B2/3SrFy2gOjQHGyfnFvTWiq93T7JzHBtpQBsoKfS@vger.kernel.org
X-Gm-Message-State: AOJu0YwwDr/824cIke5OGjcP/zZhBnCol4ZGBs3yUb+PBmc3aSC29tlh
	bgXTmOHtQkJQ6QyFO+4D6PIDnorVvBk23Ydnqt/NB10mcT4otzodOprnO87e1pbtb85TTjpPnUJ
	9J+HVeDD3fUMLDFLomAyI+tYSrMto3qVeETRIXVuFnLHpDO2FJ2reXb3k/K8u00Yq
X-Gm-Gg: AfdE7cl07WhGVbIIk4tI5IulNxyddAON6EPDGlqTo5Oty6Jzwi99RK/h4alj4n4sieo
	AMce/N810EHO5ltOWu2hWXy7iTYbOAkw/xrNCNax0TT6ZQdiaZhPclIcw5593EcbVRj+WGBEkGg
	CXkJp7koAhWsuWoFq597zwpXpYgEsyo5JL+9DnH54XpQxfLRWQ6SqRUyKtg03YEC+xVioFxQki1
	vCvLIk1hCBp6vW85JKzkSvi7gjl2+i59GtVZP8R3SLoXU+HBSZznYA0vCJyqeSak4xrH6R4vehW
	HktxhVSQQJDnORlvIdhEkrbpU6x/Rt8fu9tab9hSvY1srszHJ75GhwRAaKsHxsTwzDm83nABHGs
	jSOkysSVEsvWUpAsnIxKKOyt1ibFQvaPaGCoGgvgLEA==
X-Received: by 2002:a17:903:22c5:b0:2ca:ecf6:9122 with SMTP id d9443c01a7336-2caecf698d5mr12018485ad.17.1783088028443;
        Fri, 03 Jul 2026 07:13:48 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2ca:ecf6:9122 with SMTP id d9443c01a7336-2caecf698d5mr12018115ad.17.1783088027979;
        Fri, 03 Jul 2026 07:13:47 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm32244894c88.10.2026.07.03.07.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 07:13:47 -0700 (PDT)
Message-ID: <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 19:43:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0MCBTYWx0ZWRfXyG6ebQ/mesXH
 I3uGM86FlLY4jbJexOtKHLroZ6X63sGEhN13K0u9zOtHfpDqoFNYgK5ky9PSrovCjzjO8ei9FZK
 JrpsfVp0xmTlTy/RbYGDrQ02kUO/oduG1iGOvh0gtqzS0rABKqYOOUdQveEA3ANOVcwDqBO1wVy
 PG/9Xya5tRXfA5cEF3fhxWallIoKDvSg1QHjvQaPaoLovwrHg3zMVG8PBlsk5Y2GK/uQZ9QxqVJ
 f/EGS/ETbJs4/dRsUH3u5ofsxAju+n128TIZhC/Imn6jD7fQhCpyOG+gvePySXyVlubTerdb3ng
 j2IHJGNzRtYABmQcsycAHcLvikrY9VbvoagFE+BEVzZ1dbrI2/sx5mjlKzfkSRle5ANdrZbVcTg
 G+uhTRt6v4dw/JTwsiblp6Ea52+uOfynJJG8SByv8xNG7QeOWLpsY9LbhP0KT0O3sA0/yk87ugh
 huEn7c00SWDTIWGetVA==
X-Proofpoint-ORIG-GUID: TJIxTXEift242Ufe3WZjOUf06Ei541At
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47c39d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KAs4MCmhXsdL-kvopiEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0MCBTYWx0ZWRfX3hUTgNTihmhP
 eiS3JFgLZpzNmzI1HoCrJL2mRnUbwL6fWgauOjS0ruti5+qU/kdxzXvI/qmq7UNJnrlxV/oRMrI
 ZlpdU+TEEHb2U9X9pGDciGlGTzbJPSM=
X-Proofpoint-GUID: TJIxTXEift242Ufe3WZjOUf06Ei541At
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030140



On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>
>> Qualcomm remote processors expose thermal mitigation endpoints
>> through QMI. These endpoints can be registered with the thermal
>> framework via the `#cooling-cells` property on the remoteproc node.
>>
>> The QMI TMD protocol identifies devices using string names (for example,
>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>> `#cooling-cells = <3>` requires numeric device id in the form:
>>
>>    <&phandle device_id min_state max_state>
>>
>> Define common TMD device index constants shared across currently
>> supported platforms. If a future target requires a different mapping,
>> additional target-specific constants can be introduced while preserving
>> existing DT ABI.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                                 |  1 +
>>   include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 57656ec0e9d5..ffd85fd1dd80 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
>>   F:	drivers/soc/qcom/
>>   F:	drivers/watchdog/gunyah_wdt.c
>>   F:	include/dt-bindings/arm/qcom,ids.h
>> +F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
>>   F:	include/dt-bindings/firmware/qcom,scm.h
>>   F:	include/dt-bindings/soc/qcom*
>>   F:	include/linux/firmware/qcom
>> diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
>> new file mode 100644
>> index 000000000000..73efecef0f3c
>> --- /dev/null
>> +++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>> +/*
>> + * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
>> + *
>> + * These indices are used in device tree cooling-maps to reference
>> + * specific TMD devices provided by remote processors via QMI.
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
>> +#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
>> +
>> +/* CDSP thermal mitigation device id */
>> +#define QCOM_CDSP_TMD_CDSP_SW	0
>> +
>> +/* Modem thermal mitigation device id */
>> +#define QCOM_MODEM_TMD_PA	0
>> +#define QCOM_MODEM_TMD_MODEM	1
> 
> What about the dozens other ones that Dmitry's laptop reports?Ri
> 

Thanks for the review, Konrad.

We are only defining constants for the TMD devices that are actually 
used for thermal mitigation on the platforms supported by this series.
More constants can be added as needed.

> https://lore.kernel.org/linux-arm-msm/4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k/
> 
> Konrad

