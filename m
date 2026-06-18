Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DA32E7381
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819700; cv=none; b=Y3OPZ468qBrfDEOof5LYQKgEDyKlYWfEE2eg1pt/rMCcIz65CZ8enFyVAH/ZAijw0EaITWQiRTCg9Civ4g6YyjenhvOjg7TUBlR/Sq40oN87iCQbD4lRPncDUyYLWuSQ7PygoMzHe2cDxII0XMo+H8guwrWZp9tWlLdMgdHF2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819700; c=relaxed/simple;
	bh=6HzWQm13sZymkwJ60yMD4i13qBHluKrBXZyYiKMTzmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EgFK3rCcG/XyC1n55QmB7B8zaWxk9P9yTarReATVyRUKqygTTQ7TVUOKwtWFqHZNH2RRRbGk/AtWSEROC6bxLaHdGrLOJBAzCc/bDlsMb3v5UHrY/MkmWfWrHjim3vh2AMf7UE9CV2ch5Nrj1nGw152v5osR83paZBXDo5alGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Axafv3yF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuckZSy7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Axafv3yF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuckZSy7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILs1Px3059548
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=; b=Axafv3yFYhGTDBja
	caW9ynt+lQQASx4Rx6+qpShoXoHAt/Kc1REWzAuwJhRSObNUSAhbd63KRrpXspKy
	oO46YoMlZ2Gr+Z+B6Rz7NKncdnUJq3164ibHiP3Oak3KDhaO2nelP8Fpq76iT6Fy
	AimVXoLCiHQo+Dmb+B27EmYYBHiBzblMYOf4pB8gZ0iowpHu30Y3Z5nJoyhZtS6m
	4LxDbLSGv544heKHv+jNNcpRNOqmKYRSm09EL7Oeo9K3DWQ2SuqtG24XoUioSYSP
	5CEyqk9L+EIN2eF9b4vr6cYwUrlL4cS7zrujh4OdA3OUs9byL6w0VL+7u6MDEOpR
	yLHv2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtj9617-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-307fd7138b1so2360869eec.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781819697; x=1782424497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=;
        b=WuckZSy7GREUdudbilUwDQFa8c4z9cxosGbVqXK6Uxrjx5YgkdZ+FrxN85C+BvL53M
         44GEcYmwgs/uedLPrUMjOrSBEgOTM+DeCas9rgFrVacsPgLAQ+RczEupdip7kGDd16SF
         xQVh1lqilaDSwSAXgN9HgqUTuoCmkeXjmg2EYLK7BOcj7HuIyiknG7RtGeqpXLTmhzcx
         N8KKGkRMz7fEEMpJ00KtyTZn9CF1e74uRsIJEoJ9bjazxlUodcjsctD00kV+nlJuo0xi
         Wyvegj5FaT6n05C3TAnZ0D0Yx7rPqt0UvGRBDkgyGnZEq7uwwgQBeRVAL+k4Sxh/Q8km
         rhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819697; x=1782424497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=;
        b=rqZqCaK1qi4GH3FQ8gfgemVsxa0aOHBKF4xs+v6y1eZqS0dF6HjmnxgLoUCqLa+1Uo
         pIw52X1AgpyqJF17TRIVp34No6BWCowMESA635DXufVMSd23qnHqsub+HAsvuN+C7YND
         J9CsAHigYDkQFWDtlFoBi2VH3TF3VL6NW0C5tYeVdZUnCWy9uHJvvP4BPhAKbOvtW9iP
         XdMhHRAPz7lqmWWEg/VSm+9vUF25FqGWoomuoH784r+KqkbTGq4Op55M2IWX58+m2kel
         EnY9SbbnmDw1aqneGzH/vjuHzJXQSAEW/9OUNL05Psq9+MaaF3rXZvxcjkoEFClJwHju
         q9xw==
X-Forwarded-Encrypted: i=1; AFNElJ/nEkPi9YJulmMiOizZFYDYd87qf7ag1fgYz2p8KPHnVchZQ8H0i2x3jB8OrQietHjSMZCSiO3uM8nq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3l0rlSYGNVg5nh0Hwm2j3551LJz/Jk78x1Jfp+/1F1gtanuNh
	gG9yVhIIDvSS6q2FB4Fp0TwbOPaVtTHXkk7i/idy2ZzRQGzMLlujjy8IEP0KqoOt5aGTxdhBM3e
	2xKT2iZu+7lr4EIn9A4emeZbbGZkB4zpRS8fCS7GFhArgyA5TgzMwGjjbG3oaEXvy
