Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B3A370AD0
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350177; cv=none; b=KYN3z7+lVirLE3gfE7V0UFOIexly9gybnjqz3auI5cZ+4M9PB/+mjJVUrHWmXY20qFb77QvUpcSvQtMX4jlvg/1LOQlwayRYZ/9a9PO56eqyZs9dXStxNjNnGt5v1f40O3kGo3VIdoXePw8cSr+EZVO/5PYeLkOiYaySpj8ZLpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350177; c=relaxed/simple;
	bh=KiBkxRgwe5uqVd9oP/NxWN1PgYVqhA9/vY7MLiBeofQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=el+qVhSNiKun1UHQ5SPOc0au6Az14unC3UEwA0Op2K4w4CKJAXqPHn0rFEiM8TQSd2BqF9eaEIRVP638RBq1SsAwnUcK//5u2VrCKkDc9Wx6Al9FKmKhIu9Ta63k7ep7nvgeNV+HPIspcklaN1/s3c3Ji1e9QJphuvt6n0Sz9AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fPKVQ55I; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fPKVQ55I"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b27c7451so37550875e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350174; x=1783954974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34ufVHQVHmP2A96Pdlkv6BGppMJmajk0L1f8lEgp9Z0=;
        b=fPKVQ55IaLlvkEvOftMPI3a9GkxbSLZtH2HgV+o9Mhen8BzXjHXmAw2oP5KDAPJARJ
         2I0H+/Si5XfqAqGMFNueOB18TBL4Lok0Ykz4Ey8HBC1KijcWxyzcNhX+suLh1oRlP7zb
         cI0Lq8opZY1sKFlyuOcNNUtsXgiu5X80wINCWsI3WRPdJFXRWAXL71qkRXnYJhdAI+LO
         GqBVGyCvCpkcdPgCH8u5I+7MFs4PK6cxuJCEYRbrJY+bXPpG5aZggFeP7PcmksB/JkCV
         PhphJ+Polm3mUwQvBZWlfKf0hBu9UGTaFkJAo1K24bprYHi6rOaLW0r6hy3AMm+Unaei
         1Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350174; x=1783954974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34ufVHQVHmP2A96Pdlkv6BGppMJmajk0L1f8lEgp9Z0=;
        b=ONbuC9xKcpvx92+SQze3ro2j2fdTflLpO2FOKT1fwAMjlZdFLJLtfK37UqrOppusqV
         XJRF5EwUAQCt5mFG9kNm15fKbvCx24Zdcn+ekjefjJcrgHRexiDszft/0BCJk8l6Kkby
         YzyBHWymiGucEg6sZHBs8zDCmQ/UngOdHKesgo2mJRpzmV6Lyci0zTiOczcITElwFq5w
         K1DNDbUrZmxB9RvYaTrgqJM+Q9EBj/zPnr8eRKkoa8jc3ulZN7BOADP0O5EnxlaL+lW/
         cg2FGWsx3caSjmvOEPS7zOx+GcbFj+u3KUTBmXcOuM+qLP/zErEBopmLsIohXP61+Q0W
         wkWg==
X-Forwarded-Encrypted: i=1; AHgh+Rpmt3LLSMO5mGtyJvS1JFwBPn5ICDj2d65pgeXGVX1ZJw+OS2MrFrCRixeU4JF2uiuvHUpjqWhqvfUD@vger.kernel.org
X-Gm-Message-State: AOJu0YwcxDWnlRS5QIVosjv6cDS4jFRIYPJBnJYqHNOoMbwowitDFjOh
	ZGmQJPMKZl7XtG7z2aWGXHpGURhoyhjjmNybrB+hTxqBwQF2/kT6WhLsxKlbFUbJjzI=
X-Gm-Gg: AfdE7clMq9pu7uQHApQBdeh+ijo92d9UPAQILyQJRjDogs+LrQK5bF7MMk2EVEtMg7P
	eDXd254CNnn4NCPKnAITXEtO1pJWZZecyRFaXdv5nAO1636QIFDk47aNzewVH1PNFJRLzdFHbKX
	Y6ElCmRGOnK4QB72h87bITByCMWQMWk8wwYrrE+qx0Yg6y6eZ0XSgpTztmoM9OVn7CFXBAWSf+L
	lU3er9sOCd3aFJzbtWbjBZr0GH+TA4WgO+5KrNAs8YdTj50t1kTqzcpEHAx1tM9ZZFK9M8rF3Th
	9R3JHSA5EeFppmTORODK6zLQ+CQGtKv9fjz0nZi1IVuqBQmmVmT05fSEcP65aPGfdC041Uz1WHv
	vi6r3wUtoOkcnk3O4Br9ZEb98OzsRHcztcKsM9EFfp3kBPvFz9rsa3Mp8XqOdZ0IyqVftcALkAr
	9hfYtWbsonbG5hvLnD2lUXO8XPrQ==
X-Received: by 2002:a05:600c:4e56:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493deb5de6amr13426545e9.0.1783350174534;
        Mon, 06 Jul 2026 08:02:54 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:54 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:10 +0200
Subject: [PATCH v2 03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-3-745565101869@linaro.org>
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

From: Stephan Gerhold <stephan@gerhold.net>

MDM9607 is similar to MSM8909, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 07f1b78d737a..499e0fbbfab9 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -790,9 +790,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0

