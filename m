Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413B388391
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130352; cv=none; b=d7zzJ+wHWlFy15pyHe2IGEiwMQI2iL9Hz3BHWW/YUBt4t3lsElzXpwArhTSqNf2Cilg8B9BPHKQQjA+DUDLiLI3mx0Pu6XyKIZ08A92HfaMQG1+g2aW/D+jbLr3KdnnXvCDsF6O8F0mclqy9X28Uo7nyOknE4mnFQAo/h5Wnz+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130352; c=relaxed/simple;
	bh=cikxYZCMBRNg0V1GMjULfidchhUEEc6a9UCGqPBYh+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzOynh2WGbjAi09cyHsGbfoQtt0yy+1ZKCIVw6Z24yElMVUIdV5kjC1hirylKtZyYv3G7/3LXRFk0iEqqwaU4c4T6XyRedfuF+Tbl2WfkP1boDoscGi8jOqXwdallLgixo+cILpHoU9Gm0H47z1r79Az+Q1RH9fvXdaSah/K7Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8zS5SRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clwG19Yq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8zS5SRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clwG19Yq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BJSGU1964806
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 11:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u69S/TJ5H48qNg5eh+ouhg7rNEWoiU7d61/6yt/Y27M=; b=G8zS5SRZ9Tvx0G1L
	WH8hnKh7uRioSSaNknIfw3WLRme4CcDCbK2vr3v+dMnq5lhT42AfgjBeGqDdVHlM
	WrJUpn3C4NJecWOqBt3HCfLmgqDbUUUKzicg6tYymyMbK3BEiZmPieKWqtsOiuOA
	0BovxY7q4gp/gIzaYq1KfIYJItmr8bLhOyH1Kxov13XWX6RaL1lYY74oqkSRC9BS
	hiWRd8z99mH3lr/Q/c4LOioD3XLaxmDqRHnQ3VzGLYa9TqCWvdQUPhr5mZ7s0F2Y
	3WBjRWzjkQxUgA8feDPW+JE1Ozdf7wgGPwaCo0V+7lRygJ0SkIJAR+Ql2c28jC9o
	2QVTBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h2xmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:45:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so22111411cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130338; x=1775735138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u69S/TJ5H48qNg5eh+ouhg7rNEWoiU7d61/6yt/Y27M=;
        b=clwG19YqG4uTMm4JNkSDCo31MXChiafQdhFR70OyCWnKgBhs/fd6lhNeKxbS6fk6Mb
         uJznQeoo66tKT1JOrKn9Rc12oS0wG7qnuj1IwG4cNmUhHDZmGeGJ264ct2fODw+jpFNR
         YIwIM/qv08RGkw5eskyJ8fglDVPNjfaBbZ0V+S5TvRMds+6CIBPq1D7XRQMAMevLDAvB
         it/KjoAhXv/W/RCv6HMBFTZSolAyButRDzyqNUAKf4RUQsucaLTtoZCXOOw84q1M5CkH
         ZWbolV94DzOAXHlYZldVVmUsyH0J4Z2ypbdjEe07gbmEg5K68nEfGGinhX7gi6G8q85D
         Gcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130338; x=1775735138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u69S/TJ5H48qNg5eh+ouhg7rNEWoiU7d61/6yt/Y27M=;
        b=ImZkZTr/21XSM96YV/p+R6bhr7hVzDFHNl1cbwzYLp2Md9Qt+Cj+8BxXUdiy24gNzE
         L+sietw8WkpLnJQssrHne6+B3b7WiEsATVLilFe2Hr2iqEelUjPNx1b4KpfrWPnUlX+D
         VvrWhQiAYl/s/xStw+RSU/GEjm26HPqjBeADPu1MQiISCgo2c8056e95n+bhncmWuCp+
         CEz8wjvKQmhZURf/latnMf7/qkdHp7S+IPBff2RtS3reJ/bv4mjkssBIAjNVFyT6+2sY
         LTRIc1Uti/RSDlB7lPvgDYUUvxm0Ij4PMfraWJznda0OZuqNe+VawvN1Q3WwLNYXvK/r
         6Wjg==
X-Forwarded-Encrypted: i=1; AJvYcCWxWuG5HOYvVwNCKlVODCcTVnWSW6cJT6Zztt15cTS/tCfcGlLg8HaTWm93f/MNmlRPhnKksw66C9Qh@vger.kernel.org
X-Gm-Message-State: AOJu0YzBcdG+ocFQTr6dxuPDztKgd2UJuEfxygSLNpBU79Sc0B6dH+ec
	JKQJ6J1djQlrhhrqsifx/sI07isZDq3z7s+Q3kCkQ1zu4ykxeScZe2Aw0pdNLil8op/T3Uoxagz
	uo/0o0LLTlXfshDsqe5NY5Hd9uwTil2PB0xSMK6td65n+sWywJ6eeC6qPaDOWN8lD
