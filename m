Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934143;
	b=ESlONXnPGPmSEg965d3+YcV4X6nw7ZX0G1+V69p68OeqSIOOaPdj1rKZQjDTCvd+kRlQ
	 OTWteYB9wCHW4vy/k72UZoz3yOqWCCq+qY9cjdsOEGSbfEjNHs6e5AaCM7kQ+pkiQIaq1
	 JS1VFyvvWsfecsUivVdCAjilOlKfwY8fGBP9EzVtlnYVf5qJgmRRNZ3P3Q+pm4DyTnXnA
	 2rl9Fm73+xiz/2lb5HzaL+Uz8B2ITczwtYc0FVg4H4LeM3hNi/4ZrcvRLjSb3NEmHFUCt
	 2Z8KykFpms+0VLZi4wRmDhDNwUXKEnMt6QBMq4Ed4KSqu/RoypBMO/L/BVHhYUMfd7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5UfA3BOUgK1alGio0S87cKIth7FxeOkstkWYSgowzaU=;
	b=34aHw0q2fH2twHSc/SUa1SZpLnltKc/Non3hpGMGNSfzHsx4pLsdLapMpW65ZA1Yjic3
	 aVFvNa+mLx6yZu0jav/+1mCmDtfbW6shwWOFm1eEKwEA+ROXxTZUuTcP8TdXQSyHqP3Wo
	 h/zrw/IZyqGq1yUAGYYbhY9s+tSyMgyZvm3EH2Ths6QGy2qI7eif35QNyGRc45PhkqAZ7
	 WG+3Rg7eUpNDlqVoCEmGk1UffwY3+Fgduhoq759SvoKYuY+w8Lv+Zn5QLb4ef9FBaHtO1
	 aS6egx3tMNfRADhwltLJ7Z0ibYE3+6ljvTj0WUJTtf3N1nC7hEaeWPM7FudKd6PG85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lQnhAmDZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0Izb9G3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9532606A32E
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9532606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lQnhAmDZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0Izb9G3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Nerqu2274553
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 03:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5UfA3BOUgK1
	alGio0S87cKIth7FxeOkstkWYSgowzaU=; b=lQnhAmDZPR2roZQI0nbHuXYtDHI
	xQ1THM1bvUCvie+0+B2k3ml0HVSIzB3GHmI0YunAzicoLiru/hmf4hPmZUMH6q4w
	pZIRNBNOKYzKodlk0yZXkOM/FkYtfc/IEfexSoqGyfIB3HlSvZT4LyFVvqiSSKXy
	AurN9odzGg8zZhqejoMxk6ntO+KoguEsd4P5K8mjHE4Qinp8lTAyhsgTKKiHx/6X
	JxR4LK8PeU54nlob2b5q/YICNZt9VNACNn5vLHg1lO5Sg3dKKl+vEf+hJwsuV3a+
	cZUxuRtrCYh+9GWcHf05EXtoc36jw+QzWmv1Vr/Q33v0k0+POIQz8DywwXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0mtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:02:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36cec75d8caso271158eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934137; x=1794538937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UfA3BOUgK1alGio0S87cKIth7FxeOkstkWYSgowzaU=;
        b=S0Izb9G3O9Hs3YnAlYJp1rXEWxSwBKoXmC4ZR17EPMb6HxEO79KKuOalZTps+Ect5n
         TJoZeofgew/XAtjudCpNS2sbYMvkqtECqPOalwYYDEe7KiT/17iATmMhdlIQll3C47eI
         zvdEmUIYKbHamlJguYaTxFD0jIKgA/Aoq0gZ9qvTxVuoKcK1MJMP+9ZHf7NLntR/k97N
         DpoH72vIKw++3sl/VxrT/vf/vb9MzYsZE3ZnWUwqMBhi9sWQzLn3vBbsEo2YmwXMXuSL
         WMINQ4Mow6EkIpPRxzSFj6eJbrR28zNxB2WAc/SiUqfCXYbLLmza/8511+bsLi7GvaBo
         vvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934137; x=1794538937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5UfA3BOUgK1alGio0S87cKIth7FxeOkstkWYSgowzaU=;
        b=P4fmK+PTyl8pYw6gc6QIBc9EDs3yUNGvYcA/gvg+Vl3VqbTFf2oJhza6FYQ6PEb5+4
         PxkiSqAOYDl7DNgWwUbdMW9IwM7pAqWdjqlQi66WuGiMYMPXtJ7GWXB1mxLe8oeaknmm
         EBYmmcJZkff1y7wjqaIWZdtgZ3mEq3kmJe+Z5ffYf4EAGdgipVHrbN7GWi01lEDtvHDE
         5Qky3DwkH1iVVOSMpx38NeeC1w4R62nUOMPCujQtv1b/DB99eTgY4BNzWO8D23/XIveK
         0LR2aAEx2I2sQAZRRGMYRgOni8cmfBp3NGrleCqVRv6IfP46NZJwd4HAzlfDFuA9ajbD
         u2Pg==
