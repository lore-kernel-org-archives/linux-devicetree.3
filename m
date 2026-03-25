Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51623D6CD3
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441029; cv=none; b=XNaboXo7ilszNXppSyqZky+X12KUdp9VgUBJMkQR9TD+z3fUq3nZ4S0rMRsDNNtbXeNNNvE8DliZL/bMHH/8rrSpxZqvwck75Bz5+IAD/4oZnHEu0sa++j08b2PfiB/WbCL0v34q7aUMLZM+yI8ZImjIy4ZPXyn7xpd7mQWTsGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441029; c=relaxed/simple;
	bh=d/okUxTNaM/IDldvLB6GVpWxMWbJO4kMfCR0JuadaFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmZA3VbvaT3YeKEeDIvQIF3vvUQofI/F0DBcRnp7qtefRIxUb6gPEBp8fFZ0D0vFCDQTknNGsL4gHusuFz6MNtX/z+uExRny3l8hezCIUHVT7YLVMr/rHswAeBbMJEbEzfmFVLEWVPZsCv0vwDCeNQpTYnX4z4vuHl+e4XBNGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hedlNCHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDjufTO6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hedlNCHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDjufTO6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGHQD241589
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMrpbBdlyE2XeeyO82dhVGX9eOY8ec9Iakf8KN3jnbs=; b=hedlNCHLeleO004B
	57n31liYydxdUIRHXh5sRG3u/qpGzpVpaTohO/c74r1U7WcMO2YVC+EFBa88YjjS
	LX2vg2cx0if6TzJGkD09nXh+xDn7vLzhQ+6iTyoeC4aMQ9cgHDFNbYteRMkA+fo+
	OCAEmymvzBA19FHZTzj+SwPf9H6T7d6YES4B9K7Wvo7byhGIDJaM71Tigm5kK/Lz
	1f9OLMsnMYaSioRz3ByCHmDk7O1B4BwaY8tM/aU5cDhKmx8lq1TXYFpudISRRbjR
	8PZcnpXGfvuZRDXx2Q2nDXYsjtC7aPeLeRzj2LQnCuQy98p8vaGuirzoyThm2/+p
	ZuuCmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp0n9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so38204261cf.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441026; x=1775045826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMrpbBdlyE2XeeyO82dhVGX9eOY8ec9Iakf8KN3jnbs=;
        b=dDjufTO6PvrO5YuAet4KQPIOoQl5LgmQb/UTk1eZr+x0NlCsNTEi7o/2YSo/igE+hW
         NXe9VuBmiAdI6OPGrooim6Wzgx2tW02WMBNWPBJF7lm7SgW8r/bK3mVtPNalILn0VmM3
         Qlns8QjMKXOIobmnJQkMaoUi/EW26jeloUhULVDfPz5no2wzxrvHBhTYJtETINoQvGOq
         sEbWUQEJzXv5Ee21SwNPZioG66FwFq2bZ9+kIk/L1CBJidEsDz2Lppmj2z85VTNxOoG4
         GSG6WKUjhC4ZAlHOKDgLBklhzG41lBYg4kvdCXncQVu/4Q4C0ZuA/vFWqbJSUVAImezC
         +/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441026; x=1775045826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMrpbBdlyE2XeeyO82dhVGX9eOY8ec9Iakf8KN3jnbs=;
        b=LMwiOPU4bKRO1yxJOq+cpoStmTuFeqdaGGydwKbNCaNwkUXCPMkZKTmxNMOgT1fend
         h5N092X8dOc6adv0um4Z8xKBCYFYHN0lSV6SdIMEVYUaNHvWEDPOKTtQzL1LFW7cSdx9
         04fZfdO6y5DcsS/i3GaB++Y1YLDVpXXrDOTjovaoUl6QiEw9zo8f1kiKJmtzo83zNISV
         kYrXsXi6cfethtFXyGFEdj/ZGPqG6R40EkNUSl1lwNZ/zyUf4p2jv884lnsLe5mps47p
         nuBYFn0A+zeMvjbkriMLc3UEx5UMDpc/HLcb6mmTLhBTGbdEKQPJ4ZLKqkNPGXqrLfma
         TgDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrKI676RduASJv2A3mHjfIzOTcxGXmDdLCe5R/0GrxdD4jlwbx8SLWk9qoeDyNVRr0RdeuUdv/JY5c@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2UBjlJtJ5g37IkYZ++mzKmSQ6VkkbAK2imekQ+x69shiLjLqw
	XSGG97rEhR2kLKdwM4g/y/xFGqtE0QCi+28pq/bdMWztH4l4mXThxe6TYlT/36b1uz/IJVbCI5N
	zLmexKR2WrHwEFymheTqDlsFQSxsoMcLbxz1B5KAebgsChLaD3ocOWK3jxBhdTidr
