Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA04A2A48
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047054; cv=none; b=B2Pndl95YbHUn8QQ1Fcg+IKATDon9bZgV7uIKpm+U3h0scdfVnnFICN3G1k1+ONCsUP1LZ5G9ULnNomTwUMPzhyfaIN03czYLzaAwo57KdNW1tfZWNCsH/XjaxmNNn+0HIoiec13sD6gRwYUoKoCdRVsHK2aJ/4IEBhMIACCGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047054; c=relaxed/simple;
	bh=LKfBxa22qZbO9H9P9YhONQYUG09WASL2JjEfs5CCqYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyWxq+PWrLv8TDsmW/6gmEHTahG/COXUwJzz2OBCOhCtG5ymWHLxXIMULscsvIjKNMfFoJqV8tg1hl+MGKhID/4OmMnuQ+EvxdPQrglGh/6sNJFO8xGOowS2AlRW2n9iF0v3p5u9tb21pV9NA2gYvqnt+wocmegV3wGB+n897cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2+uZfox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=So02YsYc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2+uZfox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="So02YsYc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7kYC918799
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=; b=R2+uZfoxJPoLyr/8
	q+CKFQ2uTdgFxSr5XG1w1sk0/alSTRxyzIzgDW2zhCHezeviwSz7y1T5xSEJy21M
	ZH8K0+Jpg9a9tNa6c7eO+VnxSzESr+PtG96R6O1iK/98TJCm/jc9+JnXBldxxS3h
	ww0xSwSJ4SRnJFOd96zxIVrUl6gkdXGETBZ1nnArxlTiTXOYmElxssQZepoA2uaB
	9gx2M1USJypIRK1NMUEZb7yI6/MyRlZLWV4uGQNly8APE6w4IfRuZ+j0ipLz0jyq
	3dBRYYRZjwrPRCuDETIbXCSLbjuqjrN/EJMkqBrbz30lmSPM1c3bkQq+t+T/uZaH
	GtKXIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygv1rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1190200a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047051; x=1789651851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=;
        b=So02YsYcYa46vQGEFI2dnnFg0w9+O5wDOqscdegT9p92IgUwFwc49NP1/a0ZZIF6vw
         UBxqFhv5tAIAjB/wxHwps6q3CcmYsyuxaKOs1OQSDmIYRayqwfb96y93Y/+CtQBr54Oo
         D/5tX3oPt1pyJZhvZIx/GADQvpdyL8YVOSUrn/2kecXA63YsaWmIHIQHO3LqPRhnDciW
         lXco5XO08PizOWJDirpquiT59QJ2EuX1d2+6Quhm2KxqhWl7oeQv1nmipVSmvZ+hob8H
         1vbPuDYbvWo+hTFxGmPeBDWRA9MUgRgc5ctwIENEBsFX9OTEA43PbY58R+4TvO6xZIHx
         9r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047051; x=1789651851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=;
        b=FbLPSQSOQ1hGUfd9Ba46u3ghZMcx9yLZ4KHnBd9rjNJxDHOpwiM1C7t06gNHWUEv/C
         Rz60In41HfaB31sbTJR/hhOVlDtUy+7Sngtx2Hrw0RWztnXh++XOvm/9ZEj7uplYVbXq
         pGHqwIqnLXlULSO2Hmnw3i1b+1PlzU4W8nkH7G2NbjnaFUwpsLhs5W6M5IaScA+7MD0A
         dWvaeRMb+EEdQprc6xw9eSQyQDTqv0KxoK2irlXFOrWwhr+5swExmb97nAF18wa57zyz
         xk1ICOHMwHataqMJkC96FF1KiI7jS3CI8Qin8mIv/TuHqWCHRTYeGw3NVLC96dazzIiZ
         Totg==
X-Forwarded-Encrypted: i=1; AKwUvByXjIZ0616nE9LgWmf5lL4AWrY/sngGD+OjP3qnWirX8shdg9gDgCQFBOeI077SdUof8t0O2L9NQRj6@vger.kernel.org
X-Gm-Message-State: AFuF++li04mjQ3cqYKdngLN8Hr8QyVnP7ldBsCkLgQNcKS0a1eD0B+q8
	dnMi2si0r0dZNPzgTmTIh2apJgWASutG2ax/JtRmsV2y7HCGrhULkc0oHKFH7ewViLgoE6Hv6Ny
	d6YpoBcJr5i2Kmxroeh9kDWEZqoL2qcD1Pql2qCV7+kypeP+tKlxlMdeKkdt/T2WO
