Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87D480DF0
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522799; cv=none; b=FwbInFNEjAZec3Njg0ocX3VnyBLOCq1ta4FvKjStZ66T6g1KjaPmNja0Kd6L1Sc2OuDMB2WN2psn5bVO3Hv9RqqdUIZA/iCEDwvITs95+BW0xzA7EHuAUqcK/qQQsS9OA2KmhD60hn5cO9Io2Q/qGdYjOwJLqFeTrTG2aASZDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522799; c=relaxed/simple;
	bh=jvWI5bCo2G0nPMiyIWWUCCvc8PV85ddqSgmXfNNkRqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hm2v8GReUdsdXiC3fudNajXmrZIo7hG+59fyiEopEfXrfcqCEC+3SaH7fi+4uKqgzWWnif1WgeEpBtbDjtky1SAuKS5D4FwwH79w0RksoSWcpU/GxLbl9Thu7EHTg24sHsR9eGdDOu8yj7cwM6GCd4ExzOVTKNsRRNcBYCiOTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yo2lJ6dC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yo2lJ6dC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so10598145e9.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 04:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788522787; x=1789127587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6nCQrtjn5sjZ36INdWU9AmImwt4exmEpBcYwRBKS5A=;
        b=yo2lJ6dCgTfbAsNuitp7U1FgvBSC/dscNy4lI6uXIOWBGvP9s5+T15IVcSFuKfRZm2
         sDY35EaFD1d+socaAa2v1WEE0zRsbO+oOa7/gAi7oQSQISQUlOIbfKSRUThhknI12Y+C
         5+TuYbY1rlNq0SW28Pl33qsA4i4XJ3kDYHU/Xe+SaAuCub7ObpW0+QLI82Q8Ym/LyKB6
         IZHNWnH6XNjauwUfQekc9fRw2yPY0EjlI1ljqK7UVmX0oRPAz4BmCBsX2V0kvhu5PGfA
         6UCUzElBBUoInSt6RzkiOzebaKCRkhxQwTWP7JZirjR+Aedmv0QuBCuQTalg9g9yamKD
         wC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522787; x=1789127587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6nCQrtjn5sjZ36INdWU9AmImwt4exmEpBcYwRBKS5A=;
        b=YBCVTfLM8b5i7ilIbvTC6F/zKMbmA0czT6NeR7tZKERxn4IUPOLpxvr7cx8wihLKAS
         grvY9W3lzpS7b5SptYFVOTl+BlZa8gfFgJd+ULDw0R5VEG5h+6oQEdfeqQpRSt64tmj+
         K5cWwS8Z0XxEbScCk2fp5jLLsYQ5HgZP6ZROSv2XLnTKPMq0Mmb02glNVPZhiMORzeev
         VOCAfqqWc7G99hXAi0ScrBRCbLU+2c5/eRY2tE1Dd9qMhXGNWfJ9fkeDyEY+wPFm+Wn9
         3RA9mJkMTt5egnHMC4TX/5ExZSRUZgUtXDsUX2nYt9kT3sTmNkRlSrSdsQav2aISW7pA
         j5eg==
X-Forwarded-Encrypted: i=1; AKwUvByC1dI/2CfgRabaSztT2scZf5BN5rTTqA1pJilveYYmXYXotlKQAjZ6K0j0+Po9ZwcZQVzqQOaAK0zs@vger.kernel.org
X-Gm-Message-State: AFuF++nMumZtY71nS/XUywG1p1vZyahQ+4Z6n8wrSySqymCm6GnTuQ2+
	Kmhp9lU+V/fdlzdPLaKIUGiEBTFo9dtB88tZGwnc/GQLdHvSU/hGetjONk14Yhv9ZFY=
