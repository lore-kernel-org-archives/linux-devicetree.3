Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D541A502
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246519; cv=none; b=jg4eqszjgHpC7P/3LSjE7n2j02GR0cHgPBbGFIQdrgsml8LeDNgD1RmUImlptcd+a63HfXA7lBx/idx/pvMfwh+XBy5gvrsFTlJw1/fpw+PNtKbArgkKrfdSK8wDglFNapXjp2ntMA5OlPsv8SJWohdKLfb4d1vphMygPAsV2Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246519; c=relaxed/simple;
	bh=WWiZETqtERmFbujUpcdTmbmOg/Oos2rIugNyk5YbX6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Svf6HIImp6S2hoLGLUXXNQOhNF/00cG/cVu0k/dQLhE2KX8UW2iVyaCnbmmciU5STqP97OT6SQf9sL984C5DTcyzaal6vqJF5fxhLDUVsU6AeQvaMG7TLPOqbKFTUhvHKyAo4rgKTLan8/uEpYvY98yqxFmCjmJf1WFVaUvlYpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHMoYt/y; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHMoYt/y"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398e9698a70so680149a91.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246513; x=1788851313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=RHMoYt/yQfOAZAACcIh/xNQmcA9kB5nQ8CDT6GyVORQudBAB59xn4BCNd4yOkrStQn
         85RVXZ/oK6VJj6Owmd/uEzKO7wbyvkYvIuq2ljUC7d/RycVUMvRxqzhC9W4QGG/eiDAo
         tdcOxJl0u7BQGJWAuhTI6ASdPEW6Kol2U+gX2m8i7Ed/YYK5GkbBkiqgiivlhVoR0ROr
         vDV48sKQTsnN9j/TqJYA35LzCQs5VdQ7gI0f6eYLIeNOsIb081//FKLOB2E0EMvkkAig
         OcchqTz23NOswq7jV+/go4K0w+0L12zC89230xTI7LesXGOhXh22yMWk36Dolo2h7oX8
         +O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246513; x=1788851313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=sxg50l4KtNXlE8+VZryXnXl0mMUAECEPdghDh+eGZIQQ/RqyheUY/uMcHcCy16sGuP
         aSgUm8O9BcbVT6tThMFjM5mgSGey0yZuX0XfXWWIOcv8fu4NYgppnC41aqZKS/QNJSkY
         gfNKJuq6T/ec3sVI7/rWR1u/7fTmpXAJ9ygGeiEvTH+Af7EbwqtbMaZxx01WxJ6tYTaB
         t11A1marsFlT0AtFmhgCLeeytzNr5pDyDGj+T8dm+uH/yv197OCcrC7leE3vFZ5atUtM
         T7Nq/XCVGee+ZqcXHUvBIxVGz6FQK5dby/wutf1MM5l6Gsyun/UNDSPP0u0348LGXovD
         B9Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzw8qul3W44ewLZoFix6uoThPjA2eVM9A+qUQ/w1qK8gFptePevRuL+TZYiyY4YXSKy6msltksLy+4k@vger.kernel.org
X-Gm-Message-State: AFuF++lB8iQv9p98FQDzVpxpuwP0iEnAep89zrSMtJrHAIlhtoeSWgen
	oASEYLrJbN3fMjVWE0gc4Y9kVudlE9Va5sTlxNnPoS5uonGLTea8T0A/
X-Gm-Gg: AYBFou3obpWl+EZz2AmQsNZKxasn71lA4FTHYAawXwHbW04q824FXMCCU1jHTxNasr0
	nD8cz5ENQ7K5v3Mx3S9LmaUDu0Mi6lYiq/mYTMxQnWAJ7Bx41nkqDumFgBP/6fqhDxL91TCE2qR
	BcEjNCdHdOH9COsBxtenqGE++LiYRpNPfx0QqNharg9iJtfBGUkVEzJ2JjjqId10PqVjJny6WEK
	KoFUcLOzckj96ZLPIBQ3CI8roCT2Cc61j7izO0guRC9DRLsud75+OeWh7u4m1vNEx8uDsYwtfCi
	ay/Wffa0A0TAMNOX9WGTlNrBt5PAimrCOo2d/TN3Lvxlun3JJ/9bx4MiPNfZl4rJmKXuFLJbX4Q
	BApwIUv2ogPHH5DYMszWDZQ5Z7A8eV8/6fA4LeFoGTrU+NLeMqgp0dFQwMV8ySViirNZm92e5gX
	hFqc1IlMuHJ1fqR4nzm9a5Z+lTbD3NUR8MsPeGJlAXVFNzwMHTfi5pS37zvIHH/i0fRfaAC0F0f
	TKffE0sg8lA+hUi7ip3dY0=
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr35732687a91.17.1788246512913;
        Tue, 01 Sep 2026 00:08:32 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:32 -0700 (PDT)
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
Subject: [PATCH v8 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Tue,  1 Sep 2026 07:07:11 +0000
Message-ID: <20260901070717.20513-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
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