X-Gm-Gg: AYBFou3lC9DPigbFzVGApvyoxZDP3US0Fl9U8CWVccwZsjk/u5jBevNEUBypxV/3sw2
	RtIhFMI1EgDzN3xv3VUS8DbjUN7oTwUbE9QYOQSuk8WnuGXREZZjpLWUtMmV83zJJvJkyOuwWxr
	F5IRwYL+nYMhfnnw55yVdnyk7IAPcxkf5QqfbxHnZaU0FcS8AUC3TbWvOa7taIcVvZGRDR1v2mz
	H3AzbBP9yQeRAxkKRO5bHA2rqhJLeHXigTjnVpOxONKsIRxAkiNS+oBK79EShCwwE4/AkznZ+Hy
	X9Cd5a/+a5tB6T1eiSIxaboz2nOvaP1BZ+0ukbwUxFvEAcbv0tkfNosNKo/l8vNF9mmEGgzjzfd
	n14RxUCyklpKcvjkzYoYNbSfVFCUxq7M/e+w=
X-Received: by 2002:a17:90b:4c85:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39d77b1c383mr6079682a91.15.1789047051426;
        Thu, 10 Sep 2026 06:30:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4c85:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39d77b1c383mr6079629a91.15.1789047050861;
        Thu, 10 Sep 2026 06:30:50 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:50 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:13 +0530
Subject: [PATCH 24/34] arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=4559;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LKfBxa22qZbO9H9P9YhONQYUG09WASL2JjEfs5CCqYE=;
 b=EZaIED8TxuCd/MkorGHX7hcWfB7QHRTDck7fvgVrWd+x+SdO908UXcPRPfYFH2/tyrDv/oV55
 AhrEjhyY4YeCl3O3xtmCy+6pXEJCGOht3RJ/ETYio+WPfblbZ0XUCQM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX4CQLZcN7r9af
 txXidTI4osct1QcD1rkPZoO6c7/9EDFzpseodBK6SqWA11qeY+IzuPdcsOnwzq8FZhuqxfj8eGJ
 yXItX8pbL+c+4wNx0myJELWJe8fH7m0TWFVPmIGFrDOOY0S3yvE6pGh5CPMswsiRLeyIxKaaMeu
 MsxtFhFt8R1IdZIeL625Er96QKR/DLB8zV7/EsCm3j0mbEQPFFv1Am4/gjrBs6lfbKOKAPTVeca
 5ocqnJfSkc7CkWMsQyXiCVL0C8ljmOFIULebUmEbRaJJMez2EF8Gne+dbLQzdCQbU6xSrjNUkcT
 O+4n2ZGuEmqIEx8Hcjl8c0ULECZ6oJZKrGm6YFoWiouWePHRTHobYQMJIWKrLhmDZKcPvnLUf55
 pUioB2y8MHP+Yk5DSoSwL+u0CiyLKxvoMZCUUl6wNK6z2nnRrxOHMiSG4zF5MgBxdNv33V7KjGU
 0NZoeun+AcHjBsRKBuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9WLRN3cOe6s3
 E8iVfponOS38cAlFX9MWeubxJX+diCNNj3TlRHshuWFx8/433+v6Yn8VfEkZ3hPhBr23R7hLrf/
 d/vv2ZW+LimLWGM9O8kdWKHLFVwOmn0=
X-Proofpoint-ORIG-GUID: gN-dodphapOzf87ZB74w178awMimTrva
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2b10c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-yNNrFuiOvHClSI-D14A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gN-dodphapOzf87ZB74w178awMimTrva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
labels to these nodes to allow board-level overrides. Move
perst-gpios/wake-gpios from the controller overrides to the
respective port nodes in the board files, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 +++++++++++-----------
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index e6ab523d249e..160f6ccf21ca 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -491,14 +491,17 @@ &mdss_edp_out {
 };
 
 &pcie3 {
-	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 327dba55a5ec..fe773a47da2e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -592,14 +592,17 @@ &mdss_edp_out {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index de1b72b64d96..a85e3211958d 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1779,17 +1779,17 @@ pcie0: pcie@1c00000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1898,17 +1898,17 @@ pcie3: pcie@1c08000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_3 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2018,17 +2018,17 @@ pcie1: pcie@1c10000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
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
@@ -2138,17 +2138,17 @@ pcie2: pcie@1c18000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_2 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

