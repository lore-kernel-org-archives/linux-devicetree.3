Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245671;
	b=s4hBg2REifaZ3c/tc0+WCE5RrV9/DyXOZf6uP/CqphXoC/iGedYDnoxM30QFYBmd1t6n
	 xkopOWLiV2ldWDe0TGbofYBNR0I3OqBYvuMHuorFAqkBbCOFSCQif22obJVJN/UqRHwAA
	 1La6jYI2Ts/pMsHhnKfbJzMM+wE3qOo8rw9OiLG/Rfszkk+7A70gs/r98gYy15sgd/x+y
	 ghn00UOQYq3OVg0gWCPqM/fbfetotGTL/HkcMyDpDjOetgPnGzzsgfZ6uEyroNARaR6q/
	 fLTKzX+/On0bW6tFzL3oRliqgCaEM8y+qtG7JrSRccn7l4ZMIRdq3CAecVGGtc2ND5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=81ztQ2e9VHWnInsYKcEW4I4anWtYoXY3uwUABd+23nc=;
	b=r5vX1Lz7nDN6NuuWrRj9hfUY3QV3nFvpCbBr+UwEjM+0ss1wzfEeW5V7By9Y46VxShNH
	 bw90hR94ez58FuuZeG/ugZ10GXzY/cKW8uCSbrZgfWdYYQ62YOLlblTuyMuErLd+YSQOK
	 cK9fM0SVvSar88gPOEccLKpzYwwFgXyJeQbhhf9k6YyGvK85kX+WwsQHA2kTcICyh69bC
	 +yzBoBt2wlrNy1C8xc7sNaLoKrrKH9ViaO9E2khNz3KXDJY8sg+mN7gcekQJ4GsYymPR4
	 oIF1K8RNODc1T9+5vInxZUont2cjcf33PO2zd7n169moZ8IQA9ICMKAdOcs5WazrelA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WF+I7oyb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXQc5Awi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A600A606A323
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A600A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WF+I7oyb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXQc5Awi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jihR2843099
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=81ztQ2e9VHW
	nInsYKcEW4I4anWtYoXY3uwUABd+23nc=; b=WF+I7oybYzXJHBpTgpe5fGVM63l
	UWXcpWfRlC2cchKi9bIrC4lWM1RJJPsdmpx3E/FtaO84cfUQZiPh2keunqR9aj0Z
	dC5JgNLDkd2octQ4VmNbSBo1qH/i2W4OmV3mVaUotkrMQzsJ25AyrYNmij/fwUf8
	w2nlsZyjvHKVHXod7yuRfCZH+cBMhoEhdRvM8LeFgiNM6qDtf2UKboTRnneJplgW
	/4ADvQi6h3W4H3OkMmkWXchTDRbSN3ot8jOyd1AKX88/h9RFJvmNfT85fUe708+b
	EJqLkeJGlit//hk9rbkLlX/FJHnoouiHWXo6G/dgUu0o5jyZ0w7QOOoBjgQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehkr6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2223936eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 20:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793245668; x=1793850468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81ztQ2e9VHWnInsYKcEW4I4anWtYoXY3uwUABd+23nc=;
        b=ZXQc5AwinjMgun/S/B6/Li2QSQC1zyPIAdg8RC/Fb8W+fXsYD9cxX6ZDd+N0Uot2bd
         KuXCkxIIuhFsJJe9gd5vw0+5uPHKhPYLolfSVyQiGezi8cLAQP3HcAXdiG8jtQy4HkWt
         SyYYeD1p8sF8YkM6zf3sOIEPoAO7U8juY65Y/dU4AUXvZHjplPvE/P/Gv6WcDDb9pLs/
         F4FcQVpWWK0zY90JEX65cNTiuNLnqu6r6fbrjIfiqIiEyj+VsVvEt7YXzms4tqut7YxY
         uBI1swv29nER+T5hte+QJGP+Mmg9zCLeqAL9iyy4VzCkAyuK5C4PLRjrUcS2/pjtd1it
         EFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245668; x=1793850468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81ztQ2e9VHWnInsYKcEW4I4anWtYoXY3uwUABd+23nc=;
        b=09uI1Vzs3N2CxJFMe6yOVsIjTjk7ywTWZ0Kg/yLJ983NVQfoCNgnFvCjKABAof9bm0
         dojISL+WKALS2ihJ1aJ8oYfAAlmz3Ov0X+mGnVrjpTkoHL8nIp3DcKH1EFawvKAgWoCa
         RTwpr4owZRGRvZ3ZSX2tZubXOsYpIzgWRwXodMj/m1W7fGggNbI+ZFa2M600pqHJoIXW
         GN+yWwBI0a4gSZJRlpU/QVFdJ8l5KqoCRTrY4bkhbuMcL0C6B6DpI2UPy1MovaaoSJyT
         fqjObOrobn18Is/3Jjzv0WVcoLPcpmeqYn7hRySaEGmrQhEuX6TvOCQ6/R8d+jman8c5
         XHLQ==
