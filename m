Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699473;
	b=sTf55DX5271VlS/vGOjz/wpt10bDNKkl3eRbABiM1D24RkaJGDpB/fY3hWMszTFWmjW1
	 MuKWgN9fU3MXFAefvXOgEfjqC3PP6ja1PoOy9JkYDKt/bAKNQdZnO5f5V/Fhb4BHryhnR
	 /X/mWFZ8pnKutXsRfcyWe6UwaQAHd/Gob6VcW0REQXzmMb7TH+jjibpB3ioxVTcCQ1pwA
	 uohio2s8IJphPVAmZHVVTNFzJeFgHYx+MrWsj3v/KCPKbtbmohb8KREMOWL3Tp+LrWvfd
	 2DbZR2WEuvWhKO4ZHU05xUGc0ZIWTu9/GyNXXaK2KHmVixKqB68m+CjIpY1Lr5DjneA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=agh+7DaHk9l6HM4O4vSm/A7msIgux62Q7vlo/Q1Z89U=;
	b=YAcQs4/+y3Ipa7crJEkleGHQ7T10iaj2Qgt2c6KHa0PPTP6BvjBq3gQHluLoiMQ9iC2B
	 MNNBM0JwFX/bVRYsZYcccjA4mYlN3cbRJj8PsBubnH1ZIJW8Ciz4lmcG31ugUyyFA/LiS
	 DFeZtgTSnR3/OBxnmskfxYQ4hgDb2giVxT0gcNytgVxX78i0Gm2BX51D+j2CiDqYYtYu7
	 bFB3Qo082PRgf+mAGrwnqjWdDnDYINyy/Vw9K4ZOEJBC0/xIG7+mW7+utktKcKGbI27tv
	 J8ZJ88XL12pJVGGK5pevV1YgfAoZaC5tG5TZrIufPg6iaqCr0nTH2UnlX60ikHSNqkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=REMyzvPt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aD0TTbhn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A10606A32D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A10606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=REMyzvPt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aD0TTbhn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVivj2263813
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	agh+7DaHk9l6HM4O4vSm/A7msIgux62Q7vlo/Q1Z89U=; b=REMyzvPt6HY4Stem
	GGkPk9+AHPwmDL6ZzzkW85PkW2hDcVmVNNelCV5rjYeqhAqI1kSh8zTb4vjMt7W+
	LPFBqEECYo//xb1MUK/Bx+a2gCQFdFcdrvYeAvnBccHi8I0MXmwVDWijjuJVnxb1
	k9s8Ulg8TEHlvnlcCfnQ0mHFxCKPxu51Q/J9f3NOLg49joqhQKeWIHQGMQ8YTtK3
	JZeD31Vc6U5Fnj8t29GkuUJQrkLa7PVhhR06sosGei0zL063AaTh25DSC9ls0NVc
	Vu8JHrrhH6DhiYgebpMvaSqq/+222Mb7j/ytoo0IaLXj30sZqsJBqV1SxzEEu7Bi
	i9C++g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aem8s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdec55db650so120484a12.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699471; x=1796304271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agh+7DaHk9l6HM4O4vSm/A7msIgux62Q7vlo/Q1Z89U=;
        b=aD0TTbhnvucpEcQDDAAy53k7J/rlgttOw2JBPVlwxgwk1jlKHrxdqotQ1xRttnh3Cy
         cCEu0m1157AgIo3Yir6VTBWfhbpXSjkKq4y6VFUfcxqfVL0uX7hC4R9VJmaTReTnL737
         xxyJ8BFjqisbxI79rmUri9Qs2MoOhGksOxbA3Qd1/9vt7IQxBjr1YvpEgZ7JPIgt+Oir
         Y8o2ivRpqAFGpsGRT4W5y1nxQYK4X3BU/wlT9bDdWlalwe59TemyohPPPWeSZtociQpp
         BMs/oCDL6ZepKJc51Wl9jAoMEpdcOhB7yaLxCxamBQ5Gh7vrosgnuvRaR1xUPhFi6kgx
         7kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699471; x=1796304271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=agh+7DaHk9l6HM4O4vSm/A7msIgux62Q7vlo/Q1Z89U=;
        b=hJ9JOMlWUxWw0WXkNE3AFkMg2WdIzmH5cYzamAuY1CTc6HkBnnk16zbD+LDv6Cegss
         /lClC3aYxJFqitOvjK6o2zyfm5gtIjVkBqykPC87/cE5xENJiiNZsvNDWuAvNq42CToJ
         PlI8xh1wJshQp7Ueyg+cV7aebdumldPXsQduVt1RGdGqLIMxCLQWMK8t/wIjr0fDIsR2
         XtyDTH50UdTdgRIE6IWvoyxoIe/BuUNtaZjAcEH941/5qv70hCxrF9LHuzdwF3TuuNC1
         E8lLUwG4D84HfOev83ffNygkNBpo1aXeLZweqSUGj2m60jm8AfGmiHkpEbVTNAAPUHHL
         fSGg==
