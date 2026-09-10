Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522CA493D59
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047050; cv=none; b=qJo0Un2rkMB5r5bhZK2I1RL2lU3GRbvtc49F9W1zafgzJGTsvnZ9TBlDwWU5d5cFU8fy8dILwe7Un4/tiklsHaAxwwkJZUKi2TfynYP2SA4APcxmgaFxXdHb6jN0ufJZZS4BT9IeLdwVJP10PsHE9zQ86bE5XmS/3xPUcV+aQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047050; c=relaxed/simple;
	bh=x7WfX3xIwjOsLMVT9IjU8J75Usl/xrq8+NHvfDwqsQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSo6URNYW3/KZ3Rac9+Oghcvnd6tS69Pm1fQYAc4Du+dboVXf9KLYt+fHmdhWtkNu1ReCNt88FSkAITVz9DzqkNpNCEPfI7w2eYAsY2bNpNaXEB31ocLn4A/rGSfj4X51vyC4OauyaVAs+nv+P0EtoXg0Ppc3dUWlOhxyKw3n7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyQQKiqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VscvhNFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyQQKiqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VscvhNFu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7iNY780787
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zxl3FsW7ScWsWKgDu+bS9B8hjsLguRUZB5zuE+JQaxk=; b=GyQQKiqjB2JyZ6Ax
	Y90KVoDvh+DITni/2/PNOdyF/cAJ79b0/t5XXe8MtJptHowh4Q6GY0lKO1OnrmAw
	jtkS4DbYot/q346V0v3EQCrnUONRMdwTiVmOXNDAOqa5b66aARfvJEigCdU1nrKu
	oFUINYiMnQ/oUOh8WvZ+bifqS/OJ/DtLNJn074Lz3VGKSrhGCE5ywFYjD2XBDfFE
	dRFcbF3T/QeFAvqSVQij768Pyo2LjQC1NY5XQdnt8RDFX2Rb99THldCjbnnN1Vsc
	SERaAYO6u7RmyYME0fwB52/4g7vXtjfcScluXIVRr6/h2n4Cr7XfXrCHDPM9INaI
	qIjuJg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9ax8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:47 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6bcff1b9fafso2828093eaf.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047047; x=1789651847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zxl3FsW7ScWsWKgDu+bS9B8hjsLguRUZB5zuE+JQaxk=;
        b=VscvhNFuxiWFBNdb2oK2LRX59gGdbT3N1flJlDnpCBe7LniedVuCoucz4X/JDEX29D
         cZWXqiGiPlm2vLZgy2Cg/ZUwvwSSQdJwtteidcwTLeH/QkIRd2iaC7nX4hKRZy0I34/q
         9q2XbKgK9VaFTuDtMGdzU2ltrRq7cjtftP0hpR6cqtnG0GcmiIF+4ji/7Wuex0GKlw4T
         3sp9NozabnkJQuzK+aMER9GrDuVSsSMBKIaia4Ak6BULT1LNkRpssBN5U8FbC8CBxhrw
         jarjExFWZXVNG+ybgVqYD9kcFkbQ5LhigjC+Xat2hQXVHKqO6rkrSVtYQVZNaRkeAHuD
         sIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047047; x=1789651847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zxl3FsW7ScWsWKgDu+bS9B8hjsLguRUZB5zuE+JQaxk=;
        b=KjNYHoeBwxdFNZvku+GF9jtSa7j2R2AsyJRbgpOsAz3VA6wr/zSlPcbzoG0C19FAic
         HHL/OoFId1I55Pc208ao4FOvcBNV5wH8iGFboAy+uasFi/pVY3y23fwiODfnAiVPmlHI
         rWG9YmUVDtwI6qE5yWgwtdOCI9BMV1hmfDKgzej03RQcUoA0XqqZprPmYwsqY1Uq8GFx
         Pah8Lll2ZQNG7NosmaXEzf6labwYzDzjjmR2V0/NxNjaib+mooluQppEjPnftspRJVOB
         7SU5cmgTboaAD4mB13VBkOTHJg8yQIsSYB4Pmcw4JVhcrpAeoW9/7lIftGeUNdlVFi+S
         JN9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZc6uBaf91W6Su9c8RzQEVghQo1diSXFOIBmWSy9Y5vZ94Gs3VkU/tCinxmGGgM431OLz7G3SoH0aK@vger.kernel.org
