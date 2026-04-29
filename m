Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69403A640F
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448509; cv=none; b=i2C+0UZhFnCXjLolCWPHhld9GF58SjLVQhYZr1IePKDd62NDfkBpBaYmIiHLaYYfvVcL+6tYxlCtDaH1P/l3gGfz74Jwf9ZsEs22fVdEZHzcRftF3lIhExAEIhY0lH9E0n3ENZB6KyAFdsGARRjGIKXgnicIm3QxBwyIke6pXqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448509; c=relaxed/simple;
	bh=CAISY5+cwWLiF2mRCJiAISSqt30Xd9tjVCXYS3vBP54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQ7AhOpKhn8x2TOlcwDHdz70BDrdMMfFXZwaF/cCq3m28d2B1yOo7wZ9x6fuYdixiPhTfodp953t0kZ/0UtTLVJCIECE2XFCCVyqwAsx4Cgvw1sx4ZKAIT/pAce7uxRzRT1DJeeWvrTobnhLxP9HwXy7/P5BC5/tpAEIUbpgf+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IlS87Xem; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IlS87Xem"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so11403422a91.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448506; x=1778053306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Xn7KuVWPooat79nHNHapPXlPbnzLCwtyU1pcBna+5A=;
        b=IlS87Xemv0Up+I3TRgpHyukFF8ioyYGRAuX3fSuYx05ejCgKESyP+Sp8XtwMz4YIwp
         qr5HAPGG20cAg8ciZLd4dSheHGtvhOCwvJ1RXHKHCMSUibvP0Ni/jeIOuuTv0tQLck9T
         o7S8FGIsWfHed9gXR46zO0K0uIZkEaL6JMNGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448506; x=1778053306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Xn7KuVWPooat79nHNHapPXlPbnzLCwtyU1pcBna+5A=;
        b=dJlzVqNPNmoMejVWDQhVMbBIyPlZ+9jnATsU2WJzGpd9NhEph2Y7miBvWTTrQA1S+F
         A69Cq5G1rpo5FMC1ByIfwVBEGNKsT3QquF4XbjskKsh0ACEZuZvO7OM918/yjO4f8Khd
         KQV3e6PHH5022Dcxg5VYjGVhWlJit/GcfkxhiXN6NcoQXHjUN4TrlrlNzA/M1SSOBTEI
         choiqk3ObKzImfPNTeVO1J57j1pFbLjPgS9hRh6CX/q/dUGZmOYZfuGUdsFDwws9DgHZ
         TU4hBrKf3+08RQBhCMwKs0jdSr4/8jOVmKFAaO+TDF/Fvja/eWUEpXZF//BODJZfbsui
         pVHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UANA4IDj4korGYrrl1hZid7hhHCT4kydkcIxMZqyEgYeTO4Cq5E85f/73LN/YRDhhuItmOTsWhIPp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nqfGKs7pZGQbNdQIqxd+ldUh9hyJodqUVAsB1J3A/XrBQJ77
	vXy1Bqeif5g5fCUC8bBs/vq1aoLUJPbwrJXi/Dlq6ofc84e35M2ZC6nKduvgQn/hqg==
X-Gm-Gg: AeBDievRc+yslmGXLYzUUWpqHri0NxBx3c5Cnu/Z4YgDUbyJe78hC0GN0q1PdRGnRMd
	omXseh5jGfHhHi2z9oMGtocjigapeiCHTiJr++lc6i2NbjMi5TvpN2PVi05X8mhIkG5D4QYb2Ik
	fFonCH2X/FDiYo9o37BOaNaPyaRyH6q3OBvA+08th0v0SJKOBm6QVHerRbOuorygS9oSFfSudTY
	xpefgZc6Z7ECE6McIK9C9kyKfdIoKddhQ4Xq0Lzx3lJY7pjKdqfWzu/SBoYXbrC4ZhjPCP5+jiZ
	K+07m/+DyMogN+OndL+viYO12emQCzBhY/ido+h8pc+I+FwY3RF2jVsNWZJTh+5GmlaUq8OwQJa
	1s2ehdRPlf3jN1KfbT1Da49bKM/8IWSMCols0L+CFstHu5hP1edDdFpypxD/1GVUCZcUzTezDSK
	h+OFfCt2YhtV0sVSfJpL2hR1fJZphmxqXq6NyJYPjoqQ+2vPswYn6HagixhGR3b5ba7Sl73RZ4m
	L0DpV1fOr4+UvMWZTI=
X-Received: by 2002:a17:90b:2e4c:b0:35f:b6d3:da7d with SMTP id 98e67ed59e1d1-36492041639mr6605049a91.17.1777448506037;
        Wed, 29 Apr 2026 00:41:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] regulator: mt6359: Add proper ldo_vcn33_[12] regulators
