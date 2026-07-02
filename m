Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BBB392C3C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977655; cv=none; b=m3uaMQo2N491HTx7fClzZILufb/qpgqezHHiRnItsXO/tOi1HgpF7fHLZ3QeEiLgkmJsas8KFe/BVbfgRhWuh/ZQvnDPnOlPfNmcFL3+VE+/TykBLEB0Lz/aGZR3QOH14+abzyWrrnkIS7N8Rkk0ArUegRrT1XMRomKbsWh12ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977655; c=relaxed/simple;
	bh=B+5F0jXQKJiQbvv/XTXZjn525cwtwuKuRgNUoxwKI1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sXLmKnjKTzEPR8tNxQbNrBIX9PqwkKHCvzn4FZKREXJbDuRRYrauSEOHaIKoJXmhf4KLE2QxR6a5U7JC5UKrJP7qUG8XyY3iLel7vGxcSIow9wzo6z4sN/y8/LFoKFH3KPE4XdZ/KRmZo+9I1PddlEX/tNaCRHcLaLOHoNCQTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFPnwKRu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADws6Da/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFPnwKRu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADws6Da/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242u8n3460387
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JitEdvI6i7d
	f8QMRAibL59DICOV+9hKv9N6JWPI62GQ=; b=GFPnwKRu188+Ve0Co85KecIiVff
	c4VyemtlfV8/zZTC4H/cfF4jP+cO+bvPKXhsK+v7+LndnGMdHCYmq3bbm15q0aEw
	jPYbVw+IStGn+UKh+GyH6g0jX9o9tiG9YPA1dR+Mqr9TVFAG3R/Sg1AzQrdOs14r
	hIt13i5N/OmOC4d9586tBx/po/pLgnJkRCx9H+ThNl3lFzb2P12Xl+WvLvz8sKGy
	Ed7CFbnfXF1uWBcxa6Yg3Oy/5fw29nNj2gt3h8n9jsj/pXJ3NAHxdw3MWyoKLD4Q
	xQpbppD4kFrJLJphhV06k59ChfuFz4qW5n0pYlK2LE9eoTLUquF1V7DM5fA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb0nwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:34:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2402064a91.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977652; x=1783582452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JitEdvI6i7df8QMRAibL59DICOV+9hKv9N6JWPI62GQ=;
        b=ADws6Da/GsWtp3M4Do7OG1tnhOJGXV2+Ef6QfaficFvnhFx+uOj16gTYRnpQ5yf7xr
         Z0E2APjbEzlPdODT8fTMBoOqnDGGmsyxdz75vWw+ygtstTMOKt0t0sXBoHwC0PKQL4tA
         bUUlCui8BSz3uh9rH8i5iiKnMzsi6m98hx0CBF9d9d/RfYm5J0oCpY/AJ8foBmphJkAJ
         PiDUy+hjSIliKnmg0GIFCWgYSk57g2uOGRQAcEIqJaHwqQOkLcrghcL0R1heAFZM/6eB
         BbzyeL+LH9fGO2/1HgsUYYXMHKhbvW80Nqb9r/y21r0ESgKCu8vuH7dLVO9hqQ1R+2FX
         GAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977652; x=1783582452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JitEdvI6i7df8QMRAibL59DICOV+9hKv9N6JWPI62GQ=;
        b=p4CxlTEQF4awtcYzKytxLlGEpvXhC/83321fJuIrN+nBRjyHXQA3BDhF/iOz29YZEA
         G3e7hgKEG9NutSXnSMq786SRq2yZw4/7t4IxMbRVqhxrk+xbj4rBNlDtWvVJJW8NJM7q
         4sY7frLtQWtpCy1p4lIAIC0Q7qwZWYejJ1+wZJ4IGhsYeawRgsJGIeFX0p+mP+zmA80i
         gtBc5BjD3097jUmZ0a0pmNsUNujfL/P1az/vJNzFC98pJcPW2i/5c7KPIuSoBwLyfwIp
         SvlusT51SWJ6yKXQwKgfOt63plG1iNLlqn4COeAAhL5ACJ+d/giK7P+umBVbbTOwCXV6
         HV3g==
