Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325DD47DD78
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847231; cv=none; b=EBKMdV++DXIQnTs2iXFnKyCkHMfV3xOvB/Wcn80OYZPpWUaszFJb3ru/LWiRxF59tAA0ba+jAvsvyoNrCULUcM4soXj6ywrvTb0/eZIhbdHLb/SPWPlWM0+A76GNnlUXfuC+a8tE8/8u0St8yZeGdl9wIiHjpgLlqDcXn1+sPyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847231; c=relaxed/simple;
	bh=vRwzbzspWPueputM8Mkd9jQYkXF209p2RCl0TnnxZPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GESGPEwxEE62ANM5tCa1DVONtWoOjM+hanWBdpBeDDvHafvSWukQrPKpdudGGpSjByfy7D0mGEmjTCp09cTBKMYACeqownBgV4GgB46P+zyvm0owUbaLXnC7FAVsvN+q0kZOHss2gQqqilIO5TAGJ5pz5C2vmYRi1VZd0jk9rnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBSe8EUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DP5l8D4Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBSe8EUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DP5l8D4Y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB0iRj4008413
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fY80wj4vnbS4pG0nwppUhE1i
	O6csTYhmaG08pE6CwTM=; b=TBSe8EUJEyG+e5vUmNOAfAo9Gu04KaLqw/7Qvn7j
	yd1qYeTj4vNHcrbkKAi0KUP8Qp9YcFtQzbNiMNH076Dpv37DRXfmmwGdhgcH+Mbl
	YW1ygHnbveI3f0fZbbnNU20aGIPkzfK7i1sXENkxKU3pB0qHnwFydWvJnwd4f3u/
	Pl0ZIct1+52OqRKdCVe2WKYOVSYGGNZgFJSD2RgKmhwQ1z1RRrAxnXDeT+B5S+1C
	peQvY9xnUujLemWUA1pbPYDbrrHRjvw2qFoeJNKSdtrv5hZlM0wBMckATL2Nv+Fv
	F7Opr2mvU7iY8nOwtfxJ4qxYwWnA4HqVq132TGiKYNtENA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su6rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:13:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6374098885eso5434581137.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847228; x=1779452028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fY80wj4vnbS4pG0nwppUhE1iO6csTYhmaG08pE6CwTM=;
        b=DP5l8D4YghdvZNVpcxnosiR0jbkhRNJYcnq5E66iTdnuoBhSrPOWo2kxnR/akQ9r/O
         4AgsjOFqn/+aqon6KIvQSg6GyjIojE597Lt57nHomfl1TzGP/1loHIL01FnHGludjt3F
         EMds/8HLHBp0UjDgnI0xw6q86eQQdT5V/mOEQX9fWJuqYkvgV/uSAolG98l/yjk97WH8
         VKfbwcpLC3J4KJaSq7alLqBBFqE20d0A85ohLoCdzkm6wlEbjcWP7cEYFNXowtLbjDJ6
         Fq/wE8drgWZWUONV/iwIZxk2RmMmhCeEGTm0OioiMGeKSjjUSYV6l4FU/Kv5M4zpsjVf
         xfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847228; x=1779452028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY80wj4vnbS4pG0nwppUhE1iO6csTYhmaG08pE6CwTM=;
        b=aQT8JYmVEhro2bCwsPIFZEMQqzzqG+4JCa5P0U4wprOVXmm/xLxOrsw2HxUgpZXMbC
         pG0PQ5HSroBEIvKETA9ME7zM9wbbxZT/ZlUjSYmclrd4eO5qHZ0jLvptRkezM2qso+BN
         RWCqqZ6oLSUxK72zYmak8xIYTT5tvBpUWWve1c9kEgpBuY0yW4D2rrm5keTBVI7o6464
         +rU4yZlymzcgi7eq625xUgoM7fzoXAhmkfz4vvjgDesiyZCZ9SAncp7cjqTCtbxFBXDA
         z8M1Kgdaemu9IolmGgiRX8/4Aw/1OYb+VOer9hq2s0W3kJF+EqO/2+X4OIViQJo0GKH7
         21KA==
X-Forwarded-Encrypted: i=1; AFNElJ81Ku6P/rPXD2TaeyRrRABVqGx9oXjJIBvGWniCtRRru4C+FVe2L3MPkbayaVWb3e9sclucoA1vWjwG@vger.kernel.org
X-Gm-Message-State: AOJu0YwhJY0G2jJZqycyEDDrrJMTT9O9LZUDWLrgMEIkyu2fbzdtYnXq
	/2PiElDz2IAnX9oxB8wTprbyNhEDIwNvNi3WACwrLQr9tYkUzsBG8AussZxwmy3UO9ywQOfa3kV
	DS31Js6tDQSubfOhvPOA5Ywb6W96lPqYVUw+piTJMx06kEct0WLH/Fzyhdv556KDF
X-Gm-Gg: Acq92OGsjJsvGWYkejUAYnhzKLR6YMg5rF0NzVUchLPbq2mDWjFiZqQ0OKrQSa6q/zK
	yg0iI7yoqz31HXQ/+fmSTTwCr4tZmmQx701e2V1ao+U3yxY+wucZs0fr1wYUKTbRjEUbthZhZ75
	Cqssy8kyG276mbapbU4/Aq8w4I1N5B9e+4Ig3G1Odp5N6QfxcJi7MeVS1N2fPuNLOkLQN4SCKpT
	3+TwFmA/pKwNELIyuoiVx6eiTOzhhN70xICJrf613YTPGctKwU6+QQxaiCf29+EFwKqD2gDs+ei
	G4HGyycxdk1R2KIfjxwiY3o8qE+SsgSUkYvuh/d+5GxM2RrEoDnsY/edLIeNGufbhe3U7S9OER7
	HRYDc+YVY789WrUSnsFi5QpNtAXct+qHEsy/3xfhyQZEDa3xtD+qtPXfaLTH9QI/7J8BDkG6FAH
	COGsQ/a9tZX9xQ/o1JpaSr2veO9IqLXP5nRK1a5ZbDd4kfDQ==
