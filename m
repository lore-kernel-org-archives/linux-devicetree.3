Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCACA4746B6
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253146; cv=none; b=UOU2TBy64/yX25js6LkwgFmg7xhHWVniWi2T2uvu7oehOgXZmUaoSYXB9xRAoogp6XZInV6W41voquImdNXvVrVtAT9wtHDt3dSdVz8AyuZF4FxEfluO1tJ/B7NJ/LL8jQUsiU5H21ry8fcU5yG/dxvIt4g0ZogRS/9TlHX1B4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253146; c=relaxed/simple;
	bh=7M6nbeG9tPY43T+AEALi+OiwCuMxXMzSjBxd0ttccnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1Liga5U3G1nfdNaiRXdeAIAc9G0nC6gQCuyb3AyL+/XyQ4dJ3l01yGbz6c7ZXYl5SWZCwOJy8PYuZ2Cdz6l92/jpmxrFO5QRRRSFX2JTYQvfSgOA5cMZ923j6cn1eNLJrRBi+ipnGX5WmUTxvCUaaSRjohRfdoIeD5fyPHG2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eCWAHySr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eCWAHySr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2055573c8cso581470966b.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253142; x=1788857942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5XBJS5aRnfQSYIGXFuLlH4XgQF6yHiUe72vjHiZv9s=;
        b=eCWAHySrgIV9xLjilL0tl6n/8MaNFHzyR+knDtWydEGW62yFm76iFI7Y8Tp+OIuqSp
         DnA4ohMN+1yiOHdfipHC1m9LClceJZiQxzO5EEG7+Kx/uVHoWzEMtKLcJSOddJ9B1ind
         yPY5dB4Zqi0egSoWT7r9EcL6+XEMY+mXDGXAZ3D1Gk+eEBRINbiciMlYb4TW/k6TfLcT
         TgNvwGLKLsJr54uqU4ZSvH+7MCRL0kXwICgrhdHeJsNpSk6xylgk5JQeu6q5EsgaFSM2
         RGk3W1u+0YnpVwvKJ/z+y5pqC6/+q2xzh+wdIZ4CXO/HYL383SEFtnpTf019Brtm9vxe
         /lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253142; x=1788857942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5XBJS5aRnfQSYIGXFuLlH4XgQF6yHiUe72vjHiZv9s=;
        b=K7V9sTt8wWwIzTJp1p7bsjQJmCkce5BUUMTo5y2g65gi4YulBfld5pvt8xluAj8rdR
         5hvke8n9vrvvRAiOQ9Z3OryoVeuSC9AYyRy2nX3/Rf6rZWArhF4EmoHfG1wgnRIZtYFi
         4Be/sGWrWVS+RQQwK2gVmiz/tRWRPclA18mBSGYlqu6zrqiMO6Cj+BhltE8DYIC6/qUC
         itePnu9rgdYmTYX/1IwXgFxZMZRrwmvFNrDsKftyD0P6xPfduiHXuklMLPvuqecbq2Ub
         WilOXjLjM25fugMYRZUpFTc1FTDYhZeShFdHmlFoK4vxjCQHbAn13BX/TGw4Zfzm5jmH
         nvkQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0FosDmkA8oMAQVUoc+THwNW1+WCfh/4o+PZq4SDs/gXSYlZPBGvfwZ1Fc9aPqxgGEjbn7nQdO1WEK@vger.kernel.org
X-Gm-Message-State: AFuF++kwIKzh0V1uuzNdGfuCzv0tG6d95qCXK/aNzP6lNZwOLkMbAA87
	Mwr3aFWzDBZ9p7+lMiPIvXWfIXB2nyFHwv7DXxLlyWWKg+uTLa04dYwREGvJE/SCwgs=
X-Gm-Gg: AR+sD10rBlM+osLMPumkODKEVixhoC5OfZodJANCmfq1XIUErQfbvioTx7n3eXte+Ag
	i/AxM3Wn2/o8c/VB6/1N6/LNd72BFrm+synr8Vyz6OFxPxza0hOU3mcgfl4lTBya4RBxvtPEjRg
	83Tc6apIr738k1lfoOQ+wiLRuTNK3HSR50JqH3skr+QC8CTe9FSAeHw7W1YDjRnYmyKVc5wLsKw
	u0y0GrEu5IL5nHQDrUdTpJ9nrOC3CdtvLdeIDcz0DR9AkruXY3I2yIEhi/xpNVJpMdhngcBHtUS
	43E7KdRw8hEnLfAmPtoqaQakGa5IPCeuhjazwF8mXnrEj1cGF6kipwdgtyzg7+3qEFs69UPuM6l
	ULRoVbDZOO5xRxkFd6j/e2ma76hPaHHfgyzSDqRd6iCoYPfO4H8Q3o4SKlsqHddVDPqQJbm60NL
	Ai2bHAjy4z3NHk+boharfppM32IHkPcz9D8CiQ59xlkllIuTwG3avxRHcBDYTc3WwoKAO8z+hJa
	GZUzrAolOJpirVz/w+fvyzeboyxoab+qxklAbkpJ1c=
X-Received: by 2002:a17:907:3cc2:b0:c1c:5aa1:de57 with SMTP id a640c23a62f3a-c2557030696mr1955254766b.13.1788253141904;
        Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 10:58:57 +0200
Subject: [PATCH 2/4] regulator: qcom-rpmh: Add supply names for PM6350
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=3749;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=7M6nbeG9tPY43T+AEALi+OiwCuMxXMzSjBxd0ttccnY=;
 b=7SFZ8HclaBruaPUHto81Cu0JBen6SHqfGQODtd1jNnHZc9QBEOVltlW8XJwjkrB4gH1llSGzF
 b1js7DE1B7oA6C36kBVLSiNZB8UnGgOglhKPBpz8cPKsYvc1bzTVxyo
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The supply names for the PM6350 regulators were skipped during initial
bringup. Add them.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 46 ++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 25c14de3cd8b..dd2265961151 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1589,31 +1589,31 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 };
 
 static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
-	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, NULL),
-	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, NULL),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
 	/* smps3 - smps5 not configured */
-	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo12",  LDO,  12, &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo13",  LDO,  13, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      "vdd-l4"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_pldo,      "vdd-l2-l5-l7"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      "vdd-l2-l5-l7"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      "vdd-l11"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_pldo,      "vdd-l12-l14"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_nldo,      "vdd-l13"),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
 	/* ldo17 not configured */
-	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo19",  LDO,  19, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo20",  LDO,  20, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo21",  LDO,  21, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      "vdd-l18-l20-l21"),
+	RPMH_VREG("ldo19",  LDO,  19, &pmic5_nldo,      "vdd-l15-l19-l22"),
+	RPMH_VREG("ldo20",  LDO,  20, &pmic5_nldo,      "vdd-l18-l20-l21"),
+	RPMH_VREG("ldo21",  LDO,  21, &pmic5_nldo,      "vdd-l18-l20-l21"),
+	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      "vdd-l15-l19-l22"),
 };
 
 static const struct rpmh_vreg_init_data pmcx0102_vreg_data[] = {

-- 
2.55.0

