Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB983769EF
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027422; cv=none; b=KB1WWBpaU7BkK2U+Cd51DZHp6krN+7f8DvybyMezqBQK10SvKc/7vXaWvrxfCKtkzODbul7WtNprzva/ZL6qDqZIIrKHd3ep82I36sExFNRTEyL5gY5sMqK5HL6ENg9XZ606z3ThC13ZcbkqkVUbt39z2cpWFwOgZHp/BitxMRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027422; c=relaxed/simple;
	bh=0tJLB9zTTST9Tc1wK/DNa5mC24M7mAZTlAY8LkbQGkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a6kly7nc26Exh4dkU9EmbgK7HuH4vb/QTy4p/LEWEBUy/bztTKvkTX/bOge8QMLxdR1GKvLCp766G0zsuuXWUSQ6u5FKlNyl1c0jXKOca4esK8/cdmh99PNwHolRTNTptBC+bUhzLqxpWjAuP9iPUXae59CaD+usbf4Pk3oWORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6urlrek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpUFT6GE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6urlrek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpUFT6GE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SYhJ3954663
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H8Lmc1955vPOPYiwoUhYZL
	kS0rJPbsj+7GV3/G/E1Oc=; b=G6urlrekSzk2A3Ej60E4QAthLuWzbT9LLCuGvU
	sYnG1kULlyyY6kqL16JN9D5IeW4CJKYOqXRPi3pvyZcDJ9czJx6ZBsbF43Aq3Gkx
	OgayUVGOebSExcwlxdpO5061I8PKc83/Kf8w5xbfMd+toY+oo7FkUgq8sFKTtPU3
	IMZDmuVKX8PdpOj5IlvxBRQbi6tgR0oUbs6ZioIjQEaiIu9MJrlBXvNwBr7ksYlU
	tF4jCm1EaUbuc8nc2DLTViyawEsEv9F1av3FBTfxFPjk8zk2VGiR8FdLXOu5H5Df
	3NZFnowqGJaubBia0GuIY4YhSpinFQFOLlNaeSdRpxpLKksw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44juegu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:10:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso102177465ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784027418; x=1784632218; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H8Lmc1955vPOPYiwoUhYZLkS0rJPbsj+7GV3/G/E1Oc=;
        b=BpUFT6GEuDc7vFGHT1GUlIhAE+hqFw+Gh+w+X3rvrSrm4vQYOivWlcVbvHs3KAkHbB
         3ph5+QhbBwtxVgm9RX6Eqgo9UQYG4y28JSPWoK4SgdV344lNBOikk9PUAErK31Or86Nr
         rRYI34+g1aS5M5WOowBx+AKv+Izkt3k6SZDVdxHFux/YdEXsPkwad5+6wwB8Vdg8fxJb
         JDShF6CvbNfH8rLTHKqOipvo3GXJK7zVdxfr1VM34nbD1Kdxk5ZVJmiSEgV79q2oN1NZ
         KUjt2kgW9Gmj20K8UUJheNxT9X9ThNQR2ISMtSuPHfEUvdwESkXpq4rpKp/WTai6HEXy
         oXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027418; x=1784632218;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H8Lmc1955vPOPYiwoUhYZLkS0rJPbsj+7GV3/G/E1Oc=;
        b=H/cD61kQSKYPMVPEdEe6Lo4ApSFBEMss3+CTuZB2fQLEl+P8eEHfnedriNAM8bf0Gs
         itUrfPcM/o4QTgadeuoU2r6dhqEp5ahAcn7INmU0DKhDRwrgVLmEkcmrw8nsSx7GoSvM
         6P5A8Zz4V0/7K7kdW8L3XcjckVt/s4HyY+9qz8RSV/oA46mNZkt6RtU8dEizQXZLjL9x
         VUxjd+IsWixlWqfhZgtYsLA8QH7DF2N2H3CAYeZtKCjqKU4+10E/IJE3nCTN2pqM9Fq/
         b56AhQn1lZlUZ17HBQ9nyVC7ox17trjfQsviFqkR50xpLA6eoEfkMe05Bi3eEaVusXzx
         FA9g==
X-Forwarded-Encrypted: i=1; AHgh+RpGk4R7fdNJuxVVvxf/OvRFaLdOY4wo9O43/aVbb0AB6Yuq/9BDeitHpER+SOXb7ySwmmc68aeqeA5J@vger.kernel.org
X-Gm-Message-State: AOJu0Yyin9mZlvcAMh26tKQhp8ZntmrXxjxSU0ttZtViRFv5wrJtm/9y
	xWRFLZ7JLmMQteu8GsAT7cP4uX8LfIw/9AoRwvbaMdodY1JOS0r7yooW0lq7ebGLUDdWv3XS2jY
	VyVCaC9JjpiRBJ/4OEkrJxvo0BUycEaAkYcgc85O4/p/nlY7E6JhvbKM2h77bEn/5
X-Gm-Gg: AfdE7cn8nrh610jxNS78uHd+7MrC83Zb93S4NpFlEkPOaOU1Avh2ejLU69uhxqyTJ+s
	xb+Q5QoNh86ZybPQwH8V7vXtFzriJjkIHjS5H2R/9j4V0gM850L8bJ3lSsaSMYjq9OQ4wX0L6VB
	hzc9FBi0rSWT+FnbxedwTZCwP407B+Vy9oPEteu0+yOQ4A5sf5uYVF6VOUSFglt0oWgnEt+ECD2
	5z9677IPzEAPVCXQ4706NL4dx0wf2yALl+siQIDfi/q6ZO0mX3X/Brd21qEN41YCLvgZdie3hZR
	UXrFGB+aUJZ1bnyUEqPEFBFrKYoXuiska9prIWol/sOPCHndzKPJdAo4GTddCB2CGhTZnpP5BDb
	6ZxZdj2+LGmQNqktVNKYJ4Eo1Ntyp1GHpqjY=
