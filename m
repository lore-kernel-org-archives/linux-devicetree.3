Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101FE2F8E86
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218699; cv=none; b=IbfHjnYX2Lzt/Jfg3wE5MMs29y/ivBlrGB7MqTEfpmRP21wjVI9bzDjltpw9jCvbWpJ1nA2kI9rH1uRYvxRjt7x7fqyDhRKNuF7VYJXUAqEg6qyfm1U+9OrrMTgBRqxknBEPpBmlQjWDUcA3qnR75PO5ziTX3E6mME1yM+03bVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218699; c=relaxed/simple;
	bh=etfiY+PwLIr0eh64UPPY0tVGl9GnSfqZZ6UXyBwGV24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CUY79/bv4pAzgzfQXQ5dTdoHVpPAFZmP+3wk7YAf09SaQol4CMWd+NynN0T8De/1WHNOtmgsdJNEOHhrdFFS5PUGT2+dONYM3PTF0jugfP9K2M1DvSPvrKtEtnFmcr0turjHCY4w6vXF2zEK2PjqnTfu1t7kQJSfrD4+zy9TyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSrOf79i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0jQMIas; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSrOf79i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0jQMIas"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PCPK2465318
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NIX1wKTHzmNkLxxGykTdyB
	F72vLlPWweEc8exmaaQEg=; b=MSrOf79iUxQgUKqfRr2DpIyUpchiTiGgAxO+hh
	hJk0rD/uOo6dHxzRrzfP6CA6biKZNsv72DD+3ePr1yoRR0OPjhFgzw25LKLR569/
	50lFdm8KfbG4HzDwWMSsFR6dBjC+ObLWBsLQTSMM744mom2XC33yxgB6GEqjaEtQ
	lVXwEoxNbxApAT9nv+JUzeH/ewsToQqTY/rkw8cG6cOnCagFkU+r/9GCll2QxAGm
	ERkaYW0H+abdLieu3KmgXiKpLnBJLwMMxYmTNMnJ+JyWOIFh8a5REmaQaGh2dNYy
	+HC8+rjHuBDfWp98t1U1rEE/Sf+jOuL1D2BiHxZETZZpXmEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29g8sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:38:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso8779455ad.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787218685; x=1787823485; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NIX1wKTHzmNkLxxGykTdyBF72vLlPWweEc8exmaaQEg=;
        b=j0jQMIasdba4/5R/ylznPhwpmP8wbUFqwDbTDlqtEQiEUyQwleM+nIjyDB6RIZcgOm
         TsAfITGuFRNSyE2O09v1457f+dR+h9RcneKofKFacJgSqQNC166GrA5qI+ho9CjlxVp7
         sJYAqj7/AWeVg0X+lmBZbIbkTUW5wgXAAZeU5wYsoE2Osy2CLFIr7OoegMSswqF5RBC1
         VelswJZkpXBZyJ5xowKa5IqA9+s1dIq+LCfrkK94B5pYP8bCXCFy0YjBfqFFbepJ14w0
         CU4ds2g9KY3Y7EamYsuAWV6FZ/wz0Nck8KjwrQRT0XGuSPJNzyzDf40UtZ/+YF21gZ30
         eXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218685; x=1787823485;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NIX1wKTHzmNkLxxGykTdyBF72vLlPWweEc8exmaaQEg=;
        b=scDxVDrdxuC6LqzSYmOAiBI2hJA5nRDBouY/CktOxznKRtdE4/spE4IFpRu0iUzD5X
         D3Bl5dK9+wqygc9KnUqx44jC92qxMIw0Ggdi1JhbEDO9XUjSEGliZY5Hu1f9sidDNM2v
         EvOrstyMBAlOjLACANbQLefGeWhcc3YBHvNLMi0I2pwGkPW2HRWJ/N+Ca0ROpqy56hzn
         Hp4+S0cK9HQ/0ZuyHih7wTp/lNt549zQTzhHtE1XY7Oi5VfogYVJAp3wd12bzL04d3HZ
         q+OodedNMib1hsYgNEZaQ/wutbJFnpEB3loGHGNs8ZwJIaDVC2C7eP1r0NN/UTD+qsMI
         IoQA==
X-Forwarded-Encrypted: i=1; AHgh+RraNRDHawuVtqf1guf5Tp8OjU2P9p65evWyMI/CCGKNg+A9g96yrAb01XAysGnLA+Hd6xTY3J7HrCsQ@vger.kernel.org
X-Gm-Message-State: AFuF++ntpgNzVomADO65s0i9ToNAFx7Agv0TgjkdzlQ851CEAImvmELF
	q6jRlBz5lANOw5r13QRMDTl7rk+xN7eBkRw20x1fu7t2q50si1MXg5lBR9R3XNnBaGdpKHufbB3
	VI2pKV47a5MYG+46AoIo5OtRWZPtCKFUT7oJb+WCo8y8QcvBJPJNzBF3zAywdyaob
