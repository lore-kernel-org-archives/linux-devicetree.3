Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7AF3BF660
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623774; cv=none; b=SL2ea6TjA5z03BgdFfiZOD6FZVDPJsRXHdkzwWme1gNP1k8ImhKW7QBAB4Kjz9ctM3gqM8vDBh6FjIYt52HuTCGpE5tNWPO50xqdF/ZcproNIVZU/qxnd7kFx5+uLVJPRZpzNcI9ECHZqWuDsFCJVK9ZxjYlgk9GNWEUtxyRShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623774; c=relaxed/simple;
	bh=qglo1qgSqvpKcfXUwbHrKpztUmqRkGBYvY7E1ws0TUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Myx5MI6SyYbs4qDBcpU6lHohmt+WnQzh+GIIb7ybr91EyGGVsWXDEeoqfOhzuz5dw5cAjTIeYq039AnCTeCX99Qi+ERs2YKZI4GWDcjEgS848Ls7xO6umGOPzHoBp/gjc/F78trF5rP5AHivZhcGuEWkrriDftUYeZT0v+EMWYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcKf4THM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wy3Tleze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcKf4THM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wy3Tleze"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1xWc53237793
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=; b=hcKf4THMRAh/vmJp
	BubSj/LyppmFhIkPNTS2wErU1g/5Gghmmau6DFxcsRpUN7AjOgn2remCMZ7XXhS4
	5r40cva5vmvuMtGQvUmnccAAHKgfHf2LgKXnP02J3JxR6sad7hK/jWJMJwgkx3nN
	7cyEuEedo67hpT7UckiTX35NydDQ+ut+5jA4ZJ5vqpbwfmHyxFxQQ2Vgqk/ZJvRv
	8vvzW6MIHIH3fG+PHLJvVmnso1m8V2jIyidtv8Kz3dZKDTEyLWRutSLu4MJle0Et
	KweAGkFLF3a+z+PJjpR+T3NAA6OIcdX2oHxQ0jlF8Y4e4S0oueuu+uuLKmZL/jVS
	6nRd2w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga2ey9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:42:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-854f274dd69so558012b3a.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789623768; x=1790228568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=;
        b=Wy3TlezeVsC4kFilPbO8xt/f/kkNmc5Rlxmp2OarNLkS3AruSIG4a+hGZGwZhreM2e
         e6kt1CXuYHugLAw7jQclyK1pvhuz4nZRdL2n/1epCSLaW836Gy6ATgBD8p6swWfaz/hc
         8f5OELcG8/uxzhwfhRtJ9Yob6stV42oE52UMr3rMyROncRYoxtGzmDcaqAH47W554fNR
         ZBGyEoX7IWHu4+OnhE5NtTXVS69ZMVbO+mZMXP0ZYjsbICIITH8JjJMKaRqHDVvMxuTu
         xHewrinZFrsoqhp6SYW1XXrlsk+rnZWtA1q85FxMziyWsN7b/LHV2zS12fEfvdpDOIax
         mkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623768; x=1790228568;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=;
        b=yNewGHtBGMgX/2VNQVONbqxSqb+z3GQR9PQeg0xKOHU2OnE3uE6dWR57KcVS6XRcFH
         U9OShB12gqlqSNxpac4M0XZOB6GvsRXz0m9reBHSkbEs/bVCJuaY2W5KCr1BQidrH6dK
         mKkgvx1LoaOMjmjRJPbo8uF1HSopqgaXtODy4Ro0bnTaY6t2S+0wC0e4+NUhrzPMTseu
         P0wKVexvS4QZnilfRM1Wv+Tq3tlHLWe/AuYyF2S+2w+iBUk49EL2+72SbyjATBVwJLg0
         mmhfNNmvo9nl4E2ISf5R1kSBv5d2M1bztv4LxAfFadcudp/yN0VZAhwUu2aJVGssf9aL
         bF9A==
X-Forwarded-Encrypted: i=1; AKwUvBzKJr8ZTREhF2fxrbolGffgolLk5/O5BipUjLWKQoEaCZkZPGdl7Lm6ukVVpiyqA3+38xcVkk5bXUxI@vger.kernel.org
X-Gm-Message-State: AFuF++lIrUY0+vEke3jACH3QulFvZvCWO35hr+IP8ZnDweDX+kpQSMnm
	786xstoKsDUJGcwfLoZcQA5FUHg47LTSTMSdo3Wk9w98/6Q1kBei6R8eDUxX9YU5vJuEJ7uywEQ
	t7FSCnTMx+mdjG4R+9QXY9p8FXkTYE8ku/XKIYZQseQ8djcCqV5ptG/NxRHWkJ/Se
X-Gm-Gg: AYBFou0ikbP8x5soXa06n8BcE7EGTJZ5dhyoREXMEt0PfSDM7b7Gz1oexZE4zuO2Mug
	tgujiftLejUQI77FmmkyS82jyJVohSebWG3j0ONcnn1/A1g04IkkIv7UaT+OYIK/AxJToHQJR4Z
	ThxYd3fSQ1kfo6jXVL3hiBZYdNvafaqNP0gu8PC08mWsCcGMqh6pyq+VUB9k2pfCnyP7Uh9mquu
	NOz6VzIjkFsh9MrwKcYjQD8FQNxBnKhATBg+oYwrXWT168ZSZfVCf6OXZ020SeNZ2P5lRpeG0jQ
	s+aevmi2/5sZFmaSbhNHgzTYvoTT2UnQAz1VbgkKZGiM6+eRLgn8nonRyz0Q55j/51cEeVafP+R
	qPwCO6JZe6K8DAHR8ZfiM13kNIHJw
