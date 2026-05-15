Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA72E366806
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851386; cv=none; b=JM3jYBRh3CaFmoPBga7s4zksrv/dVQJWCu0bIktLnkuyU8amDTtLYmaJFhCzeTbT/BstC9TjkQeT0Bg1wIbaiwpOvQ3E+KjIqA1Uls19jzTby2j8Tu9sUX/cR1L+21gJ6ZaMNNdgE12XnhdA2ARsIEMU1OYfcbnrZ3lGPqG0o54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851386; c=relaxed/simple;
	bh=J3LZpBZ3qXP+a9tLtlqED5GaQNjAO2aS8Ldjdeog/JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RthOZoNAKbC6aSKr8Ueo+hicSgVi3NKykDMoFm9XFy8WhvPNtnQ6fMWyKdf+5YZkXoTIGt3CIygNsCdXB50ymsfYI0vjBEHM+pETaqPhLIccXYuFsM3v/VvTYJQfhGExLeXmYi0p12b1IU9O4c1YXF9ADPTsSS+X4t5ftYo5xbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5CJzBPv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKuAbcQl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5CJzBPv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKuAbcQl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F8sIil1717292
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z8rrqA5OOQScbNqfropfO9fh/Mcan+nevfI838+LJRQ=; b=e5CJzBPvEtTNNEdV
	RcC7pzncCrgVzGeZm3zj0m0mzhswbzgotjyaWrVsMBkAML3tcKctVN4YiZ7w/qqR
	cJ2oLmSBWiDdORyymnl0+gNITHUVjqNPXfhQILREEmmN/UdH2TPizYiAcOEvoaTC
	ynawW9xmNJs+zNlQsUxnOyW/WYt6q5Dtyve8daNWX5uo9Bk5XGluU4/mOs/wEWGr
	Wq4tE5NkfbmROaYjyjmxfsA+S5zNOpe4JdAqU12ecWo1KNFryknjFn7ca+WQYUS1
	7UjyQY+498O4n8KSQ/Fb3NXxLqnR3ISVvCeQyWHNuqwmqxgI7SFwwoWHh498WCNm
	AQ8PPw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxt5nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:23:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314daf0053so3649129137.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778851382; x=1779456182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8rrqA5OOQScbNqfropfO9fh/Mcan+nevfI838+LJRQ=;
        b=RKuAbcQliJQZdQehEGnK94bK3Lv9pdfcY0gklqBNt4vlnEejIqeUQRWGCqQyl1JmVI
         aIdJkmtLpdSvXrOEVf+7Q6zLRmUrDCo2zsTZRiNw6hUgqBI829i5SJ60OQj8iTn1rED4
         H8e2MKlzj4I1LOaISOLEa/sV1mX6F+KA1bTKGonSSV33FJaFb8YUBXp8aByCEIDS+Vd3
         xrS0agG5ggdUbz18+BGRbWYScW8mr5GSXOkGWYIzIO/9JL1QxjaiScCRbIXK/8AzV/nj
         UCoqzgRYX5FGIr+S940TrNLysVT1cCnmMPfJ0V4TH/KtZfTuZ81y9rWLBlvqBPUi04Qy
         dWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851382; x=1779456182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8rrqA5OOQScbNqfropfO9fh/Mcan+nevfI838+LJRQ=;
        b=IRE1eStNbfk+FxD0Iz7xiPfExwinG2O0CYC1TbcE0inAb6ekPaw+pdogoA315MGuJd
         s8tyLQfSWxLPD87X0G/4q0LZvey+/PF8VKS/EPcUDolWZQYN7Sve25hoOWtGfh/Scl9T
         JM7ht5SnFdGJiLkUgzei1bF6Jjo9w917NsdmGpEsPdzjpk/y6NgM/Nzb0kw/kDPgOgRz
         ipwxT27rp2a++lnweI3vEly2qa0e5wt6xLLk1I1+cEo530vN0SGHd+UfKmuPkwsK37Ux
         YOeiicr8u5wnpmtXXr84XSuzP86flaEgmXeNmiZzLqIgXNcmMZwmycrwWVU0nJ50CBh7
         JJJg==
X-Forwarded-Encrypted: i=1; AFNElJ+BQgjks1DI3XQuAFrN+gZblcvUWaHrhIcqq39fKnhJb4twuyyML91wnKOvUToAwp6S5D06PiFAQEhd@vger.kernel.org
X-Gm-Message-State: AOJu0YwS17weqiH41XbImkFfzU0GTlWSh2WLMq9k+iBavmv1jO+LHTyY
	rLXJuvbU4/WFFEVVMdoyMywy675rdIQT2OZznWshsmM/+6EHRr80Ik+y1U4ReaOxd75yl1VGb3p
	sq+xnU6ZnEkKxk4ZHXjT7EdJ04u2SxyMQinS8zdyp2F7/QsYgDG/eU0qnCtvShsvy
