Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A9389E02
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 23:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864700; cv=none; b=gVo3M3cjlwg4NlrR6t0Rfly8jdwmehdEsTfBhxJ7KwT0lF4/+pERm8RVsceERGRYKb72/zHXCK3MDYwzRp76hgvD3J7gx402XjNgybYGm1/R9FxrI7SYjxz7hDAUbK6aQZxbHlOp6eT2H7/C6dPwP37vaZklXqIjLidt49b7lUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864700; c=relaxed/simple;
	bh=PX3RRvN2uw+9v2vWDcKKkvjMH6VQ8rbrFfzvSFGoTrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dW69Z4Zym/mykim963rHESdPk7m8t6WX3DsKBslZXR5ZckwFodsxVIsnQeFjMc9g2GrYPBtOy1f7tiLWNmEFmqTgu8izvCuTc1BDO7OUXkGqC3MRR0TTfiWFK1VK2ekbvNU6Kr040z3gR1+BrUmU9uPeOimzUvXuub2pCKXLcWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=XZua8WeG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="XZua8WeG"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso1507850a91.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 16:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775864695; x=1776469495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxPy7nsbAghT5E3uapDIu2fOz6eF6mBtTMfx5Uz4VeU=;
        b=XZua8WeGfCr4k4mE+rvwlptJ/p3wHvwzwxzlTBP59YNBbtwLDVUJX04VY62G/+w6Gq
         kYHn7tYff7CvsOeuhmHIouAZI2GQn3uYxEFofP30JlwRKNVQpU4hI5JIMU3A1EtIaa20
         KVBDBX9/WuTdnl/hQCfYBq90DjR7DF2c59X+p+1s7eS8yuY3wn5KfFJO7Am63kswYaZN
         FaCzmZda1ifd9mSKZQjAqD+s0iUUgkZ3SNo8OWOmGszMPXTMja7hKW1vTQcGy1pFMGHZ
         HhSrRMH1mn/nCw4SHPm++/DD1Kf1l2VIUS/58wTDl1xBEjddormGlGCuIZGnroK/5B7y
         Wtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775864695; x=1776469495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xxPy7nsbAghT5E3uapDIu2fOz6eF6mBtTMfx5Uz4VeU=;
        b=copWu1hIzfYMvcjYrZlXo6eIezMgcFRgP18pcQB+xZTaJ1DVHOJuGeSolus1ti2OAG
         JfqTC2P5XdMUXz/JK/roi47uf8tw0JL9LfCsl/02XJiaSr4cb7HFY4beggIHIW2TI9Dc
         NDA3/f4HEcvTspumwTq7vKllpSyWPE8K2qQTVvGwRsfK3qwxky2cVoBA1ETKf/oruodR
         I7irY7qOx3wn4LJE9FjcTwBUKviG6n1WPfgFbJzgH75T6la0cPvYFVCRzv6ZTjy4zgxh
         8X7N1MIDnoi1ccKJAHjW3r29nGv3j3ADlbRBzCnSPEGnwLAp2i82aLL7Xst+/YPBTDqJ
         h8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ5uABas7Uw6U1+xnINkohJJYex5UmLARauVlTUnuxO9+0UyLEifZLjSUIc+L05HoCQ05jTNuotHHb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6NIhLfoV3tBppZ9l7eVeVYWvxBXI6gmHJ/J0BOSOuDo/729K
	MCDY7X2lyDHQOBrIVwqBm/q9vC+kdyJNhgJNXnRXn24eMx/OLWRx0RJQJ9DvEO8MIfE=
X-Gm-Gg: AeBDievcUToDFilhhvLgcuQXFpK4Vmz9FZ0Sz8zB8x1vvxbv3HMiJ8my5v2QED7mdV7
	qXZEd1Sh3s9d7DzUlr2opLHAhwgZAXXbspRQErUydHj41uRtfCLTcf7gcAaR6Kskg0GPi3r8wHF
	tkykwkgAIqy/uMggJM6MAxOyacAY6tKWkJs4w0DlIOB3t8eIOtELQiLvNsocEN0lSqjX0jCaBUT
	74gg3OQ2FG93waxDyE8dYTrqJMwXAsljtYerogzICb/xUjKgr5xbhFbAHu/1jE7lQ89tk6uNxz4
	drW7P8GRtODtIorpZKV4/MYQMUGpV5l6e0RaToatlFgJL4H+EJS9Z+nahq8PM93m0g1pwo89tgc
	vOHjMVw6nycPrU5W95h3fEs7VYuyK1bTjzE/Wn+fOnGVDY7uB1fngMW0QPcXSb8r7yNiTUYAlyQ
	n0x10swkyhcUgipXVaWL8=
