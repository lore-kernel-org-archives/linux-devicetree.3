Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B18242D89
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618218; cv=none; b=MszD1DHYvtv5U1m5rxlHVBLhlV5lWEv1weQDgoqHQ71WfwWo4BwEVAV5aYTwZZYdEREMaY+LaBxPs8hMsQHHsrQdLMVRAe1fUhGxfdpN+QwpI9aXexVtR/tcEW1I1FdyF7E52U0jDxmDfhZ9zKIa+N1vu6fezNoLJ2wsb6Dwm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618218; c=relaxed/simple;
	bh=QE5Vo+tXhZoRMEpN8VFT7VgyBkQW/GTn7CErcG6h7GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rH2qyZjfFjfC3cjyA8F2LM5iwgy8/HTDL5LpA96m5NXVZWRLaxjCJSiZHCcPIbRU8fLyW9TmPesyr3v21f7CpkD8Qhrg5bgQ8PqSySXyG/ukEqHKjlm+zZXjlvrJfmFDhZCot0Qp4bCkx4LuBpYk+30nrvo7XW1/HPfgLZ695Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TaytTpEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7nro/0U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TaytTpEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7nro/0U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxO5S3907945
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jPV/W92CbEnI19tVQYcQqPj5DvckWAeW5q5
	hPCPLKf0=; b=TaytTpEbEgZBsdioT4EWo+M533NnLrWbFl9XwaJkD9ag52+hN1I
	6UicUDAvf8hf695qpVK5zAXafBRJScQ7W0OflyQjvE8ZGOlYrpNUYrTaO2nbPMUd
	khWA7ejHyNfWKNuosX5tFr0PHCHpQxW97BqSa7j1w0WFElue9d1XNfNzVrVLlhwE
	1vM8Q1QMB+t9v04ZgE6K9ssQZtBavmVmgZvf78n11WDWGXFpTBJR7Ufqs7kRQ7uG
	w1oO2sSHacIVl8ufns0lJTDKq3Txi6J/yeji6f1bsBXbVCL6r0l/Vc2bQFW+vMeT
	XiosvRTADWMi5AGfx7t3jni2o2P0V28R6GQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9119n7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:03:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so20918461cf.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618215; x=1786223015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPV/W92CbEnI19tVQYcQqPj5DvckWAeW5q5hPCPLKf0=;
        b=U7nro/0UT4b1OsqssS6CVqziLaWRySVkCZ8hDY/mvExbQKTXOw+syLpdk87g0YmV8O
         VTyUiUBXEpa5CcdA+61d6G0ajE82Y2DkdRrqIBKwCvPtEMTZvhSffFk6k/YIO5OJj5xq
         76dLz7p0XpLl5LoEKgK+LY8WhnVzmX3gA4IhSHK7fIAcwW6BPs8FXKbZWqFmhRJQu3sd
         cUBK4uXsxBbQeGcqvBVjkl2FgWzZEI+A69b/JbZjEeWJ+4BGIppCCb4hBRBdjTLRkIe+
         pnsvh8/Tredlz4ODoQ5GVmFWWo9naLcdQA9XRUHITTZIJZE6ox2yaCBIYseOtdN4LKBC
         q2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618215; x=1786223015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPV/W92CbEnI19tVQYcQqPj5DvckWAeW5q5hPCPLKf0=;
        b=hceU6tG5t3yEzuIzEUiN4vV2UoaaGlI8I9zHvm/A58Tozw1xvUGzAHgqJeRjjKUAGV
         DtFDD2Ttnse1wg/ut3KBo9lUH45ECPcohTKcTtElc5aKjjczOguY2JU/c8ogVZJxmHgD
         FyS0AHuVDXPPNFRf2SrUKXF9B6i1kHyndC/aPX0eV/fOCmkeAKgFZnxs8tx82kSZQg9C
         eW4DfPLKjfnudTVpkq32DrCJvznANxUC4uxZ4ppf9muykuZnbC67rZ5ZXv4acRu2Y4OZ
         UaZZ+4IyB9lbLQGIB/NVv3zSchz+HkglqO7JUrY0Nqv01Idwv/cEM32f4+x/ExEGBhxY
         HnWg==
