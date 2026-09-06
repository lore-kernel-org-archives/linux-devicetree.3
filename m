Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C774A3DAAD4
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704298; cv=none; b=eUGcKKuXAYQXEPJIJpMdjXOY4B/cABO5ZM9EPn9fcNDyeGw3kHyLiLA1YkNj0kV0cOQurOiGJiJMIV2Pr+mvpQpei/PCK3uezqn4CI4QLAT1TjKNT9ATrSmTUlI7ae/UbySiLSMVUHrRQ1WgCsMXoZu57UW+nKg8x/Qmjk7T6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704298; c=relaxed/simple;
	bh=jkU+fUoOwa28jJYemXg69Wlafd0L7CgVOA0rnavRrGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E76B8oWsx/ncjnxzdslr3tbRhKEq/ksno66w+rhcw2XnfLB+trN2nm+Vctd4WeJ6owcgMZ1Gi2A3CeL2m/ypIhMFUH+eaJFMGsM48EU8yO8SG9dMHJcY9p3mUcU6t65ZATOZZQgokTwvpLH3vTPiPIY7CBQUYnaZbzSurLzhFiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ans61Gzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mc7fwB5a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ans61Gzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mc7fwB5a"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6868G63Q451537
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 14:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=; b=ans61GzsC8q0zBdo
	RqsQrH8ZxWT7Tr4kVB1D4Ne5U/RUNrSdDTtXrv4vFzc+1qosHt3paPwPNqfvBbdE
	k1tqm7y9kB16wtnrbhJsJfdVUe4p3g96UY9j7YDZAK1o3VKwM98ZMXyuAnFGk2bx
	i7EprEsMKdfSM88j9v5xBlGvn4ZWrilPU+QMVH/XC5fXZfsN6elnlbRStXMSNA+t
	4zscfwXFsc9cBoqPPiRwH/vFxau0AAyzxSN3IpRtTLbQlwI3MBVqXKJroSWfFxUf
	ZOSkyXRn9DGEijyWKRA6gsD+dqe3j0Wq+2Yopvsuu+LFBBq3+ya/ztMJv3AzhNpj
	oDBjCg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhkjc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 14:18:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396638f9a18so481273a91.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704295; x=1789309095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=;
        b=Mc7fwB5aOz/oZu5NhjgpiEVCyum+nQ51rlSR9q/taFM5IBu6YIWdT/EQMgU5nZ5AF7
         AiJW6ZibX+RAnXY3gkLv+q0c252HnM+GPdGAJAEH3KAj8q1SaI1IeshsTxaI5piq1Zgi
         PoYSOqKoWhiUywOCgAg+WJUOVu5DIlMsLaPrepQFqH9o0UFNGGPGi/BAeZk0WaehbGfJ
         5FiP+uoNPx+PEgfHSRsB8sPKeszwOJf/Z+nN+cCzhUU5fw5LVDlIuY7gEAvEturcD5Ke
         tHuOO0kIaeYectB8CphitWYPlskw6QSjDuWpGWloaj9DEOcTls3HOM6S6Ikcfcq9bCCB
         M6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704295; x=1789309095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=;
        b=HtBTgLd1IlG4KGSv8UX1XWOdT0hY7OFmvK0dnyHOjgIJeyq4QLubH4Wt1dGO6oJcKR
         bD2DZNVvUGWELau0mqS5aZnCffz/9heTzevmSVLFrI161i7wt+h7Z5CosZ9rzfsZXwWy
         bXEMdpX/8v9IIGuiQ4anx9EjFUxxsYBTAT0zu9GwuZ0Kzaebng7+L1hbsjE45tCDY5EH
         jxYFQj9H4rxe5QxNUVuGYR6gmwei6ADp0FgTE93gI36DtGvZj2C6CGcMCpqJ8FIjK+oc
         CEefA8kU3Trhv+kg+1n7GtTmJ8Pk39c/UuX/9qAnPa315yFC0/j38CLubEDQ0kMiWkK5
         n81Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZ6qRJru4AUFv0ZP8a7mVnQA8dd3S2FLwEDfE9nmwO18Q+dh1GeiE0iM11yWV7l6FLLb5LMRnnHGq5@vger.kernel.org
X-Gm-Message-State: AFuF++kyn/IHHd2+eSJW/+nOkZIt39IudQr6QYQmRH1SKHmozRy0x9SH
	Pq5GSKkmMnMt1epSTPPzKAFJ9EpjleIFnHenaA6ggHjDDY+wS8miuniyKhEb3nFOUG4AAcV5EmQ
	mvseJ85GeiRguQ9XHvXDMv9aZemtqKS8tKSm7PO4hOhfNkgfMFE3KIpFLSOZljBcz
X-Gm-Gg: AYBFou2hGJjqWhyZ9G3jiESUIDSJXiR9/0ZmbQiQzAqHmp0miBTyTIpBeHsbEScCLn0
	Gc/aNojTcXiD0+v8gKNQlSOeH+xMgx5aR0ucKnBIrqW9Mnkb1yMVtYAZc5yE4qKzgMrhMXqVOdV
	LZ6UoIL6idca5Sf78V9gpV6X547Vit6n38STUvjZShr7OKuo86APwdRNHkVdxmI5DMwk0u1IsQh
	me8lfGzGt+/RsYuxxkYnxLCcshZp+XDINit+y00z0JodOrzcYWd0KUz+r5Q2Lp9zEOcnIoA4kI9
	pmTJyDzrgczvJxhFyb0WobtCs+UTd4Sd1Xx392X5wFCXvMqRNKP+KOhEQblot13baiHiT0sTKfo
	WF7EnGJk1qvqpV9gFH2QKklQMUf9UZOnheP/2yMbrPzc=
