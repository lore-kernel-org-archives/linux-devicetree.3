Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577E04ADDBB
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198566; cv=none; b=NMTDQ62cnJstrjBLT/CUVe51p7RvJGXQqbgkOAO4CLAM/Fbptk+BBFbkN0mmt9Z5Ac6JKGlaw6PKgJqfDBC8U8naIdh39IFl1nJ/ESn525HbiTQAmpKtnOwJfP14q2vJB8aH6SkeJa/Vh1WU+xmafsbgUtOm9jQV7nsVssMUFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198566; c=relaxed/simple;
	bh=yipdGphOrevxPq0KLdZW3q1vHNXbFb37fLJbJWlUpi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j7b57iA8LXmtTMoMkttTT6crQv30fWGnu1yRS+554z7diNW0uXKuBDMi31rOi3lDXL/J0EgbD3BLOsgViM/Abr0jnVl6Ld6R5cBNN+8fjOSVX04Ud6aGMh9lYjkTmQge6ZpsFV4au1HvS7NWWg+5lPMOFYnXsFt0aCWWgvnDaHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrddo0Wq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJyxavEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrddo0Wq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJyxavEF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BFot8m3680641
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B7xjYsLOUO8Usx4vVc7C1O
	PAJvdk6UM+PBS+993KvaY=; b=hrddo0Wq7GZ1Xa2BL5upOYw4E0aYn9L8R3pEpa
	LiQcPwKXCkHC+7ETVX/f/Z8ehFc+wjEyzM3HfGAYsuyKHNgP7k9MdCnWHhsjyQix
	a+2vsTQEQic/zIj3/4NvKGAPYSvVRYwtlTKD0LjK8sLPVIBqyvCQ5bExdbvGFClS
	8QimcfU3af3loD1wKt21B0/4ddBCRCFtQn7Neo9lBAFFVjjCd7W0q8+d1hlUlbQH
	i88XIWzx4Rosw2YmMUmP+WfZHninChLnPUzRgWZv+iwy+Q3j8XvAXklM978KJSKh
	kS6YQ8OZHEk9aq9QuJxd3vOoRgvQESTdbjDLNabr0Dg+HGFw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014ge3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:22:40 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1382674ba2eso113347c88.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781198560; x=1781803360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7xjYsLOUO8Usx4vVc7C1OPAJvdk6UM+PBS+993KvaY=;
        b=cJyxavEFtEyySVEESaX0ZB+2Y3AZk0A1sinsZsXyNXlhr9DBbp2oMD1bDvNJ7laOjC
         Ly4FYr2mXPfzPEeKsSCeBmXf8YG+ib+fIDchgELNnLFo/WgSs3lHLbMk7CRE2hFRFsWP
         spwIDcGcRh3v9623kQrl5Uuij92qmQOL1qYC73kaK+CJWNVvR6d5Buei5xSLtfte0c73
         c/tQ1ynu7en0VlvX7EdtPzDNnpnOd3R+UaM9Wqp4gUzIZ6baU/TOHSWB5pvannWv+7j0
         9XZOMnkwbzgk+aVdNpxxOgvNuDBkDuofOO5zcHiabjtk2tS+6Zumg3DmZsj681WJqaE3
         /qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781198560; x=1781803360;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7xjYsLOUO8Usx4vVc7C1OPAJvdk6UM+PBS+993KvaY=;
        b=oJiyNKIyVdD11BxoCos7XyP9G486F9G/VL8wwq7YTS6rK6IQn6ZF1IfW3LnwgNlJlu
         Y31iEMPtemvnuy2lun5WB+Bp4OqGE1ixEcCIFpZdRPvRxGevtkqAM6PpfF67gnugvlzM
         39GqTyLG6/UDjy9yqzw6ie6VgV414HBIO/hQw41qsNK9c97w8fXkW3pb0HJwBb4RemLI
         GpAES7NZ693p1q5dtTHnGqwGOJ+yZ9YPcUA1JW4igPlZvYI7pPL9MJy7wgqcWiW2ia15
         yHYw6k5c9b9hPU7HIDhRAEuvZRbbuv8jN9lWByoMBFmKDDRHICXBxiPHu3LvwoN2RKDb
         iOgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9juWC3PgaOqenGyU2wxM0bA3wfR4RyaZc3XDeyDSPcJGiNwUjKr7Id3pNHSnHlXqXps+dYbi011kRZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5AfwI5Wtey7RlZnASMA87o7KYBn1azSa5k6f9zv33d4IrJl61
	R5wPap+MyDFAAxOvs8spnCGT6twSR5WCRrVhPPvid2UIbVeDs6t8aHxNYL3LwSTjrqZufq34xdw
	d1sG44/TNao3Ooni0fnzj3CleWa3TbjQfVyRpHLMFMZM+Ga8Jarmkg5THn7Rn9x3flinPS7Yp
X-Gm-Gg: Acq92OHs/EOmO8aPVE1hlUsgA+oJl9qGuOH9aAMUBINzCv+NyeUZ9piHvwR3IdhARvP
	T7yHAnI8fVyKU0h+lKyVl76CCwJufkHwRZ+NkE+0pVSjTYO2Rkq/Fj6gWs204Jn67LFb+c+QgxV
	s4g0TlT0+nob4f6JoXNsVjWVZxp6nDe2MpIiMiANNtDkqAepdHs2mW0+idOCVuEZOU3Rx6S9DpC
	tsriKi5fAdkrdi2gzlcJppbp+psnlcerWLby7r/jNBKe0lLHoagS/0uQDbNxyghDuVKABAFPfHl
	qHB+eqeNEu/HvV2Srq50e90bcN+ekhlpttU+RtZXnBIQ+eCqwP8kCFeEv2UqWXwk+92nlb/WWgP
	og4rGvFb3tFS7stxj5IRc97KIbdNU6xT/KosSyUACQdIAY3MMGHNmHJ2B6KATLQ==