X-Forwarded-Encrypted: i=1; AHgh+RrtJfsfjPCNDbR9zduU0qTi9jr7YytG7xykIUzKjCKqAiRCEf4vmqGceRvR/swr9lQe5PywZ1ZP9b1M@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbw0KZsvG9yz7q8UdQLJXwjs0T54F5JAG49NWAe86kRWJnwrxI
	u5QsixkQo/BlcedYu/WdJkZGGu373Q0hLMGyqpshtjLCTrehmIrXLpq3PArr3+9eB4EGJRpIDTv
	x8mTbCOnmukGRbxgqlHPTk0Fpx6WrTa/ZBjOvTFn3pg7s0qlGlxV4KcuiOjzZj2r+
X-Gm-Gg: AR+sD13/sLwGj5W/opXmVzU1ORH09bqD2mxicPfp7CI5i+SJl1Bj7ItHEBPp2MN72eP
	TPEjbNJRToYhTwI9b1oga5u4joFXtI2XjhFDAgxWFVVTXg5hPlf/qdTu8pGqZ+e8NQr925LFTal
	QdJNT4ZAc/20f7MHuNvHhff+/0rb/rTAYsOkv+vypRAtPg+RfCYjueaETUhH7VZe+J2iE3mw/UG
	0j+rQcMBnMIeoiyCH/udCcFBZn06p57Q/K11radkaYH+mI4x3/0uPTd4LthbveopxOVh0BV5MiX
	L6n5KI0y+/dier8CbSf0Qerufotre6SxPwa3HtSeS9VNY5EClZy3FO0tMxHjDHT/SUHiz/zebRh
	OoolUbw6r0CU7NVPV
X-Received: by 2002:a05:622a:2618:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52b566b184dmr104101181cf.16.1785618215231;
        Sat, 01 Aug 2026 14:03:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2618:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52b566b184dmr104100521cf.16.1785618214613;
        Sat, 01 Aug 2026 14:03:34 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456262bsm17552251f8f.17.2026.08.01.14.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:03:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: renesas: Correct white-space style
Date: Sat,  1 Aug 2026 23:03:22 +0200
Message-ID: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9656; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QE5Vo+tXhZoRMEpN8VFT7VgyBkQW/GTn7CErcG6h7GQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl8ZjLrQnOVy35aiRnx8Hf5b2FP35gJmaeaKu
 wSI+St4MuuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fGQAKCRDBN2bmhouD
 18jCD/9IMfTJM2RWTi3Nix/Jx8kSFTENCjQA5W2S/riW+uWsNaBIdJFY7j10eIWJ7CNTn9dqEot
 fn/wevBR1SWNVUaX9O/JeXtVzT5cd4XB2XtHiG4WJCH6zCRd+1W8BZw2uJrRNLegx3LhzJbuh1K
 I6WgUA4ALpiXKBK74tzZjkjUcyAO/fJWAUshHpoqifNBg/AdKJtGCgwrBTsBl4MaZCV8PcZ0vJF
 ZcE0Nqe4csRYbjw+4Yh8fGa2lSbe/323yy9kPomQdoNkNLIcJaBmzgCx/ePFVev5leHjevK/GES
 7gOccx0L3GrCQuWzfmhauqoNwn/99nF1loOEi0WKhdJoo6lofcGZ5YZtNfmGaxo6FtP3kXRKmYW
 sRbPByqDg/Zewv3mpOl6muQImKh2cjiacttCJhG6aaYpSAcI/HNgAKbu6U4ngMgT4SD5D1tNU+P
 jqqqTzAD4gojkuV3o77xgu9s5i0yHsnONWJhEhC2/blSAv1iY14LhtAXq9I/WBEEXsi123PqwZM
 +IweqbVamUxcBs08zRcr+MOHemtiyUaOOqo3iVvZY++GQrBV7pkpbS1ryeKdExeiS/VC1/BEGEb
 f5bmA1agOMsMGiT/Aij0cw4BE24AKjH2dLQpf8ZkGR/ySY54RIgOHUoGew9u1gZazcB8yfqCxX1 8LG3aijLk119fTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX+ebVl7BpPdb8
 Zpo4Rx85cD7iFin7Aphi404iDSTnT2WzfCU1n4As+I/RQOiCd7mEiH9h0sioKagotMz5iaSZxek
 kiMUAckBJvoj8gqNyXc0I3a2akCU0Zs=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e5f28 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-sfej7HQ1qC3Hwc2jvkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Xly3_L0U3Do9a1u5bHsrrQh_3_aPSMrL
