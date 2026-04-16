Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840743CCA13
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347068; cv=none; b=pd1TlvBjHgq2pM1GSH9oRTXsws+flSv+1DPuRe9PoViYt6mOHhH3dddGM/INgbngRhjXB9EVd8UD7OiJe4qTDSFErEUxvjbkE22u/kbAhJYt2V09fvGpN9aEcWBosRaZoI7tp5Z8Hd+752C/vRQ83izXLBKDreVL2LATeMERGWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347068; c=relaxed/simple;
	bh=bnP1qUzxxDgsBazJDYG2Zcd6T9gbhSvkb8cnNDpbGSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFVf4RrYfrsZq/UEP7Ni34LrpkR6JcN8gFX3+rVsrev+EGgrP9uMJcTRZ5hRtIAYzUyRm26/ErUB6JVNOnawlUFvx4AcaeQv1r3w58pqzI4MfuXFfk5uxVTgDhsEldV3/FyQRBJrWsyMgPv99EW+ScYrPub9ENi6y5zXyf+crwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBzo9v3B; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBzo9v3B"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-652fcd5a6d7so784762d50.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347053; x=1776951853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y32Ndil+CEYiAt6NbtKxMI4lGiTcdGiLMhKF4jZK8hQ=;
        b=GBzo9v3BUxUCrUkmYKv7o+ezPH6SNBLplrx31NRm9n9yfQOFxPazhrA74TYAvrKDU3
         qLuQbhDhWfA3MOTzHveNdr3oqRJqcySHroX5/OD2fQSTBLj3IolMTMNmIKcdqYJlrPe2
         xNSP4W3pIJtMOnQndJJglO9lrA0M16joP5CnJibZ+pR8r5wfOI0x6EayutB33njbut7M
         aKV+jkrn7MoczZgws6vf7I9Mji6dVAwjYBB6gSjHDvnUDOObk1DXR0DG7N7cLr+6KI8N
         kRjjJtABPI26PHWj35H0xEIwzGj9mdXTaPm5OR5rQLA2LTlGo7P0LgkSsP5mo4Xw6wrL
         fe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347053; x=1776951853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y32Ndil+CEYiAt6NbtKxMI4lGiTcdGiLMhKF4jZK8hQ=;
        b=SQAWWspFmzKq0/KPEVaE9IgcVpABk72qqeR1xcUAA/VsJqSIS+II5O83lxV/snCpGF
         uk2x9xULveglDE3VXZazfq4FeQJXDPlJcXlBAe9eijQd1cid6Z03RDzjrAABGCWjRkaR
         uyadkJzawbWxSwASDGMqsD7UULGsm6rCz6yx4pUS0udVY/OwSbVgK7Jvi/0dk2Y8pcxo
         Fl7/QAhVobv6B1lX3f/6ejg+BcntQfL8pdo/az+ZHcQYBL1vHPjAVHkgsMm1sJgLbglD
         0s6EXvw7CB2hfiYlH7Oog3nPMgc+m2Fqy+XtyHi5qQiA/zqywp57Qfsn/P9q8miocDQX
         eeww==
X-Forwarded-Encrypted: i=1; AFNElJ8gRAOmbTVWCyWIGkHge4M0KQc1cKWal8dNWOXRAs7OA/2TYU+1DRQfGtzRHN3ngS50uabmLcyxAPyW@vger.kernel.org
X-Gm-Message-State: AOJu0YyeRz51CTZ2JSNjiwJGUOt3e8143xAYA225cT5T78dja9/sAgSA
	kMSg4kxq+2ID3SCwtVmR67B+OtMGSK5T4PCpX+HHwKvfXAwv/nCB+mko
X-Gm-Gg: AeBDieuI0XvyN3mDoY6n16BWxihvn9eFhY99QG9rqHBdtpIqKjBB5MPNs/zVSKxlGHv
	Bu7OwG7YFdA3GjWn3t3qilNfdHWSZavf4HGaysS7PzfijuPep24P5YcCXsEg91K6pXjNey4QniF
	2T6TYH3SUsF//f8O51WHWKbw2kpRaNSuEu12vC9KCF7H3YYkY+Cx7VTgNeeWjJ0FHWwnjfWZl8w
	mh7kBIBeOPuA8AlbCe9WnfWClKezn6YdC89IQ4qMbC/8L9pnjhz12iEe4zzcpdL1twcoL7cvYNd
	hML/1NgTIn2fRHfHdahy436cyUnni/XCi5Xsgv2mI1Oy6nUN/Gk2jJxXNUWFoC3Wj6QZGs4FzCn
	N6JV+plL0f0TL3y2MotIz40ezomAFxWlGAnDSs8xBtT07FkC8r78bAe+Tc7/nUBuMOzc4I209Db
	VMYjhvN7D/XeD0uwp5fJoN9NVDhg==
X-Received: by 2002:a05:690c:6983:b0:7b3:a5ae:4213 with SMTP id 00721157ae682-7b3a5ae4e16mr158916767b3.50.1776347053547;
        Thu, 16 Apr 2026 06:44:13 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:49 +0300
Subject: [PATCH RFC 02/10] media: venus: add pmdomains to the struct based
 on the purpose of cores
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-2-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add vcodec0_pmdomains and vcodec1_pmdomains to indicate power domains
for Venus cores.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..e56ce740d1eb 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -80,6 +80,10 @@ struct venus_resources {
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
+	const char **vcodec0_pmdomains;
+	unsigned int vcodec0_pmdomains_num;
+	const char **vcodec1_pmdomains;
+	unsigned int vcodec1_pmdomains_num;
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
@@ -144,6 +148,8 @@ struct venus_format {
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
  * @cpucfg_path: an interconnect handle to cpu configuration path
+ * @vcodec0_pmdomans: a pointer to a list of pmdomains for vcodec0 cores
+ * @vcodec1_pmdomans: a pointer to a list of pmdomains for vcodec1 cores
  * @pmdomains:	a pointer to a list of pmdomains
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
@@ -198,6 +204,8 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct dev_pm_domain_list *vcodec0_pmdomains;
+	struct dev_pm_domain_list *vcodec1_pmdomains;
 	struct dev_pm_domain_list *pmdomains;
 	struct dev_pm_domain_list *opp_pmdomain;
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];

-- 
2.53.0