X-Received: by 2002:a05:6102:1487:b0:610:6e69:5235 with SMTP id ada2fe7eead31-63a3f68e785mr1827047137.22.1778847228245;
        Fri, 15 May 2026 05:13:48 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:610:6e69:5235 with SMTP id ada2fe7eead31-63a3f68e785mr1826968137.22.1778847227612;
        Fri, 15 May 2026 05:13:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5a36sm1304180e87.60.2026.05.15.05.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:13:46 -0700 (PDT)
Date: Fri, 15 May 2026 15:13:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: qcom: add JPEG encoder binding
Message-ID: <bfohhhg63kwhi2i26uhvif6xphpj7qoapcym6d6vbgic53oxzn@qj55uifqzg2u>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xp1wdwX_bmvkUvckI-9G48ZNzjZIOq3m
X-Proofpoint-GUID: xp1wdwX_bmvkUvckI-9G48ZNzjZIOq3m
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070dfc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=kY0BWnVueK400W3C_3IA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX5B+PrbH3thW1
 YAVFGGAK2Jz3avlaMX/cLAJseMSJ9QaUdtS7FE+pIhkesJfuBfeC4hebpGJPB9aCqe138i1kj8I
 mS4srEZMjVHT5+K3QtFbIi2UpD6D5gjSaifDdw+DNCmBLId/2pND5Ztuub8/LI6akyaTp7gTx91
 T2G0UW0QeFif76VfvFbVn9Ecx3BkgL8Iak63cd3NUlHPiCD8Gg4zIc4CfzwquQ2rCPG36JvF9GD
 GXlInOQ2mOSkEW04lIYRlSpyTUAJ31YEia1EBqXsWo4PChuIryRkPGHUsCAvb7E1HWj1Qy1Uzr8
 iULbWojTjF5ZN9KbRj80yzyzE/KHnCOQojXdLUiPw/QW1+TEJr9TQ61CiiciPA50zGcX+vQ6ur0
 HUH0k4SdInUJRQY4XbuystRUpd/i3vlajBqx5otml1DOSWwohglaW09ZG8T3eHtOvjTT4vLyqXQ
 pLQN748SAW1OEIjdFRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123

On Fri, May 15, 2026 at 02:46:59PM +0300, Atanas Filipov wrote:
> Add YAML device tree binding for the Qualcomm JPEG encoder
> hardware. This binding is used by the newly added driver and
> describes all required resources, including clocks, power domains,
> IOMMU mappings and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml          | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..fac3e654458d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>

What is the recommended email domain for Qualcomm submissions? Why are
you nominating some people as maintainers who haven't even touched this
patch?

> +
> +description: |
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - qcom,sc7180-jenc
> +        - qcom,sm8250-jenc
> +        - qcom,sm7325-jenc
> +        - qcom,sc7280-jenc
> +        - qcom,qcm6490-jenc
> +        - qcom,sm8550-jenc

Is there any difference between JPEG encoder on all these platforms? If
not, add just one primary entry (qcom,sdm845-jenc would sound good) and
then use it as a fallback compatible for all other platforms.

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: jpeg-regs
> +      - const: cpas-regs
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 6
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +    - const: gcc_hf_axi_clk
> +    - const: gcc_sf_axi_clk

These clocks name the source. Can we have a target-specific clock
name instead? Also, why do you need _clk all over the place? What else
can it be other than the clock?

> +    - const: core_ahb_clk
> +    - const: cpas_ahb_clk
> +    - const: camnoc_axi_clk
> +    - const: jpeg_clk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_0_mnoc
> +      - const: cam_sf_0_mnoc
> +      - const: cam_sf_icp_mnoc

Is this supposed to be a separate node or a child of the camss node?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - power-domains
> +  - iommus
> +  - interconnects
> +  - interconnect-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    qcom_jpeg_enc: qcom,jpegenc@ac4e000 {

Drop the label, it's useless.

Do you see any other device tree nodes with the names starting with
qcom,? What should node names look like? Which document covers node
names?

> +        cell-index = <0>;
> +        compatible = "qcom,qcm6490-jenc";
> +        reg =
> +            <0 0xac4e000 0 0x4000>,

Do you see other examples having newline after the '=' sign?

> +            <0 0xac40000 0 0x1000>;

This points out that this wasn't even validated.

> +
> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;

And this won't build as is. 

> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +        clock-names =
> +            "gcc_hf_axi_clk",
> +            "gcc_sf_axi_clk",
> +            "core_ahb_clk",
> +            "cpas_ahb_clk",
> +            "camnoc_axi_clk",
> +            "jpeg_clk";
> +
> +        clocks =
> +            <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +            <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +            <&camcc CAM_CC_CORE_AHB_CLK>,
> +            <&camcc CAM_CC_CPAS_AHB_CLK>,
> +            <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +            <&camcc CAM_CC_JPEG_CLK>;
> +
> +        iommus =
> +            <&apps_smmu 0x20C0 0x20>,
> +            <&apps_smmu 0x20E0 0x20>;
> +
> +        interconnects =
> +            <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
> +            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
> +            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
> +            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;
> +
> +        interconnect-names =
> +            "cam_ahb",
> +            "cam_hf_0_mnoc",
> +            "cam_sf_0_mnoc",
> +            "cam_sf_icp_mnoc";
> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