X-Proofpoint-ORIG-GUID: Xly3_L0U3Do9a1u5bHsrrQh_3_aPSMrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX5+8DNW1vx34Z
 6qr6vSKE0i5tK1UHUopFPH60W4yAO2sA3aT3P9+xAZTkACvJsL/3H6sHyYyRvZh7ftLDcaKvmv1
 urymaxhSa4XKU2DqD5Ijy6azPkJh/0QkUEGlF0yyNX5wbIoijE8MQgivXucJ/AErgsp6d+/Kf9A
 JxrqQSuUN04OiPWpVE8yvpZhxQfhBPTr6dguoHXkEdfXrNuzRzvlEQlqZsPMO51cCHqyD2Rp8Su
 xGL0BAIEK8mLsvdpYzGw2x38Ud+VdxttKr7GINKAHmD+gUTR71Chb/ahupo/4E6aGa8ryKR+OJt
 WfnBJzVTDQM6Uw+tifCZi6bx4Xc4lycvXpXSQhgAzu2bFmhlAJQLipvOBt3WTl6+AGJdLQFO0A/
 CrPKD9+QTc9JQeVVAQRorFGPCb6BjqOCTMVw9kjcGDBvypy8qSgzDb/Da1TrlzsgsdUrWxJpbJo
 g7yjzZmy30CGGOi4+Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169

Correct a few white-space issues, like using tab after ':' character or
spurious space before '{', which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/renesas/r8a7743.dtsi      |  6 +++---
 arch/arm/boot/dts/renesas/r8a7744.dtsi      |  6 +++---
 arch/arm/boot/dts/renesas/r8a7745.dtsi      |  6 +++---
 arch/arm/boot/dts/renesas/r8a77470.dtsi     |  6 +++---
 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 16 ++++++++--------
 arch/arm/boot/dts/renesas/r8a7790-stout.dts |  2 +-
 arch/arm/boot/dts/renesas/r8a7790.dtsi      |  4 ++--
 arch/arm/boot/dts/renesas/r8a7791.dtsi      |  4 ++--
 arch/arm/boot/dts/renesas/r8a7792.dtsi      |  4 ++--
 arch/arm/boot/dts/renesas/r8a7793.dtsi      |  4 ++--
 arch/arm/boot/dts/renesas/r8a7794.dtsi      |  4 ++--
 11 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7743.dtsi b/arch/arm/boot/dts/renesas/r8a7743.dtsi
index c697942387e1..4db849b5bc6b 100644
--- a/arch/arm/boot/dts/renesas/r8a7743.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7743.dtsi
@@ -456,7 +456,7 @@ ipmmu_gp: iommu@e62a0000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -464,7 +464,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
@@ -477,7 +477,7 @@ smp-sram@0 {
 			};
 		};
 
-		icram2:	sram@e6300000 {
+		icram2: sram@e6300000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe6300000 0 0x40000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7744.dtsi b/arch/arm/boot/dts/renesas/r8a7744.dtsi
index fed46345807c..1a85bc0dc5f3 100644
--- a/arch/arm/boot/dts/renesas/r8a7744.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7744.dtsi
@@ -456,7 +456,7 @@ ipmmu_gp: iommu@e62a0000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -464,7 +464,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
@@ -477,7 +477,7 @@ smp-sram@0 {
 			};
 		};
 
-		icram2:	sram@e6300000 {
+		icram2: sram@e6300000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe6300000 0 0x40000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7745.dtsi b/arch/arm/boot/dts/renesas/r8a7745.dtsi
index 5424a73562dd..78ff5a9f8f38 100644
--- a/arch/arm/boot/dts/renesas/r8a7745.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7745.dtsi
@@ -420,7 +420,7 @@ ipmmu_gp: iommu@e62a0000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -428,7 +428,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
@@ -441,7 +441,7 @@ smp-sram@0 {
 			};
 		};
 