Date: Wed, 29 Apr 2026 15:41:12 +0800
Message-ID: <20260429074113.3720271-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ldo_vcn33_[12]_wifi and ldo_vcn33_[12]_bt are just two regulator
outputs instead of four. The wifi and bt parts refer to separate enable
bits that are OR-ed together to affect the actual regulator output. The
separate bits allow the wifi and bt stacks to enable their power without
coordination between them. These have been deprecated in favor of proper
nodes matching the output.

Add proper ldo_vcn33_[12] regulators to replace the existing ones. The
enable status is synced to just one of the two enable bits, and the
other is forced off. This makes the handling in other bits simpler.

The existing *_(bt|wifi) regulators are converted to no-op regulators
that are fed from their new respective ldo_vcn33_[12] regulator. This
allows existing device trees to continue to work.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Instead of dropping one regulator from each output, add a new one for
  each output; the existing *_(bt|wifi) ones are then supplied from the
  new one
---
 drivers/regulator/mt6359-regulator.c       | 179 +++++++++++++++++----
 include/linux/regulator/mt6359-regulator.h |  10 +-
 2 files changed, 154 insertions(+), 35 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index fa97c3189df5..cd489adf9a2a 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -166,6 +166,20 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),					\
 }
 
+#define MT6359_LDO_NOOP(match, _name, supply)		\
+[MT6359_ID_##_name] = {					\
+	.desc = {					\
+		.name = #_name,				\
+		.supply_name = supply,			\
+		.of_match = of_match_ptr(match),	\
+		.regulators_node = of_match_ptr("regulators"),	\
+		.ops = &mt6359_noop_ops,		\
+		.type = REGULATOR_VOLTAGE,		\
+		.id = MT6359_ID_##_name,		\
+		.owner = THIS_MODULE,			\
+	},						\
+}
+
 static const unsigned int vsim1_voltages[] = {
 	0, 0, 0, 1700000, 1800000, 0, 0, 0, 2700000, 0, 0, 3000000, 3100000,
 };
@@ -475,6 +489,9 @@ static const struct regulator_ops mt6359p_vemc_ops = {
 	.get_status = mt6359_get_status,
 };
 
+/* Used for backward-compatible placeholder regulators */
+static const struct regulator_ops mt6359_noop_ops = {};
+
 /* The array is indexed by id(MT6359_ID_XXX) */
 static const struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, "vsys-vs1", 800000, 2200000, 12500,
@@ -596,18 +613,12 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		   MT6359_DA_VCN13_B_EN_ADDR, MT6359_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, "vsys-ldo1", vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1", VCN33_1, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, "vsys-ldo1", vcn33_voltages,
-		   MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_1_EN_1_SHIFT,
-		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
-		   MT6359_RG_VCN33_1_VOSEL_MASK <<
-		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
 	MT6359_REG_FIXED("ldo_vaux18", VAUX18, "vsys-ldo2", MT6359_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359_DA_VAUX18_B_EN_ADDR, 1800000),
 	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, "vs2-ldo1", 500000, 1293750,
@@ -644,18 +655,12 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		   MT6359_DA_VEMC_B_EN_ADDR, MT6359_RG_VEMC_VOSEL_ADDR,
 		   MT6359_RG_VEMC_VOSEL_MASK << MT6359_RG_VEMC_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, "vsys-ldo1", vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2", VCN33_2, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, "vsys-ldo1", vcn33_voltages,
-		   MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
-		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
-		   MT6359_RG_VCN33_2_VOSEL_MASK <<
-		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_va12", VA12, "vs2-ldo2", va12_voltages,
 		   MT6359_RG_LDO_VA12_EN_ADDR, MT6359_RG_LDO_VA12_EN_SHIFT,
 		   MT6359_DA_VA12_B_EN_ADDR, MT6359_RG_VA12_VOSEL_ADDR,
