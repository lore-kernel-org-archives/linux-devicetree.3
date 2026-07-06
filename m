Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA3137F8B2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350175; cv=none; b=KDX/g32mtafgF2Lju/CnEQySk0fCGhsziKYrMJO/qa5urrG6+ozzowtDcjzYHNTsLRJM+0w6XP2Y38VKYS8FkarSK66GjWgT3R7z8xMpIYDVuMtAnU/1jPKrwPWbd/nH2R4PEz9su9ge+Ie/QaLIiCnawZN24XuLxPLIBM8HhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350175; c=relaxed/simple;
	bh=ddXLZ+HAKriga+ZifOzvmEJGEglXjZ9S0Udn0vu+zgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/ZYeAMz3srtNArUmql1uwHMTC2vASWsoMDxwzEe7A325A7+KUYjQXMly903EX6PnipbhuX7fj7CYclOKuDmp3bUmwna3yVBHen4uAK6XwKWVOx5q8jr13zZXWECi0Q7fcAUSylcLkAoyhMDiVm38rqDUPgN84PNx2l1xRI75lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5IfcsvN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5IfcsvN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c59f740cso21967295e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350172; x=1783954972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eER6i8TYh3jl5VZ7OJH5TeeR2E0/0LIEAZOr3oq+xIc=;
        b=w5IfcsvNwg8EyotaJ/fXkXdxJUINvZzavp5qZ9LKR3T4tcZp4O2ifrePS4UvkQMYSN
         Zub43qy0vIQUAscmFyV6+qsiVV4hZNanKg/mMrok2UeJEVfBjAHlb61SGF+Gqez5dwmx
         rkVjHnh8YCfIu5ZXW6wYDQRtraEL2LsLOyltR/UytZllnyb1ORpJYoQuSx1b/cA2d6Zu
         blpCq86CG141YwDfUrvhYl9oKqQqYsxnJoR9/7WFBbn5yMqjuE7jM4iGqJvsxcrpF+a8
         yBMLJTI2LYNiMCqA2UNgyiCPRbBP8L/i/ESRfZXVEuOnGenBkvhvKDnLT5AAxQnRioHw
         9bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350172; x=1783954972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eER6i8TYh3jl5VZ7OJH5TeeR2E0/0LIEAZOr3oq+xIc=;
        b=LhPt/3VMg6FoaTogUREJ7Kd5A7rPy2sK5aAvgSuKSu36tNvHDym6912SpUwRhBUyaK
         W2zxPt0oP1ba98ukzWJzc9QN5tZF0oj6bDziPG+PAIc6GySYEfQvEXnkCVKDALj0lDm3
         Oa/hI8COJzEVK+/2wCPLNw8L87aCDnAQps4fTRPqnjzXTbPSJTCsidtZRMBaFko1RKVQ
         tGuXnJLeAzwRVeTpKncsuPSRLLzh39K5yLfxdeD/bRxSzLVSNSwkZTB1Lb26l3nF/5Kj
         SHhb4Lf/Y2PYg3k3Jcc/8FVhISF/PyQ4M7XhNPH4Ne7hWjPYWKfRI/WJs+PXIJ6Sqg3+
         DW9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rru5HqsN6lAJQ8UmdScJqcJ8xuzS0QL41U88aTLyA67upzDmPFcJ1D4A/n2JA3iyCZD3BlqkvhDiyGm@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQcZ+J2AwnKn/tC+6q56fenZuQg92FR5UsN81l/z7AY98g8Sm
	n0XVm/sE2mCKaORojVX6anV/3JQl52IkJOfEOi+/Q0BSuV0ktLxrWqiIjaBlOFGSajc=
X-Gm-Gg: AfdE7cmoCu+RJLG33N1WxsPNMH5W+ZqUTp7rMTqNzBB3EqmKpEfM0k7mNyHZ/w6SkOD
	+1k8IX9B3sTaBBDVnZ1jbJWDCTBRHNuiaRegDL033UF/gRTTFfpxOXHETcO7vGOtZYGAU3UbX1a
	e1y1wH/wltvbDBNlNqk2QMcIgHNcKWsGA/F/vVfghYZsv/zvJ1xyh2b50iBGvHrfJ3KPKoB3f/g
	aVjYS37aWazaaCitunJzCRig/5tu9wml+Qzrn5uYBqVv/9ApeljzfdZPR3dq1YVmNy4EJvhfNuj
	1zQzaIrwTtdg4sCdM4GrYFd8dYG0ctnrFSTyTq0UZwYHPCFiaMC/HdVEoAZvB2QPN2TxLmSaskW
	itoU0oScV0KENvm7D9CNgMACgOF3N6pvWi1DtbSAhpbutjp62C+orS3n5kGH/VLMD2gRh7wRlXy
	7gc2bSh9Q27IZPTC5lEwEulbKhXw==
X-Received: by 2002:a05:600c:c3dc:20b0:493:be36:94b3 with SMTP id 5b1f17b1804b1-493df08b968mr8675745e9.13.1783350172207;
        Mon, 06 Jul 2026 08:02:52 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:51 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:08 +0200
Subject: [PATCH v2 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-1-745565101869@linaro.org>
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

According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 9c7c6b23ce32..e91406e6f527 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1589,9 +1589,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
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
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0

