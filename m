Received: from mail-ej2-f18.google.com (mail-ej2-f18.google.com [74.125.228.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7764C10D2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658726; cv=none; b=sHbj1Htopxfv8gAFKSdrkKLWZUgqc6Kov+XEWW0RYbD5jiCegAauGcgRMecifuoXumwG8Dwftt99EsfUNuNtaN3TkuSUXUt0JYzIst1YH7PXiINRs3n/1dHIXqAzjfm3WtobPlR7ZthdrwSnvk+t0ZBsVcrqKoRL1Y7JbSFLQqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658726; c=relaxed/simple;
	bh=mbGaKzht6FTlTs32snTkWI2to5iPenkW5iUX9UmH+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HhPagS5q//JZzxU9mg6+3xH4MAsVWNTA0jCG+Lp877/z7ZssBOEJfxYysz+IdNMf6uiCf7w+OTVL7n48alckVdOBliRFgCBGlK+JhC5XgSNqB9d83G05C0NZTClOSsDx4c3eXS2ZdQOdsl3ym23pKEIAn1RnrF/OUWEV/VoHbpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULjjQo5X; arc=none smtp.client-ip=74.125.228.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULjjQo5X"
Received: by mail-ej2-f18.google.com with SMTP id a640c23a62f3a-c254fa65080so144415066b.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789658715; x=1790263515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o60JRFM5WA2Unn1KPhBnuEVA9Bwozt76P6e95xSEIP4=;
        b=ULjjQo5Xt443U9I89OmdGQbdI6jjRVfjTL+H3mDlu8P+YudDQTh5uJM1ds7ZI8GJgU
         kkHsW4aLrXm95wHTVBIfpcoHYhizUiGGNGhPRddndM5NkyRDkm0+yE1pcPL/zFi6x7J6
         5wWVnGRuXryOFUlWDat/m9EiPMAJch8J1WHknqCzKFdLtraVdbVOwN5DCknWfB6iLqTy
         WW93Fcmugw/ZLFXf1vBcaOZgBSNA7xQOvuK4nsOq7zeR1R7jsV9x/JxpEZg2x5q0EA9e
         A83RvO+7IKP2oqVD2VyGMkW3xoXKaJyo1wucLlP+7vJrxGqoLJj8VUtMZAUoA53W7rts
         NPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658715; x=1790263515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o60JRFM5WA2Unn1KPhBnuEVA9Bwozt76P6e95xSEIP4=;
        b=diz5TfUw29ImxhsygsohpzJByNO8YZ0YTAntzAwZRn20rszM2I0+DJ9Hnm5F1JErQ7
         FFlua6LCFZNETCMGGqXzDaQMTTiSHJh7FYXIsSmNErlKgpcP4QyrX7VyUdZhERYosJNU
         VMFadXTV3c+8ejWNK2JUEVI+3RV7Ncy6Rh0jYAfoxrvbpx293XR8q/KuNPFlTWcMukk6
         BuEDuskJbAB815yFrKxsFn9xMNYLhl73VAqm8HxPgG3UU81u2if+bZrAG3smDXc387M3
         oxJzNCY6c/9CMQER5fnqG1lQBh7LuEWaL7HSFGWJ83SgrAw5Rr19DWdUcoimahL44Ig1
         IChA==
X-Forwarded-Encrypted: i=1; AKwUvBxklVxvfyaTMtNNDczy/O8R86Ih79jW3wmf950xOM+Piku7qNA3ar/+hmbCauUMO3dQ5sgWsN5JLcva@vger.kernel.org
X-Gm-Message-State: AFuF++mW2+L2PFvExqcTakRztAIIIffuvM2a5Ya4TBH4ZgLXzBlFZ232
	QF7sO3GJqzlaDqYLVKFB7bNiq0ORnohh2qdQhdeGkN6PhGp1VhSb/91L8n6KlqyRq2w=
X-Gm-Gg: AYBFou3FTOjHUhXit/fQY/zlHxPsOiqMWOO31LzBDjRGFuUlgnNNwVjoag0/AIfYfPI
	ZbyhojoJtsmIcHz/owKkIJHEw6GAPVnAHI8pVTPihU4i9NsRf74ejXkJ1HWg9zQG+JzvuUpDvHU
	PyA3brNPE6e6COjsBCzWeWkGAyULq/pYDZ5dztzWGANIortGHx1pN+oyDsoPNljRuMakXX2YFs6
	PmDO8gQZBvMEKNPYbEtyX3pLPUnHRSqHuNyzMhov/BKvLy8lRrcnkdd+MnArQ9mgUsiHizCETcU
	TF9+PR3bQShRfWUml619HeIxtrgy14IgRUws46m/hSZindnA6IiY/NKWwqTRI7tugAZe86DG94r
	hvx+ZjCIPgFM7bA9GHGTkggUBOhzGE8Zd20x90UQFvYu2bVPQwG8Tsc1h1mXHAKDHBr38J9u+p6
	ZSDh0Ax5bPZb50JyN86Kjd0VHB1N4K0dR8ac105GY+JRkfnrr/RzD7NDaVSaxo1uCXoGFp62pQV
	BGS+5kCuA==
X-Received: by 2002:a17:907:9710:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c29e53242afmr538141166b.36.1789658714541;
        Thu, 17 Sep 2026 08:25:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48755asm310587366b.24.2026.09.17.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:25:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 16:25:07 +0100
Subject: [PATCH v19 2/5] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-2-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
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
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4777;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=mbGaKzht6FTlTs32snTkWI2to5iPenkW5iUX9UmH+is=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrAZUHU+EUBv2jfs/6uvx3XSpJcXQOAF2wkNhp
 4xPSk+jVhmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqwGVAAKCRAicTuzoY3I
 Oj/JD/0cpegEhQJY+utxEKWKYDFyWdT/4jJLzXhcgV6CvyR3ZjDIylxCRO7VLw1hbn3ZNUBqTeQ
 RvlFIPUkPiwHrwxKcQ9IV72nAvFge9vf4EOfwOG4m+35E2LoSKyJDcQpl72qnizIBHpDw1b7pom
 pRyy63h3OTJqnNk1H9yW/2Iy/ngUemQLZNnght68QnFCowIjufu6y4ZgMT6/q2vqpSFe4NS2+9Z
 hWA8mJtFxiG5WHF2maX5EONgaQ+7edW8wWKcUVHBynIJiBNE2j+am9P/7I4xVhnQwqQNUV52F4C
 YlPz4hDIfD493XC7Ofufes2KwGNqimwi1IRnrT5cDfuQtF6vy6cdm0UUWsCuHwI5y6sggZybpnG
 IF3Q3E3zxQ20LeABfZrPdOx4MH7cyEeDsAmDzbvnc+39VXwbDpyeffztcpQCqxdEJnSQdUWD89U
 IjztmonFiLmRbJM1dx1URij3pdGi3PVSARx6A1LozuJzxvgLiZ5d3K197MRQJFMpt39L75Hipda
 WtenBqsGgQGtuOM1ijIW4X1yWjmAL4IJiCIjGYhjSz/5n4Z8er/nsQEu8Optsy5cj2K64qNWO/R
 ZeLkRjGYUKCT8yTBBqH0H05rUwW8/oZ3PYi4HsKytb9VVzxr643QhzzBzp3qyk8CrQGtTxUMQdn
 A5lPsQBjVKU33+A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 87 +++++++++++++++++++++++++++++++++++++++----------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 75 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 89addd732bff3..4a8e1d3cdfe75 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,38 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
+ * @args: of_phandle_args to the phy
+ *
+ * Returns the phy from the provider's of_xlate, -ENODEV if disabled,
+ * -EPROBE_DEFER if the provider is not yet registered.
+ */
+static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
+{
+	struct phy *phy;
+	struct phy_provider *phy_provider;
+
+	lockdep_assert_held(&phy_provider_mutex);
+
+	phy_provider = of_phy_provider_lookup(args->np);
+	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (!of_device_is_available(args->np)) {
+		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
+		phy = ERR_PTR(-ENODEV);
+		goto out_put_module;
+	}
+
+	phy = phy_provider->of_xlate(phy_provider->dev, args);
+
+out_put_module:
+	module_put(phy_provider->owner);
+
+	return phy;
+}
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
@@ -620,8 +652,7 @@ EXPORT_SYMBOL_GPL(phy_validate);
 static struct phy *_of_phy_get(struct device_node *np, int index)
 {
 	int ret;
-	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
+	struct phy *phy;
 	struct of_phandle_args args;
 
 	lockdep_assert_held(&phy_provider_mutex);
@@ -637,22 +668,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 		goto out_put_node;
 	}
 
-	phy_provider = of_phy_provider_lookup(args.np);
-	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
-		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_put_node;
-	}
-
-	if (!of_device_is_available(args.np)) {
-		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
-		phy = ERR_PTR(-ENODEV);
-		goto out_put_module;
-	}
-
-	phy = phy_provider->of_xlate(phy_provider->dev, &args);
-
-out_put_module:
-	module_put(phy_provider->owner);
+	phy = _of_phy_get_with_args(&args);
 
 out_put_node:
 	of_node_put(args.np);
@@ -1001,6 +1017,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
 
+/**
+ * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
+ * @np: node containing the phy
+ *
+ * Returns the phy associated with the device node or ERR_PTR.
+ */
+struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	struct of_phandle_args args = { .np = np, .args_count = 0 };
+	struct phy *phy;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&phy_provider_mutex);
+
+	phy = _of_phy_get_with_args(&args);
+
+	if (IS_ERR(phy))
+		goto out_unlock;
+
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
+	}
+
+	get_device(&phy->dev);
+
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288ae..71c2e16397130 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 				     const char *con_id);
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
+struct phy *phy_get_by_of_node(struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

