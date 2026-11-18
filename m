Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794977490;
	b=i3SEEKj9kW1BwRoO8ttaOr/gXDnXXxw0+3r6JpvBHrQ5kL3enVUZDkWardLRtcgWXpsl
	 IHnwzjusy9Sl61JRzy3NZBcFJ18zj7NUlY5YbO4d3Hjx8Ep0b2YCMTVu2/JHythRvbOna
	 RXbrvnRkEVH40NMY3tCHyrntbCHBbs5+gkBIQLQwKrAmbUm2mgfbPtK51g5DX7BZ+Hn0E
	 3Tmrgj39b+g3r9ldrp9I3S2Pwp1v6vH9xiYby4vu7dDsugMnPU9PYkirjnq0FU+d7Mi79
	 157TPM/SJ6YJA0rca8HOi66HABAcmhpA4zNXb/LKk3yScyAygGWchDR3lJEUHBgGSAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794977490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2gGNj1mVMGkwLJSC+d+QVQhaJGEVdPV98C71LrlbtbU=;
	b=Im8YtQ1UEhb5I5q9bwdTd8kr5iw+O8nZXuxGCZdW8FIrzOQuMgtqxDEdo05hH77CpBNQ
	 5UwGBfv71nnyI5ultNBDcxjQSuuynRbpRyqnF0l25uBiG/hXCp3esTHO6TcXiX1itOSdT
	 LB7gTTRpN4/tjc7F4agH3Gd1GesqqbEhlNS55/xnLtG8Y1S4LXZ+mC1KliMeLS4rcRpO9
	 ogX3IugMaep61SwpyXgTCcAX14gup46+Aq93ww7aoMTu0ihoE67nU6HyLwx4fn7HHQ+vL
	 abeQ6SbgZ3hK+bhQYSnpA3tW2Sd/5jGGIkIaI7MzdONiAQh9Jgj4TmEQv/ebQZuFGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ajvgn8ep;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3YDSHbV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9F4606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9F4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ajvgn8ep;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3YDSHbV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxpT1430548
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2gGNj1mVMGkwLJSC+d+QVQha
	JGEVdPV98C71LrlbtbU=; b=Ajvgn8ep+yB01x9i7q1pwbVGU5q7rcSCVHEiUlXd
	y56DFUnQYoGIPf9BaE95BVAzU4Rg3RsIbuOBdsV/A6Ddrr7BCO/bqTFNImwPRdFb
	OU8FfjfC2sJRlO9G5rBn7Nw5bVaNDwRCp9+19oY24Lzey7vJ63UXvPj8DTs3iZRM
	/5ee52kIT3vbQrD/fSYlRuDUk1g8LbaIDNWk12XbxR+WVsZssQqlA7yJXbPUUSic
	V2IwhwgZ/MmaC5vf9Oj6T4iVQT/wNGi7b25OWA2nvEy4DPMKsdraM3cO7ptrDeZb
	vmRjJ6hDsAnFWByCYY/FIobyUJh/cj4l9xW31sCnHR0DOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv918f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:51:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso129969485a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 20:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794977488; x=1795582288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2gGNj1mVMGkwLJSC+d+QVQhaJGEVdPV98C71LrlbtbU=;
        b=A3YDSHbVxnx7smwFkuSDMJlO6iFK7N/OMXBzv5YXcgHf371TqPVZtsqbJR5WVnHs3n
         hJhrjf5wDqlZ20wNY86Fzm0aGUWUNfUeU1XmCndtrmgwj5M8UtAfjfzndrgUxIdeDxMy
         ht9SWhgP5jOJeBviuT3K7MRG96F/6DDQejj4uClwBnjO1Mk1JQqroG2xsFTOcrgya5fA
         eFacnNzPdDdTp15Up5RISb2v0lJZdydgc9pXehBWc4Ybe/qJaK9jWp1gtLK7dBr9ptHf
         lB38aAT938+u5nx5m6nHY6O73dJ6qgJ1+Pgzfh8kW00oy660M0dZQIDFFtFiKn9kZknY
         zExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794977488; x=1795582288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gGNj1mVMGkwLJSC+d+QVQhaJGEVdPV98C71LrlbtbU=;
        b=jd+jjoR8vjIoxQveQVF26YgSa3r4DqfU8DIqL95uautEwzapa+GqTzHA8ZtsYdow+i
         EYHeGZj0CxRZANDWQ84sBdAMbDhJHxe3A910otV4ZR1kH+kuN7nM2YoDQrOvYQ7GE9Cs
         27eaPkgP821v/QLij7VvZQ54oqFaJvZDtQmcPOMF0ZupgRspU7CTRBDhGJjNB2A/mEEf
         FbowjcCDKJM/9GPCBFISKAUyepGP/vK0EXjOMUy1lb+lD5PLnSCZxNn1xjw51vt3CXWk
         WJkkryaU1BLRH6Rk2sNfCQL1Onz3ws6h6mzuceZqlKfPUhE0Re/tsIeuphi0lQuJ+sSa
         VWmw==
