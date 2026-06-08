Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8E3C457F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927655; cv=none; b=EL/Ct612GaKr3RVg/j4W30VrISZFtj42s7K8XNMwkZLO2kcYU8t/ZB4CecAQSB61E+8lNqQL/AfDYNRmJHu2JLmd1Np/7fB+n7Xg7/9EWvO2Ka+OswbQ5KAiosT0UoQWbDr9UzJ5RuPhQ/5Y3BNVQLK7xWXBZcllcuxKrtB7ESY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927655; c=relaxed/simple;
	bh=ycUtZD94R1/n0vpzgxAkoxJpZE6mj/5H3w0pL5YNCW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKDR3IW9LAf07XSyzmLUos7S7pz8kL9gyHTPTSH2Frr270vnEMvpw+i7aCuMaiJcbxGiNl0u+/ythmFZi73rCCjsRY5ywWQh4JgdKsTj5rUyY2GWDvsYPmSeBr0mtq/HPSWZyDgf9meeESxT877xnhE1mI1y1QcZ7F7WiTr8pHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnZntvAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwIIaRCK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnZntvAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwIIaRCK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR8LW3783079
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 14:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=; b=CnZntvAIZQJCXCF1
	V+hFTzy9k2gmd1IQcKaptkh9SUwkVfMXIp7wRoWudquQkhvGuimw5O9kB1CCDrmb
	9wtJxrP8aex6lAEqk5vTKz1a2UeFBUbB6aoisGsqg60aH70uiXFaBCmwt1TfJN43
	bfjVtHV7XYHRv6m5aNQMo2uDQxaPpw641u82gfKlNNoZ2JhgNgUf2tdcWxo0luNO
	oX7l/TiALY30QSseazctqzbc2xi/m/jj+HmXCfCHiNqAhdcjc6GAElhalnjkvl3N
	onLTjCKsZI5w6cObXTo9WC44N/HP4ra3S7EEYzSMNq8ZL1BeVGAbsRUpuoWsy41Q
	DP6NyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee08qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:07:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so59628045ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927652; x=1781532452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=;
        b=RwIIaRCKIXpIeFGIjwc8pirMPI50pr36f4044LwNMNTM9WtTDabNYnIO3jQlklLrJo
         O5gVimqpV6lADT15tYzct3ae2G+W9YcgyuwYAHUpYiif2yZsbil2i/urTGRgqS+aZ9kK
         E5TjzNIwsIyM5f7vOev+h4jtz5O4ZNXlHZkLuCcr0rsn/H/nonrO+GbEyizBDBj/SYgP
         ru5tUpnSAUaxoDKNvAn82sWmUA330Cv8i2b8Xxo+0v+OtQzoLjKhi1y97C4am1/2NePn
         rXXoofCexV8b7fP3LHQJWJ2flBsAjzMB+m7qa3TOfYBL+HhGhtxaZel3AW9b4SmuIGE7
         HbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927652; x=1781532452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=;
        b=KBxPoUSJWgXULXBxUHtsJXyGWoL+HZ0OIxMrwhgt6bxWA/7wYYVKrku6/hlkzKzfM4
         qyIO1+T+vIY2sZujnOyGX6PfRTT2M+iMn8FHB9n6EISNLBd3SAL5DGGJgQ+byvpJqYgM
         MyRSf7jcK1vtxWl91WwnUTbpr4Iyf/9ERMSTnnS5m8Wka0nF5igU3vnj1rBa/zdYJeeV
         JtWZCPrDxz92+FTeY72qEnMe7pvpcY/NCsWR3Mi6l4JAAPhgWZkMcTBQIaFAK9XlcB7m
         Qaz6In7kXUhSQg9HydhBU1HX8xgkZDrew6IbkTEnFIEyuECrWEJ/rYNEK/JuWZqnpTZ8
         GfTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8B2I6OXx/ZXKOzybWW4bCS70mM76TrFsWO/BC3vIqNgFGIcK8Dk7+NdEMM70C9T32UzMoU7OmTx6IB@vger.kernel.org
