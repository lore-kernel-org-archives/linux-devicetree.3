Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394AA3A8727
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079178; cv=none; b=jf3lVmL+hiKR1R0Ynbp7D0n7s40UnSmTQioc4U5mWNdP4Paxy+Zdqc/gINb+fmSmf2bFNDGRLI83LaaaHAqkAf968H7PjWpy8dAmBBnE1Zs3C7vlT/SBUM9c15o0pXvHjADSE/4lV6GWiA8sF8NUJRkGyWudQanhGtryXEbMejU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079178; c=relaxed/simple;
	bh=7DFnNTv28IGdngqta0O1QHu/B/uxIDqYYhl0XGm2Pb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lf5GtgqB2e+6u+AtHlQDf03rs6q6K2GpyKKLfCN+ovsICJlGOH7rs0RX9PzhWrCVy3dkfbyqipPjOevD95tnk/LjqVAhjT5UopPJrubQAyMGGDk75cIdrctw95jsFtS5OI/8kxEmAac5Z8P2IqEc8V29ZtwMK30JzkhYqdwuQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnVo1AW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxLOkHFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnVo1AW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxLOkHFt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iZDb989190
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZnAhfc9juLM
	6ofZhbvJAs+UfN8U7vmcczY7bB1K8lAI=; b=nnVo1AW92QHI1QBLZVnYiv5DFeU
	BUap/wJYPT3AOIOt1PIIX8Ze3aT/99m4x/QWPkiyuMnlJN1/Y/9tjtIwfXs6rWSQ
	QumP55HpsF1TQkA/Db8wLTHnO7CGtHMhHIUSSsdQFF+TFOTCNZ0t8s9J8/NkgJdt
	NRpJ3U804lCR16ztInjq+P3Jl+SWjoiTt4Pjaxj9aL3WCb44kRiyGwrcVpGMzwbE
	amBUO1cCpxYMb7V1CH7Lgcyu2NwAM/XdVuJtiTJaeHzN02+/CPbBrcd9WYrUTN/a
	nIdQCTBPdFKgAHYLFB5nYAGdRLAh0BPimrtn1q4A6vtOx5w61AvXBRJ+QKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2segbw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:12:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0b35fa876so78655325ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079175; x=1781683975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnAhfc9juLM6ofZhbvJAs+UfN8U7vmcczY7bB1K8lAI=;
        b=cxLOkHFtp7iLYnDdUuvf0HtW9xj+qaHEouvzopRWZqC3YAge5MVYeuFpeCacamAE6W
         E/9lI03zHiYrssqYwFr8gX1K+8hunJIV8pGg4krsVCUecW+JgBFszmlHUazlcgbw5uV4
         lFTG24/OsrE7UzHl6tFqncfEdM9sY23PbDE+jXpODamTq35CxAlJS3rsBqZjxfVF+84C
         8Q2Y4DJ3IAYyWqYeyK709LJ5mdRpU3Qqdj1rzcSwNhdZqw/2+SglRVLHyHTRZKTN5rTf
         iAey4DESfE+uOPY4rGSgIzp2LwDdUJghU9hUBxxBbrtxKS6ZH2AgXJcZiLAKCTV8yuJd
         +VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079175; x=1781683975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZnAhfc9juLM6ofZhbvJAs+UfN8U7vmcczY7bB1K8lAI=;
        b=ExCFnZQqsTDaiXDhluzcMAD/JUafQcCwWRV2qqxfF2b1cWJkrOVXUshSpReDvoBUaP
         cAovqlbYixBo0F6gH77tgwkT9GA5uL3tZsyFH+2dP72vNUzPvRDmnsYvbIQRRbw2FDEZ
         dvhSQ4SFyaAjuI/Sm8YfGCHYN3LWM4MDshX7yywS9627uwtiRfO1yFR9xuUmxA3/1GyY
         Y5K0TkSAlIEsI2mwZnZuUv+HSXSOtEgma4m/QMcfQO7jAik9OwgODIqRWgAwcx3WwVuo
         upDz//rWSPgg4yKPzD78sVETyZGK0H3ePaJFFuO1P9MbwOQJT89DqssQVaPYrSGRDJk6
         H5EA==
X-Forwarded-Encrypted: i=1; AFNElJ+6amA8FH5YnX1Mg6VihC6yE2VJcUPdPbjiXtCfgWvHrThVZiObf6z+plZWfLMMWjIfxZGX/Fw/p6ME@vger.kernel.org
X-Gm-Message-State: AOJu0YxPH8Q9edrrRqfz9gR76BXnYj++zzFK0QcJnAdSHlLAtPkki4wT
	VnQaX2orzd94tt8TvI99RYBNzuSPnO5Kg9yM7359zCvy45ZGYZknMhO+eZ0wihKRsSyQlq1D/wO
	cXZj00r2p12CXwdbA8HE0AZimjtOKWi0ypXgss5hbOluu/6qNGUPlM6XGFM7YiRiv
