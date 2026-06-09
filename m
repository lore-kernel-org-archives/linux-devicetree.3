Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D10349AE0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014525; cv=none; b=TqscAye8F1iw2TJ8ZXktEYEbUKQg5pcwYWSiDZTNQHvHXgcx2pX1VJRXs0oAj6oOlzmpPRL2ZxSxTEMJCxJIXpKpKHPdtuScvqYFw9J83H+Q+c9vx9/LqAgeWGMnrQVyKQKvIkpd10420P5Z3E4CL80zVVLbJvT4cUj10ExMaj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014525; c=relaxed/simple;
	bh=A5RQZXdK76lJt2J1ilsEmaYiiIZQId4ou9RP4QENTB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbkbU1efjCmP92E95w/WDC4k1Cm7v6U5IIdHgUoBfNsvRgAXGwRDNSzzPEFxEwnCnwtKrXDXBULfCVo93c/VvJUBX+HpwzZJ7fwfl8ouu3xLYE+5+Gk2aTaVqlXDk9IxX+1Ysx1LNQcVsOgVJ4fTys0yieYH0O0IrCJXBQhZQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wRoQKp4J; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wRoQKp4J"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b7866869so63057855e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014522; x=1781619322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYmYdF49mLEjNdBagNOljeKdmXeXyuwsViyjQ5L+0Dg=;
        b=wRoQKp4JTDBrFgCj1ZAkCfqp7i1ELScQZQ7yJi2uOC1XLCxzF+vnYodKFOTtvrgwUb
         IvczgrMyUcsr2PBjUbh1et0t1bZRRAZPsJezpvsOhKVxz/nz5Ng137vnD4ySAwNpiG4d
         Tyqf64gYfwUxe30vQs0PiGuGd/UXgLZdf0wb/GH7GZWcHXNOdBQ1O8Q4+w8oLiyq4cAY
         oUSc5ilgHrkgID0Nwcf/sF9Y21vwD0aTvVtQD7cVI2eQz3+QM8b7zFErmQHvIG4n+OpY
         D3/yD6ZdkJ49K3LuEXcZfv8AX1BD8Or3PkO8hKC9UWoWezXJ7A6xJp72LspW/z2nJ5dQ
         37/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014522; x=1781619322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rYmYdF49mLEjNdBagNOljeKdmXeXyuwsViyjQ5L+0Dg=;
        b=iBHYYxYodJiM0kuNQKjt6u5PtqteJee10K6Yf7Y863j6K9KA6M6J52sdsQD9jZSUfZ
         S2AdSRrW1v6CNUHI7c2Mr2YUUwsAxA6W8dH9GJtzhUnFVygpTwjjO68sReZ8aqwPSnUA
         e35b9jvJLxp3UE7GXXukv+JNA+vB5b/r4J6rU4kiUfSPOEmsYdUDW9pI2TgA5ax7cL4e
         LVyAFK5xWKvN9BG4SOiu40mLSVBaWAcTXZsdXlHEfSlq3oYCOtLutIJDoYI2DTxPRS48
         DjLnlxuFT9y9dLnF14hfQqfsBB6t628X54AT4vpU3nG5zGKr/VxTUs6RFaLUBWv5Qp1C
         40kg==
X-Forwarded-Encrypted: i=1; AFNElJ9iFJb2/xKmf3xPAc6Bs30VUt8k18BhbekdUIuwcfz7aq2ybjvpQWUyUeeTXmbdn28EKjPPWbW7mjk1@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0eAi1Pi4I2Rtpc6lmTLkWW3knp9o+oUM0Gcc+gwOgTAle3qg
	uEYiugNQVxLbSMibdnasuUGRX49vIG208BJiuptUs3EQNbW7GR7fRn09hRd6BFNrsgo=
X-Gm-Gg: Acq92OGj79cRLCduSODcOqV6fWg+EtQjkPNsOVemFp4iEKBGKi0PbZZGSs/jSXi0nqB
	V2b2W4IpqSXM9a33FzpNHY9AJdKxnkhb0j1DX8CKjAdkyXyyS61gF8rzDssUARA5WMoqvAS3QnV
	DStZnihc8k56RZFlnJs+wdIKr4GzYDnfqtZYh+Goh6zJ0ZgmX3HhVVNS7hg1O232m/vLuNs5w5z
	VBqSa6tyy4SkYXS53FIQlfBq98IoML8tVWVG1A4y8U8QsQxM/dPyFQ89U2TUjJkYP10PCvf7esH
	PBXXEy504WFGKeylgf2c6iZG7krPoKFvfuD29bfD0/UrDlukXglnprBUJImCRjU+7hCnMI1ngkh
	wn2M1kLAWMlVpcsgvi2UY3XsiVU7quAqAy9BTUu1/wUF4kdB8ci0UlaFcPktyLsyQZGsn5wut45
	m+NYraBQIU/84QIGCHd3mikFlueTsItF4cZp0mhlqOV+CBOwg=
X-Received: by 2002:a05:600c:3b11:b0:490:d9d0:51c8 with SMTP id 5b1f17b1804b1-490d9d05211mr27027635e9.18.1781014522040;
        Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:21 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:42 +0200
Subject: [PATCH 06/12] clk: qcom: gcc-mdm9607: Increase delay for USB PHY
 reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-6-5e9717faf842@linaro.org>
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

To conform to the specifications of the USB PHY, the reset signal should be
asserted for at least 10us. Guarantee that by increasing the delay for the
USB2_HS_PHY_ONLY_BCR reset control similar to commit dcc6c9fb7128 ("clk:
qcom: gcc-msm8909: Increase delay for USB PHY reset").

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 8fc3ff2559f0..7c1890934fe8 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1571,7 +1571,7 @@ static const struct qcom_reset_map gcc_mdm9607_resets[] = {
 	[USB_HS_HSIC_BCR] = { 0x3d05c },
 	[GCC_MSS_RESTART] = { 0x3e000 },
 	[USB_HS_BCR] = { 0x41000 },
-	[USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[USB2_HS_PHY_ONLY_BCR] = { .reg = 0x41034, .udelay = 15 },
 	[QUSB2_PHY_BCR] = { 0x4103c },
 };
 

-- 
2.54.0