@@ -711,6 +716,11 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
+	/* Placeholders for DT backward compatibility */
+	MT6359_LDO_NOOP("ldo_vcn33_1_bt",   VCN33_1_BT,   "LDO_VCN33_1"),
+	MT6359_LDO_NOOP("ldo_vcn33_1_wifi", VCN33_1_WIFI, "LDO_VCN33_1"),
+	MT6359_LDO_NOOP("ldo_vcn33_2_bt",   VCN33_2_BT,   "LDO_VCN33_2"),
+	MT6359_LDO_NOOP("ldo_vcn33_2_wifi", VCN33_2_WIFI, "LDO_VCN33_2"),
 };
 
 static const struct mt6359_regulator_info mt6359p_regulators[] = {
@@ -835,18 +845,12 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		   MT6359P_DA_VCN13_B_EN_ADDR, MT6359P_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, "vsys-ldo1", vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1", VCN33_1, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, "vsys-ldo1", vcn33_voltages,
-		   MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
-		   MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT,
-		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
-		   MT6359_RG_VCN33_1_VOSEL_MASK <<
-		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
 	MT6359_REG_FIXED("ldo_vaux18", VAUX18, "vsys-ldo2", MT6359P_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359P_DA_VAUX18_B_EN_ADDR, 1800000),
 	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, "vs2-ldo1", 500000, 1293750,
@@ -885,18 +889,12 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_ADDR,
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_MASK <<
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_SHIFT),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, "vsys-ldo1", vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2", VCN33_2, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, "vsys-ldo1", vcn33_voltages,
-		   MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
-		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
-		   MT6359_RG_VCN33_2_VOSEL_MASK <<
-		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_va12", VA12, "vs2-ldo2", va12_voltages,
 		   MT6359P_RG_LDO_VA12_EN_ADDR, MT6359P_RG_LDO_VA12_EN_SHIFT,
 		   MT6359P_DA_VA12_B_EN_ADDR, MT6359P_RG_VA12_VOSEL_ADDR,
@@ -951,27 +949,114 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 			  MT6359P_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
+	/* Placeholders for DT backward compatibility */
+	MT6359_LDO_NOOP("ldo_vcn33_1_bt",   VCN33_1_BT,   "LDO_VCN33_1"),
+	MT6359_LDO_NOOP("ldo_vcn33_1_wifi", VCN33_1_WIFI, "LDO_VCN33_1"),
+	MT6359_LDO_NOOP("ldo_vcn33_2_bt",   VCN33_2_BT,   "LDO_VCN33_2"),
+	MT6359_LDO_NOOP("ldo_vcn33_2_wifi", VCN33_2_WIFI, "LDO_VCN33_2"),
+};
+
+struct mt6359_vcn33_regs {
+	u32 wifi_en_reg;
+	u32 wifi_en_mask;
+	u32 bt_en_reg;
+	u32 bt_en_mask;
+};
+
+static const struct mt6359_vcn33_regs vcn33_regs[][2] = {
+	{ /* MT6359 */
+		{
+			.wifi_en_reg = MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_1_SHIFT),
+			.bt_en_reg = MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_0_SHIFT),
+		}, {
+			.wifi_en_reg = MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_1_SHIFT),
+			.bt_en_reg = MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_0_SHIFT),
+		}
+	}, { /* MT6359P */
+		{
+			.wifi_en_reg = MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT),
+			.bt_en_reg = MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_0_SHIFT),
+		}, {
+			.wifi_en_reg = MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_1_SHIFT),
+			.bt_en_reg = MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT),
+		}
+	}
 };
 
+static int mt6359_sync_vcn33_setting(struct device *dev, unsigned int idx)
+{
+	struct mt6397_chip *mt6397 = dev_get_drvdata(dev->parent);
+	unsigned int val;
+	int ret;
+
+	/*
+	 * VCN33_[12]_WIFI and VCN33_[12]_BT are two separate enable bits for
+	 * the same regulator. They share the same voltage setting and output
+	 * pin. Instead of having two potentially conflicting regulators, just
+	 * have one regulator. Sync the two enable bits and only use one in
+	 * the regulator device.
+	 */
+	for (unsigned int i = 0; i < ARRAY_SIZE(vcn33_regs[0]); i++) {
+		u32 bt_en_mask = vcn33_regs[idx][i].bt_en_mask;
+		u32 wifi_en_mask = vcn33_regs[idx][i].wifi_en_mask;
+
+		ret = regmap_read(mt6397->regmap, vcn33_regs[idx][i].wifi_en_reg, &val);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to read VCN33_%u_WIFI setting\n", i);
+
+		if (!(val & wifi_en_mask))
+			continue;
+
+		/* Sync VCN33_[12]_WIFI enable status to VCN33_[12]_BT */
+		ret = regmap_update_bits(mt6397->regmap, vcn33_regs[idx][i].bt_en_reg,
+					 bt_en_mask, bt_en_mask);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to sync VCN33_%u_WIFI setting to VCN33_%u_BT\n",
+					     i, i);
+
+		/* Disable VCN33_[12]_WIFI */
+		ret = regmap_update_bits(mt6397->regmap, vcn33_regs[idx][i].wifi_en_reg,
+					 wifi_en_mask, 0);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to disable VCN33_%u_WIFI\n", i);
+	}
+
+	return 0;
+}
+
 static int mt6359_regulator_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
 	const struct mt6359_regulator_info *mt6359_info;