X-Forwarded-Encrypted: i=1; AL+hErG9tm0r8wvPOpbchEY60hTumpJwyYB1dJWws0oeSxyKP0Y8hhsBaD3fqg+KFGNQBKqQtlwubNe7tFH+@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bl9FfVxRcG1iH/VIT/5mAS1gWmsF3s2WvnYljiWqSHBig2vbG
	AGemSXFgAByGsALemSPskoNc+UbzhZ0S6sIKR+fFJlCI5TUIg7QW71k0+KX+79MWC0kILJpcYHJ
	qV9zo1OyC7dR0RxJ25IKJjUne38VaFIr5nL/OkX0W0wy63Jv1PFTW6Oi/9j0kOfF3
X-Gm-Gg: AYBFou3rntPEKuKJtLFn0Xzm0+yid/IKAAo1ad78jX09fLFbgsAnIdK4SEb7oPQU1mC
	MJjZqxSCIVMSdeJTaAnIVY+N9IOWxgf4hZSEf/h9Ne2VVCstwD0xL9RYBU00Rhon+a+eg2L7gTq
	dTIO1N9Sb/KENuZs+jvxz9edQFZo0K/FUbMf9MVQlBTExKciWXfi5YlCnecOWlnNjZP6C14rS/M
	XIywxVvyxNXJqYQiQv+X92mzl4T9Jm+VNC2NqQC0hdhx7/Q30T7dQdaleAYAuU9CFuT1X8ThZbo
	HBIFpno6M5RLi6m3GRRgwLsMHBaW2r6uItEcXa9VjQV2hOkfic+4c1yevN5ffYiQ1Ay5QAz1vZW
	MqLd2x5hwrp+HSWqVsguwE4PQWc1QvD6147WzcnIM7dTf+K2VTaleE+zXnfwlH8GIbaDf74p1eS
	50DgZRBXY2DR8=
X-Received: by 2002:a05:620a:4729:b0:949:61a9:5a6e with SMTP id af79cd13be357-949995a8479mr320831885a.31.1794977488122;
        Tue, 17 Nov 2026 20:51:28 -0800 (PST)
X-Received: by 2002:a05:620a:4729:b0:949:61a9:5a6e with SMTP id af79cd13be357-949995a8479mr320825585a.31.1794977487465;
        Tue, 17 Nov 2026 20:51:27 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm2742959f8f.8.2026.11.17.20.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:51:26 -0800 (PST)
Date: Wed, 18 Nov 2026 05:51:23 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 03/11] dt-bindings: display/msm: Document Nord MDSS
Message-ID: <av0uy_Cq9iaTZn4c@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-3-e3d3bf0e2c49@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-nord-drv-dt-v3-3-e3d3bf0e2c49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxOSBTYWx0ZWRfX00PSijsaJqiE
 mYPSiNqHC8s3QzvpHP6pneSKmClms7w5yCWgHGn3QkCBx/A+W3KnCYqcRLSXm7hGgOY5z02yt/w
 5rpgfglor9j0iMSraz7RMgVF67aXaMnLCsjMHnmrRbtpe5JgZIFjfu/dWBwMn7f8BLjPwLmAMBl
 kST1wsyrWMs/iEG3w9AK6ML6jkdXvHnQ8RqyFBNAvM4tpREUH2uDwv2PtoiCOvy9ou+HLKUnbnA
 RZJIlf9+3KFEgMpWV2Ur8kxQwb8y9YoFUvIGbdeZSpHGmNJ6HoPccgq+3NJpUdZ6qbUfC2cGJ7l
 2FBw5PpNJZ/j1UuUf7Y9FSU1KdKQkhWAm+mU1tR1ZCfAUtB+5r/MPvmC5WkneF+NkoaX8tQNXOp
 gj9lFeqPcQe7y62LWQqVewvgC9+aYFQGhyiZY+SCCPjc6EzpvGUYjcR49DV5QV2ZbhV5I2zgzPu
 2nr5mO+yUkPUSzVdtQA==