X-Gm-Gg: AfdE7clDOuhiEVDmZeQf8bm3/PxS+d8G5OFs16miEMhG2shLFSE7G+MNGfpxVe5S/XQ
	DXMysnKkUtS/gMkxmsOceieVIdb0Wg4CpQA1fqNJjp+Ed1TCfzt+Ep2Hrt+zxMDhldOMIcuPekK
	TFiivuv7EOowqui2CKUd3yqvV5GNaHVVM8yKdtn1GBozmnVjDNG+5jznmMvk8YmgW6VOWOuBMBe
	BvnAcg/j/OJff1dB19Fz7Db2u79E0e2jiwrXJCkgCgYPrXcRD67T2nGFvgn3jhKWwsC/kgNZTZI
	f67E3X4JqhPcrH7qXguVLbLx3qJqJFuFd1ptQcROiqfD/mVkDCN3kXyeIp7oLK03nN4NHQYuGJW
	hN268jF5pkplz/VuZQoQbAuYGGnuTcrg1KeU3wC0jegG925bq
X-Received: by 2002:a05:7300:6422:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-30c0716e2d1mr1044225eec.29.1781819696879;
        Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
X-Received: by 2002:a05:7300:6422:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-30c0716e2d1mr1044197eec.29.1781819696383;
        Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm619430eec.8.2026.06.18.14.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:54:55 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 21:54:36 +0000
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-hawi-phy-pcie-v3-1-3fa42ca45ea4@oss.qualcomm.com>
References: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
In-Reply-To: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781819694; l=1854;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=6HzWQm13sZymkwJ60yMD4i13qBHluKrBXZyYiKMTzmE=;
 b=BkCn3VM7TaiqbuAWyYPsysTSOcH9CO0WFT1wQrmZ/o3knI1yRH+WUA+x18r+VvqNE9BO9rKFM
 76aBMuNCVf1DZMGxf8yNQPiSlJcZmDsAu7aRmbHivUdYxcj1lxqrehI
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX/KRej6a1XTf4
 7baD7y0e5EqBZCYvIpsPc92wQpQfusoFEqI4OvpSisD4KdESq1Zt/x6NJlYA24MK6SUbDBPckiH
 bsc9bZhgBJWnZglIEkVSBgVhZ6VaUn8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfXwhYT0HBuIZr7
 bSXPWWVj+O4YHoPLYY/jYmDnFsBfrLn4R9RHVlBZybYxkkOhBUFtRzbckkxAg2TPdZY5qH9/p+y
 djQtOZoY39JU6Gc42KZ6VvK9/BBqJOJqdUPU6MHhBwrI8qg54ptDCmSNoJOgj8gN+2cKCm1leKq
 8CqyKM+rEwAVyvqUK3k7JpOu5TN10DY5dkOO5v9wHXsvjDiODTHFcgHfhLK7hm3yKp5ZpEiOa69
 rXNeUlIPlNmwIowdmCx/m2uTbMkJXj8q/jOudzaactHc/8LuuqZ6zUpCnDIWV3bd+EWJLs/3JUa
 by4YpVIDYDLZKCTVdfumQVNZagXavuEz0y0thijXGielBQi9O/aQOf0ky9buqkdsIGtob8l65k9
 llCua0+LDuWZPVgznXizYrbWgK3LsYEfC+VTwss+XQ9tQX0ayrzXajH5gm/u6DLJL4odmWk87o1
 LIS4io2O3iCWHtwBadw==
X-Proofpoint-GUID: 4FzxeTXMjEU5snbXPH7dq7SGkZJzgFSd
X-Proofpoint-ORIG-GUID: 4FzxeTXMjEU5snbXPH7dq7SGkZJzgFSd
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a346931 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZPVUbJor9CvCRQEu2k8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200

Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
on the Hawi platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..9e9e34a63bef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,8 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,hawi-qmp-gen3x2-pcie-phy
+      - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -183,6 +185,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -208,6 +212,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.34.1

