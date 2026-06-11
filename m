Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25954386575
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167343; cv=none; b=mVzWwAvKIvFLE6SXWMQjBTMp/GlMdtzvtueThUt/Ag/OrSQuLhmu8nHM7R9vPidb2ddRjQCkQ0D/kuUbRH0wVxii0+lb79x+iB47vpY+i24RrC3J3Jj8Ayu/9Z2GArNW0aKlekfSWpkUA/XfSioFjh5t9cH1q39RwUt6srAcEL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167343; c=relaxed/simple;
	bh=PyF0fdYo6vWHuxwGNpxm+qWjdIOFh5r3zjzY73PIug4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=niqiSeBANvhnwS3ySFr6aQNloGluzV6QjVib1bLNFy8g+9PnRx4aWEYIWgLVrMvK9XJaGRxaExM+jn5ODmvSrXhN3W7Yf9GgOywejrNYvyrlSk/4MhEsJMeKvqiF25+prIIjWfaHhw/5r2epv1BoVfLojkDToXLFBsYm2jXdRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAS6rZUv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POX2IosA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAS6rZUv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POX2IosA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GHfS3791659
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j6YISKI8hlt2pMLbRmzG7/
	7qiLSl2ZGJx07vbqnHumo=; b=NAS6rZUv29sHcRAi03tKEras1jIwLlAttc/lqL
	gqhitX0YTfQKIy1xM4qS89NQu5Dxx09kKensjMxDR9OPt4GJaDW3b5G6FWWwh4z6
	lBK9n0VSsi4aVySJ8pDTCIlDaAG67AblfzkwDczsoem+eMISCCS2i596hthAnDMt
	2sR+okZG0O8Obim2a7dEOgzGJij6hAKYSIqddsTBDL+zuvFQnjOrKhS59nXK8l3k
	mSRLwigQJvcr9zy0FhNoJQVIC8CJKILxf5BwqMUK6bx00LkSz2qadpxn+vP8q12W
	hYk3ewa3mYGxCde/6WsrNF+7VTwb+nnQzVTF8z8OgVyX9Jgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702hu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:42:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0a99db8dfso82706485ad.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781167341; x=1781772141; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6YISKI8hlt2pMLbRmzG7/7qiLSl2ZGJx07vbqnHumo=;
        b=POX2IosAizPX238m8TajI/YmCW68drLaNdIx8MVblBvfJ4FNyix9x1/Xx+hu9gwFiL
         jzgJ+4H3594fHsl2K24qNDGvJwfDIWLMEHnf8frGUlHOZ0dUTraFz7mmtdKVD0+XA/Ut
         LrjFhuYr7YLeEDJ7bl9WItGugCM/s2Zbw3B7cGly/kti8ohusuAp3gprbawkY4EGVCC0
         uZZYXz7wITlXDJK51sC6iLTHD6kaiXwbUgfapuC/yleq2GPYev+3wxwh5uXRl0cwQtJC
         fWTTBXoWtM3WnmkQP99ds7vUsG30rp7ievY+iFAr8ZMOH+Nq0LT4jsjzdE+B5S5YbKKg
         INog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167341; x=1781772141;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6YISKI8hlt2pMLbRmzG7/7qiLSl2ZGJx07vbqnHumo=;
        b=p5dkF/bhT6gOFMRdDjAZfzhZjTiD1i9lqsptp37ouyPS4E/C4TTZRmYIdl+H7Mz/bc
         iPNN4CylZHPGrM0Nk1BwvTUoQtt4pAucmVWIdXjqrGgyiLkdFXR3SC1bPjCtp3s1dExt
         9oJ8iJ/jEnNW5no81SvzZYQGtq6Gk9yMKWwsJNghSBZPWez4D0NYFK5yr5DUp2OINbtP
         aXPgK4hAeBJINMr18HkmF1TdoAW+ziwLZRg256QAgKEtlEzVk8wlGsoB+oVbar9Tnw7C
         RNYowrW82yD+IGT0hj9arNmMjM7SRo0H+GiOMm1Zjo/JSty38qkIt+CZ55i1uPrMzwDN
         1dRw==
X-Forwarded-Encrypted: i=1; AFNElJ9Q2u4kaOy7Mf8kdjufufIx3UOzJstSKL8MRNievghsYsALc0Uak/qhDgDg5DXJOIHj/PFoFPvvJacm@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/jIDQ79U850qmwJzcHadQ3jkhHLLCRL00U0wWPJhb5Hsn1NG
	aF+4XytBve4pmF7eAQE5A+bYi2Bp+SI/XbaF5kX1Z2zPse0CLiG8fNQTQKSTp/QDiY4cIymR5kK
	APIX4gIcHl9slnJo2FLD7/jgDg0yv3hAUN+0iZe5W8hSunDLVv+nJkDcgkKcmrYDY
