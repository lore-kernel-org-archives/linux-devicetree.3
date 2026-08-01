Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA2242D89
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618234; cv=none; b=JANRBwFLR+167z2UNT4ykCjtjC8vXzMDcfKP7pSqKypMmpzI1LPi/Xkgy2zoc8lB/4wMixQOYpgQU3KmmRMfT7igv+0jNd07iH6dP6gJL8tPI9sjA5tx59P6o4ZOJ0LHB9+qq0PikHMU64xtfK6TNfNM84ahRlrcsCEBqoEtjEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618234; c=relaxed/simple;
	bh=8icYOIciXQJbqjsymh1gv7pwq8X/+z3ZUzlkXheap/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFoi9ZAddZa3JZrGGwGcv+8YyLdDWrueo2ilTvaunH5hkOMLOEH5c/95XKgPLu+J5Z0Rp9abqwGgfU64CN8k7b11bDbVVbuE8f/17F3oBn18n5jB3d8aod0FfXIQoPUheY69sk9D3rKtdFWFZHCusK2502hgvMPddwXcX88d7BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuqsQKNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSImt6rU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuqsQKNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSImt6rU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxbMi3562636
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nVpB27mNjYgywm5x8b3G1uEA/Q02HqWEHi2
	q5/nWi6s=; b=EuqsQKNTR5b+LnQNZuN7TkbdXZo6tftzjlIEMrIu0zFQZI6110J
	CXa3F+Ez+z+YoHuIF7XGlsouvkvE5mL3xrmeVV97y68JptCPDMcbn7AR+HyVv3tB
	gOdK6HqwL/zkF5mkZGZGflL8Gep/RW5yRCGieXvbTk2XHkvFjqfPq9oJb3hqI0NM
	uqLtuQ+p/0qIPF6xCDnidLC6a6E7+nUsO3NUTdXVXHIKkaw+8RvC+4MotN67R0bx
	Km4byLM/4ql5axid1adP6QQQBlkXRui8z1OVdLUdtZcHY4s5ejXMnawMozYhiehT
	VYEEQLhzVsXrvVtu8UEJq2eHDIYCsxNUi/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9669mts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:03:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so23568191cf.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618231; x=1786223031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVpB27mNjYgywm5x8b3G1uEA/Q02HqWEHi2q5/nWi6s=;
        b=VSImt6rUpFsXWEfWKHKWvkRl4UM/UlEh0CkTvvulYEleqLvVjvV+yKCCi255sbaPpZ
         4CfNhwLZtu5BPw+lNxv5y8g8ma45bkZegi55TGIn0vcWq7ur7BUGpkQQK270PDLSe3ad
         DG8Lpo8Kk7rsBOrEMXp5vxapVd61QzgZ/gO/aDP67KFZbAc9kJMPjWAMMMIWvTDu9GRy
         vd9pS8KOhDYcGURLYH+S8BJkaStoIKMnwLgRH4OSxAx1oXEH+aHFYMC25hDd5MQWF1QZ
         9KR0aRCzv8Jqz7IpmPCLkTTo3RHb4AgAl/BZfcsibDv3i3NgftNvIoPKbea7dyDXgoMT
         8fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618231; x=1786223031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVpB27mNjYgywm5x8b3G1uEA/Q02HqWEHi2q5/nWi6s=;
        b=g5BAaTfxrwRen6a6NQB+ActOVeimkYpX9rWL42dT/b/QY+GskTd++A6TgEjy6IdWh5
         EsH+IXcrcBS+sxC8KrzjMrlLmAlu3bvZ5rVOPYsuCSt7tHA5A7JV1B0NrrDwNrvIVanL
         5RXxGq7IMbP79tGbgHY6WyeE7Qxfqa40PjOqH2gOR+nkIItOyMgGPYf8nFHmc6RUXVyo
         D0UbWSh4Ly7wGe8w4He/8wCxer+Jih6xTkqqLJ5296/iQenegqu+r2/FeasxxECllfXA
         wVdZqremYqDJ+UUQmsF/VoqDmi3OenAnfrkFK19ZdiqnxjX9b9tV3YsNkB6Z08ghS0Gk
         uEOg==
