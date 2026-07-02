Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955347DD50
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985284; cv=none; b=r6uA4NT577pNkTe5KeW4IRxIWMXlhzksLoNMCncjfIpKKU+BtHczG60HkxNCRO/K8zH3pR/UTOGs5c/8hVAJgjkWXTl5yKyqfdi/X9yrzudQL3xgryRV4XWqjpfRsQsKcPHqW2xWKH6KleuXXqZGhnFMVvNB/eOojcwVfmbjo3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985284; c=relaxed/simple;
	bh=wXfhjO70bjMpmqa+YusJcPnCp4qslQXECJzeR+Ed9Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YysbcUj/oF6mTceG/+jzhVglcbmHrK8Wzhl7W5whVf4nTQTockHUgcZ5nvT+K73FtgXYfNuZS2pHeFhrBF5quWR/qvYD+tpR5htOHD1lvulJOi6OE8Tjm/k+ponOduZzToPp/brQNRvcqwQtJGOjof4vZH6suiMs8a8XS3Pb4aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZiJcbDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPParWxr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZiJcbDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPParWxr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628kqx33049496
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tdNbsM/vh/z
	GDl0DVvXslkO+C3xnrt/1ywscht/tosM=; b=aZiJcbDjwu8YA90zuU0MzatWkw1
	NTwXlDgOcLCEsIm3SO8s91eav+9zcc1C0CzLMDE7g+dCYIu9T91blAz+PMWhNsG7
	e/wW6aABuHydyEVKRRerfo4iiZSbgHD+KWIVB8iMU9BYprzt8J5IkODVVIQECk3L
	xnyWk4kTu0AsYRKd70d+ZY3BIsWY5fmYH3euODrcQ1sTufjHBpPvdw/0JI2U2WnK
	rTSNF0/4v7bxTXrr5viJgh/KcsgJR8/quHzI2rqQz/M03hF+0D7J22vT6FpxSzYM
	GT8mWWB3uYbOwtYbDmao5BzINM0Kpy2kIBHSe3xQVxurBPB536Q4eaDmBbA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541v201-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:41:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so3048723a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985281; x=1783590081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdNbsM/vh/zGDl0DVvXslkO+C3xnrt/1ywscht/tosM=;
        b=QPParWxrKraSw+0aG0PsfY/TTLcqYV+0xTf1D8KDmHvrZEU9pUWEuXjlWgRCmiVHbs
         6dgE9bAO3vKgZsbUGRFJz5x5x2pqPSCnLpCLYq1wyjiYcW0xES1XtEy5XdKC85EfdcIQ
         n7sESMGyUspM2n4p5qWYx0W5AE8ibwXZLkeUYXCPl4gwenFeXWfzYFuuxeaoTGsv3Pb8
         B1f4BSon2fCPoaT4SAzcgakdqBBiv0aNJIGwirKYwkgMJdxbESkWVERD/uv9Cj+jC3ru
         an/9b8+dv57s86/tbe4pvk7Tk5HFRmfeIrnNRMFHKq/IkvUIC3QNxlqc+QQBkAlOw8sh
         zR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985281; x=1783590081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdNbsM/vh/zGDl0DVvXslkO+C3xnrt/1ywscht/tosM=;
        b=F/EyJ5/wA+hEET8XVYk0jIbsUP5n6e9g0iunWfqvmV/RxbwCQMTBMwHS2Y0VwTCOUe
         zzbq4RxYBN1WUTU0Fg16Hyc2+F7e49y+SlJ4DRCVyc+Qmd/YDN9zMkE+abkvllVVJrvk
         EmcdOgdSlNXOSQjOeeUtvLZ+bk8O95OUJf2HFK/nI7uMzARDP0xiVLDCpI9vrAPwnleu
         ImeaPmjwABZL9s0e35tDG8+NWzA1BOfMuGda/MtZLHLJ4woyYANVRJkbhPGS5f3shFco
         u/tvZIqNBXvqad/kK1mL1Zs44zepE+d57MA6HpdF9+tQ1FjkGmcV20Z2v6COVadK94Ip
         NL4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqAbtgmiU2RBNBYU6IpkLksVJ/x5dP7NHZiw163pwqbwpUnjjzKsa4goVHcXWLasAHu5ubFYm9vlUZf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbv7stowESc+kZdNzX347jOf2w/TQgQqKO0LPGLFIKwjRtBzr3
	HnIYGG2UKaPZwdpzGZAqS+dVcKSzIP2cIUuk9pHGYVg5mNP1eQyHmDiffcImJBerlsSLi8crfJm
	6AOP1N3B7iboZv/nNPV+MeUxmKmszKAnzndCqKhSrRVAEjEq3Gl+VSvDYpOSCzrO/
