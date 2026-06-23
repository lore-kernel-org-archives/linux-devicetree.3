Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC688364953
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208061; cv=none; b=efdtSmo+pi+fIhTz7LRTZtRxpuNm7oGgs3TfpGoKX8251m/GJp0a3Xr4aNV7GFb4DATgpjm10KtOuRPDp+Kv0ERbSolW3c8ZICcJSDM2Vteqnov7esuaQZFundM/LaEBLHWpWtGBsmukQ0/odq8t7X5JtFBcwCNLLBPa/9Pk+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208061; c=relaxed/simple;
	bh=ZFXjWZJ8Yv0VUo0VzxGtfovaoA1ZCFVBqtbCKCuuY6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvlpBfMCsrTR+JPTva26zxEVbBakMshhS8IwdvCmyXTrY2tkcQ+M4elUXY3L5sy0e5W3wjAN4jqqiSth2uYQQ/F8GjJWUMkiyJiQ1iRp0t5ugFuIpw6grKh+OiY72W/ziHb6514D/Uxm1nimA9Te2iaHxfaP9BGXngzLnoUJEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWWQdKqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTPza3f4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWWQdKqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTPza3f4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8V3Nh3245123
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dT3ZqB03YeVKv3AnZlUlVxas300onzHYiYQqPphtYjI=; b=YWWQdKqgAT3uRMP9
	ka82y0gtDjXKINfzPufO+dbfLuOFgYay/FuVXlaC2b/K2FY6xDGZbyd4EMmfNZSp
	1oatqPEZrYXWmZs3YwcWkJCNI+jwJ13nnq99r68LmdD5hvMhd6wjImkBCtwS0Iwh
	0yAKje4wrlzgsh+dFUib7ky5erT5bgLA4lZKpkcBRnqWB382T9fy1VUExTRpiF9l
	M/H3+aWC1zUOba9lone+ka+Wim+C4WMrp12tiHvsXZak3dOXmTvf86VhZSBLKVtc
	tpr+nWWyG6TmMM2RM2iDs2tJqG+m935vzUB9R8sl8121UzvVtzYdwlFJXjkdpFhy
	m1JUYQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygb6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:47:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8428419982eso5096847b3a.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782208058; x=1782812858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dT3ZqB03YeVKv3AnZlUlVxas300onzHYiYQqPphtYjI=;
        b=fTPza3f4E8CCGcf5vEltZdLXZjilUEvzJ7BjdKR2lMTPQf9D4jlyzDe9i8buT7QtBK
         fICPs4JW2/S3e7NvustNbcboaW1N4xzpXP1aRhnuFgpuK6XN/zQFh2FCjTgjx9JCoN4X
         koR539CSlp5fC0BVE4MYm/54uN/tY5WN2tBhbVPAk7DTOJSY7OLiFswhHuzCD/u8DGBm
         CRxofFtzgRi4E1GSsgH9R18Dzj76vQ/8/sVK+W7JoZgoK4fPDnSGGbWyNExSFV0BQRDx
         YSR4RMMMpHWo3/ypRftDZJ6/QODbvgRaVXGkBuznlsip2sjMDhGVbJimKbzGnPW/5OOv
         JjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208058; x=1782812858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dT3ZqB03YeVKv3AnZlUlVxas300onzHYiYQqPphtYjI=;
        b=gYik2iuyDv/cvDymW6XLPbVMLHn4MvqWFFRM2oYg+7x91bQGeTgFD3v7Jc6HeE0vCD
         8O7yrvhUhdpU/DW0R6rSFvHarctK+in02FsSJH7nRAXZ8kFV1kYhsTz09hkNokGCxw0C
         Ba2GDMt1UCO00EKX67LFGqDj8bxLQM2Z7I+kG03krJtJpUn470/IHZlT6izyO6kLK/5+
         opMoOzfw6N4qTYU3RqL8pfRaE0RVCogHr728+nNcWwDixifULSGh4HRjau9zo6mdmOjL
         WpsWXb0i8V6X2VeZl9hXhryzaMJVZcgDs2mU6nHLRYEhLYDlPGuFTGiHbuqzipAko5u+
         ibWA==
X-Forwarded-Encrypted: i=1; AFNElJ9sRfkBFId8J3LYpicSM+8trxphzDE8ZLOHGWrcfnFM9wKuei6upmGk0IqRJnan2KAdzCfF5vXKGsVm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq9xlHI03My3RnFGPDBW8shHNq7Eqv2adVoOyH3Y9H0vTzfTWX
	YSUeNzInD/AxInqbzjkXKC8Yu4+4AE6m+YRBXGdOmyH33IIKta+kKAUDpmSVSO9SvVLFm55OaSy
	tOEUQUO6q49k+GMjXiwG2HZQ0AAcInlN7CscEyYiMKzuBIfMH+wM2G2gqub8fb/q0
