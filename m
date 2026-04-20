Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BBC352921
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702630; cv=none; b=H5tC1fRXNdljICXbhiB6GZfen8Ez9GZn+UNiQx3QhHDDpT8oEh8yWgZheWKKaFE+LQXfet5ZLpCHhwWTt50swofjz2Q/GmTAprJzBsFB0cjSfabA9z0G7md+Bs8J70ESx4kWu9p99xXHbx6EcE5ZMzW6No3yqI23XgM3oWLZFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702630; c=relaxed/simple;
	bh=gt6Nb3naTJFNtraTGwDLi4SVqjUxxdEnDLsbiv/OeNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSjA22d+uPgC0wbVF50R4Abg/zGRQWuOHyoTAdzs/ISEK2NQPpeMTek6rNzO2XXYWu2U/u19wdVFNlcn5AI0lSFel0gX03mlbEqZ/FzUANDkDgYqHHb+5Ho1rFy9rCCNnZGo42lrrElJRQcImNpi1UWSL3DgugSpSoD8ZfT3XNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVBb+t9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYRO+0b+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVBb+t9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYRO+0b+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KG1mYr3925591
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=; b=IVBb+t9dBz4eELcN
	iJuAMEHUAr6bnx3Kc0uy37PtEX5XHk10eeeRS0viDxn3pxwRDwTLXR7y5/hNWEg2
	vhA+F/2J8ByusHP8VB89sP/+DJTitgq93dPB+mNhfTDBJNzvmGrXHlmURrCU7KYx
	ouuqL1KvMq96RzE7LRBXRWF5WLH86JfOvE3PptzquQrDkBm9eV9SiMD/Qlbfz/nP
	ac1o61hfZC9oNCXaAShnsphvv7rpSO0KiGhAgaDunebksayfc2SAbrfaL0TeFPFq
	tybsYhhji2m3mhXkVzs5FWz36i1hGwjPY5pC29xqV5nERjl6ItQtRcEAbbDZDCne
	rxNwXg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhu9sefb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so2274663b3a.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702628; x=1777307428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=;
        b=ZYRO+0b+Ikn2Q5SzYY+q4twy+QMX69vDy4GFa+ZPG5DNKsLHO8erC/Hl8mnkU14ddh
         kNgVukFD1GTj7ckZmCZKqqmbkuoErfxF2mS+tUqpDASEdDB1XtVy5TeoqqMjwHWFtEJI
         S/RXB7a4QXECpN1Yp01zUXeMku9m9T+50XQqb/bedronh09C9oUY9MXXMVSzzH/W3Wnl
         ag8YOyewhVfxkMfZ/zIeXAyPRFcvZCp9zQVnwwIxLIBxVsFYSMirX8mo09TBoEY7Pc4E
         FlO9Ft0K2fOWv+pNH56eBzDIqCMxH/nnVyO94P4s/CUBEExqFVCotHOrO3eEgqsOHYRk
         jQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702628; x=1777307428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=;
        b=ow0l/ZtbrXdFDJ66aKdOT8mFKguBCt2FFs8qYhAPG6OzeoJkSKWD4rxgNrR4rlKraA
         nUHhRftsvG21n9JIp8KGR+qBZmE7221y6R0kKVsvRJlcJPsLdZ8tCN2rvwqCnor/ttPR
         e7UY2WjkUAhC8l+amygcOIot/U1HIljvV7gSuZRrOVmgB8CNk5SLuVprcdK6TojF/n6t
         hgwfVZA6kJxkiREbzM38AwmUUmaqauC4yFy6CtRGctWvmXYoqMmFHfH0yTvBLkqS1ZRj
         wHJambVd3dJ0JU7GSIRy+ZSuRkMzAi0rkiAD4L/Yt8AOGtd8S3571/14iGS2/5qMHvO7
         Z1AQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8NLrYmU5k2c4npKjS/Pi7WPfDv6nCp37r+5ZWfceiPhAkJwDxhNtwLA5h+P28nuC9sHQD9evANAGY@vger.kernel.org
