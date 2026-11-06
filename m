Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934138;
	b=b5vTL1n4yz16vfoQ19E419nC/wr1ZmBw6Gp1tZ2/1sF/ng3Zl1WWKPwcDxVuwBj5Qvu6
	 elJLIJRQ4G0STKcIMnEQrwWkDHcoI4/moqQqyvSmVReXXuZlsMUAkjEAooW0PdIy3eLUX
	 /JBOAPhZYa0d1XEfPqXYzJb/j/4UlXQTtsObaq+XTGCMCqnZi5RcWS/ZB9bOHZEsfiUJQ
	 DvuSKrWktvVXcSBFXNG25hvg8rG0gYvcWx8/HjIL8dcUyd7LiW3+epF2km8l/MIZqXIOG
	 izsdGmODqVyeH5bE7IFQtvU7AUzlz9g3L/rAON1ISr5ai0vaFUllMIxrR71T+G5nuiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B+aZU5rer7hSNVXElTsxzUZLFCGRIQh/JmbY4gqYPCI=;
	b=g34q65/Fga21SUVeMEQsARVU4Q+GUKuBeol4823o9nhRt03DniXBdjuxKjrvnv4gJtSm
	 rBecDrGx8LoxtgrNAMim8WEwwcbXrZ1C+LKaMuLucmHRaGWVzr+d1VlyRQqWPd60oJDmO
	 gSnhqP8R/mq9067ggHkXHMZJJRkX3J33PA3A2DezGbOpPQw/dy1MYF7clbhq1ObsJcg5S
	 BuCXiDJWL29Eb0XlfEplTl7p4Yz33zWco7/RCTfkYuFRBBkcNfnj9earDVCV4ShguBEyx
	 0h9VegjDZIRMZ1Pr0TR8k2dMY4UPERUjlwFMmdXmJacGMSlx2x2lev+IXqHSQNo+e3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=End41XFB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eh0+kJG6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3338606A32E
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3338606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=End41XFB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eh0+kJG6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ner5r2880974
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 03:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B+aZU5rer7h
	SNVXElTsxzUZLFCGRIQh/JmbY4gqYPCI=; b=End41XFBAz7Du18ldm4B83PCl7W
	CKtzN0kqhAmMFZWbS0jZsh/KDptMS4MiUZwKNLgTZ7N7WPLsoR+OkUiKhXcibt8V
	dejjdhCx2ivyQGSsL431QxNMnfdMlStjT0S0u2+BAL05lpfLkwiybSWBDiyDMZ/z
	L40jbVfmwHAYi+06ONO+KhtqAJboIFLqbz41mXYnic5NqgUTvPhxnq0HCg46q2CN
	DDFWkenTcbH6DsKVI8YDYhU93yShVT/SA0K1glae+auayCD642xgHq4vnrAFOjRN
	ykFzk7UO6/z7RjCj/LcaSQMYdHqmNJEmW5m1XpBLgjGwhsZkJlkU24yiWrA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3parm9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:02:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso356027eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934136; x=1794538936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+aZU5rer7hSNVXElTsxzUZLFCGRIQh/JmbY4gqYPCI=;
        b=Eh0+kJG601QIIrmHxdH95/1+C3t3C5mypDAorhRJT4a4RFYxJTKiL3MaPLXptlcjKG
         Ut0/n5adPpFcYNaJEsKseX2DpW4m+57nRC7EaFjNRERs1sQreyq2y3Cio0ISVuOEMJdI
         W2uTepslZEPL83h2yK3cV3cdHiNOCDlmlJkQV6O0DA0CKkueGfp+rGVKgdPj0WO83OhW
         zbLNq3qV4QD/8okh6hnG83gPnawox5iDPrQT8P+Wl40+VA9qu/SuvT7IF+MV9/5Jl+8f
         YO449/to0BlQendH+QlBM3X3xXZ/48hsWCLrNuUBUFZd3Cjc16V5n1FhAWBPMMxysQq6
         nlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934136; x=1794538936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B+aZU5rer7hSNVXElTsxzUZLFCGRIQh/JmbY4gqYPCI=;
        b=bqjkdogS3GzY5BQp1RvgoU2u7+V/pR4I8aBu3t995x8tyXGydg5nOHque3tTvVaQdS
         3gByCpajmBVju5Jr7XqrRSxUE7ISehj26DAGAzPDzqBKDnzne8KZo+gP94QI1UEb15P8
         auEtRUWFRpDjk4gqcUHqtMS6TAt0l7WX4LxW+cj0ihGgECYqhw9bR5f20o7DOsa+JQUF
         sz2B4N2pQ0d/3F49x/+/VSO4ndR/PNmo/amzfR7iWC4ba2E2U350EL/bjoADYAMtJYxH
         qGhXlnjacHe7Y20yTBN/0WxP3puSvvDVIUEMMOfKjs1B9hoTSrjq8Bmp2bji8jKCLqo6
         DJcQ==
