Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE037AA75
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142850; cv=none; b=c59BBQewlz/P5wDUZPaYbbJSILfjA8Wpey2lF2p8MHJCqaTL4kKjem0z0nDMlxSClSrZCASpLIwmnNht/Y3Tkk69TBeQ72QTdrPnnjFQp8ZZzI5i5WeC2aO9mxnxxdp6ujDmVdITNdCcaN3AAxVW4NZDxzQlqmRbKhZoTb/F2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142850; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeEWAfe/Yb4ffe2elIzUYXcV9v/hmvtLBQKxXY1VCDGKUs16cG7meanrcAvQq/H30q7DZYg1J/2vcb4gKbMhgy/zTQrdbST5FCzW/2L13L/chR3d6HrR8edbBiujBYP1ubfIdvt/FLwPCwenP+YFuB02ef0cg6mE6fXezdhfc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNCYP8M6; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNCYP8M6"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bd65714dcaso5159937b3.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142846; x=1778747646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=RNCYP8M6/LjoYO8nMJ/oN6KxMjjWkWoUT+gNVU5FOP8hydfQEwAh6D48WzDMP7fKXK
         W5Z7Ofsu3YNmFjxoBWnp4A9YI/O7quLHTI8WReNBm15Ndh5Z0JOad+ZAjUbLUUcbITpM
         bKaXkB4MDGwEOinEeD3gG5TzwZeOIts7AuT5TBaeROFuLirWjifcciaP7OgQtr00fNqf
         XGO9OUN1qOU6S2efK3TAiVEIh1UmAzOpgcdptuMnwhSOTk8vwkj7gxhHEUliAUCoPaET
         +/W3kcU+ZVogvHnHjw4/NDL3SbvAedVRBQkjY3ULG2hduufZhni0AVgjzR7W2gDFvFyV
         VW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142846; x=1778747646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=KyUC9M/szFcgbKuT2zmkKtwgXsGSMapy9KIGdsUePVTWjV7HCRzjyrTgK9whHU8IZ1
         3fJhdtNFDKJ6beZtGjo8JUnsamS2EwgtUSWgb5Gm6aipzWGWZffxqvE9vnVpq3NQOCrl
         ZmLUXtyGnBsDSi+9MSu6G44j2MItlreXHZmAtdxhX4lunPv9w0K6LoytP7S/Liut82P9
         XODwwXN4r4Qz0qIU2zkzMUSVKLu0VVCVYK6spQkd/DQE6jzrRjoLEAyF6B5mRmn8AoSm
         XeKtd9kg5rvhRW/sF8qJY7p6w3pEGrfNWT6VITuLRcTVA1Nmf71mF7+zlxqk2trhwOxn
         BjAw==
X-Forwarded-Encrypted: i=1; AFNElJ/7JbAkZn9jUWY/6zGiEcxkadHoZhzes2JRvq1457vodiUkeu60fMDPnc3wA+RTYA612KJ470xqgTaJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwzDOY6qJVc0jaMEEOHhRJLYPelt7mLtX56gKSgoLu7seD+Cbd
	K3hCvPCcuYKC9ofaRFOFqQ2/2iQBh5dRYo5fOMLHHMsuQRjc9paH9SZY
X-Gm-Gg: AeBDietbVqTilAUUFB9DDYa8zZbADIob33cN7nSo7Zqwm5vCbscEn5cPVK0CZHJcvbc
	bgRPOylE6opqy1S0NojDssJ2/a7BWIsp7VUNoyZAFg4XxsjypVDva4tDBbHgYC1NDKRmKh+SFi5
	YI0gKkFRDnsrAZvW7Ck/HKGJHRXFo/i+CZX6fFY6i6MoC3O2SxwxaHPjg3QVN4/eh2FDOvp2Xi2
	cFRHtzRMwvulA2TVPFP+NbVkefMlzIN10oaZa9Jwph1dbXrG+FYCxLjoe0ucj20YWN8a6CGIThv
	ggDlbO6MOQUuMj+1HxfbgPD0XLEnbeB4kv9jsQzMArDBX9xKf8URbfQXd7h+f8cTKKDTJ6+GKik
	A3aCzP17tbQOC4jEEeEeepBgIA0YC3wuImOb+eAunoJOTDFjD+7XgiMWFcjcRsyEqprrZyB+hFf
	PVcHla0rnCJs6ZZVXupAuTfCha3OOuOKnY8wah
X-Received: by 2002:a05:690c:60c3:b0:7bd:8cb2:4fa6 with SMTP id 00721157ae682-7bdf5dac0d5mr72252127b3.20.1778142846035;
        Thu, 07 May 2026 01:34:06 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:04 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:20 +0300
Subject: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are hardware controlled, they can be switched off at
any moment. Vote for the Venus core clock to enable it later when GDSCs
get turned on.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..420997b00ae0 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

