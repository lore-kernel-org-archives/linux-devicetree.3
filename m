Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4F4F4728
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557511; cv=none; b=sW2J54WsCUWrn1bUxF60o7mSXiKRb2gmObiv9vaB2VLY9zGG9GCNwBip92Pl77UTGMMeb5WVzHiFn0r/qVPu886krcYh/ZJM7JkLnwrfqc7uun5LU9CzhYDc3kl37Osg51Fb+xUv0iEUk1wFu5AagWvU3qOMfGlK0i4cT+sBrR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557511; c=relaxed/simple;
	bh=h386dZ3ZRHU0xZ+UHgIl6BTyUMU4D1p+OyPP3xo0amQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heX8tbipl7ZNltgpgeuwsQk+yFEFQGSvi9HmBdsNN/j3nhBtML+ejoPuwpogm+YPmgiBcQkbhDcan3gOp5KwLSplc/aU9t6nTfCkQoRrQH0lIpB3Rp/x+vUmDTWqtzC7ckWni4JHerD9jvFizAxY6DW6iANtZaycK+ZKM9MEhWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXkmVrlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el++fjHO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXkmVrlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el++fjHO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qBh3377415
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PoqX4291ox5WRCJmLCpV1ifV7opzHZ9wnhc5virqy/E=; b=TXkmVrlmvMFiR1Oy
	ZTGC8MmxlSvvMlyd3JCezFiPzlGwZ2U4u/C8+Ih50ZyAGuFTxEzfI7zDXZRoquPa
	cA3O0GwUujDnc8/tq/1en4aN68GiV8306ZI479/eTJrk4mDeWf6EsKnnV6CWEyRV
	ZJHDsSemL6JdBN1dhxpKJ3LbrJ0+PtA9vUGC8i0VOszSrthlCbFVEZoQ1I/JcU9d
	YZGvi6G90wBDBc6yJDmNHyg3pSoKnT7Fj9990Uieokpk6brStwMGNGsuFCnrvr99
	SIPOzCRDTTK6YUcDoQaT10vm46TtD18rmeUbiXRtNFv31UrMdNUVFyUeRzlbwvJQ
	IDFL7g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpau5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:18:23 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-80139a2495aso9845399a34.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789557503; x=1790162303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoqX4291ox5WRCJmLCpV1ifV7opzHZ9wnhc5virqy/E=;
        b=el++fjHO49+1Um00a5btOsSZmFNnTWPoi4asxGpCqlbrRF7GM95Vp8Co9PELntyLIz
         SjDySV3JLVaIyPLGJda6U4cXrVgP0GmlVkm9+VIe6WMbTXlUfqzN2GbuduaKEYZSKlij
         kzozmv5owSUiyEggjDgqnJi/Sq1ZoW68+uQiXKMJIl9CzKVexNJdtlCWcy1E1kkCpoEu
         cvcSzZ9oUYtwqN0JQj9za2YDXW1k26v4VpXFNOIBT6CMiCgkNGttb/fRXEhOVRF9JvF5
         TCVveDwXFsHXsR0GFag7HWGT1nfbb4qgUP0OpEgk+1rIgvQh6kDEg7xenyFw5JtSLVf8
         O0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789557503; x=1790162303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PoqX4291ox5WRCJmLCpV1ifV7opzHZ9wnhc5virqy/E=;
        b=OWrjTflrA6NNd0KXYL4tnJoRiDAEJhqo+aI1hJfHgJlQm5UDd26bOHE1Y/4drjFRPM
         sridX1F559HtIkrnbDXTlswq8ccH5dmS/tt9QcifXl9Pf0/gO9wguwzqiJpqAVQ6dGvw
         N8v8s+4sBx8GDmg2Jq4hZZotAAuxMvdUL2bB01AldlY99FybxDInG1a55qyXDbF4G+YT
         2BtH2+KhlyjAuHmSMPrzpdFJfeTS5TkJwJ4Ax8BH9XwTI47jizFf+++H6zQpxSv2u3Nk
         rI4btMrhQKYL9OnZy5ajiQyP8S8WCZ4gGCK9omxZlpDSduGcBv9l3TU0AuYTjftMecoy
         yMqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpytK/b66YSNZil/AXwLmrMR3m7Qz8/sEpA7p3w+ulHGZhMCzpd1QlYNdYc/5OI8aFVMGz2QXOPt6w@vger.kernel.org
X-Gm-Message-State: AFuF++l2ovnwsgK/vNS2b4AFP9NtIYTAJhSo/eY9duubfgzsi2HbzYjS
	iN25B6jn4Q8FG8M5Ts7uEORffPzrRa2u21hhjq6PMfqrneycYnQXSBo4Qdu/Yb6hJM+aiq1OQWN
	czGYEfyHF9IG9Q/AN+MLosj6e11d/9KtYMNDKVOXVzv5xTrMEr9Ad41aK+YXWmfO6
X-Gm-Gg: AYBFou0Cp/7cSnGRxtXQEyMJ9a68x755j5kM4XL8aSOxd5yA0H8ei1sW2h8gNwizIQi
	Iogf3KAnSfm1unWfpUFYD6MfQazSvSqmfmmcpjNRmaMxmTu4ZFaaWvE2qjgMLFGtrPQZQPEN0lH
	IZa7RbpuvdVOWrbDCCYB7XumMJnzuwWBDwtWcXYkvYEm1O9wmOIKi7aJLb2QV+5zPZ9S5zBnqhB
	G31D5M9vl4FoganzZ7gjAUwyoGuarK0IC0m/DiaAXW7Vj5+Oem4Hor1WZ9TVEcoQwDQ4abBcnBJ
	xgttSrKtXDuDReCZUeGmI6OUX2UGpuczB1YesmJOhQBvS6bVM3z2mI6COGB+YgVEHkW5BsNiZIW
	ayVeGk8HA8s0lXmUVCH+Q6eAAtz3IoQ==
