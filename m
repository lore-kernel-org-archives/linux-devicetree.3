Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C827E415F17
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141044; cv=none; b=nDQnlug9pPYmwbh3KljM9JUz+N3F9YsAiR8rP/okrXdpBdY3aLFnPTqsEAR6HsREkRcZzmagZ2vNhrNXuQmFCnPPb6SpeLljdNlEUzfWfD+TAkjPN5SjdfT4+nBPwStZsAbiwWehidOab98BXCbF9eZMMieUBEiPOBslGpnSFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141044; c=relaxed/simple;
	bh=0wud/Id7znQPDRq8SUlHw0MjHwM7ELZ7Tx5EFiPOzTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVY7Wo8iXI8LWWjKkK/lzAKqELqW1gNVm0jEV4/zag+nPR30D4qgky1a/MOfeGyxKI/dCTk6QdrxKMp1q/jtEclHptx3m8i+4gOb+ayKji6e5QbpTDYJr+7CFPyyzF4UYBSiYbbdVHxtn1mbRO0vLMUdOUv0dVQWlE7HQgjz4Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZibVUb4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEPs4myJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZibVUb4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEPs4myJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm8Yg1090832
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+NzFK+jhrEXQEV8A8yfqvHMoGUTclgm+A97KLRt7cM=; b=ZibVUb4hLzrmkptS
	yEVl8/W0rQMrssXkNynIdHAE4bkAZEQVm839IwZoYIOD07J01SKW8l44GERW7vIt
	ojVC5+6m9Qd9sA5qUzzaHjMEGtDpME8c8iX43+fMwqhJzMaPCXUpXbYoxduAU6ON
	OD16TN1B4t0hXdAwXNO/XtTP3ZdhLi6h3uP1DkPHKW/YrrApOo8gaHniBt2AMiRm
	5yN/X5qWf6zSn79/hk+9TcNGRghr5WjClVzZDm7BWHvVKgnlGjS6LYT1zt+ygnL0
	+K7POVwh4IiEJuNAMHW465IKJbuOFx6WVlzE2rquvJyn+c+iOcqZzb2tjNV8zAz2
	IvO1uw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3aju3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:22 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a17dafd042so1271312eaf.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141041; x=1789745841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+NzFK+jhrEXQEV8A8yfqvHMoGUTclgm+A97KLRt7cM=;
        b=AEPs4myJWIJThbCbJKevxahsqaWCHd65q6L2znVxRRwCNVbu4gKYNdi2m60zYfiigH
         gTA8d2QGAWZR20FixsU/Kr9Z3DTnGlvU593pka/o8fXHoOHRnOfNXVIHrrEEijiXZLc+
         YGwZLAlMycS5pxpQLIRz4vkUg5b5lf6ceSTuQrAM4U30akcM+03vRGule0Kg8ViaXeOY
         gPZD1hu9AIrlDTYC9gw/eyPhfYcLksg58evFdgyd8vvCVTLVu7Z1OHnDP3vnV57BGCbN
         tZIGWzvd8Cbo+A4azylLGclJp8vWEnRz3ftQUr53bhuYGTHcF88pPVje3nDCyekNo4B/
         x7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141041; x=1789745841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+NzFK+jhrEXQEV8A8yfqvHMoGUTclgm+A97KLRt7cM=;
        b=KOahuAgyzCVM7A0G5kKEVH1vsPb0ji3hGOJNqu6gLHjrQUR22pgwWmbDNS2O4ojILX
         RJa+KtoMNzevLSXB0yuvQtijAaciKxcU01a8Z92ygUpDX+VJajUElVt/yaWfci8z7gDf
         vUHPhCh64PXmi2JXmtsEVCHbAS3Z1scoDse/MZziQbUnotOsIPX6XtQCS71s/UwdvUNm
         SluwQqitXaOetB8d7Q/FCMUnojoQDonrdzSjgikwgq649f/Q0GHO6863KdPLJeLceO6U
         rKRpH8rRrGYuuoj/ofVTw/ScvrmI3R0kRMEEOkV+gJnGeKgUFtkZmzRuWXhmOk45lh8n
         VroA==
