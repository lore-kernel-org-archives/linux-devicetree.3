Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7335846F4BA
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711721; cv=none; b=Z6Tnjwhhsku/ZcHMF/DeOCQw3bLBbUdiiisN2j9MJItF3dzYLJbuZk882jv8TAXrO9fcHhpXnOKj17Me3Wu4ya4nB6h82vtppKl93X6d7NqJ5J38Oy0ec8DRc9CSY6Vb/q3iICIUgN4GGcTT6ioTFg2QBde9yNhm4SpV2/YMt+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711721; c=relaxed/simple;
	bh=U6Opb8TcQbuMMqUTCWCIlKozzx86+MbPY3j42JH8zpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATp9+4GxlssHGeVC0/aB/JhHUoH3o57P1jAGHJaPG0qtljLbpk2H+7dkXB1fcCT4Db5K9bo0qlyj9Fvcuh4syso9g6pM9evzUKfE/4W67oVWi2pnq8yGbW1EvUcQGJ9MgFw7LOvaxTMwMhFBVL6RiSHBci78u/bbxBx71kJOkBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M33ckUWQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JT8f8DM4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M33ckUWQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JT8f8DM4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAcIlI664778
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=; b=M33ckUWQIXB4ywXs
	WHIleqAWcu+c6E6b822P7IDVX1so3WHsgOq65SWiZMRb2Av0SU6BmacjedCOfK33
	6v9SyrOWg8or4q7NcaaaDanRRFq/SO6H9zzPkv5Z1sK5XfAGYd3ljl6/ARLLEaMp
	dJubHU5GswAPQVzR+r5o8adf8rV8LzpoazOFVVUjb8z0zthCtJtQy1Qi2HxZjPes
	nBzVuNXii5T2oqNyhHBJXLuWfMn5ODUC6A8s4M8gaRZoGea9jH9lNpK8PR4u0aDL
	shdzpbX1r64K434N7TQJVSNFmIER6mf5lbWAX249q3JpnipnzD2vkoxhT3xBgryX
	fYzn0Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42keyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1221569a12.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711711; x=1787316511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=;
        b=JT8f8DM4MNyjlEguhoMyNCu4M3ylw/hZOQqIGRDEXGmAmbiksSnoKvZJTawf1d0yfk
         Z4p0N8zlDdruR/0VNInzjqjahNUHvV4zzs5EuPvZeODkUBPLQEzxmc0P53hRXatHmXqu
         DJUZ+sE69hwTZkr9oRgiCLxyh9OLGhuBY175JpdeDNdc8AGCvNwJeoorYkSsBwlysTH9
         IwFCwQP+tVxt6l4//oGjofayRdWopA4gPDbn6H5GxcBTJ/VE0xqy6s38O527gYn8OTDA
         1Qeb+/O2LB8T+Mgu1/PyHhs2XBZ60FRw8/XqHh7t+Ec44T88v67/nFG5Ss+w2Hpkni1J
         pMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711711; x=1787316511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=;
        b=ZZhvT32f5v+QHhygjh65jym/2MaQBFmVHm9anI3VVu6W08PBeCfIjEIcvMoW6+aWPV
         qv9MvvBsYSjq00lePO+tGVsRnfrOp2OIs5MKBh5dQjBW1sF+tlZBiE4A+VUtC/o6SM3Y
         CrVI2FdY3c3zUODyBM4qGwMsrj8sZvGXZMVmOp+cczU+ALwctCwzFoGD6RdimBnjXPHm
         iF8TgEPCseRfWGLXVxEHsA6zzvttUKUx8yUkBo+Po7tvBizCikBR2QyMy+nc7v+N57NM
         b/ormnb0w98X4M5usnotpa7W4QDyr+9I7YV5ZB8KQR9isyDlQ+Hh8dlNu/rVBv7EUtjv
         7SQg==
