Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D437268A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924266; cv=none; b=aKfdJKqvjuzof2m1Cm2vA3PnHD8z6qIbAMO+wVC9ovydG3kirOPREgedVwsvbhap9bJyUYQiQgyNkU9V9KV45u+2LnCAPSTB/B8iS/of/vbNEru30rpNjgj8dMjR+WOKtr2Pigu+iY4kTbF40jO9Ppmv9y69VgSehlObuPQwEes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924266; c=relaxed/simple;
	bh=DQT/zNqQq2aLAulWAmnNWMK9zqPYRi41u9uyToFunqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZF1qyDG5Cr5H9lxz4y6KJsOFc/BZWbDnAXudCfIPnvwDbXZJMbxaSqlwUOrcB7depjR8KmUXVQXLqmJR6U8X5zs4VoWAA5tpW71wtcIsFtVxaxEYlzCH6dhkpLSZR3yvJ1o2nsXO1frzBGsE4ObwGsbXs9iA+PnsoaAWEIXvW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLjpSp9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JslgQqjD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLjpSp9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JslgQqjD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBdB83417945
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=; b=PLjpSp9xJ1iVcLha
	SlOxzU0r+fTsHCyl5swAYh5dVkL6iFaZ6NoZoIkbWl3MHXeANjTcE2sxDX7ZOF4d
	v3PKnHzVa2MLrarxqcNqxMDtrD/5oe0ZDdBpT7X+10G5eTzgWL84kSrNaqflDIMd
	yPGGeVtXIu6rSt1M8YlcrU+z1XINGRRoxgyA2DWUkhDH5/fWUYf4rQsDJIR06POM
	FDUhltg+qaqLLN5NFYskNya5WWIYEevE2uGhqDBQcVW0ggG2IR9waWRVJfzAUmK/
	m2lP0d17m5hjXUfxyIdPtS/enh0mS4h4OT0Hxox5ItBZg3HIC5UFGDm7Ycuie9q3
	CEtT6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptgsby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:11:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0d0516ad7so45200945ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924263; x=1781529063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=;
        b=JslgQqjDHl6Ovg1PmSBz2tiIfRliDYN7Y4DTMDMrBkVBtvhg0N6Eaae5RcgAq2Ra9M
         Yb+kWO717cW/huhgwSpb4VafJZK7P0/swNc56cecCw7SxtOOb5F4WajGz/F3YoZZ0Z+H
         MPbG3hPqKuR+xmWozhhFiOGoz74uoQARGTaihCzYCZJAfuAG/1tuJh5e+TbjoTP+hEoZ
         uoqe5ugyenzH5wOlApAr4T4qeD2oc/i/wqWh5Th9bb/YZ1/dtopxGUNHL4QGTYR7j2cG
         XbCkjsA2UIX87McHPVdmjiVfByqb9xnX7qyVyrjbr3F9VSaw9naxi/VayxLWWoV8pRKl
         57pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924263; x=1781529063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3241F3HoYz+LUKnQSLUvVf8IiSZldKm42safL2GW/U=;
        b=dNHzEAKDIxPgNF9HXnp4RaSvhNcSx9UP4E7bT+Lp54wwhwr6ZZyNLVs7ag+nYpNIRC
         Pn6A+W15ol+MiF4vSE8ifGQguWog9ESL8ZBQ/Q8XeN/zrdB+81dLKNIMcjFL4J9dnQEj
         N/z1t9VpS0YeEctIKp2E5rXxSg0uqmhlw6MFt/QQJG4cDb2Hxd/S4kjGPeCurV2MofwN
         9xUuThkW9+Env9LVl7BYTpGOnrHxblwsuHLhkGDtD8FDqo3qi/v5LI5B77XgmNCsI/AG
         NuRBbTRNaL9L05o5I0bf6WExUpEo17hx5b6S1qAFuh1x+NE2zeK7lZ8D82+i30ZxDyA5
         6nUA==
