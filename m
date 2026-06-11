Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9F83921E7
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154092; cv=none; b=h2ardVkP3+1XkuQHK+wsqEkNU2LrK1e1SU9wMCR3XdXLyANkScQe7e7KZi0YbPSjHa+glVaIsDRKnHxQqmL7F66H0d2bgLML4XkAYdb317U1XTOmkO7H0Gq8UrDFfgRDJxo+BfzGxqqZOJxSJKeEtEgP9VcfQaE6U7MH9vL6/uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154092; c=relaxed/simple;
	bh=EvwFjMdGg48XGE97lgHVA5dnyAPOTMD+iOwYzPm4FBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRr5FMgJBUeLkV2DOZzUakbH82AFdr2WmuA5g5U9nEMRlrcXtHRTbJptIalVzBggm/cZP71WzOHjtjo7zp2PUdksivAiscm55S0Ry5nWI8nRsDpk0Ucp9QW33IJgtHn1DbUxwuepn8o413LBIu2GwXXGFJDqRSuKsdpcO6C+DiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGElZE0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSgEgjK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGElZE0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSgEgjK5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NXbW3202802
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDZBgmLDnN0ke8G/yPGmYz0zKi/JoSa4wNV1jrBM8aw=; b=FGElZE0GW/IKRsYz
	fVkb+gQ3COp0Qrumx7V6zWb1DXCUtCicZGhrkaDLwxctvf8obJRhyVgzU5Zt0GmC
	7WIUeqO8dKSkZUZWoa8ZaHgoj8sWP8wglaAL8uR9+RdZ5y5+dV405mE5MBnjS/xl
	Omt0ZbAIC6eHw/VF6/F4iRFf3665LRb2/Kms6vlpWukOEsZadkaz5kkfuTdQQ3Uj
	h0OGvmA79kNvmQ8X/4/52pKsYTccri7UE8IDymrP+1dm8ybHJl1JpMGrpXjPdS6C
	7Pi08f0nF61KQTKBIMi7WLcKmOB52XAbNFhzqXtHewhOXOiJHIpMX9hdzpM2ZCQW
	YaL+3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6thpfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0d0516ad7so75708635ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154081; x=1781758881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDZBgmLDnN0ke8G/yPGmYz0zKi/JoSa4wNV1jrBM8aw=;
        b=CSgEgjK51otL+lY7Ub8hl/cSAgZ1nfgR93/WtZ8hJr3F7E9saz8YbHQ1gMgPUXdS6b
         Gg2/rLEbRHQbe6/bdUcj+pR/jmL2aLMduwllktAgyMhlGPKJbmZ6W+44eEke7HmXYsQQ
         /xtNCeKLvveVZMIIrbrQw2o//cl/u2BySxiaUxOU10EpwlpBZ7wL5OdykX96LzYGaXeO
         pYLvvrb7atLh6RozGt0i/9XJYFn+or+qfPHoKt0pnH0tL2s4+DYx2BRZZnzkc3L2tVXm
         mzSqENrQOs2ilGQOYgLoqXsrylFU3RJTCz+w0vwYwrjkXoY4pvD0BBJsa1tgb4AuLvDk
         YZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154081; x=1781758881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDZBgmLDnN0ke8G/yPGmYz0zKi/JoSa4wNV1jrBM8aw=;
        b=rHrvwMFxPT3uhvIwwzIjqaJPB1iHknGmmSEiSJRFbFgy96W+gZE4RmSgZHPPyprYgQ
         ndgHOfrwcmTIcAVPM6mOcM2ASChEvDk2mU9YRPyneIzkOR1Y700r5IgVOMS9powMT80F
         GYzgiG/wJ9QayW+kgzKZnO1JQolrA52JpZKl2n8Z729upMtGxa798nxDtmuC6vmFLTmK
         NKc2eYxzTUzxPF2PtVghwOCeAVc81L5/yJ5/xhQ+PFJPXPzfTwm8Haan/nreTTuumwTf
         f5q1OxseNVZi+dbWYaXj7nCsqgTSYnb4heJ2jXeQd5fJutXO80aaP/r0tk3OGpX5dV1w
         fpBg==
X-Forwarded-Encrypted: i=1; AFNElJ8HFQkzxquqRERsQeRQtZcE9/PwBrdCEojIWlXx+BvDHWMMmHjdDA5sQfvVlATktVF44YZFX4uZv/Dg@vger.kernel.org
X-Gm-Message-State: AOJu0YwSVeH99c+ONy/489iINnB2ASkPlH+iKdfyrgX6POYBVo9qQDMG
	cwbvmhRR8SHf2hCG9GQhmaQJy3+PEq27B1WFxUkLIeZDWHBej317uZ+8pLCc67vl1uisr2oheIf
	C6wY9/bwKR3IPW5kxGputyNwU5hjvVmstTj6mcdGBYvDiOvHY664B4KWDmIY591dhMVFoSb9w
