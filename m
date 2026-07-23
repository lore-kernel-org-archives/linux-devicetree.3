Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117AA43550A
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799611; cv=none; b=Ih5CEo+ez7s6ip8kc9AbTgZjbxynRwnOtWwxs01xsoi3wn1m+tIj0tHCvGz4OFUl8tHUzKbQguPXHhzEr8mFWAcHzw3zV8d+oc/1bRRB3XfV8d5xTw9NlubCjYiEwjy8PT+VulF2aF8VzK8ecVp/rVr2EPoOcgk9JeL9qhL55lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799611; c=relaxed/simple;
	bh=BJX69CI3rhPgFIC+UOKYakZAgmiE1nvMLkgOXW1N7vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dh0zQ616W/zE7j0G7xm5T84UWVVcL28v4nK57gOmfs0f1RHjcA7p0b81hROxQCQ8wkmK+3R128WiQTsWMAeZGcPjiY+n34HMEiVzaiBwfNAVTd4r0r85VqJBT/fZBM6IrO1v4uXPsTG3/+F+n3A4CUC0HpvGJmLuRegkx6EA71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lPLYaH6z; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lPLYaH6z"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso392260f8f.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799608; x=1785404408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=;
        b=lPLYaH6zPzYd9vZtVEreChvHFwkppqjdm/CMRTxFxt4bZLAIj+7ZelkdyS4UUux+JA
         +0IbkPNTaWao5qNm3xXCL7A2LWV9igXzdja7B7F10fXF8oHHKGeYzqo2ilScBdkSRuDf
         b7hZztVqIdHNlHSoGoZt8fkPGq2ap5AGR0xMOkjbAwSwDwITqF/LH/jZQM2pbXUw4fQl
         z2vSB93EBpiYYg5LIzsQb3WKYP54Fbzl64RLZPH5qEWl0I4YAsogIFqscfwrLUv90xdT
         cLe5XvoqvW0R//LgJ7XJipEtkYuuqa8w2djrmLaZndVsdtL5IuLH2V8rCKIjl8Na/Mv3
         eaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799608; x=1785404408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=;
        b=drpzH9oGf25B587oIhxJtGFpDHVGiMUSuJpG0gQK1tUqvkvcSSxm5e8KkjQ2xyzHmh
         wngBBPNqhUxJ0NUNUN1JbfieNMS4jNTP16Ks9mRKdGOjHd0zRNf/eQ37GgXDfv0DNLRs
         SqOAFComGPmkwJlscIBSRE+QTk3vDdyxul6M7yrgpGb1RiqRVo4MJhmtw9RDNxKzPdtZ
         ffqIrf6BS0tV6twjctuB6s1Ta0pWZJUBg/R4nWZZk3DbSMstoH1sTIvM5x3CJihi/2P+
         xWFKKm6Sp9iBBoYyFrAC5SZmRh+UY3vtcNkZjya/h6IKhrxoSZaSMZoqXr8eJTfpm9Lj
         bVIA==
X-Forwarded-Encrypted: i=1; AHgh+RoMQPKMn1t9jX5MzwatihoGEiir/Mw3hDeuYpvGKLKcUEdILP1yP4WrVw7U5iJRQs0y3APMI7p7P8nE@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2dFlL4PCwAKqsAjAFxTXSEGQds8WMAUcheZyzL1Ydn44SjHV
	ZvEgeYzh29iZn+MNLHY5NL3UVD6uzv+djFZnvjnAYJN3rKK6VNWOD7J84J2REM1TJm0=
