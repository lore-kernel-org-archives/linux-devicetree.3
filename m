Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB1340281
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014520; cv=none; b=KPOfjP/3wAPrv+qX+WuzgyhK6ZKyTUxzcTnyFVplV4r4/sHgnbarFf6cOIUlYtTVepSPwCc1mBz881ozD7Zq/EmS8Vyq0nzZOwwRzGvzKIi8r1wGr24i6GtjyTy6YUQPK8O7SCqgXwDDHCjzE5Qf948KvZnsa9dqoCRM4A3SurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014520; c=relaxed/simple;
	bh=Q08Pnp9hYn8y4XwSC7ar7m8YceBvgGMc5gaBTrBoxFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=urXc+hmxcoc2v24x/pdNbWUnomrB51855fWpw9g/iTdEOmG5aZSenrpmEZJgHDAxa5Fpcldh83kmXJ/XsGiqpB8v3cCvolwcKkfV0fX8bGmC/EGe3YCI4SixsPMCH5XBCTlSElzrKK2ApoYhYMXYe3Y2TMhGDBLWyS+ieG7c55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1Ubwm6V; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1Ubwm6V"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19581035e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014518; x=1781619318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plj6hFRlnFRW2ocke9lR1WLO0D2gksI3uU4IDph/GEw=;
        b=I1Ubwm6V6Rcz/e2huU9fymOGvqsqo7J2cnwYVexfjO9LAoBNmv0wnBQsknKgSno1mp
         r/66azxHahFLprshVg/9lu54a2T0217HYfoFeoCW8vi+FT9LmSv0ZUvc1mzklWDE4sTh
         2z5r+GE7Ic3x5pOlEdMViAaRml5Josb6IdOQnFOJsVNEevVyGzB/2tiDcbL+O226M5SC
         KRwtAT2CqNJRfMC5z8vCA7qGA/AfbyRAbg0ElFXcUmTogi+MaRu0p7a5u2GPf0i75BOR
         CcFZZhUWMq7KrvqRQnm7WPiplhU/f+4x06UiGQt7xAl56BFST2Rm/Z81zQXvX59I28g5
         SRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014518; x=1781619318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Plj6hFRlnFRW2ocke9lR1WLO0D2gksI3uU4IDph/GEw=;
        b=IgWBVdgum8F1lxHYXokzXqXgYW7M5+CqFkzSjHPfOY81YlmuUh8QjMEftS9M2z4nJY
         oVi+9ulMJvyB+VoStfoLLTSeWWqMB4hzvDOLfejzCMF1auyn+4LpG/TTtaYsSKpXShTF
         BPDHTNXFDtWnSDTrH2I5APYWjMDrvN47APAaHsqNbtGdEPWFALwI49+89tyPKH6A50Cv
         tC3vwnrfZBQcsJnQ1XoLnRTJ48gOr8myxT/SDf67A5HzI4zN4xQhpg8ORr+DeXruZTi5
         5rHDIir/MYASF2sqrjMWnFUOAyP20QOV5s/2DEbIn26O94nJReW8jcSooLf0C8Uau+gW
         BpMA==
X-Forwarded-Encrypted: i=1; AFNElJ8S8O+LCVnuTkN5iarSYicKDNUzWgfGp1oZydhkYjfWmURWg2KO4rehqVfc2M5MN2XjqmOMqKGdkB3s@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVLV2uH1Rjk+qkEDv0ewpADSb+HHny/7v1fIwbXO0aaOTJYpe
	i+JCNr1e0hMEyMV7/hOxIBVaoRfT0p7Zf3k6KlL0q/Xd6HkMabzCURJ4MQSk3M8AOrk=
X-Gm-Gg: Acq92OFMboQWAHRrS0+J4Qb/qQ5W39G1OssoNm3A4/2ENZx+QQA9AlTydD47onO2/uB
	7VqXpixjyrpe0MDEoj+PXHA4JNxKbOLJ04kHQUFJZwP5q3z2XBlZ23ovHVQTL9j+jl0Kj0T85+P
	auxMQXxjT0NLYXzLfRHEC2wFABZoH2fLoxlnZqUdxnRrlR8H0ck9EPFIDgAmnr7wqogP4JmekEu
	DkCnLsC5O8dkuc6aG7XvOaIk5N+K/SdKizf57iNH7lby5czf9H/k9FT1P4N4LKmyjdVbymR3FLO
	9wUNG/NmN4eyFxDdb5NzKWPBur+lN61C3jmWdAT3Vb2S28JAqyvQMaRv/QYCZM1ltcsW0+eeOKD
	wDyELanouHKstlpDHtz0HAf54dt+I2Y8phwtPCUhLCTEngsoMP440dOGQb735kfne4T1TBgEKv8
	sebu66e+5vkj2pXeC+TGiYciiRM4asRO8YV6w/HA4pcIMjxMY=
X-Received: by 2002:a05:600c:628e:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-490c2599ff8mr363665515e9.4.1781014517822;
        Tue, 09 Jun 2026 07:15:17 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:17 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:38 +0200
Subject: [PATCH 02/12] clk: qcom: gcc-msm8939: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-2-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

MSM8939 is similar to MSM8916, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
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

