Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF8343F095
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228767; cv=none; b=UVT0CNgzBdNiWQcVR4G3PVjA1sAIjirn+xrYt3/5+fLNmbXrGj/V7CtC1Ukv8ue8fuMButQ+XieRsxE5I99yy+3ggv1MYlUGTS3JrRKu/bw7hcrVuMra6dvEzKI3hhd6WSoVHtPh5GHcULPiBJ45mCFkXWfFG0lAB3AiCzHxzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228767; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hp1+p2HH0nNZ4HtjPnwVGqB41g2fQ19kwofeOI64LJy0eXTggjPcg5W1H+wM35FKF0EqhRBn4SetYPQCvc07XCDV0bivilLysUfn5bY5Zk/D2cwjw3ra2yCoVx3P1HXEYmVLMH8F/vpq0k2dIaYI+LRMdKkiYAGDDA5tLu+9iYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smH3jAQh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smH3jAQh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499acf0fb55so12837635e9.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228762; x=1787833562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=smH3jAQh3vCdNjEeaF8UD3BHn5lWWVbhOwqm3FC8giSqd9hZwfYsZeeL4tdwGGs1Cu
         S3i0NEZd+bqjXPIAOuWVTA332n7IMUoZqGQaEvDtGTybVuCL74ADlT53Eoi8vRiJ9ub/
         4t1HZdFxl1kQoukgKuVTlctHv6Zo2XlXuzP3xb9eBt83EEtYcgmUCU2aGt3BwjPWZxi8
         PtRyJES5t5KSkshDSzmF7g2sA2rZfhP55t0MVXNOMGxij+bs7nqragOUvxfrn8akP4in
         mpBwd1m0X1BbFpraBDCseUUMe7DQB9xOr4WBTrQAs1QdlLlUo5OFPQTo9Jpc3sTSLXMt
         wMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228762; x=1787833562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=ZJC9yUESEXm/xt+lH26eKQq68PIl40qYsbXFH0NHulnpwVLdTPXUiLC8WOBLvz96m4
         7re8vCCdDm3z6SMWrgd6Kqb5+rFaNtojo+5eE2hXifJm+orY5PHKkBvVk/YH15dSwjXW
         4y7gZ44FFIlFLBCSSYUoLGJe7x68PaJsThnoTIgk6do6nrzw5Pf2DQIaqwFLRmkIPdG8
         rmhDW52gFqf9m9Yx+1CHgTFVXdPUOmWNf8p8oyQG3UczJXtxOX4DH622TUWs96lgb5rB
         ZH3NlZTgLv4c1GKDo7V9pFNvKeVe1exq7a3mlD781KUuujoyQ9R5eqze+zJ/O9s9UbPG
         VXsg==
X-Forwarded-Encrypted: i=1; AHgh+RpQJLHHKoakOf7A1/OcOxAkkTlRtG4zHEXH1NRZffhK1Gh4gveJtY8Ukrh/+OBAIWtIRiMu7oCfn05q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7uR6Y+S60o2jFiPM1IilBbvZen7Da+2Wy7Fu37Sp79dSRXWSh
	M7CXpPB8+yMdszIq2+IkxVzSuyN5ks998w7uchcOTcFgKwFEp2mLiWKl
X-Gm-Gg: AR+sD12t+4/Yr7UMVxJhnGg9ObpTjVApRtbFNyV7W1cTY9/d5CTAx/gSoBhqH+KPJpt
	5VE18s4NqTaaFq6mrYGV22BkTx3b2L7a1/i2OnEAZt0Y8A/DSyjc1Tpxkhrmo2FRiScmdPuwskt
	6GRYD1sB4yGFHXuixtV3OUXbygNp7a3DQ/9wLhOkqd1R1qOm4w3Hyp5xuliiMpXydscS5SjZVyf
	t6Wn9XJUFOQJeXvNdxgxSaS449x/4g2JwftYS3iQoMae1C7tQEvNo0UUzgb1sCKU9Y1xLSbN9tg
	z/1cif9o7tu54XQvUwR3Z13OycBn2d65gg3bkdbv0zY8AqCSE8yvxqvi2m3vkbSgNEsrDt3UvHy
	88CPWR3lPK06ODoYCXhgC+TSJvRqLeS7F+igb5vjCqO6nyOVLa2KcdYxlBN260+zxj9yDeHQmK9
	LdATcQYVca1W1YUWa0cOkwZCuQkegOB7Rp2YM9VrNx9Vwn4Kyb45qKiw==
X-Received: by 2002:a05:600c:8b65:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-499aa1722f5mr231760135e9.6.1787228762272;
        Thu, 20 Aug 2026 05:26:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:01 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu, 20 Aug 2026 14:20:00 +0200
Message-ID: <20260820122242.120039-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

