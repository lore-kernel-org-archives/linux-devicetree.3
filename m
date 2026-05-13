Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDCD3A6B78
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663916; cv=none; b=UfFlJG+1gdLdlI8X2x+gm4jmplcYs8vXk3tMowtXUEoVjYLzSTKPr8V5o1wDMTU6aQ/qYM7eaEDr41BXaUZ8QPiKV7McKG29JJHoOi0PWI8tNoWEo/Af1rv17+GckeAeYQyPv8dLVBVDJe3Grt+ww5ZYAj8djABVI7DTqb4Nkys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663916; c=relaxed/simple;
	bh=DrCSr/AGAiEpAeCjdaZnQvOx5sRniWC8XRKQGP9u9/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhpeXc/6hUUL5vdIGOFskZcTGHSo5zqFI6/Kxi33h3ezqXl7JJ9g1p6Mv40Ci7zjxsR4oXwWBkv7gy0I3ytFNf9tE+t39qQt0ikOqAV06D1EYPrECSbWLclZgGZujMly27wiju5DGZh40cfWa/sGqhYhPwjYzLn4Hd13PzJ9hPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWX+VpSr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7aYKgsk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWX+VpSr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7aYKgsk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pLvK2321427
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPTy1RhOvJPEPYCOSHzhrtkycrHBrmM2UXu/GzvInpg=; b=NWX+VpSr1d6Ch7uu
	QJqLWsvIqrqZ0fCyuiPZ0OgW+vurncUu1WYSybCXpDUy5ybl5CU8S/5b9EV6epKt
	dBgOQjl/JKyuoLlIkpJLrRXYQuvQRrEcWnW3A8YKutO3z6UMqyy7K/xshSwM3gqf
	UpzMzUvz8nWYXnbvh3VsT0l7k99gvClr4uvTLFN7oljSEdYtPlERtfBtt/DXQIU1
	vevy/TFxIVmZwnA36lGiaQJtzutWuXUE1qgHi5bGSGPBzMCp1OzTTrCkchL7Ncfx
	3AzS4EzUidreK3mEyI1GSr8gDjGmcNb4uvHefdd/F7ai71nJal4yyZPinnwOg42d
	kUlxSQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu97mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:18:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca14d1faaso188163936d6.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778663912; x=1779268712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPTy1RhOvJPEPYCOSHzhrtkycrHBrmM2UXu/GzvInpg=;
        b=S7aYKgsk8+7djE+czIZZlDM+a53hPTj3DGhtLogLGGLIV8VF0+/4TW59pNqjLycsVb
         9IID/NLqTVxwaTH/R+NPzhw6FvJULvbaVa48speCR7ig3ZuCU+Hyrn4N9FoPqpXD2uYu
         2Hg5/l+Iyh5Z5HK6iKTHfpx3hYjYD9VmnSY1HhntTazMowUe0QygYNUWmHjV8quuQmOr
         FTy7SjSEo30eCew8qR/gvRq6Zbk7y+37vHUCKcZZ7IGUqIYm2ExoBkUCPrkJNvzK5lmt
         gskvgucKVWtrr1VzbnFep6znpnp5Wq7PDpm69k1jjb7cla5sbVWEcbm2/zIjaKDAApYy
         Ph3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663912; x=1779268712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kPTy1RhOvJPEPYCOSHzhrtkycrHBrmM2UXu/GzvInpg=;
        b=MHg9q+fP1PKpy9zB6vVYa3XX3vOyOxEUqGQkytzVhHF88SxIxCR+XLscTLaltiOq+E
         k3JBCTuvGx+B1Kay7X3TZ2BuGe0EdWNK5c9Cy/OC2BuB2i9r4wGr2rg8NIrVJbZSWBMI
         I/IbdIhFA2viF3OkDBfbMLT+99wYBIOX5roa2oXo1cKdljZqKyh3Eq5Hq+bP0+V9b8he
         i3GcJXchJ00kjhBTfTKAoR/Q9RdeFuGjmLPvngvZmIloBj/rt2LNwUY1YTQJo0Ms1gQw
         tvfDt++k1ByQ3ZjMQCMdAq4IrIA0lYTnyKsoNRkftWrB1WvOybgTlsnH/DcJEJvLBrLu
         xjpw==
X-Forwarded-Encrypted: i=1; AFNElJ/gvw4p7JJCI89WAn9/gD2H7PQ0139ypGDuUHgFAwdIVdgUXhGZhPH0Z9VZ6EEePBi5dkodQPdJloGa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0tZbDdYg3DTWc6pIj2AdoDiMHmdx+zyYcZzDpc9eECaEjUF7d
	t4C+i8aMl0b2Z38RRFV2gtZpIYDM3dyYMDDXcwGuCTWynlZ+tyKzVvb59pYB5X0w14Nh//cmBtc
	bF1+Ig4uR9g/HBgo+M7oSzuWEoNI58wgjTd1LMDksfBsajuFsKk0FCnKl/o43O9+MoSVxXM0x
X-Gm-Gg: Acq92OHtqAi3GY1HsXKhK45/WqKC++jmESwsfs6e2Kt4c2FZ34AswmPRc00QOFFEofL
	BrWY2QlbBmSavkACQ+/phoPOxsiWqJKpaaX4k2YOm4jMVZ1Z54aHYUsFzxc/d1EvrXoiXKJs0Iu
	Q+Y2gBECn0nCcpso7IFSTVOzodjjhb/8AOvmG8PRApt0KlHIKu27uwMBjLkCHyJqIR95nCmOy50
	V9fUwJ/tnt8LkdXOZEZ7w38pl4Ptlf+WjkMt/x2DaMVvR2gwVna4sAj3fISM04mIgPiXK9W24aY
	HM9t2ybg+O82j4RsJIDar5v5yWyT3qaVJwrneKdf6HpNFhA0KbM+CP1n6yW3P4kMyf75yIyVgL+
	Sd6mD2XimH8DVo//wMzpGShyUNZqTHg==
