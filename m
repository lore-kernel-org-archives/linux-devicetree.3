Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60C3876A0
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259417; cv=none; b=Jie7p7X3mE8VNkjDa83U+CzK/3FKYlnIXW7exHkTiix+NFOOJjzTO01Dt8iIBfm2hfkd/WeSodqOOhPWhqIx7bLwzLpBDc/Eyi/HKWGYEOWhw0CzrIBmsYYMXxaKqGF+ruzMa9n1zBUcRlcd9pG7t48ReU++YGZetdrHUpdgteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259417; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HG+xCod0csbW8XlSMaM/8G4DXOHvxG15rcFrpz2FM5UAZ97NQ+Zf7ibmBMu6lKxeBwD/ZS2VRDCrrrDKgtAFTa+M1FNtoxWoK5WYG8Fy/HpKMCZdw7t4lUw1UkOf9nc7a/TQYCQXqpDgRX0uYwQe0uRLlKGMlDRIlvpRNESYn8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGk1ATWi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpVeCYuz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGk1ATWi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpVeCYuz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N71kat1040726
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=RGk1ATWijn46n4dV
	/PPjXcUanGIl+j9qtviAsZLIdftayoF+99Mdx43vPdb87MJrSUYcEX2CfRPJi+wn
	lQXZYd/0EXGyy/NuKJPL1Lj/c3q1nVy6HLApo6D88QGmw0OBH3dyTEjAGH/yD9Fx
	QlT3bkC+IRgfFC92aQul4OUBaJGMr7C0pQT9tWI652l4R2AUh0Z+P83Mck3HJ6US
	+M8p3UNkUbiW9UnsvePoDNwAcaV33RoAwnvXLtfUM9xSNvzJedCqlbyoknSbLKRL
	8RTynxj/9swi+fOKEyHj5LcG0bdY0fqr53TcphtaUO9QKETT2MlCBcivqJJqRfWO
	FWE8Xw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcp90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so3039088a91.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259414; x=1774864214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=RpVeCYuzx4jPHAUpmtCHxkpPA/D0uH8kvboBmhCLelcQgT1LmM9olGDbb+lsNWS8/s
         6QXg7fR/vQod8sAGHCeSEAPCy/ErHUGPVn+1x7Z+UTyNi9wK8PDZ114JMawDT2YmJLUa
         SHOAnGP7BNsdNPKqBLZ6tBHPPYLt4dxL8NrERKW/scOSgMOPVdQFrN///oDGakRm9c8u
         EHeeLdc+6ypdXqBINZL1L8JTP+00G6VHdpvAzIA5kX8l3bZweO/KqjrTyAewBXRtjqCe
         z1g5Y7sGaoKnc2CQLmHbV2uZ3BmEwI74lklqCvYMWB+mNCzzHJt/YJ/PgyoVugFv/vq8
         yjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259414; x=1774864214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=epBef+CbTFrjikvr+KZl8nk6jNs4FZv08esF+NjNPP58LrLV00u0kKMV+LODA6Iic1
         2eHA7zp3vrS4DHglOkPIyXhboOL9bQhrJG9Ropiykh1Co9EPDpd0Blz7gzAXMSVFl7gy
         739/qK1VI5AmWttBOw4Nhi3bmpnRzrtefPuzt0Q1UkZwhpj3xoRXVLMvdr9XYDyUFQ8n
         WO0+l2W9rpRBG6z9nT/C3GbnF9WBVcLWTLSOHrppxkqbzkHxEwfyVQ3VMrzSvAIEkw48
         IykqQHKiz9D0Y0Kq7r0orwesA0gXenBTJy3ObzvEfSqOMFYT4hWUdU5+IGv8sCFqP6bl
         zR7w==
X-Forwarded-Encrypted: i=1; AJvYcCXNhQ16+i26QtXue0SMD17RQZu0W6VhI83GmUG3GIWUH45ei3sFc6wQvMRIFuUjVVubG58HKLOyLglY@vger.kernel.org
X-Gm-Message-State: AOJu0YxFrwTS/d4goZnvXux29nkgp8tvB3hDEX+QQiBiqZbjgu6M1ImI
	GmugowYDMZal0tCr6bBPuIwDwvnFKLjVIxYCiIyh8KLZY9spphTLHJAuEAxskN2SL5P7pdEBAoE
	PSGm0fmB9Y+FFh1cCOcOeDBvItBFQN8MjV+5oVDdi4tdp2g9sfQ3L9Vvl/uY/FfA8
X-Gm-Gg: ATEYQzzAxm0DBds764Uw1a27BsPpfaqSZWNJBXBcNyNO6LGsijDEywV7pV8prJvXcJB
	d8uz8O//EvddlSy/ZOMExkBqZkeNY7mF583X+poFRFsmoYsOyMOYVJn/axIWMB7KUiG6M8IwNTw
	YpowKytLgPX2raKnz/pIcTPgpmAy2dc+/3+JJSc2iI29mM/LcWZGl7IfZDgUWx/1pgnbzOQK455
	ogMAAoRP7qpS3a3hcfn2sEDA6wHllOhVCT+l/xxM/sw7H5w6bvxZAATbOAQDYEj6Y/jpPrr0gFZ
	AjpDKdvPnfrRmqxI2na0gQ9ePGw6wYN0nwp2y1tayXHfvP9+ou2yGSiVB9bbRJT15Qy0Pt5vBKW
	fWH8vmqPA5qimQTKFApeh7R8TYbLNRHSzhbBQcVqsnvSlPYr5y5RgHc0/+RRnIm7Y8CY8QEe7fN
	oHxDCq/Slm
X-Received: by 2002:a17:90b:35c3:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35bd2be82e6mr9172202a91.12.1774259414370;
        Mon, 23 Mar 2026 02:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:35c3:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35bd2be82e6mr9172173a91.12.1774259413891;
        Mon, 23 Mar 2026 02:50:13 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:13 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:30 +0800
Subject: [PATCH v16 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-5-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=QEOSRZFfoBp0jud88kuJhTiDDDkzmK/bBgbOz82nCMck9HgEPLrVRoJ18aRIKgPGe2aUeK3vm
 mjSYkANIMw7DhV+ZtEsVnee9wwsAtCeKdfPHe8nFQfIwEfwpDdh67OI
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c10cd7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iGPbjfARVLUXQ46rnUmnyj8jlqj9K6aI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX2QzxCdD0jaG+
 NvecOPXoIEMInuw0vwEx2cGHT6oGX0+/lTBu5GwXUrxxENp+ah+XKcwIe7meQOyJhJchK6lXr+S
 FO9uKWE51SfotJcDXbx8Bq4+lY+IpF8RNkc45QXEdWYKVv/6NYrt0ieVvNEYX4pM240nIZJyBjt
 slpHOexUzSDVoboTqXspx7JQmRZX8j6jPAZ+i873i0MnLrSbwRcoj3bG0ohQdXuOrVH3wwO0Miv
 joOpPbUu+fYNYL9oGVeCHOnR1wrea3pnMGxTatF0oWdOnYwPf3vVgLLdfOLE4KIAb7NQnQiIrNH
 r3pqpffC49aDupjKSEjrdmfHSXAPdK9yf8Mycrv/RXDtky+SoR8RLZcnPVC0lGTyzSpRFUA+gA1
 gpLSgV785VxVpGYJqcy4XE9Q/7rqreD6OtzApRpNEt1v6ryhDh9ic6bnjXeMj87pPZM0AjKeRLO
 VyOZO/UNHUd5tFOT53g==
X-Proofpoint-GUID: iGPbjfARVLUXQ46rnUmnyj8jlqj9K6aI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