X-Forwarded-Encrypted: i=1; AHgh+RpW2dvFFDSNbUgaEWpOG+kYgD+ExORiN8m3HhjP35ERSv4Eif/0KWsIEvH0qXYrqEGoBRs508NMjB4x@vger.kernel.org
X-Gm-Message-State: AOJu0YxOPZMj5zX7JFkji20yP/2PI9nvni+6HS4twBofMQf1hKiHQjZ5
	UpV5hR4c3ElzXQHc0U8dmia+fqZHiCVOmeGk/7Zr8Q9PGRUOXRySiD2RE+1FG9bxa3HfBwOWc+j
	lmRK4SqG2D7zJuHvW33PCaf9QcJfXCGFwUj8FdxLNbnWcN/xfE9fxEybSR3N6FKBp
X-Gm-Gg: AR+sD13MfXPgetw8w1r5+jHkQAmmGXTNPXTFsocy4+fkJLqfhqVD+6bvG7FxxdUO0r+
	78jgN+BBbnKLMzFW1gDJj28F8hd5rmKskWcIJCDKpQIXiIsQUrPz0xF0OEirUqzrO3uiQTGC7Q4
	TifjEfYl7wTo6w2TGSBCKMqLb8/0YbPWGB5AmbNWvWZNIYBADzKjzpRmmcsevXPfLt1Gbaf/a/b
	SwEQ+EbarcOHS2pvYSGhLJbyVwCLX1ssbn6I9mG4gUIP25j1cU6Qz5S15aolYmqyk+gy0mM9lPx
	bcYkKzw4FpEeofUFROBPSzG7B3/NXIyD+GLU+92xI1GBEJVlUuVDk2kdawaYn+a4utY2qgfkTdT
	4Td9dOgAaymf1tX99
X-Received: by 2002:ac8:7f0a:0:b0:517:7e26:36a9 with SMTP id d75a77b69052e-52b56832ef1mr90278441cf.39.1785618230792;
        Sat, 01 Aug 2026 14:03:50 -0700 (PDT)
X-Received: by 2002:ac8:7f0a:0:b0:517:7e26:36a9 with SMTP id d75a77b69052e-52b56832ef1mr90278031cf.39.1785618230273;
        Sat, 01 Aug 2026 14:03:50 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b4bdc7sm50432815e9.0.2026.08.01.14.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:03:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Correct white-space style
