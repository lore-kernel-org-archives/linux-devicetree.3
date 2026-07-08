Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CED3B1B3
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469248; cv=none; b=j7HIwb8rPct0g13bbgm/iYA7TiauGkT7ZSnSKQfyqd69Iku3vSw2+uJZZjohyKMe1FNPwkUDJX6VzN+gmCCQDcOIym0CVHbkPTQCXDK61I1HGZkNulDpMjv8VPRGlYTzK/G09dn45eZji2iGk7FQWGXyWpDlllN2VMvwBSINBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469248; c=relaxed/simple;
	bh=QELXP0efqklH5qE/tb7wsAFTLcdUr6MfWusslj29lkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/kWaHPfQLKaPD7BGLernvX+MyeS33GbwBN6YLPm87IydRsMZDlovsVhurCEFfwKiYgILQIP1zsFPM6o8lUzAT3l3lVzLRo31tTr91KkNeZwWeKHTVRVeLfczdg9Kd7i8gz+2y67enM3a5I+yuS1u3f5BFkzEcwyVzYcnC2wF+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYUUZlAW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYUUZlAW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso47457f8f.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469236; x=1784074036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZBW9NYAVgSClvNZsX0lNZoWG6gpuHIPaag9PPsncp4=;
        b=XYUUZlAW+ShgNGm4VQaYzaKMov6kVD9WO0SuHyZ5BSqu1B9nV1Sb6CTvn99A9tASnZ
         rt2CBzOPBsFj+Cs5uQ9NC1xp4JkPguVrSR81HupKYyzIY/Nq+O7uAox5Tsq8V1gE2gvY
         mtDuutM38wgPNXzGfeB+EGUdLik+ImOTREkJatm4dnOw5BvwG/P/o8Tc9jE5pQqIjqTw
         xt7B1Ja46xaazXnYYZWcxPg4r3CMG07ZIPKhzOLpH0fxXy4SgoLDp3anTzVkGuYmidIf
         NsrfqPjUvlzB8ytSwL7Vhk3iILnMKodXxBNyMnEXGJRRx1kLFn6ApqY1ija9jcoofd1J
         eCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469236; x=1784074036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZBW9NYAVgSClvNZsX0lNZoWG6gpuHIPaag9PPsncp4=;
        b=i+ddsTGNs6l55aDgXghw4ga95lFRDQYwJCTwTs0YiaTtX18/aQeHxzAc+Yj6eGX63P
         07tj9OHk2lALxYz8opcU/1XW7EHePG8L8ALjgJgUk+9H6mmX20Ku0hiEMkMUhhum+ktx
         yTtRRh0VGmJ5fnAXDKz+db55JshYgjP5dG87hnnXKP7+cueotqem2T0NfXa+ZIimuF8N
         e/ma5UEjBvYZwDNNXOK9GJkgWjM4bQ5mXhb+HOcmtIE3zZj+MeZki9p095k/PEvGA0nD
         pTTLYfVG9urRAi36cAYl4gBXIvuOvbcT/V/054QjM6fWLaJDSYBTIwElV7Q0rwDzrpLP
         CR7w==
X-Forwarded-Encrypted: i=1; AHgh+RqEqu1y/ZTz/E3iQ5DLhAKfXbz5fQUL1O+GlRtV1sDw3Ipz+pUpPy30U5fJTG7AmV5hww94dBXmaSmN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7IeGWAFLoBpebwyJ1bARonC9ntRu5BVnv1eOUZ4w2Y783nJ/s
	NK6Jv9tY/APceRvULFvDGIWxUvEU/rAaMkz/xhB9fzkRlsjxLAHXTepnXxoNX8qGaWA=
X-Gm-Gg: AfdE7cltDpbwRRvSFCd9G4KGpsEJubLyGv/LqsZ16Uwot7y8aIsLC50GJ7Re1wjfENL
	QTAaKph7TMh0N2/QGw4ZrYCzlcKSJyZLYeejrqLyXPTe6fdbLof26e7MC9nmaan+mn7IHtrlpO6
	MOfls3p0JYg1zSEJKcl69zTZ9SWVaRMekLnnT/4srQokVeuCRFHy5gk/7SzmwIcSPNhYpDgwaNz
	Yr/Ub42js3thcQKds3b8YgzE3y+DOmDRgPCvhYn0P+Hkbust6//KA7LJsd9J9XqAuHLcVxwuec6
	m/pAGcFUmsPD8If434aKNcW4833WX6sgx9vWP4sKCa7oAeA5+Sm/TBnQgROWb0389f7YgrunjyU
	tlnBlc5an1y8C+EoCplKFcusG7y/0sSyABys7uiNZrl/uQejyXIlYaLcyes7khpFpVHd4v10MCv
	lmHULLGS5pqCfj8mggqAHZVdo=
X-Received: by 2002:adf:e34d:0:b0:472:c426:2ce9 with SMTP id ffacd0b85a97d-47de666b0d0mr6964115f8f.12.1783469235651;
        Tue, 07 Jul 2026 17:07:15 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:07:00 +0100
Subject: [PATCH v12 6/6] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-6-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=QELXP0efqklH5qE/tb7wsAFTLcdUr6MfWusslj29lkI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSoDVvrSeIR1GEcpvrGvnRh7TNJeP7pIsOLg
 98ZcrZUbCyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UqAAKCRAicTuzoY3I
 Opw7EACl8D4iTNEOm3rvEsFvIS8xj6DIdntmnPUbPQjtqGfBP6eDN60AH668T4DmLW82RkhSrg6
 YCdbHf7h4xf1t+4DusZ7fk9x8bP3vXnitqmEKmT77+HYNZFMinclo3b62Zm/lIEucCKmbX12782
 XGjMGss3fPpJeMNRxawoXmEZBmVSQ4GnzjSjTuNze0DDKn1SyUE2TaoHJ2UENluK1Lqw6POiTJa
 +5jSUT8+dFSWOjaBCiSn6yi0kDOzJXNChp6nipQy67T+N6lxnZwUcaD2NaPusM+xZFuk8cZYuJo
 2A47lQEp7xVhcQj3NOxTgPjnqZi/9hNejuY1jlx07g0IjZVM9GYClUoN0F0UI9BEkoadqdeSOkR
 hl7Spf9gYWpiAOVof8dCE1HEaL277FV7LRaGC9Oqlz7cEAhBhUUVyFvNOWdx5bPiM9407qQ24bd
 5ujbW+13N8krxjuOxrOwveQPw33E1KIgtTb6CT/vmQFCWM+3OgkUcXrtFQtheK8d7jgUpBRMZji
 VyIk7/1JvDshePSg9oY21VyDEylKwolhmnmv9mPYWWdfH465qg+irrMUwdQ0AZgv6gJDRpmfq59
 7GwEpAL+Js4ZLp7MHlklypkjhYs6m8GuBC+4xK7mLADRfTINiZQq8+9xBXLBNnDFqXWA/IMImsN
 OzFdxJ/KvcGF+CA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 146fea438486f..f360b2c99bf89 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4191,15 +4191,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -4208,15 +4199,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -4225,15 +4207,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -4242,15 +4215,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -5803,7 +5767,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_x1e80100,

-- 
2.54.0

