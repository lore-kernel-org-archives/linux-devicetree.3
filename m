Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C935E925
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245128; cv=none; b=O9ZfYB9KmgOHaWeBlwPBWq1dGRjXcMOlgC0ldUdPKXfxNOklYtTXsKXWW/h5VStVkL5nj0Ln7iW16y8qyLg165jWw0i18WT/+QfQ7+TMSqxsBRqMtstMkkjNRIyLLopU3P3f8737gLldX6l57emRBMdjmljBSAMSNb7eJecN128=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245128; c=relaxed/simple;
	bh=WWiZETqtERmFbujUpcdTmbmOg/Oos2rIugNyk5YbX6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QA8uKZVxc67vyNozMfoNQArxmh/4rv8OZt/xjk/KYoC8z0gxbVO3ig7oB23/xf6lThulEOTYvjJJpEFfTUd+NLtWuhQbn8Hesaa24INZDzVJupGhKPbMkig924BgDEO+W8KVyNE9zRoHJ21jiEgufp93fkVRcvkXNfbKeraZEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGd6G3AP; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGd6G3AP"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so4670644a12.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245126; x=1788849926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=bGd6G3APJbxHwnOOXaFnZW0acsElzkkvjG+rp3ScNoL94aIlsIUFnGjxb+a5kkuwrz
         DuZ0Iw7YSQzkbT3iKbaaksRUD4bNaia1Qi7OJpFiR/ggsD2PCypArzu4J9OcmjFIwJO6
         qs1FQOJcJetlQlX0pJKT0wVJfXIs9IEfYP/X1moDfPnE/JRP4NyTgt0EIrDambZ0dYYe
         YX+TzxvnBK2ICpW3YTIxe5g1rwV/I4hKsDjt/IJlCNttTDsGeSv6WAAfKkfhC6TgMLN6
         wpg9i5+uMqxS5ACeAa0iADCU80PL9YsV+4nB0qYGFeLAyQZz/iGo7NiPTSie0YcgeLMI
         ySKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245126; x=1788849926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=PxehR7ALWTwr59Pwc/7hNZy/wMEvEDx0WAGPLi7NFh4e3WQbfCuiJmN/pYAOGKtRbw
         uVNAPD4XbMTOTT5awZIY5312qXjcQmpA4Onl0AzXc6W1G6wi8z55q9yrzuJ6WRuz6hJw
         MlMTV0KtHiJKMRhk/K31lNs3ytvYgGokJcqHwD08uxyvU3HL1Fi+cOTbFjoEv/5R8U43
         gZdBS/meFu/wqd1qtP7Rz3N595jGy6Uv33Zu8aUD3JfEtuErszfR4Tf8l2fnmWVgOiCr
         PP5Lu3P/EJibiDZJa89ORe0gFRCNZcNzkdEsiv2WkRTWuM6uyfLidJf+286iJuaMmJLk
         c9Pg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3R6VuGMjIiWcz/u3nY3SrIQF8griJ+hJTuXeyqH9mDdTFFBfnaMD5awN1q7eqCA5KRgk/zSGMEmf5@vger.kernel.org
X-Gm-Message-State: AFuF++lYrSvJ5iFQL4xuCKaGgZXiMG2mD1liy4+8TPXRzQTW5+bJH6ZD
	bmtxOEBREX9Rx86pMUsW+oGI+DFUmxrPO/vCHj1IZCP8rfiDyLkIyabS
X-Gm-Gg: AR+sD12/6xvot2WIDg8TBn33VDwNJxCdO2LJP3/RSuS9kzDXSEt4d8bFGi9uMkFqRKA
	6Rd/ONTrc8elMMfOKaPKIdT1z10KWVBXrkKURaZb6ofEG+NWNWRPDz76fMuzaFSNsJm/55FyFGc
	jKO6j52yN1p9ZH6YKC86Sy1osMTDm/80ojeWd0rjGocXq2JUVWaqFRB0CrXQ8oGU8AkqBvlQnRW
	3hKtfUztx0imqG67mgiIFO/GvRkiShlCF0DNUcNuKmySFbgpZ5z+hw6b87a8+UU6FTRSWEjhH37
	imgH0OJE6XJnfJP3+yaNUqGcg4bDnxwyMatENWb1CgebwuR81nkOPjvstyEYyROd2c8nXZBlxjE
	y1A72Cf1kBl4H+3T/8f9nK1tlODr2QTo0CmK+hvzRs/gnGOLKQbpRAi4YmOgrwZeiTY4u/2esin
	df4bsCcdrr2zCu4LTmZKxGwWYXlDQuoB4008LHlYceY3rVtEvdMJqln7YjcaA+lLMbozaM2YvCE
	3LO+WytYykD
X-Received: by 2002:a05:6a20:3d05:b0:3d0:ba81:79b9 with SMTP id adf61e73a8af0-3d7ae3d0e58mr9536560637.12.1788245125743;
        Mon, 31 Aug 2026 23:45:25 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:24 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Tue,  1 Sep 2026 06:43:51 +0000
Message-ID: <20260901064357.20055-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae..5799fa296 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -1005,6 +1005,29 @@ static const struct clk_rpmh_desc clk_rpmh_hawi = {
 	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
 };
 
+static struct clk_hw *sm7250_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_d.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_d_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm7250 = {
+	.clks = sm7250_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm7250_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1114,6 +1137,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.43.0