X-Gm-Message-State: AFuF++l5BO7G846abNUPVHXi13lYIHWcgi3UwMNZ9mjbEXpCsO+Ky8oW
	/5V7mgk91Eb4JU/QCyZAmyWuv6nF+Ta4xQP/N2cVPVEqIsM3peW/qBhAxpunCl5ElGmQHtutscB
	jq6dSaMU2aRK0e2HyJGpI7i6xDLwv9CwoWH6PDgheh3U+CU82grRhvkuVBUv8+z8N
X-Gm-Gg: AYBFou3lAz1GVTGk3sOE/eQuxOavBqCiOvnlhZNxNImNhesSbkuwDDgZBos9DxWabn/
	OvSNpmUwHOBQ/qdxNn1kaAEXdBaY+WveYIvNZGYlnFTTYsNiJForniG0Y0lB+QbdETvds9eRdrm
	DMiEv5pkQ91DW9Q0J7kaCOlOGzMNT728jUUOJRN3IY0pDGgwHP6ZLNchAWiATglAs682NSSSg7I
	McIhxdmM7eytpry/feTpSl8XgN8jqvzLKL22eb/LxOYfor+PvM5X+yblTWnpN3g2uIzPjv9GlXq
	mWMbBhMV+EocKqnivp3pqjlZNyYZBC5BsneFpCxlUDc2Pd1/zCpVEhd3TtYGn2HGWA+rhkpMUH4
	npylKxRhN7iCGFjf/IZOssX2fxB53skle1oE=
X-Received: by 2002:a05:6820:4cc6:b0:6a1:7790:258e with SMTP id 006d021491bc7-6bee5799814mr4375534eaf.18.1789047047038;
        Thu, 10 Sep 2026 06:30:47 -0700 (PDT)
X-Received: by 2002:a05:6820:4cc6:b0:6a1:7790:258e with SMTP id 006d021491bc7-6bee5799814mr4375506eaf.18.1789047046631;
        Thu, 10 Sep 2026 06:30:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:12 +0530
Subject: [PATCH 23/34] arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2549;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=x7WfX3xIwjOsLMVT9IjU8J75Usl/xrq8+NHvfDwqsQk=;
 b=9KDxRwTdOw430VGadpmYfMNoMQD+bMJJYQdmj3VaW1CUXBbkrMJ5uAdPpEkNl7vIt+MOJFTA2
 BoyGWClo9XEATkhaEgOujzVW6HfFJYwVSl1tFGMtt3AMFykMotsTILt
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXxXSlEFHGNwYZ
 FM/WCjpPJ29UYgb4wJNlZEU1asM4dAzc/d78MR6qDwvZdxtDGKlKVu7INcgki3D0NgVGIO1E9b1
 fgZ6Wc3pDLpvpE8jHFwdvAIUDjf+eo8=
X-Proofpoint-GUID: xPRkFkx_UP3mkgcl6Vi01z2Mxqm_ymwz
X-Proofpoint-ORIG-GUID: xPRkFkx_UP3mkgcl6Vi01z2Mxqm_ymwz
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2b107 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX7PKc/jlPIF60
 m1DdOHK1AADeyF57QQdE6bRc8Dg9R6jzeFzoSFb1TT9TOpLAwM0YpW22jSOTOZ0Xl/vGgZKQqmT
 rVKW48HMmFzcC+Z1RYbbhXpTtISj2wkt9wIZ9RQimk2vndJwJI5woVjG0bUkyEOIB8JSkrMxmCi
 ZqqPV5/qFmCYPxkmXIdtDj3EBucmyNIzVYxF2XQ6Ks2PC+FMWQkDlqtOhRg3zzGN5AvojNj07oT
 tIbpv7+PqQ1rbqjZrXaJlhkpGssUr4G1IpDwUDIxqX9BAUonBaIoNLVVGKjM14gskkGmSrvUi4D
 PASDbcRwNvY2l9xo1egdoz5dUHmjka1TFby833DGgewnS7y21DlZZGLXcTWaZPsSFQ0ysw4vxdm
 EZs1rOdb21kblwmYE0DjqJ3QPh/XZ+GoDFyp5udqBMkbjfESJqcj0TFxU2L0HzJ7+geBfA2cCGh
 cTeW94Sb0Gm0YlxJblA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
controller override to &pcieport0 in the board file, renaming
perst-gpios to reset-gpios to match the binding used in the root
port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts |  6 +++---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi         | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 7469134f42b7..cc04eefdfcff 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -357,9 +357,6 @@ &i2c10 {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -367,6 +364,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index a2d93fd68299..678ecda1c99a 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcieport0: pcie@0 {
@@ -1347,6 +1344,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1464,16 +1463,15 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

