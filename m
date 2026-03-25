Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ECF3D5663
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441026; cv=none; b=kJpeyHuGBkD8zzKU+LdnS4GHUDRZ5Bv0Gy7SiA7uyuFnrlwGn17YXps/pP/z39CV7i1O5O1H2YlhxGVKe5Bw9xfKba+xNG+KAegP3azIO4G4LCPd7OxODUTQu1M4kizJa+aNj1t0q0hUFwoQ7ky+6TSXaRkCmkrxngqWhJmR56A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441026; c=relaxed/simple;
	bh=T8zgB8+aRfT+5AeJiTxBNx19VfBz7bFS9oT00XLMGD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdwUkIHRlbfp69IER8+F9ZfYYby1PWKqUAmp8SrC/6g5KqPLpYs8Qwbq1ceeo5vKihI//cQVfO6b87nOcuipzGAioa8QZ6UQUhJbbjFxdKoN9RCl0Aaz1C2Yxn3wnFVMSiGO0Lr32+2sUZTLOGBv39ZMTjcHPcEhK2tqfU63tcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPDNDY2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFpUM4qY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPDNDY2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFpUM4qY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG7jQ2993747
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/EytBvPv5krLcE3pGnumr6rWcvd414N87RjUetZm0M=; b=XPDNDY2dWpDUBfOO
	CTJZ443m4DJBldJ9cqSdcPppx2b/MYe1HBYfNb5fZQDkX7vuqxcdr0zkc90U64ZB
	kYjh85kHdEE3QCGPj2bUT+ZdSXcwhSkDZz41MqDNOccTg79nm0muMGnsYTyfLIYc
	nyzOUtv8AqpwVC7g2j/sqF1mNKNT9D1Z/+vDz4yA4LeSRFc92dxXOV5x/pb7nxrV
	rBf8ox+jpN+lgA1ggUfk8YxfeayX8O8uKcCmczvqp44jZJamghOC/i1VkVv3QzJu
	PiUbWm5Y1kPNhWgyxGoZ6DRpJxNcH0kQjj90Z+WFpnkQ3yiOc7Hk8F4CLFW8jCp4
	8EJNYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4gc3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso24383571cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441023; x=1775045823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/EytBvPv5krLcE3pGnumr6rWcvd414N87RjUetZm0M=;
        b=YFpUM4qYldqTpiXgfER7ZApBIJ75VqryurtDcyUeEZtmenzhV2jvu8wvM4OH1tSeVh
         1r8BxOpXFrNdhsyT2AVwxLM10ijAiRA6NpJKJkqFSRNscgA1DH9jIB0hb+ADzD1Bdu69
         Zh2+uw+lMHAjn6cORHXfxBIOeCp+4XpWs/QpssbfiI0fkTsSnHCIXATZRfhHZ68L0tFH
         V3VfL6weTpEkU6HZRyo0WHoWQ+RUvtJPxhOg7nv3FO5VAh7S4vrMYypZX/uXEZ4sHAzZ
         UXHQaNC3FZsDRTJlnfkxVUUYbVZMwO959XzkJIqa3zeOAuQ4UhGFaXG0rVvX/Tic0r8A
         9fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441023; x=1775045823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/EytBvPv5krLcE3pGnumr6rWcvd414N87RjUetZm0M=;
        b=Dvl2hwFifiHzaB4ZmMJuhs7+ASUbcyZ9XtBxGzmmU9xUwY6y9OFQMFclMh4o9LX9m4
         Jj0VPngaze/a2XDrUor/AXtUURl6SmDGpZqPQgq2Ttbxuw6MMGJqlzYPJpBXuRL/gIUC
         +bmSBtZkzvL+zj9prGRzMNCu4WwM323d8sCxQnB9lfQzem6cH+10nZwkBnSCtoIG8GXH
         eZyAdlVYzH5msSrdxe+EU5yHsnzUgUHg08j9+Lo18Dx6OmCjz1NKoiM/B+3w39XT8eqM
         ngVYmjuLSlwkteCeYKODG+FK8Rn2MBIbHUTAFI4JJsicqHFEzqeC3qQTL6dOB6SK1tXa
         SLLg==
X-Forwarded-Encrypted: i=1; AJvYcCWmzUdnAFOoVXCed5aiHj0H+q6Y/RwhXf848NxfdagQ5SrcuKoci9/Zeafirai+g2gunDOul8w88GNA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rZwrvyRxkS2qK9z46ZU/2dCoBy17X0Fx4vY6PYGJhQWRg8sO
	PTx4aFOuw7vPv/0fF3aeD66cEfE0VrIA/LMAHwJ69co8P7rDvyDKVpcKE0oPAXiJdtwYgG/0D9b
	51JPHddF4pQV3Cr0Eoov2AgoBs2dcuVYvNBkCgiZ2XZoXJiB4Tsmw9h/89avtc3Jl