X-Received: by 2002:a05:6a21:514:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3dd5f5ab211mr15101548637.17.1789623768385;
        Wed, 16 Sep 2026 22:42:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:514:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3dd5f5ab211mr15101484637.17.1789623767817;
        Wed, 16 Sep 2026 22:42:47 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5af4f0bsm14466679eec.24.2026.09.16.22.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 22:42:47 -0700 (PDT)
Message-ID: <7d2611bb-532f-4553-9d16-66c4b9c495c9@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:12:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
 <aqtECDwHPiUUZqTB@QCOM-aGQu4IUr3Y>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <aqtECDwHPiUUZqTB@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DkR52AVniZZDun8C0BN43y1MOH_CsL8_
X-Proofpoint-GUID: DkR52AVniZZDun8C0BN43y1MOH_CsL8_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA3MyBTYWx0ZWRfXzeUmEF467cy2
 XiQX9zF0nPvNV3zxYL7ds0UUuwYTJFJgUqonVtO2QsVac2PJ942wHkPvHR+fsGUwuiY7cAjO6n5
 MIyAhLBk0M1f/gHSUzUll56CeThVbiw=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab7dd9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=T1TI9GLrlG5TBy_zXBgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA3MyBTYWx0ZWRfXzccCaygXDs+j
 21iTbp1rrswufPofqcl+g2pUUy+lGoF/Ib2BcungSXowDXtc4SAs7DwVudztZPpqvWa9P8Ko7Ww
 GskPchhzne4GM6SCnUnSvp2dcAcskdqFE7i35n6in/q9aGuStKmy4VAZ9KyJxR4gDNbAz+Nnepe
 1Xs9LI4md4NIO47hCeyo52IW+1TjAMUicofNY+KPHg0+PLuQSy4437wbzSY1+XGM3BIyGBBAzaw
 NrV+Sge/bE8STXP38ABuceP4av+T+UovZZNFfghURYgJqjzHVvgf5UAn5g9oKBC67QDWYfKWoNZ
 ak+frY/wlPK8XHz6LD7BCsxXs+sjtZCVlmsK82Fe92DxDIPZWNaZHRD38yg0hNp/CBni1KF2gJ9
 vLrX2NT2v7xs1p3gPgnLjNOD6Tnw9ueHKYVHRFBZluns5/2GGpTccQ8cyb8JP5gex8TFkDOztWr
 2GWc4ZnD6Na93GcOOAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170073


On 9/17/2026 7:06 AM, Shawn Guo wrote:
> On Fri, Sep 11, 2026 at 09:06:34PM +0530, Nabige Aala wrote:
>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>
>> Add the binding for the display subsystem (MDSS) found on the Qualcomm
>> Nord SoC. Nord is MDSS 12.1, DP-only (no DSI), with two independent DP
>> controllers.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/qcom,nord-mdss.yaml       | 98 ++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
>> new file mode 100644
>> index 000000000000..0b0cacdca9db
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Nord display subsystem (MDSS)
>> +
>> +maintainers:
>> +  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> +
>> +description:
>> +  Nord display subsystem consists of MDSS (display controller), DPU 1499A
>> +  (display processing unit), and display interface controllers (DP only, no DSI).
>> +  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,nord-mdss
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB
>> +      - description: Display hf AXI
>> +      - description: Display core
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: core
>> +
>> +  iommus:
>> +    maxItems: 1
> The DTS in downstream repository doesn't seem to agree. There is two
> items for iommus.

I checked the Nord IPCAT. the resulted SID is same for both the SID 
(i.e.  0x03e0) in downstream repository.

I think we should update the downstream DT and use a single SID entry.

>> +
>> +  interconnects:
>> +    items:
>> +      - description: Interconnect path from mdp0 port to the data bus
>> +      - description: Interconnect path from CPU to the reg bus
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: mdp0-mem
>> +      - const: cpu-cfg
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dpu
>> +
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dp
>> +
>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dp-phy
>> +
>> +required:
>> +  - compatible
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,dispcc-nord.h>
> Please run dt_binding_check against mainline kernel where the header is
> actually qcom,nord-dispcc.h.

Ack, I will update according to mainline kernel.

Thanks,

Nabige

>
> Shawn
>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    display-subsystem@ae00000 {
>> +        compatible = "qcom,nord-mdss";
>> +        reg = <0x0ae00000 0x1000>;
>> +        reg-names = "mdss";
>> +        power-domains = <&dispcc_gdsc>;
>> +        clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
>> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                 <&dispcc DISPCC_MDSS_MDP_CLK>;
>> +        clock-names = "iface", "bus", "core";
>> +        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +        iommus = <&apps_smmu 0x800 0x420>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +    };
>>
>> -- 
>> 2.34.1
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