X-Received: by 2002:a17:902:f708:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2ce9f17913emr127075275ad.45.1784027418381;
        Tue, 14 Jul 2026 04:10:18 -0700 (PDT)
X-Received: by 2002:a17:902:f708:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2ce9f17913emr127074975ad.45.1784027417899;
        Tue, 14 Jul 2026 04:10:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bc1fsm114514615ad.55.2026.07.14.04.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:10:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:40:01 +0530
Subject: [PATCH v6] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-gpucc_dt_v6-v6-1-16bf5289572d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAgZVmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3fSC0uTk+JSS+DIzXaM0i0QTAyNjI2MLQyWgjoKi1LTMCrBp0bG
 1tQDJ2AJiXQAAAA==
X-Change-ID: 20260714-gpucc_dt_v6-2f8a40232381
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: ifaby6UQNhywYmOz0oL6516kW4O3Uo_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX7sjRtJ7+r4Iz
 svBqpks2I40WpVHehmSAXmXD37eCGa5CX4oWhdrN6C9n0VVc5irVHg4QldbYJTWtMarbPf5vinl
 4tVFFe+3NQo7WmoLunQIWdB77rC2O0hzbILqnkyeRfDKALyuL7oHv6SVVCz1wu8+SVQGZY0Mjzf
 wlvIMCIV8OQBvPjZixBgrb0/uFyYRTLRuZtEVWpr5APnHfBfv1nRG8XD5KIT3fL6ylkAZ3NA0MC
 S4FmW+XoVhcOvkFR7rR5YwKZUFz6xGTCc+zBe9eXoMpZXQA0G7teXPSL4MtQqITdEg8gadQMxCP
 gFa5HpsT7J+r7L8rew0cgcOcb65iuqegSHIbcdMkmWWpWaYL2e3BgE8Zx4Q5HwSxcdUcH7zqtJG
 CnMnc1Mu70XX6FSW51nkOvful6+gKh1G2+aL3XNYBO1gLqyN9chhlnr+XfzgdEnPgLHyiITw8PY
 4LW7C4rcFo0zNh3PMnw==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a56191b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_Kx2gsJmhXA4Nwk0zkQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ifaby6UQNhywYmOz0oL6516kW4O3Uo_E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX1W9wdvim01kq
 ZM1oC42SXK5ecf0NGmynoDIzlHn3MJRzrYAmJ7ZLSZ3x6CeIki8Uo3WpzILGdMUfWBYPxLOMfKx
 7eOFUrLhwbkRSya1xOSVGa8cC0UV2hg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140115

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
is simply a separate block housing the GX GDSC) nodes, required to
power up the graphics-related hardware.

Make use of it by enabling the associated IOMMU as well. The GPU itself
needs some more work and will be enabled later.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Support the graphics clock controller for SM8750 for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

The Graphics GX clock controller is a reuse of the Kaanapali SW driver.

The dt-bindings and driver patches from the previous revision were
already applied; this revision carries forward only the devicetree
change rebased on the linux-next.

Changes in v6:
- Carry forward only the devicetree patch (rebase on the linux-next);
  dt-bindings and driver patches were applied from v5.
- Link to v5: https://lore.kernel.org/r/20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com

Changes in v5:
- Update 'fw_name' to index for GPUCC driver [Dmitry].
- Add RB-by [Abel] for code and DT changes.
- Link to v4: https://lore.kernel.org/r/20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com

Changes in v4:
- Add RB-by [Krzysztof] for GPUCC bindings.
- There was a documentation errata update for GPUCC and updated the
  bindings to capture the MX and CX power-domains and required-opps.
- Update the compatible[qcom,sm8750-gxclkctl] in code which was missed in earlier patch.
- Add the 'use_rpm' for GPUCC.
- Update the power-domain/required-opp handles in GPUCC device node.
- Link to v3: https://lore.kernel.org/r/20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com

Changes in v3:
- SM8750 GX controller is reuse of Kaanapali SW driver, update the
  bindings.
- Remove 'qcom,sm8750-gxcc.yaml' as it reuses the driver.
- Cleanup the 'gpucc-sm8750.c' to remove the GX clock controller
  reference.
- Add the corresponding changes in Makefile for gxclkctl-kaanapali.o
- Update the device node for GX clock controller.
- Link to v2: https://lore.kernel.org/all/20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com/

Changes in v2:
- gxcc bindings: remove double colon & list the names for power-domains
- Link to v1: https://lore.kernel.org/r/20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3496f00ac4f5566809252ea0eaeae6cd5c7aac5d..6282730b67e28c6ed05837ec1d8d2149f9a92537 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5,10 +5,12 @@
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
 #include <dt-bindings/clock/qcom,sm8750-camcc.h>
 #include <dt-bindings/clock/qcom,sm8750-dispcc.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
+#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2180,6 +2182,72 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,sm8750-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sm8750-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sm8750-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8750-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x10000>;

---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-gpucc_dt_v6-2f8a40232381

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

