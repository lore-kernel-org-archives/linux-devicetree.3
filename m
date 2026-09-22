Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E855C32D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091147; cv=none; b=d4wbeaSY1IiiIZa8zlOxtWF8TpsK7POyRET014dPmUWp1VaOnRA3DbcbzwLuLnhLrYgdhQDNLL8DhXVUn77e2V9upTPiWQ4lc73G7o7zdFEtypgd7xz0tBw4+e2sU5qagUolYFPtZ3PwawyAy4YBtye7mhMd/Nu9pRqeAURZEgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091147; c=relaxed/simple;
	bh=hqNneUV85ciDgNcaZNEAxA4akOO2zgiQecHtZF5ZtVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBvNcc7MD5AmRb4B9wpQs+HJkDlViO2JqMVne4eU5uc/F030KecTs5yOEPPvllqUzS+fBVcCm8fqqEnUxdEVhGOCIcMMplCWJIUmzGjTS6SDKR6N46o1Dso3mgtq4Yvyt+xlk4kRCNk18Fn9lULjsXrjnG9O01vJGwHENbLkNcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Og4sas+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxrPbUiq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Og4sas+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxrPbUiq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjoqg3952905
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=; b=Og4sas+SKQOeFaXF
	JVQovsfsAPxbRE9L6LI1OZZlb+5mE4zJ+oVqtHKDP1lxyzQwgPW23kXP299H/5hi
	pCXt2ViHFOMzAl32QAjmMiFwbn/PcVChkWz/1eOgW+kauAt4k117GvOWwARuwnlI
	xCxHz2TD7A05jJHeISc2lLE4kZoPKl4ASMcVfk3mTMVMc/s1q5DgukWOod98VcFY
	mUrnl5jJ0JRY7yngug/JVEJnOe61C0Gtb6L5cB/Zp0XkHfyqwhOnrMd8RA94ikCT
	OlaZwJAgEAN9LWIRZrt4tGur/yRMp9L7AFDA3BvlHOzLvLyvg6Mne+XqYUf5f9ti
	91/akg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqba0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:32:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd53f2b27cso52282305ad.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790091143; x=1790695943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=bxrPbUiqucz8mMJ1m3X80aQMzTaMNX/Fi8QKqwZtKIhPNOjYoExQ/OmZgQwcMS4s5E
         JVRBs+jlHUXEU/kan3C+NAM4Jlgw+V4olDaSMm5RGhxhsnpNuNF1HCIgSPfrEMUFwS0E
         jRP3SVsFHJIaOenuUuwtu5c78Q1SzNghEpN4nhJ72kZO6XSAtvtLGLdVZ63O6mBNiVye
         KOCHL3Pfysc9MQd66PMO0CS7pkumpcFS0Re9z33OvhDmVPGUq9p8cTG0okcHc5m78vzn
         bGbOF4o3MwpHBRgoQ0Yz9Eq2yoMEzGge5A72viWevwsl0fYFAU/yElcsXaYquXR1+4Oc
         Oi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091143; x=1790695943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=foVw5Xn7n4UJmoWqFYKDel3Q1JVVOZOvcSy3u1iNNEgLIZ061Er7qWehplwdphVws5
         E1vZPEgA0g7wpJhO69D3LTRedPlLyq4Cd85MiL/Al6hLGb/7mIM4Ik7Eegs2MpevhR7h
         CudHUW1KYzqJnn2nvA41+tefRTh+Ir2DIhhOUmT+KfyvVxPf8L4EJE4GZUJa3jtrYd4y
         tKw6MgmdRrrPLd30+X0w5zZzOpIajZKRW3m9Kj1+1p0nRPrgMGCCrptt0xDcQJ1CmvYR
         3kdSnmEV6FsdcOM1/doSUCWuihkPZXtSjw4J2VUBLqFXmvW/ByqwVCGzePFy1xNIfe0C
         NeHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf5uYO7QS676BP2BVe/4OBVSNMK6CPgIV92aU2CEtQ1+r3IT+nXcJ73RrQdT+DhLHWvE/qgGB/6Sy4@vger.kernel.org
X-Gm-Message-State: AFuF++ngpM1f2eoHey9SCFCyK78taXuORutWAqDbw3s3a9kLI3LMMTfQ
	cmfs0LmavWjeSusOGcrrSYj/bDpwSmGIaekm06tFLHE3oewyDrXJ5nwa3t62bGWtZ81KAZ8KFWr
	tjEqGXjGvZ1Mx58T9ogJLaiVUAmulNH80Z1vobKn2G981wlztzNFSU+/Zaob/B/uD
