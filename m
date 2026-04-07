Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3D33BBC6
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 19:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591168; cv=none; b=kvG24pH+8iCJIkdcS2Vj0vPkv+v2tKFhrQA+StE8j84vvvaO3uD3WIPUpHfCPs5P3+lny3nVr42x4TQNMBLs8rowCtpIkhONDq1Q+iY/FEWiBsgWwbykFf38rd7rQ3lnoFfi6D4jz/4pu53c7b0NHniaa10kN2PuOmfAwXXwUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591168; c=relaxed/simple;
	bh=PEBo3CGGJkq0zIUzkCrcAuQgkw+k2xuFQhM5II936fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHn9ReIZwnZghj0wrTyOGVszOrXqN6g9e5ULM86yYaapROiaGcIXQ3kLE3TkvrSIgCX/kE0t/TO9XoT8EEoIn6XXL1QfFjYso99exMNhtGhAAgmF1h8OYmks5j7fUmznRk0gH3WlI6WNauZ+lwI8cfXqGvTe5TvbFiDKKuSpoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Db/EPS89; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq1NwuY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Db/EPS89";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq1NwuY3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J85Iq3362755
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 19:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIjq0YEjJ7jpzlM6N05h5tBr2Wsb2iFf41iaHc/0aBc=; b=Db/EPS89o38GK+rd
	YD38sVl4Fqi8z20nteZ0ZYxzzP1wz/f8eYn8RBklT8lZxpK1OGzQgxw75DQ8odrS
	V9eR6nR7oRJTew4Y7qJhX7zVGQzExbGpvo/Mim+bvI7fQuBatoAyDIuTE2GB8iGI
	DWmIcswTiZkcTzd+BKigVLHWHYgrOt+eMoCMG7wjNZPPTxNIq+q+Ujtf764uerWc
	4R4zaP65LSMURrP41eaYnZtvD8o0FW478kNuw59mRYjdxO9mVaZaq+pXarypvLKV
	SM9wW+IxOL+r+qk7MLSoVqVll15Io67LoQ4/wFX7i3rOqq+p8+HxnSKSog+9D9Pv
	0vJYVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkg4a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 19:46:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so71815575ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775591166; x=1776195966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIjq0YEjJ7jpzlM6N05h5tBr2Wsb2iFf41iaHc/0aBc=;
        b=Dq1NwuY39xPyz9M9DnH+cLYAKVyBNufB/iQWkSXmoWmPoxXUsdVZhMWTU+hz/UORfT
         O5GI6MF+DztVxNXASkuV8abdPG5PLcym66COxqTEJmFGdOkX3qxG9TC5h9M9TH29Ki48
         JFj69euPmSNKYjvadv1Fea7/rKSGEt76RqvuzVLAEOQjDUaxea5O20m/Lq4SWwV6ksVB
         C57nCYnT3KBl3eimIvF15+eJCNYW7LUDDYrcishMUEJxSKXJoV8jh26czKj4cHADCfUt
         CtIOvVsuHDac06PXbmJXLs84q1fsZHrRpnuFRrNmxd5JIseYiyb6wS1/zCNuj/5Lp81K
         uGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591166; x=1776195966;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIjq0YEjJ7jpzlM6N05h5tBr2Wsb2iFf41iaHc/0aBc=;
        b=HoEV++qCxRnIIWPnXJLKM8DjN4uM3QHKo3hsemDPsLOU2wxVC/AHCk3a+d9WpQI9UV
         U9PSfkwFlKfLHhXPTKvQEyuqAZvD1kKLA0Iy50JxFfnlZkTRwW7SCRK9Rqje1zf5Vnke
         R26Tggr+KqwC2dcLEcU59XAgZ4ZNg6pOKS0ZX8DGy+2CDHnxoFopJFU7d/0FpSYUS+p+
         L+NAFxBX6k8qYUp8z//fTFWc2GfwdbIDwtvjBHoI5HfJcevq13XABLUJuMunIhsMQcQg
         ClQXLV6Aw7oqqwUPTJRCFRHdhIfo80nwAKSVLF59bx9xFJxwyko0EAVswPJ+xFLXu8Qq
         /SMQ==
X-Forwarded-Encrypted: i=1; AJvYcCURU14dBIzGqjVFr034RNcR3G3XIUpqO5ZnsfuRiMzsD91QpkFibAJBhpxifqfBkBsH1UeCB43qe/ww@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1LlXwHWnJIndWnZGqqCNRd3YX0QGhL250zmDCgUqxf/LSLUr7
	5SNEE24eB6YveDXp7wSeu7wRpS6qtSljCFvm5IIu/8CjOiD89z4IgzloKpg77bS7kO2rAdkZeqU
	LhWETfb6zJ9r8aZA8KDsGinu5bMKRRoaKWrI/E05/42SNEUKgacBcD6PXo8l4FdxO