X-Forwarded-Encrypted: i=1; AHgh+Rqu42v3UAFRNOVOHVuAaUIKJvOG7AFIx5yQNK788BDR5nupaUW3QsTigt6/cLElYeimwLMxuEPUHJ4W@vger.kernel.org
X-Gm-Message-State: AOJu0YxK81hacWMC88Dbo0ffCqqgu4Jn74+Kb9nBvGjQQ+Ma7bSBH7WY
	Tp4h8lm0aVMrogOtVCGYHZIXhOuWPlMwV+m5i4AtkZZ4uRcqroXYSotPSEcnuDOqeDyhLn27yMC
	L7ggH4ieF56vSMeOw2Vin5u/tV8VJT19JtdnlKmXXa4sDHQxrmjNCZElkOmjD8IBJ
X-Gm-Gg: AfdE7ckKTFThz7RFLRHz2QhpFtkLN45bgiUg5D/e4THMAMArrbaDJlH6tger5FdE5jf
	3NOt3jebnn4fRPMMfHQhWfsH37oEq33cvt5ZCqmSknnCRQfkLB2atFJPSi6TzAUqaUKfvjurxHZ
	f0InhV9lN/EM9QWTQZnSSN1u9+jHVg1yXWrtsspJdNHrMlTJCNe8lbdY3uN2X8YjnIjdyje/BRY
	5d5bjZAE//TaD3LwQKRfIVfidbDwp0XGYKYESMpxvaPcYuH+WCg+Lq4+X1rCC/FUt4GLME6C1i0
	zTeJPurrrL8fQopUnXMXs5bte9ae8wKR69p8fs9im6C2aENBfDDgglQukmQQ6TK1WaFISAsoQfa
	3FLsRIpq+4J4pgwyWci+d4uvMtP+kGoTl/+pd0s+l1HmKFA==
X-Received: by 2002:a17:90b:3149:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-380aa0abadfmr4951446a91.4.1782977652166;
        Thu, 02 Jul 2026 00:34:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3149:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-380aa0abadfmr4951392a91.4.1782977651604;
        Thu, 02 Jul 2026 00:34:11 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e163211asm587380a91.3.2026.07.02.00.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:11 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V3 1/2] arm64: dts: qcom: Add SD Card support for Shikra SoC
Date: Thu,  2 Jul 2026 13:03:53 +0530
Message-Id: <20260702073354.3641966-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
References: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wvDkNdWUV4jvcefnpx0BpH0Fh1Kfzosn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX2elYV6eErNZn
 a3KlrukJrdgS9+VJNlLMCSB+vv6axu02obehMD+UUfg/Fg30JawXdO0Gu6JlVOXIDYFR4TvVFG6
 ACIpByuNL+oMmM3cBHe+Wm+QBSItVJ0=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a461475 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8A8miFJkZQRJ8vCztksA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfXwb0Irm6/ZFft
 EH7IjKrKSC5CGFLEMgFG3bmbdEpayhOxXkvqTSA6cF7pAR5+Cnt77RDq71mPQw8nPCLBvD/J74n
 IdTswSR5xtaFYaLYeBNxUZKPDJHn9et6W2JoA1R9TzZYYQfIrFoO+TcghhVidEugsRGF8sEseDf
 SJuYPqo0IXR9kKqOGOU/sv4bYrXIvBuEkZ4yym6UZZqgjiohIX+D/F43LXBN9622K47zH8VYOhq
 KZoSzIrZCQVf96bQXzof+wSjBPHmfTal+NGvNQuEkjyN8LMhOFzT5+EpZxh6oJXHAyVmIkFv/MM
 9zwPNyUvniEj6KIvjIYYDyGQGmuUEM9fYfUe73K8jd87MOBE6HRPg/ogHE1vuAqWss4ybiUOQJL
 d/29LADQ3jLq7qVgS+iUBPae1/xdNlNxYFzEOneROVuTlOZOfmPIfUce69DLqCSaMBkv93/5lgH
 Tc9GkFbe/UAhoGIPWhw==
X-Proofpoint-ORIG-GUID: wvDkNdWUV4jvcefnpx0BpH0Fh1Kfzosn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

Add support for SD card on Shikra SoC and enable the required pinctrl
configurations.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..02997d603099 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -829,6 +829,53 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <14>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
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
+
+			sdc2_card_det_n: sd-card-det-n-state {
+				pins = "gpio89";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 		};
 
 		pmu@c91000 {
@@ -1081,6 +1128,56 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x04784000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			bus-width = <4>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x0a0 0x0>;
+
+			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table-2 {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
+		};
+
 		gpi_dma0: dma-controller@4a00000 {
 			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x04a00000 0x0 0x60000>;
-- 
2.34.1