X-Received: by 2002:a05:7022:f40e:b0:137:8bc2:f501 with SMTP id a92af1059eb24-1384214fa5emr2093622c88.7.1781198559612;
        Thu, 11 Jun 2026 10:22:39 -0700 (PDT)
X-Received: by 2002:a05:7022:f40e:b0:137:8bc2:f501 with SMTP id a92af1059eb24-1384214fa5emr2093587c88.7.1781198558886;
        Thu, 11 Jun 2026 10:22:38 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13843025028sm2418237c88.11.2026.06.11.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 10:22:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:22:37 +0000
Subject: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANzuKmoC/yXMQQ6CQAxA0auQrm3CDEkJXsW4QChDCY7aCoEQ7
 s6gy7f4fwNjFTa4Zhsoz2LyignukkHT1zEwSpsMPveUk3MYxvU5KQaOgqIfQ9eVFRUl1eRbSNl
 buZPlt7zd/7bpMXDzPT+w7wfL+FiSdAAAAA==
X-Change-ID: 20260611-glymur-geni-irqs-1f796376a62d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781198558; l=6517;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=yipdGphOrevxPq0KLdZW3q1vHNXbFb37fLJbJWlUpi8=;
 b=Z9WrPOWBrTQkwf53RLEveluZCOy9z8YApBraqNhbP8cQMyT39DDlVreGLDrgHpLPBon1zy3Op
 qHW2cEZq8VXCyubE+ietaRqjdLYBjQ0JcV0kmoWI1LmY19X/UdB9x5r
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: BUFTMoaJuBsv4Ou0Qzi8ICoRi_av1w4Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX2UsL2LK/X+V1
 i/D1yU9l9DSTQp1G9LPcr7pStmo4sPaTMhBBm2pSffbI8zr7BZE8xyUEA+xb+2Tn8bfkhslHW1V
 3azVN1wbLUvi9bLZNsCbD5Z1lb6wvW0=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2aeee0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rhu6p_SW_4Lw01-mBO8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX8C558c7s7e71
 EnPXFpx1CwPSDePnNzTaoS/mDFicy6ZT9y/yN7mEbESJfG9cpU6yeoMTTFkvGeFplwrpjJ+yn+1
 Vx9RfvaP6YgrwZqq8Ua2uKgX8xU+0j6UEq9K5OGHJLPNZhjN1Q4baswYFQQxUIycLBfgLVw7NcC
 f008mW1eWyE0sO9eWAlS63X/kc1nnRJ2M2LusR4Fnu4N5MIsS4WwC05H92PWoN96uYUv0Zmwcrp
 RtwN+zlWthJ1mN9x4bdHvgi97YZhtNz26IuonqE+9KD7MDBL5Pb7PUnY4GhaAee55buju+B4nPV
 QJHG0Ol7wo6/BOuZRQ7qO4VgyWsFjYHeCvbvtdNAk7NMPFkJqRLd/woLtt1wt0mMnZKc+8GL7+0
 cL7/PuK0NrsmZnHc2bNMNpufjWRzwKyRUeBBECNp3Ryc2+Utq6irQh5r01OIubGTc3irgGp5c9E
 f/uU/ywHses0AlqPZHw==
X-Proofpoint-ORIG-GUID: BUFTMoaJuBsv4Ou0Qzi8ICoRi_av1w4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110174

The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
INTIDs space. While some of the i2c instances has gotten their
interrupt specifiers corrected, even the other functions on the same
serial-engines are wrong.

Ensure that all the serial engine interrupts for QUP wrapper 0 matches
the datasheet.

Assisted-by: Codex:GPT-5.5
Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..2271ac080ccb 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -1876,7 +1876,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi0: spi@b80000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b80000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1052 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 92 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1903,7 +1903,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			i2c1: i2c@b84000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00b84000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1053 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 93 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1930,7 +1930,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi1: spi@b84000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b84000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1053 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 93 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1957,7 +1957,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			i2c2: i2c@b88000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00b88000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -1984,7 +1984,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi2: spi@b88000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b88000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2011,7 +2011,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			uart2: serial@b88000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00b88000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1054 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2056,7 +2056,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi3: spi@b8c000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b8c000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1055 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 95 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2110,7 +2110,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi4: spi@b90000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b90000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1056 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 96 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2164,7 +2164,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi5: spi@b94000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b94000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1057 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 97 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2191,7 +2191,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			i2c6: i2c@b98000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00b98000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1058 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 98 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2218,7 +2218,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi6: spi@b98000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b98000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1058 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 98 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2245,7 +2245,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			i2c7: i2c@b9c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00b9c000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1059 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
@@ -2272,7 +2272,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			spi7: spi@b9c000 {
 				compatible = "qcom,geni-spi";
 				reg = <0x0 0x00b9c000 0x0 0x4000>;
-				interrupts = <GIC_SPI 1059 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_ESPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260611-glymur-geni-irqs-1f796376a62d

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