X-Gm-Gg: AYBFou319fAuMUNzoAPfTL9mPm8dFV0L7H2T7i7k36/+Bd1DRFSNTatGgY80wDAwYlv
	IOY6PJHwOSVOxsRgkM8+6/y/TFGx6h3pkHBP8LYwCzwf+DhmCVchEWO3n0YUbzPdLZtLA+waeWo
	I1cnMcIRBONrfOmu2rcfJR/CKrH48pC4dBeySMDN1ua+I0AudJSsOmlzTcG6t965cFglfiu0JDC
	pQRQimry059QTiVWrt7/QpDGPxhV2Et3rDukNUHs1WkF4gg9AST1RmAsGevsXQLEyMwk42ZYzT3
	k7X3GJmwiD/zQoahcG0BRz2UuiuOBqVWVGyX6XBhrFtWS/jTg2VT9XbokbU3HJ7dUpQfpuw/suo
	bS790NjboDR2eU/EAQW3IG8bgjryhZNoWWk0=
X-Received: by 2002:a17:903:26c7:b0:2dd:c053:d73a with SMTP id d9443c01a7336-2df60b31af7mr18929065ad.33.1790091143066;
        Tue, 22 Sep 2026 08:32:23 -0700 (PDT)
X-Received: by 2002:a17:903:26c7:b0:2dd:c053:d73a with SMTP id d9443c01a7336-2df60b31af7mr18928465ad.33.1790091142341;
        Tue, 22 Sep 2026 08:32:22 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm12334945ad.50.2026.09.22.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:32:21 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:01:59 +0530
Subject: [PATCH v3 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-rpi_reg-v3-1-9214321c4070@oss.qualcomm.com>
References: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
In-Reply-To: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790091133; l=1446;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=hqNneUV85ciDgNcaZNEAxA4akOO2zgiQecHtZF5ZtVY=;
 b=17xA8d6Jkrrhj2Xx9XVwKjaTVs3B2U5YwnT8omIyAWoZimyU+zIncQAKSfpWjGyuF7NTEreCP
 a4zrWMkMlR0Ae6LEUCZz9z7QK3W/HMG2GDHi555b7FqGg/Qoq7A36VU
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-ORIG-GUID: G1n3xT0Fq1e2romOs0CQGCtdiAseqTX2
X-Proofpoint-GUID: G1n3xT0Fq1e2romOs0CQGCtdiAseqTX2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX/KVl9AYilLUg
 bGMSGfkmFplrdu2bIioki2xFoji0P2Xhv+BG9zCKV2CrkFR5k58GguqPdamo0qnWCsO2jjEhpGh
 5EMqjOcwqtH+/cnBjw6U8+J0bnQx64M=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab29f88 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P5neLcC-yKLQ9RCq2NIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfXz6S94qZ5G9LK
 Hro2Oo1S3EWBzZhlSnWmjLlkjkxnM2fdzDb7Sra254YNxJoX8WdEitBbP5q1Rcdc2vyYQY2XYB1
 C0P7eQZOGkMD1VcSL/7hNu2z46KsJf7tGaGP30V6/ykMWO5UplgxJas5aSfE4zW8HSCw5cmFIhS
 Yoo76zN5gBfX5bjg8+qi0EKlVavIBjDxZ0wYhD0khwaLj2B4Q8hhn7DmPUoV5Ujpj5v2mgq8obv
 6OE3adx6ENiF4tFzSO3z4krZHv+9qZm+s/RHsjve3PpOFOMyNfGxN/UrUnB5+NlpDy0CpfB4A1o
 EMa+nLMdXHqedi1FOLXFxEB6o3tF+jUjE/XVvEDUh+Ur/rfdNR5XrY5BQxXzRgaEXIoh1vm1sJX
 RTGuv2rOak0rG3iklUid+zzp9rIvVzFWTrcbj0nNjsiqIsVXMsSiRfw/kBwLVi1he/luhxyxNTI
 szTtZ+1ZAjDwMMGW29A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220226

Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
panel V2 regulator binding. The panel controller MCU is powered from an
external power rail, which has to be supplied before any I2C
communication can take place.

The property is optional so that existing device trees which do not
describe the supply remain valid.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
index 37b9ed371b67..3e2cbcad6490 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -35,6 +35,9 @@ properties:
     const: 3
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  vcc-supply:
+    description: Regulator supplying power to the panel controller.
+
 additionalProperties: false
 
 required:
@@ -55,6 +58,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         #pwm-cells = <3>;
+        vcc-supply = <&vcc_reg>;
       };
     };
 

-- 
2.34.1

