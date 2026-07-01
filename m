Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1A376BD9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924683; cv=none; b=aUbNYyGb70ymb4ZfUeAqOSwcbhACzXh29V7e9vMENBVlULTj2uXgAUSqYaoxtbtQ4KGVd2ybUjrHUr9JOa4q+zBRFpHYsz6sVtr3bblKZoFlIXuUVEiUxg393Z8zVU8ntaXCvgPDojEimJQRc2Kqcim9xzVTADFNZmbh1hMAWms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924683; c=relaxed/simple;
	bh=uZZBnjFQ8QcklmPaJuZ4cWwHip4Nj2PHpZ8YA4Jv8jM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cMmv2hROpq+2uqzRtBDWzBacxbyUrXVnZbTfwOdkHg4KSANo1kr1Ln206TbyZNkqAtkd5SQXgjqnk7zv0eebiH3jqNv21MOgySLTlHicVNCiHnP/3DglkQdBZwiiMGvgKHsQD2dtO+zmxgKJXKO1iGxNG1SBn2u8S3tpCHL4fCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5qAUNiO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SANYqes8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5qAUNiO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SANYqes8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gmo5j1713023
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xiz5ohHlOSI
	vlO2N/i3IWz8Du228mi1b7RksHuMyzMA=; b=U5qAUNiOMBEzRWP+r2QUfT/pB1B
	NP597bUwZ5AkSjgKoh+3ntuBqUIKAl4VmLJcSlO7Dqtqr+7M5Tul4gmsWzvb4Ay0
	ekwtImmyLNuvV00piF4drsLKQTGl2nu/SlygSADOcyFw22dxvZRCZiyk2nGAVIn5
	kSiYLw99l+oFeVND4lPzHSKaY9w2W5T6ab8ILefDUAUPeI5V3EQxF9ZDmZqTqojb
	IRKWHIsW9UfkR3KAQZPGlULtxJrB6Rfqs0/h4HFNo3IBW6rT1JjufGU2JZLi9ouo
	84XFdjQi6vOL5yjlbLeqaQgYY8Uh+kJwCKXKqnpXTNkYBdIsqJJTIiyItNA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd1pwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:51:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so592585a12.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924680; x=1783529480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiz5ohHlOSIvlO2N/i3IWz8Du228mi1b7RksHuMyzMA=;
        b=SANYqes8BH3KClpyqtGmNrqX2Q+T3cgdjOfJXr+aYRmDepZBSseSlAZL+LXd3H0DpL
         orzAsGZgyZMRKUX0J64YthsIrZ51h7p5dbDVJKIx8Plp/g9eXNhJA7u0pYRejlfbK8hX
         brod+lo1gQRqd35yY4hY9HSuA/9Y9P1glP39UgXg14sIUNGfkNmgaRWLcM5LM8j7azLh
         +zJQUrppC0Lh9Brn8JvSqOPpSwoDkDf5K5vI1/0DI6BFKa+ASgqI6Iq3CeeBdottdgQT
         fle/gdiU6jntDqbFNWtmQLRW4jI7y32lTk6391/TlkS7XYjPoMp8NF3jK0ZTyICUd40L
         iuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924680; x=1783529480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiz5ohHlOSIvlO2N/i3IWz8Du228mi1b7RksHuMyzMA=;
        b=Af6T39cxqrPWaXyzmejx4do9FzTIO+b9wd1NU4e6qIYazE7KMacIXiCzYqO4Uhihyy
         avqrtyvmSNb+rvCgpvYF1fAUHWeHObtMiutlyH0KTWFABiBwMTtur9G4kRcLlSlGW70M
         Cc8+YOod5GdExGTY+TM73+cRcGYMXj28UiCuTIZnR94H++RZcXgllEMwZk5LsThugX9F
         9QLJsIhlbCKfweZpKo/cF+npVzdWRf/K0JCLdBwzzEnVdQ4ZdhnIABVSM5c5WPouPHH1
         G2GL9FqjzSZGb4nBpIuTQf1y+x2Lc0UDQknlwk8aKuL7BB3PlL7tYGRio0kWqTow6Uca
         ZREQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqvf6cLK5wXSVpJQWmOMStZDOgbblnFCNS5NZVAFbVr0LWS2XvCTh8fekd9g9TDcQ/Uv3arJKCik0o5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7lGjDEOnHVPp2RBtUJwr71N+u/j+9+y98drdX+Am6hekAAvYl
	e3UddYO4bOYm+pOYxNCMuZJRwROH2N9PAGkGA7HMGwqtsbHS5UYGoBGJA4M6evTAg9eQs5Ww+u6
	VjQ8OWoqhAk0mDjs5SSVc7fZGVKGLP1xYww/OdACcOGD2sdasOh6BEygQZbQBP1tv
