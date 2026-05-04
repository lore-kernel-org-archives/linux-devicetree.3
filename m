Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA35194C95
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877390; cv=none; b=i3k8LcukdFLTjEk18655m8OT+QSciUmV2MM2wHVtTKVV7LCJ7kUIVxsdxy3MS/0VT95DWDSQ9r6hQ+mqI1wjjitSF83y2x/RVcF9rH7vx2WlA5Sxt6gYXIOhQEBz1aVNUWgtQfW/6KlIoAbPGtBj92KgKSIgcm8ZQ7eajdRPa+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877390; c=relaxed/simple;
	bh=7RiyzX+zuh5Q9zvm7IyARRktAwMs7ElUM7tDz5Wv/bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hRlRr2QnHdPrJd/Geidw07UCCleHUE+OtQWP+YBmg7XvrTjkSfL0Dk78CrG2paLLA95NshWPyo+MVRvURfvJObwCb6ZTBf7uXVUT3CmBUE/aSGP6pW6wekLTODOQpiQRG8iDtHy7dZ1DGwtu2PNHEVb4yG74E2/Dli4zksnhC9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gd+8XP1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1Jolmrb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gd+8XP1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1Jolmrb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D8HZ3548437
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 06:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O
	29Yv9hMw=; b=gd+8XP1QQwumofoAFeptFe3Xo8Gthg3QAhRJhRGuv5urXRPfIU7
	7VAo0VOgErV5RoAZTfIBWS9xuz8Gji7EP5jexQnOg1blTjDayRWkZRGIPga7hlwj
	yimQfTcEqZT5AoNp6/RPa2Up2N02JkMFAbHz/OaUVdiAMBTeGGcKch9NWVW+ye2l
	uCi99nP0zMdM76iOx2or+R57PW8CUQvPLYmDv70AU67tQLIGeFx3xPKHqmtqnTse
	s57k1QnxARNCVlZxK12Mxw83vxrvqOHnQWkVa4YU8GmZVvj5UMr0h9jEonnSNAec
	JAqyOVCcOUs1wAwLKXXzxT34b42W7Fuc9CQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpcvah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:49:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so2499990a12.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 23:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777877385; x=1778482185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O29Yv9hMw=;
        b=A1Jolmrb1xTiwW6xpdsCL+ZAcsoo+8MIVg8NQm8G92zETOvnloJBPESwtYDynVBkdL
         8c3SaIFDVIHcXscBPXWM5Rm8JuLdV2YnWDQ33L95qyhdoiACp8O8n3/oFXEUyIMIBaGd
         PFTacgBwZIyS3jQHDppUy2tDaYZhoNqol8ww9P1G+IxVmo5eWe7Z/Dd51KkmkZBTC2RD
         i+88K0ixhcTsA4QDWSlrTolhDsFbmCTdNrAxFOJtvUCZIKgBSRRmHJSYhx+2Kk2Z9lMO
         ZZGB41gmc1l04kSOuljdeCADGR9Zv9mdnlRgyl5Y8bJgjgrEbZg/9T3kuO8Qp7gzNLOX
         KvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877385; x=1778482185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O29Yv9hMw=;
        b=i0XyN/UvjdEYTAH6sZebAsuRyBqsZj+nGH9hO3F7CPAYfNcyfBeFJdoCfWfrECgo3w
         TGNI37u1xmihNdk1IlL4y1zqstMpqm7Vd2dWeoAJSaEVtEIx76Mrw1A9CIwSD9EtQzHS
         ZJemA0di9JQpTmbaTUwJX131M/+Dw4s/yyniI30PCWJcJ3puMqASab1+Wqocg78e+1m9
         ZMTCs3gd/FZV9oyv0my7EIO4jevkC+sZFiPY68Lejf2OFAyI8pSHEwlfBHxkoRcgXCaA
         akZ/gU1X6tAF9PP+ImvSacSITGjonRaobOcI02kf/2+kjWEjeZq3OHffOVf2ITVM/Q0O
         E2UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EjBNNCnW54a4FOAZ9so7kMGUQcUt3Dwh1LoARXy/XAKjYPAAP/DPpuMV2a9Yc1RTbX5g+sXpu6vQ6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0uIeTnlYvSP1gHpm5kTihQacMtUr+E60M+MFoD0bVHtgLl0W
	NQz7AWazYswuU3ypMqMDm+CAq9PMmAjMmbCSISxhLa/S1IGxsLYripoW1hSktNQqjONuWiJJXiF
	C+mczxVIjn4hrIOFpKF55R0K7AtIKoWlHuKNYQtJtDw6+8UsPWWSVixbeaXmYt06AQ5nhLKqM
