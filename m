Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F548094E
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522797; cv=none; b=JZ6H9rEVwfWoqJyvVkAs97wt4e9VI4NUOn8eaNgMfNLiJ0DIsakoLWcybvCYoE0VwurZh/AW26K1yw67nQectpnXiUFb2K/mlkt3y83HAVpfnElEBY0zd2+4jAu/XPt5doWD2jkkYIbmjTWVZa+d1t6nnT74DQDxphGcbvI8NmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522797; c=relaxed/simple;
	bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRXF7BG7SytnhdbLCPBerW0Gw4uTXm67U+TunufBInMh7XQuYlmI0zLcb58LlJRctdkp5ZZJL+E1U8SEaaKXhd16Gjg4bW/gSjY41WD+IvnCW7WzsAIAkMDWlqfYb+U+RxWv2biNphzemxJ5SFsYAjEWealbPWQbnsCLmHFf58E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYVr1ugP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYVr1ugP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8687630fso8486555e9.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 04:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788522788; x=1789127588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=BYVr1ugP76EaArfin5AIFoi/luiRR4VfChYm86kx3IPXJAiIaE4jWypYxZT0HaO8s2
         HCywPntQoktYFkgGyd2tuafSbNn27S0Dl3K+6rzmugy92HTo1uLPHNCaoW3FB062Jj8F
         eASHsRJ9B79N7YKkCDngm740W27VwsmKepLP4Ek/KxUj3FF2vuqQ/L1isd1nsZoxNBpg
         ZIrCHpCRkwWwwM5N711B8pmpAOS9V2/yAwGtfoW2E/pBmXPHkGLLXlSyrYGJatf22hxE
         9wEkaUoCSDiWt1pQfG53V8isEKIYSRjYfnPl8LnLaMGERIE6ZxVUA8KJ8iBAsdTDV9FL
         GEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522788; x=1789127588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=Y2884RxkhI2SrGhNUxGPCTg1MRh7qvV7+VrB3OIj/2R8dGy6bsXp4dznkB0ewJfIFD
         ET6V/bKzl+WKDtFcpZX3HOaLCIEmViC4uudL2kngdW8XfW7QaM+9KdzAPYOWKGpctrlF
         UJ//WKxznjwHEy0kJ+/0arOZPCg3DjNzQjwoF0Lnx70qXhZKABTiF0MtKp/rqNibDxUp
         6qkhmh+UWzgnTEyKoNp1g2otchRXfzjjbcbHmtB8ogyINyNA57nVwDg4AqdDafZJM7QO
         IcfhOO0r8qEQM9b1nTAiQJanQCzD8tSLbl/Gze9eUw/yXHgir7MVKNgkSTtpCaFESLuR
         MMkQ==
X-Forwarded-Encrypted: i=1; AKwUvByc29BCOtfP845Yc8pFEwMkfpYdgBVUbY9L5eKWtlHBP8TS5FthvXPyM5M12aEDn88H3SUcIL0IVvua@vger.kernel.org
X-Gm-Message-State: AFuF++nhuoHfDhbUyi5RX2Ej80RjXmethXgtVUKGNhyKuStWthiVDhci
	miPLReKALUhihjkrTrZQjZXh9zCfPPPdlaiFlrvdGO8JWrHS9HKmiQxab6gu2JLst6U=
X-Gm-Gg: AYBFou3/dPd7eRQNnV1j18MXlxY4tBTx0bhh0R+4/l2yrSc/VU7zfXp45ywIiePeXUB
	jAkjK+IUlGxOk1u6N0+fcx6PVj9W16wbOz1e1sVGZ+VlB3dVmYyxlo6J+U4QqpHuuCDVTy6xJpD
	+TJdYz16TUiiOkUuBxO0YayX9sw594rxCFKOpB4J8EvKk8WJmkXKfeFxS12u92HWSkM70qkl6zt
	hsAvhnEyUvTxA2j8rgo5CIVGAIyoxf1RzjNwhUo4EhlKAInWmuUuLr3Po2E95vaog7UF/VBDCAm
	/SE9nUo+XNYqVwEXCx6QH95WyN6lNjaVT71mb3qEpLrB7I3ggBeSgsOCYDBG5egU8WnsBWUIKSL
	vmdjOor+2INQIOB+2FHAHjNcBWIEJaP/n0K9WQ225KgdXV3xaPsHBY+nG/wesYt7HllHGjghkO/
	Rd9wDizEpxFeMr3CGFRrT/ECvGWfUHfOfSHtExhpFx7se/OaioKukxZp9KD2j/Ftjs3wph4xHpG
	j2tVMMhdWv9n5Kd2TL6xyA=
X-Received: by 2002:a05:600c:6819:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49cf81fb1acmr54922535e9.2.1788522788268;
        Fri, 04 Sep 2026 04:53:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm5474207f8f.36.2026.09.04.04.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:53:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 12:53:00 +0100
Subject: [PATCH v15 3/4] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-3-68b7916e7a3f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmrEcsnrGBJeocLVI+O9+brnUFW6FqlooZlsl7
 ZQrlZxFXwiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqxHAAKCRAicTuzoY3I
 Oh1cD/4x23nTIQZWK3SoWzTz69RZm5zv2SQvYRXMjI/nTAsWspK6u3DZytcTIZvNrPbSfUX3IOh
 03tILSVIul2ljDB/mLHI5ISqXnWDwFSZrw5TPGhQAwuLk3eSb2shn7Rpy6+gyGH2gJJyYAamMrb
 S9wnHssvLy1A37Adohv7PxZNC0woy6kZrPzZWbsWw+xrc3tLoTAW6Nk7twCcbnYNdNurrBGaY8P
 EldjRAd+h7toDSC88y8Z/NsbepmHVPJIYt+B4QDcDeVZVzp4IWW98+SlokPKjDwK7aHGUQv55Vo
 0SmqSTbXfbej0xA1J3Ey7yJQyj0DyLaz4mEuvalyTzEFC7zrHGRuZLLkGiNOatAr91JRawxt7PE
 t5WYUNGg47apx/Usr6MBKDiFJcg2vOObOITZSgN3uyEIRlY1plfy1+TrlDchN3dnbLoS/cCxW4R
 ABtFaPiEfa8GpcUTRIX57wDOZ6ntwgxpWS4JqufJenxB4+08/7oXqv94mfwXT5LroFCQ/7kMVWB
 /yKwZqPHMA4d19ViDg10ZLSCIPRsx+dp64FfoHJwszTQxrIImNLphq0gKyQKc9rqPWM9468Wlvy
 1+Vg4ExvzOos48xua7GCdEegUfYaJag2LOU3kB2fY41GNScmAfODvW8m4HpCF0nFLN36sgLfLqf
 aF+qLSyR77k9s1A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a devm variant of phy_get_by_of_node() to allow for the familiar
pattern of having devres automatically release resources on the driver's
exit path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  7 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 490a7cde6d40a..2e3581ecb42ee 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 
+/**
+ * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
+ * @dev: device requesting the PHY
+ * @np: device_node of the PHY provider
+ *
+ * Returns phy associated with the device_node or ERR_PTR. devres manages
+ * releasing resources.
+ */
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
+{
+	struct phy **ptr, *phy;
+	struct device_link *link;
+
+	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	phy = phy_get_by_of_node(np);
+	if (IS_ERR(phy)) {
+		devres_free(ptr);
+		return phy;
+	}
+
+	*ptr = phy;
+	devres_add(dev, ptr);
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 71c2e16397130..14b924a88411f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
 struct phy *phy_get_by_of_node(struct device_node *np);
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
+						  struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

