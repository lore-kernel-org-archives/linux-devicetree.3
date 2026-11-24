Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502656;
	b=Cun5xjVO3XjGOWJn7RBQb9doaB+4/9t4jFU166qOecsD5b43cKAi8qWvihzTYRyp1orF
	 rFWRlscOYJwszrjcasMR0fKse3IXhKNK50oXYn3ThEH2haqD3prUmVmvP/+chIhZ8grtH
	 0PUdjojhy+R6j6B4OSIHnwuLuhL7XFW2zhO/CcqvwNN3y7AbD5Xfz16x0Sf33BZav1jIl
	 LiFg5kpnA266WCpMaP0wzG4p2we5xmO7FrKUZNkU9fhNblG9igbOXbtVd8HoX5wsqG9ZT
	 K+qSvS7+yoSUGGz6CwVhh5ot9MCog2miNsxpIP4LcRQo0lVXTDSuu7WToXAIdK7P1QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
	b=mqmS5sFCLgqQ/elL7lMaQfCv//4hW7eT5kFdWRFnFtDSICvQ13itBP1r5yn7qvfhPGxH
	 sAi7YfyNAjh38bdMefNHCEBYewQMpeLUKgFpby4GGruCKEl7CM6exko8KRewF0STfPgiw
	 AyLiT9C865GWR1ung7GaVRV5sknL0pqM6AsG0J7h16aRNBXRMvRaEIk+sDOtCQBjZdhTy
	 e1eGGlFQ2rnIYZt/TMIfmTKxPJCNn2WtKuBbAbFKnePsqnczHo/H0cGEqXxjXwKU3WqNp
	 Lw1ODBipW1dboQYlW6UQv7BfPcA6ftETPzay39PbQzHw9A9VeECCuoWfHdnYQW9fgQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjH7focB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfSWUqQA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193E060A2603
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193E060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjH7focB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfSWUqQA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2ldnP1598155
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=; b=PjH7focBiqaa0ZcR
	XISc8LNbhtosAMxTl3vqQzThZ0Tt4mgpcUFq3X36UlN9VFBNlAFbGlnp/tA/EbWy
	avzuliDj2EYdnjovzHWLoQyLv7UC7CJsPN/ZuA24/TsVmVFBzNzEiz5aerg2lvKU
	E9ab6LSiYiMKtF4LyErbvc44tMl0yf8fRVBpTtzDk8ceImycUTZ29a6zjL+b3Phy
	TyJ84eMo6yg2gv99WgDtahE/oQRslkBwKlrMocRqasgrBaHvOkku3cT9bksPMIDJ
	4Ex3yaU++NEuQY2u2J8SXAI6290UGQIwt3jmjpOGSalIdH+Hg8r93KmcwHzCgKw+
	xaIUjg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqj6fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:44:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869c59c491so208398eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502654; x=1796107454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
        b=VfSWUqQAvomUy/YAyZeUDz6wqYsZ+Uo81lZylw40WJeKjThMRRklwStkUoxO9mxjLV
         zweP4jLb4Qz2d65VhF/FaFogdqURtbUs3s+Fiwmn2UYwCQRlwPWv39AxGCtGVWqQcQNM
         gnD0WkZSzQrhac6Pm6VrJhcsWo6gHpZrAs1llP5YJdjqGab9PsvuIODKDV/TGgV4PjZd
         SgRkVzXxOb+GMEivStqwr+YbrtKpyMOpDapIhGSMr5nwhlPeM4cETcecYwC6r5MaXv8J
         Fz+iPiFk4z9BL4pPJ5I0siRiYxHB1sY6UNjqd9Pbd0AbUtTAlsx0+rEHA7s0pyQkuocE
         uzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502654; x=1796107454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
        b=xoXrPqGlL0sheX212GgbdV1UrPlpoDSRPJHLl4byFdg76JajusKUWOp2qQswCp2lV3
         nts/D/NoFmAE+5bBeRb+dfCrRm2XNwB1rrE/Rl/HcE/ncJK7ZdKwFvEDjJG6yD/T8+Kv
         Jlfx19BABrUD9kbMJe2zKH7CFuK0Z8KiKVfifS4rGiQFq2Lwje98p+76c4OFNvZx8NDA
         Xmx6RHedHoHLS52+UALmdYk1IivJAoBb46YBHNkddlV1XnhTJA/J4f5CVf7seaujDVTR
         xshy1RkWj2yTGK6V7FDB4LZ1qWDjf0HwxVVxRcxAeGEMh3QB63sfsopeCpuIM5gW8d2d
         4pew==
X-Forwarded-Encrypted: i=1; AL+hErHvxXRpS/fu8z5czfUV0zZUYnv0khrw+OLY6CYaV/GfOCrfZdMV1iUXShKoUUutFD+a1lyyhNtcdQ4z@vger.kernel.org
X-Gm-Message-State: APuU4Z8TX/StoE+tictcsaIhiF1uFtT0y4tfAf95MZvcNNXalQ17Is5r
	+illXv5mci7UkstXGQ46hIji2pq2Thl5PZHKLkuTY88g6fs+ZhnMpnwF0JkBXEPncpaIl7DBfQU
	SyLDb6rc1Q/lR1pSnDj5BGq+gyhneGYfoYbYtezTqIMP0it7ulJodfHGKZ1rwB6jG
