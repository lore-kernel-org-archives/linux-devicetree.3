Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B033033FD
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217376; cv=none; b=i9sgfQWY5UuRjtKmhzV9VmwRPCl+pHepN3bMu1GIwEAbCu9j7OrHeHT1NKGHsH7rawRRmZnxztwlQFCgYeZsRDxLDMG110WtbItJ0DIhYaEVmtmKLiDYxr/hWwnOVS0tVuCQcUAOyAdZUoLjImEf8u74ApOUrRD0gLr1lB1vDGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217376; c=relaxed/simple;
	bh=M1IKsX35QWBCod2ZjRe01yA0dvDg1c9PPdXLvHebjw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RT6bkfI3n4fcKnE+CRuHQEwwHKGGE0yu68JHwqcmdCzNjzKJzML8cYsqIB5+WN8h7uHDQQpGqjNCUjwE7rhNPrO1ZIjrojj2ymSU3UDK3IRj9Tx57sN4CxHWEqjsex93/gq+QNomIHOxUTXH6gLfVuxXpF9JxE5Z65CxbZmLaVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aB6Kv3Wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgTccjGe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aB6Kv3Wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgTccjGe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6Tn431258528
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VsElX53WbTDzAmEoQneheo
	mUHxHEL1u4BxpuZ93xy8s=; b=aB6Kv3WgoEPXE/M84KvMcaeEgt0l5QWNLu5np+
	+w3aft8ZlWJdB8uUTt6udDI0Tm6Ck/LQgmtaEiedmvDiVr1DkfGlIEjsFsNZdQno
	1kwZ3Zl2M8ODPGGFi86s0Ulgn4tF4FpI90ov6OIpKiYq5C21jmLBWuxd50GzuZf4
	Nr8G101/J68Bg6a0AnGTCiSt+Ly3Mt07Cn8JzhGmqmQNaEnTvnzEAOZpdTV34DwI
	HpnXeuvcjNHakqOpz3Jz0g5eV8JD5NQTICdd4a3ddUGweTomv9cMFLv6xe2QC23w
	o0MMEIo87+mto/SyeVvNHefG4RrGKotd37giFbEVbVJk1rnw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es641me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:16:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so13425645ad.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787217373; x=1787822173; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VsElX53WbTDzAmEoQneheomUHxHEL1u4BxpuZ93xy8s=;
        b=GgTccjGez2PsqI5Ma5hbsmh5hO5rIavnkrzT2iRfLCAcuWIUMeyPTjpRLD8+5NQx/8
         MfSYH0di8S+ulQ88f8rVx46sXCFBrmgJ12+PS2dNfJzP8fafCHaN+Ag/im1GUzb/dnJS
         tEeRUUTiH/Q8nq+fiJdhx8qUA1NXKpJPlwOqE1ZOkGRZI+8YSeWEIb4MDb1bh3OHyxre
         2dtsAVUqJmt+JmnOTPRl7hfaKDHprNKaUSeIWk6EWb4PIRAvF8qa9uKhwCetgETGXp8s
         nXYmH+kQ22GGCbpWDDqlfEUPfC2ffEv3FThBpJcLYZzaHSvGoiYCdp1V3b1+jQZeCYf4
         sKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217373; x=1787822173;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VsElX53WbTDzAmEoQneheomUHxHEL1u4BxpuZ93xy8s=;
        b=lLdR7f09eHtqSSb8gScmqhJcqvoBjhHeTPp/ZUa7Ne5aspElazXND7kpNmXF6FmBRp
         SAVn7zzpxRdG2+V77qcI/z5U+4QM7NNPSDXcFJ4sc2GH1dx3ivBifLzU1LynJFbSzP+6
         Nwb3Miw3iqBvodTH/Ke/tmp5HqgMaDo0GnyRTeT1pMU6ZDeTyqOajlvrNhGtYqKlL5cp
         MQrp0QxffDMKzjgRQ2c2130nZXCwB8Lw5z/WLx9/PVxLD/kwYGk0xLW+nUHaX5GG30tj
         S1dRv5zeXyCnFPKLpNimTNdOoBvO5rEXIJBBD3Kc1pKLpCA/BwZFvgfTDRaQG8XsnsFT
         dyjw==
X-Forwarded-Encrypted: i=1; AHgh+RpyRm6u6mBpIoOzpw+k5kkHTvNN+nkafCx4cg+A/4K02j4PA8AKVbX4/YXjpCUGP4533y566kv634eC@vger.kernel.org
X-Gm-Message-State: AFuF++kmccSFPaYmtf4bbdiT5rf9yvbEpAyPGmmCO0/opw3f6UckLkoZ
	8tw8pATR3DsPqK5RC61Ta4MLOVfjSkrAxDroyluWY7s/aZYwTm9p+wWYW0yJ+81KuJ/n561Zxtm
	Atr1l0pJv6TnMsVo1AH/3ENEANNSXyyhb3yMpggiCBNMvYjqSm6J9XRceoAcB68Fw
