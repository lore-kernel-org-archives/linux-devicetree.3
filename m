Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB01FF1B5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047089; cv=none; b=jLV7CnrddtOZ0Npt3UQZISIPHOc5P4dCS3xrs9j3JQtBAo4ckjKijCa10H9lwR/CzOgSda6O/HGPDAIgzLkgq8bVcLhS8J5oApngRdKTTTnWs78XVYVqyaRCJjqnmjROopHiUIGHjJr1ruMvikdZiRYXysjEhr8aQ0mRHHMGUK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047089; c=relaxed/simple;
	bh=+ni5l5rxgVAQMIalE7RPp6XqvHp1u/AdEHjbOFe3K2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZXr8vMJbdajGK4CBQmEY9TSuzwbIYViYGFfFodNVZDl9c8b5y/mudySnNcTMNmq9F9scoBRWNF44/t7CqiDPjF4rCusol7wBYiC939gIYSsU4DDEuGKAjsWr3daQMOeV2Eg7OI+uuGDj+602FG2mPqNonlcsdpqrwfmP1N3Ze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccpzRGpB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBu6pO3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccpzRGpB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBu6pO3d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7Y8u216009
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=; b=ccpzRGpBIjCrkHNx
	pdJlhwTuHVNlXN858ujdGqdv3CdHTpMbORVPvmcz3B76pbGJ3aNoWCPoP/I082F7
	hbABrZ5BOgUn3sJF0YB7wQuWklXcailUF6S9dIwOvvHTVIzdCwxe3c+rZirMyCzu
	v2CnXR4lJ8mvzXH0rDKrJdo05D3txHNKCYehN/MmTu0gMxYUU5qlVcEk1Utzggx7
	/hIzzxuUYys2SccBb9DW/iSQtOh5T9TM35TISMRTyoX1lCBFMNsxLn8qRSd6zpAx
	6Yp4UmNefHFz2dI7G0C/rvmd1ROmcqUn6EHxTFI9NnB2TXoyFFi3hLvTEuwbUFRg
	LFIDXQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn99xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:26 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6bf7ab47124so856363eaf.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047086; x=1789651886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=;
        b=MBu6pO3du+k6+nHf5GhZUy9gO0pLrwUtlbcC/Qk2TBCKfKXWVkPKwnzDdmU/KQanjg
         54HeckjNJSM1KIFkgN3RdbnksLNIMqZ5jl4Mx55Pda30sbyFfxM2fYJOH4eGyehX+Z97
         cA00vS2Fbxk4sbkB5yGF09f2ViMzodq0azM1+RE3i8HctyAGKrmmYYcIaQ3lI2/ReMhx
         4dK/WTpZloUHu4WWZt2E61USTcdI1/NwoEbd0TA/MYzwqhePx47A3pNw7IwscSO4IlEr
         aFU6tmh9fgMJkcBr6VxG3LZDhyVoAFQ2WYkw0u/amCcGY+LbRXzumUiGsL7+dttW8LQm
         +/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047086; x=1789651886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=;
        b=cbTopC6JNby5MluzwqHOOyOTLdm2zd/Ce8nLs0mMXdaysxw9X64n4u01P0sMf7Exao
         4aD2+7J0IuKi5SHOkpjMzGY/ULVvVXl4pCJknlNUi9cyBUAJudU32GlUyKQX7OcG/eR9
         7q6W0RZsf9j0VaLJBr4R53Q3cxJI4tli84SQWMZGZV2Q0lqhR3ESnJMlx2V9fbQcauab
         /4Ry0jxlavkUJk3MC9ejQO/ILVDXq+YdWgbzV1jbJsl2R0PUwi+9Ddly6olPoj6ZEriI
         AB6iua4g/W3bIZD7EstkB4RKL5Gh4UiUlVkc/efnqkHyMe0PRHly1vwPZOYJf6xa1iav
         h14w==
X-Forwarded-Encrypted: i=1; AKwUvBwXj6bqy7x8YpEbgX+IhtSLQRK3UCOHo9yf4A6bf5gEDfC/wH77wgapSRpIEXzGLV1ShYg0gZe2lZNu@vger.kernel.org
X-Gm-Message-State: AFuF++lEozalxCLhiamenLnCZPHCwdl2YwzTjUziVWoYzYHh2FDpj1Lx
	b0UkQjafnr6d9l13F6Z1fcTqLEk/IBRIeS//oXSdRYbEujetS+Yfw0K6x8o3xWEj+FEb5OJSpGr
	mNIzsJpntrg0d/8G67VSZESLGFGYgguAjMiEQcRAmqD+wUdfNCyq6DuysP+dZCZCW
X-Gm-Gg: AYBFou2Zie1gr/rORMWRKPyFHV0SXVZNMhqnxV4RkabNArNZcSW1Sdera16joRJtt3K
	rltS5KaXVhnYRlRwkEtB9XQqfo7191hxQqHkPSZEiS8sWFWLyXLbAsip/z1XdAOEaJbl6rMRB8J
	53r4XkzyBxt+8IF08J+LYAuT6maR32bAQoNfJ7lbgus2rlWuAfDUUusC3au/3uq2Gd/gW6p6uKG
	B45l0dUvxmAMgpaVYWppgHbHpNDtI6QMeLH/2E7j6WxKDcW2wNYNh0oGEvvity3lI//Tm5xLkjY
	4VVvjz9MBPksVhNPZonjU7ZeLFjqsd1HgCsJ28IoC07cyVdcKRVv1KWcA/LRIi2lID3vHS4E+kz
	6QgKXptTB9hGW5FAWBuHbnqlvklfZR9bNsfY=
