Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7A421A17
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821071; cv=none; b=rqm3ixZ0xV8aZHge4C/qdlHJw6wtVHPGFi2EI2Dqs/+Y93PUpw2Acw3bbylhTBdZRPSlqmCqLPyYznQSbe8YiX/S6FuWXqu2S5kEVHduD2ZngSPy9yFdvTMVhzZOkwfTSgkAUeSDlALn/Vf7Sd58g6KZc6jXT9mbC/gMl6Guv94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821071; c=relaxed/simple;
	bh=/LlUqPuzoUpJYpzlWz2H2jaV5dcA4iW+0yMXMr/0Y5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NeWHI294Wfh95kSEeqqYVYlIV+mZSbZli9VCT15k23mW0k46FLbOmhvpIj0D7RANOef+mQHO9t8o2eA+yM6NYlzhfagCeaCQ/oan9Y5UfYm9Z8+Ay7oa0ATinv0tBZUDp6t1yf4Z7RgyTAOVZZBegWp9r2dIiFC8GiPSYf0xpF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7Qg8y4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rt9m5s7Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7Qg8y4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rt9m5s7Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QHCqlE3314536
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ebSLJLn0Ajn
	KDVdWuV+bTMoNjWxQYHmA6naRcJL5OMM=; b=U7Qg8y4ISg5uFvom+4wT/4cWjYG
	ovNnIUBkw/pqVN0125Oft3dXxosYV1JD/ifdQ5bJ0KQ6nkmlCLw16Kbz46Z8x5x/
	TIkHt38VT98+0LusTeAyNnigCVqPRyF89tRWFrGUXJO/rg37qXUrk9HL8fbtNaAP
	Drm+efjjF4+O0MSDQR9NDTZ3VzrdxQ/kKC3IjGwVjH3aMjee3WtlEAT8jcJM7VSO
	jkMzUKF5mcuSeILce9d63X56LSanzs0+KJmtD8VGLyBsjZXbLrX0osJNvaRQasVT
	AHkc2bi6LKre/tmObZVXrWqBnMlKujrCQCleNH6vXEgLNeh7eOUF2u3takg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edfqk0bsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663818cb1dso2363167a91.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821068; x=1780425868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebSLJLn0AjnKDVdWuV+bTMoNjWxQYHmA6naRcJL5OMM=;
        b=Rt9m5s7YWg3uEVLWjPFtGbUbXhhYIFaSitLcG2PgrTf8xnQ9VE0B99JZVVooUi6ZEh
         T8GlUG8yUliF+oBTcZQrCJ/x1Ei4s1PgRuJtpd1RIQWaV9XZ/paoq7RL/c3uTV1Vws3k
         qDFuYYWo8PJX7WHQDEj/sRBjpyC3vUltMA/Zm8N7nCzCA9jr72Mdg7d7esjpeJwtgzrr
         QsLhk30A6YFBg9+Xvl57L0cxsKhNOMd89L1lov0As1U85u4ivBsPOXB5geQ3VNmZzFCC
         Xq6BALedx5BrTjTvDg5fnAf7u+8byl5aHSIz/MeOnSPkGfiTIRjI0N5tMaxubkQvf2Mn
         SLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821068; x=1780425868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ebSLJLn0AjnKDVdWuV+bTMoNjWxQYHmA6naRcJL5OMM=;
        b=XAA/OeIHxJfMjwE1bMoI9MBGRvE03ZbB+sLRxOpKJ4qV1x4kUCko6MaXbbqXq/j/7e
         jg0N0BKkvblo2EWiJg2dk3SqnCUIIgumhTOsUKsRTiKbchewAtj7cNmhVjAOyH2YPNpu
         /KALCs/N7HdLT3eu4wZOMuz+AQ9XfXqmUsA5AdJi6+Lp4Q4SEGyWl9cvSq8g6oiPjJe7
         cf4t/7i6NxnmlTynHXHUrnPRteMt8ePTcACDnaPDXBA6x3h7qnNQaXYj5urmybKmWmdd
         xWthTLuHj0lKbZx+kTodeAXF3KC8Yr9KDhw48nPF6qfi6PmXTaU2yjbHMJbD9izhpr97
         s1GQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wpMG6sYeZTvuYXjChYZD8auMO69jV+x4GfM2JlKNjGv1PZ+nFEdixwtwTRzFsOe1yM1Iuy0R1hGTC@vger.kernel.org