X-Gm-Gg: Acq92OFDIIp47Hyq9qC78qk1PSeT3sFkjC73O1vyX/E2VVUJJurj2VbR8oVCzNBzWy5
	jZr9Bq7AhSNkQD9XZni6/j3hjD16b+fbW9viJKvTC1AYaopRRwxaQsQ3RkzYlVzFz60N8ZC22d0
	f4EtxKy73EWVRDpM0vCfqLPVXr2e+6HArxm0mYugxOPPwTmEfzZy+zTDj+WWqI5eLClPudXRZYW
	kD8BT94tS9innQe+KsGWHaZW8bIjgC5XygwnKhfTcIIjLXyfWokZabd3mO4Wr+FunkgwL03/Hjw
	Uu3vm0XPdyU8C5tMVu1ImSVw5o5Aar+ZB+oYZngj8KsPYOZ3zx4RR46RkmWyRYSiOisOd6+kc7F
	2BsHVdQ4OGR1Bt3sNEL2rry1STt1p
X-Received: by 2002:a05:6102:3f12:b0:631:d3e4:efc0 with SMTP id ada2fe7eead31-63a3cf22011mr2002599137.4.1778851381017;
        Fri, 15 May 2026 06:23:01 -0700 (PDT)
X-Received: by 2002:a05:6102:3f12:b0:631:d3e4:efc0 with SMTP id ada2fe7eead31-63a3cf22011mr2002538137.4.1778851380085;
        Fri, 15 May 2026 06:23:00 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feae166dasm17889505e9.9.2026.05.15.06.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:22:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:22:39 +0300
