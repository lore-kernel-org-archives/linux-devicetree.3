Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB70B40B100
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223240; cv=none; b=O4N3GQKy3VR0lE7r1A/1e+PEfPSjJh2JJDlASH9HLbigOMtdw1mnd9Yph3s9wfrxznkkHOc1FgoFkvAHWAU8dq+VCUc650Q5Lnxgq/xyWpgFw4m65GX8wWJ0gkq+7o89PXiP0asAd3RAzgHp+6DRSKA7bXlevCJqX+lCBBO0X0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223240; c=relaxed/simple;
	bh=gHiMMF9+59ORsIEa2YXcKeD17Rf90ZCY5R4mMJkgM/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h43hnzSAWxPex+uaUyTiiCh1OT8jbjdpfN62nSH3BnfcsSiD8tftXFkHkHEQbi9j3GxY0PNHyQVnce/bOf5tOkW1I5LBIWxQ48BYM44ncfcCHeuTHEwH7dTnARiD0oA1pEwTtdsEA31aog6hKBspeF6ml+Y17ToSuQSxa95cOrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvD1rC1h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fdx4Frlo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvD1rC1h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fdx4Frlo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K9JGbD2927192
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QhAJHqRXFjGOOt1jp1Ocls
	iq0lYXTfd9msjZvAFQEg4=; b=nvD1rC1hmUHrWHTUNXixyDJ+Pxe/aEsWuuIsQN
	09lXtnphkFdSk2K0DZzIObgliNQLRNrtWVPcoKkRgmdB7I9VFpzFcXFlWhjS/BAw
	0tfVaw2XrIi/Ck5XqZn6+BvCRv80/PR8JowgRIIsY08ARkBdpu2IxVYjdX40HJ3W
	w/QTs4glvf9OKO5g2tgJomz0+H9hRnLL1egbOVkxeMRveXi1hJnfkQLsNz1F9M1W
	IPREe7m2/8q/z0HWShKQuIYcUI8yK7HTFStOp3zfi8UfpYiqV6TDb7dbd3+pNb5q
	gTwijQSQWM686Xa3BTNYmXep2Kr1kALyC9qGXVGpLa+Oz+Ow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk0c27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:53:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so3380791a91.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787223236; x=1787828036; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QhAJHqRXFjGOOt1jp1Oclsiq0lYXTfd9msjZvAFQEg4=;
        b=Fdx4Frlo4nY2+ZgaJq1e4P1Lr77QrKYmyoLCeKpeDS9Ik+JwUA8WWomL7nAfa8m9yP
         Kbio/M4FKYJxxwos6wMDAfdI9T0yBwL4BxxDNwRlb2AkhwdROAI3T5tO7UGamWjfSX3N
         rLf6c7qFvDdNJI0x49Nt7BOkYG1kzsP3uuqDIPNCPLTWWT9CPOdMnW3j/jMqy5e/lyOP
         269GgneSxJuM1u2119LZn2Vw8g0JsZUn+w64zfz1gKHFzeUFqCz/NLm0bTpBWRSUyuGj
         Oj2MQBPBIaU36PkagJBfmq1v5HBk5KWf5bXK8/54mf2eHeKcktwEjOS7M8gFE/oyuBVJ
         N5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223236; x=1787828036;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QhAJHqRXFjGOOt1jp1Oclsiq0lYXTfd9msjZvAFQEg4=;
        b=Yu3LHM9DYoux4/eP6AlTNex4N/N8T+V3J5LxK1mf9Fs07/aeQkXBPV05SMqa2SO+6t
         ouFmnVBLMnFhP/W7DTiCDXd2F45w99Bui+Y7MGcjnXAllhR4pRdrQa/hAmjFIuA6cbv4
         /1Twkj11bRB5fY1N6PH+fFQ3DtZM5P9clFW1hr3F4OFfv7ZgNlodibFe47g/C2VFzXye
         tN02gqMTe2TuHu7kMwNcG9+U1iR4SNjd18lPgvDZcVOIUzV6SXEVgarpb2U7mHn91eLZ
         8wzRWYpn8d4NcHpy8SQa2gOLSMOc+rPrINgHKoxlEOmLqvqeFiDoOTVway5KEIG7L8Fz
         AHVw==
