Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC10B3E5591
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779226; cv=none; b=Bpt4onbDxfUUeFakczE8hhJIbuOA0v/HXFp2+rLlzEHAWpomgwUF+eu+3uwK8AGdPrT9NiaziH35eyy4TylkgaFHhYHFtw55zEBo/L8/tX7o+xdU1kb4NAU87EdtCNvn5J42Zw5Q2x6Ib7XULX/24KxMBtK79um55Z7WFuyPuRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779226; c=relaxed/simple;
	bh=bUy2LNyPtggJTXgZrJZnbOEw5uKNlX/uSieHncJQdUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RU91kPxPAXypJqvTRvxTwM1SjbKZe4SQs5L3fwG2GJSweQRPRy7MPNcypD01CbwulTRWflGU3V5nOA+mij2iJHGf9namiBd5isBlD4dHbdGoQ2KUVnJO0vIfRjZaRgxNI6NIX1oxzimW0vxWD+AocItI4Lu2zYL0Qzg6F4kUP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJ+4DRF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfWh+ODv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJ+4DRF7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfWh+ODv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DrRf2246930
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=; b=HJ+4DRF7091BVOy8
	iFNicLNQGvhI5d0d+lUyPnPE690o3NV0f10k63z7xtWYMmInnVKnNoBNxs8fXMVN
	7PsyO/ONSRXbF8TMYQdLmhkjeH+OXUzXfWGL2h38nbOudWGIIUScW84Sk07Xc27Q
	j1sRMMbXcmzl6StTd+vPEl2jwCgSw2gmdv8pUwv91MwXdZt/7Xt0HOohQwaLsDOz
	cWxDKs+TSv3sBNQGwZPXJOoHD3kHxBrFPlVex7RkpkjJEm2HLvdoMfOHGq8OU6bp
	uTbaMLJqNwOWlC9wPswIGSsfsNeKeDgzLNZgOfGREv/MKxKcJcQgEdqd+b0/gORP
	EAJTmg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vmgev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842b0dd8107so529492b3a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779223; x=1782384023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=;
        b=CfWh+ODvRImfiTDkkXl52IujBww2t9qkX24kzyes7xIBdsnYyCb4b7TCEqxu04dQJB
         bHomdJxKvCxNW6M/Ai6nkQpGMperL3QBYUUPv786uRElUDcgzK9nLKeGQNgi+T0Dck+U
         T+4LMvLBY6CtsYfBbNfAaoq2o+zTlHQH1H8RWmpE8Dqq9p/h0q57Viayod67C7mIdQos
         nWySaCmkQNYjwc8zVhW55GUwsxY+2UkYrRO2vZxnWy9L3SVAEArTpOYj0cP0Qoo3x3m6
         2odfmbXGfdltnS0OIivDJi/GUjrYKe/W6gfmii7HKKJQnxPHXlOMl2BrVyFrMwOpF3Hz
         33hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779223; x=1782384023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=;
        b=R+IIceIdEnpZjEvuSvHyLz7D6VEnFUu0CSLL4hKl1043Hwo8eZIU+EdfeEW9awpAvQ
         8ZzFKh9ORsnQrwy92Si5INIpvO5CVNnlVvprX2AZaoBGVPz7k0dlPg2pwruiFrGDK/7G
         CefloohppaIzLSd5cPBaaH60FBHD5atFWoJePzrmPuQ8HlbnmNDSdzdwimFPx19vrbAh
         Y0BHvMlQB1Cx2wt2n0YHFV0kFjLOypTWl0jXKQhDP+9uGbsRfPo3qUYbvnZRTIs8kGS0
         FbQJZOtyLxoKsLRAN1XB/Z1NvmDsfFbbBbEuPLEoSLGzzXmMHKpCaSCCbX0uAL47Yr0r
         TAdA==
X-Forwarded-Encrypted: i=1; AFNElJ+nL4/sWevstQpC272D+ae8anZ4fywr7H5ISS6MdmUjSzJdB7EmxU0LdPVRE1ts84FFZ4Pi7dpkCU5h@vger.kernel.org
X-Gm-Message-State: AOJu0YyiOrrVY6+uqdFjx5KpbmTbjFOhSQpJIQJzZ+lr50izalxU0Z1s
	AT2xRpUK048/edGqduEYJGtgQZk4C4VrPb6T1a6vG41eSuZgJORlQsutJDPACXxiFMsAdSgRCJ6
	+etbZBAUTtOEJYCxwEwr/WDk1BV6fsNk+GkQT01a+dvJowIgyvJSmtsQZjbtn6rbR