X-Received: by 2002:a05:622a:6185:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-5162f443405mr31233161cf.2.1778663911858;
        Wed, 13 May 2026 02:18:31 -0700 (PDT)
X-Received: by 2002:a05:622a:6185:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-5162f443405mr31232891cf.2.1778663911363;
        Wed, 13 May 2026 02:18:31 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm37827620f8f.16.2026.05.13.02.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:18:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 12:18:19 +0300
Subject: [PATCH v4 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-adsp-usb-v4-1-839936e89aca@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9098;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DrCSr/AGAiEpAeCjdaZnQvOx5sRniWC8XRKQGP9u9/0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBEHglCjJe65xLPCqoVqoZxVvSU8TYBTVdmok0
 8J59rKEyE2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRB4AAKCRAbX0TJAJUV
 VnQoD/9a3se9AK64cpzOfRMc21SzDuiPZvnvt5NV4SjZDRP8S7HbYzSaWNGkV297jj0ggtmCXCH
 vhxx885UzaXA6WbDpxTnwRq+gZQZFp3XGk3eJXRjPLF8n5Qv6mjZx7aavsXJhdgNeq3bYlhEmB1
 akaOIFJY7A6z/uqyCKoZssaudwHTTABKYe3grg2euF4x6/x2pdES6hLkLhNYBSAKE27Mw4mWiRr
 Rf1y+IPdF3ZoNvuaYbjIdiKEYysA5dxioV+kb/9qJ/aX36Nm8YV+s1AHQsa+pRGQgsHtjEl8BGL
 TQcUsXiH/fWR3i82jEO1UhdKVg8MfTyB3uy0xV+4Pqx1e+bdmHGSnP6tZrRAKpIMeC0lp098Dq1
 yZDBcYAlH/1and2Sg2cuCyIVj1XDUME517m7DrItkU9n4pxjbMpFXgldiv+I6d8z6fb2f4SmKMs
 f0wPRa54k4O6epjLlIriwMjjWfNGZ/9Fk9DgrH5eiM0W8aElQFW9ct36/9MvmYkSLGPxg+3dQdi
 gn0+ob4R8eVSbSTg6guvjFrSUeKpzvEXYhxf5atjIW4wDlzQr0xftwPcADqfleBngkwmjh8cBFe
 6r79ifzpnog3hmpAYy1IxrECtJ1XE7kGeQkFzbJTSmxEQIDioRWkD1gGWxwTnQPEVTMwF/6GZ71
 A++3XWOznHVy1uQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a0441e9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0aSsbouhDs5aZSzchFYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: QduG6bLWUq-RnDgy3kVyEaeEk8Ob05C1
X-Proofpoint-ORIG-GUID: QduG6bLWUq-RnDgy3kVyEaeEk8Ob05C1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NiBTYWx0ZWRfX9GJbXFT5t1M4
 ekicVoWABKKFmM04At7L9ip+uXeyaDIK+V1ZuGXy3eWHaLLAd+qJjmWlARSezHPkRnp0vSy4JFa
 k0BSJN47l8RTjcj0g2SJtYBlClQvzv1T89kO7O8okDYoihoUHsZjaBI/KEKyvcoNQJz5l2mcxjQ
 ypL/mcNQ2xJHkbD4n2r4KwSDYKTtRCOVyge2tgslyyi8g2ZdqZWM8zgx4en1svi9BrhryElVyq8
 SPYs6vPrMZFmRzbxsOrC3l9CAPVQhu+XMtXCNSipqsUTtoeDtnxGgTpl8yzP8gtznnzrCAFLRaq
 43sQkZqM0qABInHcd9RLDGhaaogPs3+7PTvFJTCVhDFVdgV2m+eGtECrGtq9t0M+IZ+T4S7/vKs
 pErzPpTygVpVQAyafPQDUrauGsph6/SICHUjPs/pYTCrqpEnVCsXM1CqKc5L9QYWVbfGet++L9x
 nVETe4X1tKiVovyRttA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130096

Describe the ADSP remoteproc node along with its dependencies, including
the IPCC mailbox, AOSS QMP and SMP2P links used for communication.

The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
combo PHY and an SNPS eUSB2 PHY. Describe them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 261 ++++++++++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6..02df7125b2a4 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -6,10 +6,13 @@
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -596,6 +599,30 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -624,6 +651,17 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		ipcc: mailbox@406000 {
+			compatible = "qcom,eliza-ipcc", "qcom,ipcc";
+			reg = <0x0 0x00406000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -862,6 +900,55 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		remoteproc_adsp: remoteproc@3000000 {
+			compatible = "qcom,eliza-adsp-pas";
+			reg = <0x0 0x03000000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +970,167 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		usb_hsphy: phy@88e3000 {
+			compatible = "qcom,eliza-snps-eusb2-phy",
+				     "qcom,sm8550-snps-eusb2-phy";
+			reg = <0x0 0x088e3000 0x0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,eliza-qmp-usb3-dp-phy",
+				     "qcom,sm8650-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb: usb@a600000 {
+			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>,
+					       <200000000>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			phys = <&usb_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			iommus = <&apps_smmu 0x40 0x0>;
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,usb2-gadget-lpm-disable;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,usb2-lpm-disable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+
+			dma-coherent;
+			usb-role-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,
@@ -957,6 +1205,19 @@ tsens2: thermal-sensor@c22a000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,eliza-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+
+			interrupt-parent = <&ipcc>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";

-- 
2.54.0