X-Received: by 2002:a05:6820:2008:b0:6b7:8415:d786 with SMTP id 006d021491bc7-6c7d3206852mr2114839eaf.49.1789557502925;
        Wed, 16 Sep 2026 04:18:22 -0700 (PDT)
X-Received: by 2002:a05:6820:2008:b0:6b7:8415:d786 with SMTP id 006d021491bc7-6c7d3206852mr2114804eaf.49.1789557502446;
        Wed, 16 Sep 2026 04:18:22 -0700 (PDT)
Received: from [10.218.42.71] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d76834sm5950298c88.14.2026.09.16.04.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:18:22 -0700 (PDT)
Message-ID: <a3ff5fd1-9801-4a3d-b663-0ee338816bb8@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:48:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-4-faisal.hassan@oss.qualcomm.com>
 <20260907-arcane-spicy-parrot-6da5ed@quoll>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20260907-arcane-spicy-parrot-6da5ed@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0OSBTYWx0ZWRfX/cuj7AQs5vQ8
 ed2GtlYWM6iVaHW5U1JgCYZ8JLzFG5j9koYYOapfiOgJjU+p5shqBVdRcGzOgtioGVg54ZeL2g+
 jHoFKm1K+qeAnErhgQP9sUoGaZUc/Fk=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa7aff cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=zkeY3IreNFxg1TzoVDwA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: zdM68ImzPoiH1ePWkvMFU_z5mdKlwR52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0OSBTYWx0ZWRfXwqnLEzSYujDq
 feeuXIaq5xUCTBmVK0hHEQMJX/4VcycAAfAinfoRGbQN53m/Vg2BIapDpY33dZVq/SVT1yeTDxE
 HuU9w27UkcIv/ZOVjEQ6axBoswNjcmf9SeRzn8OAxgXDYUrDiD20sy2Qn84t9OSjUvEn4iZq4hQ
 J7ACnL29nd/wjcX7sA7nSkZM0lOsd8Dzgx5Rr8HJSccai4sJZy1NnKZx2QBAyvjBdXcRmitO/LQ
 nneDkwm+TMiPrKnGmCeYW1Cx9Qc0wSBMwwH8aP26u46Q9QEqHMZ76lvMwR86Ps1TqX6XYYm01Ch
 ODkqyiAIhhzxcO+V4epqxyCYHO02MkzxkJjCVwtO7Hss75plDV+HV6nV55LSlYCRjA4JhEHGtuo
 hbNst0mgm85gKSoymqfBfs0uGphVV3XjCAOG29udzzo+bIP8vAPiP+fMjLkBLGoWyGCyZtRYU9L
 FYgBr8M9AQRj+uLyc8Q==
X-Proofpoint-GUID: zdM68ImzPoiH1ePWkvMFU_z5mdKlwR52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160149


On 07-09-2026 02:38 pm, Krzysztof Kozlowski wrote:
> On Thu, Sep 03, 2026 at 09:08:23PM +0530, Faisal Hassan wrote:
>> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
>> interconnects, resets, regulators and GDSC are abstracted and managed
>> collectively by firmware.
>>
>> Add a new binding file for firmware-managed USB controllers where
>> access to these resources is exposed as two power domains:
>> - Power domain: Controls power supply (GDSC) to the USB controller
>> - Bus domain: Controls clocks and interconnects for data transfer
>>
>> The binding makes power-domains and power-domain-names properties mandatory
>> for firmware-managed platforms, while excluding the clocks property since
>> clocks are managed through the power domains.
>>
>> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 123 ++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> new file mode 100644
>> index 000000000000..c6db7bcf4981
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> @@ -0,0 +1,123 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
>> +
>> +maintainers:
>> +  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> +  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> +
>> +description:
>> +  USB controller on Qualcomm SA8255P automotive SoC where platform resources
>> +  such as clocks, interconnects, resets, regulators and the GDSC are
>> +  abstracted and managed collectively by firmware through SCMI (System
>> +  Control and Management Interface).
>> +
>> +  Access to these firmware-managed resources is exposed as two power
>> +  domains, one gating the power supply (GDSC) to the controller, and one
>> +  gating the clocks and interconnects used for data transfer.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8255p-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    maxItems: 6
> Why is this flexible?
>
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    maxItems: 6
> Why is this flexible even more, allowing completely random names?
>
>> +
>> +  power-domains:
>> +    description: |
>> +      Power domains are provided by SCMI (System Control and Management
>> +      Interface). See Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +      for details.
>> +
>> +      Exactly two power domains must be specified:
>> +        - "power": controls power supply (GDSC) to the USB controller
>> +        - "bus": controls clocks and interconnects used for data transfer
> Look at other bindings how they do it.
>
> I finished here, because you would avoid all above questions if you just
> copied recently added or reviewed on the list SA8xxx binding. You did
> not, so basically I expect more of unexpected code, which is pointless
> to review. Just open existing files...
>
> Best regards,
> Krzysztof
Hi Krzysztof,

You're right, I should have checked the existing sa8255p bindings before 
sending this. I went back and matched it against 
qcom,sa8255p-geni-uart.yaml. Will fix in v3:

- interrupts/interrupt-names: replaced the open range with a concrete 
items: list, minItems: 5/maxItems: 6.
- power-domains/power-domain-names and resets: dropped the extra 
per-property descriptions, now just bare minItems/maxItems/items like 
qcom,sa8255p-geni-uart.yaml, with the explanation kept in the top-level 
description.

Thanks,
Faisal
