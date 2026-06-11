Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8451A36BCC4
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154079; cv=none; b=p1ASV3+/fVl57urrLT0wcTex45cQnlqRXKp2ZVyvtfh25VELSpdZmUGwPjl1vuBZRX3AyV6TGeQ+h7BpdxhnUKuoW1ZZ3K+k6CINXY9l8ocJu31mH8jkzvFCOCHha7/AKSEA+mZgw01CbHSB8277fWdGbvERr7b9jT25fgFvtVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154079; c=relaxed/simple;
	bh=QBWtqPgdhnJI/7B+0i5OGO7653R5NO1B7RVCB1wNSec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txt7gY4dMpotDsf+TcGpJy7M4YIEEZx8L1qsCjsuLHz/GPXAmKaRZZimOh8xdt9d4D4lUcd9fauvD+9iXWmLx8ef8PVnwMZ5bOXP2RR8mK+NX2NF8FXNHU/7KDonP9ymoEqC8ua2xv0TXelIuBW9/kgcrgsJ2+ioAAgym8ewpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUjzLbKw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5rMtMlW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUjzLbKw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5rMtMlW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NXTR1614603
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDOyjVy7Gm6v5C3VhgQs/uW5jqgiFhnWKhAY4sqkK10=; b=hUjzLbKwJt17496y
	+MLxC2t4JMpdgVOHsGxRxxFVW3XukS2Ipq27b6NUnEBoCI7VTKiDg09P+6BKEvV7
	bdYia0EThMAzHfb7vF9iEGQY9ynv4lj9JnwXb/PezvK+R0TOD4KEgGMeh/U3TxFp
	ux+yo+o13Omp81yfzQ+5t3bp3jl5loD4vLZIKHQxCljM53KI4p9QXQINcZoRg/5e
	q2yx0h0hrVnJ+KrR454fuS4LenpmjixPx+pXMXk9cUN3vMcrLlqGkqoihdKFu69Q
	y25kEzwZM3vK+/SkjSnOfDDXkkYz6+FgucKMFYQxeknGrjE6x5fGIfmz0ZqnW5+u
	2sLM7w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hng0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso12290955ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154067; x=1781758867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDOyjVy7Gm6v5C3VhgQs/uW5jqgiFhnWKhAY4sqkK10=;
        b=L5rMtMlWLS4A25qi3hN3UWiNTELsscaUjazjnXlhTPpnMHX3HWSW7s0Nh3khM5le6d
         NNAv8gVdnC1pbJ/CP26cGSALLiibafrZThfkruhSuPSy1W/HY90CcNIpHv+GdOZ2V5ZJ
         5eUNG1GmoBVR6g12f3h3EJJl0l0m4Qs6ySnY3HvhJboCerl9dZW2pTJq5jvibW53f+HT
         Gf70fIQS7IZnHXG4FtQfLvbFJ4qXLOLeluJ/pQIjywoK3YUAhPjCLCLTiA4B7Uo3FNVx
         AdUc/TrzO2KHzfRoCkaMgOuzpZd8drQJDj7uUI3KqNBJbHn58zsPcn8qkaPYQUOSUhMD
         T9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154067; x=1781758867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDOyjVy7Gm6v5C3VhgQs/uW5jqgiFhnWKhAY4sqkK10=;
        b=kS0E5I2UHVRhqJ9LhuTqea+3zBBsGuAQ2yu1UF3oDeA+frY4+Y5I0WM8yBZZC7GI1b
         VKzJBC8XkyzwkvIULAeDgbll+cQU+1bjVzadpjE0HOH0IhOSk7J32fBEr3EojoXe3Qfi
         Jxtui2UflS53bss+ZBWQHoV+3L2Orq+4YEIxsEm65jJ//HcqrVrwrfO24Xo5pST3ZeLE
         agovJ8p1tq8t0Ias8AShgC6brYnFsKwNhIVB3n7iiEJ2K7LYCe6uMn2SFNjU08Y9cias
         1Sbl6/kWrJEH8zgHKXydP9+6j/AqM2wTDG2z/3K7lJxCr2p7war+cqCDxHpS2qXN+VfE
         A/0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/DAbUcjeNNVP/oUflJUcySJgpDKL9i2D3sicO6ZQnAwTWFVf7MAoq2D+8Do7GnoZltfS0EQ5L8MA2o@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6oR7d26tprznR5aIZ0GFUATwJvi7RenaX8WZ/10D/gqujC4eG
	XCVQ3V9y4s2iZgJJlE7spyLK7CWqSmmloxjRIHoY8HOBNBst0YtnowHIwwA32+M0DqQ2XSAWiRe
	Y0l4GZ6fug9hTtzJY4SMekOgzeL3h/HiMOVFbavEDYISWrFsir7UjdHISddguQdAi