X-Forwarded-Encrypted: i=1; AFNElJ8vGtmH6PNmCstlCjZ7X+8OhBnv/+4QqU0lFTP65lyqovMUYxjZmvegEvs4N+fZQxJjtbnHkGvfxgaL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/R4SfSXxhAC1t8AXLV6xBlsfroOwmbKGlJllqwvZT+89h8LRm
	/8RRvuZ0i68+a0pm2H5i+GZwMMW9mFs2R7wa6ngqS8v1AJBIMVrLxypFyQvNKsSwdfwsEl6ZfrR
	ipzoo72LWDXbVl6aFAL0CtikgleNnoV/hH+ttGdn994TxFrILf2Uyq7HDbOz1FrZM
X-Gm-Gg: Acq92OHhtPuY/63b3paSp49G0Wf04pn1MkOXBaZGSDH/KlFHwoTfrn8aswWzURfeuYp
	4ucM7Gf4oVTPxPBASKMCUbs6aND9P3nlNJliNRvWu1NlLtC0xeS3n8iGTaNrvyCVrzwitx9Tun+
	LKQsTt2XUvduQ7Q5WxdpfWcsZsSqGMQL/tOI0uTiQiow2qxER2XaA/XaQRnXRuVdN/CIlbxo5aZ
	IVAXOxwir4AspXpWSH4ndoxM3ce0ABDe83cZ5rPzkiFKw9W6Q6W9t76S5ZXqqx76gm0YS9tokhz
	IgB9j51PcUkPSLDmMItYZkdpjckhOKh6NFiVDIRkZM82VSoLFpy4nt90gpEKsNgB1msHChbnIMR
	SxvuTteadmEPU8YQoigvNpn9Fb1H4NrbiYG91jxkNGjKi1mo=
X-Received: by 2002:a17:902:da8a:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c1e7f92548mr183184285ad.24.1780924263460;
        Mon, 08 Jun 2026 06:11:03 -0700 (PDT)
X-Received: by 2002:a17:902:da8a:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c1e7f92548mr183183815ad.24.1780924263007;
        Mon, 08 Jun 2026 06:11:03 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad172sm185235845ad.83.2026.06.08.06.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:11:02 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 18:40:24 +0530
Subject: [PATCH v4 04/10] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-dt-m1-v4-4-2114300594a6@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780924231; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7ByKGzzDTD14i4DIQy9VognEH4x590vwDySV2Co3gPA=;
 b=nsZErkUbo/EXqASccR2ilHGqPbl/KdmXeGHwHAHGIBrjgMHzdglD4X0gd5IuKNYU/zbDE7RJ9
 FBjLaA0SeQ7BiEIweGWqNmb6hg54PGGtv7fa6AVcuinOiHZhiHZeSj9
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: l5AZvtZTg8xKs9WAcFlOnwjbkS5y_oR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX9toR70ZxglXe
 gjcKUy1qtAGXallfYOQBXQ+KSgObecvs/cbOZSpcH0dolv3Wb4vvoX5xD408yik5P2avTLwB+Ia
 Eth6RRZV6KZmqDU9FsfRVGoGIRmbABQ7lfwC+1FJmd+HsRAgFZVwmqWsRWScSa5W9ML6HPTi+kX
 vzLsdJYmGXEI4HPvfVW8nmyB63ZymPc4IEHgZNJRKpz5LO2uKrQw3U/SNmXfzPQWFrU4h7EXndG
 40tsnLA5EcumL2XkvKeF9FBWVLStw6YbwuqTUue/Rn5GSjc2mJNWBPiJt0RPUz3qIchX7+XLDUW
 jmresBT4a+LGVjb/DFOV19HX7p7c3lVv3UfOLi8PgIUaCHF1j3oQNLCkZFpBc2WRzGNrZc3+sPc
 HrgtggeQMrccOBQBXj/NI5Hr9cnnF70yTOs9ZYk8lEtz2LwXkNDOmAbigHONi75DMNqSVjqnw/V
 qRFT0R08pmIl7H2X9rg==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26bf68 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: l5AZvtZTg8xKs9WAcFlOnwjbkS5y_oR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080124

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e6ec07a865f0..ec1bfebed226 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1