X-Gm-Gg: AfdE7ckyKarwzkDH1xuvbSBbHXVAjrK5xZNduKxswNiRoPZmlcWnyXFaT045WBxHiqy
	39+mH/IxKxgFEG+EDs0eGtC3/IymbPavs/FqOIeTKiyhwatuc9J4EnL69OhlZROb+Hjca2oY6Nc
	hYYaaHOekmSy4m6P3kRoP20Ny0wRSao0RINT9jQ02dW2Osdx+1/p0UQNJWhGcGwg4E+V+NoSv6N
	e7n2ybcRsdbWzvX5fBQtHpJQAthCqm8+T8IAUG1UtVHOMBSWWcHArb1dWG1jrqGIHr1pfDchCkt
	4NyVO5x+50eKNBdFdUa8qFUAIjg3Nyq+kLdo7Dr+MktMqKHoQhkWUClnoICW7PZCpVStLfNPfrh
	rSza6IkHz9U9pxc+AslXL8+rzMZ88I0vAf0+LRtA04WOQBQ==
X-Received: by 2002:a05:6a00:9a4:b0:83e:b443:965e with SMTP id d2e1a72fcca58-8459707afc1mr2244894b3a.3.1782208058401;
        Tue, 23 Jun 2026 02:47:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a4:b0:83e:b443:965e with SMTP id d2e1a72fcca58-8459707afc1mr2244862b3a.3.1782208057841;
        Tue, 23 Jun 2026 02:47:37 -0700 (PDT)
Received: from [10.92.209.135] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8cd9csm9737902b3a.21.2026.06.23.02.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:47:37 -0700 (PDT)
Message-ID: <db8f06fa-0dda-4a22-baaf-8a708d43e113@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 15:17:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
 <20260622-armored-witty-tarantula-84a28a@quoll>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260622-armored-witty-tarantula-84a28a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX4ITPd9/GW2LW
 ffk0/rxZkfeG6rguLhYSwaSJ/d/FQ434I+MBRg0ACRmU+Uc2Aafgj0yDWehTgjkcy6xYQ9NjBLK
 LAQOwsPR52/kwp2HJ57x2h6WBCrc0XGqsV2VRK951KNxVkx/UwhXMpzrP2bequ4r4x0Zhn5Axk5
 OcEq1wWK+SXaUUgrGobbKzoBcKzz7J8BTJUQNCiF+vDezTkba4BFNLHciUqpzwMZa9qUzk1NFyT
 OTxtrqNXvFyBo86YBjmRF05afUeCfanQYLoZX2JPLTRiVinv77f9P2Lr8ouutF6VbiS1bX+3pXu
 dDNCvP6JopFyZ6SLZq9KqWqoIOUe3D6XZHEZF/IAyTybZrGRMZCZq+S7j4AvaqeVqQcreFmZ5gW
 1nrPP5mJR8yhzpu61fFjVw3/gMKr5qOaZ5B0HWL+hVLOOP2HjIrZILoOEv9em3zJ4Suq/7WrEsC
 8aSBaUseYzj0QD6wq4g==
X-Proofpoint-GUID: SQLqrKsoF0kGuoJIsAWQL-fjH9kOVLIL
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a563b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZBGX7F9o7YTsjpKyWPIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX6cAkmmywPLNm
 uEg/3q9yPrt1MZ3lZDZJ9T9gryU8DXh9WAQoSSI7pavfXrznBrxxRFQKV6aNnraOtUBWmA7rPNZ
 Upi4TaLhTAnSKCfm5CUmL8PAyovx1Fg=
X-Proofpoint-ORIG-GUID: SQLqrKsoF0kGuoJIsAWQL-fjH9kOVLIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230078

Hi Krzysztof,


On 6/22/2026 5:58 PM, Krzysztof Kozlowski wrote:
> On Sat, Jun 20, 2026 at 02:09:08AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various domains.
>>
>> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  6 +++
>>   2 files changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> 
> What is "limits" directory for? What sort of class of devices fit there?

Added for devices that integrate with the powercap framework (exposed 
via sys/class/powercap). These devices are responsible for enforcing and 
monitoring power consumption limits across different domains, such as 
the system, SoC, or specific subsystems. Any other better directory ?

> 
>> new file mode 100644
>> index 000000000000..4c6e6cbfbfe4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> 
> Filename should match the compatible, so qcom,glymur-spel.yaml

ACK

> 
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoC Power and Electrical Limits (SPEL)
>> +
>> +maintainers:
>> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> +
>> +description:
>> +  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
>> +  power monitoring and limiting capabilities for various power domains in
>> +  Qualcomm SoCs.
> 
> Please describe here more what is this limiting capabilities.

ACK

Thanks,
Manaf

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,glymur-spel
>> +
>> +  reg:
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: config
>> +      - const: constraints
>> +      - const: nodes
> 
> Best regards,
> Krzysztof
> 