X-Gm-Gg: AR+sD13qLCNDH+gEMdmX72hjKRcymszhYEhm0JHM+MVXALAA1FHmZelY5sSw40u4kCF
	hkBPfgKNSt4zu8yn+KWqmOa3UuGd+zm8XM44wW8kL1eDtYCcSm93O71xqnGSxowSr/56dkQantx
	OmRR59pqFvGUPKcCsiAL1FCSC/Qd/VqGo57RcyT+1CVWlgJ2SJcJ4lzVTEOMeQYcxb74/wx4c+X
	NOBKoYNNLeYdsPz/f3d7FiB0xOyKkYU9QHj3Hvv7A4jWCcPOxh2x8U+HiXi/+RCG7ZBQf+IxVZs
	gRgH1mI6kZTJ7tUzsJjdXoF1wizdRqBqvGu8AiTiwHGJ7+b7vK1SqCfwypcpwNXKNZ7qedxSYDL
	sc0ttVkcWVd3DtHNOTwBfqxEIhYdWeLf4
X-Received: by 2002:a17:902:d546:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d61a07f932mr68875735ad.6.1787217372704;
        Thu, 20 Aug 2026 02:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:d546:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d61a07f932mr68875135ad.6.1787217372265;
        Thu, 20 Aug 2026 02:16:12 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d555374sm4232905ad.16.2026.08.20.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:16:10 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 14:46:07 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANbFhmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMD3eKMzOyixPiUkoJcXaOkZBNLk5QUM3NTMyWgjoKi1LTMCrBp0bG
 1tQDRjgHVXQAAAA==
X-Change-ID: 20260820-shikra_dtpm-2bc494dd6756
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787217367; l=2497;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=M1IKsX35QWBCod2ZjRe01yA0dvDg1c9PPdXLvHebjw0=;
 b=nUs0SxXJeugvMzhmSrNmrbt5iU2pMSJ++tczuxPMl/G9grZCP0FV4AfCex0kUg+WDXCJvmnap
 c9Ta+AI72+CAMkuazBJMonTS1s3i1IijFssHIpSg2e+i4Cd4TARzoT9
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a86c5dd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uLInlHqCeYv2vpw5_MEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7bgxlHms0KOrIclXtmbKxhIZgIXTWfVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2NyBTYWx0ZWRfX6N0UEJIT1Q7H
 S5iEQ6wwtcccmc1td3j3g+yxbsrvsvuY4VzuNHCBkpOGJUkJ8u9kmykkO4JvlVyCU0wD/95M9nd
 GCwhSitut6LU88RAY72MdNkF9d/IeB2XW71cOT0gkR/GTrLJK2VrGr9/Cr0jdn1GfgP3Xe/mFjl
 sVxRemSZwjYK2JULH7BTwkWL6MQu56Jn0gBjT64lqt8wtyXBBk7gmieo9jNadLXON6Z1O9dSKMD
 bp4vt9sE8j8WApAy/0+QmXvsxU/gjAp1x2lH1thAhDGq4AWpAtLYxcqbnWrLE0MLNNQ8q9RpDMG
 CPNjXqbiMY9ldyXu+Mog5gGpeoIjLTmE3WwkeTtWPCuOcHBa4LEu11JcMAUGA81szZeLkMdte49
 gOIjLkHf7FkWGa2YIYl4Gq3tgwCqssIXVwNO1YhfWEgzuEa0zZMzAVXJFakGysGICYaYUoAg+zB
 9TRZQnpYT+tU3A2xMlA==
X-Proofpoint-ORIG-GUID: 7bgxlHms0KOrIclXtmbKxhIZgIXTWfVv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2NyBTYWx0ZWRfX6RYuI5r2wi4Y
 Nl3JxmiFo9QgZ2HAIj87yUyGfX8F8SwyP5M+yah3H+mB3CKTjPxDIXi+TM6WyYbTNv4PxTpHAjJ
 79IDBi3USPbJtJ0GJ/A7IChRUDmXIWA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200067

The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
connected via SPI5. Enable the SPI controller and add the TPM node
with the ST33HTPM compatible and a 20 MHz max clock.

Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
connected over SPI5. Enable the SPI controller and add the TPM node for
all three board variants.

This series depends on the SPI5 node addition in shikra-evk.dtsi:
  https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..32916e9df9d3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..bacdc7c77c2f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..b42f94708bfd 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};

---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
change-id: 20260820-shikra_dtpm-2bc494dd6756

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

