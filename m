Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52F3E8C62
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312757; cv=none; b=RoeKfo32ar4fZYlix8LY/eEEKz/HbVs/P2OC2g7hl3PjY7dP87cYVvzVn8Hr13tlIxa53ny9xGzq1sXeioXRvfZyz9CJaHLhTi5P5UytB9oItDz31ia+qptUWnNtAUj9/NBVC/TphNXZjzBrIi0JOu0Xu18eHR2UcQfu6StYpWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312757; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESz8iVYvU5R0pEaHm4SoX/IG0nLe9QLuN6UYd2SsFl69uMvoJPZY43kO3ZO1xQQBu83mPRMW+auTWTR8QrRcLmrsNjci+KZ0NehD2+3CEQcCvk+bX07hYo4TRv7rM7hWTW74hg5OsB6ICxfLoY3TcxVn4Fc7ImVlvSaeZik2P9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5ZVQvp6; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5ZVQvp6"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7982c3b7dfcso99517017b3.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312754; x=1777917554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=p5ZVQvp6TM0j/+XHmRcwDNTJPWaN261r7k6FsjHaTGeI285qLQCtHQJ9xgdScU6pbq
         RpNsQFtN7RSEGE+ccSPi54ek+KbCMYOH1YFuoZuHBs46NpR5Eo8xk0vC+LCdNhq4X+bo
         DTTarJZYrpketYNy2mA7zctymOEntvlvQhtitOu5ZHB8+8MGfQsFgVh54Vh4Er0AveP2
         f0u68oWeGx+DclCKgDfAj8M/8/xbGBaXYs1zXtUV7SMjrVMCHn0MAGUGNiJagr/IfImA
         JvhUohoOaU7lvLMwFTnJavaR18b3hdQhiod/hONYoGfomp2xXF9wglSoWCPdcROJgrX+
         iXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312754; x=1777917554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=MsQCUOMjI7jhaT2W3vD/h4KaJ+48Q3MYqPtYwiMBwJGEdcdWhO12B2NxC/P0AgP1w2
         t0V5ulJFh5hKqspHgApSqV4dQe52+GyxLth7sER+dwEeuTLrXFxE+QZR/4fdOuLMVf/v
         MAsGHPaELSOfkWuKJux/kSlRX3HqYj2SHkVmtwCmekPxrxhIyvidJGt7PVbXU4zxqc7Q
         TTzaI8l+pCl+9BOS01ewdwMMMLzaHrDWSr/SaHaX9A3MMRoEtI8wPLjsyZGuDaM8Ril3
         yRAeVSqPJE4v89EZ5SMPBg2xa1F0L9lBMYtnrE7HpJdYXtbxiqJVGtNOdEqXg874cCHV
         OZnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tdi1jRwfmvgLdDWrnwX8h13d6rZePgohQSm7+VvpDWOcZFS4Ah8H+6rGqrw/wDnv39L1sP+JDiKk9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3U2pJY7OISpenK7QBVtot9hsO4wELW50xqlZXZL3HXVHv5PZk
	s3rRvENwKC0nP22phD/+r11I5h99jecP5oEHj2eMNpX6oA8ZRKHAvGFZIpdeUx42mGE=
X-Gm-Gg: AeBDiet07rebuCgrM9khCEHlxF+au4al+DXK2Lh8/peSGce7VjmI1vuTG9absaMKP21
	l8UhAv961/oIxUc9YaTYibKgCVgroFc4AQs9hV9w2k6zX42WF956phkaPRYOYdcmTydgiYtB5F1
	DsoBlsJ1ThuNnQh+bmCrk7xfQOGeFxOlhDVL1u5lBX9crd+TjfvYiXlxNsvekAE3pl6nEswZCU/
	DybO8W4acacOnhCxvCNxnCKulEIE5GX65y6SHL3O/ajLgjCBUPaESZmEh9EV/h7zkw1Eo9dIdVf
	BR1gyM+rTCyhP9af7tUmEyCZTRCi/d4EVxu7IzyMLdUVu9XND86W7NyvJZyc+qYNLt+4wamusaV
	KPpRPSkoCBZH9NZZEWIaPx2x2Je6f6Zffc5j9Jfjl2eYfBEyfGfayNzvsAYcNII8FV/P0WUrDaK
	+ml7qzP5UvK4sLyEjIN3wgk5tn+E5lm22yolcO
X-Received: by 2002:a05:690c:f06:b0:7b8:338d:7d7a with SMTP id 00721157ae682-7bceda1f77dmr4172297b3.14.1777312753954;
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:29 +0300
Subject: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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