X-Forwarded-Encrypted: i=1; AKwUvBznBioehIzO4Xrs/10oTlye+bPr7ZkUgW0Sg9GjF/0FuPvWxh43KlbBtvBtwSXcVotpqP6Qs6vlxGFT@vger.kernel.org
X-Gm-Message-State: APuU4Z/ei1Ec5aO++q16rSnbdu9FrGOh/hSm9VWi1upLkXdxwg1baoCe
	E8Cne85nKxpLGlPBh9m4H9Zr9v/EctJxIccrgNQ1CG8lVwCW9WzkI3HYrxoqS9Ls2H/GmV1MzjU
	sGxc948pOpOgkmd1mcVSsUlsTvg0+SkyDZzSyiajHxH8Q/6HAOJq5mUHKfyywmyv3
X-Gm-Gg: AYBFou3Iyhz3c304rVGBTcuYn5q0n4qdy3Lr0l/SrJaeXMCRaTwAJqj66+kRhQ/JytK
	+Jon85McGlLXkjRej1EWnyFweyqoCJq4Al13+OUWyh9E1GU5Xu07sDkTqHG9ioU7D4VGu/OVY2E
	HXH/8JOMBNfL392/xNjfUx6i99B0btS9krsgAiIxFKkiH0im5+9+K2zwaQm2dLjozRvVSjBvZI2
	ayvGUCdwsJZ2aveVd9m+2XmV4T9JW6T3kPMyBs78accos0+69CoZWrAO4bTbmONjT86JuYpO5TP
	yXabWoyQncEir+r4X4neZJsSHqcSEQzvtMHtlwDpaHV7gJeOssxwmg0Ir7covwj/IpMFYjcCaFi
	7kGkkz/Rn6Ml19IKY/fVREnH8bg66CS7flnl1OVJKWStbJPsvji6hKYK6nLyO23WMiotylx0ln7
	stUYyOxIxTufzgWWmw5FLJlfVZwmQ=
X-Received: by 2002:a05:7301:18ac:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36f75b1f65dmr1645464eec.21.1793934135700;
        Thu, 05 Nov 2026 19:02:15 -0800 (PST)
X-Received: by 2002:a05:7301:18ac:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36f75b1f65dmr1645407eec.21.1793934134947;
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY  common-phy providers
Date: Thu,  5 Nov 2026 19:02:10 -0800
Message-Id: <20261106030212.2811027-2-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX7WeYDHjq62Nr
 +E0b2O862zYO+bxMasrY81KUNKrxU4OpUjvOX56J962yyLEzlOSfjbXEq3e3iN6IwTOpmcAu+ri
 j5KVh8QGy1BB12smmVWU6iuAQK0dmZWnBRfviI9bYzyoub05QKgO9QBGTfJqbccDhskP27oKQld
 /CcA1q5QSCRvvqVRQhxr6pyt2s1yfXAZdX+3PgJRZNKWkDbZWHrTKMeKYiJCNqmkQy62Dzovfwb
 X+jEniovVVb7FjL/PvxI5GjXVGqJEDm4IpsoosZ1uTbi2KbEgpC7Kfuu5XxExA6HRJLZJWHrlD8
 7vkJhtnmK5xYpL39cKncAGWoJ5Eb+hPf0yDGWgJ0G8i+D3xgOPZIHYup7Y4DDvAXPlPrGYpxops
 uRQKE1MabzCUaHrmaOglAyBHwrWIoa/l66GY5CupAm6zYalr3F9VR7jxjERvvjDdoJLktobjeIU
 2mt5BUKbGksYRaqyQ2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX0wwm+bOHa2hh
 402c5xW2LV6LuH/XojPQMDtD7W4PDfv6lTt9WIfdeAQqtDkBqGVlKkDS5izWdSXXEiF0mk5AJzZ
 Cu/4n91wuw+TjI/yh9XdbGctxYzIlsA=
X-Proofpoint-GUID: tFvFXQPypQy0nLS_LsKRmOtrSmYLgU1S
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed4338 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=jASa4ECRWJhfWmzZHB0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: tFvFXQPypQy0nLS_LsKRmOtrSmYLgU1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060011

Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
generic-PHY provider nodes (csiphy0..3) at their existing register
addresses, each with its own OF graph (port@0 sensor-facing, port@1
CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
once a board wires a sensor through one of them. The camss node's own
reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
that don't use a provider still get the legacy binding.

csiphy0..3 are placed after camss (ac78000 < ac9c000..aca2000), so
soc@0's children stay sorted by ascending unit address. Their shared
OPP table lives at the root node, not inside soc@0 (a simple-bus),
since it has no reg/ranges property of its own; it only lists
400000000 Hz, the one rate SA8775P's camcc clock driver actually
supports for this clock (ftbl_cam_cc_cphy_rx_clk_src has no 300 MHz
entry).

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 136 +++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..6909dfa06d86 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -545,6 +545,14 @@ opp-100000000 {
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
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -5348,6 +5356,134 @@ port@3 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,sa8775p-csi2-phy";
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
+			compatible = "qcom,sa8775p-csi2-phy";
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
+			compatible = "qcom,sa8775p-csi2-phy";
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
+		csiphy3: phy@aca2000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
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
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sa8775p-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
-- 
2.34.1