X-Gm-Gg: AZFdTZfm+ObQtPjPwp4qdybaxVujWibH/Xp1/QcNV8cdpoelmieHzUiSQtUb76I6da/
	L0dtGnZYYHYQSDt7dgD/GYXUcOOL6NwZjuv7HgDYCIJKA7xdUOQc/H/4SLiBbhaM4mxD7tXpZgO
	0fjuOsXKgkAHeClc+55SDPElJnSMZV3e8O2wBGQAohSqjyUbeTqAgUEJ5MDFTvGVlKvFjGtUYbH
	VcndBcXOer/bvA9LlmLIqgVpCDXYcbjNOiNhsx31a+CuVA6gML/Xb2hjiVGeeuRMN+4nslCbitz
	uru0+R5DjePxRAkm5QXM0Ew8lASXm/jdDJ5WVWIgxPRkGb7OjXBL+uX135I6CClm++dxMfdU0TX
	uV8OaHLIA1CHmsZj9Hto5wJL2AVUGp42i787didpBLjI+5ylrOBjOgWP3b5yINpD8FEAkqNxTA8
	3rnBJlZOEYKBnpQUK3jB43pW8TjnApQhXnCA==
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21262531eec.1.1795502654048;
        Mon, 23 Nov 2026 22:44:14 -0800 (PST)
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21262479eec.1.1795502653545;
        Mon, 23 Nov 2026 22:44:13 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:13 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:44:05 -0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: mahua: add iris video codec node
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
Message-Id: <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=2664;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qjdIwYmv1raoOrxdhbIt/Aie3lUaYl7m0Yszv6aLmdI=;
 b=Po+I1K6UW1QdqQB2jqK1BLYSJklxWdpghSl8piBW/o3T1M44wR4e4eKuHpfw+fvmFEq6Y9V8r
 p+WfVltS/6EC7w9VLIgHImyunyKinqlP4wmKw1XAzFvGS7JvTb19vED
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b05323f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2ggMmf_gxUOvV-BHYncA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX8vzf98lrFB4X
 mr8DgY/zMWDipmfMA8D5MuKiZl4r8VldSa5f0yYi08p2WGH2YhE6WzdHREFS9vDXJEbtsu86XtN
 JWboff1e0DLX8r5uULRkaAwJAylbvWmQCa9dpPhQjQXFYNOZQ5PGYmo5rcdCzZF566ANSTNIzfC
 L1h1yQYaQ1/thM5Kb2+S0B5eYPWSxnWIjHCh9XUoFsipar7KOvaccVd+1ftJZ62iQlos+ERa3v4
 oAOyCXwKgngvYCwoTjOXAwH/AjiTXJqk/cK2bzU969SkBpslJ54f3vPS5Hxk7E3dmybgc8IRd3B
 0B0+wza1H9rM6Kd078vSrAI2hrEPyAgL0eWeH15nX9AStT6RzTds/2gjyxCuNkiyObHgxswgUAU
 7SAktc9FWBmVbhKu1akSIOTZgKTF4rn3/aqy49FsNQKKfvTgkuMYxJZyFwH9K0KEd2Qt0ppLIoq
 j6uD6VSSFm+u7NqE8Uw==
X-Proofpoint-GUID: kuZPSecCf9F_2x9Z0F6EfUcm7MGv3Bo5
X-Proofpoint-ORIG-GUID: kuZPSecCf9F_2x9Z0F6EfUcm7MGv3Bo5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX0JYIGMgXkxtv
 lWKXgDxEebdzMk7cPzrf7MBUvBxBl8Or+xgNsVX6kfbg39Zlv+GhV0e58mV9O8zN8IqCxtpY/p2
 /Yt6SNIko0l5HCUx1xd6EdOvokFgbmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Add the iris video codec device node for the mahua SoC, overrriding the
fields clocks, power-domains, resets and opp-table reflecting single core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index e7141f8c9e0d372aa30f2ac1ecdc5941d249311d..4f018193be50a9f62bd9b0b403a5a6b0a9f6b6a5 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -150,6 +150,73 @@ &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };
 
+&iris {
+	compatible = "qcom,mahua-iris";
+	status = "okay";
+
+	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+	clock-names = "core_iface", "core", "vcodec0_core",
+		      "vcodec0_iface", "core_freerun",
+		      "vcodec0_core_freerun";
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>;
+	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-338000000 {
+			opp-hz = /bits/ 64 <338000000 507000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000 549000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000 666000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333334 {
+			opp-hz = /bits/ 64 <533333334 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-655000000 {
+			opp-hz = /bits/ 64 <655000000 982000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
 &lpass_ag_noc {
 	compatible = "qcom,mahua-lpass-ag-noc", "qcom,glymur-lpass-ag-noc";
 };

-- 
2.34.1