X-Gm-Message-State: AOJu0YwgsHaX2G9bHFOhtoyjOneXHLuHy676X3DS+Fk1FkDhqw2wxHyA
	p7EszUXNjesl3H9XJ7W/apSwTAHbdHsu+waFzjWwNqGUyZGALTxGDv40B1yGETy13fP4mgBOefO
	jszr0qGInljIQihUTp2XUXciViTbUkQmnEvtUDhbI/t2pvwmd2AS384mB4V2WR2sZ
X-Gm-Gg: AeBDieu369b8+qTR08w22TypMqq5B0LckvWubZNF+/btDKi9aPRz8xpFHn3BcSJjqhD
	r25Sl6+nknwoI+OuYmwjzt1YHmCMpppqLvSPYInvGI3X0bxEUEH2n0yUCuhArep7Ykpz++vfjFw
	46YeooUQiUPmKf/oI7roFQGS/SuOln82H4m7kEGlYFcql00nUXYe9mmiXkAID1FQ0Ty9MDh0AAp
	INdS3RUwxlZOG+J6fy475KOFcFa3/8JQc7ZQYrQeYKoNv6zAcYy2ZI25zdmKJdb51yR2f0XeVv/
	Z9Umep1uGsaMrwwYHaethQ32IKUbKFjUN2hqAq/wTPP62IZX1BQYmDw363a/FbmGtbnyaOABSP1
	ltjjXr5amELmXvBmjAUwtiatmlIjy+En83Y0srA3KycN6K2aBWVDB/RmMplvJICc=
X-Received: by 2002:a05:6a00:2341:b0:82f:2d48:f8f4 with SMTP id d2e1a72fcca58-82f8c825655mr15172494b3a.13.1776702628069;
        Mon, 20 Apr 2026 09:30:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2341:b0:82f:2d48:f8f4 with SMTP id d2e1a72fcca58-82f8c825655mr15172444b3a.13.1776702627534;
        Mon, 20 Apr 2026 09:30:27 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:26 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:59:00 +0530
Subject: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX+GYxESZbJ2Fw
 XqWUhjZU1cRtiFnW7S9lveB+YfTA0EWWT6DEiFzJ4XDsrlMD6pGcnDmAoMR2NNr2vO57YHfEVn6
 br433wbuKG+HXHyInF2dNiMhWKr29b7nRZ6l0yYOrNSeAFDf+pjgFfL6kFYe3z0bkUv5cBVNgZs
 Oq0qT+zWy9AXlhpwgHXwSJ4MdyVqw1Tjsm/lY3lA26jlywtUzEMxyzeYoIFq91acTZZWw9IAwGz
 N3BZX2fmvl7wBSnAWpUHR8HBMSHbdagWgJ8kjYbNJaSXt0e6uKS474wPdwPuPzwvQrhYUf+Dwiy
 JgNVB4kHMLegUJA+ar+RocEs36NfOcJfU+GNSLZPuxFvf1C9gEy+3aX1Hq8lS9Xe/AUIPpeSVK6
 pa2NdN9I6hXrUnOEPFLK+zJxArg9Q/ZRH3Lcywh9gqJrTZjd24h0kFII9WUEglSluo+cl2UeDaM
 uW2dTQ/NkA+GyUPicXQ==
X-Authority-Analysis: v=2.4 cv=IIoyzAvG c=1 sm=1 tr=0 ts=69e654a4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0acwFryUwAlR3FHL9NYA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: v_T7RadDfYZoRvCS6D3Mli8Jt-_bu96t
X-Proofpoint-ORIG-GUID: v_T7RadDfYZoRvCS6D3Mli8Jt-_bu96t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159

Some PLLs are already configured as part of CRM(CESTA Resource
manager) initialization. Add support to skip PLL reconfiguration
for such PLLs that are already configured.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config)
 {
-	u32 lval = config->l;
+	u32 lval = config->l, regval;
 
 	/*
 	 * If the bootloader left the PLL enabled it's likely that there are
@@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 		return;
 	}
 
+	/* Return early if PLL is already configured */
+	regmap_read(regmap, PLL_L_VAL(pll), &regval);
+	regval &= LUCID_EVO_PLL_L_VAL_MASK;
+	if (regval)
+		return;
+
 	if (config->cal_l)
 		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
 	else

-- 
2.34.1

