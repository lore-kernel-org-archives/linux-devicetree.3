Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2866641E6C5
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576767; cv=none; b=OrQ8EGQUNki2IC206EqaKBi0D4VC6vpiC17Zld/3F6X7ujCkY/uPnYalCwtRUe9unRQ46k9P7ROPsM80SL8hPmmg87fj1EwASX9dgX47i6L/caEtbr6rI7UNl32SZrXm+QrggVWJnRc7s2z4xv5nqV/mkv5XywNW713gesf/4qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576767; c=relaxed/simple;
	bh=GZpOUG3EXKO+QZK6dr4xOMkQjofCkY8f7CgoNTh+PnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3DCXqei3JHXMOebR3lcNTki/k0BKCFCbcMWqO/KOA8patbGG4aLULj0BUSPpiqgXc20jAGpOvd6tzd6Y3fDn3fbQZ/mxF60WWIcPjIv/tMFryU0bbsDqyD7+K2mD+nTANImpMuh7vfBLPQsmr3p2c/Jdz599K28Z3f6K5CZqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MN2SSsGA; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN2SSsGA"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-45eb2e6402aso2147114fac.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576765; x=1788181565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgYAs0kfLDJbR97gF8B5vdewU847vzvHuLjE+TGmj38=;
        b=MN2SSsGAmFUOafXMXwNjHhgFVB74oZXbNt8iBYJY7K9XUt7C8fcPQtbSDFFlPvE/5P
         FrUHJHs/cZop1RMKz3FaPgoFF/VmGsV6zzVPh0Rvdhq6qRr7I9ZLLdcem22K96CVzsJR
         KYJLo+Vv2g+viIxPJgVkxqvakAf9jHZdiIFKJgWALsWBnQDgICzJT4iGXpCAmUG4SbZz
         r0g9skwZayV/oj1B1VdJDQvgTuYQGqPcEAInpVs5dgGYxV3mtstPJvuKJb7OB+6qJUIk
         PNHn21m9fcvzU01gpHTGYVVnkj87xY1rC3XnGWwIRQ203+/PPOyefzS7C3cwf+EsDqj+
         WZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576765; x=1788181565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgYAs0kfLDJbR97gF8B5vdewU847vzvHuLjE+TGmj38=;
        b=gYIzJx9OfW+/803650qDiqRqAs0Lz1iiW1qskgH8KRNli4s9DpWwiEBB1vBZ1iP5qn
         9+gCRhhhpoItltTWduiC3CCeIZpObaazqBXIhTzpXTUteDZrpGzgXrHNN6BbB2JXHayO
         v/aGwOFJVNmWIvTI/hkjnf4bgYVC41i2H8Ngqg6ZfV/Voe7uM9PntooME6gsBmHWaiNY
         IWznE0Jw428K5MIVilAG0MQTnRlj15VB5bZ7WLekkHjTIej2L6gGWJhkpTmqhmg/sJoQ
         ijGD2eNDPdHyuF+MxbMWlf3YM9HyL8LnoGi9rleWWH5XqTbWg3n5AzCEQ67dlgEbms6D
         azXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/KMjNDdFFOJMadq0INQE9xwGVJwR6dRvQcvJheYWCyD+VPZZdF76trJK3PCMj4oCcvRk7R40zq8JP@vger.kernel.org
X-Gm-Message-State: AFuF++kj/nOZhQPkHqPLKyPK9zx3KMOD/ZnKQX2nNdi943U/0kKM9Z4t
	8bdf/dEVJFAllRWJDyhj4Vd5dwpkvzapb3mGio39UbfuqdXw9QeMFgd2
X-Gm-Gg: AR+sD11W0QbsO9i2Z2CWONr7dvSDaOI45lnCGEPb4wLC/Yfvhu2LHTy9BNI1iHfia8i
	fSdyUx4G/Xhx27wxpuQuWIzOjfEetPu8MnnCj0JFUn7btrx00zkfUOIhNCHv3Zov7uJRvpJgApb
	72/NmimCvzje+6Apdh4ASdfDotE46VGn7xjdtlXLCv8dDaMe8mGrdyH0S/u8hqJusdGOeWXxwvP
	labt3puPt3rQWXIZxC0irNlqoj7ltNgdsXdjodei51Sm0VJZQh01t7LH8jSL42GIsQsVaLM1ecc
	HrtyE6+zmprNAtuaWxCFY139bf/rOtVoHFrsEqjn6y8I6+K6lXjKPSu5BrFqei2j7BHT3C875Ju
	mOZgVmmBcXGRhSGbd6ISIJ110j/d77Jgp9gkRX2+X3BI5lctTTI+Lgip8tIs+M04IGWJb0UyMeT
	L0RmfPQTHKIBJxSH/T/OCoTGTMRNN/d3GQnArWTxRNOUfjb9awW6xO2bz1H3VT6e50sVVG+m3JX
	aA6WTK3a1Kv
X-Received: by 2002:a05:6820:1c99:b0:6b1:5c8b:c0b9 with SMTP id 006d021491bc7-6b15c8bd304mr19796060eaf.3.1787576765018;
        Mon, 24 Aug 2026 06:06:05 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:04 -0700 (PDT)
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
	taniya.das@oss.qualcomm.com,
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Mon, 24 Aug 2026 13:04:30 +0000
Message-ID: <20260824130437.2771-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