X-Gm-Gg: AYBFou0GrMQyH4k3LGpz3pttBxxN5GDpD/uJB3Er+lq4mhWusgUTm3mBuNDdWv7d6Tu
	TizSNvVo/qnGt96zsHcK4YEP9F5oC988IpNA5+s9lK/46nSJ39LdzhYwsiTsokySsJtPLajttrl
	wd7cdpfBm+E9kS7a9NWtiT6MHls1MzczviqgMoCoj1SqXZcoHQbeLSjaeHSNuUYqhhv+lksvE7W
	LfwjufnEFhOxazUUJSnLqFx9taJSCrzSvH3WrPdAgY6w+/lzw5dIvyP+7r/3XI65tfpSPt3Xf1L
	2edo742uNHx2+u3LACsF1iI6NKB0L9XdzFJAeD5cNFoTP2EktkENt0ZClCnuxX21XrLvoUgomEa
	1VOlUUquykDc1D6FoZqoNVYhXjFRHNMwQlvc2bPTm7p7JURs2uImq4NUSeuJJe7KEaMIV3mkWZs
	tCUh1DRW4fW3ct0pEqLAWjaXB0PHg7RpJ24Wjui6mWSI7dNNjLbJVOLdSaK8gOPmUwgByV+tpd
X-Received: by 2002:a05:600c:4fc9:b0:49c:fc6e:8cb9 with SMTP id 5b1f17b1804b1-49cfc6e8e1emr26351795e9.29.1788522786683;
        Fri, 04 Sep 2026 04:53:06 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm5474207f8f.36.2026.09.04.04.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:53:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 12:52:59 +0100
Subject: [PATCH v15 2/4] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-2-68b7916e7a3f@linaro.org>
References: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
In-Reply-To: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5277;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=jvWI5bCo2G0nPMiyIWWUCCvc8PV85ddqSgmXfNNkRqI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmrEcz6YX2Qfye+Tuh289sTURyVPCK9pk4RNQN
 BviaddB7NyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqxHAAKCRAicTuzoY3I
 Oln2D/wN3GaKgADkAMxwwdkbuS+Mn5CoPHU4MH9e8qSHKrmL1okdAu1Io0zfudgzLNIbNwaoLR4
 bm5c3d15ckYQW13zIMAgiW49AOzP5Rbch9LC0MZN2W+C5E0rZEyxXpzIPkPm9374C6upY6ky+8R
 51WqFeEKzHnA3+moQ+upkojdoua18kAsb5qEN36YiTXCb9E/KfFViv517IrRk+l+sMbx7wKIKdF
 KhhWYIl90Ba2WN3Sk67JeDyH3DwXL2H/2CtIW2IDfXSiY58s4YqJsR6q1ilvwgJAS1B9+d33rY/
 /bMvGOVs5UKKJAGC1s9OLIMIj5yqtHiEoMuD17JclxBK8+/5P2gxPlU0n3h9h0yBOr9a991Bdby
 eHG4bs1RzQTuFBV5qzMubfpaRQj67jreuXOwhi51G0jSDdLCGaEco7pfkahW3de4XSN/NY6cGAd
 BV8DDUY8sxdcOH7ETQhXW0lvO1F0sbkeCvcXQ+4tEPv6CCDW50Sdju40xf70UuEflLIF8GFNrOg
 nh6Wi8edqmTFxGh4GoGTZJi0WJFt+RbhrMd0UwyZhbd+peWbCJUH6KZZrTA7OxzvNi1iM+PgFPH
 DVY1c3ed3MdyKLn79soDGQhWuImRVBid+55HhymfDq3tatQxc0BbfjbnBwwtIEyI3e1/h0Mrfu6
 1mG1BTveYnk0mEg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 95 +++++++++++++++++++++++++++++++++++++------------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 78 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 89addd732bff3..490a7cde6d40a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,22 +606,51 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
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
  * @index: the index of the phy
  *
- * Returns the phy associated with the given phandle value,
- * after getting a refcount to it or -ENODEV if there is no such phy or
- * -EPROBE_DEFER if there is a phandle to the phy, but the device is
- * not yet loaded. This function uses of_xlate call back function provided
- * while registering the phy_provider to find the phy instance.
+ * Returns the phy associated with the given phandle value after getting
+ * a refcount to it; -ENODEV if there is no such phy or the phy is
+ * disabled; -EPROBE_DEFER if the phy provider is not yet available.
  */
 static struct phy *_of_phy_get(struct device_node *np, int index)
 {
 	int ret;
-	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
+	struct phy *phy;
 	struct of_phandle_args args;
 
 	lockdep_assert_held(&phy_provider_mutex);
@@ -637,22 +666,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
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
@@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
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

