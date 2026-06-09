Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500D133DED5
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014521; cv=none; b=OLR5Q/at7pJtNqefWI+yPEim3z1s+QEbasomIRuTLWIu0bmLEXfu/rEvY74CB1r/w1MzTaoX7M61r+ZQXx/u/gmBhmq0oXncLCKVJr0qLKEfdXAnJfKOplnjeIK7ZT+1C4LMHhzuhM9Y0xiBgbBsao/2WMndLVardlQ7thDCB4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014521; c=relaxed/simple;
	bh=mZo9IHY+dGSIyftD98TZHewljnUEbDQ2yVAJGk71Nyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6l0ekcEdz9hagc13qI8oRGJ8GDzNwEI9b1LIEUponv6cK5JdARENF+oimnrVdpVkKSwNRtSzxCSh7xKEG03g6bXb5++xAMx7MWkDbBero6KmeuyOK0sJ2+jfm+vpsyEGmHLKwIiVZCkH6sZaRmfVNqbb5avk23AP5iH1uMRcF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFYZyzRO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFYZyzRO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b12270b3so33656515e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014517; x=1781619317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/HePIOrQIFyMx3sPM3MSE/sDre9oA/XqoIphXPjo+I=;
        b=fFYZyzROElgGdyEEVmJ8/fpO218dSz5DOZjbujV7FkSPWgHGQzfAhx914xyTm/9L2V
         PBseuK9JyhTAN8thC4kA/bZcZ9D0UBZzZT+IzOMYjnCggqpnGAhQWZ1BYukXlj1SL/ky
         tvb7Z1KU2MX0LkJ9qaGJJILAqeLjrTKF9vev4BZuebPsGpAlybfl/a+aGWSWRezqX/dO
         5Jsy/reFfuBGM/0C/5LB+PskwEP7nVwSKfUr3/zFlf7wyGaDmATCf/APaFMWaID43l18
         zc8foXTUi+ot4e6TnMRLjSZpnh6HGhTySIle8fBGlBZq7PCdBCOYvF2BBfesBV7/SLhX
         SB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014517; x=1781619317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/HePIOrQIFyMx3sPM3MSE/sDre9oA/XqoIphXPjo+I=;
        b=cZH81UFmaj3Peds3NHxMznUJkjFB73+s/dELiK7x8nkLofdiTIslLLD3rOG/Lfnjvc
         VlA3FC7Qn1lA7BRjAeCWG5QGRtY7Pf8cThrkIDiUycWyuHmmSB9zZzp8LslmGP/SqBxc
         2+1Y41eyomDv2RW8BC+trCpwd2a8B09HLA52+4MHoGVhB2/5ioPzGn44kHLg/pHLm8Vg
         lXAgJhZCIkV28qt0of02l69IvZtKrqhyaw+eFJk6YxDk+pCyrRy5U0lvI60CpKFbUj3Y
         sMBArVYUtvjHpGCKyqoKTBW72m+3z7RIeouJ6tEFx2ScHfVqDtJAHE4q/dZkpR17Xije
         0OGg==
X-Forwarded-Encrypted: i=1; AFNElJ/O4/8i7akxPT/LbJuqrrj4Ok2ghiCt3G3pG17yA9qY7q/WliNq8FaFkJyqqk8Lp/4Nna8iJ9TxGpXH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Maf3Grk9YFci5yW23vAKggEjqhaWXSKzhPKSQ1jQpjYhR1Cx
	IeGjGh5a1mkFXSOz2QMOTTgIR6T//020zCPydYEP/C7rypfBL/oFk47Zjc4uYXjGdTo=
X-Gm-Gg: Acq92OFNJuJHBC/rJHocVAH/vYwzlz3aM67XtwIFaipeTqD7tXp/8m/0Rw0UQ1txtQO
	OHPQZ4brO14QtyO8OwjAojHjm2ibl6PUIGZm3N75SzhqaSqLCuPCc+3J1DDsUY/k664aX2t3oiW
	lcaXwoIchmUgE6YYMl9qEU82xdNijZLv2AUjfaK1FGq67VzYBuX9xcwJC/0GDJQMMYgbZZuekom
	6/duKOXnNq6FLLECO6AnfV/W7wdUY/MOuOI2PnE7EPOQLAUmZrGsMawJhqMOjbLCci+zH1Snr8I
	ws95ujMuyvQHdMYmdgvtwU7/EfrJ36H4Oh78EBju5v5pQEJuBzih6PSQvlP+BG3MBO84eIsM/ZC
	bqVd/4ZUSauTwPCFNwELdxC4jJwJnD/JDXHcRv49PtZItRw+W+b0hHaaMu3zTyVqJZ/Qhw178tR
	DPYpWbyd2TfWplUPx+0IhZ9yFzJonQ9kI0nzZvgsRsJSFIAKk=
X-Received: by 2002:a05:600c:c4a7:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-490c262183cmr318337035e9.29.1781014516562;
        Tue, 09 Jun 2026 07:15:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:15 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:37 +0200
Subject: [PATCH 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
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

According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
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

