Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54BD36D9EE
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229998; cv=none; b=c46qN23QERoN1KgCEIylfJZEBaBEf1GXU5LigvrE4wDTuNc98aoKL3/rCw/QYS4nCu0kTJiBmojiCDGAIUPgJWo6QveSZ3VwBBhb24VHOkNQ25d981Lj7kuVbkIG8NrwLI0GAWfatzNpncn48Afaf6pSk0ls88G5HJVDj9Q7nmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229998; c=relaxed/simple;
	bh=9W5ieynLgtxAnXzgdfu5gC5t7ObxwneC4rU1N6qv4oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYUvXQgApVaypnSbrJKH3bq7uiVqe1/qrRRCBXcLAzvkgNVULqTtZNuXTa35C4mf/ITph8fX49/XUOVWMX48lmOA5ZgiskUeXMF4vnOWIpNlLv7IxpnkPDrmUbBM8qMT8WDki9uBtsx4V3DtYnxv1kjIvZzpAO4eK0CSb8kvFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkCvNUi9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkCvNUi9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-448528f4e69so2815099f8f.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229994; x=1779834794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNDI0lLPNRldsjOACKAWSwRc2mbScMYD4jMMM2OXl2o=;
        b=MkCvNUi9sVlkMGV5Elhs3gW/BFazu8pMo7/QMR7abqIIHR2bovmvz7U2/rdPPcRWPv
         acuB27+u7ahwT4UTw+rzxbEXG25+1J7YDXOZq+NWLbAGbR/KtF9DkhtBlCmOPSyDCKhi
         aByvUID/sKYGCkQssfHk11Rjw9XBlbEFf71wlBFC7jumXuqHAqZKoLZM+X5Hgir+AeX2
         kaPifmYu9g4wM+p/ZEVXZWSPGw68/o73wKvKyUAkcIwcRl6uwqVk4ZzbA2U2/Jk82cgN
         zRJx/m5YVARvR2mgz4b1bkFPHDKFA+TNaTx6aVSKLDzJh1VvWJLyiSfL+mzvkNWZK/mQ
         DOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229994; x=1779834794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNDI0lLPNRldsjOACKAWSwRc2mbScMYD4jMMM2OXl2o=;
        b=ZZgGJkXTB5YD9BB5LgKZCnjl8g/HaDv8x1s5FaZTD57DrSgqzUa7n4EgHymhIWWSdb
         Pqx04XOR4YhycmX+dQ6G39FASo3Mwe7dyN4+BbKjK3gwIB5mJvSSGP9SkHICiH1+WX7Z
         7G0s+DtElz8xqiO8IVjCV8kowC/lFt5amEcobnfuCCR2Ocz7PU5taoImvOzAE1uaCTaP
         ZNauwVFhLZFrivOtmyh/UpHxSJLR6opD8BQ9wlvRZ3il83JtmdSegWDgisSShPkmvFss
         wiynv3wsy+/0USkU2sWVpLGY2Qvt6FJu07jaEMTtVROHd6BdXo9KO0U4gK25HJwuOSqc
         Pc1g==
X-Forwarded-Encrypted: i=1; AFNElJ8PvP2VWEZOmi58KKj+gt/zWTCOeCin+CE4Cit6myF40mZLl7vntxfGrWuM/YjoAgs0GnliqiWzgx8k@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMTJ+8RNuSn3IFIO2GWhhGb6SoV99p3nSYN6AB9nl/TT7XJmJ
	HQHs1AF5ybRTKQZzjT+B3O/MPvkVfc+pq5pOWoY5tUVb+ArLSv+JTr+M
X-Gm-Gg: Acq92OGXYSEjUjlrrP5EnB1EyBnrECu3MxhPTA++Hbo/dYPtBW+Ejzs9LncsqpflAXL
	u6YK9OCRMlBb7Md3IuSOXjqObPn08jvIycYx/6XbLDhqkCb2XnK9cxdx4HDojoCSclrqUnNz8JH
	yYpxxqDHlbJH0tGEZXzvitbhMTfWQ27cLQ7fJCKotP21c1D/79WTUxl+ZRDjbGZeilhx26qruV3
	yrtU4LnoRFXgbZtZV5CsAyCCl1p19PnPQ8J4WfGPCq7pXJ81DjanHNKdOzFUY8NE6/K/knzLz1t
	NF6vdytQbED6+EqC/GJ0unttB9wa16XL1Ce4AFY4Sj6JS+yXNRHnODncDnGTA8gQOA/lpjk65S4
	qHRevgeqAaLNhyUBfg+o2Syymrk1VlKeKT6WCqm4InK0f3xJtwUwENsaL+8Tl2B2fKz5csn6r3C
	+dHCa4Puqnm4j8sZp5sPsSuj8cYBvMGm6BG32TiOnzrPbF3h/iYpSKfrJmR0JW1GSnXKaWcWrc4
	9u5cezACg==
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr310445495e9.10.1779229994584;
        Tue, 19 May 2026 15:33:14 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 5/5] i2c: mt7621: make device reset optional
Date: Wed, 20 May 2026 00:32:47 +0200
Message-ID: <20260519223253.1093-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC that makes use of the same Mediatek I2C driver/logic doesn't
have reset line for I2C so use optional device_reset variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 3cde43c57a2b..fb9d9701bb10 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -91,7 +91,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	u32 reg;
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
+	ret = device_reset_optional(i2c->adap.dev.parent);
 	if (ret)
 		dev_err(i2c->dev, "I2C reset failed!\n");
 
-- 
2.53.0