X-Gm-Message-State: AOJu0YzyTzw6k7qr6GvSHArrgs6TsqJ+xaRLQSQ73zHQHzJaNGlIFNLy
	N4TcyqeZ8L6k6EcC6nDeZeU2XI7oPHjVHphaD46sr7S7+4VuOZMAYuDpDNNlrAXVff0fi7u3BeM
	AasW4vmCkf6kmlg5rR9rZclf7o/WeGLSLdjH5BJazqnl/91EQrtk005+XSVnOU5me
X-Gm-Gg: Acq92OGhkFQ5L5uiNV2QFpU8WyAfz6oG0A4xOvjTnpsLUPHvijwsNWdn3N+VPliv1fg
	BrYAn+WMk6Hm1x8ZG+5dbuxLayIahNT5CS+oIhPjW+ypgk8LWAqoSuwobQdFgAa+gGVX+/XQ5FV
	N6qsTFhnK68OPZpAHzu1j53uk1t7Jn6DLCvWUmcDgrew4XyqeNSZ0Cci4/wJlv1njbB9WDaQlJD
	VkuCzDbskTQcjkHgIel+dq8DXXQxnfCQ/e8XXFyC/taTqfd67DHnC7VJo22fMU9Hf2xcPaCpaQD
	3f6pdrE5wQLpw8iMuKwVHoXF1SK4GpLHZZmK+SVcnsIQUGl6SnRJtz8ZYym2BA1NO+se/g4Rllt
	Mmv9b+F8HDQVo741b2poY33vOfmvcEvCk5NYxqjlqQ4QsvDBY23y4/zv+ifSegkU=
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr98642155ad.13.1780927652200;
        Mon, 08 Jun 2026 07:07:32 -0700 (PDT)
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr98641525ad.13.1780927651705;
        Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:42 +0530
Subject: [PATCH v2 5/7] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1392;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ycUtZD94R1/n0vpzgxAkoxJpZE6mj/5H3w0pL5YNCW4=;
 b=1cRNlukU2nfxNsqQpCxEMOWi8oORFoQw1ad5ofMs+sOgQWnHyRAYleyfD6cQ6PgGOlOqRWLLR
 N9AZrqsh6gSBbtWxqnF2lIZigMvXTar0tQAvvLRUF+EXwNfg9WIwrMT
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX5753HfoCUOzt
 wDKQz6613TGqHN4G0Hw86UV7rCcv4YpCxcfNXug+yo1YdM74L/VkrNKccAIhcEyvUNeSb3VH3KI
 OZZVFDEZthYNR0Cm/jUPnzkIsZLLPx/GYDHFnHztQDgEXOMRRY5aUO2z1Ekv4HSeWUSrWG9V9w9
 5jxT8zQ8Pqa0Na4rgl5J8o+EloQVDu+7u+q7Vv7uUaAnMl/A/EGhukftzZl3lbgE10Ii9EVge2b
 zXeGPLMpwNiZhCyA9Kc7p13NJxbQ+k7Bs8IqTnwvjVyJzEeVt5KJYKzdyEZsZa3CpEO4koQGprj
 0tELIu79L63B9SaYDBcLcT3z1Al4xX/feBu8LBH3xJYGokJqLFOKnJdru4Pw95snZZ9ZYd/6kV7
 ncG9+7Hcl5Lj+OCTVNru6OaPJfxTHM8pixLiq8exg/dcvYhZZteOeIBcA29FlSNBsz7ZMIl1sUD
 /aJCuyIFypk9d34sPYQ==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a26cca5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8fHhTolRNNEGZtKOGWoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: WFZt3TB4TjXkhiS52BGAhmElldWH9l-a
X-Proofpoint-ORIG-GUID: WFZt3TB4TjXkhiS52BGAhmElldWH9l-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133

Add pinctrl configuration for the four available camera master clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index fed71131491ebf6e261bfcd14b5d4a2624837878..2f0f7710c2897e140495afd8d4e8bde50f356096 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1