X-Gm-Message-State: AOJu0YylKLDrZg0ENKqubEbCz+sGBX+INsExXj5RS87yIpksm2R6z4Pw
	baI4DL+cXkl8DK6ibc/peKkVtfkvL24Oj5AtgjyAhiBI+1R4UxeY53tQ2MZE1vKS7SHA/Saw8tN
	/CIHuSGJouohLE/t5ZdoYYplHkR8KCXi9Ahtk09wLRyx4eZFDdQHPL5DA3Vx10SY=
X-Gm-Gg: Acq92OFjwQFj7xkvbKz2Dfb02Humii9ubSUiaFPfP1aWenTdTny+OrbVuiKnIxLHknU
	7BGFnFZYIMj9L5DIn4xZ+UQ7fyChszleud11sh30pmEFHukqNiuRm/6jiTr1JHZsLnc+Tj7D9o6
	jXV1Tz5ItAk2s5ETa52LQFShaavQHh7wBM7h/y4FZv67qRakCPkEuA928Kw/d9juihrzn813wS+
	buKPoyFWKc4YFnsN4bFBuDFhnpfnIMbG4bTg6j0t0I5v+NP+ljcM1Uu2PcrZMcjPmZw9nDRW62L
	Q0sr/JR7ejVDUOsfjMvk3EpAJQUnhlIsJMLlsgbOgsKYKCbNZx5iXZJT3oVPyQKenCvZDFUDlIz
	cap5WhSLcJ03fHKI1/W/b9RCY3O/9xlRhZKSDXCp+l8YJu0LzZD7CLg==
X-Received: by 2002:a17:90b:3a08:b0:35f:bf50:b4b6 with SMTP id 98e67ed59e1d1-36a67449419mr10110982a91.1.1779821068291;
        Tue, 26 May 2026 11:44:28 -0700 (PDT)
X-Received: by 2002:a17:90b:3a08:b0:35f:bf50:b4b6 with SMTP id 98e67ed59e1d1-36a67449419mr10110973a91.1.1779821067803;
        Tue, 26 May 2026 11:44:27 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:27 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy: Add support for Shikra
Date: Wed, 27 May 2026 00:13:59 +0530
Message-Id: <20260526184401.3959717-3-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fqPsol4f c=1 sm=1 tr=0 ts=6a15ea0c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xUBqWrrpq4f8rQ7XQh0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iDBgRE0t4vLzfUfG8Yy24hXB4eCKoI-T
X-Proofpoint-GUID: iDBgRE0t4vLzfUfG8Yy24hXB4eCKoI-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfX14AG7Kq+Lw2E
 aX28ugpKEYvkFrKicNjlOMX0i5bnYZJon8DNrvvsKRNypzKkcQ/fNAig3eDCqhi4TF/P5tXrn1l
 ymoBuLUaf0LiE1ohlmZ6L4wtyrouUM2g+vMcmhkN6xFFs5DlH2o0pysLXp7mg9Rh6dJK23YXDQl
 PQRKhReFNTfUVVm7hUtYm/zUaVCjf6yG8XkAqmg1PnOM7x9+veK7rWIdFTPEkmmO6SArG3LdC2i
 RnmvkpnLr6fcBRIQgmJ4LO57DgG7zeFJqaRo0/EjVQdj9AqxOx7lEVyxOcnzMKvBSM8kz9YtzHM
 GdgGDV4qqtV+qkS2UrSsMtibqVYmUddV5eXDyT/4Xt8dYYmpf6T7TNohenDMgxKuXl/qxFSg9El
 gDXYwvDT2UHzYO//2154drxRnaovLX+TBLj1+T8jkv4ltL2A1s5PfAv9Ac2NWstT8Z4qutabRv/
 DKNnsgAKBGxFOfKHjVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260164

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Declare the USB QMP Phy present on Shikra SoC. On this SoC, although
there are DP registers, the required internal pins have been removed
and hence DP wouldn't be operational.

Shikra needs 3 resets (dp/ phy/ phy_phy) to be asserted and de-asserted
as per hardware recommendation. Extend the bindings to accommodate the
additional reset.

Use QCS615 as a fallback since the software interface is compatible with
Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
index efb465c71c1b..65ae4c6e09db 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,qcs615-qmp-usb3-dp-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-qmp-usb3-dp-phy
+          - const: qcom,qcs615-qmp-usb3-dp-phy
+      - const: qcom,qcs615-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -33,12 +37,15 @@ properties:
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
 
-- 
2.34.1