X-Forwarded-Encrypted: i=1; AL+hErFjBbyJw1vmQaZ1qzO+CbAJx9oK8Ohm2E/4Uo+s3U0yf1pSsHi6KbUhcajYkGKGGzh16FuQYTjy2FpK@vger.kernel.org
X-Gm-Message-State: APuU4Z/tB3+2GigXKvozLd6i5SupPihP2fEtgcUYvV0YOpHkCiYDpr90
	ENVNZitTJMx/X/grthVxiHrEvL5aYOye97W2b4jGyDj8wKnLn+c9KhFiX/F35jJSXgm9w1mrlhO
	iKf5vPBFEZYJtnQnOkuKnj+68/H2E+FLpKd0I63qW+gy076GLoAIu3m1l42HRcHnW
X-Gm-Gg: AZFdTZcaJAfsLG1k85rb2Z4TtjwkjkNrdWRFow2f6tVfDojqjSSpLTInu+VMXu4Tg+h
	OnLuR6Vw3yL4ukteH2G/PO7LJ/AOo+jLq8ztFn64kobvbc+FdMZ3ImENwp22xrZy4GSqAtnQjD3
	cmOqxSmzupR1rQKbwBQtgZIA5JI3u6O5huHYgyPBsOJxoIKIpC2Tf+AWd4J3/VW//Bz15NO/An6
	qBzQyfgpDOauI+zlG2vxpEbiHRkdqmxLq8If5SWP+aAEg+Q6KAJ4lH4ZY7/9Q+A9yFf3c8sxFdP
	cV/VmcDMV0nZFr0gB5CMd1bw6mNkZgFVEPKM6WIFBItoQMBNFvnLVUUJ0Phlmqyjqlh2OsxDmaq
	GJOb7szcqe0B2W2XWiC5/bucuaXN66wl4loBu+v6xDKc/4PVNTHuQdEQHILu6l3nK1rJbzr1c5u
	0n0vTe
X-Received: by 2002:a05:6a21:7786:b0:40a:55e9:faa0 with SMTP id adf61e73a8af0-40a55e9ff18mr1660329637.33.1795699470928;
        Thu, 26 Nov 2026 05:24:30 -0800 (PST)
X-Received: by 2002:a05:6a21:7786:b0:40a:55e9:faa0 with SMTP id adf61e73a8af0-40a55e9ff18mr1660297637.33.1795699470460;
        Thu, 26 Nov 2026 05:24:30 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:30 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:54:18 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: nord: Add iris video node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-nord-iris-dts-v2-1-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