X-Gm-Gg: AR+sD12q7Bg7qiEnncgLJ5lX+J4KJQt82UAY20TD6D1ERNkAunS01PBQrdfstXOBhCd
	sYPjBc5pMMxRCA1MDGqFsr6+iP4O/h6w6Drjv3D6O8MEaTaJLTSpFZCJ7gUAkjgifh4M/LLhmTI
	AD50afVjjprHZIr9o9CzodqRG8Acy3FS/KvAoq35elj/k3wRpQmIe4HffWkD/Q523+avyxAsWTe
	cvMc/YjnI9rXXdTfP/1/1FCLiEfMAx554q39Ut+rv6aCpZkoaMlsVvecV3TZMoy7leHZpr1PEp4
	1ERItreZQIajdyVyatGWZGaAUReCynKIb7J72XarQNoWSyfyZb2URYR49q/0VnGftq2C1/WMkdX
	75IeuaFvGyvsFgaH5knztJ7lvDKzEZ0HB5CgfhTcZXEhPTyt5RCGWMvP0zWh1PxORcIS4qGot4A
	hQ
X-Received: by 2002:a05:6000:1883:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47f8d710ffemr2834486f8f.3.1784799608255;
        Thu, 23 Jul 2026 02:40:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85b9a6d7sm15256235f8f.2.2026.07.23.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:52 +0200
Subject: [PATCH v7 2/4] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-2-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=BJX69CI3rhPgFIC+UOKYakZAgmiE1nvMLkgOXW1N7vs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFuAonlP7DkbS7g2+GVMpDyLmLNQ/yrcz3K4
 GDc7mIRf2aJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbgAKCRDm/A8cN/La
 hXuMD/4yhmqW9LF67++G2u3n2Ore+4UjWpvySCijqdBgw7p7SquucWZp1DLDI2TxsuNXpFv4Vu0
 ZJ6wnSE7VhjkXU8frv89pskHWhdH/uQzwHyFfrUH+uS2J6S95Iha5zJ++bum+V3v4wZ6uzar1rh
 /2EhCsUEVeoG+74PZ5izkjZ4Im3XihSvPXs4zOGX8GGAEiMNRPY6pE5eOXlOG5XPfDqKZswX+GI
 wGZNcGXAzU9CY2B2/wTgy1bfmtZo9F09IeQ4YrZ+a6mTQl3Gb7qVk/JKr39p/Jyvd/tlMiZxkaJ
 2qQZLF+SSPslhfmDmoxW8DGHtln+LI94LvPzjsO2HotayRJgELlH5DBiyE3vV/ZOFPUhHMx9PpA
 MsSr+nobCw9ddH2GmjXRDtQopTN8d80N8jROx5c2p3Jivgz8Hcg6AGZ9bl59BhKnImTIhtPsYGH
 ngyF3AyOUkZlSbu9cHSaS/9+HKDCiOlhH5GOpn/T8lhyQZns6+Ukw8CDbpUPK1JPYMrxNV4/6/M
 6EWg730zZZ0S0jAvdeofo3VTd7PTXG2za6B+PVgJ3H5eOcX5OtZqIMFLlef8EEiIyFpB7LsyXUB
 8+c1NEs6MA0n+m97jU9jrmh1yzs/9QvvoBFaaAbowrv2R+zAnTD+8FUHOvFz68EDYA/A44M4wrI
 t+Eb0dJFejElW5w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..c385e0160f13 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_mux_internal *mux,
 	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		req->rate *= cd->fixed_post_div;
 
-	ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
-				     cd->div.width, cd->div.flags);
+	if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
+		unsigned long val;
+		u32 reg;
+
+		reg = readl(cd->common.base + cd->common.reg);
+		val = reg >> cd->div.shift;
+		val &= (1 << cd->div.width) - 1;
+
+		ret = divider_ro_determine_rate(&cd->common.hw, req, cd->div.table,
+						cd->div.width, cd->div.flags, val);
+
+	} else {
+		ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
+					     cd->div.width, cd->div.flags);
+	}
+
 	if (ret)
 		return ret;
 
@@ -143,3 +157,16 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+	.set_parent	= ccu_div_set_parent,
+
+	.determine_rate	= ccu_div_determine_rate,
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */

-- 
2.47.3

