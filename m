Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65DD330B3A
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141091; cv=none; b=qd+24bnDynIB+wwTalX4LS8NNDKYEbEZkUdyq33hlHv7JtnEta1dXoqLBuyQVkWKfSMVOlhJx6gAu0hYqbPL9gHh+oKWfoZgjmZbNHnbFDGIYW/T2GuQF1GkYJpj6gCFnh2x2XtCignKVZmYxNbK5Djx/V893MsUblwbHsDUIfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141091; c=relaxed/simple;
	bh=5TOax/FcPl473BwB62zs13y+Z4q1fMt0Z6E3J+ZzaMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzJefohAoSKQC7m7tcd5issBN64juKwJ78IEIPZ20RbNT14eS6HY5shhgoN/i2HIQf73XRirthcm86pMbCe5bgVMUJ/DXSO/S2MIGYC4nx4/wd4v7q9zfVWEldJF0aySG/vFjK2NCin4hqTGSUaSLgsFghUoGN0/XzeZhVyGbK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7n+Ofjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLb2+fDP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7n+Ofjw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLb2+fDP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEgoKX909932
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	htKbuZhzlRPYjkFPiuqoTZ0KiMQ3XGNYDjU5yi/M/b4=; b=R7n+OfjwHVa3wUO1
	iJRAda8FuWuXwd4sQBZNFVfQzd/ZpG3qF1h2Xu+rjm2w9mQupT6yG0rMx5YdnZP9
	osBJjTdkZN6h6nXz9ANeLBzZ64YLXDvdEdr4APPWC/mKjbFZ2emR+C7AxbORgVie
	0Be6zez7KfXdYIrNObUHaPiWOufDhQhkNJYb8ePxA5bCWfQVRta6XMubIRF+W2GB
	u8N1ET6Mlk1fSelnzJy0po/KG6XqAWjjG/Yadz9KiGzO1h3L22DM79IGfyWxiFG8
	j6iJU+Txx7dMA3+hDoS4OnidkO4qD1YWoH1w+LJUJ42pA+VsG9VP8nj0e3Nnn6JJ
	GrvCig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729r3nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:11:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso3086858a12.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782141088; x=1782745888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=htKbuZhzlRPYjkFPiuqoTZ0KiMQ3XGNYDjU5yi/M/b4=;
        b=XLb2+fDPCyFAj5nkwM7P0yP2k186wBxbC3PsnfRW1HycUr8gHXdjcRjgsKtq+gHpE2
         snT3GKlnNK0uZ+E/3gk57eQZUn/Tl0MtOlFYyyos0gLgsmki5KE32nz6ppJWWrfRrPSf
         7ZjKSA5HU7AJ6KQRmtV6FlefnY/Li8Ga/C/omkJ7jPbJwK2T90Uw3V5Dr/ZuLsW5SmEa
         vt8Sf6xAiG97yq6GMtS99Nz3l53yB/zddJXREiEPTn7lvcgptLhTlvjitGiF3+WST4RZ
         2GxWCG85CMVuWz8xD0G77G7vaM6PBLkPgnRESjXapHyoC0z2KABuPLExJmSIqDSMdf8g
         1FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141088; x=1782745888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htKbuZhzlRPYjkFPiuqoTZ0KiMQ3XGNYDjU5yi/M/b4=;
        b=nZmEIe0NB67kT+oIWfFgyftF4JMzD821ADXgqOJ+aRUXAsrjqt1NTnUkkRHyTeHD0t
         t3iUADdK8FjN3LcbpXK44vrcsrtc1nlPmxKIRxCXuTWbMihNVKkrqzWBUpD+Am9SxV+P
         7Tegt+sa2RcbSHAqj8LYzyVcva2bbyNIcJFhrPPbxGGnBHWaEc/3It77U/4NGxS0zaYd
         3lincTpbGNjfcZ6Djwa51KEZ1KsV9wctsNvAI837t9paUHARg5RWDB8wn2klNAtH6CWb
         Nv7+30sNnyv1haAcvDw+H0X/QMO9m92cS97y0fNSLHJQM5lmuvlkAFXdDT98ob+8exl8
         3ing==
X-Forwarded-Encrypted: i=1; AFNElJ+JH5xvL9VZ2k5wJiyF/ZoCOl8r53T0X0UgJthYMSMKUSuJKtX6YCbsS/n4NoFUY2XzXwn9WNn8Qgdr@vger.kernel.org
X-Gm-Message-State: AOJu0YyrkMfq+2MMhJ7pTyauD6/yGfESghJQ7RpFAdOXALbe8N4CTb6R
	QvA9zOv1EgHXOTGm0WpmtMhaIJJpjP5ALaetcUzb2yna/arA0m6VoWUFmq0fmrAOHUxmfCESTVD
	06+M4j1vxWq5BmXQsHpL7D/i+0jJgEBieUA2x7uvFEHaJjbJ5jeQVmKA8cHvnWY8G
