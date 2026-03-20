Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2447C36C9D2
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041322; cv=none; b=aMIly3bvlAqLcoqTnvBV/lwP+gYpUD+fsa/jGN/x0+Lx+3IdfSgTcaxO8cCOUXwUTP1RQuPbJqiPgSOAjwNGpVxRWfwAzbr04bdfHMtY+RoRxjLwe/sNR6pe2IQ+vcKj2V1pEs5pb5pWFU5NlcCLXS43Ump0Lc9hlQyymfwqHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041322; c=relaxed/simple;
	bh=dEU+HYL4TUwumpvS92ZlG5R5HRevhTdXiDojFGzKHrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrCgn5ff1uLGXjTQzHa2OaOIMQ40u0nHM7cVQJcGw4Oi35O0YnqibWNgyLTc3G6jTHszi5U+BxHRSL1XzDnm/h9OoBoX0N93A9bI//n4PwmSoALhQDWqqeibDrHcI1mGFm4WUwCeLsHVS4oeRO5TIZeDAY2hvl+/v6OGxIknWAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7qABObA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7qABObA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso2227548f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041319; x=1774646119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=;
        b=D7qABObAoGDRhhLk+D5vmA8P419PGsiK5yGrtkwcD3JVxZ7wczNEWqVEM2A3F9IJ42
         uoHm1iYVudSVZFdptiCOJrEihcXsLiPSZ4BitsyMg+lSBTdIefTawE3rqi6i/gOvXXJZ
         PPvg3d+yknSAUiCQwmZW7MeQP9tkYf16+3x49olTk3SrPkkW5IsiVBHPh0TwOAztL6kQ
         MxoRL1+F66Soqhjukow5qjzsiLXKsWtxrL7hSDfGQiivWCnmqoFExJ8MmalhLaE17of2
         iX5QkSIWlLiA+pC8eAOpZQKEfEDK8IC6WEB3LIGYDfzQlgQtSu5DYQi9BpbE8I9iBo6O
         dQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041319; x=1774646119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=;
        b=h5PWFDnHNU5X7wejcf2U5uOS89ftHWbv23va9uMZqm8ecY1Xw/SxMK/YUIYU8B39Qw
         gQteNAjgDaTwnAuE8dTZXZxybgPZhKzB0+wBS5BskgBYPWPH8A9VGs2lB2gXOIUdlUOv
         1JinFtHbeb0Mv66WI/sHD0jDy4jGMvzUs170GPa8w/720zb3Yd8iUZ3xgt1H2Xv5DKmZ
         5r0aG6UJEoE3Qg49kTqC+7ebmYzMdC18jxkDcqx6XwV9Zgs9DWFTgjOr7cI+p7KDCZoq
         w20HwJtXP+nhByUKSRpQJq+9VS3khqqKaEczqjD85pZchjJHEVOHlAOO2auNlwDHqw8O
         kdaw==
X-Forwarded-Encrypted: i=1; AJvYcCVV/nH/QYFDlVe7X6zqzI9+goLKA6Hn/vCEpHNdKnnO4/ffamX0lwNNHSGdO3MyTr045LXk1CbQaLPB@vger.kernel.org
X-Gm-Message-State: AOJu0YylReO9JOjfSZOUDzGnNn5HmkhxJoArpmWAR+cWHD6ArdFn082R
	eBRuNGocZEXecwjl7xNdGO7A2cMWFJiOLTpQ3PSO4RNxLzwYonfC1wwl/CsB1nfbmck=
X-Gm-Gg: ATEYQzy94duTW7QYbxGL8T83eIrDqwj2qWXj7LbY+hcLWufG6hYOj2+GvMPDG2m3MOM
	iE88364NjFuIzYgqYExWdB7PE6mITB5TM8c/Cat8NsvZpTtYY/L00d1BT/7lN+OEtm73dgJlRJp
	qzBkGugTHrk33XGf+ATQ5Gsq8mxnuY8MZbK5cdyCLY4PWubX/ebuxN3pyHwOfWYAaKBpF8dVa+3
	4UqvWrrwpc3o2FkwK7/1ecetumpdNNP0Hf+2NWLt44vw8wolaL3eBvM8TLW28CVu2vI8j2RpXRT
	muMQmH2a4rUlWCjyNBhTGsTmQ1Eq/btCdJSznw5m/062sXTubcRYnCSWkPIFHFDcRIVXo8b8w0P
	9Ib/LJ84W7I8HQgOtNLupaQSf4zFp5Op5BstKUmsgfo8cDVWWOLdwwJedfA8+CvEVpta9TW9zwa
	8iCtLl4teZF6gC6VvuOpoyMPNvqOJ5ezG1KoyaIixbqv/d+nEW/i9cfQUSk+9TqcToHxN4NgSZA
	oI1R13Mg1wAA0M=
X-Received: by 2002:a05:6000:2011:b0:43b:4909:203c with SMTP id ffacd0b85a97d-43b6427d8c5mr8221726f8f.21.1774041319466;
        Fri, 20 Mar 2026 14:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:14 +0000
Subject: [PATCH 2/5] clk: samsung: exynos850: Add APM-to-AP mailbox clock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-2-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add APM mailbox clock for communicating between APM and main application
CPUs in CMU_APM unit. This clock is needed to access this mailbox
registers. This mailbox is used for ACPM communication between kernel
and APM co-processor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 56f27697c76b..eb9c80b60225 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -19,7 +19,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(CLK_DOUT_CPUCL1_SWITCH + 1)
-#define CLKS_NR_APM			(CLK_GOUT_SYSREG_APM_PCLK + 1)
+#define CLKS_NR_APM			(CLK_GOUT_MAILBOX_APM_AP_PCLK + 1)
 #define CLKS_NR_AUD			(CLK_GOUT_AUD_CMU_AUD_PCLK + 1)
 #define CLKS_NR_CMGP			(CLK_GOUT_SYSREG_CMGP_PCLK + 1)
 #define CLKS_NR_CPUCL0			(CLK_CLUSTER0_SCLK + 1)
@@ -604,6 +604,7 @@ CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
 #define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK		0x2028
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK	0x2034
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK	0x2038
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK	0x2060
 #define CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK		0x20bc
 #define CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK		0x20c0
 
@@ -628,6 +629,7 @@ static const unsigned long apm_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK,
 	CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK,
 	CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK,
+	CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK,
 };
 
 /* List of parent clocks for Muxes in CMU_APM */
@@ -698,6 +700,9 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_SYSREG_APM_PCLK, "gout_sysreg_apm_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_MAILBOX_APM_AP_PCLK, "gout_mailbox_apm_ap_pclk",
+	     "dout_apm_func",
+	     CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info apm_cmu_info __initconst = {

-- 
2.51.0

