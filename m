Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B103793CB
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141901; cv=none; b=DgJhSkeQpnNDSqcyR883c1EJLXEZl8NML0YCkOkRGLGtHS4dLtjScUhYWmD9kPDngKy58ciXk2q3k8rEMOjLLxxcZvaOVxSJpOzAPOM1p286WT9yu4jAsV4bq298gCnTUuvVepx+ZP3e2fSh2hGBhsRg+8Gq4L+YfZOywiGWgJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141901; c=relaxed/simple;
	bh=yEAoBevnklvr751YiPv2ruAY/6bNGQFrrHJ3uHFmatA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTE9KpJuohPP3KMWLC8QE3bC4Lw4E8NOZucs1RsXtVz/zNBi1jm94USrTsxCIp6pGROtLm1gDamUrxuMJn+0USzrEB0d0hL22z4mPSr5AlmWDKD1kuGOiQdHddWNF8BbN+7VOzlh5KHiCFGvsjNNSZlwVQYzIOQ+jeimxLlJKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrg9nZ2o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrg9nZ2o"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so63866365e9.3
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141896; x=1777746696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=Xrg9nZ2oVuCLyJa/xI5QEQqJhXznqSmyn0SgsSZdYIp5rCOR2akrLBxAhpPx7/sQ2V
         H7LyvGk2LtS7137BxeIrPWfG6oiKNYJJLCgmCg6wpQNYplgY/XQKulu/tG/0y0ILK63f
         I5e7HhjQOIZygy33CYQDRjPRHMi2HI4G7Os5nPZISZsGnk8DM6k1jxJOkIavhXGPUpTE
         SInPDx24ZbnB8cgIQSz548JA+uAsk0DReys23W/4wquMfrz3pLIaX8xWePs0sZCHe+Tn
         XeBjyFZ6RYy6LkGvClVwcG3suIFJXumr5oiNWBNSQ65EWi8ye3GQQQfYaggZRazW1GLu
         +4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141896; x=1777746696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=a9flS90KmLw2D3h89A82Pkufn5ew70ZEXG8Us/vMP2EagKtqP1iPE4pJc4UyGFR8XZ
         gL/+JCrhdQeFjZBWgFjUtDcMJ+O0VktsKbE3A3qv4KJt+XOv8lytii5j788x1nzf9N9x
         flsALC2ePhy+RPh2+1d+UAjbO8g/+P1zWdVflLKdRZamwCG6pHylR7MN9S6LhRPV9rMG
         cBvtoyWvNg69ROqCF4N+Z+s+g4Dm3KVW5k9LjPivHjipJYhqb3Ki3h11CuCBW0hOifi4
         H/F+CAdcWzonJrAbhjY3pLHRWRrmun5q2tydcA9I/SuO0x6kHs1TR7k0tob5SHiJUmke
         /oHg==
X-Forwarded-Encrypted: i=1; AFNElJ9wdU4drObnvRdlkC28FxeT2SwEL5PSB7+k6bbJAy46DGp9cnC+7aureFLmMb/BUoIrUOlspJ4NafWD@vger.kernel.org
X-Gm-Message-State: AOJu0YxypZ0rU+T9kUs9QPhdxLCaugpS6In5dNxHcMfHZRe7Qwm+ajZs
	AjD0w1ta48uiHngt16DGgLS+MKes6gqmnxtNz5FqaMKe6i3sUCHcy+0B
X-Gm-Gg: AeBDiesJbETlidzQtSw/dvyiQC7bpVKBELKPUWC1tYs1/QzG+E7IjnhynWZOL5G1FYo
	U64WFGViJZd9gMSw9jMP7+dCkqIrpLCErByo1S9BP1weB+9caT0/StONcuVoL7BP/7lU+2EUya3
	JPiEF+7pp9zxmiFrK8r29uEc9s/FuejmBIbW/FIzixkpxqSZFDykBdbAOjO6FWm/snyNPs69gA/
	v4iBTpG2hAZfhJQSFsZHp9CeeFtrjGGo7KOyCSa59mcm0GItIeAPTnHZ0eLg74qA9OV4kVMBl8+
	l6BkstqOe3fugHNmykIYMm7wORY3yOLq1adf01Hf8jzc9WCzN+fIZ94BbiRfhk5Ws5yk7teXpYM
	/6xDmGyATtrBaeQ2irOyB8rmJ9ar/+LF6kEHAF+JA2gpo0zEwqeJi/8GdIf6p6iD6lovHjMU7NO
	UqtSxanFSpLUsP3WMzAbhzleRSzwDIfbZjAfONjI4D41X/SA==
X-Received: by 2002:a05:600c:a30a:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48a581c113cmr215288305e9.10.1777141896039;
        Sat, 25 Apr 2026 11:31:36 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:10 +0300
Subject: [PATCH RFC v2 09/11] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-9-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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

Some Qualcomm SoCs which come with HFI v1 like MSM8909 and MSM8939 also
have dedicated cores for Venus, like in HFI v3. Move methods from HFI v3
to HFI v1 so they can be reused.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 66 +++++++++++++++++++-------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..cc21a4762188 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -328,10 +328,56 @@ static int core_power_v1(struct venus_core *core, int on)
 	return ret;
 }
 
+static int vdec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static int vdec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec0_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec0_clks);
+
+	return ret;
+}
+
+static int venc_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static int venc_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec1_clks);
+
+	return ret;
+}
+
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v1,
+	.vdec_power = vdec_power_v1,
+	.venc_get = venc_get_v1,
+	.venc_power = venc_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -351,14 +397,6 @@ vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
 		writel(1, ctrl);
 }
 
-static int vdec_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec0_clks,
-			       core->res->vcodec0_clks);
-}
-
 static int vdec_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -376,14 +414,6 @@ static int vdec_power_v3(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec1_clks,
-			       core->res->vcodec1_clks);
-}
-
 static int venc_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -405,9 +435,9 @@ static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
-	.vdec_get = vdec_get_v3,
+	.vdec_get = vdec_get_v1,
 	.vdec_power = vdec_power_v3,
-	.venc_get = venc_get_v3,
+	.venc_get = venc_get_v1,
 	.venc_power = venc_power_v3,
 	.load_scale = load_scale_v1,
 };

-- 
2.54.0