X-Forwarded-Encrypted: i=1; AHgh+RomOY3dBPXbx6qRRTI5sfujjfDbz4zMjYHetDLMuStETWQ3zzhLkvb7rOI2lDfK6tvud3TVYWPrT0Z1@vger.kernel.org
X-Gm-Message-State: AOJu0YxwSZvqDMYbumpPwMUIfon8KLbuTcFK87CyjzLyE1RX17cgkS/Y
	ab8pb9MdmWoZzqqh70Zc3eof38A6X6Tj0ePljK9iOCN9zrZdbOSGH/U3gnA2qr71YcRjtxy8LSF
	Qkh76J1x5kksJZqCChRlqNGSkhVYzW4FIecFOI0NSQBZ9YpkMSDTQSqzgrbUjI9+i
X-Gm-Gg: AR+sD102MZQfgelYDqlMXHQlG59DwDcEMz8eZ50sVqw66x86YHPa8URpaGG1saArJnp
	/ghxmOarU8QvbXN7VqRtzTZMLnO0KRG1mkP/xqZGVgOSqslBVqNBskUhOMTEU1PUtbueXdT8WVN
	aMRW8J3Jmu32l7KpEwtS83HtO24bL8ES/oRFAadv/jOtU+CRrDn7bGSvDVglk2RJVApnmRL8/z6
	NpNK6rWy+jaHUygbOWe13MBHPUBwaZDVRBnFKpHG3Rq7n9sznPNb/hwWIuBYav7atnBDeutA9T7
	um1/eU02S7a4wvL1Ngb8keaTb03USihaOTIeLt0H1ruVy7urMdzUGmHAeHjuteHAPiRxx+HQnNu
	IVYWyr3m8AU/bEnDGS0qrT0MT3AaMh535GvQBYssjyQE=
X-Received: by 2002:a05:6a00:2913:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84fddf91565mr6587065b3a.7.1786711711120;
        Fri, 14 Aug 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:2913:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84fddf91565mr6587019b3a.7.1786711710697;
        Fri, 14 Aug 2026 05:48:30 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:30 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:22 -0700
Subject: [PATCH v3 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-12-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=1388;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=U6Opb8TcQbuMMqUTCWCIlKozzx86+MbPY3j42JH8zpo=;
 b=GoHKPlU3bC0W9TMzVKcDfRktV9jgV4Cilkf9AMRArxgujJcqHehLBQHiUjtBmT+6x0WWUK3+X
 /f+799d2sS7BjMswFR47ZyxQuzjkRukDxml+yp5khWw9wsZUJoCYv//
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7f0e9f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Ax3BQK9vQTRq7zTRnBfE62RLLDi9gmZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX7I9tHaZgR8bN
 H7X/x2Dz7TH5t54AffL7S1ogCosDRTwekjUQStin85afcSpU2wEkr9xVBBF1h4h0a42H/UI3Wt1
 3nZ4IwOVEieCzP4q/3H+oiS7kCXA/xZ0+u/Dmx8WmgM43AeWPhWIkcMWXICauJE36M3819rEW/H
 c+0Z5CJQzA3r3EKsAbJK7nnTIb/8RkkWJ4UfKugslUyqbJKFT1bjjajgt4HvILgqWv+ZJtk21Tm
 hT19gQnQF3OoYiZYEN7X2rrqXfw/6rkL42mnqGHQR6OAqI4ahKBffP5WkRfO0WCy5PdEr91mVfU
 9AfabF6ZcFOAOs0tPamGHD49mKx4Of6lGC2nOOTJpknPJzMWG35+v0m525kSckaIhEjCb72Cdg2
 rQgpekfn7MyeIkqU8kxw5gmexcn49eKJPmIbIjp9q4mBTj4cIqd3gDhisaVX3zYmB28DOTK+j9k
 ZBj8I5MRm31nAHaPpug==
X-Proofpoint-GUID: Ax3BQK9vQTRq7zTRnBfE62RLLDi9gmZD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX6rbbCoPAb7k/
 656hEfz8Tot9Qbhoe82BczrDdexdkVryeAeMzXnN5voj3odjcolpOHl8o7LkT6pKVHT5yacearo
 JStpgh8e4Rfg4VXQHwBEqgfW4mUEUtY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140097

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 7410d092814e..fa537633d5f5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 52d851a0dc2b..0c1ede0f73b2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