X-Received: by 2002:a17:90a:1c81:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39b2c00ed40mr15915440a91.18.1788704294376;
        Sun, 06 Sep 2026 07:18:14 -0700 (PDT)
X-Received: by 2002:a17:90a:1c81:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39b2c00ed40mr15915386a91.18.1788704293965;
        Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:09 -0700
Subject: [PATCH v4 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-3-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=3160;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=jkU+fUoOwa28jJYemXg69Wlafd0L7CgVOA0rnavRrGs=;
 b=j2leIUEhfSDDDrGD4b8B8t3cw90gTQJOvq/BrwUvMJr982mw+sKUjJnDXhj0PrOBZGX5BsJQ1
 dNuNJ7Rh6n3DpMKWk7k7BgWvG6lOa81O+i4zfvLjcTeAktcQKL/b6Rh
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: 79xEXb6fMK6I7aUiX9d-tPQxm_BHrbLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX6dbDbTFZgmtW
 rCGcYXnXsLfh32EYFef/7HidjgEO+D1vjHqpPCeCvLEr00TsEBE/zapehCqqxY6/Yu9Oh9aCfEL
 G2nAESCJ8Ro87D7c728WylGGr8zOfYJPVBs2TaqpQzWB54ge+W/scxEtLpuv6Rv+vTICTlCJ1gt
 h1pWyhGfkYq6liXOR/wElHd0Ua14kQXUzytvi7AZJo6TRnTzfeUkYMC2e5iLzvWcdNozYJZoV8o
 IBhPo5rhWnZfrk37MBeClu55t6H9maqKeKXkFyogYs04/BRUSh2//uvK5F5YWUO3XzAPTws5Fzc
 jLJbLs7yXkoDgVt2T1HYRgeJShwAGiIr5KybjuDNPCp5B1QL9MtPwQiZCfQqCuCCA0EcWhlz4sX
 HtiL2mLyLaID+yE+rwq7eSrlIegjQL6bUWLouXefcXet9JLSFNlGs8EyLJZru+7eVzL5SaFWrMu
 gWWO/izCHtBS6+FZ0Aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXwJ8drwRgdYBV
 y7dptLY767EuTAOIZR7WYjw0OB4OnVXdF6uinvV64J/MtMV61yRahogzgwE5McuEHxdTHAGVOjJ
 tk6PCpbmg0EkleB5RlY2myygLBCHp7U=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9d7627 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vx7U0BMSOfWHh9VQJyQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 79xEXb6fMK6I7aUiX9d-tPQxm_BHrbLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

Add a flags field to struct clk_regmap_div and OR it into the
CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
divider_ro_determine_rate(), divider_get_val(), and
divider_recalc_rate(), so that qcom drivers can opt into
CLK_DIVIDER_* behavior variants such as CLK_DIVIDER_ONE_BASED.

This is additive and backward compatible: existing clk_regmap_div
users don't initialize .flags, so it defaults to 0, and
CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-regmap-divider.c | 16 ++++++++++------
 drivers/clk/qcom/clk-regmap-divider.h |  1 +
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index 672e82caf205..6e12aebf14b6 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -27,7 +27,8 @@ static int div_ro_determine_rate(struct clk_hw *hw,
 	val &= BIT(divider->width) - 1;
 
 	return divider_ro_determine_rate(hw, req, NULL, divider->width,
-					 CLK_DIVIDER_ROUND_CLOSEST, val);
+					 CLK_DIVIDER_ROUND_CLOSEST | divider->flags,
+					 val);
 }
 
 static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
@@ -35,7 +36,7 @@ static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 
 	return divider_determine_rate(hw, req, NULL, divider->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
+				      CLK_DIVIDER_ROUND_CLOSEST | divider->flags);
 }
 
 static int div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -43,14 +44,16 @@ static int div_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 	struct clk_regmap *clkr = &divider->clkr;
-	u32 div;
+	int div;
 
 	div = divider_get_val(rate, parent_rate, NULL, divider->width,
-			      CLK_DIVIDER_ROUND_CLOSEST);
+			      CLK_DIVIDER_ROUND_CLOSEST | divider->flags);
+	if (div < 0)
+		return div;
 
 	return regmap_update_bits(clkr->regmap, divider->reg,
 				  (BIT(divider->width) - 1) << divider->shift,
-				  div << divider->shift);
+				  (u32)div << divider->shift);
 }
 
 static unsigned long div_recalc_rate(struct clk_hw *hw,
@@ -65,7 +68,8 @@ static unsigned long div_recalc_rate(struct clk_hw *hw,
 	div &= BIT(divider->width) - 1;
 
 	return divider_recalc_rate(hw, parent_rate, div, NULL,
-				   CLK_DIVIDER_ROUND_CLOSEST, divider->width);
+				   CLK_DIVIDER_ROUND_CLOSEST | divider->flags,
+				   divider->width);
 }
 
 const struct clk_ops clk_regmap_div_ops = {
diff --git a/drivers/clk/qcom/clk-regmap-divider.h b/drivers/clk/qcom/clk-regmap-divider.h
index e75a65c3839c..4fde766b2633 100644
--- a/drivers/clk/qcom/clk-regmap-divider.h
+++ b/drivers/clk/qcom/clk-regmap-divider.h
@@ -13,6 +13,7 @@ struct clk_regmap_div {
 	u32			reg;
 	u32			shift;
 	u32			width;
+	unsigned long		flags;
 	struct clk_regmap	clkr;
 };
 

-- 
2.43.0