X-Received: by 2002:a05:6820:988:b0:6be:354a:1cec with SMTP id 006d021491bc7-6be354a2239mr5418086eaf.27.1789047085482;
        Thu, 10 Sep 2026 06:31:25 -0700 (PDT)
X-Received: by 2002:a05:6820:988:b0:6be:354a:1cec with SMTP id 006d021491bc7-6be354a2239mr5418057eaf.27.1789047084974;
        Thu, 10 Sep 2026 06:31:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:21 +0530
Subject: [PATCH 32/34] arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-32-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=6068;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+ni5l5rxgVAQMIalE7RPp6XqvHp1u/AdEHjbOFe3K2o=;
 b=o8llbVNuo2EUI5d2SSnQNkQENXvXWry1TINIbRNsrWw+6DR/tcZENa1ozG4gO3BpS62xAEn+M
 5qdUYo4vhSaB3UbeDhN+T6yh0rtBwW+5es0aY7GgTLegOG8MEUPbglf
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX9o47lf+crKtO
 hd8T9P+oHVI0N1ffa/W90/Y2LC5Liyp2oaAOB8X+/5mfiWIMfPTowPNgCiPzQmU+8GO/30baVJY
 Df+vLNb6pGWJ7mZwIOf8G7YgjQXvEtcQmWB/BPEi5Sh3wqU9q/qn4MomeiDn0LYCOV0c3Zpr5z+
 uiL8+az3IgjiTtBOWV4zmqnbgIvkc3GA2yU87v8ee0110BA5haIA/OmKZVd4s0s4osJNDyuX9ju
 LPQxdiB3jCYBmnEcMU9jVcoGmwtHYFqwqaUSv+NC0bFdLFFWNNCba3TDz0/fQ3xiyJGdXqjYC+r
 c0K2BMSQP/lrJp8qMQ79P4HowvXH1DViZ5IduwZWHhFiADsqn+yDX4oqFm99sDJmEklgIzvZmGH
 XOMsmrf0fl5sahhqM1MFuDvcbOnLzDNxek2gPfD4zKxs3mx8R+Ckt14Am+g4Qz18AEBWyDdLcxT
 Nr0AWEIIEmfRvEMPBnA==
X-Proofpoint-GUID: KoA2P9LuJQEOyUuGgJ6NcAaBBKZYODmc
X-Proofpoint-ORIG-GUID: KoA2P9LuJQEOyUuGgJ6NcAaBBKZYODmc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX5ZZjUIvZYSIE
 YOZZXFwQL312ZBrLyc9n/NMn0+sbcKBOWFUr64osF1JffGaDHgb/bSbMZUM/ZsbdZBhbHPRAtkg
 Zpbcom1ahjTqOs0AKh/g+XMgrU7GakM=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2b12e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hNZP5i6h11z2s_4BSHIA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100162

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
nodes to allow board-level overrides. Move perst-gpios/wake-gpios
from the controller overrides to the respective port nodes in the
board files, renaming perst-gpios to reset-gpios to match the binding
used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi        | 15 ++++++++++++---
 .../arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi |  5 ++++-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi     |  7 +++++--
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  4 +++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi               | 21 +++++++++------------
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 0c076852b494..ad435a13ba24 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -458,23 +458,32 @@ hdmi_ddc_suspend: hdmi-ddc-suspend-state {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2 {
 	status = "okay";
-	perst-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie2_port0 {
+	reset-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index a4dcc88bb01f..7a3f8afae22d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -210,12 +210,15 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l28a_0p925>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index 5b42c266557a..20b5eeef46e4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -191,13 +191,16 @@ &mmcc {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&pm8994_l28>;
 	vdda-pll-supply = <&pm8994_l12>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 2abcc733dad8..3c70a9be45d2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -278,8 +278,10 @@ &pcie0 {
 	/* Supplied by vdd_3v3, but choose wlan_en to drive enable pin high */
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
+};
 
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 818e5660df91..f3c004f02cfc 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1924,9 +1924,6 @@ pcie0: pcie@600000 {
 				      <0x0c100000 0x100000>;
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_0>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0c200000 0x0 0x100000>,
@@ -1975,11 +1972,13 @@ pcie0: pcie@600000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie0_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
 
+					phys = <&pciephy_0>;
+
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
@@ -2001,9 +2000,6 @@ pcie1: pcie@608000 {
 
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_1>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0d200000 0x0 0x100000>,
@@ -2052,11 +2048,13 @@ pcie1: pcie@608000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie1_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
 
+					phys = <&pciephy_1>;
+
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
@@ -2076,9 +2074,6 @@ pcie2: pcie@610000 {
 
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_2>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0e200000 0x0 0x100000>,
@@ -2126,11 +2121,13 @@ pcie2: pcie@610000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie2_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
 
+					phys = <&pciephy_2>;
+
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;

-- 
2.34.1

