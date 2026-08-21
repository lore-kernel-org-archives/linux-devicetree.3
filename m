Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B541432E60
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299981; cv=none; b=FkFzUIYbUgdBhMuVO34FuGKXW+nA8rYEPW4hgJVyepRwW+OrxJLs51tHvggyhx/WvrIr8Z5H/ZBfrqOvta/B4dUz07wHdZXifhM54Lr2uA+TNZuyPQ7sbO3mov4t34aZPOGiSLpldkuNxMp0xCx5WkfoMJk+3BFHIZftF+X26RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299981; c=relaxed/simple;
	bh=r2L4kMqfhwIbUzsmf8wdDtYuSEy+RrrvfwHFtyC9iAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSLpYtX/Eb7Y4A/1PMuYxozQkvI/XkjAw1iGgDimveDth46I2OEnJpiLNG/E+8u/FD6AZiCfgK3B+1E/CkTY4biDXKbtIM1YFeOIAfkJNtakrTFKozy9711ILNJl/mBbvbAABvAOIZJBhYVAStMRy3eIGUWXLz+owW4wSgdA1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI6ER5TH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI6ER5TH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccf2360620so5992145ad.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299977; x=1787904777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnjRied0UBQQezXmJ0yRlrcVs3eu3/u9Ou72/egKxFo=;
        b=GI6ER5THeq5IUr9nJOQ3nGfZtNgdBuj/Gh8ro0UHJFY5BvjOnnaGC/hos8CxBdNlX9
         lbAFdF4paN7cZwIdb5PE9m2dAA+lTA3gqof6X9IPQ23oq6t7ghEig6sGFdKgxWkSNCN9
         m1Xy/a8qn1/MvXAA6MJnKKodpPqo84f3+heeSU98edfrKd198rCsddGeEnXxvCrG2vK5
         Z/k7uj1PbVn8EtR/PXyVm73cRek4HwWKITwRL/A90c71yVegHJ6TBg2n9g4xw+ypWrJf
         AXTnS9X9a0GXCNAbJU5Cm8LC60ffUtw1Bvmk8uD3BfMcLd0Rme/SIoZrBXBsUj+tW0tv
         kQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299977; x=1787904777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnjRied0UBQQezXmJ0yRlrcVs3eu3/u9Ou72/egKxFo=;
        b=FxLFa7M46vvSbs/WvLni/eA0jtOSVL+dgsOsAo4KactFrQZST5pZK4Rq35Jq6dGinh
         mAizZ4J3ahIG4lf5Zman5Qwqi8dgzpsZfUkWzyKpmR+nZkXoQRORWRw8BKgObcc/hHyM
         4IZWsNbOIZWi+6d8zvjvGyFli16/hlqPDqzjLhLDCx+uCNhCedrYIJ/pYXsb+YFkZ1z9
         GNNuXwAazaaZOB/sFhpy4PKvOjBZHQqZFopTPq3Gtn7fCXd8EJxNEjNB4AfNLw9YJSjp
         wRhqHAmpznuwD6IfdCAAHp04l6PdjSaUQ6bgd3z1AORHpfSRHL5+sdiN5puQqnBU2EgV
         jjrQ==
X-Forwarded-Encrypted: i=1; AHgh+RosG6mhBQnM3pT6yfQqbzF9/aqtsNeerx50jmnWkj6Zelt6dbI0HnlFFuGjUPRwEYPA+5HDCDdtBaPF@vger.kernel.org
X-Gm-Message-State: AFuF++kbB28gvl+Mtnu8+gXXBD2J5FrNPk5HOs9rEkCaARitkg3cwHER
	dhjPECex57eWNtI5A50UIybch9lIVyZjwr8HAulhvOPSc2hOdaT/Tri3
X-Gm-Gg: AR+sD12KXCEVvqtUY+qAkaImWkLyEohd5MlQVjjbgoMB3Q4ojIIf8RBfInFd0raqy67
	KulLlaISNMKvb6JQwQSUk6vJ5YDWbwuOsoccWQdEq3FHZzu9N3ZMeVqjWfNiZTZM+P8dSrYYpH7
	pSMFIqJHk8oui1w+9auO8dZ8qHgSrnamKFrwAPYXqaEZh1lQeU1e+TSnYpSgxGTsb071hYJxPEf
	A4Tx74SsLvExAyg+3s2kYD4lRPcFnpBiuvMogFY6d81oYdXGQ2Czo7koOgLfvARoGjd8rxXfKMx
	P+3KPp4sc4Ptte+IY2y+xKWIXeAkhPM7Iu+WI4HYqM80w6fcev820NgKHGZDwDevgDnpdhVNP+j
	zvd35iEP9iylO/AnJ2iD7r4UByKp+Yq8JUQONAi3PgGb0rTAi3LFL3rCNy20QEVLytVhot7oy3i
	VICjaJ8RIujBGQF+3i47kWQCiV6HpROhN7wPtbNbDWxth7f2y1UBLgNFXlsU3s6xV1HMQpbDngo
	4iKpHE9s/4A
X-Received: by 2002:a17:90b:2d91:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-395c39cd288mr8791698a91.14.1787299977440;
        Fri, 21 Aug 2026 01:12:57 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:56 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Fri, 21 Aug 2026 08:11:18 +0000
Message-ID: <20260821081125.4522-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
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
---
 drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a..f4cafa274 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -1011,6 +1011,29 @@ static const struct clk_rpmh_desc clk_rpmh_hawi = {
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
@@ -1120,6 +1143,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.43.0

