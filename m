Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6BC3D812D
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130343; cv=none; b=mALQJJIY3lzFGIheF1oVtrVivuuunXGhTTXAau0btqSeLdhHd2iWRXvNLXl9I9QUic2TeyFFCrwaZTmKkpYf3QuMxXO9mBflyncHDegvwPLKce7sbVnV/lGc7/q4iClPKau0oDWADdGksc6gbhUlAbsQWX2QuEP2S33hVU2EZLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130343; c=relaxed/simple;
	bh=3Z2/9UqtEtBsglgzBaJ0JiBgZ+BcLHLqDj6g4rOOZYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPkV08TVdgsRbGkjhkB5DjJvMuyI8CPQ6tJ7nVGsqotsZ99XgmI5lzomStm7Nt7J8lOkY8DcN0nZ45M1hBYfl2lGSAHptyUdwpMugV1zy0M9WKRI3uIs1JcoTbBNEQa8hwQkv6HB11PcAfp+18r7UhCJcOvHPJSfwM+yrJREOAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgokJVDY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQpJfiLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgokJVDY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQpJfiLZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328RpHs351773
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 11:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbW2GVtQLECICNbCJchxxSpZYBY6WOf1KNIaA4QN208=; b=jgokJVDYQEz7Wzk/
	VIEYiLLDapJbvJ0uje0/7KfvbQB+MVo5XwEodF4FWNdq3hsZ/i0LML1SYzamalF4
	Vn/hbl7nQ4w7AHatMek8M5rD1qeyOY2IvGJf8fvJtwCXJ7si1d9Fv9q9ZA4bJC6+
	q28WhuOYYnnSLrhOhXOMj0bNYtrFtKuUmjEn2qkUbvgELZZ10NIlvmuNlvkR6H9+
	9p9dtfCGDz75rNn56Jlb/qx6dvIvuVciKRKaXHkmiPCY3s+D/g77uFbio4Lnd68d
	R2oIsJiID+779qQIivETkencA2mpYg6a0CLpLYBaUVywEchmazpU+k1enLT+aYA2
	g3Rz6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh8s3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:45:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so21079671cf.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130330; x=1775735130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbW2GVtQLECICNbCJchxxSpZYBY6WOf1KNIaA4QN208=;
        b=IQpJfiLZ3xa6VFxt68ZXaynx89Z2rpkmAEYzUarKZlhk/2b6UAijhf6yzJaMKgoHXT
         25xqiA0Orizc82m51N9LGmWyxJgfTi+jl2ejrKcBcV9SMlfZU+OXXrghp0lL2zoziX9z
         ljjUBC7Lo62zaS7k9ziOhDza1lfpaHw+0fXbbY5SIlXWIhlBsMVdK1+1hCDh5h/X05w/
         Ze42lk9xGYb70+Vu/z8vazCM+oAdqeCHPoINMglAlVK2SemQw3VhEbykHO2UECTGhYSc
         Xzel1FnUu2vKzhjvHFKWOd+ZYorPJlu0DJAyhmSqjZIYVggZCD1PPi7R/JmOovh6avs7
         9TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130330; x=1775735130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hbW2GVtQLECICNbCJchxxSpZYBY6WOf1KNIaA4QN208=;
        b=WDaZ/jKzC+P0YM5UHfZEUmT7ZRm8a048PR9Ysz/RJdpexXz1oTJhiW4Rcj3MR9unCt
         pf0OL4NVEx25N5wxFdeWYTKMdJsPFvxuj8lvisKSWrSmLII7KrAWdQdO8XZCZqUw+20f
         hDmXAlYnxrvhdqS7Rhl/4kqtxvFvzuvmcfAiYpJEpE9Zp11glGCKKVBYefdIArf5pBi9
         E6S6HI3eR8PT2hTXD13jKJzHOQLCuGGKWi6KyGPFX3TgNwlH8D1eyJ5l4SADqcd/kMW0
         DeA0VO9EejFBy5XsutH6f7XWDQP3F/zkUVKocssAknafFXzYdf+N0SQHMsURjo0TfZdP
         1oCw==
X-Forwarded-Encrypted: i=1; AJvYcCWBKMcbGIF7hlNYsoO4QyRhOoqs7rEKhjG8dqLaEaRIfaeL0VWu9Oga+VBSjmtUUTaDJL61Ubi3vyW4@vger.kernel.org
X-Gm-Message-State: AOJu0YygfFDJ6jXC6vHbk/+Uvm4gg9JxOqMOSSp2QWmUfqH1zkMgLatB
	gh32+ScolVHvhiBhCHgVLyCpfDk0l1Gt485XhJDm850MJ2w6luWe7n68wqDaBt+A1LJC1+1zckA
	qlcvcNqYWOSXgm5cAoxedWQb5zSHLZ+47Ft2SP81VdaKhEDQtuHnNTc1tCGJ0E/y2