Subject: [PATCH v2 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI
 and LLCC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=45112;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3LZpBZ3qXP+a9tLtlqED5GaQNjAO2aS8Ldjdeog/JY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBx4szg7QAGKelyngdmTwWQd//uc4Uf+mGUzUn
 9jlqQdxDvyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagceLAAKCRAbX0TJAJUV
 VofdEACcVtdgxWCA2WKACvLm2+qD1FNUMI2+Q+iC7cj5YACB8fidj0pNYq25WDc2H/m3IMX3xc0
 O+d+BS3zBCkdL2kUn3N5NJNpGjqSNWA0Qp7uACuGYXV+PUJ9cGK74CMQU7KZRMT3KvyqgaG7fqc
 SuOQ9ilYLzPIRmxqzPCQfQZynBR/kA75iredZ/NhqAOa0O/02gTdil/l5tCtpfYKud3pqfsIzV0
 4H58WX2xAX57uHydNo5bDDoCFkiVw97tjnYJ0PWwdv8342IvNhLpUnkS9W2m0ucU84fIII9ID25
 8r4M5N6C2syv+sEUDoiiax7H/3sG0pO2AT1NiZmBbvrqUcF6CkPVgRsp8Yi+6j8/bdWpyGhkKpW
 /qsYGDQfkWXMQbfYoVoefnPUod5Texxfqh96HIXcCI6pBE4Kw63CI6cxTaWDisIV7ll/9f7FNo2
 dguxcwouy7FQ68Od9Nvh9Fo234EYsSn3qbbOyqeg3QD7sdCfy7S6pQIIqWlHVcSYrEtP+w3VPlQ
 UMJgsjINGcQ/2C63LvPBzszrWsim630BigkqJXi4pP9dpzMLfljzP63hMyainntjT0q7XBlW8gq
 iVUq9j4p6X9BcmEFJ7yODKYpd9KUZZCTY7kmqqrcZ1mgWF/XUZxPcG624sbceFCNsUwYKQpivNV
 qRzow27aSQPN1cA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a071e37 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=niM7uRogEhinLDBOfzQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: lWxj5koNKS-hRC4HavsezIsKer6ZZt-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNiBTYWx0ZWRfX5E6jr8cmKM6J
 XTSaRbO0lKtUOLwGct40Ge/iIlnFcWbxtZ5rGlECQ5fO+ozWIBTaitGXufPveFsWYJDNGCAohpQ
 B4T4CNQatBMzzamumBrsnelojTQMy2gZurizA8jDNvGfWrXkvbvpILppWcbtI3oCc2iLvy4L72d
 ctIX5vvnYpzxKTzIueNvKaIASe0JA/2RgbYJ1zT2wKBkt5jNLubb9Ha+A7LjI1LX666oDqH7BCL
 DQDpCje8wpBZwlM9U7BupnGdTPPmpeZsrj4MCQz0ai+Z5pP1mxYfC3rFZLoSM0qMVPONKE2Huhv
 k84XKAw6eB8XSmUHu5twIEDwEIecIFhCWrIh/7pm1kSnvr6iC58xT9u0l4N4SXWa5mh5wYNyZh8
 ttklsxeyqqhsrbyx1xuk0KnQTjIC7LDRwKh/HvAnNieibto38vA76YFo+jtax2ym7ovB5gSURAx
 FbnCGsBNna0JGesZmzg==
X-Proofpoint-GUID: lWxj5koNKS-hRC4HavsezIsKer6ZZt-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150136

Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
engines, add the matching GPI DMA controllers, the SDHCI controllers and
the LLCC system cache controller.

Also add the TLMM pinctrl states for the QUPv3 serial engines and the
SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 1527 +++++++++++++++++++++++++++++++++++
 1 file changed, 1527 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 73211b4a17eb..a2ab2ae60143 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -664,6 +665,32 @@ ipcc: mailbox@406000 {
 			#mbox-cells = <2>;
 		};
 
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,eliza-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x3f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x436 0>;
+
+			dma-coherent;
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -679,6 +706,336 @@ qupv3_2: geniqup@8c0000 {
 			#size-cells = <2>;
 			ranges;
 
+			i2c8: i2c@880000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c8_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi8: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c9: i2c@884000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c9_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi9: spi@884000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c10: i2c@888000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c10_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi10: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c11: i2c@88c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c11_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi11: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c12: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c12_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi12: spi@890000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
 			uart13: serial@894000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00894000 0x0 0x4000>;
@@ -700,6 +1057,679 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 
 				status = "disabled";
 			};
+
+			i2c14: i2c@898000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00898000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c14_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi14: spi@898000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00898000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c15: i2c@89c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0089c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c15_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi15: spi@89c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x0089c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,eliza-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <12>;
+			dma-channel-mask = <0x3f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0xb6 0x0>;
+
+			dma-coherent;
+		};
+
+		qupv3_1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x00ac0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0xa3 0x0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			i2c0: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c0_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi0: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c1: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c1_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi1: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c2: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c2_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi2: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c3: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c3_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi3: spi@a8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c4: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c4_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi4: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi4_clk>, <&qup_spi4_cs>,
+					    <&qup_spi4_data>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart5: serial@a94000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart5_default>, <&qup_uart5_cts_rts>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			uart6: serial@a98000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a98000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart6_default>, <&qup_uart6_cts_rts>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c7: i2c@a9c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a9c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c7_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi7: spi@a9c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a9c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		sdhc_1: mmc@f44000 {
+			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x00f44000 0x0 0x1000>,
+			      <0x0 0x00f45000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&aggre2_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+
+			qcom,dll-config = <0x000f44ec>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x520 0x0>;
+			dma-coherent;
+
+			bus-width = <8>;
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			status = "disabled";
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		config_noc: interconnect@1600000 {
@@ -972,6 +2002,59 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x08804000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x540 0x0>;
+			dma-coherent;
+
+			bus-width = <4>;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		usb_hsphy: phy@88e3000 {
 			compatible = "qcom,eliza-snps-eusb2-phy",
 				     "qcom,sm8550-snps-eusb2-phy";
@@ -2039,6 +3122,280 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 184>;
 			wakeup-parent = <&pdc>;
 
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				pins = "gpio28", "gpio29";
+				function = "qup1_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio31";
+				function = "qup1_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio28", "gpio29", "gpio30";
+				function = "qup1_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				pins = "gpio32", "gpio33";
+				function = "qup1_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio35";
+				function = "qup1_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio32", "gpio33", "gpio34";
+				function = "qup1_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				pins = "gpio52", "gpio53";
+				function = "qup1_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio55";
+				function = "qup1_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio52", "gpio53", "gpio54";
+				function = "qup1_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				pins = "gpio44", "gpio45";
+				function = "qup1_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio47";
+				function = "qup1_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio44", "gpio45", "gpio46";
+				function = "qup1_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				pins = "gpio36", "gpio37";
+				function = "qup1_se4_01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi4_clk: qup-spi4-clk-state {
+				pins = "gpio37";
+				function = "qup1_se4_23";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio36";
+				function = "qup1_se4_23";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi4_data: qup-spi4-data-state {
+				pins = "gpio36", "gpio37";
+				function = "qup1_se4_01";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_uart5_default: qup-uart5-default-state {
+				/* TX, RX */
+				pins = "gpio134", "gpio135";
+				function = "qup1_se5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_uart5_cts_rts: qup-uart5-cts-rts-state {
+				/* CTS, RTS */
+				pins = "gpio132", "gpio133";
+				function = "qup1_se5";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			qup_uart6_default: qup-uart6-default-state {
+				/* TX, RX */
+				pins = "gpio42", "gpio40";
+				function = "qup1_se6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_uart6_cts_rts: qup-uart6-cts-rts-state {
+				/* CTS, RTS */
+				pins = "gpio40", "gpio42";
+				function = "qup1_se6";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				pins = "gpio81", "gpio80";
+				function = "qup1_se7";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi7_cs: qup-spi7-cs-state {
+				pins = "gpio78";
+				function = "qup1_se7";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi7_data_clk: qup-spi7-data-clk-state {
+				pins = "gpio81", "gpio80", "gpio114";
+				function = "qup1_se7";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				pins = "gpio0", "gpio1";
+				function = "qup2_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio3";
+				function = "qup2_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup2_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				pins = "gpio4", "gpio5";
+				function = "qup2_se1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio7";
+				function = "qup2_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				pins = "gpio4", "gpio5", "gpio6";
+				function = "qup2_se1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				pins = "gpio8", "gpio9";
+				function = "qup2_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio11";
+				function = "qup2_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				pins = "gpio8", "gpio9", "gpio10";
+				function = "qup2_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				pins = "gpio79", "gpio97";
+				function = "qup2_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio116";
+				function = "qup2_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
+				pins = "gpio79", "gpio97", "gpio100";
+				function = "qup2_se3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				pins = "gpio12", "gpio13";
+				function = "qup2_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi12_cs: qup-spi12-cs-state {
+				pins = "gpio27";
+				function = "qup2_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk-state {
+				pins = "gpio12", "gpio13", "gpio26";
+				function = "qup2_se4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_uart13_default: qup-uart13-default-state {
 				/* TX, RX */
 				pins = "gpio18", "gpio19";
@@ -2046,6 +3403,162 @@ qup_uart13_default: qup-uart13-default-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				pins = "gpio20", "gpio21";
+				function = "qup2_se6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio23";
+				function = "qup2_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio20", "gpio21", "gpio22";
+				function = "qup2_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				pins = "gpio27", "gpio26";
+				function = "qup2_se7";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio12";
+				function = "qup2_se7";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio27", "gpio26", "gpio13";
+				function = "qup2_se7";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			sdc1_default: sdc1-default-state {
+				clk-pins {
+					pins = "gpio121";
+					function = "sdc1";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "gpio123";
+					function = "sdc1";
+					drive-strength = <12>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "gpio124", "gpio125",
+					       "gpio126", "gpio127",
+					       "gpio128", "gpio129",
+					       "gpio130", "gpio131";
+					function = "sdc1";
+					drive-strength = <12>;
+					bias-pull-up;
+				};
+
+				rclk-pins {
+					pins = "gpio120";
+					function = "sdc1";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_sleep: sdc1-sleep-state {
+				clk-pins {
+					pins = "gpio121";
+					function = "sdc1";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "gpio123";
+					function = "sdc1";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "gpio124", "gpio125",
+					       "gpio126", "gpio127",
+					       "gpio128", "gpio129",
+					       "gpio130", "gpio131";
+					function = "sdc1";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				rclk-pins {
+					pins = "gpio120";
+					function = "sdc1";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "gpio62";
+					function = "sdc2";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "gpio51";
+					function = "sdc2";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "gpio38", "gpio39",
+					       "gpio48", "gpio49";
+					function = "sdc2";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "gpio62";
+					function = "sdc2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "gpio51";
+					function = "sdc2";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "gpio38", "gpio39",
+					       "gpio48", "gpio49";
+					function = "sdc2";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		gem_noc: interconnect@24100000 {
@@ -2055,6 +3568,20 @@ gem_noc: interconnect@24100000 {
 			#interconnect-cells = <2>;
 		};
 
+		system-cache-controller@24800000 {
+			compatible = "qcom,eliza-llcc";
+			reg = <0x0 0x24800000 0x0 0x200000>,
+			      <0x0 0x24c00000 0x0 0x200000>,
+			      <0x0 0x26800000 0x0 0x200000>,
+			      <0x0 0x26c00000 0x0 0x200000>;
+			reg-names = "llcc0_base",
+				    "llcc2_base",
+				    "llcc_broadcast_base",
+				    "llcc_broadcast_and_base";
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,eliza-nsp-noc";
 			reg = <0x0 0x320c0000 0x0 0xe080>;

-- 
2.54.0