X-Forwarded-Encrypted: i=1; AKwUvBy2uqPvGBMWXX4wImLC+kvc008dZohM4OnmWnBct0oOmF4hOHNWSbF7QXFwgWbUJFigtT5NF2Hg2p9M@vger.kernel.org
X-Gm-Message-State: APuU4Z/OLGyVvZ/k5OKyhJOpnWSZ3NIPJ2BNOHk1AEn5zxmYPIZK0Hgn
	il9cGo7PoVodebWJwWGJjJiW310CNDXzoQmjG05jw+D7QE4MFEciuxZ+zx/MJ1jg/K6calNHVj2
	m17oN+qGdhcfm5cIVwbumxEgw21sluhr6d+wh3b1aS4x1I7RYde3cVspsLV13EMkw
X-Gm-Gg: AYBFou2+p+bvboiRa/kdpv0FVTj5TTK72ku3wevOuyiSYWcc0QMpPDSRq6Kt6mTL7Mo
	IUAehMBhENkCtdvTa08XC7xiMCsLc6aM9t71dLoHdOjdbqFQRZMajPcSlYGbsUrwWHYsiEwhryA
	kE8KsPNbKl0dLnkoaGG9dYtI8k1O5N5MXM13Tjqxn4XEkgYepnED0U/8REfPm/+DnfsDyUS33Qf
	LhBKbeqPoK75fcGqYsRIl+polxFk9L5k8mMQXNAGgT1qPlcfVrZ7gJruvWNQ0MoqvKCqj4znS1W
	+BDyqCoKUaU37Z8gVOIIOgpuuj1AULUAP2VeRYNVInL1zUGw1WDutd9QvjeY9eos1Ju9rU2G+aI
	7gbWzCA0jI5pgwvzvT3JC6AFMpbzw4+qG3ON8Ib1EPMFIAzqMBH1MKEMUp7Bnx/0Q7Gd4TQjwTu
	WFp3rrNY1yq1/ty3AA5N2DykOrKSQ=
X-Received: by 2002:a05:693c:6205:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36f77bee0c6mr1721583eec.9.1793934136567;
        Thu, 05 Nov 2026 19:02:16 -0800 (PST)
X-Received: by 2002:a05:693c:6205:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36f77bee0c6mr1721532eec.9.1793934135921;
        Thu, 05 Nov 2026 19:02:15 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:15 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
Date: Thu,  5 Nov 2026 19:02:11 -0800
Message-Id: <20261106030212.2811027-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
References: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfXynycnNuCqmgf
 bX21yFveJMgMea8LlQ/aAeb3XzXLAg9IxFOsLHqjxc6ySZ4YcDTmoR+wcwkiq0thkanGosH3C29
 hBsgpFJCTTfUlc7aVvOOAObFpyI1bHXeu7P17ingBvmFHQSNDCQtho15hhlVMZliTwAsPRWkcfZ
 WS6seWn3ik1OuI6ByxqYHQ0RrHRh9HNxh+N+pzCqQ5l/OO22e1Qaa+QQ/bD/UdEXs3dnxKbVqJH
 IMX/hvu9GirYO1BPJhhP6aG/9QjMFokVRiLXBFqGY5FhIX2kVby9HJ54SH+3XRic2hnQGsKxPmt
 RBhbYo3Vo/M8rOfr+uBfjBsGkt2BM3sN609AtqqG61gbQ52Gm60DC4v2t8iw/9YjiOp5ax6V/Ho
 IsVjWfEn9IvJXut4Qz1SKlfiVCt0oCO6+rKgqdk+unMSQC9RZ/hLKyfJ/nZGVwta1sP9SjJW3YH
 05YOG6xuuQwDmGbMDQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfXzF8nfVBqyaCK
 mNgzE0Anu6aURp6lxEf3PXpPt2YCIL/A6IVmbWzVgp7/3dcU6cCynEFqtYngZmQePIVDtqfN27e
 TY+IzhcJ4a0O0Lc1qhyZ1mIQzQ7xInk=
X-Proofpoint-ORIG-GUID: sJGiA9FE5DphWrmMHYmIShfgIji_ZsIF
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed4339 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=n2D47ajo8674fvOcmZAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: sJGiA9FE5DphWrmMHYmIShfgIji_ZsIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011

Expose the three QCS8300 CSIPHYs as standalone
qcom,qcs8300-csi2-phy generic-PHY provider nodes (csiphy0..2) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

csiphy0..2 drop the extra "csiphy_rx" clock: QCS8300 binds through the
sa8775p soc_cfg (no dedicated QCS8300 camcc driver exists), which only
declares two clocks ("core", "timer") for this PHY, not three.

csiphy_opp_table moves to the root node, not inside soc@0 (a
simple-bus), since it has no reg/ranges property of its own; its
opp-300000000 entry is dropped too, since QCS8300 shares SA8775P's
camcc, whose cam_cc_cphy_rx_clk_src only defines a 400 MHz rate.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 104 +++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..a66c04a1d306 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -644,6 +644,14 @@ opp-120000000 {
 		};
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -5577,6 +5585,102 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0ac9c000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@ac9e000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0ac9e000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@aca0000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0aca0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		camss: isp@ac78000 {
 			compatible = "qcom,qcs8300-camss";
 
-- 
2.34.1