X-Proofpoint-GUID: -tzp3L3afexn4Qo0gbdBU89E0LEq2M-r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxOSBTYWx0ZWRfX3KDjWO2A1txT
 Rxq1ga7kO+KEgf+7Y1R7XunOo5pK2qIW8rI3Z5XyEOKDeLwX8IuUTT/Qys6RLGaZ8tZ/uht9ds/
 dsKWwkDWPl/gOLeUSp4raNQWGiVMcYs=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd2ed1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=s44c23SdAZ6jS4fPfVAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: -tzp3L3afexn4Qo0gbdBU89E0LEq2M-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180019

On Mon, Nov 16, 2026 at 06:46:42PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Nord has a new MDSS 12.1 revision with DPU 1499A and two independent,
> DP-only display interface controllers (no DSI), which no existing
> schema describes. Add a dedicated qcom,nord-mdss binding to document.
> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,nord-mdss.yaml       | 396 +++++++++++++++++++++
>  1 file changed, 396 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> new file mode 100644
> index 000000000000..abd80dae4e7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> @@ -0,0 +1,396 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord display subsystem (MDSS)
> +
> +maintainers:
> +  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
> +
> +description:
> +  Nord display subsystem consists of MDSS (display controller), DPU 1499A
> +  (display processing unit), and display interface controllers (DP only, no DSI).
> +  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,nord-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path from mdp0 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: cpu-cfg
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dp

This is now contradicting with the dp-controller bindings which documents
"qcom,nord-dp" with a fallback on "qcom,sa8775p-dp".

> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dp-phy
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,nord-dispcc.h>
> +    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
> +    #include <dt-bindings/clock/qcom,nord-tcsrcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    display-subsystem@ae00000 {
> +        compatible = "qcom,nord-mdss";
> +        reg = <0x0ae00000 0x1000>;
> +        reg-names = "mdss";
> +
> +        power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                 <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
> +        clock-names = "iface", "bus", "core";
> +        resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
> +
> +        interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                        <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +        interconnect-names = "mdp0-mem", "cpu-cfg";
> +
> +        interrupts = <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        iommus = <&apps_smmu_1 0x3e0 0x2>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        display-controller@ae01000 {
> +            compatible = "qcom,nord-dpu";
> +            reg = <0x0ae01000 0x8f000>,
> +                  <0x0aeb0000 0x3000>;
> +            reg-names = "mdp", "vbif";
> +
> +            clocks = <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +            clock-names = "nrt_bus", "iface", "lut", "core", "vsync";
> +
> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +            assigned-clock-rates = <19200000>;
> +
> +            operating-points-v2 = <&mdp_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dpu_intf0_out: endpoint {
> +                        remote-endpoint = <&mdss_dp0_in>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dpu_intf4_out: endpoint {
> +                        remote-endpoint = <&mdss_dp1_in>;
> +                    };
> +                };
> +            };
> +
> +            mdp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-300000000 {
> +                    opp-hz = /bits/ 64 <300000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-417000000 {
> +                    opp-hz = /bits/ 64 <417000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-532000000 {
> +                    opp-hz = /bits/ 64 <532000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +
> +                opp-650000000 {
> +                    opp-hz = /bits/ 64 <650000000>;
> +                    required-opps = <&rpmhpd_opp_turbo>;
> +                };
> +
> +                opp-710000000 {
> +                    opp-hz = /bits/ 64 <710000000>;
> +                    required-opps = <&rpmhpd_opp_turbo_l1>;
> +                };
> +            };
> +        };
> +
> +        displayport-controller@af54000 {
> +            compatible = "qcom,nord-dp";

The example needs to be updated for the "qcom,sa8775p-dp" fallback
as well.

Shawn

> +
> +            reg = <0xaf54000 0x200>,
> +                  <0xaf54200 0x200>,
> +                  <0xaf55000 0xc00>,
> +                  <0xaf56000 0x400>,
> +                  <0xaf57000 0x400>,
> +                  <0xaf58000 0x400>,
> +                  <0xaf59000 0x400>,
> +                  <0xaf5a000 0x600>,
> +                  <0xaf5b000 0x600>;
> +
> +            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
> +            clock-names = "core_iface", "core_aux",
> +                          "ctrl_link", "ctrl_link_iface",
> +                          "stream_pixel", "stream_1_pixel",
> +                          "stream_2_pixel", "stream_3_pixel";
> +
> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
> +                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
> +                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
> +            assigned-clock-parents = <&dp0_phy 0>,
> +                                     <&dp0_phy 1>,
> +                                     <&dp0_phy 1>,
> +                                     <&dp0_phy 1>,
> +                                     <&dp0_phy 1>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <12>;
> +
> +            phys = <&dp0_phy>;
> +            phy-names = "dp";
> +
> +            operating-points-v2 = <&dp_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            #sound-dai-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mdss_dp0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mdss_dp0_out: endpoint { };
> +                };
> +            };
> +
> +            dp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-162000000 {
> +                    opp-hz = /bits/ 64 <162000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-270000000 {
> +                    opp-hz = /bits/ 64 <270000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-540000000 {
> +                    opp-hz = /bits/ 64 <540000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-810000000 {
> +                    opp-hz = /bits/ 64 <810000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +        };
> +
> +        displayport-controller@af5c000 {
> +            compatible = "qcom,nord-dp";
> +
> +            reg = <0xaf5c000 0x200>,
> +                  <0xaf5c200 0x200>,
> +                  <0xaf5d000 0xc00>,
> +                  <0xaf5e000 0x400>,
> +                  <0xaf5f000 0x400>,
> +                  <0xaf60000 0x400>,
> +                  <0xaf61000 0x400>,
> +                  <0xaf62000 0x600>,
> +                  <0xaf63000 0x600>;
> +
> +            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
> +            clock-names = "core_iface", "core_aux",
> +                          "ctrl_link", "ctrl_link_iface",
> +                          "stream_pixel", "stream_1_pixel",
> +                          "stream_2_pixel", "stream_3_pixel";
> +
> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> +                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
> +                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
> +            assigned-clock-parents = <&dp1_phy 0>,
> +                                     <&dp1_phy 1>,
> +                                     <&dp1_phy 1>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <13>;
> +
> +            phys = <&dp1_phy>;
> +            phy-names = "dp";
> +
> +            operating-points-v2 = <&dp1_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            #sound-dai-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mdss_dp1_in: endpoint {
> +                        remote-endpoint = <&dpu_intf4_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mdss_dp1_out: endpoint { };
> +                };
> +            };
> +
> +            dp1_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-162000000 {
> +                    opp-hz = /bits/ 64 <162000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-270000000 {
> +                    opp-hz = /bits/ 64 <270000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-540000000 {
> +                    opp-hz = /bits/ 64 <540000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-810000000 {
> +                    opp-hz = /bits/ 64 <810000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +        };
> +
> +        dp0_phy: phy@fc3a00 {
> +            compatible = "qcom,nord-dp-phy";
> +
> +            reg = <0xfc3a00 0x1d0>,
> +                  <0xfc3200 0x128>,
> +                  <0xfc3600 0x128>,
> +                  <0xfc3000 0x200>;
> +
> +            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&tcsrcc TCSR_DP_TX_0_CLKREF_EN>;
> +            clock-names = "aux", "cfg_ahb", "ref";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            power-domains = <&rpmhpd RPMHPD_MX>;
> +        };
> +
> +        dp1_phy: phy@fc6a00 {
> +            compatible = "qcom,nord-dp-phy";
> +
> +            reg = <0xfc6a00 0x200>,
> +                  <0xfc6200 0xd0>,
> +                  <0xfc6600 0xd0>,
> +                  <0xfc6000 0x1c8>;
> +
> +            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&tcsrcc TCSR_DP_TX_1_CLKREF_EN>;
> +            clock-names = "aux", "cfg_ahb", "ref";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            power-domains = <&rpmhpd RPMHPD_MX>;
> +        };
> +    };
> 
> -- 
> 2.34.1
> 
