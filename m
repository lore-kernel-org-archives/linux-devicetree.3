Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AFE4FB9BB
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648000; cv=none; b=nBP7RY6vPCsAqUdPZxqixP+wngENqruTtP+f9QwMSyJ3zrkqxu99VtJpXW8eK2iuX6gwoV8M9kQ2fsg/GLqATMqGPtLKU6CKrQOrQWaeGnfLcp0fNXTjYhoHQKldkypM5UJuoBCN3xT7ymvPlRgLvE0zyjBxnIuGJaj4PRBCfa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648000; c=relaxed/simple;
	bh=+ni5l5rxgVAQMIalE7RPp6XqvHp1u/AdEHjbOFe3K2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9Asl7cIV/ZzLI/5BP/kR6o+U7opglDYOt4Lg3uu41KhWIW0EoeYo1LZN2B24yEKYadChE3gRfby1Y6mqd2Y6A5BHB7zi5NGoddVpK5maUDWF0XF9rCXTZ8h7IGzKANNMo9uReDg7s80Neatujm60TPBirJrzlEQz59ZV1+QTOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pN011Sn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPiHC3w9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pN011Sn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPiHC3w9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zs9Y4186776
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=; b=pN011Sn+Hub9B9mw
	A7pZLmXr7bWtWj9ac0+3pOabrEAE8x5y15f2Gs7WWSVQgcJ/G5pIq93de83HcVoY
	9L4PG4vQrAuXBskE90J+eFIuci1RYtgo7wJ79OaveqzCQBTa9U4ivyJcdwZNP5hE
	t3b4WWbZHcppHBERnvxR9LQi4U6DJKhYNTtdvzIjT7MDo8J9S4GLwwkRbXkDK2Kc
	5XrVEp7aVHnp8ENMYn372o2tkCVjg+7aPe10HNY8SgrIR+PfZdgfT+qCIqRNmpGj
	Vp8+KYIMOGGN9K7ycxM8MPHAyWsYy6B4my42LKp7HArsXHI8lEjlIeooiooDvQmS
	L1mAFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uca5cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so16011395ad.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647982; x=1790252782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=;
        b=FPiHC3w9jXW2LtSh4LVbcqtNGBwM7umlJvxq4rGc4qxtr7dAwlMCoRYtMCB7eelNM1
         PnhPby+NX/minMRtdW8XeU0oYaj5FBK+dNQW/utre1R76TeOgIwS7iMptMAl60prxNDD
         jbEMygtRmT+VNpGPHBui24rX5sY3zeSnfYPDBVpUVLI6F5lXgTdifI1HvBC2HBl1rgxR
         +rCDcPMsQbS+zkFmx/OcDjCm0me2RcqPEtQq76QoQOOgcKnlupAhLo98BsZPeDCyS2lT
         Me2UTmGu1XWzIOAE37HVx5RKs+eDAwGKcOtcdJj/iQGQojGMQ5eYk1mK1QBECzXKwk2b
         Sk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647982; x=1790252782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=;
        b=A6eoO1A+AVF+3otNA4BFgK7ch6si7iWRgviPHDnIrLgdBR7igaWEtiPk5BH4+aKK8E
         0dbPYW8+bfqZymZEQ4szzjKRiJvn3dbzAA8BCcBV2SkMWxrdM6fs8Mxq9VrHAPs+itAO
         co3POOkoD26nHszG4JjCaia6ovFNKhPfbpA8cuWfrlGE/joMQBwo+9NoW5ZKITxXHOON
         kgY2F4ukzsJw2N5tzxWZqO693a4mBjslZwkekzpRzbHnGl92+Lv5qcrnZEm/PuUKYnXg
         8JpoiUvozDFBmxJK0wKI/Qy4zXhxrZsrJTkO2S5TEDM0cM6rQvYoRwsbdVWaxMM9/6jh
         vQpw==