X-Gm-Gg: ATEYQzy/GkyRh2lCHGleK60N2E84so8/26xWlrfKg90scVrwYciRhbeSpCxRNwDYCsf
	RqHMrGQrqJnqoSpA08c4v9++vYbHflR2vppCin6azphEmAjItjzT9gy5MXNt0KeG9wl/fvX0Rfx
	8dxYqNN/+BL3gloGNS0CnkDUpVwSD09kPpulObK9Q5USPi9zMbntpL51HOG6sHAsrm2xXLCg+Ro
	hGJWugsF2VH6cdsWL0Huc8x+83XqYpUh1aO9+u36IrfUMnML7+GLgqUAtou5sMCPWvL2K/72ZO4
	4F+l6vRmYtfoKi7FRjWntXOQVXcfPpkMmlrXSV6qcA3xwQ6ZF27C7YQ4iCO66JqZnJzuocqRXTO
	cJUJhKQBa19WDW6Ql7tGzfbKKbqZ6WqzXU9MVo0MxNeat
X-Received: by 2002:a05:622a:207:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50d3bc92420mr102554161cf.19.1775130338624;
        Thu, 02 Apr 2026 04:45:38 -0700 (PDT)
X-Received: by 2002:a05:622a:207:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50d3bc92420mr102553691cf.19.1775130338208;
        Thu, 02 Apr 2026 04:45:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:17 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: sm8750: Correct and complete DP
 address spaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-6-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cikxYZCMBRNg0V1GMjULfidchhUEEc6a9UCGqPBYh+s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbQYRDq4k5OCWp8S+4aGjhOn4G3hqwTIPvQt
 D9loWcksCaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5W0AAKCRDBN2bmhouD
 1z2kD/9wXv1XidF60fqEM+OmuRpOggS9P8g1IoM7kFAaJFLNYZdowO7Zd70Bj2Cxhk1YxkCSyuF
 GrooOVgHKJTeUnTLFO5lRZvHfD5ozA+/jp+BWgGY3xPbnezWVsuwWT/XaeHZmBfUAnG/v314o4d
 uQkmqrgSuP+ISa1T7Ba3La694uiC5S6eI75Z/5pK5LVGrw+CiWfoJuOqtxNV22h9L1+6TFRseV8
 47nKDieXEmkXAjrSJbu7U7aXnFRHw+tJAaSPXZisp119M0a7WZiDr7y6ED0MN9C+Asg/A2niQvn
 Cdq5HR3PVxB2NrAF1I1bhYC8HObMM48ePpdN175LlHzNdihyYQ9l76y28dGuPX/nfH8m85F5S0z
 ttQrvMu6Wu0ytgJogsIA7CRpmDDiz8nEDX2E9sacd/FMgw/T/kpZd812RzwQ9umbBjb7vbqacuE
 iKlmPXrusfNjWfVmF9IHjCPtzl10JMXWuDhso8pIT9Sk8nQC1oCIDJS4GT/2JQP24nc1spt2n+L
 Xvk+8FFzEQWYa8CtWBFYwENzKTz3nbz84XiCH+8WhgtdSM6LYiNvoGbTM+JKApdn98QJgmNgR/s
 DI55y6bid3qdrFA9ziIObUwKA1VFpf3NsNd/F9RXuvEAHnxjwUBeAKFJYF42M9yKW2YXtxTSiXI
 rqUfb1eszYZwmNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce56e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RMXozov3DQQ1vOc4o_QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: O8L6DsNgSnp3L0PQnKFSAxvH9QP5iWnx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX5f2SmyTgeeoe
 si767CEp5+MAwQnmlg1UQL4mLW7TQhH0m90q8zLu4h/cc45ys4BCvdMqOrG6gk3BXi0k2pY4twP
 qAteO7Qh7bNyv8dN+JN2Az6efeQhIETUhdlYBlF6ehts1LvnZw6Hi6WnqKcv6zTfm3czhB9H9gL
 Otj47vok2qpW0GpkQ3NwQHoTJ41nooracRDAP+WB/FcBgMbcB0UZGJnsO03BTvrt9ox9ZZ28CYY
 YIITCAyjymhi7Y7Fx4k6G2tlNjGprZyzS1KbaBg415pNYi0RBPZeblTQJsR0NbnZIyWL6Zdwrpn
 9JA/YdiOlDsZ8J29hFT9Z9SoyIqToeRHLYIewROiCLPjuYMnMgfDj7YED9G/YYHU+QJBRiU79jr
 mpE77QYc7u4aWKxqGC0eYP6uilBpJw3QDPNDxcxmaZi1Z26dICKwQDZfVLdor8P4dK156siLfwH
 s2FxGqOp1s27/zt+Szg==
X-Proofpoint-GUID: O8L6DsNgSnp3L0PQnKFSAxvH9QP5iWnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105

DisplayPort block on Qualcomm SM8750 has few too short address space
ranges and misses four more spaces.  Complete the hardware description,
which in the future might be important for full feature support.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

dtbs_check success depends on the binding change (first commit).
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..aefe517e0669 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3325,11 +3325,15 @@ mdss_dsi1_phy: phy@ae97000 {
 
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
-				reg = <0x0 0xaf54000 0x0 0x104>,
-				      <0x0 0xaf54200 0x0 0xc0>,
-				      <0x0 0xaf55000 0x0 0x770>,
-				      <0x0 0xaf56000 0x0 0x9c>,
-				      <0x0 0xaf57000 0x0 0x9c>;
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
 
 				interrupts-extended = <&mdss 12>;
 

-- 
2.51.0

