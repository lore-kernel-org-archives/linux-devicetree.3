Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF733E377
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014522; cv=none; b=AfYMvSAVbVgU2tlpFzOENpD4S2w2KLLDFf7VJr+4AvU0Hhy8vLJt+ttkReXUgCER3CgJ9gKebdHsAUnqO8S/mXZQQIBZCMixtenjVFOmU7HNx7ZmyCYyTOTJfQQ/LmclhpIs8c411wLmXVDDPrkLMU/rXXtNvN2ytJbetfMee8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014522; c=relaxed/simple;
	bh=sV0VOlGASc3Xy2ajSqvXCZMafWxAmReEzI23gc91Xdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EyKIJU3Tj5vHCRT27p8DRHHW4YswU18zOA9VOXY8MAbIKA4iLTC2pmvfI0UBCQvup1JwXwRrzaGq5V/tSEb9mAn9u9d5kaOCFLNzDUPq6JWSCXVBNDbmoEJxAfPt7cFarsJUxGRfSi/VzIn3Bxg8lJs3/8xLvieB/43M3lDHf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgUYKcYi; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgUYKcYi"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2780953f8f.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014519; x=1781619319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruS6RTBjxVHuZPL4Ne2Tr/Gv3lV+oHaTmX1GUMR3Q3A=;
        b=HgUYKcYiDYSUs2oWOFKWpiWeEfZ9i9ZkJKhPQ/hqSJRmDeTGMX2EBW60GJq46lCBu5
         TWFaHlWpWhm+rlpyItAY7X2C1MyJjh2S8h1yuLlUVjDIi+uEuwR50tN+7Tp0WluaS2hV
         HC1LvjfhLK1dnMLzz8iS1vtUDRwYOwcg/ck33epBPOrm9E8IoVTQxCB2uKPRd1RAE/h+
         q6DvWa9SFnhqcwNv7cuaKm8lWYYorE6UvCjdO6bLff6Vey7kfhPpbn0bnUAicDDL4O+4
         B2l701Bt7xx5ixOenyswJ43n/BDQnCuZ7+xUUit9LCmnD/dq+xCfPXiasDCI/pdIw6m4
         aQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014519; x=1781619319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ruS6RTBjxVHuZPL4Ne2Tr/Gv3lV+oHaTmX1GUMR3Q3A=;
        b=i6T6veu+JBHGkH1kejdeP1FdRzJH+8Bravvd9jaul1McZ0LsCeo+hnQ3Wt5j5Nb88s
         BMjzwk/rjinC9TNj9YgOBsbruQabHB5IwyY0m0RaY1Y4kXCxs+SbCzWmogn/o+lI3lPQ
         gjAKCN64RjYicVxseng68ulWEdCECoiz6Ff8HMkMfYTyl1iMvV9Jjdb0vJ2F+gRrMfY/
         r3Z3ph7gRUZdybLCfvhtth/uvO9996LJxGgC/vH0aQLRwCkMi4xFCfc+rk1IWEN+kcYN
         9f/pnQJzibHQyJS2QVJWzCrU0qFsNFEdYSbB6bu+8LM8EnFBeBjYnDnlG98nXkrF0PXQ
         ocnw==
X-Forwarded-Encrypted: i=1; AFNElJ/GjV/N2XBQVnkg+Il0nRC64L6h+xRinGSDBiqHWfTYOEN80eH7KDrNE2QFmFpQnREyap8QlTCUwWWw@vger.kernel.org
X-Gm-Message-State: AOJu0YzehrotpVx8RtH7jIqRwPjjT3R/NXHlXMOVEn+yFp9dh3AEIYqx
	SN1Ri3CQrB5/MPRk1zLb/v+K2sc9eWSDbvNnew/xHVtlHKfz533X+V9OKk80ZFfW720=
X-Gm-Gg: Acq92OF2BFU3m18aCaiJk1tb8oVLNUaEZ/IEEp3V9nRH5Vkj2EEJlGGcZXwBssCp3e6
	Xjxt/Sg6SHRIOVXTS3HePqZZsKsn/xhgm46i7higj+dyqlVQSEPNhGhKUIgecoKLTffLzIq9lwV
	AEKzLG2sxVjCBjR1B0vX70sy9KOc19+lGNbAXEq92yFXMNikI8sy/i0w/hWwK8RSVj11G7zTm/5
	nC6rPOkia73hfn787uX3eZstAMCNk4WyR5sjm6J8eKLbz1odrfaqBi0jWQJmFF9m2dc1lXhe/7X
	KQGEdnJlGScn0OG6bgjjuX+kbO8puDUB2ZJXWqr14mG03F5FiSM/sKzPR1lv4nU3VGf1acqKd4q
	N0Mnjd8t9ank5T4QZoIZFceuox5mRefXvXM3OA/VZoBSerImcBBBkeTaKAVR7ENRKQU+sSBGuPS
	1gbj6lUzC47UptnlGagGystJleJ8tGDGvKh91LAaxa/LLzxdU=
X-Received: by 2002:a05:600c:83c6:b0:490:6e12:542d with SMTP id 5b1f17b1804b1-490c25fc0e1mr353524815e9.19.1781014518840;
        Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:39 +0200
Subject: [PATCH 03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-3-5e9717faf842@linaro.org>
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

From: Stephan Gerhold <stephan@gerhold.net>

MDM9607 is similar to MSM8909, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
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

