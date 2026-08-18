Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888941D626
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040559; cv=none; b=IFob2IeimllpZe5d7eiL0iLFC9KljCtBaJ2/byICESkQtyfarGxJ1WnPucuk/9Tarwgt95sF/bjBE8WypqwbQ9LfP9jkedF0g1QjZnKPGL63PBDc8PVCipGA3cOtmg/KEhWsfNhwrLX82xAtoJkSWrjky2MZRmG4q5d5rVGMnRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040559; c=relaxed/simple;
	bh=99pJRjLsjgQp97RPaeWEZ1YZegnfkzqsNfQJNAJNwP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmw31GVkkZzoRgL41PndZzHdRvOJfz2bJvzQBz09bIpJNJNfg8YS5VKvTy00TRHYIF/fSyW7YEdEHraLeo81eMoDiGRrXfsM6wn8mYpk3FR01mkI7HdtBMQ9q3tDCHDp6GoVf/7eeFUj6WnaDWPk5U1nFOitsI1PHZLyvpF+Cwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEWORsss; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEWORsss"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3069397a12.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040557; x=1787645357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXCkXj9IgKaAKQ31oXzwXtt5dbLLTdIsAYd130AoDV0=;
        b=IEWORsssTau2nCRyVcCAFGoqDUhK9/8Jn1gXjl9G0ucpd0cuPctQlH6DIUMBp3ArPX
         KKO1pLUNK+lkc0w19q+daqr3iyyfKl0a8glEjrCIo8gklCtsNScwmQYae8FJntVZ0PuY
         SvHktqp0I+mlQnbLK6598dvW4m/2opaQWu2VsAnJ12+kFs4vdT05CYifBjl5Dp1XJrLl
         FHvaAcWrLCzVWtvoTlmiJuKG1Au+XJ8CQvTTXIH8ZchYZQOw43Oo8RxptMMT6ZgX0B45
         /UX1Pw9niHqXqC7PO78Ds+AiU+pKaMYuY8kFxtboz4XF7FW7VdNbOcUMDKDFL/E1dD9k
         1XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040557; x=1787645357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXCkXj9IgKaAKQ31oXzwXtt5dbLLTdIsAYd130AoDV0=;
        b=BvzZ/fVqpGb/kak+KOstqNH+/fwg8GwIPG9QEM00RF/s1PyfDttvt+/LQvCk8vFocX
         2FTijMM2bXWpO3TrpCX8UdpGgujAxkljEawbkGyoVI8y3Hxsix134fkN7d+lpPw5Ge01
         eAsaM+3zmHqkAuzWMyoYemSN4l+ul2mSClmY433RlbhpQty3x/FkKGA121ZYLqYdX361
         ycRR6g//tVULBAlyzNHtiftTmN/8uWHJlN6t4So6WDsiJniU4eEnks8qBXlQR8kz3VAg
         JvkTFurdus0IzHovCvqakC50dQgNOk42U1scL+5XVXEko/93G37GvZStr/EZndhJ+THI
         gvCg==
X-Forwarded-Encrypted: i=1; AHgh+RoKSsvRozhyH0tVmn2dUUyHQi4Ryi02eazeE19xtBS4Hka6a79WzxV6+SyhlEsE9zc+k2Jeo6FdYKxA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxl9zsz3j21zaL9V9u1jxuOvMTDaKlSZjLqBry0HFYQnSnhYLG
	hfqNhSagd3uAnbogJ06f4o9jyMibiidvNJRmfaheax+Xra8wBDNM3UE0
X-Gm-Gg: AR+sD13zd2faEL6I7xNu+BE+ib9UqC8n424P7dfQt8RarbiQGmkNpHBvWRpyHO3Z27r
	e9U6l0ot1nifUxAsbCDSB3RCDN/2UN85ZaXm4tMcwG7hb0RJMOfvFISY0MhINOZKqIW0wMSrSW2
	Iv1+T6Mr/LXTpOUAYhqYDSRxvR5vclni2fmZ34kBw0fz5vUN4IKTxEBeJ+a8exep+XP9yk6p0FE
	cAWKHPuiGSfDGIcbkWrvaHCsy7Qq/qcBGVNghNMxYLM5s6fSqF5ISg/8gx8d2GgadC0s5YyAD7p
	yG8UcqwLAQwMvO8/CWy26keY0aCer82NZR6iuZrBuXtZZSi7xZiQY0MtRm/sT1puMuUnvYAAC+a
	hW9xh04szp4ppiELA60xvn/hfXc4orx6LYE2FVeadMFB0ZQtkFEJs87zbpE35xm41n+59vWv7Si
	hEI2Xc0mVmOxMe+O+02Xj9qFk5QZw/wRFOXrgpEMoQdDiNie+Ags6B5Wp0P0bBaCHD7TMdcJr8u
	EEX3/h2cNQ=
X-Received: by 2002:a05:6a21:328b:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3ccda9e2767mr8314311637.12.1787040556809;
        Tue, 18 Aug 2026 01:09:16 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:15 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Tue, 18 Aug 2026 08:07:48 +0000
Message-ID: <20260818080754.4362-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