X-Gm-Gg: ATEYQzz9mTQy5Qq8rSz9X610/jgqKs5tl8WCh6alaXR6ib3dr9WdO/3xrH//HminZxP
	jOqX/vA3IvQDtW2slD3YQB3wTI2RjFSKeEp4O7VlV3r2t21po++45gQbVMdttMLNEYNbFjBaNll
	u/29RmLqM3Yc381PZCKh7GW9UGd08zLOdPqi6MifOzLBF+C3/C9E1z2PGDsi32VfngBwfmc0F8X
	HSfrmo+enaMVd3dVzkRAobGZtM6nOWCG2ZuPwT/PhuQwE1XU8PnLHNf/D12eTKvfea/sUrb/+tn
	TbI1o0BVxxwXYko2GkNj9HYz5NQFMEL++S2kN3C8cRv9XOqcLmxUqUqz+XvFXKgkk1DxpaQr1Pz
	UmaudPTuYfYZoEm1TPyFwvqjuFMpC7e6ey4tgBvhw1yj3
X-Received: by 2002:a05:622a:4d8c:b0:50b:2876:586 with SMTP id d75a77b69052e-50d3bc2d982mr96081651cf.5.1775130329855;
        Thu, 02 Apr 2026 04:45:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8c:b0:50b:2876:586 with SMTP id d75a77b69052e-50d3bc2d982mr96081311cf.5.1775130329437;
        Thu, 02 Apr 2026 04:45:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:13 +0200
Subject: [PATCH 2/7] dt-bindings: display/msm: dp-controller: Allow DAI on
 SM8650
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-2-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3Z2/9UqtEtBsglgzBaJ0JiBgZ+BcLHLqDj6g4rOOZYU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbNbiIvuacgY8VI0ynmZvX/Ny5JFSq4MJ8GE
 UDIavP3F9qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzQAKCRDBN2bmhouD
 13krD/9t1ubnPWoTx8xk5+UEzCbniAX8/xtY6USzQOeOjJCAv7cXl4ensPg4oZQTPD9nEyqC6iq
 LrOVmpaKQ/Pn+cllIiV7xCcyPMXRczXifWWx6+xe89sx4fofNLyILDFAa1p4L9xl/awOZc8gqFY
 5TopRqONu6z55yVHaoAlZyfolP1yqeRAj+7cOe6nllTU5DFfPNQtPe1kU9m4ZS+k3hdvK1iWCoB
 2YlGaVjp8miHCDfRh+O6Qy+Nw4yVHI+xMqkVzU5qOiPEjq2txcXdQ0YSdNUonDCzPW18lyCNlz/
 3NfxL8/ujfw7ZY5Z/hr6ceG8jlz4DpsLmNEvXvIrLwNYYN3ic0KYAebinvwSzku567pe/NLCjyo
 WP9ZwdTirPOg228kNJ3sea9cvQXhP1o/+dG562Y80C3RWHwF4DlfRaQ9wW8UEwvbG/zYjIiqp7T
 KH0zEQZ1FSCyM934R0eVRRMIQpJuNpgNXEGuCtEoBKhbuJXaLEIDj9L/gGZEQGwIwc/RGPohTuU
 qL3yRSeIhy9H2p3+xdZ6w4+Bcm4zgpely7abiMZa3RIMlgP/6MA8uyOU/WW0bb+phRBJe9chYAH
 jrNBqCtDqbrQvKmB0Q8nLLvQ63VkGD/1IyuHBxdb6Kt4O8Vz62Iet8RQVMJpbE9PJUDKzTW5chq
 KDOKGjkJQSccXgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: f4OaajM3IJ0gDs8f863UeQJzG7rhAGxF
X-Proofpoint-ORIG-GUID: f4OaajM3IJ0gDs8f863UeQJzG7rhAGxF
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce56da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7SpLljjrIQYGA4yF3eAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX1DjFNRNxkM29
 hkBLJiCLyBUNPg3orLTCVlNSYt8wANH4ixqQZOjE8Q2ES8tJYVi+Ro0kfhbIdB7pt1uTlg3+MYN
 FFdAxiQixLYhlZzmq9ep/J/BE/DvzMeQByixl9sQW6ldShM+wMZSZ9052mDeG+lnlj68GHoixIX
 ynshviUcqrkn7aN7awZ0aAG2LH6Gm+MdXUHjyqyrAJ2xF7JjTBBnXlKubh03usIpK3kw7o+uSoA
 Uh5P7FYA0Ig5NunHL84WuHmcHBAnPpc3FnVTur2fvEHK2FSLTul6LiQHCLsV8+g/Tl6tjEmVGF/
 Xbw95VrfzAocjTW2npEtvwzeFKrF3KkuHegJ/L/WqqR8a5xgjcPNiBBGbwZpjNlgPV2LbOfeHyX
 9qCvFGiDK6RT5PEkGiLPht81yQ2W8//Qnw1nv+ZYByBwqbCaoZMkLR2yEsZTus3/EClp+wh/yQ1
 7OikFmfsMUheDdOw4fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105

DisplayPort on Qualcomm SM8650 (and compatible SM8750) supports audio
and there is DTS already having cells and sound-name-prefix.  Add SM8650
to the list of SoCs referencing the dai-common.yaml schema to solve
dtbs_check warnings like:

  sm8650-hdk-display-card-rear-camera-card.dtb:
    displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e4f17d29343b..f8daaee8d065 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -210,6 +210,7 @@ allOf:
               enum:
                 - qcom,glymur-dp
                 - qcom,sa8775p-dp
+                - qcom,sm8650-dp
                 - qcom,x1e80100-dp
       then:
         $ref: /schemas/sound/dai-common.yaml#

-- 
2.51.0