X-Gm-Gg: Acq92OFm2Iyffv/YjpBoPT6wGZb4RPAK3lmE/rzZ1q34o4mNoZiSUsxgiFQk4Vfc3V6
	ng4tQRUpiodvs7xyTXXZ5Ef2MligUXFE9J3f0UGg6dpkuCTf99ijyqLWLWQJNC5xBUA7Z0TXGQu
	dzucxQ+qrRZDiGKfxI2LW6CP8GuR7h6PP9lb6mgXtbMw3J9xlcKIHH5t+ssz16NEdnup5AwChpW
	MpKAKGfPaSKBS6nZxsaKFpYuBaeQo33Vg2y5F02OEh3AmhCnyMNiENPuIPh6jlxYuoP/l39a8AK
	bx+sRxJWGt8TMgD/A1rX3BH9EnRRSLxRjlnboM3PycK9jCR7tVOBqoz2LWS8+zLTFLRhzbQcU3U
	oKre8Uf1nLs5nR4dBrDjiuZv1Gds40LEKy4xxZtPiLf0uFBPH0KZW6AgNysc7P/5/dkQ=
X-Received: by 2002:a17:903:1b68:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c2f40da30emr13207245ad.33.1781154080875;
        Wed, 10 Jun 2026 22:01:20 -0700 (PDT)
X-Received: by 2002:a17:903:1b68:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c2f40da30emr13207035ad.33.1781154080394;
        Wed, 10 Jun 2026 22:01:20 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:19 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:13 +0530
Subject: [PATCH v2 37/37] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-37-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=6223;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=EvwFjMdGg48XGE97lgHVA5dnyAPOTMD+iOwYzPm4FBM=;
 b=xxeB4yNR3tnG4KC40NUTsaGQZDOh3iVyYfhElkuhIIIRR/Yd40vNPdPMg1IYKlOmmnxM6LqZD
 A+1G/G3pKHFBsDAHdScI0c5CNu2yauigay8Z1qQYJ4Qw5WIPWkhqTFE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX925XSIttz7ZE
 o2wUuOwQzCU9B2Z/3yzKPrSkmpG5+WSOXsB0m6i2X9zaHNkRAGNB55TrRypwjcgOTgaFn2xwFk6
 itWl1QaHKrWC6dU/aC8EqGe9JON96HDEt/mUoCc6mCUGTlXlc9JcUzdAESTLTvC92Kfb9GuB/70
 89wywQqf126v066ukhZufnp0nykRu5cUS9SDfQT7GzUHX2Nr6vBBIvywnddoqlWM46iiISF1X3j
 HXV7Q+weQMGhh/I7ENRMxrEPAFSlAROUvkFAQS6X+3GG0LzGz3wSvPpVQFp9o3YmmlaCKC0ZnCq
 NHeRKfHIjvk8hxM0Tg9CdK7xmLL9VLqsTQrfYiKsZ4S69Fvm+wgqlYSIInrbOvAKHcFbXkFadc3
 yiiMgHW+HtSa5O0MvwF/fdZnxQPQy8NIvAk0wPfLGchSIztrI0ehkESattXVSE6OLvanGdE1AaK
 PXCX1rBophEpPF+culA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5onbJQmlRK5h
 3GMTC8fiL/9jPsAvNMr6hcf1Wa1z0NrhqaAjDIoBeC7B6MFzC3YMNmJIq213KFSnGwGoK+nDxDq
 wZI8qVjW09JEp6oyjfxqXuyBO32x/KU=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a4121 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7SwbUlbDHKIDUUknu0oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 0DlmzHJo9xg3hMjwUPFZs7AWy01qc6kq
X-Proofpoint-GUID: 0DlmzHJo9xg3hMjwUPFZs7AWy01qc6kq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
nodes to allow board-level overrides. Move perst-gpios/wake-gpios
from the controller overrides to the respective port nodes in the
board files, renaming perst-gpios to reset-gpios to match the binding
used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
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
index 2f67e665996f..8db1448e5e61 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1900,9 +1900,6 @@ pcie0: pcie@600000 {
 				      <0x0c100000 0x100000>;
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_0>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0c200000 0x0 0x100000>,
@@ -1951,7 +1948,7 @@ pcie0: pcie@600000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie0_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
@@ -1959,6 +1956,8 @@ pcie@0 {
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
+
+					phys = <&pciephy_0>;
 				};
 			};
 
@@ -1977,9 +1976,6 @@ pcie1: pcie@608000 {
 
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_1>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0d200000 0x0 0x100000>,
@@ -2028,7 +2024,7 @@ pcie1: pcie@608000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie1_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
@@ -2036,6 +2032,8 @@ pcie@0 {
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
+
+					phys = <&pciephy_1>;
 				};
 			};
 
@@ -2052,9 +2050,6 @@ pcie2: pcie@610000 {
 
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_2>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0e200000 0x0 0x100000>,
@@ -2102,7 +2097,7 @@ pcie2: pcie@610000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie2_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
@@ -2110,6 +2105,8 @@ pcie@0 {
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
+
+					phys = <&pciephy_2>;
 				};
 			};
 		};

-- 
2.34.1