Date: Sat,  1 Aug 2026 23:03:44 +0200
Message-ID: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9047; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8icYOIciXQJbqjsymh1gv7pwq8X/+z3ZUzlkXheap/w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl8vi/gWAQ+u7fDCqxXt61PEi7M9z/l8JKlYu
 4AFTcmsV8KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fLwAKCRDBN2bmhouD
 101wD/4sZqMbua2Uk6a3uojhA2g++iGSjRq3owpLtdXwYaYgILn/r7Lyg1LMwh/G3ut3IPNYfjG
 wOMinjBFFOMD6idgNRU0sWeLv3gSDdeErxQkK+EnHcyVWc0hJrabgFMa+vkFG4lgZ3FzEMjSxBm
 YMhLIqaBeZD64cUEUl9mi+M79NzVBl56/rn3CpM07kVT9UET69lWQcd7UPTb8Nz9jFnl5bIvLp/
 DOQ96Ekpj5gKU83iyiCEwzJrGCTdb6oRhwSMckBfuWFG10375Oa002fKxA0zOg/R8M1P7SQORwI
 uR2PIw8OzxSnBxD9SMxIWCW7/pqEdkut49k+po0MDqSB26m8zRpKQpzyeb6SUcxqpf3q/bHUeFD
 vqCMHAPgmQL57Qh8zTe145vU9QaqszR7A5ni262GqrMLYTKT8oZt8qoK/Sy0jeDOaib9JZ2t3ud
 WgwxGSxKSHG6THHbD1JzVCMC4NJvm6zt62bj0bJwURGy9E41wNTiQtGgs7jLPmpisFZtm5yHD3A
 gJbRByjoBj6l/weeQVUn2G+6NYOAOq68+aDswBJg0k5ucPnRqw02nJ3Bcja5L3ZxIhyJdfHJbrS
 4M6txfvxBgCzZ6ZTJYlf+8mSQ7B3OBuGJEHZWM3wJNpibnpTcmI1qIYMK6tuIBzVe83T+SKqNS8 SQoND7cHnXqif/Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MPLeNBoP2wkCll8_CW5nxUKa8I1TifE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXxDSOk77KD3fQ
 hTfSen6Ozbl/cahAZ4oWKoPo7M/62gTY/ZFKAfulaPDygMCf9D8gnTNT7jkfg3g7hop7i3+8EWs
 DQAOu2AKyoJ8Dbw2wEi1p6P+cHMYvlCNj/N9F11k5SWz6DJUDtICpDJV0LXfnZXrFJc/ONjK9oU
 7Pak5Lg7wsF74yD2I4mf0/HrtY5kM+mirsDLEzKdtMlLjIGuT1qofumyx2HeWmopU+eubxg6bQJ
 wR0mF2QGpB2yUB9wLAQhrnmbPKmcmdzVrjfAg1CVbBcgvidasMZqK/wbvagK2B9XhoQbRqkhCrK
 eMNWffvJtxW41xe5qAAop+QJysWogQLjNr6t5Tx39JeH25RNLNmbfCIxrvboU5+DbOW6SAcLSiu
 Ysb5M8PqLv3WomrNo7nHzKGs+tVaLuVLn4j15czwXLIW03NeDTuBQLJM08S1SBUJL904881V2pZ
 8lSvI+i126zN7zUPQeA==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6e5f37 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uAbLrKBG7wNs62mBha8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: MPLeNBoP2wkCll8_CW5nxUKa8I1TifE2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX+5Q1/T7ubiZJ
 G8jgcDKixV0POHVme1YTpTjGsvoJk/XC8twp3FfxC4wG5hUt952k6d3gVQAh4al6VmPEaR0/b3T
 Stho5zrxHV4O3cIKbyT3SrplfUcoqOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi                  | 2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi                  | 8 ++++----
 arch/arm64/boot/dts/qcom/hamoa.dtsi                   | 2 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi                  | 8 ++++----
 arch/arm64/boot/dts/qcom/monaco-evk.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                 | 6 +++---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts               | 2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi                  | 2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                   | 2 +-
 12 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f0b6ae9b8152..b258f640715a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1917,7 +1917,7 @@ camss: camss@5c11000 {
 				 <&gcc GCC_CAMSS_TFE_0_CLK>,
 				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
 				 <&gcc GCC_CAMSS_TFE_1_CLK>,
-				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK> ;
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
 			clock-names = "ahb",
 				      "axi",
 				      "camnoc_nrt_axi",
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..4e4781adfb15 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2359,7 +2359,7 @@ usb_mp_hsphy0: phy@fa1000 {
 			status = "disabled";
 		};
 
-		usb_mp_hsphy1: phy@fa2000  {
+		usb_mp_hsphy1: phy@fa2000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
 
@@ -2524,7 +2524,7 @@ usb_dp_qmpphy_dp_in: endpoint {
 			};
 		};
 
-		usb_1_hsphy: phy@fdd000  {
+		usb_1_hsphy: phy@fdd000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
 
@@ -4437,7 +4437,7 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
-		usb_2_hsphy: phy@88e0000  {
+		usb_2_hsphy: phy@88e0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
 
@@ -6733,7 +6733,7 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
+		itnoc@11200000 {
 			compatible = "qcom,coresight-itnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..424a3d1ae27f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2100,7 +2100,7 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 			};
 		};
 
-		gpi_dma0: dma-controller@b00000  {
+		gpi_dma0: dma-controller@b00000 {
 			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x00b00000 0 0x60000>;
 
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 74699bc3eadb..03e976dbbe7c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -1865,7 +1865,7 @@ &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
 				status = "disabled";
 			};
 
-			i2c16: i2c@198c000  {
+			i2c16: i2c@198c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x0198c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..ac3dbb393108 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1029,7 +1029,7 @@ gpu_speed_bin: gpu-speed-bin@240c {
 			};
 		};
 
-		gpi_dma2: dma-controller@800000  {
+		gpi_dma2: dma-controller@800000 {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00800000 0x0 0x60000>;
 			#dma-cells = <3>;
@@ -1562,7 +1562,7 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 
 		};
 
-		gpi_dma0: dma-controller@900000  {
+		gpi_dma0: dma-controller@900000 {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00900000 0x0 0x60000>;
 			#dma-cells = <3>;
@@ -2023,7 +2023,7 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
-		gpi_dma1: dma-controller@a00000  {
+		gpi_dma1: dma-controller@a00000 {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00a00000 0x0 0x60000>;
 			#dma-cells = <3>;
@@ -2516,7 +2516,7 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
-		gpi_dma3: dma-controller@b00000  {
+		gpi_dma3: dma-controller@b00000 {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00b00000 0x0 0x58000>;
 			#dma-cells = <3>;
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..8d275ba2daf4 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -809,7 +809,7 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
-	expander6_int:  expander6-int-state {
+	expander6_int: expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
 		bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 80a0a09e055d..20a43684cec0 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -818,7 +818,7 @@ data-pins {
 				};
 			};
 
-			wcss_wlan_default: wcss-wlan-default-state  {
+			wcss_wlan_default: wcss-wlan-default-state {
 				wcss-wlan2-pins {
 					pins = "gpio40";
 					function = "wcss_wlan2";
diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 26cc86d12f72..f24b385e7e6e 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -411,7 +411,7 @@ ecpricc: clock-controller@280000 {
 			#reset-cells = <1>;
 		};
 
-		gpi_dma0: dma-controller@900000  {
+		gpi_dma0: dma-controller@900000 {
 			compatible = "qcom,qdu1000-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x900000 0x0 0x60000>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
@@ -627,7 +627,7 @@ uart7: serial@99c000 {
 			};
 		};
 
-		gpi_dma1: dma-controller@a00000  {
+		gpi_dma1: dma-controller@a00000 {
 			compatible = "qcom,qdu1000-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0xa00000 0x0 0x60000>;
 			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
@@ -1191,7 +1191,7 @@ qup_uart7_rx: qup-uart7-rx-state {
 				function = "qup07";
 			};
 
-			qup_uart7_tx: qup-uart7-tx-state  {
+			qup_uart7_tx: qup-uart7-tx-state {
 				pins = "gpio134";
 				function = "qup07";
 			};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index 8fee8d7a7d4c..f6919e051312 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -184,7 +184,7 @@ &secondary_mi2s {
 };
 
 &sound_multimedia1_codec {
-	sound-dai = <&max98360a>, <&max98360a_1>, <&max98360a_2>, <&max98360a_3> ;
+	sound-dai = <&max98360a>, <&max98360a_1>, <&max98360a_2>, <&max98360a_3>;
 };
 
 &wifi {
diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index d98ec4bcfd87..c45bcac8db12 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -392,7 +392,7 @@ &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
 };
 
-&mdss_dsi0_phy  {
+&mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5b_0p88>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3496f00ac4f5..b5ddf6acb9c7 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -462,7 +462,7 @@ gpu_micro_code_mem: gpu-micro-code@9b09a000 {
 			no-map;
 		};
 
-		spss_region_mem: spss@9b0a0000  {
+		spss_region_mem: spss@9b0a0000 {
 			reg = <0x0 0x9b0a0000 0x0 0x1e0000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740..ad93b27d4760 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -794,7 +794,7 @@ opp-384000000 {
 			};
 		};
 
-		gpi_dma0: dma-controller@800000  {
+		gpi_dma0: dma-controller@800000 {
 			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
 			reg = <0x0 0x800000 0x0 0x60000>;
 			#dma-cells = <3>;
-- 
2.53.0