X-Forwarded-Encrypted: i=1; AKwUvBzn641KYvKOPECywuN9cUbbrQY+DfQj72lZQ/KBNYSECn2abuT0I/Xy814MpdQKj3H2CERKdJnweN5P@vger.kernel.org
X-Gm-Message-State: AFuF++mmiCtQ/+5n9OkXbL/RLvqBTtNOqmM+veZtLy1KV9zAqoUGXFaH
	Tlq5pwvvokoT14+lAF89XkU6lm3b9ljbKgk1XaOPWKcJkd3TH6z1GZfekEAPKLnafWeVovlXITw
	eSORmqGmr9PNp6drY9fF3bwVSXuKSM1lpM0/XzYUf5hdquTuRqY7ZNRs2Nw7N+IzW
X-Gm-Gg: AYBFou0dsoZt+TbE4QU+tdjoYGmMrWZzfY4siPro/QsYO37jll7MrNCgk057E/gyJJU
	PHLqaliC4++81OSvE5q+uhoITjSRcX49FMQbQ64D7mOtQ/Iga8liAsUCc8LOWdvxOLkDfWSaDdz
	2FVMnsJWZrRmnsTa7I0VZQqbQwTL4+CEhyrN4sLCU4odMjVdfi+62LGu0V1u25lQPgnZoDvlDpv
	vJ9LGFUkVa8pMRO6jl7yoed5Y9jwmRJo/VntTDwNh/ATHqQ+QfNirg70/t4yBkw0EjBOqd/KEVd
	Xiv001YgvSt8pXNLAnlOQciKUt88Hrrt4scx2+YtddKbYmSc4uYUUAdyvOldzys2J7vehLPS9/E
	dEPS8vKQhjR1BXt1j7o65e/6EnYA=
X-Received: by 2002:a05:6820:60b:b0:6b7:318d:85d with SMTP id 006d021491bc7-6c0bcdaf0a0mr5142155eaf.25.1789141041205;
        Fri, 11 Sep 2026 08:37:21 -0700 (PDT)
X-Received: by 2002:a05:6820:60b:b0:6b7:318d:85d with SMTP id 006d021491bc7-6c0bcdaf0a0mr5142085eaf.25.1789141040730;
        Fri, 11 Sep 2026 08:37:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:33 +0530
Subject: [PATCH 02/17] dt-bindings: display/msm: dp-controller: Document
 Nord DP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=867;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=gx2h1808ankOTjgTieRYw6/x4F3FIMSxugTAd8F756U=;
 b=dAb+YZjbbu9LpS4+5dUjqKfYUwH+FxUIFOY0Mq9r8rTaAJC2hRMCTEmggfaxBaVErFbObwkrx
 XzNXvVcThRZATbMI6pwrFEiMRG1Dd3bqlRSfRGDX82mo/JcoxGZ7I1a
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa42032 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lCWEfuFUYIIHy-HYLagA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: OEruQ8u_ncJx5yzMXygcq_at94-D_srY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXxMXLLLsDZ1Ij
 IOKJTp1+wzRywPTbBHlFS+G/wu4A2pwP4UL6N+YrFhh2U/8dT6o34hw1VrF7nZWsfJN2NTwKPlc
 wfIZX8P04yTw7cRNZlpfEUJmVYWxnl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX5x9J5ECKG+Ko
 ZPfzlfPaeLS5ThSs6w0DTDA4yCXCmXpB5H1ixUIC1okApa4XL6OsTiJ2YHwmyee8TA+TY4oWtmN
 1tMCpROsMYLAuWgWZTpjH72WAgqwuQ2beyV+j51xcGoYNk4ChFTg/46FXq+ox5r19aBNsobkHWb
 DdDrR8U9XtfThn4VDKWd27G5BgvXcUy1tL2Xn1OqzHrg/I8MHE2QgGTuBMTQgG6pAkuUqGNAB4J
 IrwgPRyRFffjwhyzmkQUrZOd5H9SIFauF/pKQZ+AEHU9dJ1M1jWi99FTeNwRggoJlCwxTRADpNt
 P241q9w/rNCa0solGWioqpHXqs9nzq6fvRvT/bh0xV+VZyJUgohhElIVp0nPYjjeYewhLcg9dWX
 DJbEzZVUdUsIxceb3CcwsTLtZQC7aj12NLiwp7HIuJkufMujhk2I5P9OuLpqdpqe19n9x8/Dnk1
 3lx+GMV5nNKe61mHXNA==
X-Proofpoint-ORIG-GUID: OEruQ8u_ncJx5yzMXygcq_at94-D_srY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the compatible for the DisplayPort controller found on the
Qualcomm Nord SoC.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..8d980acb1a16 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,nord-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp

-- 
2.34.1

