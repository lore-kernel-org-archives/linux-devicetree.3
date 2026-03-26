Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A237BE8A
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488498; cv=none; b=oDWJG/JX1rmqv6na9qjVg2dgiHUKp8dvo+JPKPquFm4iYk2T2+v7ms1jZJVAslekReYM71Xcn74T/EZFsJiLDXrevLJErkjzxhMk9zaNvFWF7LXMSqpU0SdlxMBsu/AuQ2JypSHLF4ByxEeZIsMTQV+NK+6wGPlw+C7L2wKa+GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488498; c=relaxed/simple;
	bh=N6f8XbQrqLkocc2xm2zf/znOnvl2dvw/ToKTgJkKLbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ian4xmchtC6sCioGLH0lyjIoYA5hP3ICURAzx5GlqzJyNdrBFSQdbacPCi1xzeu0Ub6M5lfod6AzU5cKKsibjyUeHREQ3Gpulz/msB4SI0/LoY7/GKTE7Swf52Fe5LKlrb93FfAvUBvatOsSu2EGLibq/pnbbcqb+gEvJQ4iJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E1W6UC6x; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1W6UC6x"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b4915161fso339033f8f.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488493; x=1775093293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgXkjUFi8RNX9zADMCF4Q/I66OJ8AZWY+meNn13gnkc=;
        b=E1W6UC6xKnL6b3zxASMNW9DWMIB+SBTPk3A2L9HKxHiGZM9wuM6XdHpZhhmnzVDL33
         ZvvdEdd3A3UxMiYLpNjPSsVZAYW/QcGo0FaCSbngx3urLzYDXdAyPYGGdSBfNUJq5gEj
         vTmk1MRR1tJLv/87qiF3h80rRIrsKYLthOpLsVxMq6yLmeqyciQgd33UYOdWPuP5PeP6
         gJfEl2ryO3ki9TdZQmMA3JCE+mnMLssxaR7NQ7Tp+45T+Aj4JFdnGdzu3O+aZIj22a8e
         FZmtcJTfsyPyn3QC/tDFMkHg28eqoni7duwBqaC45oHSMliU4+XWoDQFIkRJGszpybrM
         ZpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488493; x=1775093293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgXkjUFi8RNX9zADMCF4Q/I66OJ8AZWY+meNn13gnkc=;
        b=ko/5drYThtsbkEK8luUTRPXC8m0vmSFfVC8Hy7khctbrHgKOdezCcDyBH3Zbv3wyTC
         0hOGVMQjS1B3E3OWGpAjv3IiQ4PxvwZ1K8Jp6xpCfXqF6muJ/ERAXgUpJBNs4DwRw9m+
         b8Q5uiaQZbUOEP7LWRTa3aUKw7gabH+5/La8NjDYgGyxTUFK3Lp8tkjIpz9F2a1lzeIs
         OrqGqgONZx+SMo6UuFDOE1PQKxPjYDTRa3CWYv8hnJqulC7zP4Dgbl3ubKJKfhMjB+HO
         9Jez6epQz/YwL65krIA8mu2FKSYJW+N9gc1RotWL/zQmLGvydp/4KdStJ4yyEJPNTXZs
         lD9A==
X-Forwarded-Encrypted: i=1; AJvYcCVfRXgnGaTnQx8ulVtUkxegJWX45wZ53pZmZbxrpyn5dDSV5uwmGH/pCG0aT3qM88RYOBmBvvuHexQg@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ8jeGS/o2Gpy324QGIpJSHljbCGQqTVXWSPuqaCINDz81lKVp
	jVM3bEZ9gabOKgyk3si/5uir7JUgK/iwvq37iHJ/xopdLxcAriND4lsCnNW2ywZcFR4=
X-Gm-Gg: ATEYQzzJ/VIR8R0IMjSAaumWuotiwOG4DD7etn8QY7vlUH+RQERMJ1x26XQg7CkaCQO
	y4bH+Q9Djl4qNMmNur7Ra60pbO9EiBd3u8FLwD3b03CaYWMty5rcWNekOofiuJcgni2AwWMFkUZ
	kXA70IU58PQVnjmPBiSM1u3/dim5PndXsHdkHpNtVdB7ROcc0gEPNcQjtAfU95S+VDLvYQ17bVJ
	lHmpcBwVjUn2O8yhGmaGdy+KJWG5fgLRfaWH21L+bijVv9nRvqxtaTxZy16rctFxZN/Bmn1pQ1A
	ZoJtYhU1Uw5UXwxBCWsnH83ibHCBmstHjzNfSdU1GWfKBwgh69qpt+ZaPs6Pd8CYuNr/BvCl0d2
	/r9LoAJkFp34rebIB6zSXY7F28aFX+A9P7Dtfm82uNrBaapEveU6Pqn9wsWryeKIIHoScJlu+b7
	A+kEvn1B9C2QO8MMPzwynuaBs8wGFRcpacqKo=
X-Received: by 2002:a5d:64e7:0:b0:43b:3c05:d7fb with SMTP id ffacd0b85a97d-43b88a39b7amr8254132f8f.54.1774488493490;
        Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:35 +0000
Subject: [PATCH v11 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-7-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=N6f8XbQrqLkocc2xm2zf/znOnvl2dvw/ToKTgJkKLbQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIvAW/02o1imMUf4CeWHGfYnnSEV/h55Bnm95
 89E+DnlACmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLwAAKCRAicTuzoY3I
 OmeHEACz2r5rOYRYzaR2gfd8IFZe4AGMT/qP/a1S1ZqysbMJWb+lApAt50A/4VelvLBR76cDeo1
 9rYvr6oRXNFZWJZpk+JHQ3jx2Sm9IZove9pAV4pWYxVJsym9r+koD5zQwywQOeFvyvizvsGRsEq
 fnRYzHymI2Lo9QnJR+mUlK5Gr/FXJ7ElGVI11WlWQZLSbO125JtS0e3Ve1AcSU05RTiZ++J/LrV
 m91WApzYPYJUFGwdDxd4dWUZC51LL8LTSLDFAWYU6DuIP1AwS5k4+DdXgxeLu+canP8K53jC8QV
 Er90YGREEx43r3S2eXwS743Z5zYXiU2QNc1W0WPvsQ4+D+kOskrMDDakHugusK0IJCoYdx/t6Ti
 jTBssLHgS9fiyypxCwV4LKuJOO81S6g5YqxSm13BbcWN3OUn/U5l/yNprtsnS5pAHAyb55kC/RF
 9iinNXo8ZCN7rUuddhGsZtZgPWiqrI0WTlYJHFCH1uenDrdYnm893IsSTBcSeRiFYU3cUuQ4jfA
 bBxQupEW/n2Ut19upmltARvES2wfzAv0P5q8cdI2S8vtvZcf0MYPrXWIdGpwaF2i71JNMdYQVkI
 So6btYsJc6d5lhvoDAUJVkqDYu6K2T7WQumaHSquDzrmYNv6DMxk4ZNuyJ47Y/KYazIA0nu8vPX
 QfPKTV/SBF53dDA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 224b5472d7771..3b092560b5df5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3896,15 +3896,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" },
 		.csiphy = {
 			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3913,15 +3904,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" },
 		.csiphy = {
 			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3930,15 +3912,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy2", "csiphy2_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" },
 		.csiphy = {
 			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3947,15 +3920,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy4", "csiphy4_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy4" },
-		.interrupt = { "csiphy4" },
 		.csiphy = {
 			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -5365,7 +5329,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,

-- 
2.52.0

