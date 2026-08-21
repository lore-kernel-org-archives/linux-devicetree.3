Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B191B43031F
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300000; cv=none; b=sCtooiKmzv3IpR/S6DgVCp5D09BiMLz3/sK2tWwCoWy68U9htqUmtEImqyJlb/elJ/oY2D6lhdh74HihpkZFaVPw28OTBQRlTv94mSy8i8CXIcJ/ROAXPDqvK3yO4AMaSArsZTQA8HYAZNQo664XtA5GSyF1u2ZQDYip/ltSluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300000; c=relaxed/simple;
	bh=tl8CA4rO92JFIY1onO2td0Y/lwEd1GFGGF+FJg0LZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdKH2Lv1vlTiOPBmf14rYyiGzvJjtJS9T+56YmpVD6o3/faxyQftUny6tVWjcktJjocTy/qhNQ15oPdbFyV9DpqFBh9yb/McVldQFNcpgdsQMuln42tXU5nCN3qeGwt8j1xn0sbzaVRQ3O9W9cgmeDk+joTXEOrwZTinTCZX6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONySzn9Q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONySzn9Q"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so714008a91.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299998; x=1787904798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=ONySzn9Qoe/stJqsxPqed9cO5RnTwV19LT5SkLY1nBoX6n0xowFriYJDonjeuNkaZT
         nsSzPFxzYojg24SytFVcQainBFZoueX3KirlQ+lNKxFDYju1oxDa2GpFrZ2GULj9HbTh
         huGEXMInU1yAWELXesZWdw8LJUhC0ckDW+un7YBqWx8fj+Gg2v3GDs1WDM/rmTaWpPGK
         CLmqhnjVw4yrCK5XbY8OUWr/DaLHi2cAeMOshooiakEo87LexvSq0j7Oa2PR3E5wVG5O
         99Hg2JwnD6S26Y76GaXq70Lxui0WwxOZ1raaJLIN/cIJ0q11xtBZP9tlfUYnx787bTd2
         1uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299998; x=1787904798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=Rou1hBhAZVlVfQ+5xqU+yZNp8vYxT2ZfTt2B6JccqJHUfkdYijVP3tMf2S6d/VAGCJ
         c3CgtO2+JLYHsrox09Wnj2w8DQiA9YGmcV0wkCec+dOaDkMre7c+0kU8e5qgG6gxFHVH
         kkWoANSyjDtJjSzqPoBqMHbCkg1kSHhzAgGWK2hpSE70wucsGLQ6BXrHidSkhg7FB/U8
         A2W7PMGKTYCMM5s3OSilumIR3KJ/gWEknAqkLJpOTSVQsUcbb+BO5OqxZXiZglkxQdQI
         Np80YaslS83jUdkKuiBcZx1UWYY2xXKu7bP89JRpGCJnx8YvaDmjDHk4z0cXX7Ia7pay
         NtXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+wskzYm+XRefGQuIv521pH4+MFLlbmx0q19oqtDD4amnY8wBYSgZie68m6FYOE/31I2N9nMJJTrky@vger.kernel.org
X-Gm-Message-State: AFuF++mcs30fuSxMQM4DChm3PXiq0wefliylM8VjUj9ZcdIgKKxLcf+/
	i+t7QsZbWEpP7OKRWTTPVygSQOG9Z9eqO/1Svejw9iOLN/zYpLaHYGel
X-Gm-Gg: AR+sD13D3dOHk3hTyhbfc3qaIMM26vaVTdibUxV+TzrGDX0TFSiZGekigIZgM+v2rfE
	OTgNF15UPW8k1go6UHbybWAqv94Jp0arfw19AkjMZl8Ll96wltYGzSiZ4xjCHJUu7AsPodU3jO4
	99F1lUaKHLToi/KvHHcCw0M0yP0g0mkEdUCJM6vr/C8tyN9aam65gIRSF5OoSiTpM0K7bk6vbZC
	luo786cwfDfx9CYwHxOCMvMzvJVeFK/055hfFenoIMnJ4+uYVFZTwL35tochEV2Ehpixz7bWH00
	PhZIIA99CNkKNhy+oSNj+tQq9lO6vadigkSlU2hBaEADp9gklZdDetqaoE1lNKl6XkSa9YPqiQQ
	+xJIGRZyJAWl4Zk9gxl7h8xVfY1GHeztIHbiUQFmMBoMJPrGpqf9i2wjc5vFkeBTpeb9G9gB9cK
	8DiFVrd+IVqJH4LMt4gY+XJ1m3wLSIesxa/j1Tr/kKSEMrVZZnSNRcqfncU26nq+FnTZD3YeNlB
	GCKKWxftddH
X-Received: by 2002:a17:90b:384d:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395c386a056mr7511738a91.16.1787299998040;
        Fri, 21 Aug 2026 01:13:18 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:17 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v3 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
Date: Fri, 21 Aug 2026 08:11:20 +0000
Message-ID: <20260821081125.4522-9-sreeshankar0910@gmail.com>
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

Add RMPh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