X-Gm-Gg: Acq92OGQrijIeWHqCdoxors7Rauq/tEgKyg8Azlz9OF9yYeb+l35JcPw9XCtmfYcppr
	r5yFXhdTI6EOcke66kxQiGvcYsNH9YmYxhgoGk7Yy7VpqtDzWH3Gsm8zW2R3JzDnGMaVJi6ZYZn
	FcgvkdnLf/Dvh0bwBhCjtFAD/ZUswDx0+FvcEGD4a0LbSxfprbKXICTHy/nQ8nnzc0t7bjZp9PA
	DTpmGDkwWngbo3T6A178ShCW/I2+yma66De39OsFC7FdMO83UhpFfrSJrpeffW2Nf2vntxx99XV
	In62HsPF/QDC81vYGF10zZFAtoURWu+VD+NBmhK1Vq92Tlsw8+/LpkBO66NzCmGY3qqV8Xl/b1F
	HLcKm2kqdcb+EbjXcu7iyzFaWfWghEv9MYRg6hVzjx7sYGx2FS49rGUKxDHvxluJymo0b
X-Received: by 2002:a17:903:3b85:b0:2c1:566b:f907 with SMTP id d9443c01a7336-2c2f21a14d3mr21045405ad.20.1781167340771;
        Thu, 11 Jun 2026 01:42:20 -0700 (PDT)
X-Received: by 2002:a17:903:3b85:b0:2c1:566b:f907 with SMTP id d9443c01a7336-2c2f21a14d3mr21044705ad.20.1781167339693;
        Thu, 11 Jun 2026 01:42:19 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm344504385ad.65.2026.06.11.01.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:42:19 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:11:59 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANZ0KmoC/0WNQQ6CMBBFr9J07ZBSsEZijPcwLKZ00EYL0gFjQ
 ri7FRZuJnmT/PdmyRQ9sazELCO9Pfu+S5DvhGzu2N0IvEsstdJGGVXA0PQB+O4fEcGNDBYDuDB
 94NC6xlrTWmO0TPNXpNZ/VvW13jjSMKXCuD2lRSZIuuDHSlgsqCzwSEblv3kgZlzzlTit9b0+/
 MPwLkGB3TeYt6hscdSXnjkbJnz+jFk6Z1kvyxdskmCB4QAAAA==
X-Change-ID: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781167335; l=3100;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=PyF0fdYo6vWHuxwGNpxm+qWjdIOFh5r3zjzY73PIug4=;
 b=mng5lhQ1cB6hwio/EXm0yQHJXHOhrxGKpAmXWWQ0R1YpzmwbuOe+b5O6iAQcgeDaagdZxVxx8
 nUrNV7proz0A5Oj3TLw6mqkVJW6X6SJnA2Y2keVbk9tOlMbPy8xusUK
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4NSBTYWx0ZWRfX0MJNaSQiVdjO
 s8Bo4jD/NBDWCqc9XzpOjGJkZURJAVyTNoX8XWiTeKRHQSTawyVHsVx9v0y78rCBUpx0vSGF7qm
 2lm3p2ehLkZMxDtot/BoZ+2G8+iJVGZHNfE21ltD1Gnmg3bpLufVFNgDBcnH+u2Utz+gA3WOLum
 DAw4npsdyLLMZcfLHz1WVVvXIO4h1CpiuL/1ww8EJAf+Wb+A3GBdoqi1YRzRQB6U/ax8A61ICzU
 Vifs4pZXKGDlyY9cBb+4WVtax/MkIEHd0Zhk3N6wPyr7xCFa6Q/WRX6UMlaX54V+lf89+U34DEw
 Wozc85nImxwHHyGaO+z+eSxz5lirHYA/kuDufKo9w5wKetCPEytHcVboCp0F9FMYepfLbpEmo39
 dXPu+jl+eB4UHtsfaprP9J1Eifrrg6u+9yubyawHO+o3CvG/08yzkmb9jx9RnVdAqfDShGOuzfk
 V0nTswvRLjbwsHAGhjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4NSBTYWx0ZWRfX7xpqmvFEZipH
 7F7xcYUx6uQ6uGfwBlALL48PTNznHzYu5zpMsFMWe4ubGKqkQskfacQFITVz1yd1Vp67kj6ySqQ
 LrgSuq0uYfUkpURl2Ow6hgk0jAoRz1M=
X-Proofpoint-GUID: BqjMPaSN31rW_EafQA43dcRSXNVfMtiE
X-Proofpoint-ORIG-GUID: BqjMPaSN31rW_EafQA43dcRSXNVfMtiE
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a74ed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=otCvKieYPpshcy_r5BMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110085

Add required nodes to enable the upstream BAM-DMUX WWAN driver on
Qualcomm Shikra SoC.

The SMSM (Shared Memory State Machine) node provides the power
control signaling between the AP and modem for BAM-DMUX. The
BAM DMA controller node describes the A2 modem BAM hardware as a
standard DMA controller. The BAM-DMUX node references the DMA
channels and the pc/pc-ack interrupt lines from the modem SMSM
entry for power control signaling.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..3e59d5f6323c0d857f376316faa26c503e67f6bc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -17,6 +17,23 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	bam_dmux: bam-dmux {
+		compatible = "qcom,bam-dmux";
+
+		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
+				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
+		interrupt-names = "pc",
+				  "pc-ack";
+
+		qcom,smem-states = <&apps_smsm 1>,
+				   <&apps_smsm 11>;
+		qcom,smem-state-names = "pc",
+					"pc-ack";
+
+		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+		dma-names = "tx", "rx";
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
@@ -314,6 +331,28 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mboxes = <0>, <&apcs_glb 13>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -640,6 +679,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		bam_dmux_dma: dma-controller@6044000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x06044000 0x0 0x19000>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
prerequisite-message-id: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