X-Gm-Gg: ATEYQzwlz/M5mqCN+Zzr2D39GhDPVYFDxXMCaCDeewVga8pd9/hL1e6s/SUhpoOWu6a
	6WAVVIGBO/hzOuZYzaWNjxJYQVgQndLhYzTOGrkzz1jynwWEymmgcppHsfZIJzwuzH3xgg3gVlw
	uiBNV/Il03b+e5iObQxpQSV3iZtvzC0Jn93IlTEquJ4igHTgIZcV4lMtw/J7fiYw/GMEwFtWBtO
	eephknH36xn0SSN/30uNAkYe6fEmlLWJ2lhRsH5qi/Gb3Ph97TndfJqwlkZTybAX3UQx8lMW09W
	GPymw/Iyd0LNF/VL2B8XyMMNiJ+UIiUL5M5X2LsrcwLqfyZaDN77Ir2xMEEySfk8m4SGsSosQcf
	XD5hp0YDT3cMAZaXPmKfH4BEhrDAjpvUO4iprpFYH6o5j
X-Received: by 2002:a05:622a:1899:b0:50b:3e4d:7feb with SMTP id d75a77b69052e-50b80e8e3ccmr44316831cf.53.1774441023366;
        Wed, 25 Mar 2026 05:17:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1899:b0:50b:3e4d:7feb with SMTP id d75a77b69052e-50b80e8e3ccmr44315921cf.53.1774441022655;
        Wed, 25 Mar 2026 05:17:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:43 +0100
Subject: [PATCH v3 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-2-dc2b2f0c74a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T8zgB8+aRfT+5AeJiTxBNx19VfBz7bFS9oT00XLMGD8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9IwWzQn35Ru2xnyoNqStmOhgmM+uhRnVQTkA
 3UTeAn5Ox+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSMAAKCRDBN2bmhouD
 156ND/4tKyi0MMARxBprR3Uf6toY6PWWBWH6Sj2kk3iFW89xaIZt8YdR9c4Ko3gq3QyT1FiLEqA
 LKLOC0a91JCp05gplmeRCcTFDbpwFA2qAZJCgke37C+LRT9EK0meJtYyPJT9wmcEs6I71/mgY8z
 dYB11FB4W7H3GKCpjeoecYVqMOI8n4zD+Fl8a+JKPQNi85ZfuAlBU0GZsH97TGorRoLpd3y3PX8
 YxajvWUWL32WBDr3pgBoB+bf2OpCgNABajMhssAmYErh9JNQ+gNxxMw5cdfavXqGfFyHuidBnrz
 67tk45g4bh+hzP5XYwLLEqmzuXiQA6WbCAZsDBzLTxQYp9r9qUdrdElbcxK43QQ4HBPEXbJYr2d
 +6WHX78xHGWQK2tGoi4Ws+7RYMoZ4K9aidAKRquZ7zohLGqJmuAfafk9dUMh1ERutMJdAM8pkGD
 taBq4lfsdjxrhbNa8KrJ1iFnle9AitNLcjUeTxW5pR8+zX6VgTCvuto0C1RvSVTKXS16NF6R2oa
 O9tL2+yOWgJr3BDxD/jmUSCYySW7LE8IGDKHEb5lMu5sEgacMQJgGea+eX8MZ+NwE8gk8qOGQuZ
 9Qr8f3aE/A87CK/n8SHy+CpFvgBo6iGgJQNpGzI6tSFpJCelItUZGcuuP9dymWfjMJTcvqIULWD
 s5kQkZz+d7zK/Iw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfXxNXC/x/jux3W
 wgeNX/NyIJRkTi2ROfReZI0r/SlL8/B+f7dDpjSKv3MyT1+r45F1ZJ6w6V5JKUuuvouIvrEsjJL
 +qs97Mp7/P4k7CWcrgIONfIn/QiDpHXlDchHGWQFzLszYH/uPqX7kPu6eHTrh0qMqF6dnNW5aZa
 XTuAh/Vbc5oM3Zs6ngqC7xxt7u4DY9wdnKxiKaNuTyYe6Jn59MDGgMaZcd3SrCA9T/zuVsOLmJt
 7RimU1vnM7odnh1otFt3OWiGzR0zf8YfC9CDUJh4quz21z0FYGQ0TQi6cI8sk5BaBmeQrsm3jMb
 y4bdrzmEH4APwTp6iRo8aKZ+toe4Zk3q2zG+R25sJ4M00nGLMoAs8tq5Tw/UKEIuWnUqGaAkVLf
 IdZaUMzjfKx/sXWYT+BEsYnh/RzPs9F6kLYvSXXAcNN1mxDzFkdoZJBYUBcS8IVbiyNlKcs3ESH
 ciTP3fq6oGLXb5cyZXA==
X-Proofpoint-ORIG-GUID: vTlptm6Octh_4tT740lryB0l22VYMit_
X-Proofpoint-GUID: vTlptm6Octh_4tT740lryB0l22VYMit_
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3d240 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ghL60u8iUD4uIiEFN3gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087

Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
compatible with SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4abf43..3ce8a9ff4555 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -29,6 +29,10 @@ properties:
               - qcom,sm8550-dsi-phy-4nm
               - qcom,sm8650-dsi-phy-4nm
               - qcom,sm8750-dsi-phy-3nm
+      - items:
+          - enum:
+              - qcom,eliza-dsi-phy-4nm
+          - const: qcom,sm8650-dsi-phy-4nm
       - items:
           - enum:
               - qcom,qcs8300-dsi-phy-5nm

-- 
2.51.0