X-Gm-Gg: AeBDieuMeIH8+M7GzxiNw1Gn4Z4yUCLZQ+Zsu+u9s65xIf7cq4/q/CS7ZWN1Ef7DvLT
	H4p7KV8OWSc1OtYurSTG+M6sKK4XSMEBoxKDM++3QYbYhGzffbxtWTPma2/PgLav0olhfbzpQOn
	PXh1LiOcXMRPhbES9tV5iwZpIfUSsFiTA2nrzhzg5yzfohLarO5aDZ7hXh1I85BPU6Up5rTRIzv
	aaVHrYxS3tWZNA/SrVC3lVty/qcbVtmVTlseMc/25GYVaEpLyToDQI2WrKX/QCbFLN2NJL6EXWf
	7N3WZwwjKgVdyOGhf/6ObvczQM02aJzOqu09SNM+LA3hVZdPLM9v0AFt3VXtz0WRRIKie56zPOU
	/JOe+eL/w+kamh5LbWGFbdzdSYce26ZblyDUXlMM4kFIJyvC3ZC4lajmztW1/GraaTQ==
X-Received: by 2002:a05:6a20:6a26:b0:3a3:21db:8ef1 with SMTP id adf61e73a8af0-3a7f00dc3f9mr7117004637.4.1777877384593;
        Sun, 03 May 2026 23:49:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a26:b0:3a3:21db:8ef1 with SMTP id adf61e73a8af0-3a7f00dc3f9mr7116989637.4.1777877384060;
        Sun, 03 May 2026 23:49:44 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbba73e1sm8470681a12.1.2026.05.03.23.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:49:43 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
Date: Mon,  4 May 2026 12:19:36 +0530
Message-Id: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f8418b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nYjtv9ulD0oZlCtruZkA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3MSBTYWx0ZWRfX9yTgOuO+ID/6
 AwQtd49YECXD99ry0BIqL2x3sCOJAKBtXe5YUx5FaLXvIU5QUmcfP4ZUex6bOTSRKr9OPUQaqzu
 wZ6y8wcnsjsRL6fHYVOJrLR591MzRc8TPoWUan1TBDParUFvKG4P8PqRC7EdOexKX5QZr9pu9eN
 AFLf0igyv00+pdtVsr8daQGwhcP8N/kGagv9kesjf0YT/06ZJtnZ/dZ34Pkfj4fTJefk2OHFRA9
 ODOZfKQUZgI07WFDgY3v7XTqxK1xXAcWIHDk28bMbm6BDScDLg3Xn3Q7o3OLVSkYi+jlxXCZw9Z
 eDi/StE27taSdjw1jHXA1xN/9ZIh02pXt/LAN6/IltuMUtv51MtX+Nv1dmpLZe2USHyTScDf1VF
 bfpIUVTkP2L45hoNj1Ny7OStiC5LCNBjl1e0qAQ9EtlJU6hvCxFr5ATnMoD95WkOwhwKb2gLPOJ
 lm6Sxa9+7Dq3j6fJaHw==
X-Proofpoint-GUID: GucZqBL_ZdFX-C5uChbBEBvWWzO79AdR
X-Proofpoint-ORIG-GUID: GucZqBL_ZdFX-C5uChbBEBvWWzO79AdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040071

Qualcomm TLMM-based pin controllers share the same gpio-hog binding
semantics across multiple SoCs. The gpio-hog pattern currently defined in
qcom,ipq4019-pinctrl.yaml and qcom,sdm845-pinctrl.yaml are not SOC specific
and applies to all TLMM controllers.

Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
schema duplication.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
Changes in v3:
Move the gpio-hog patternProperties for qcom,ipq4019-pinctrl.yaml to
qcom,tlmm-common.yaml.

Changes in v2:
Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml

Link to v2:
https://lore.kernel.org/all/20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
---
 .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml   | 5 -----
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
index cc5de9f77680..de9a3e67e1bb 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
@@ -36,11 +36,6 @@ patternProperties:
             $ref: "#/$defs/qcom-ipq4019-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-ipq4019-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index 4fcac2e55b55..3b33daedc018 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -42,11 +42,6 @@ patternProperties:
             $ref: "#/$defs/qcom-sdm845-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-sdm845-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aae3dcf6cac8..aec72e8c0621 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -51,6 +51,12 @@ properties:
       should not be accessed by the OS. Please see the ../gpio/gpio.txt for more
       information.
 
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 allOf:
   - $ref: pinctrl.yaml#
 
-- 
2.34.1

