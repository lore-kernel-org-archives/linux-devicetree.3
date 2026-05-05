Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2673C1967
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017586; cv=none; b=GRk5kz3gs4iFxs/iU1jwGnibGVbWf1Y/kPu4i3Flf7QITSVwoWGzHachZt9Iu/TiHSVi7hEryAUnCSqgWtEEZTAnY+2pMdM9vL+rcs+0x7Z3nauxF4by2wrNOM9IvV89TcpZb15c4nBSJ1IpFQt+BBkbAHa7Ai2NEHawTyThl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017586; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/nii5R2S4HNnbWWZ8/mmGZuhSIexUdqzsOaSOIYk9KVpXdXcWB/EkZmzN8l8qklLWzL50I9kp2yOSg37fovxGRWqx4+vqg4ulN4dE5IcpO0k9gpszabielZ8+JnwfYZ+i1JMK2EBWNBgKh2K2LOCZtLcPxjd/PaO1Q/IUQF9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Uvygq1; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Uvygq1"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bd9f61458eso18769137b3.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017584; x=1778622384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=S5Uvygq1FZKhtZ49BNJNEiSxKXhT+JmWafkSN+Qjnny7ap4+LfP08X7BUuF/ufaCgS
         /2fr1PLcIoGcv5sKHdvaTg97YjWhZNtIaKLVoiE9Tfuy3qQJZK4qTjpAnoZVMg6f5Tdk
         0gx3y6ED2bjh1ZUj8dDKfRVkEFr7b6dsx4wSGYHFiAwk1z3RJeyXeyFFICfyfReT18F9
         kCHnEC1v7Vy/8ba9UN2twYp54trvKh6nyYXpYGOMHe3d414JyCOYEp8OxtcDWSof/EoV
         3+TxVC4oTZq3gJFPSZUR1Wke9WfaNJCAl3I4eOu+UWFAQjTlXILZuerKTjDEpeiWvkTm
         PKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017584; x=1778622384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=nKvNe1PXtMW7TDj46JTl6V4u9vCm+x4s3+uSkVlO1dhvEABYIdREN0cuuVHp/9g/A2
         o6V5YTMwsG7UpWiQixfsHGAs2S/2SIXt+Ws245sWXPr6HvWacUNko+mnTMkqfBqpzVjM
         cnLbLWHte4xe1OKt8/mscyZqij8IqObLGwqzOXq/CvferRvVJuz5V+FN69gaDpXODQWf
         TbovX33bpj34TbiOhzyQr6bg4BwEZANw/LZuVcTuzNU8dNmYkIPY8MChZCVaCnjzxO6f
         NTTVjKpjWQEdNMVxIQQK92Z0789gJq7klgWcWmIs6MaZKlseja+xyE6Ru/KfQcXqAvZP
         zQZA==
X-Forwarded-Encrypted: i=1; AFNElJ+jHjUFVc+KUhiKBsh/tKwDCDhdvN6ibjXCZc7QRRyH9MI8j8smiVP5IetdXB1w1LIG/elK5yDS2gVb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hi4foyIgR5aVGY/oNsLiE0Dt8kSgRqCP9GVrsxvmoqxJN0IU
	Je1KGmbxFZm56Lj2yssqZIZd+eOn4nYO7OXoWTQCGz26Sm2WVrOvHxpo
X-Gm-Gg: AeBDietUzvuyEJ6K+Wb90RZbO1QoJjgDr1BsP1kxCpAXC3kirhkEi7jEUtulG9M2NP6
	e6vYJSHFVCLTXLyWiKc7omg+3Z51+saXSd9Nyv/f5K2ESW8AQvXQrPf9f1Z+z0a5KVJ3NjsrLPz
	12KsPKqjtcvu4RKf1fogJsM4P+n8kPwHjl5jD6+LI1M8Ne5O+St5g7zSbF8XeIycdcVgX5/WItJ
	sHDFivVCLwjSHLIbVXZorTyCZAe8l0hy5DI9WP8IbpmCoJINYjOnhP+k7IWfvEmokSeqaxuk7IR
	eX4t5A3Smg4Zw0yF+fvEEpOP3Q4eP1crqCPzJtSNXylhhvHbL3pjAwsUL85m9DmPmyblYKBJMCV
	LQWqLuPMJVok2Q6I0Lf7QfctsN+3NNi7LM6rr+xbsTLyzqVd2w92tVGl3UM+mcH6Ya7wdoFYKa4
	2tvM5Zr6A598PC+xbCfMmFtYy2z95zLiLY8tnPmy6fUhuE+vA=
X-Received: by 2002:a05:690c:c50e:b0:79a:b1e1:49cd with SMTP id 00721157ae682-7bdf5eb3683mr13883347b3.33.1778017583808;
        Tue, 05 May 2026 14:46:23 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:44 +0300
Subject: [PATCH v4 7/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-7-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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