X-Gm-Gg: AfdE7ck+WHI/I+0a1A+wQhVFUqvP8+rwHMRFamYWpuOcapSklNMMGiz1XUI60NVlWOc
	K50hg9t8zoLygqn6AKQ2WI7YOJNIc1mj/eGkYxvDldhjc27eSpeLrYCkLcmTTfNEARfsPcp52FT
	91wB0xTeClWp70ZrnBE23kt8PlnNHmTi/gsYFWVKDxCKuj/K6sJps/9s/FDaY7vbOjTEdsw0kWN
	V4765CFJC4r7JSAovq76ylhJJZoVhzOQZJcELCkaHvovaQlHorxhP/9juf20ufB2rBSB8TtGKzK
	26UkzR6+LuXLKxRnh8Nd1HBGm9tox1NVCeS8VEYo82LfFifbiNYAqEPNvVJ7TljkIzK1agilLpg
	slWNEKnxTKJ7xuYMNVcDzDvj9svw5hdbOg2JI0aygIVPqkA==
X-Received: by 2002:a05:6a00:2d2a:b0:842:4bb9:5fe8 with SMTP id d2e1a72fcca58-84524446057mr8571635b3a.3.1781779223531;
        Thu, 18 Jun 2026 03:40:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d2a:b0:842:4bb9:5fe8 with SMTP id d2e1a72fcca58-84524446057mr8571591b3a.3.1781779223049;
        Thu, 18 Jun 2026 03:40:23 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm17254731b3a.45.2026.06.18.03.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:40:22 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:09:54 +0530
Subject: [PATCH v3 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260618-shikra_vpu-v3-1-1a32e26a35a1@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779212; l=2455;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bUy2LNyPtggJTXgZrJZnbOEw5uKNlX/uSieHncJQdUo=;
 b=sv6Ieb0XJWOnYjVnw4sWdEXQ9lBfXwufQpPcGGqHphiE9eRQfz2p8FHcUwCWaMOHM447JzkxH
 +JXJJVlYNE3AdHbBl+oglwugDOyXqx0Y0JWvz/wOZtNZESi+G0QnTW8
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: _Xnp05KjRArF9FiE2I7rcyQKJrP9gB4H
X-Proofpoint-GUID: _Xnp05KjRArF9FiE2I7rcyQKJrP9gB4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX7ExyOLZrmG3w
 7UhnuZ9Jf+PD4Ki308wJmjngdsXAAYJNQyH+y7e8P2hXyZbSdruisxz8/d/8oXKKgOod+eUNJTU
 xWshG0r+Lk3krEHxLIsIChvs/Qbkqgv3lvNp7/sab8XMSj4i/I/ezQ7h3C0ABNSkfv89VOL/Yy5
 0lbTwnpU8q8yJnBwAnEzE6By3LjLzXX4eZnKOMlXwUR0LzzGU9DFMN5sA+ctLbbDnyNQZbeIeRH
 FfkSRDhRNeRa7HXcu30Jc4yOuHkHsveJRpWEQ1taiK4WljMdmQsGzutzL4kMA48zTmglRBgLMYJ
 MY1LXkURmQutNVGCt+vvswPZkYYrBHd9SoqcVYtcpMGV1Zk85luBMWppbO+nOPKRsHS0zn/qorl
 505risWqwga2BqFglpSk2qRmSVoNH1rv3vj2ljz1HKXDK++maSCQ0bZe/giQ9MozDLiw5x1XZKt
 jpv0YxfQ2n+y1zYiUJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfXzs7VSpNSi6gS
 heB6JlBx1b7LSw9N0EMEYJQ84ZY1ju7I6GYze0RiIVAbfYj0sjZWuia6HZEtkvBas3oiBPnVJFG
 fk/+3+gVR9dbajHp8Mx7+Sn46H2dehs=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33cb18 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180099

Document the iris video accelerator used on shikra platforms by adding
the qcom,shikra-iris compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -13,14 +13,13 @@ description:
   The Venus AR50_LITE IP is a video encode and decode accelerator present
   on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,shikra-venus
+              - qcom,sm6115-venus
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +44,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 
@@ -65,6 +61,22 @@ required:
   - power-domain-names
   - iommus
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-venus
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