X-Gm-Gg: AeBDiesH0EJZJw/b/7WecpxOGBAQD95MOeQZdhZbOJmNu64CpxbWFGGoLoLgjzX390Q
	I3WF6UYFOyBknQM5jh9X29u7soYOxSUKrmUknMQr6B1H2Kihw2o4ZKpI1VGU0GCdhwdc+J8S0Zx
	BUSGkMb30zODTqlo9YfuS+RE3lYnvNmxKeXvrTAqAXEeu17qSOUSN1PslDpJZ0qsmNfivsjSALS
	G+Zw6MNNE4hUx28gmcNsuwhyts3ZtGQluGrqXdZnA0ayIH1qkzXrZl+/NWWT6LhtUcuX3FlshNo
	2YAyeIfZyYqCdwlKJPRGvar633KuyNQEpbBM+bADM9+7tsh0gX523YbKQL1TFb3lR6rW4uwmDlo
	8RLn432W2XXGvS/Y8Sebpp4tPe4M5zJz98xGbcYSnQgvwBA==
X-Received: by 2002:a05:6a20:3d8b:b0:39b:949d:6078 with SMTP id adf61e73a8af0-39f2ed105f1mr20293019637.6.1775591165838;
        Tue, 07 Apr 2026 12:46:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8b:b0:39b:949d:6078 with SMTP id adf61e73a8af0-39f2ed105f1mr20292960637.6.1775591165144;
        Tue, 07 Apr 2026 12:46:05 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76d2684b75sm13359006a12.14.2026.04.07.12.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:46:04 -0700 (PDT)
Message-ID: <aeb8fa01-3ae0-42d6-9bf0-226184b36260@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 01:15:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/6] dt-bindings: display/msm/gmu: Document Adreno
 810 GMU
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-1-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-1-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d55efe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=CPVj27tIqRs5YXHx02MA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: yTm4jVXVMz6SO-FMAMFGqnQcHC9afzvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4MCBTYWx0ZWRfX+EwB5v9RrwTv
 JE/QXijB2rTkHSdrYgCUbDrtvPEToSx7aWeodi9k0jg9RrHck/7oiog8bZO0W2xmZ1/anaWjiYy
 fvUGss/jORrg6qnD3ZUaU1vQzkY4PS/B3OdplIFN2RfOvO3B2gE8Y18Dwq21G/ZQp/o2iQVUQY2
 xHGm9IbvJdfWZbfnSsFw4UITK5h6p88CFyRy54aK3kUOXt7t+ONk5w/WmJnCs0pxkMVayeYXr+8
 hkcP/BNRxYdpVOVY41r86OObsJoRUMNH8Yxjzg+oB+Byw4T/tT4Sq1V44wH4jr+DFYCVdPNdMSi
 hVNdYOzMsAnKMR9DPANMIFnMYMCEvEqzG/v4p5ZsuPtslOVmOvW82prtHFvQ/BY09UAl2GtTbiX
 n2lifFBNUTN7mGgI1Ivlx7IUJWsX7Hfu8/Lg3n6NMA5fmJw0zmzT9Nu2bndnrLNJ06U2buIbxlQ
 wWUhaxKBSbJZZssxRGg==
X-Proofpoint-GUID: yTm4jVXVMz6SO-FMAMFGqnQcHC9afzvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070180

On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
> Document Adreno 810 GMU in the dt-binding specification.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index e32056ae0f5d..2853f6aef966 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -299,6 +299,38 @@ allOf:
>        required:
>          - qcom,qmp
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,adreno-gmu-810.0
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Core GMU registers
> +        reg-names:
> +          items:
> +            - const: gmu
> +        clocks:
> +          items:
> +            - description: GPU AHB clock
> +            - description: GMU clock
> +            - description: GPU CX clock
> +            - description: GPU AXI clock
> +            - description: GPU MEMNOC clock
> +            - description: GMU HUB clock
> +            - description: GPUSS DEMET clock

DEMET clk vote from sw is not required for Milos GPU.

-Akhil.

> +        clock-names:
> +          items:
> +            - const: ahb
> +            - const: gmu
> +            - const: cxo
> +            - const: axi
> +            - const: memnoc
> +            - const: hub
> +            - const: demet
> +
>    - if:
>        properties:
>          compatible:
> 