-	const char *vio18_name;
+	const char *vio18_name, *vcn33_1_name, *vcn33_2_name;
 	int i, hw_ver, ret;
 
 	ret = regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
 	if (ret)
 		return ret;
 
-	if (hw_ver >= MT6359P_CHIP_VER)
+	if (hw_ver >= MT6359P_CHIP_VER) {
 		mt6359_info = mt6359p_regulators;
-	else
+		mt6359_sync_vcn33_setting(&pdev->dev, 1);
+	} else {
 		mt6359_info = mt6359_regulators;
+		mt6359_sync_vcn33_setting(&pdev->dev, 0);
+	}
 
 	vio18_name = mt6359_info[MT6359_ID_VIO18].desc.name;
+	vcn33_1_name = mt6359_info[MT6359_ID_VCN33_1].desc.name;
+	vcn33_2_name = mt6359_info[MT6359_ID_VCN33_2].desc.name;
 
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
@@ -993,6 +1078,30 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 			desc = _desc;
 		}
 
+		/* Use vcn33_1's actual name as supply_name for vcn33_1_(bt|wifi) */
+		if ((i == MT6359_ID_VCN33_1_BT || i == MT6359_ID_VCN33_1_WIFI) &&
+		    strcmp(desc->supply_name, vcn33_1_name) != 0) {
+			_desc = devm_kzalloc(&pdev->dev, sizeof(*_desc), GFP_KERNEL);
+			if (!_desc)
+				return -ENOMEM;
+
+			memcpy(_desc, desc, sizeof(*_desc));
+			_desc->supply_name = vcn33_1_name;
+			desc = _desc;
+		}
+
+		/* Use vcn33_2's actual name as supply_name for vcn33_2_(bt|wifi) */
+		if ((i == MT6359_ID_VCN33_2_BT || i == MT6359_ID_VCN33_2_WIFI) &&
+		    strcmp(desc->supply_name, vcn33_2_name) != 0) {
+			_desc = devm_kzalloc(&pdev->dev, sizeof(*_desc), GFP_KERNEL);
+			if (!_desc)
+				return -ENOMEM;
+
+			memcpy(_desc, desc, sizeof(*_desc));
+			_desc->supply_name = vcn33_2_name;
+			desc = _desc;
+		}
+
 		rdev = devm_regulator_register(&pdev->dev, desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to register %s\n", mt6359_info->desc.name);
@@ -1002,6 +1111,14 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 		/* Save vio18 name for vbbck */
 		if (i == MT6359_ID_VIO18)
 			vio18_name = rdev_get_name(rdev);
+
+		/* Save vcn33_1 name for vbbck */
+		if (i == MT6359_ID_VCN33_1)
+			vcn33_1_name = rdev_get_name(rdev);
+
+		/* Save vcn33_2 name for vbbck */
+		if (i == MT6359_ID_VCN33_2)
+			vcn33_2_name = rdev_get_name(rdev);
 	}
 
 	return 0;
diff --git a/include/linux/regulator/mt6359-regulator.h b/include/linux/regulator/mt6359-regulator.h
index 6d6e5a58f482..ce2cd0fc9d95 100644
--- a/include/linux/regulator/mt6359-regulator.h
+++ b/include/linux/regulator/mt6359-regulator.h
@@ -29,8 +29,7 @@ enum {
 	MT6359_ID_VCN18,
 	MT6359_ID_VFE28,
 	MT6359_ID_VCN13,
-	MT6359_ID_VCN33_1_BT,
-	MT6359_ID_VCN33_1_WIFI,
+	MT6359_ID_VCN33_1,
 	MT6359_ID_VAUX18,
 	MT6359_ID_VSRAM_OTHERS,
 	MT6359_ID_VEFUSE,
@@ -39,8 +38,7 @@ enum {
 	MT6359_ID_VBIF28,
 	MT6359_ID_VIO28,
 	MT6359_ID_VEMC,
-	MT6359_ID_VCN33_2_BT,
-	MT6359_ID_VCN33_2_WIFI,
+	MT6359_ID_VCN33_2,
 	MT6359_ID_VA12,
 	MT6359_ID_VA09,
 	MT6359_ID_VRF18,
@@ -51,6 +49,10 @@ enum {
 	MT6359_ID_VSRAM_PROC1,
 	MT6359_ID_VSIM2,
 	MT6359_ID_VSRAM_OTHERS_SSHUB,
+	MT6359_ID_VCN33_1_BT,
+	MT6359_ID_VCN33_1_WIFI,
+	MT6359_ID_VCN33_2_BT,
+	MT6359_ID_VCN33_2_WIFI,
 	MT6359_ID_RG_MAX,
 };
 
-- 
2.54.0.545.g6539524ca2-goog