X-Gm-Gg: ATEYQzxqnz7NdnUtHFTxMkGSYmOEiMkstqChQ1y6d1/+Qnug9/AImLfmYn+og4s+w3h
	adK/Ipdwl+RJ1w/Od+7slnpVMOJzCvAP3WWARgoF+Lcrt9Uc1C/RZNo93MwD/iyxYVz/k1JWSiE
	EHzbv3SgCXpa5+nN6JyyQasPUlco7xyimHJkt7Ff6j/epHybkE32H44FoGifzFOCqU5Qd5ZsDc1
	tnQzzjiClonyJ8pqDXKVtIz7bsxN293NbGq5OpgZV07q26d4Cg6xWrljq3t2Ug6W6Sy3p+eJ0eA
	R2Je0KJOV5y36mJ2jWc4EAEGgIcHwfb7WkGSk+h26oxXLpZ0suLISb5vWafsIUTO9Ru0v6v01Hy
	mdVMv7/l92utfpf4wbFPiFGSHLXmY1Mxm1T38GofLkBnn
X-Received: by 2002:a05:622a:d17:b0:50b:8c01:210b with SMTP id d75a77b69052e-50b8c01272dmr10153621cf.31.1774441025982;
        Wed, 25 Mar 2026 05:17:05 -0700 (PDT)
X-Received: by 2002:a05:622a:d17:b0:50b:8c01:210b with SMTP id d75a77b69052e-50b8c01272dmr10153151cf.31.1774441025421;
        Wed, 25 Mar 2026 05:17:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:44 +0100
Subject: [PATCH v3 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-3-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
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
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d/okUxTNaM/IDldvLB6GVpWxMWbJO4kMfCR0JuadaFY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9Ix+0ehZQmyCFCLUtJAq1ccOum22GeVUzY6n
 I08Yx9lOcOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSMQAKCRDBN2bmhouD
 1/X6D/0ZPLgw6eKyTv3UdmXt03oTKH5HsS+wvm/rjriwlGD3UUHcL1MOC73u3hlooVXO5zUHeN+
 ex0o1ZZL5EYr8U88fzSPbIHAwSRVEgadOTqIf75FLND9UFeVNAuYsQFHut34CuY+Mj9PRdNyOsi
 NBzrB+JohE94HVIoEFC3WT4zkOXq/GA1rVQLSyyVQx+QeKNltLCe1yDdhbfqnJwdoA6Xe4bdeJj
 ZVvkhrpieuQGD1TzbMtmxwtgD8NaSEeTwkPJep9+seWsZKK5L559ilY0vkYedg2JG/cK+84D7Pd
 IL2rC5YxQtEB5Y0nhfEGFbzLkDfngkSY4lSWawht5P9aUdwofwwkfAJ78gn1og+QZyp/tqWUriU
 bMIT/7gROiau9Dv8t/+fbKoWuwL7BUb6aUNznOWP/nqH/FX0zUNDxYbphTCHWJFskj5hxXuvy56
 12hKTo6dnFvLSD0jECQsxX3tsR8Owm5Qfo1u5VNJVeJOQWfCpwBea2C4ldyPA3zT7Zvu7vMLg8f
 S5QYysi3PZzRPG8TDed0wGirnQLXrim2JLr/D8xIuhepSFfdaaO7Wlo43qvYL8smBuCCvAPUfQt
 URPMDaTYXxbaL9N68yZXlAr6AKTo7MpWhuQiUnTKQOzM46JRHcEMYqxOaPh4nxeYpP5+KkzszdW
 /2dhLjkWVCF+2lA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: W2XTIRTYOr3E773djjnrVBYQvqhT16XP
X-Proofpoint-GUID: W2XTIRTYOr3E773djjnrVBYQvqhT16XP
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c3d242 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=o3bpWG-eKcXMc0DUatEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfXx3S4mceHBSGQ
 r3Ra+S2MMahNivm0IUwGumg0otLjSbz0JDKfkIpY6jmhu2OWhuHcdsGh/SnQ+AMRI/SSdsn/Uad
 QRc/zMqfbX3TtzAzhJYlTVoalvuNVsRV0Pk55hQ7a4lMGhfRVwsbA2haOKu4M4r0JYPxxG3MPoe
 TCmbKlhC5Cvf8W35DmFLvAYQtT12mmzjSTn53mED+N/HuYWhzsc6cCY9mWaPvllMQC+f2kDHfhM
 u12HJYvrfnQYSdqEjzcf8sPkpCOP+Tr6MRoDE3w6rEmlNNFRk6DtzsmBx1MRCbkNzbRvELIhoNM
 mCz8T4n9/i5pDDoks31aD1pMCKbBhZlNNVL/XusFBOZfAFJjbQSkUmNafHd+rLwR6TO68eLFubn
 s2Hr4OYI/owCd8QRU3D+jJUcsWKswVEaSBttX6mjOsHaKSuP+WQ+QOG5gl3h8xN9cdC8w+f42p7
 AJtLdNcY8tQdLEgXU9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087

Add DSI controller Qualcomm Eliza SoC using exactly the same block as
SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dabb08..49b8b6db45f1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -51,6 +51,10 @@ properties:
               - qcom,qcs8300-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,eliza-dsi-ctrl
+          - const: qcom,sm8750-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible

-- 
2.51.0

