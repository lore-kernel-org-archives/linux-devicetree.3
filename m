Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BDA3A8756
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326916; cv=none; b=Zb4pEn7ZmZ+gbGoR/3G6P+t4ANQo3S1s9a3peb9dgQWIX1CtAxes+zQaEjsYdoMOZlmGCA9xF26B5PO0gQxh2fcp6CUE/fvRFcBMx+fdu3DlghDfyrEgL37frrf5y7WlqwAAPDusAK/aGMNvpOTYwG2sNQj6dI72FROBQ6xeMPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326916; c=relaxed/simple;
	bh=r2L4kMqfhwIbUzsmf8wdDtYuSEy+RrrvfwHFtyC9iAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hv6rbVYYBvu81D/vRp2XYTHDYG2BccQSf0HIPdyKqZppUYr3VQm/hugRVMp5boTL26/tduJI1vK7fGvo+UL/UgAj8TctTgv/rTfH5RAJUuQt4Exei1OsyNbIuDLESX/Q4M4oWcn+ZoMZQso1eJnnA94iNxTC/w59dI4FN2ivUBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da4IX5jg; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da4IX5jg"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedf433a99so1078632a12.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326915; x=1787931715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnjRied0UBQQezXmJ0yRlrcVs3eu3/u9Ou72/egKxFo=;
        b=da4IX5jg2ICPv4tKlrTWsXqUHy8yHMc0e4Af4iphB9Ox8tEyok/nvowc9Mh3wbbvzD
         1rEu5Kn43sFQO2za76nrneXizcaqfcNgZyWNhvE4+L3nZ2byxDQEA3YTV7hNQtSIbZZ4
         BLCfd6yJ1zEORopGns+6GJQFpVFDld/4oJ30+Pq1t9iV1fQg35F3dHSy5EddRkd0E2bo
         jux0Cu6d9ML/6cVLEvWKnTUGkFydObNuFsKlrBB/o33FCRr3Ntu8zhhOZzgDToV88/CX
         GOr3nusxu+WaE6V6psgtCyJFUHUl3Q9b0kBfht3cVe7VxmvWTTe19IJc4+/gb4drmoNw
         +57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326915; x=1787931715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnjRied0UBQQezXmJ0yRlrcVs3eu3/u9Ou72/egKxFo=;
        b=R07Tp/iNOQvq46MNhu+XTadIa2zJzfdU/hNt/yamsH3hXh5yMD4Xregsa9lW+iNylM
         u8PAMVbu12xVCZhqWmRN3O2aOwBf0M+9uc1cZ4Qh1nnC5MZmtHopugwSVBC99ZsIHX7z
         F63Wr0dpcJf50C9EJUrdpTfonlvqlquG5G1u+ooRbBNQ2oQ+Z/GQ3JUKgqjRBVdGSmw8
         ehYjbjF7QCM0MrmLFQwYWjYhdI6Ry5vK3+8tjrYrWQzgj6WB7iANCfkpxICTZFK/oWcQ
         g8x+BZqOgvpBTkV0kDdYf1HB82knPRJhdwNB0GN32b5hSLTUwUEf9pV1qr81Z+4ZuR+7
         b70A==
X-Forwarded-Encrypted: i=1; AHgh+RoaVxndLaJ35Bg7ZMg31ojegF+DoY9BOdwaFD/k8A4kinCaW53xeW0QXwbbWOwCGZd1IPbHJT1huhcw@vger.kernel.org
X-Gm-Message-State: AFuF++nl/d0WBDc35ZuQPxhTVinhXd6Nu1PEzcyiz4yXy8YxJmgEZPJA
	E0Rn5y/VhCVIrtVaaz5LUQQTUemHmKjmF8O+YUGvdPU27eYROfNUZELW
X-Gm-Gg: AR+sD12XUbE1hY+Smaefw19o9ju4FeVwE10a52BeWAYA0GfNgwC36il5eq31Y7bVQM4
	XuXTjcKHceUQ1/4oomYz2BT7yt4MAtRo08pLyAUJgkfM1BWdrnAA+6l1/QRjSQXXnsQXFNkiHJi
	ZHN656QkFzt8GFa/IEtlucBS0lTuBJIdH5mAnlG33r/SqUy0BvpG0svGpTFjulPQ5tj5tFAcyCR
	fREndFiZ9FNdjyd88iupucgSTHZuEQhPUGGY0MzT7WT3GC33hJEUtQQrdQAx0tQQ9xmN6AOuGoK
	f0w04f0wst3KHkwP+cMOgK/+HrH3pMp5O4SjsqBOCjKcFwl1ugYmrFpI0M7p0gYZCjrrY5ZWfGJ
	3c4sG4ka/t21gBUbrizgoCdQMe3y92U3pDcSzFBc6xHmVEFHGSP3/3/diDmLNUYFVC6kruL9Jw5
	k/iXl5fXoPe+LtoSUUcOFHUyyb/o4SqOqQGmOHV553k3colCDywCUCT1Cj7Xe5FWwBtTAfq2w0F
	4wn61iUlRfe
X-Received: by 2002:a17:90b:5846:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-395c3718ee4mr14838683a91.8.1787326914537;
        Fri, 21 Aug 2026 08:41:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:41:54 -0700 (PDT)
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
Subject: [PATCH v4 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Fri, 21 Aug 2026 15:40:23 +0000
Message-ID: <20260821154030.2514-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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