X-Gm-Gg: AfdE7cmdlvaqgOaxtnwI/YdZamb+u0miqR+BAnAlzDP2pbiHhNSq8W90A7r1qkcHFfI
	XW30CBFrLSvtzLiulDP76i+dXTQEj9ZI1v/0LAb6SJbK56FjRs/e4Lk+vTbtcA1MFxp4DZ8mvm+
	hscWRUov9u5xizDRcCmYokPTEEvT9eHDS/xmDxbixg+P2+zW2Ig8LeocK3q+C1taPfBJN2NpJ5d
	IGd3dV5DaP2IQY0hE4/Zqous6h6xgSyyFp7fVwmaQGDKccaXbb/mq2YzecWGRZvYpR1uyCAyypq
	YCJiDjVq0dnE74TulQS4DQ+O30guanMXaGdShuCrlL/gKjIpnbhgXDYEQZjS6tGofzIsbfhfzLr
	6ZiJMWLR2oKnNwf0ALY1/Ps1Yt7ZKegJpZwIxHQ==
X-Received: by 2002:a05:6a00:2d88:b0:847:bf8b:7d41 with SMTP id d2e1a72fcca58-847c5033e0fmr4300416b3a.22.1782985281124;
        Thu, 02 Jul 2026 02:41:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d88:b0:847:bf8b:7d41 with SMTP id d2e1a72fcca58-847c5033e0fmr4300389b3a.22.1782985280702;
        Thu, 02 Jul 2026 02:41:20 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:20 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
Date: Thu,  2 Jul 2026 15:10:55 +0530
Message-Id: <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r0uvFhl1Edi-XHHBdAJphO7FJ5rSQakd
X-Proofpoint-ORIG-GUID: r0uvFhl1Edi-XHHBdAJphO7FJ5rSQakd
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a463242 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9wC1NwHXjCwt_iaUHW8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX2liGvunx43ne
 wt4IYs2UXoJTLc23zorf5I5avash5P9GbTH8YvCKsffjflcp4KUD5bDWlLS8TMT4h3TdI/HY7J+
 Xz+llR1EOX77ZhAwyE037+ca5Y52dMAIOkSPj3xD25CBo64j5x0A4/ga8dhHHvLDYelidqkaCen
 Vkj9epZ8Lf+S6oDdZRr/G635P/2bmWZ8hTMC5sCCI3rPHKnqBI6Zqcb7WPv1kCDJV3ALW7JRh4F
 y6ofkYQsnoThF9AU8hDgrMWkKQMCo3pWhYZIMcd7u2kCgTNswfFs7umQLmYI7ldm+uFJsJfYPWq
 toGa4dJd4kowU/PbqQHvr24zdMrQKnXq62lPI5sFvS3AtvWSEg9KJKqDlkiqhMm9Rd6X8bqp2fA
 MwsUeEFVOwzVo/krd/nFV1385Ui5V8RNAxIG5cPjHySvw7ORLKQ4gqhbDGP6jAP10g8o3zcvYCz
 NcXj8Hj/PBHHvA4lMqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX29fyC9thEKZ4
 6nbFbyjw8XvYA1fQVy4rwntSSpmL+MdeX+e2/NT8TfOt9gyrQwoUD2YXL6Bw8GFicPZOfmxrF/Y
 owI2bBaGE2CfqZd0lyeaPmQeFOSrRiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Add support for SD card on Glymur SoC and enable the required pinctrl
configurations.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..70f3344b7382 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3927,6 +3927,58 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
+
+			reg = <0x0 0x08804000 0x0 0x1000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
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
+			iommus = <&apps_smmu 0xd00 0x0>;
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			bus-width = <4>;
+			dma-coherent;
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
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb_2_hsphy: phy@88e0000  {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -5714,6 +5766,45 @@ rx-pins {
 					bias-disable;
 				};
 			};
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		stm: stm@10002000 {
-- 
2.34.1