X-Gm-Gg: Acq92OEy8zbSCgXuzS0jf11qfd2UmpouTmIpBP0KPRjokaZFUW4s9QmcJe5WVtN+AHL
	9y1ND3u33zq2267F8CxRrEbsR8PBEMTQd7zPKqkoenppTEzSvvlUd/uSBtP2DHLt331JBqqestU
	b7zA+gtHMkihHO0MpRpvmOzDBHGyzNic/SMPnP8J0X5ubsV98QxfULEjW2h/zsq4r3KzBs3Owhq
	HwWBc8hUDI6TYx/fpFhuVS7YISeXGJpwy/C6DhrSiNz1g3im6EXTVg812Y052rl5e2V856Q3S6R
	TBG/3SpONr50N2g7L7p552u8rU++AZeVBymbQdsrbGcowg51hzsnxEGlo9nvgO/pcd2DG+GaTaq
	bfyQ0x4Op2pSl8HPQqCz8GNNN4w4S/fMEBEyqYU9T7C6Xv+RLPrp3FZ7Ciqzfzd4xnX8=
X-Received: by 2002:a17:903:4b46:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2f22a9f06mr14030235ad.25.1781154065146;
        Wed, 10 Jun 2026 22:01:05 -0700 (PDT)
X-Received: by 2002:a17:903:4b46:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2f22a9f06mr14029755ad.25.1781154064647;
        Wed, 10 Jun 2026 22:01:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:09 +0530
Subject: [PATCH v2 33/37] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-33-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=6736;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QBWtqPgdhnJI/7B+0i5OGO7653R5NO1B7RVCB1wNSec=;
 b=pYDo5/4wLJ8WFVBfC+n+DS6lkP3DkN6ZbIumLStw5B56e409DM2lAK6jDVDFi7GioYmHRpnlC
 9WGnMp9bg+TDIkREA/uBh0zfRa7pfIFvRgSYpuNKXI0QqGrU+i6DX46
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: xBSZUmATcQ4NQ6lb9YIxCIViE6bq7G55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3hJjNHm9vqaj
 /GEBbnhfCIJEv+TsbgDUbzsIzPe+GBzfYWpKJHGZsaP82z4tp43GKqO0kAMIqLOCeIgaPI9h6a9
 Xewa4As/vrK16w38l4mcB1KRKPnMp5NxPH9r7Zs1swyJXWs78Rb/5irbiL0WD9a85Ndif8KhbGh
 XaScUDUDW0uxeTdYyFUPLzaz63UrzExO/lWZTGiYUUA/2KULjRRiQtqy2xKJ48SH3UNI/Ius/9Q
 SEEYrXFzwzu1+Jq6Fuua3WsNFVU+iSUQoDXJa03m4j7rDtUaJ3wBXXvQ8nJ6i/qcbrkBkZ+8Aeh
 hyU919i8/GEokTnL9lkH5lTFmSCoTK9n1l98yaSSVlUqp76F61htHS3ZyfDZgA5xW3VD6oiz5Zl
 UaoLBkyupLUJ370Su9HNr5BSsVBndJRZCOpJv4JryK2ejB9RO539DbrT0aRJDC4N/lU0rX4jaR3
 8C8SZiT4xdP4J714QAg==
X-Proofpoint-GUID: xBSZUmATcQ4NQ6lb9YIxCIViE6bq7G55
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a4113 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7SwbUlbDHKIDUUknu0oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9Rxt9IKDUYJz
 WApn21RrAsrWaJxh9EIHYIkXFrQD39lXyhAX+3lnblzSwLXZcjPZwDCFU+HmVJpbgtKOT6eR0iR
 MwDCn8yeFofHmpC5KAgaB6AxgFd63gA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                  | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                  | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                  |  6 +++---
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts          |  7 +++++--
 .../boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts     |  8 +++++---
 arch/arm64/boot/dts/qcom/sm8550.dtsi                     | 12 +++++-------
 6 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 4709eb34521d..1488ff8b7bed 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1003,9 +1003,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1013,6 +1010,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1037,15 +1037,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p9>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 7703ebfc1b67..e44f6a8877bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,15 +739,17 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
@@ -756,15 +758,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p91>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 5ce81ac3ab4c..1fe6a8bf0fbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -903,9 +903,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -913,6 +910,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index cf4e4e9d9e26..0ff9f3850b0c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -510,13 +510,16 @@ &i2c_master_hub_0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index d23fe714bd27..678e58694b8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -584,15 +584,17 @@ cirrus,gpio-ctrl2 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&pm8550vs_2_l1>;
 	vdda-pll-supply = <&pm8550vs_2_l3>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..a8eccaebcf2d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2033,9 +2033,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			operating-points-v2 = <&pcie0_opp_table>;
 
 			status = "disabled";
@@ -2100,6 +2097,8 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -2213,9 +2212,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			operating-points-v2 = <&pcie1_opp_table>;
 
 			status = "disabled";
@@ -2288,7 +2284,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2296,6 +2292,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1

