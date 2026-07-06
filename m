Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F23815D2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350181; cv=none; b=IVsaYlk/wHtHlU2KMpP3z6wIqmv91F922S3a4GnAkC4hKEDuIPYNtObfth2NcCv6trfe4104yecEu841wGf6npp+4h7fkJd8amwdy/IAmrDrZ9OxBzePCLJrd3Yq3wG6npKWdwEBDSWD0IdhbK9qvqeM8XovDfsKQ2Ey5FEIXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350181; c=relaxed/simple;
	bh=5azZ+o2bh9EVMF7MNU9aAP6q9dQc7Ln2kbE9ynYU0qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j54xgSbeDRFiSlw1rgGd5niz2/j0kEJrRHtVKQe2nQqZxDUeHzFituDnHA3XsZhW3+s8atta8d+lVQwX0HJJ+5exht8iljt3FVcQETGgXOVVFPCPNhf/bhQhuAMw62qrsRMlyCNVdPlLv0Z/68w4Ap/fPnID+ZoQWN26mOCjyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBxfxDTP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBxfxDTP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c733f15aso31906045e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350178; x=1783954978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcv8ineC8XwKKlGwro/pXww2q1g4p+cuWTkpuzvIux0=;
        b=uBxfxDTP3ZJ7fWVf/0cXWr3dIj62h44bXGL2iPURDWmlJBlaTqOs2HxzNylnLwlLEc
         GgLyMoUrq1k4GeKe8W4d43nLuYDxE9JIW0oijtmOIcO2BZb71TU5nMp2aIS9qieVq8lF
         EmWHwxPmhGrc2WtIOiEIouHx/uj5KsSMFlrGs8HCKR54YDPo3qFuo6zLNmT/qIdqcv7e
         LrgY8kp7AvJYc5OB+j6p8f5iXIihtpQ8bUDeBRovznil7efjm90Oehq2A2LsCNDoOVu9
         AtFRONa/nLnbbzk0ijk30RgdRtdsOP3TJjzbaxnvNjEUqcYbuT/NfMglia3Ui49jJiDX
         uQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350178; x=1783954978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcv8ineC8XwKKlGwro/pXww2q1g4p+cuWTkpuzvIux0=;
        b=UACMOOt1GN+9Pop/A6eDsbh7/ZfMTmVBUNnUDz5sAJbj3XLy67y2LMWzRWFxJUnVqm
         Eae+P0nhtifWHh6vdSJhcfL8xMrk7eeTimiOdExagmaCHYPjA657sk1/9gTgPCq0MAzG
         ukxZi0NlJgtblKSrYOQRRDdTlgQ7CFxCUqZYk7z7g+1oQPOz1VSmohzaOTaE4aOnP8dh
         kIV1lmgXJtUmMdPY+90JA+O2aTpgqACbLiPIHlHyF5sIQsDW/dRvfWim6gfVkttXRzQB
         4cglk1yvOmOZC3vzKzF8LQ3J8BEqihKtO8ayTQSFCV1nRGeSRZWCazUAOkz5WyXfhjul
         wdMw==
X-Forwarded-Encrypted: i=1; AHgh+RrqSYFOI8F6bUaNukyy7OrJ6sBVNjjkvLvPdEbT+KoupEuD9TJW5mcHBAam6pz8E8jNT1Ar7l/rOLaR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0iwztlQQOA8X8pKbrGbUmFblm5CGcdbiEZ9U/wOjU26IcXb5
	ZyxwWzLLzSbcxIrwRyuSI/j+S7neCOJSBXPLL0pAelJMPYtG8qOkYSJVZeCUm5tudc4=
X-Gm-Gg: AfdE7cldFGnpONq+UOMnhSV4jtj0+quhwVfjROFj6wXdg1DibgpV6IhTlXjhh4o3Uwq
	jgzA96+2XHjhP7Q5DCbFxuednJGs9Dl+qHijtzcHfTUN78r+/q32s28md62XMxCdCfCwiaY6uja
	7Iw86C408ANObN5xZkPlzsmIP5VN/HE8+/zTWLLe1hxSBKjeD5rwZRcMOrg9VNzgUMkbQrAe+ci
	EuXO32GIzpydbeB99VqNkBabwMQgzemSPAHnskfEQ0xto7w/pj6MAbSSAeIO9HHIwm6Sxsvv6gC
	sGRB6G6QYqQ8Yw6weUV6CNKgI29djV5S9yPev85kGvvv694oOpmtIwrqGO0Hgg6SyoyH7m1GQ8f
	/k2Qy54aQ/o6gXS5eis1Makf0Xs/KYPykE5c8iwtNPjAnSETTYemfAGXPBPY5X2Oi16EVOYNLUW
	MC6O8wfGTOCC/XZAZlH+86OVGKsQ==
X-Received: by 2002:a05:600c:3b03:b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-493df0a0271mr10545975e9.35.1783350176643;
        Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:12 +0200
Subject: [PATCH v2 05/12] clk: qcom: gcc-mdm9607: Increase delay for USB
 PHY reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-5-745565101869@linaro.org>
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

To conform to the specifications of the USB PHY, the reset signal should be
asserted for at least 10us. Guarantee that by increasing the delay for the
USB2_HS_PHY_ONLY_BCR reset control similar to commit dcc6c9fb7128 ("clk:
qcom: gcc-msm8909: Increase delay for USB PHY reset").

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index feb91e1fca1f..092076a5a0c9 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1568,7 +1568,7 @@ static const struct qcom_reset_map gcc_mdm9607_resets[] = {
 	[USB_HS_HSIC_BCR] = { 0x3d05c },
 	[GCC_MSS_RESTART] = { 0x3e000 },
 	[USB_HS_BCR] = { 0x41000 },
-	[USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[USB2_HS_PHY_ONLY_BCR] = { .reg = 0x41034, .udelay = 15 },
 	[QUSB2_PHY_BCR] = { 0x4103c },
 };
 

-- 
2.54.0

