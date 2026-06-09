Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300935DA65
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014533; cv=none; b=HOIOoM9BsgV0X5vgPcnePZnHS/085wu4gpF75VSaag2Mf8tRCmfA06ylvv1vw2P7Lg89YjgTBqSZStGYo8HomJXMJ/fDTS7RBJEQUdxd6H+HXvNxGvsn/zoIAnPZEXD3pGYlaBwPFPHKpyfR+Y3xh5m+1VzQzyRb2gDpIOYlWWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014533; c=relaxed/simple;
	bh=yZxjV6+ULEzVXfFwKMM55TezT0YyFiY3vaA58wvIX6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFOYosdRN9Hq56CbiDmYtUHqmL042MHot+F50Zd1uGRZAM7lY1LLT9qtlSVj1tBJVwS18Fwg5qAweLvyAOdl1G1cSzk4ik5Xcoai8NS2sz+GigYcypx/k1EbCNOD5+lqUZO2FV5CgEDSKHqtyP+u9kLN3Q0uQ6JVZ0peVNdlrYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3e5TYgn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3e5TYgn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so49173615e9.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014530; x=1781619330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFl46Ub2cVSIiuR2JnRpX4S0zO7OykASOPd86oI9HrM=;
        b=W3e5TYgnDzWSb13WdRcRy/ukRz9YwTOI4o/cND2v97mOYMioXPryrud4xPd8sFYoqd
         5uT2aqTXtUtUNjvsY0Tm90Pq3OeY77UXPe/F5hQbSBKjfCLdr0sBvmbpz8dreHpjv93G
         GMgvkQbicTlY/mg36CZszqTg7/g4wjIorupVebFC3pr3yVDzdB1ZECSTQHC2/FUOzX7m
         PdnhhAW4quxsRn81YbsXvwD2aTRr/+FVZvtbWVAtvztdCpQ4fVvCPH91vkV2M3TMfHjt
         Zq5eEkn6kiR26ETINxGz6h0ylEoxfeLmKg11JMiYtK68lKoS0z52Fgju/z5BL4Smgeml
         APSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014530; x=1781619330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uFl46Ub2cVSIiuR2JnRpX4S0zO7OykASOPd86oI9HrM=;
        b=rmSCQhnY8NyaVBj6rHaiO/ZaR9GqzSrhxSqi0nU6srtXvQL4SIH9/ilFhHl16D3rPb
         glxdXEu7xegpR41VvJyM6E9xhbzGilsMiBQPMVKJgKyzFemX/73uKEsPAw0G5RI/mxBs
         7iAaG5IrBSSWhv40+IRLNdCukn9AEB4+daSyXQ7L9Wr8mWHMrb35KHpW85sztLlmJvhk
         M821ycE6u1teY+lYfVXWkPxyPDRBAB53kgn38PNkIoF2tNMZu6mHN/nDVtvEXWc2w7mB
         JMOjShH4JtUlSUYR2Ky4uQTgmr2YpyZan5Zlff/25yTO4rVJGqo+6dg4CuNtSJzWbiZP
         tnBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CpETywV12qLqd1Ru2Bq6Q1kxPzP+GVCSuOnzFXmPSZBaEMYL1cAccgLY7+2yp36oVKDH2vIRjykaE@vger.kernel.org
X-Gm-Message-State: AOJu0YwPm4svx+LccxijEoUiCXBBwH77ef6aO9g6kUQHnVmCT7iNV9+9
	s7h8bdT9ATBYA/gtYpPruLEAYui4YxShXLePv3DYln/78YdPTPfvH+CHO54iJZl/evk=
X-Gm-Gg: Acq92OFbinDbtuHkGpeFST+0Vd4jx6FJuaiPZrkk8GdYvrvSiwo2T6cR7fFb51ZR1yJ
	GNXxKzS0qOSmX2M/w+gFXuQWiIl3IRjZamJInNzH55USW206dE8qMEn+I31mFP1eLgieqst81ar
	Gdcz1ce7VNOqzh7kMvd+5+PJxhv56nFaP6B5G86S2psRek0zkwEc87vsiLZwWBoDA3ayotzUWmq
	XfDHFe6151hSNzDwzOqzI4yRQUOnhIZckJHFhrQoOOIzOas5FAj9m3M4ILlw2lnSPzUwvSm3Rpr
	xKiyCfUhv4oxfVvmaTX5RBg8aH5PXDdn8EDpQrIw+d7CWLmKJAqbeYQSx33VRxE8kPIdMjxxmGP
	cpaR2WcIJF5M6LHAenqy3u5HOT7lQfqkqt7X3isv1vSSGAM7Evr6m/UMIuRDo1KcQzfctkQ8yZc
	b2YebgKCuzX5KQzVSXwSYH6glm24jbRVKpz/+Cv91Qhd/h6tEvSugEu3yk1A==
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490c25af61dmr328323305e9.2.1781014530409;
        Tue, 09 Jun 2026 07:15:30 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:29 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:48 +0200
Subject: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
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

GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
since it's used by the CPU and also various other components such as UART.
We also vote for this bit in the actual GPLL0 definition, which will be set
as soon as any driver in the kernel requires using the GPLL0 clock.

All in all, this makes separately voting for GPLL0 during probe redundant,
especially because the "acpuclock" in the comment is a downstream construct
that does not exist in upstream.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 0bd4c12483cd..ce78ebc8ffec 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1565,16 +1565,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
 
 static int gcc_mdm9607_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
-	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9607_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_mdm9607_desc);
 }
 
 static struct platform_driver gcc_mdm9607_driver = {

-- 
2.54.0

