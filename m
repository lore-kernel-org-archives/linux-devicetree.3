Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360F237999D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350176; cv=none; b=b5RKVvcd/B3LBhdjq0h6m1gAP9InhWgJnE99Qjw4o5/+yzhb7kvzNaPmtf1y285eUMTx3XSg1syTVPLk5LtHoaa2Od5UU2xEiF7VttdOQqQmSVERc/SF5xoVrnvINyl4cHMk7yT22JGOgDIZqZhWIwxc/d14IF4WrhE8HjOX+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350176; c=relaxed/simple;
	bh=AtEZcNEb3ClBSLeLofH89FOOEW3yyy4sU/gIpI1RXy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBD6XuAT9R3IL+Yiiunl+6wjH/BGyCjq/O/QHZQCc0y6BR2G4VMnKDE3TbWP/YY8j7QMuWrAkpgmH0FHN4oTh9wAoqeIr5Z0wpNXh+LGI5hkFn9TulXYj950UesZIEfRr4JXvh+7PN1BHuhzbCu9J+nhT+Ng9ZAcyaRUMB500hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKnJy0lj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKnJy0lj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so24154415e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350173; x=1783954973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHOTidNjNLnwwKoun3jL+S03jKuXKaLpyrO3E7uk78g=;
        b=XKnJy0ljemOmuZXnjtfHgiKoF8mHh7e8RkevNqlAMCMRPBoc5wqgy1WeZlNENz3/WP
         CHbBqIXvm4Qo4JpdCfqlu5BR4HVZDACVrdRLwtJUWptBg8EEdo5ni1BHUcMyL5EV8uR3
         GJN8uKoFQwv74iHHzRlZlwQ1EFcpXW1VVHYCFXqoPKBol+NzUQ7s5aIT+mQwczUlJ0Hi
         gbR+u5papDw9WNy0qAFlKVm5Rlm4XTMK/ZLnY+bPGQW+Liq0J9A+qrzV6wrZ1DgVvPpM
         FdJGhnaYBQNxCiBF8y2Ajz6dK4AsK8KSIfTgmhzCnH8yG2DCoAvwtEzxrLemEAh0f7pV
         btoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350173; x=1783954973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHOTidNjNLnwwKoun3jL+S03jKuXKaLpyrO3E7uk78g=;
        b=DoEIJsdzZZsioHAgHUX76v7g8aeajWMA61mR1fXjqQDthP3WOli3kQ3IRdfBBEvAAk
         8WhgA7Qb66zpQuQUxczOoBmbvsvRB7mZ6T5q6JWVvAIwGE7d4FmKjzzbGsRfFLCKEM2J
         rnovyi0SKCHS42X3XdH2UNM9C79EdlCl/ZYhln3Ywzm/uAPmPvQeP/14LuRHxfmAbfoe
         WDqDniYbSFRmF9miF7Xi5lEIR3Hlpv8LtAMInF/2Onmgn9KpdrcrZ0S4QF0F4qHe6jGp
         PE8WYiS/ROlJhfOwCApr1PDcjl1Bf7JpfhH/4kttBAjKea/NsSXvtpSZLKIXyki5zQN9
         ouPA==
X-Forwarded-Encrypted: i=1; AHgh+RoWxrlhhGvaba7d4iB66/AxqbCA8Kcb0CvN3nJOuH89RVrkGSGwRFld5GrUshW/S0XCzgJqHUvAv7di@vger.kernel.org
X-Gm-Message-State: AOJu0YwQFRAJzkCEx/jCthsFJQ5ZJAsNvqe08+QC5hkImM/syaFB1x0f
	6J4hTl50x55M3ymO6Bss9chyfImMQZcsR8tMn7sa7Nbo5AewC3NBZxVNLWkKw5Y9eQM=
X-Gm-Gg: AfdE7ckIby7HmIFfYBYQ7XBjUqYnjSX2W40MtuEE9NJa16caZTY3OCoq5sJwjAky2Fv
	sM6byYxwxsfbyPROQL8lmJO6G5/pvYq/WiTL3QcUuRNxr8U2rmv8lRhHiS6VuVPmA1Od4AGGEKz
	FtUYwYHUM07fVU9VbSXUjjhrc40ZOs2rsCxs2CTAAu/PF5BhRo558v7ya1bVAwax8Pqfb2APOLc
	QQO2NFq98Bmgizqhj1v6oUvOPmpHDC7uER/Z/UO6Ldcjtdbodfazz/YktVK7U74DExSMutVTW0F
	jdy1c8N8jwMFw/koxrfnnxpbQOu71JSp0y5W1i79XLNKPP5wJP2TuydumWEAl/VbHJVw/+61wOE
	AdCYe6hjjjVi5bMe/Zhr9oWv4CKXcX8kZm3b1xr41sui02FWxv7eerPbzXVKjakrPNoCoSvtWEl
	WHQrN5HuZNI3Etg3ZKAWScMRmNNA==
X-Received: by 2002:a05:600c:4e93:b0:493:af0d:484c with SMTP id 5b1f17b1804b1-493df0797a2mr9939925e9.34.1783350173321;
        Mon, 06 Jul 2026 08:02:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:52 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:09 +0200
Subject: [PATCH v2 02/12] clk: qcom: gcc-msm8939: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-2-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

MSM8939 is similar to MSM8916, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..ffd7f14fcbaf 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1929,9 +1929,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x01004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x01004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.ops = &clk_branch2_ops,

-- 
2.54.0