X-Gm-Gg: AR+sD10uNfumx34IvGfyf9kTP6BVZua1S4dNeSIC/AUdrZjyWLYZzcNUgw0d+jCxn6i
	ps+svlSr1swJ4ymitbooVIauSAsfdfeEdDpA1wzo6ehelLOe/E10DzaZdf8QuWke6HLKnd/hz5G
	oZ88akXEpWIkp1RIjY/DxtsTxAOur9VaNZl8KFdMGUP1vVGDHr8w5mwOlW6NAL3s/fJQk327Fin
	Nz5VCp+AJbjVd6/P8RztBSNOzRDQqYds1Ng6DjVSCPHng65nwImh5GIx9GHuva7ohOk++0qANK1
	IE3HWZP+efghhsqT/wC2NpTcdvZe2uVvlzaq6vIMhGDApdpm8Js2Nz81+dN/tPwFk5PgKmQzXmz
	66bjkxQXPaJPbrlL2r1Rxt0Rti7MYFYOj
X-Received: by 2002:a17:903:3b85:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d61a0da51fmr66469945ad.8.1787218684746;
        Thu, 20 Aug 2026 02:38:04 -0700 (PDT)
X-Received: by 2002:a17:903:3b85:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d61a0da51fmr66469235ad.8.1787218684234;
        Thu, 20 Aug 2026 02:38:04 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1c9sm4343065ad.38.2026.08.20.02.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:38:03 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:08:00 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfKhmoC/22MwQ6CMBAFf4Xs2ZJSawVO/ochpqVVNlqKXSQa0
 n+3cvbyknnJzArkIjqCtlghugUJw5hB7AroBz3eHEObGQQXiteCMxrwHvXFzpNnwvSykdaq40F
 BNqborvjeaucu84A0h/jZ4kv1e/93lopVTHLbKFOLfW3MKRCVz5d+9MH7Mg90KaUvQkntya0AA
 AA=
X-Change-ID: 20260820-shikra_dtpm-2bc494dd6756
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787218680; l=2785;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=etfiY+PwLIr0eh64UPPY0tVGl9GnSfqZZ6UXyBwGV24=;
 b=uXnXPmSzXQnFPfP7iFN+KjxEikRsLy6i6R7PESDHycMmK/5RD9dshRFjSU/2HjJtANSMGwJyB
 8uSQvSBEzTmBCotLg2MgJ3alN+HOVOBwVMQNCM9m3+S3oxCosUwZIZR
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-ORIG-GUID: fKt-BAo6hQ83dYct4YPJnZJ_v_7n3K_T
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86cafd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uLInlHqCeYv2vpw5_MEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfX8fFmOxgUf/JP
 hr4HdQOhCti1YghFCjHUKGbSRqwXpEejp7sRno1uYdtC2JTfaUshPbteVqtnZ5Glr9Ti2nK8lGm
 pscki5Ayvkjm1FIluIAAHPHOEQD28pt0WsNb6veXDJeMXsdtL8O72LH4gMa4EdDI5fVkG8JOasp
 Iyx8IyPIGhNj+nURHO/VoVVvfWovRMcpuA480YjnHhbR1IuKHT8MZ5n10JxgVwLiXOmzVRbILRF
 53kJJuYhvRJJjYC46MQEmmMLsbN41gwNKALlRBd2W+WIYMLSERLEPXH7knegC/GlVMilmwVYRFd
 aHoQvE2Sm1P803B3aSUBL7uUOqYU+WouQKQ+vMwsa7gxvK0A7bGBEzHVNndevaySAj9boTcYGp9
 TqsSqcjFX7he/TFNrpgN38NSmymPH9IL7u8c6ygjf6jFnUgUOvI86+4iZq8xkKJLM/iH8bhtwv2
 EYYfJfB4cbjOp93cFrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfX/SH816OktSzE
 hvQMOtpSCbyDUFK2GRnnL8135tFO/NVkwaGsZDjSAqHnAS3o/n8uM6rHhHIpmWdaZL1IjYCaG7j
 g2+zGlCd8LIPxJzDidX0u9zg7Z0rDrE=
X-Proofpoint-GUID: fKt-BAo6hQ83dYct4YPJnZJ_v_7n3K_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200070

The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
connected via SPI5. Enable the SPI controller and add the TPM node
with the ST33HTPM compatible and a 20 MHz max clock.

This change requires SPI5 to be enabled in shikra-evk.dtsi [1].

[1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
connected over SPI5. Enable the SPI controller and add the TPM node for
all three board variants.

This series depends on the SPI5 node addition in shikra-evk.dtsi:
  https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com
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

