Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348FB433BD9
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788695536; cv=none; b=sAnAzKAfS9SchbyaerV4eQv8h6dgvZxAdck47FXNafivRc0/lRiS8FWNNSqnx1JBlg/i0edXV856JBHeLcuuIaVnJcgTxj3v6B2nFB5JEcd0YnzTVBBb2ANeu+S0fhzK3KltV7Ex78W6LqU4stk6z5g+OKNO0vsMcWJGgPTrGsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788695536; c=relaxed/simple;
	bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9TdZXoZjroftd5l8YwrWJ2Txgi35olUs3bQ6hS3e0M1xcov7j1puSzLF/M+R2JzvycFV45GdDQPa4gqcNYJoMoOrnZnAAx6icbhTjow4jOwR2nqHu0V0qc19KbFL7Sa6qb6V202pqj+v4Bcezqn7AMop6+b6Ut60zFArThUMpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ycBRtPO8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ycBRtPO8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so21979175e9.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788695532; x=1789300332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=ycBRtPO8p3If/uOWT7R1MqAjU/ZTez2bvHfLXuOUybnvLflAHhteW1Dbj+tFjdhOg4
         Zy2HLsIEcwKZp43mKWgUYx5A4bg+m7T62UGUEoBeJUgUJjAqUBrgU25JV2kQURpTlQQ6
         Czan0YzKgteyJFz+lRY6W4/U8XlJiSYnE30NeOUQfoKfz6OUjIRR4O0mh269iY3PgjI3
         gi9XgZdE07daqfRIR9d6Bya1nR7Q0Oz03AF/gmGJ+Zn/Sk/rYT2IuXyQjxd79ktBVMhj
         MP776THpWvPaUm+7UmQG3QRRb/4X9FOjfhsGXSFuJKhCYf5TrF9BhbAPvOeseUFQOA7s
         E9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788695532; x=1789300332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=DluwRDGRNbQsWKaAHnv03EIkEgJT+GtXCpv62UafsWlxVVBq8UFMFgkPjL1bGL2nCr
         MBIZZxXhGeOfLVtaUxDiTa7SeobIj7h9lEnLA/nCe/ERqNBKXSOGufG5X3ijLe9/C8Zm
         +gl5laiF4qRuL3+Fi3ak0m6nl/XTWyX+0pAP3fzV83unWiEKdtccV3ZNA59/T4o88irJ
         bEKA63+zSRLjnavS5w6fw2IqWTcbOlSsZitMRuO0bGEgXjy4A/n8YmnY5x1ef8q9CR+G
         G0ROuxF8d+USJm9pcjhqAW+CmJibjp++IN0XCW758COhE6qS2Lpeu9MisQahe7E1GtFB
         VQBA==
X-Forwarded-Encrypted: i=1; AKwUvBx5M+5cfMhN7R2rpQCYuMwB0pvHIn7X8PFwfqoCifKYxCyjMVklfXkzZDAsuberoEiIqPhVv4dSMlqi@vger.kernel.org
X-Gm-Message-State: AFuF++k9BQUzCsgErVK7PH0xv3vHIvGznyUH3H0+jBoxUGm8N2nhVDXX
	9E/xO4czqhyqi0F4JIgCI22mriSRFmssCMyxDyzl1feHzO9Grc2xh/9lSOxvkeIR8kg=
X-Gm-Gg: AYBFou2aXsS2aWR3ipwPtenJKuhNMzsJaxAhrBF6XP5I60Rw2pHQYGpOVB4LdTQWzod
	jP/8I9fBtfiJVqdtv8H5f9c710i1zEt0I3sowwWeXQbYC5IM0A2lXJhjH2vohxpzP21mBon5+pb
	tuJMfOTA2qdFW+qnaV83u9oiiekJ37jXBt5iiyHgZVhme+RBxFJlsKpRnuZsm7/FJKkYAZRvQrc
	YgvEiTosa6k3lXlqGiQD26GQptVlrWpyWHPsmjHcs48FpcjW6UC1yGI2OPK2c/caDrPoCbGWUK0
	VdSbVngPfHMkbXsOYxOqzZEjMPy/fqGPsHQmV0VXsBBkW21/dQBQx3UhY6LPnxyltpZW+zFHPMj
	AEqSdxYyB2cnw84/T8Ls5KQqb29+/Lo1XbCodFboKGll5XyvvIdDDD0KayI+Tar6JpVIwYnYICr
	kJ6Y7i1a5YyVsl9iRiXtSV4U7q6t0sWAsWOsXekjAACMbuutqNoohubUIooNSgiFQ/ylhBrB2/
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr167414805e9.4.1788695532336;
        Sun, 06 Sep 2026 04:52:12 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm19337821f8f.3.2026.09.06.04.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:52:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 12:52:04 +0100
Subject: [PATCH v16 3/5] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-3-f7bd68b5369f@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnVPkhgJEj+MuSgyHrBaFkz9XqtYCTR6R+pqF1
 i/H/gSspV2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap1T5AAKCRAicTuzoY3I
 OtBAEACdIbMNteN9fIlQi8sud4+XXBijDxHoP6CT55S3kiK9pcb6if0/ESIPuE9WB8O5czjY4Em
 Z8xSqrCOb/OcUxbq33GVbInFzieoTTTN3cv+GJCWQk4eiJJLIk6RuEirjhksxUIp7dBBg5cKr7T
 hI2BSMsHBAs/Gpmh7Lyb8wa9Ik7La+p9unXLCXkkmzpkrVsqO54dLs8UQlM+HF0wZISWB8RzIiA
 /L2yFa14iwie0y+wYuEE3HzOIltEK7tGrwHwsAEOvhgb2aucn2iOBrJbPTrHOoSOFREwG1CsxzQ
 6+WD0Paz6Y9PJ8D/ZiB4UM/JoffzHDycdokAsWkF8smWh12HSqUO93+WoDX5nkqFuMAp0jwjw8A
 gtrLFNIlu4hfDprwN92bO3XtPlYWopNHS7BkspS/n2uc75t97/V2qx01UO/cpLR84eeWL8PBR+d
 tMHtZ7x7ZqngZUJJ0cRCpEvhtvNwR92W0z9Ngkc3+K2ia0VJAwbYwJHqjvJSDKbon7DnwYSdOjI
 xrY3WmbrtWp9SXzRuATt3/ctLEQcnTMXtDGx/TRAU0TWjZUl+GxkimvkTGGX406gn6JYRQfswZ/
 H9bBrjUAaF2qOVG+VF2Wg16PBCI9OV988T7IUHQiEG3WzNNMdSTzeAYEg6A9dwMk/ZCTkLSCfLM
 1qlOVKIl5v4hgoA==
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

