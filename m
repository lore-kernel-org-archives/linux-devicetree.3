Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA7346771
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014524; cv=none; b=f3sA28ymmoyi6kRnqGB+aPtg+NBFobdyHPy7kAiMruQsWm5OUfh0WECsDkWIAmzlmGSJy8/b8ro4pwDe+hzQzjcYz8NxjhU6UWYPWlhEx67+gsPgm+TZZBIs1KP5cre0dmDB0ERiRRGdu6m4updrirJo6B3wWRS/VukhdK71D50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014524; c=relaxed/simple;
	bh=ej9p/9bQNkiwdVcT+ypbUdG+Fj4hlOWg+YTcRiul/pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGsu5Mp5GGwZtrAwz0EvpC2a4AVtzhuFAk/LHQTsyey6N8mOfx1tbjWQ9Gsc6oUwxy1smOWR/mdromAGQweHYHY4rugPAVDa+VbGIci2wEoGhoZL5Ov8OK95X+5DtyR7VjT8m8d9zmglnxMEMJ6ojkZaxY5il+AKH4wBoW+Ah3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=haXfyvEo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="haXfyvEo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19581725e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014521; x=1781619321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pglUIua8WjARODUMozEmu5xUT4qkmtEixeHke4+/IOI=;
        b=haXfyvEoH8CVLREOabADEEvTn7Eg99oPzBveh0m4Ur4FboZFiMEp07QORYaWqpj7HW
         cRCAbeO9TZSgNco2N88XXFSaSPL0p8P+ADayx31LaBDkZsjXYZR9ZxJM/9wseFAtQcG8
         K4XUoj8XATwQGriCfqm9MoyEV9GzauBuT5vGb0b7aNeWoxZcSRp+BR5B5bCY+wc9Zatw
         szuucvWSMAOdFuXEGGPZ8cD4uRjv/sSrSoiDYv3KrdhR0JRd4nk3LlZroeDJSib5RvB2
         BUWICR89ep3t3v7Q3A1ApXyRfCVcRd4lzpqjZHeCNexy8YfpU4LLAEcT3ak8QGqykToA
         i59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014521; x=1781619321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pglUIua8WjARODUMozEmu5xUT4qkmtEixeHke4+/IOI=;
        b=LRI9dgzllC6CiSHqBpG0OX5ZwgToM3VkDUksmjAKwKe02D/EZNkCukUrCMbZn0n9sN
         qQWzPpKJ9G2L6R3Qfpf5gJcYhmJO62CJPOQ2xktXDQg2Xa+G2il65CDjXSZV13C5yXbV
         fwLxZXErH201mbA3tuHKNSleySZecIAHALbELIFEMusOKzy9FJlLzZb8STNSxwaNPcvY
         EKIZi0pQVB2NBJvLU8xuQdy9o8m0VznYQGiNW6IEo7W7Hh5fR1Yg18GRYquWvabLbGkX
         sYf9pwzQDiw1KEbnxuujXquMvc4ev6z+GzuM/vhSLVY0No3Lp0gtPPLseJI+b8n5jCU2
         Km7A==
X-Forwarded-Encrypted: i=1; AFNElJ82HtqrL3OhbQKGufPdJI5nwVlFLMLbUeBDsfMi6GglJp1TtQD5oyitdGGc1cFmryUZHRFAMFpcIDIu@vger.kernel.org
X-Gm-Message-State: AOJu0YwGHVQ2FN5mVf8/EwdrNeIvDM3lbopCUbLMYjStnbgt5VQq7AkI
	PJ0Pat1XWRf2mTcuA4/o3RgrrjTbxYvx4DfBkQEyRdeemsEMUkiR6bsD3lC7IH2H0Kk=
X-Gm-Gg: Acq92OEEcxO5IbHobDm1WuqyHnGs/GPE/vW7h4RpGjaxjXb0eWBCW3Dpw0IxCUH72r1
	m6U2/vNyM0FxSQABqq1Si41sXg35tyFs+a4az+8oyQtvqvzLpw3ShfHzfOmgQtQQbfj34XB3o3R
	2dvPvjB/pAr+SFuqemiUFbEDp69bpQ2drGtETX+j4N5Nr11bnzOXoUsBOraZoqUcoJy6b4FrhA6
	heT3IdGDSSMl5OSjfv7DOK1yMBDzDigeU/TGAdxR+8QUmcBr3tPpLPsBaYylDBcUAk6ich3d0x/
	+yVhf/Yg2UfTMhhiua4Wx5f4k0OIkKunJLVpcxyuVhqLE5et4+XZA6dE5ru/pMxJArlwKafg0ML
	VldBHZ/Y0gKGnUw6mLgTNaNHxDAIBodcC2+fxsYyu15AFlAFJI6FHSP9XukTIL4jbHSovLrO507
	f5MAs63P3LggoqKGYF2ivHwBdEt9Ir1ZvdKmR+RiWxAG4VC/M=
X-Received: by 2002:a05:600c:45d1:b0:490:b9c3:6c62 with SMTP id 5b1f17b1804b1-490c261007dmr322915635e9.28.1781014520941;
        Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:41 +0200
Subject: [PATCH 05/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
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

gcc_apss_axi_clk specifies a halt_reg of 0x4601c, but this is already used
by gcc_apss_ahb_clk. The correct value according to the downstream driver
is 0x46020.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index d0b08b112fed..8fc3ff2559f0 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1463,7 +1463,7 @@ static struct clk_branch gcc_apss_ahb_clk = {
 };
 
 static struct clk_branch gcc_apss_axi_clk = {
-	.halt_reg = 0x4601c,
+	.halt_reg = 0x46020,
 	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x45004,

-- 
2.54.0

