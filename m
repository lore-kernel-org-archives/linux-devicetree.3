Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81747A87D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254795; cv=none; b=uyB/4dgwvsjhgghhk3RiMcTttRLFol1c4IHOCmPfgs9bbP5YKCNJWDmIGaI4bs4l6nvSHkBLFQZTUDbSGU9YqwBJsEOOEIxN1UXf8psKNsyUU7o8YDc5WW/urHN8fFiXHl7eNqLD6NedgS/OWE5IUuXJD2UtDichLIbg6Bl8h+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254795; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swzcAL1Zsn2yzRA/LgzJXvJ962W1PMfPRmlb3pkecj9lJx9FNzWRiCfyqSDsgBKKbAccEaXD1azoYtUaZmAnEi+yxlTEWMTuHq41lqKJUkt1+NxPDUU/z9I7AVmO1zAp2xBJnbZolgOYt+k2VzLpbTd7IPKCOvDFM3S5T4pZD1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eT0fKfCO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eT0fKfCO"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so4659239a12.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254793; x=1788859593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=eT0fKfCOXSn9IEcANvNS9ndZyCyuxaAS1IFXOLtORxQGtjmonf841KWUpIIpdDEKV/
         u0Lj4UC880YnlIBe1oFxjhjMjpP0YbQTvhboZnY6TYziQa2lBcuICvVdTqDWH6jUTVVJ
         qbrFHcMnHwKbGIAKt7PgzBNMdup6UrfD8gtX0R6wMKdC+ShNRa2lgEoZwGD8DKPfhwf7
         hBhxqR/PKvAWWPo3//cNkFu544p8m3s7CdAnQnRZusRFmxAV7DIZaqaZsAzXLJTiWf/L
         KU6c5EryAmwsiKRIAlFVJnwJkbAIUtatysj/rNri7bMgoki8na0yNvYvOQ/cNsu4ZMIr
         G1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254793; x=1788859593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=HwtmKSooaTBqelx75d08z7IlHzijfFc7uJSHqVYA451FbgyUvhHHdywpxUKCuQ0C5Q
         0DSWDZCHDic1O9QjRW13ZxiiDCtctHB3xlurSpIIZJRlGe51Dp1XyVn/t95AZzUBOD5F
         AMASvUqJFpybp6XgF9Tm+DkSmyKGwo05/RrWKPF9OJiFd5QC4t7GLWryhoza1280Vfxk
         zZf7bU853/ibx7OyCeiD5eiRKxGouGRc7SEVdELNMg2z+g9f80+mRfuRLeoH5J0PWNnD
         Gc6xg8gRlA5M0lszEgOC1ynmSF0WXuE4dOqvGedv3i1Mw133zhGa1GM9bsznE+W2XXGQ
         Ziag==
X-Forwarded-Encrypted: i=1; AKwUvBxGudWHddHNYE8oVhFuybq+cv1VYYO7tBcyumLpONRt0QZ7GLAv1cOpXDd+YWKRQJFVQBRN7CHCM9v0@vger.kernel.org
X-Gm-Message-State: AFuF++kBCwI+bq4LrDQn91c+AKTkOu1gKZ1ZIvS9MCcZsuNKN3llHIAW
	cAHGi9pbC8sQS9ccQU8EgT0MSCO7ZS1its4GtYxcX5g+MwnnVnUaThF6
X-Gm-Gg: AYBFou2u3NNVBv1JAw392y6Gd3PlWgYxEb6kEdcWD8+4tJnArF7bLU+TiM6TgdUbVSX
	NGYtklMSKv1mmxl0HBjvd9Cvo1Zcz+RqVVDPdVkHTgDL57Gk1OsMs5nH7scuRRRamTuw6zzQG7R
	BDjifdtIJLsexrBl3md6Qj/mMpKmFtCIUgJl56d3JkRjB/oABXEyPSPGUE75/xh6dE+eZr1eXqq
	PwaFXvHM/aN8+LXHNwAvQmkrHRbHhI0SOBPQCkmqOJX/dhpHQ4srJ+jOhKhZ2AiYf4BaLGpfOCw
	XZr5AAKM78dsnuaMD2c9bscUiVRerQwlvSbuUPLb+P3L1GSsXoEJR/noQiaBB7BoHvCdj/ELhfj
	DLecIspPyUSMzyLu8WmRTLwJGXv8EWYucnzT2kx9FXTaE+Ozm6VMxJQi1VJXCg34ZjQI7n5Ugnw
	xEZrcSV+j1RR+MoK64zQaJWSer6UWXaVXjhnhETKvwHDfpaDhwYdW+8RBobNGdksIDStXc6/R+7
	Tgk/7+ogOam
X-Received: by 2002:a17:90b:3904:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39907e82897mr9143773a91.21.1788254792747;
        Tue, 01 Sep 2026 02:26:32 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:32 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 08/12] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Tue,  1 Sep 2026 09:24:43 +0000
Message-ID: <20260901092447.3028-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RPMh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5..70d0ff5cc 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -490,6 +490,24 @@ static const struct rpmhpd_desc sm7150_desc = {
 	.num_pds = ARRAY_SIZE(sm7150_rpmhpds),
 };
 
+/* SM7250 RPMH powerdomains */
+static struct rpmhpd *sm7250_rpmhpds[] = {
+	[RPMHPD_CX] = &cx_w_mx_parent,
+	[RPMHPD_CX_AO] = &cx_ao_w_mx_parent,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sm7250_desc = {
+	.rpmhpds = sm7250_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm7250_rpmhpds),
+};
+
 /* SM8150 RPMH powerdomains */
 static struct rpmhpd *sm8150_rpmhpds[] = {
 	[SM8150_CX] = &cx_w_mx_parent,
@@ -910,6 +928,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },
+	{ .compatible = "qcom,sm7250-rpmhpd", .data = &sm7250_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
-- 
2.43.0

