Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2743303F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246537; cv=none; b=IcftAeV8On7qCZLrSkFOXmyBWnmz7kV6l2bRfZA6sFXq/ezhI5w/pWTwwtyuJbElQF+A7kTAq4UeFDlEu393gUilJBpSew2lPwoJavJuDN6reLv2MkbhaiXYP5SmffP2FrSx7IEWjLctjc2KBnLbqaquVjducQMqW8ISVXPiX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246537; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbonBhPDvoBKUloizz/fPf57SoCIvfPrb4kevjAI9ea7yWwfOT5VgCE2wFWkmyy1AHCpXMgyL9Yrak855OxHKH24pGbDSStTKXksqCGe/xvqrpzxC3bhZxhLw+/ynS9tvzA3mXNGEbO2hAM22n5QHeoyq3U9s1rAvXxxsWo87mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVHqhbcm; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVHqhbcm"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so514162a12.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246533; x=1788851333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=LVHqhbcmWVZdx5M5W+g6FxkD58zvXa67C2Bg0/vszbKkr8MJ7Hh8N30wcMmCxdf3/7
         3H47G1g8536VzCKqEELGEHSSL371jAXg1kaA8zFw83eKFBCiIV88UffFuAXLNTFHG0OR
         YrGY3rxvXFRsBiZHWizifmw5rbEOPV5Htit9xmyzp5sinsMPW+PFwY8aKY0X0ags9HNc
         UGQOQnojq9xPoZYY2dcigE4IPUdu6Wnba9pDSJCI8nHKNeN9OX1TFJ9qgnEtg6887Toa
         GW4BAUQoExSum+50g4N6LiM3W36euAQo1YYiY/XF5CR6eYs5gNRq3CHeogmucIeJp8Q7
         BcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246533; x=1788851333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=al3TyrPLptq7TeyA+k9DqCGeGjOdjETOLfDov/V56wCorsfhCWyBgPIE0nmRUL8uy3
         tgQf7dnpvHW5lqCWbxniMN4Cx9pQawInVQ8TKO430g9vd8HbpfWI7CkdvcODhKTmr7Xj
         c0jkipgYAIhCgtH7CrDo00hrClM+pSTtXsJZ5jHfABchPlmer4oKnv/c/hAoL/jyf0b5
         U4uUAqq28kzua6xfhqexfVkgXBJrSN5wdN7ZMfXsGQTG5KHdgWNTmNDrFBg7Vf3wWjGC
         DP9nBPk0WAFAYcV9tety/q/3kJ9cQIw32UJxm0Nf2ex5ZOsOwB4WcserFVxrmqYvt3/W
         gcPA==
X-Forwarded-Encrypted: i=1; AKwUvBzAtpeJsmcdIAVyYosX7dlarwJ4KTFg0ZwvZNhqinPobKgbFs8Cbab8U8BVmXqGn5YHG/enm1wGCeQ7@vger.kernel.org
X-Gm-Message-State: AFuF++k7G/H88VJ2H/MiuwvoGGHSk0+P9MjeOK++DezWN1RaooALxc5P
	Pgg7J4NmAagxQZxoqXdB8/VGY0sZMoak/lKkCFiv3x2fd6x0SnYFDiLG
X-Gm-Gg: AYBFou2QcOYioRLOqAMNcSeXv5eq/ZLPwo/+Qjv//Paog9SCQ5ng67KByX0i7wapSz0
	u1vKylAL3J6vyg46q+0F+xLUmgayb05h5Tm7YlIknpIr/Orf3rSw4PlXJUUbqLTCbKafzmgK21U
	1T2mLKZoESleo7/aruREHMMaBQVTpUO9H6vi978GFr+Jlf0olwIKC60ccJgW8rSCPZbmD75c6OW
	H7g/qQOyhnMJfdjpraYjZsHr5ZvoqnZIhiIPJMFQBafsom0A0ScgmUcBhlSe9RkhSBvANgi7rgg
	+bs+ffCESJdDh40oU0cOrV0u9gDZuqQzF+hDZ1qXfQQVkRaWupkgoQ7soK6mcGNy7YqRg+ahagQ
	jlwGISPLtkhkDNV8yTbHXgk6PTA1u4dcQgLYMcMyMITGitQ0OzoJhzdy6IGh3JGjLAd68NPt1Dt
	HJsRuNkJs07H75GBvMmLn3OSncqg2eKI1CNLNOioKUJXApLZW4Vkq6KJNxweanRZArgVmEWcahS
	z32jZPnba+A
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr26750541a91.2.1788246532645;
        Tue, 01 Sep 2026 00:08:52 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:51 -0700 (PDT)
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
Subject: [PATCH v8 08/12] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Tue,  1 Sep 2026 07:07:13 +0000
Message-ID: <20260901070717.20513-9-sreeshankar0910@gmail.com>
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