X-Forwarded-Encrypted: i=1; AHgh+RpOAmtD3qYh9AFls8Rqt0mSIqraE0tf2wVxHIRqcx7JiL7uKbTTMQB58kje5YTFOcbC5yGKE4hVKVDs@vger.kernel.org
X-Gm-Message-State: AOJu0YwPI4Q0j2lXmxPjPmpDo86x8PlGSApb9crvcutki+4lnsCz5jqA
	WboHcCV2tLP5LB9I4E3x3puIs/Y9HA4eyWqWzkmvEh74uknkeQk92xpE8Grn15iDhULGqClokd6
	myb3AWQ05rANeXm3Gr4EDhnPwlvwz+/dtqBUY0mGIdpSsGYpZG+JcqKAqqXxl11Ux
X-Gm-Gg: AR+sD10ph6xCpHMeTdtNn4CwdrPZRKKRPEQFuJ8C8YhyZQYP7c9Uy4qZm+XeYjqK944
	29wBtuKTPk61cVehjJzjiMjdXe2DuhesE8PA4mjiMnRc6ZJKv3jq5aBt4sld8lMI7CMpntbuwdW
	jklpJb26m5tQvRApjgw143E9iGRZ9Qx2s3RGvpji7/UIJ+UbteZfl522uTdjyeH6FeLhXQq9QjC
	H1BF2ONAKxuCq3l6+7u9ezoYreqsm9k3o9iApPxZzOKTshoKS5fjztxqVgOGv/IgK5yym68a/+Z
	4aGh+UW0cZJeuRsqUzWJssBf9TfRngehggzKHRXSfECWzI14kHg4QMTky48IKcPdx5Vk1JjJ6GV
	TWL5264BlbKD2/JgqVnfm0+pA85sUgFJcRA==
X-Received: by 2002:a05:6a20:3ca1:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3cd00f77410mr21694689637.9.1787223236335;
        Thu, 20 Aug 2026 03:53:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca1:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3cd00f77410mr21694582637.9.1787223235797;
        Thu, 20 Aug 2026 03:53:55 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae1416dsm21548873c88.11.2026.08.20.03.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:53:55 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:23:43 +0530