-		icram2:	sram@e6300000 {
+		icram2: sram@e6300000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe6300000 0 0x40000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a77470.dtsi b/arch/arm/boot/dts/renesas/r8a77470.dtsi
index c61790e7667f..02df768bd2bc 100644
--- a/arch/arm/boot/dts/renesas/r8a77470.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a77470.dtsi
@@ -285,7 +285,7 @@ tmu3: timer@fff80000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -293,7 +293,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
@@ -306,7 +306,7 @@ smp-sram@0 {
 			};
 		};
 
-		icram2:	sram@e6300000 {
+		icram2: sram@e6300000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe6300000 0 0x20000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 8e7665501675..1d277facc611 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -813,46 +813,46 @@ &cpu0 {
 	cpu0-supply = <&vdd_dvfs>;
 };
 
-&i2c0	{
+&i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "i2c-exio0";
 };
 
-&iic0	{
+&iic0 {
 	pinctrl-0 = <&iic0_pins>;
 	pinctrl-names = "i2c-exio0";
 };
 
-&i2c1	{
+&i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "i2c-exio1";
 };
 
-&iic1	{
+&iic1 {
 	pinctrl-0 = <&iic1_pins>;
 	pinctrl-names = "i2c-exio1";
 };
 
-&i2c2	{
+&i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "i2c-hdmi";
 
 	clock-frequency = <100000>;
 };
 
-&iic2	{
+&iic2 {
 	pinctrl-0 = <&iic2_pins>;
 	pinctrl-names = "i2c-hdmi";
 
 	clock-frequency = <100000>;
 };
 
-&i2c3	{
+&i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "i2c-pwr";
 };
 
-&iic3	{
+&iic3 {
 	pinctrl-0 = <&iic3_pins>;
 	pinctrl-names = "i2c-pwr";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index 8ba9d85f1038..ccaa9b4af069 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -289,7 +289,7 @@ &cpu0 {
 	cpu0-supply = <&vdd_dvfs>;
 };
 
-&iic2	{
+&iic2 {
 	status = "okay";
 	pinctrl-0 = <&iic2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/renesas/r8a7790.dtsi b/arch/arm/boot/dts/renesas/r8a7790.dtsi
index 12cce9bdc449..358c8061290a 100644
--- a/arch/arm/boot/dts/renesas/r8a7790.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7790.dtsi
@@ -566,7 +566,7 @@ ipmmu_rt: iommu@ffc80000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -574,7 +574,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7791.dtsi b/arch/arm/boot/dts/renesas/r8a7791.dtsi
index 35313e8da426..3a447a18d038 100644
--- a/arch/arm/boot/dts/renesas/r8a7791.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7791.dtsi
@@ -493,7 +493,7 @@ ipmmu_gp: iommu@e62a0000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -501,7 +501,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
index fbdbcff1cbed..a63a28dd2bc7 100644
--- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
@@ -415,7 +415,7 @@ tmu3: timer@fff80000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -423,7 +423,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7793.dtsi b/arch/arm/boot/dts/renesas/r8a7793.dtsi
index 1ad50070a1a7..4cb3bf305ab5 100644
--- a/arch/arm/boot/dts/renesas/r8a7793.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7793.dtsi
@@ -468,7 +468,7 @@ ipmmu_gp: iommu@e62a0000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -476,7 +476,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7794.dtsi b/arch/arm/boot/dts/renesas/r8a7794.dtsi
index 7669a67377c9..732e99f830c7 100644
--- a/arch/arm/boot/dts/renesas/r8a7794.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7794.dtsi
@@ -413,7 +413,7 @@ ipmmu_gp: iommu@e62a0000 {
 			status = "disabled";
 		};
 
-		icram0:	sram@e63a0000 {
+		icram0: sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
 			#address-cells = <1>;
@@ -421,7 +421,7 @@ icram0:	sram@e63a0000 {
 			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
-		icram1:	sram@e63c0000 {
+		icram1: sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
 			#address-cells = <1>;
-- 
2.53.0