X-Forwarded-Encrypted: i=1; AKwUvBznHPrlAgaaGmqPO3GLjOVGrGKUBPNzwqgkG00s1ae2E+/Our+3BXIS3BCjAj8HGYNyYhP5FdRqFC1O@vger.kernel.org
X-Gm-Message-State: AFq9FYLbJuB9wXfC+ujdxbQ1/KOACSJd5jZCr6ELioNC5mDJNm50WTki
	sUZSyFXoegegeSllUkpzQ3WG6K+r7bn73uTvFVnti+qBHB+2PZDaS3kUvCK/kLRxFgGI0ycuTRA
	hnVh2n93NVKehuFhwWb+vRYaAtRuSgJRd8juPF83SXO5Hgykl3UQS9reypE+Tlmj7
X-Gm-Gg: AYBFou2Ij/s2qpJQ+9sXmXyCRnTjpMB46xbR7fCDDmhSdYZPaJ0SoxUgz+3AyytOKf3
	YEPS6YiHHDHrSa6MLVlUHUpbeWEE3O3p7Wl801uSsBNtdXq+daO+239IFKKpwdhLFzsDqo8g1WA
	inLZwk8xcjs90SBzzxxBwjevUqXYtyxImUdHVo494QRFc4eTKFT6/plUfFuIrsGPuQ2YS/GV8J1
	QTFsxTpFlsNS79ibvB0+/JmD01IXWf6coIDXhhBDqsMlQrrqatKSHGW4XUE7/J7hYONrPV3rdJa
	vx57ALhqGOe0j1xNnuenSlmHjS2Ev+/F9/pYZlRGaQGUFcDCVw4tf4NgurAMz55bDrulo27EJhD
	K35vlkQULSp0A93gveQf0SjHJao32oNucfNjFY5606zdQHpKSF8ndYyYfW4fGssMRYSmeEW4Q0K
	SKMEiDempx+ItgiFvPK6ZEhdhIjMQB2nJr
X-Received: by 2002:a05:7301:b09:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-36a2002d2cfmr5375851eec.11.1793245668089;
        Wed, 28 Oct 2026 20:47:48 -0700 (PDT)
X-Received: by 2002:a05:7301:b09:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-36a2002d2cfmr5375803eec.11.1793245667280;
        Wed, 28 Oct 2026 20:47:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add display subsystem nodes
Date: Thu, 29 Oct 2026 11:47:26 +0800
Message-ID: <20261029034728.633495-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfXzxUBpUXwmUEf
 44rEb1PvMFRN0A58Ic4tYPv9VDJU3ROzkjeFOYNtuXNEIL6aJGF7LI/vRfR6HP9r519lqs+Qe5g
 mrc5F48Oev+l7jXMCPazCN1pPcSi5ERtY38gOiSDemV41kD6P4Rvfekm0XkLhC0njs3CBzC6+ki
 9lwpTt+AeGNu9hsT+LmRIA3YKpGyP/N/rMVPjZEf7Ma8u/ucBaJiAh1yZgFqe/LfDy0qHx7oeN6
 Cb89CVe2KYAo1mq5oB03vwroCi/Qk+tm3o5BKmFyORxM7Fxjwh5CndkdY2pri7GBx35ivRxCMLy
 Sewra5uCSsFMINNXziysTf6zg/+NR/JSTkZliRm0G24lOZbRHW2d4sD8/mrHVLGjiajj+PdkaqL
 zm0tM8EQsVLyH6x54WoulbY1/yI/v4rQt6zUkfNOmPZsL3ytWuLStDYCa/UFI5yYUL00MCSB9o3
 QM7aNvamfC/7/OKbsFQ==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae2c1e5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gC6DbA464-M8M4PdBjYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: sq8YUJBoPWLCKYtDjHEMXLokXksEHihD
X-Proofpoint-GUID: sq8YUJBoPWLCKYtDjHEMXLokXksEHihD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX7bFmRKkdReAe
 XSMe0kzp2zvD55CGpIUmrtki6hlyhAWPFizH/2bBC95mHL/kagY1atwLnRF5ox4wvzUrpGwH9I2
 t4g6XxF8SPINI03bWsHKHqmKE08LX3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290013

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
dispcc0 and dispcc1 clock inputs, which were previously stubbed with
zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 407 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord.dtsi          | 264 +++++++++++++
 2 files changed, 663 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..08285498baa0 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -346,6 +346,373 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 	pinctrl-names = "default";
 };
 