In-Reply-To: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=4823;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=YL8KCvZY0zFig+FR/GaJCxaZ+dZIKa+fGm4xfX/zdmE=;
 b=NOCfsSJll0q1HjmymMhqrxhhV7DVAt3HnNh95nYbNp+5nor4doK8pWMgKl1D9nfyhAVIV5s5Z
 BHywCUUcfJCBk1wgVwgT3XGPjkPCyuqPZWbGdd7UdolcI3ycR8Oq8Ny
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX2hj/jhCAXM4r
 34c5FY9SqX6sXZUH3I8jIf5YxN1lenj6u8FbXNhMfv+eOwxZZeMZz4BoUIadQee3jLlA4QoEjzr
 3oWtMkoBgKYCx76G7cyA1JurNn7RopR2QPxLMItIKORHz/pGxDfl7Mmg3mllLtImq8EjNML9S5F
 6Ve7Fldn/Ilz+GjK5nR6qfZCjeno7EVndBCPuDL64UQzC/VlucT1cW/rNSaOU7wYzRq0aBnYkgX
 UfhCRxJVqctEnhn7bklsSy/bEfSXXThUL+VL58/gmOOn2iXSrvpwbM6U+zovfAacQa1leVBDX9e
 A6eWU/Mb+hx5MxlpW5NAiaBEU9BgqcU8kZ4mh6QrnGF2yKphrAFNXv4cmzoFqlhsmJjX9qHm1o0
 EFoe3N1nXNOAwaF33ybW+B7OdnSX30naN4kbLIzDcVEoXGaPd6JzgCqKFA9qY3hkXkE+3WZ0k4f
 Igp8NZ4ijFNMOOXU8ig==
X-Proofpoint-GUID: Jyc5g7fIzbr1txoS-v7nPPvxmbpFrHMu
X-Proofpoint-ORIG-GUID: Jyc5g7fIzbr1txoS-v7nPPvxmbpFrHMu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX1Y1gaIagyagV
 Wh+CR7q/So5KOyapq3/jCSHdpKJx9Z5iAS3Rz3ynhQ9WFh/osA69/fCpzszq1tFKv3MUAYlcqB3
 MXuIqddCP9e7n81XNVbUf6rep4dH9kA=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b08330f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XU-mjTXoO_WADrldOwsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Add iris video codec to nord SoC, which comes with significantly different
powering up sequence than previous platforms, thus different clocks and
resets.

Describe the resources common to all nord variants (register space,
interrupt, IOMMU streams and DMA setup) in nord.dtsi, and the Nord Embedded
specific ones (clocks, resets, interconnects, power domains and the OPP
table) in nord-embedded.dtsi.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 88 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 28 +++++++++
 2 files changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index e6d0bd21744e2..8af7d13b30eee 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -380,6 +380,94 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 	pinctrl-names = "default";
 };
 
+&iris {
+	clocks = <&nwgcc NW_GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&nwgcc NW_GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+		 <&nwgcc NW_GCC_VIDEO_AXI1_CLK>,
+		 <&videocc VIDEO_CC_MVS1_CLK>,
+		 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+	clock-names = "core_iface",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec0_iface",
+		      "core_freerun",
+		      "vcodec0_core_freerun",
+		      "vcodec1_iface",
+		      "vcodec1_core",
+		      "vcodec1_core_freerun";
+
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&mmss_noc MASTER_VIDEO_MVP0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "cpu-cfg",
+			     "video-mem";
+
+	operating-points-v2 = <&iris_opp_table>;
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>,
+			<&videocc VIDEO_CC_MVS1_GDSC>;
+	power-domain-names = "venus",
+			     "vcodec0",
+			     "mxc",
+			     "mmcx",
+			     "vcodec1";
+
+	resets = <&nwgcc NW_GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&nwgcc NW_GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+		 <&nwgcc NW_GCC_VIDEO_AXI1_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+	reset-names = "core_bus",
+		      "vcodec0_bus",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec1_bus",
+		      "vcodec1_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-435000000 {
+			opp-hz = /bits/ 64 <435000000 435000000 652500000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000 480000000 720000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333333 {
+			opp-hz = /bits/ 64 <533333333 533333333 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-560000000 {
+			opp-hz = /bits/ 64 <560000000 560000000 840000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
 &pcie0 {
 	clocks = <&gcc GCC_PCIE_A_AUX_CLK>,
 		 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 56778dd444e4e..c73db8cdeafb7 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -2371,6 +2371,34 @@ pcie_smmu: iommu@9980000 {
 			#iommu-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,nord-iris", "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffe00000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu_1 0x0940 0x20>,
+					 <&apps_smmu_1 0x0944 0x0>,
+					 <&apps_smmu_1 0x0960 0x20>;
+				iommu-ranges = <0x25800000 0xda600000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu_1 0x0943 0x0>;
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";

-- 
2.34.1