X-Gm-Gg: AfdE7cn0brXbUQ0D51MwKS+ELWlqnYdm5YhhAwTC1FGIMN2mfIJhd1Wb2rmx65TLA4h
	uS5qp1ZlNzfbBPLeIs6hdu4x1tRzE5uGlZZT4UTNlLZGqqNCkfe1jK7IQmaaAmkt9fNtl4qrVtK
	tFmOhYNUkqQstLg23bRD3tJnB9MKCOH7o/nIrq4kRaBkYFlKQQrO2smY2lJPaTA/X1sAzYlT9Ke
	+ltLoxSUH0uYn+gs6ikPhePlw+XB2ekyJnN23qamUl9SXg97C7o+d/yU5/ABUugn/wkaX6AencR
	BlpYozJeA++4o5xe8PkebfdRn8Duyh2/h/ju8j81GJOSH3NHj4is93LxP3I3xCwox2kx0GYeXNG
	IbqzQZfUubsYCBezsSREzcV4OdQPi/ecRAwjhwIAcuJZHv/RwiUmu6cRFPHHNuB6Bi9UmLfeWnY
	1qWOgu
X-Received: by 2002:a05:6a21:4c08:b0:3bf:6e72:68f9 with SMTP id adf61e73a8af0-3bfed3e923amr2445225637.38.1782924680212;
        Wed, 01 Jul 2026 09:51:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c08:b0:3bf:6e72:68f9 with SMTP id adf61e73a8af0-3bfed3e923amr2445193637.38.1782924679776;
        Wed, 01 Jul 2026 09:51:19 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:19 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
Date: Wed,  1 Jul 2026 22:20:49 +0530
Message-Id: <20260701165051.4122259-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a454589 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ufZ60yBX7R2ALNXMlhoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: f44k2eK8_3s7W0_uUe9vv3CbEaZsulDk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX6sW43ot04dSD
 Ag8qDcwNgEl5fwwaW0msQ3pa7RMJR8qc5WZ9mL8gKtWb0UVxuI/IdpjpnZuwjEPBaM6bBlIaTsN
 +phgVix6wY+YhxbcuP5FR1YaqACxgRk=
X-Proofpoint-GUID: f44k2eK8_3s7W0_uUe9vv3CbEaZsulDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX7t/9KXhUdL5b
 Bntc3nsz5h3FBfvp4XRvpJIS/AtDFOnNVw5RqEmeRJfR74ZQLhEb4u5YQF5UawWyF3ef4smRG9J
 zwaxUgyY79pEIlU9izbGeXMq94Omq+oaTc1PeybSrP/8WN2wPy/NHa1IFP+WL8vUoMOWAGQHEUD
 nHIkp1miqjl89OU+bPxPfe7HquJ/lEeKurxSi8Ai9+oAo99wqX/eT1S0sWc0DYAoJG9VfYRyCQl
 Q1u+hS5Bw8yjwL83ovZ0O+lsnqo1yiNrjSA6nW1sBo65daJgpd5hTKj0VCwH3FzX/rb3ar4TjHz
 53QMHZogZT0VvyjyylvTaWjPwdUkeZAuNstF6zUqssqXY9oLfWpfDWIO+ntCBQQBF826kI1O0TL
 weKprr17hEEWQNb/57ZLGML7CQdR3s0YSkISRVzgr4GqrcnBD/vdsULAyZtbW6oTjaTgWEPpnzz
 3vaTlkppwos4Lf/0DxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178

Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
3 resets to be programmed before initialising the phy. As per the hardware
documentation, the third reset is PHY_PRIM_SP0_BCR, hence naming it "phy".

Also, add remote endpoints and orientation switch support for getting
Type-C orientation information.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../phy/qcom,qcs615-qmp-usb3dp-phy.yaml       | 54 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
index efb465c71c1b..ae3f0dda3bca 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs615-qmp-usb3-dp-phy
+      - qcom,shikra-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -33,12 +34,15 @@ properties:
       - const: pipe
 
   resets:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reset-names:
+    minItems: 2
     items:
       - const: phy_phy
       - const: dp_phy
+      - const: phy
 
   vdda-phy-supply: true
 
@@ -63,6 +67,22 @@ properties:
           - description: offset of the PHY mode register
     description: Clamp and PHY mode register present in the TCSR
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the PHY
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
 required:
   - compatible
   - reg
@@ -78,6 +98,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          maxItems: 3
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: dp_phy
+            - const: phy
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: dp_phy
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,qcs615-gcc.h>
-- 
2.34.1