+&mdss0 {
+	power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+	resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+	interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem",
+			     "cpu-cfg";
+
+	mdss0_dp0_phy: phy@fc3a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc3a00 0x0 0x1d0>,
+		      <0x0 0x0fc3200 0x0 0x128>,
+		      <0x0 0x0fc3600 0x0 0x128>,
+		      <0x0 0x0fc3000 0x0 0x200>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_0_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+
+	mdss0_dp1_phy: phy@fc6a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc6a00 0x0 0x200>,
+		      <0x0 0x0fc6200 0x0 0xd0>,
+		      <0x0 0x0fc6600 0x0 0xd0>,
+		      <0x0 0x0fc6000 0x0 0x1c8>;
+
+		clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+			 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_1_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+};
+
+&mdss0_mdp {
+	clocks = <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	clock-names = "nrt_bus",
+		      "iface",
+		      "lut",
+		      "core",
+		      "vsync";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	operating-points-v2 = <&mdp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	mdp_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-417000000 {
+			opp-hz = /bits/ 64 <417000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-532000000 {
+			opp-hz = /bits/ 64 <532000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&rpmhpd_opp_turbo>;
+		};
+
+		opp-710000000 {
+			opp-hz = /bits/ 64 <710000000>;
+			required-opps = <&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
+&mdss0_dp0 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+	assigned-clock-parents = <&mdss0_dp0_phy 0>,
+				 <&mdss0_dp0_phy 1>,
+				 <&mdss0_dp0_phy 1>,
+				 <&mdss0_dp0_phy 1>,
+				 <&mdss0_dp0_phy 1>;
+
+	phys = <&mdss0_dp0_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp0_hot_plug_det>;
+	pinctrl-names = "default";
+
+	dp_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-162000000 {
+			opp-hz = /bits/ 64 <162000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
+
+&mdss0_dp1 {
+	clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
+		 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+			  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+	assigned-clock-parents = <&mdss0_dp1_phy 0>,
+				 <&mdss0_dp1_phy 1>,
+				 <&mdss0_dp1_phy 1>;
+
+	phys = <&mdss0_dp1_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp1_hot_plug_det>;
+	pinctrl-names = "default";
+};
+
+&mdss1 {
+	power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&nwgcc NW_GCC_DISP_1_HF_AXI_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+	resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+	interconnects = <&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_DISPLAY_1_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem",
+			     "cpu-cfg";
+
+	mdss1_dp0_phy: phy@fc9a00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fc9a00 0x0 0x1d0>,
+		      <0x0 0x0fc9200 0x0 0x128>,
+		      <0x0 0x0fc9600 0x0 0x128>,
+		      <0x0 0x0fc9000 0x0 0x200>;
+
+		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_2_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+
+	mdss1_dp1_phy: phy@fcca00 {
+		compatible = "qcom,nord-dp-phy";
+		reg = <0x0 0x0fcca00 0x0 0x200>,
+		      <0x0 0x0fcc200 0x0 0xd0>,
+		      <0x0 0x0fcc600 0x0 0xd0>,
+		      <0x0 0x0fcc000 0x0 0x1c8>;
+
+		clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+			 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+			 <&tcsrcc TCSR_DP_TX_3_CLKREF_EN>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		power-domains = <&rpmhpd RPMHPD_MX>;
+
+		status = "disabled";
+	};
+};
+
+&mdss1_mdp {
+	clocks = <&nwgcc NW_GCC_DISP_1_HF_AXI_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	clock-names = "nrt_bus",
+		      "iface",
+		      "lut",
+		      "core",
+		      "vsync";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	operating-points-v2 = <&mdp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+};
+
+&mdss1_dp0 {
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+	assigned-clock-parents = <&mdss1_dp0_phy 0>,
+				 <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp0_phy 1>;
+
+	phys = <&mdss1_dp0_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp2_hot_plug_det>;
+	pinctrl-names = "default";
+};
+
+&mdss1_dp1 {
+	clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
+		 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
+	clock-names = "core_iface",
+		      "core_aux",
+		      "ctrl_link",
+		      "ctrl_link_iface",
+		      "stream_pixel",
+		      "stream_1_pixel",
+		      "stream_2_pixel",
+		      "stream_3_pixel";
+
+	assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+			  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+	assigned-clock-parents = <&mdss1_dp1_phy 0>,
+				 <&mdss1_dp1_phy 1>,
+				 <&mdss1_dp1_phy 1>;
+
+	phys = <&mdss1_dp1_phy>;
+	phy-names = "dp";
+
+	operating-points-v2 = <&dp_opp_table>;
+
+	power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+	pinctrl-0 = <&dp3_hot_plug_det>;
+	pinctrl-names = "default";
+};
+
 &qupv3_0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
 		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
@@ -903,10 +1270,10 @@ dispcc1: clock-controller@8d00000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
+			 <&mdss1_dp0_phy 0>,
+			 <&mdss1_dp0_phy 1>,
+			 <&mdss1_dp1_phy 0>,
+			 <&mdss1_dp1_phy 1>,
 			 <0>,
 			 <0>,
 			 <0>,
@@ -970,10 +1337,10 @@ dispcc0: clock-controller@af00000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>,
+			 <&mdss0_dp0_phy 0>,
+			 <&mdss0_dp0_phy 1>,
+			 <&mdss0_dp1_phy 0>,
+			 <&mdss0_dp1_phy 1>,
 			 <0>,
 			 <0>,
 			 <0>,
@@ -1106,6 +1473,30 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	dp0_hot_plug_det: dp0-hot-plug-det-state {
+		pins = "gpio51";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	dp1_hot_plug_det: dp1-hot-plug-det-state {
+		pins = "gpio52";
+		function = "edp1_hot";
+		bias-disable;
+	};
+
+	dp2_hot_plug_det: dp2-hot-plug-det-state {
+		pins = "gpio53";
+		function = "edp2_hot";
+		bias-disable;
+	};
+
+	dp3_hot_plug_det: dp3-hot-plug-det-state {
+		pins = "gpio54";
+		function = "edp3_hot";
+		bias-disable;
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..f159622a5876 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1735,6 +1735,138 @@ compute-cb@6 {
 			};
 		};
 
+		mdss1: display-subsystem@8c00000 {
+			compatible = "qcom,nord-mdss";
+			reg = <0x0 0x08c00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu_1 0x400 0x2>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss1_mdp: display-controller@8c01000 {
+				compatible = "qcom,nord-dpu";
+				reg = <0x0 0x08c01000 0x0 0x8f000>,
+				      <0x0 0x08cb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <0>;
+
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu1_intf0_out: endpoint {
+							remote-endpoint = <&mdss1_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu1_intf4_out: endpoint {
+							remote-endpoint = <&mdss1_dp1_in>;
+						};
+					};
+				};
+			};
+
+			mdss1_dp0: displayport-controller@8d54000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x08d54000 0x0 0x200>,
+				      <0x0 0x08d54200 0x0 0x200>,
+				      <0x0 0x08d55000 0x0 0xc00>,
+				      <0x0 0x08d56000 0x0 0x400>,
+				      <0x0 0x08d57000 0x0 0x400>,
+				      <0x0 0x08d58000 0x0 0x400>,
+				      <0x0 0x08d59000 0x0 0x400>,
+				      <0x0 0x08d5a000 0x0 0x600>,
+				      <0x0 0x08d5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss1 12>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dp0_in: endpoint {
+							remote-endpoint = <&dpu1_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss1_dp1: displayport-controller@8d5c000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x08d5c000 0x0 0x200>,
+				      <0x0 0x08d5c200 0x0 0x200>,
+				      <0x0 0x08d5d000 0x0 0xc00>,
+				      <0x0 0x08d5e000 0x0 0x400>,
+				      <0x0 0x08d5f000 0x0 0x400>,
+				      <0x0 0x08d60000 0x0 0x400>,
+				      <0x0 0x08d61000 0x0 0x400>,
+				      <0x0 0x08d62000 0x0 0x600>,
+				      <0x0 0x08d63000 0x0 0x600>;
+
+				interrupts-extended = <&mdss1 13>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dp1_in: endpoint {
+							remote-endpoint = <&dpu1_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp1_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+
 		ipcc0: mailbox@9007000 {
 			compatible = "qcom,nord-ipcc",
 				     "qcom,ipcc";
@@ -1745,6 +1877,138 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		mdss0: display-subsystem@ae00000 {
+			compatible = "qcom,nord-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu_1 0x3e0 0x2>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss0_mdp: display-controller@ae01000 {
+				compatible = "qcom,nord-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <0>;
+
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss0_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf4_out: endpoint {
+							remote-endpoint = <&mdss0_dp1_in>;
+						};
+					};
+				};
+			};
+
+			mdss0_dp0: displayport-controller@af54000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss0 12>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dp0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss0_dp1: displayport-controller@af5c000 {
+				compatible = "qcom,nord-dp";
+				reg = <0x0 0x0af5c000 0x0 0x200>,
+				      <0x0 0x0af5c200 0x0 0x200>,
+				      <0x0 0x0af5d000 0x0 0xc00>,
+				      <0x0 0x0af5e000 0x0 0x400>,
+				      <0x0 0x0af5f000 0x0 0x400>,
+				      <0x0 0x0af60000 0x0 0x400>,
+				      <0x0 0x0af61000 0x0 0x400>,
+				      <0x0 0x0af62000 0x0 0x600>,
+				      <0x0 0x0af63000 0x0 0x600>;
+
+				interrupts-extended = <&mdss0 13>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dp1_in: endpoint {
+							remote-endpoint = <&dpu_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dp1_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