X-Gm-Gg: Acq92OE3xU1yrhJuJpyI+w7AnaL3P3hfWhsZlCCWrrRcrmEIKG6Js0JFJtw/xBbM0Vo
	YqyqIRhwhXZgIuKmoO+M87Ao8760dbBCJ0KqQ85BS3NKA5ItyIpvYuWEV5k6MDEyQtj8vprbrTq
	n21ToShJgu1dZ+BUxbMVvUnV2xvnuwtVpXuBAPxK+rCwiyFZ7SKhwFkxcxtZqDiNNJlPSDbOl8C
	4i03uTLc5jW4ONOlZGIPnNKBSbNV80qEmUSc8XcEtSnL9eqB1q6p1XxWxxWGSjgdXcOXHQk9yFU
	I79Jih5aJK2k37w67F7K//a2BEEBLKtJNPTiQcheBiXjazsKysmI4oqWjkpB+Y0XU/4TbLtCVzw
	+a8s2i2ObegsKgVl7c1zs/kH/1QgBwmjIRKZQp3aTqPWp3zJVEy1dsZ5FDRMSlN9273PHumvbWi
	yVvc7kEHS4qVKiNqX7AhAjcmfjd45vW/LJRBDwcQHtRcal36IXWTDezheKXnVBfA==
X-Received: by 2002:a17:903:3504:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c1e80edc43mr270505485ad.29.1781079174973;
        Wed, 10 Jun 2026 01:12:54 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c1e80edc43mr270505155ad.29.1781079174334;
        Wed, 10 Jun 2026 01:12:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm228858575ad.21.2026.06.10.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:12:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
Date: Wed, 10 Jun 2026 13:42:40 +0530
Message-Id: <20260610081241.1468507-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LvGw9_BcwxGCZEDbGaH3chtNjEO4MJbs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NiBTYWx0ZWRfX8TSbfNUaTahv
 zVWM8wbgPNdib/771Zug/vsx4GF3zDxPxwE4GpxXi6a0dmtL8+E3TVfG90QX8NtQpSPomp0O4+W
 qG3fAU3e43JszQLvcxVyBTxpVC1kYVDK9DfPNfsAI37a6dby8gDkk2sBc9J54CyXnQsFJzu9s1R
 sDCuNGbPWs0SQak1mcv3+lzHbLXNHdMp7AFSc+H3smSGKQSMtgKTuCiUNmUEUBU/ZTPNigsCDiS
 ZD7g1+pszwlTgu7fTA61Tn3S4QDX1s1D4NTTreYME4po4SZyD5UHMmgnfGUDSEX1XBK4R4DjdzB
 z9cxnI6wKy13gfw1sYsSg+eP+SjcMYGk+BlpF+++r40LivhuzJrPhL14yzIzNZ0BjIlAd+tE1Sz
 KDIHq/P3ShYNFt6nuY2CE81YEbDe8YebCdUPi7OEflqkJwfaIE13ozwKUYotyIcFDuGRh3H4UyD
 kzelyjeAuRPuW5ZUoSQ==
X-Proofpoint-ORIG-GUID: LvGw9_BcwxGCZEDbGaH3chtNjEO4MJbs
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a291c88 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Cj70nMFs6DzugLwqs6cA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100076

Add the compatible for the thermal sensors on the ipq5210 and ipq9650. The
ipq5210 uses ipq5332-tsens as a fallback, while ipq9650 is added as a
standalone v2 TSENS compatible with combined interrupt.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Fix fallback definition
    Include ipq9650 to all applicable constraints
---
 .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..5d782c9952c6 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -92,6 +92,13 @@ properties:
           - qcom,ipq5332-tsens
           - qcom,ipq5424-tsens
           - qcom,ipq8074-tsens
+          - qcom,ipq9650-tsens
+
+      - description: v2 of TSENS with combined interrupt
+        items:
+          - enum:
+              - qcom,ipq5210-tsens
+          - const: qcom,ipq5332-tsens
 
       - description: v2 of TSENS with combined interrupt
         items:
@@ -303,6 +310,7 @@ allOf:
               - qcom,ipq5332-tsens
               - qcom,ipq5424-tsens
               - qcom,ipq8074-tsens
+              - qcom,ipq9650-tsens
     then:
       properties:
         interrupts:
@@ -320,6 +328,7 @@ allOf:
               - qcom,ipq5332-tsens
               - qcom,ipq5424-tsens
               - qcom,ipq8074-tsens
+              - qcom,ipq9650-tsens
               - qcom,tsens-v0_1
               - qcom,tsens-v1
               - qcom,tsens-v2
-- 
2.34.1