Subject: [PATCH v5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALbchmoC/33RS27DIBAG4KtErEsEYx51V7lHFUUGDzVtEseAr
 USR715sV2oWcTZIIw3fPwx3EjF4jORjcycBBx99e86FfNsQ21TnL6S+zjUBBoppxqkRNDb+J1Q
 HG26X1B7mtojUQa1qaRwTRpJ8/RLQ+etMf+6XOvbmG22avKmj8TG14TZnD3zqW2Ik8JWMgVNGG
 ZfC2tJaVuOujXHb9dXRtqfTNh9kihrgH9MM1mceIHtKcV04cPBuil2X/BOvePTUC6/IHhRGWGB
 SAOiV+cSDx8ULT0zvVZXAqtTZLJ9447LbgF2ffy/9LXwcfwH/JsIo2wEAAA==
X-Change-ID: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: GCSViMZEH6CvRmv98C9UwsYEsOzv7fXU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MCBTYWx0ZWRfX1yZNABDYPpOR
 PIPJ03m2wOcujRSo6fzlUn8vezFDEoG/3HsX3gp9XtV4NFUDh3oaHJgBv14vAMvU7h6Gpm7LsgH
 P0OgNRGP9oHAZ/taWe7LRdaYQG1NFUI=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86dcc5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=V-Mv52zJetWhkiZKUG0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MCBTYWx0ZWRfX2xMxf/XmcZPT
 lePBBztJ9qNJtR1HEl9PrbH7Nc946IHb29hjJz39BfMpxVHMhMeMJN+yDhWUILhVrhArQl5Qltw
 XFY0wmwe+E23WPzUrFx6p4yJIR2IYaxHBf3YQAnCHGeTXtgRk2IefyF/n3TKLXLMPJri8lG89w0
 9yos2hgOcweyB5ODd2riRV3UgY8y3a+6uFQn/bb2JgvBM6Obwwbs1MlgPSaRczvRYzuK1vPppW1
 OzKjpRyDmlSSE/vw+m1VzB1nq2y0FV8g995hK/eTDGHQ3tbdmbb0JQdvuQQzZHR+Wqq6tzdhol0
 iCy6lrU9qqY+TVpvZ2zgQWDP7McbLxgFzuDYcAKvWUvzFeG10ep6UZYqvjrZfPGsneyh4AYKIeM
 Qeap0ftFBHEIckL3A+HQpQgawCsZRs18MWkGWNtRb0mkG/wclFVrrCflsYrCtogLIo08k0s0Wr4
 J4nQ91e5tG+8egNjVEw==
X-Proofpoint-ORIG-GUID: GCSViMZEH6CvRmv98C9UwsYEsOzv7fXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200080

Add device tree nodes describing the crypto hardware blocks present
on the Qualcomm Shikra platform:

- BAM DMA controller used by the Qualcomm crypto engine
- QCE (crypto) engine with DMA support
- TRNG hardware random number generator
- Inline crypto engine (ICE)

Also connect the SDHC controller to ICE via "qcom,ice" property to
support inline encryption.

On Shikra, different BAM pipe pairs (for example 0x84/0x94 and
0x86/0x96) may still resolve to the same resulting SID due SMMU-side
optimization. They are still distinct pipe pairs and therefore require
separate DT IOMMU entries.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
This patch series enables SDHC ICE, RNG and QCE support on Shikra,
aligned with how similar support is modeled on other Qualcomm platforms.

Keeping just dts patch as rest all patches got merged.
---
Changes in v5:
- Rebase onto latest linux-next; patches 1-5 of v4 are merged.
- Update sdhc_ice power domain to match sdhc_1 PD.(Sashiko review).
- Link to v4: https://patch.msgid.link/20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com

Changes in v4:
- Update Patch 1/6 commit message to accustom hawi special case.
- Collects tags(Krzysztof)
- Link to v3: https://patch.msgid.link/20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com

Changes in v3:
- Fix commit messages.
- Collect Ack and Reviewed-by tags.
- Link to v2: https://patch.msgid.link/20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com

Changes in v2:
- Add fix in ice bindings to specify 2 clocks defauly for non-legacy Soc
  compatibles.
- Update commit messages.
- Link to v1: https://patch.msgid.link/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931..4815effba4ef 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -962,6 +962,41 @@ config_noc: interconnect@1900000 {
 			#interconnect-cells = <2>;
 		};
 
+		cryptobam: dma-controller@1b04000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01b04000 0x0 0x24000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x84 0x0011>,
+				 <&apps_smmu 0x86 0x0011>,
+				 <&apps_smmu 0x92 0x0>,
+				 <&apps_smmu 0x94 0x0011>,
+				 <&apps_smmu 0x96 0x0011>,
+				 <&apps_smmu 0x98 0x0001>,
+				 <&apps_smmu 0x9f 0x0>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <16>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x84 0x0011>,
+				 <&apps_smmu 0x86 0x0011>,
+				 <&apps_smmu 0x92 0x0>,
+				 <&apps_smmu 0x94 0x0011>,
+				 <&apps_smmu 0x96 0x0011>,
+				 <&apps_smmu 0x98 0x0001>,
+				 <&apps_smmu 0x9f 0x0>;
+			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
+					 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "memory";
+		};
+
 		qfprom: efuse@1b44000 {
 			compatible = "qcom,shikra-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b44000 0x0 0x3000>;
@@ -1013,6 +1048,11 @@ tsens0: thermal-sensor@4411000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		rng: rng@4454000 {
+			compatible = "qcom,shikra-trng", "qcom,trng";
+			reg = <0x0 0x04454000 0x0 0x1000>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -1074,6 +1114,7 @@ &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
 			mmc-hs400-enhanced-strobe;
 
 			resets = <&gcc GCC_SDCC1_BCR>;
+			qcom,ice = <&sdhc_ice>;
 
 			status = "disabled";
 
@@ -1096,6 +1137,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@4748000 {
+			compatible = "qcom,shikra-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x04748000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+		};
+
 		gpi_dma0: dma-controller@4a00000 {
 			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x04a00000 0x0 0x60000>;

---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