X-Gm-Gg: AfdE7cmu0YyCclTg2wW6+NmEDSJOzHeK67v8I5iCWptCjNXSAWD4fDy5tD6SED7oPq3
	/sQlk8c5FgB7NhbZbeciSZnh3oh54ky8Ez1mO5M2Zyj7ivIXt7Q30w5hcuqyzGMwBJNBcphm5Dm
	ELfAg9DiiBfvTryax1M8eg8SRLKrsaYCYpItgOchqnBgfi90NCv7tUTivt8o8O+y1UaXrUZLLlQ
	TYCqhy5T19W1r6FrE3oi2n1CTTv3VpTXr2ixD0xUfW1pSJhno42c0IaCIDGRZdTj79f0k7yWlYX
	wVQyejn8mp3KVvRKw+8ZXuV85ZRH/JwHNOtoKw84yMHNvliNuuCYo72ctSmqy9UpPMx+iRr7nsw
	bq8QV+aG7VNvXg0cipU0lgWTnFhZDnxd5lT9uKQ/K59Y=
X-Received: by 2002:a05:6a00:1745:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8456255d210mr11000513b3a.31.1782141088469;
        Mon, 22 Jun 2026 08:11:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1745:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8456255d210mr11000469b3a.31.1782141087893;
        Mon, 22 Jun 2026 08:11:27 -0700 (PDT)
Received: from [192.168.2.2] ([49.204.16.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564eca7fcsm7906357b3a.52.2026.06.22.08.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:11:27 -0700 (PDT)
Message-ID: <83a3fc03-f873-4bba-90a6-d8147ab64710@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 20:41:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
 <50d92653-b403-402d-af82-a037114c3aab@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <50d92653-b403-402d-af82-a037114c3aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MCBTYWx0ZWRfX7IV6fz2A9/HY
 6KeR7O1+zZPT5p1WK+QOqCNq3KAiZ211aSr8TCJhl+GVrVAM51NE/9pmBIA6In5gyLTeBrrONNA
 zGzlUZQazObtYzr0xvfF+JNYtf875ek=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MCBTYWx0ZWRfX41LCNHLKSjQj
 yZwwC3i0AnGktP1wXFE6W0TlxuhU899oUUOwcoqTgoxRSh9vWN1aiwWMnwHI2IIi0QV4ogrxriu
 vQf8oZ6fhBmPRR3XYYHturR0fkb4KpEtoBnFOXmmlbWs/+VYViweVHN3d5wgDBFrvM9GLUjZt29
 nk2Fmbpu90rv8+rDQ6AkigKq2snwKMKAnLN2qdtxHGK6VOe72Pc/BF4DojIEGHK8zHJ4pcVyGus
 e632ljCJHv4jPj4zcfryOabztlQexDTmVeGPUkyJk/8cR/Ek13oX19bGSK0MM7hstuQWkYoKqM/
 AOyLCx0iEeQcBWh7MpDc63vzKd1B3NV7orUokSK8rWZA6UaLoVs+1pq3ckHZth+alV631NBwIb5
 FY+nIAzix9sGJOShpZ5L3Av3n2QNamgoHamJFIjo8WZCuh1zUhNbG8CBASRk499nVsxI+vTyZKC
 WJyDVth3ycDpva3oHoQ==
X-Proofpoint-ORIG-GUID: -3gbgU6D7KDO4yTrX_BXA2xW4szXAcUD
X-Proofpoint-GUID: -3gbgU6D7KDO4yTrX_BXA2xW4szXAcUD
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3950a1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=V0wrQAR20Q1u/UIyJlYVXA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZBGX7F9o7YTsjpKyWPIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220150

Hi Konrad,


On 6/22/2026 4:32 PM, Konrad Dybcio wrote:
> On 6/19/26 10:39 PM, Manaf Meethalavalappu Pallikunhi wrote:
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
>> new file mode 100644
>> index 000000000000..4c6e6cbfbfe4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
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
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    power-limits@ef3b000 {
>> +        compatible = "qcom,glymur-spel";
>> +        reg = <0x0ef3b000 0x1000>,
>> +              <0x0ef3d000 0x1000>,
> 
> Don't we need the range inbetween these two (base=0xef3c000)?
>

No, it is consumed by firmware.

Thanks,
Manaf
> Konrad