X-Forwarded-Encrypted: i=1; AKwUvBxB0mqVvooo8XB0GqF6YyNGMdFvlA1VtqgjRv7QZKc/IFKLsRZmEn1uTLGY80+8ss0S+p0rS/mn80EJ@vger.kernel.org
X-Gm-Message-State: AFuF++mVGmXxRWQSvZwO6kBd5VRDKlc5LU6MT9vPNNIstQ58SNa63dWe
	Ig4vCrWRLbF1zDwDaIUVWWSMmrHL4BQKcX1DIrYCVWSB5FMOakkmRAf8uPx/dvTcQbauBuIlwyS
	nGIWfpv/IJTsdjaO8/sJ7f9UuQoyliThVla2U/Yzbx+gYi7qC6nk8HeHKx6V97DBg
X-Gm-Gg: AYBFou0msHx2sThFxakOf8EBrL6owjFwIaQZV+wA+qwVAbB39cCglDF+YdfqH55xEHA
	59zeQm6/2dHJ8jGroz3wEqtkUko8R4IBosJpt9LHKqDDXNlKikBb/6O5Heknal00ik6uVdlQkD8
	iJ4EUlOb4AHsT7kzgz7UrPtjecdDf9HqluhT4MMX5K1ZZD5vaIntaI+oMQ5hiaMoSLxNrywp5S9
	52TC0+NXAI+6g5Dnqz8RJsQTQutYizAO+U6EK2V564NuyU17apHBUkoCORcOps2ZUlxn+lm2aBX
	Nv6inZpLO8Tx8/V5KgGQChpJluyowbCRtLmt4hVawtmjOScAwXj7i5HdopMf/Ws+5/ZOMkxJ4p0
	fse0cVD5lhaKxQAvCWjQ/BxjYfFl1Cn3NsbQ=
X-Received: by 2002:a05:6a20:729d:b0:3da:421e:40f3 with SMTP id adf61e73a8af0-3dd5f5c78e7mr15164821637.17.1789647982273;
        Thu, 17 Sep 2026 05:26:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:729d:b0:3da:421e:40f3 with SMTP id adf61e73a8af0-3dd5f5c78e7mr15164779637.17.1789647981804;
        Thu, 17 Sep 2026 05:26:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:27 +0530
Subject: [PATCH v2 13/15] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=6068;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+ni5l5rxgVAQMIalE7RPp6XqvHp1u/AdEHjbOFe3K2o=;
 b=AfjFk+zOpZfim6A2Z2Q4J4HLTuwYft8MCkf5Dcg0r65Kaw8FxMs6DnClzzfUaC1eZH8hfbjyt
 J6T60R53StsA+w412t7RdbmvMgqMoybg0N+kHrhxJcJgN3pGON0KI4C
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX3se5Myq1epjo
 WFFX6WrlSdY6nXMugm7IH2+3Bd+SgA3Gfw3qImXWFkBnXALsnsU3bOOtSR4fZ7FGXGNtXWSnC/1
 ghAxAt8xm4HJXgWfP7N5GegJEk8nZgNVljpQm6xRtt0ApDEHygljP6L6RGX1L9Bpstyx2EJBfKG
 S6LXe+XX3IN/CeBgdaVCYcovtp9/KGUztmsy7bAYj6+LLHmtk2ySb7T38R2dVChNSCRXj5CX2L3
 w49AeTxMJbMNsIxA/H9mp6jEWuHb3nSWbSwS/AfQwQiac485FZ77Fv/fedogTgaEPoQOpY+X6NH
 MGUaLqoIOQZliTfudQi0wlmshLRDBpAQ/PgjjBH3WcVmQX/LRBz3wlgESFGx/bkxoCrafmwTdcL
 Dj/Ubql9Z1tGkiOqBmpSoOlMhZglyCbhppZxsl1lA3TdMxL1F0C1tNMkA7TkW8j6vWOGsU3LKGY
 CboKjDLndX9E2j5MJXg==
X-Proofpoint-GUID: ztjc6RghaSFVHbzbIj7plrgM6rFNokZj
X-Proofpoint-ORIG-GUID: ztjc6RghaSFVHbzbIj7plrgM6rFNokZj
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabdc6f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hNZP5i6h11z2s_4BSHIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX5xygLLHxj2Ro
 STezdk/J2IAa2lL7OUhASMdFbrxOmU6EhFsypeYoMtv30wsgd2PVXZKpowFBtSzZ+ABDGfpab/U
 h6rc3AumXjVwtB7FauJ84k1aaqiEfYs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

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

