Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D642048D
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576787; cv=none; b=DXKk2ne8XXHeOarT6Zo0ohPljAY1hi1gtz16mF8jHlzMgA1APBW+Hqa2iwJyDZaN/W4pwQebujRrlk1iMG0cvdwaJNTVgaImFBgDRyLYZTfcJwz6Afdx+doORnXHjSkOXzRps+vAIec5n+JY8GNKDhil3T9HepCqAayc9xAvH9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576787; c=relaxed/simple;
	bh=9Rs+ll41NKEFlOm3FoL6ceFLLpdJXgRekcTbFNLh3NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAn8MfaG+WmPRkqpUpA6hewbYz0hTbXBvZkqbmKsyNqs3qlhZw8I/o4yqj1/SYVdwnShIeKun6P9LfId5z0UEXn7i3SHQWp/AHOmKNY7RLmdbANf1e4oK24ebN8r6U71pbIWQTf00a9UELClU6VNh7qvnjZ1C2kUFIWefD2yI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qum1La/7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qum1La/7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc891373e0so37895645ad.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576785; x=1788181585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leXltbiOaTHy4a8AzjEvY38i+F2Jzsbl2HWjNkp0y+k=;
        b=qum1La/7h9/4tapE+kuH/r/Yo0F1th/ZMtHB6IzU7oEXgLm+xDhlmHShgbzIm+hjV0
         SBCSEhtR7mvxnJMCtDq6d+QVbnmoIKUyCbiu/NZC26DvBZThkqM5KEUaRQ3RFo74PG3H
         7jUJxtxYdbTjqc+GyKI6ve9bZd68/OYLm3QwSnlW1WO6tVFUko4i7PNG+kjcqUW5EVYJ
         Y9/Ck/rZqxwPc4vybvAGG5UCMUahIh05QDbTwFjwgL6Idlf769q66eKg/ZsUjhnkca/8
         tFGDnZ26H/MxzoaigCUAj/VxtPEQbnPzFh0DW0mf8XesmMbPp44x2Rxb3QFyC/52wLZP
         cU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576785; x=1788181585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leXltbiOaTHy4a8AzjEvY38i+F2Jzsbl2HWjNkp0y+k=;
        b=sradHEmyEBgLNHl1RR7WPBnA8Q4ndKOT/a58wGmMtAeiXZwPM+hlFik9nsJZITK3ah
         ecJCxx3F29k3JdTfW369mmCBrVsWeT3Vm3JzyCPbgytct0IGjfHEx9SfmowqnRAU/jVB
         n1gfDXVKT+oVS7687FW9mCobBKvzoXavxQyil/o+guBh24HLUzIWD6AchUIvI9aTqVwH
         QBDf+ZHuuTPuZilIkf77qicyKj6bqGHCR7iUf8u9aRg0l4NgogNA1GLHn0rzmOSyx3MV
         kHvXBm1XLW1bAkNSeGE7gGxZk6BVs1LMDaDQgcQQG6wPE8V3gLt3r7NfsYzZ67gEQktm
         869g==
X-Forwarded-Encrypted: i=1; AHgh+Rp1muv5nOjvimrZUepcYT+m++wceISDjSTWNoE3/mYSLQbZN9txjMe8TZgGOezF7RYWGUuLvw8o7NiY@vger.kernel.org
X-Gm-Message-State: AFuF++l1nYTMbZpM9zRAv09QauDKp9aVSGf3fgs/AAR4K50ich3fZ01x
	HtoMBpOeYB/5oaPlodMhdLAN4fB1zGPAo+ei+B9lTtRM56Y+1IbDoHob
X-Gm-Gg: AR+sD13+21Mjs4ae+nPUDyqMQtwatlWay9anut+FeUUQbMhGwhqoTWyD8+x3XApkc6x
	3e1b2lwa7GtAvWXLYZhjxYavrwnysLWhTGzA/o+2uVJG2HBaeu7GNbZAAb0P7DCcOpnKChwCbEi
	cINTY7u7RJD1wdg0o3WcgUkIwYyChUVldYVir1iNa8rhKg57+g8keXIlJ9nlcIA/eh8F+oGKaBR
	v2+0BgfPcGfhhJKTdKdWNpW459gnV/QCH2nOvxGbG97kahM8B4URWnlV1YeyYEG4gANcnlir+bD
	SVBYFUppBUQpkjqJSM/QX87PSlVgbxCyDKPesuJ3dqOLmN4nmsNj+MxgCk+SZBKMOvIZOZvoMwu
	1lnpEK3SBKeBFY3bmKAgvC0iE7ic4jIhxh9jCgSyt3p7sVlb8pkUdTGfnVbNU+Y1eCPUsjm5v9P
	J5/U46tmby3yov4UcmfvjIoPaRYw9ZJ880PwYvx7Lb4yCDbUgrkoyvp54h0XBTVASoKUrClcjux
	Kr3YBYTylmu
X-Received: by 2002:a17:903:2ec8:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d670b9ba58mr347409935ad.5.1787576785252;
        Mon, 24 Aug 2026 06:06:25 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:24 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 08/13] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Mon, 24 Aug 2026 13:04:32 +0000
Message-ID: <20260824130437.2771-9-sreeshankar0910@gmail.com>
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

Add RPMh power domains for SM7250 SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