X-Received: by 2002:a17:90a:f945:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-35e427d7f46mr5220267a91.9.1775864695045;
        Fri, 10 Apr 2026 16:44:55 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e3517f2a0sm10472699a91.17.2026.04.10.16.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 16:44:54 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Fri, 10 Apr 2026 16:44:38 -0700
Subject: [PATCH v2 3/3] pmdomain: arm_scmi: add support for domain
 hierarchies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-topic-lpm-pmdomain-child-ids-v2-3-83396e4b5f8b@baylibre.com>
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
In-Reply-To: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=PX3RRvN2uw+9v2vWDcKKkvjMH6VQ8rbrFfzvSFGoTrc=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp2YtyxxHvOuglRXsHxemtA1xpH5tLnawaN4yYq
 oG8j7wWxguJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCadmLcgAKCRBZNxia0/vG
 ZWS7D/4ubuhV0GKzqz0HTWzwuwk/cyPQdJs5BD5yPk3x2OlDujuArp5KWz9Zb862Sl2RNLa6EUB
 VTHLsDJYzazuaQiunBkJH3uoMnSTIh0uwRh6OaOVafKsMld/NWyfDh2LKusn3S3ulc343Nv3IwT
 fr/S5HZiJyMHxNVUoS3j3YQ0Q9I+d5J1LrrQAalSGOlANEvwyIf+/p0IJ6sd1NUVo1Tj1AGdyT/
 rtibZq1EakyZsTdWvNLe+utfRPHY5aAC8BedesuQWRbA30Gy/KK0N9IjxE/mwSaLDpJJPMgZ+MM
 d/K8sRQS4NsAVnmdj3kE4QznzUFzCgf+zXzcJCTsU9RSC+QThJgTUrmogCCEiowaqZGUiEtTUI0
 giUEDl/doY5z7UXNUX16ImfEk1cUUGefUJH/CV7r7OHXo7ECqHBVw92UkhQozOFL1OuffuNuX/i
 b4siw+J58JNN7+bS2EvW0otNbs7udqEIlHy/GlNs7FIWn6xMEmselmWU0phneTxuDe2Xuwe0MMQ
 HuZzQ9LvL5DC0PK8+VAJGxUtM2gk+j/JygVHXWPbyO567XetOAcybWkywZokcbHmrAewVzV7o3+
 pDU+5g6kuThE4wZmtwDEaTTl9mnxQXkqSaSJsDNSVOBj05g0o4wM7/U7E/IdyaSNOJVIqPn/+TD
 Eq7vbGTMdWb8EPw==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

After primary SCMI pmdomain is created, use new of_genpd helper which
checks for child domain mappings defined in power-domains-child-ids.

Also remove any child domain mappings when SCMI domain is removed.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index b5e2ffd5ea64..6d33b3d62ef3 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -114,6 +114,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
+	/*
+	 * Parse (optional) power-domains-child-ids property to
+	 * establish parent-child relationships
+	 */
+	ret = of_genpd_add_child_ids(np, scmi_pd_data);
+	if (ret < 0 && ret != -ENOENT)
+		dev_err(dev, "Failed to add child domain hierarchy: %d\n", ret);
+
 	return 0;
 err_rm_genpds:
 	for (i = num_domains - 1; i >= 0; i--)
@@ -129,9 +137,13 @@ static void scmi_pm_domain_remove(struct scmi_device *sdev)
 	struct device *dev = &sdev->dev;
 	struct device_node *np = dev->of_node;
 
+	scmi_pd_data = dev_get_drvdata(dev);
+
+	/* Remove any parent-child relationships established at probe time */
+	of_genpd_remove_child_ids(np, scmi_pd_data);
+
 	of_genpd_del_provider(np);
 
-	scmi_pd_data = dev_get_drvdata(dev);
 	for (i = 0; i < scmi_pd_data->num_domains; i++) {
 		if (!scmi_pd_data->domains[i])
 			continue;

-- 
2.51.0

