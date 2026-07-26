Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221A537A82F
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097020; cv=none; b=ImDf2/qODhpNStfgnyMBlyzzGTQtImcsuwoDZr5JldFNwxcyyNpe6qb3FNGoUoWu9MrfXcwDWPKE2z6uMreE25155GeCLUTnpYxmbl+0WUnEh1HsC0EzOAXHIYLyFdEl8sULwg59axTDN9ukwdoJdJ3WLvwjMyTp/orcrEqI6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097020; c=relaxed/simple;
	bh=aK14xkLqG3EGDnWbtEmsGllOMpRnclZ579vZKBksQws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBietoAlN0Mp/WntnyYNY5D2ea6ATmgUq49b0TnLj6NbuxEeFgXcOMr0ipb20bvMFxWBIuoEE+BJntt+8djAUtxpPo6ccPsRqO7rRiQ/4n4su17W5wI/LqT42P8hgZFhsLmY69oIw6XXUm7RFfB+q/jGlsoE2tNPklkr9RJKmPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/uBdHWe; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/uBdHWe"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4926d058720so3249045e9.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097015; x=1785701815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=p/uBdHWeXR4u6jmZXoqGyfgsfAdfbEF3Vtzh33Vl/XCgNOrJmz9Pb/znWlPV/jqYiL
         dl4zUqYOjHc7TtwyI7XJ8MgQnRQUTMhw6+Ur8UzJvJymLVGnPS9+uB/jPdFZ+q5JXEAY
         0S0c4EEGg8TyDXy0xC12b5lRNp5WKetvFFYzJ5z8X75DCLcIe0uzXtLyBZpemzOpDVGP
         zRqhZ5Ja0pTkVs6yc59EPcpiG0Qjd6ve5PVA/F6hgrosDZqVmIik3Hrao4vGLM+TRivh
         sRER+W2VVemsENt0AlWWNQFiSqt0aCKQpql0XPotvvaMwCaPfrK/ck40nXpd91Vhpt5T
         G5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097015; x=1785701815;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=TGQE8TOf7XTvqEsch8FHWJS+fJx9PjHxSG2yWvxPugUCMciPwGh4oyd58CABdbxiiG
         DbnMXzC3Xl4Lh7e0o1LQmK51W4nChp6dUP3zRaPyxmymW5MeSqyI0XJgpo6ZQ7RpulU6
         21zipntLCUsJYdfaDyku7Yd2QWGPgRUgKKe0ZEW3SYBrdIitnnvuBTRsLXz/JKuvzz8V
         l83FlN4R1liG6ErdwJPosAw2A/gAX6APcv7cbZNlID325Xk4Cf5ifb8FyBUCZuddDByU
         Duu3sG23PA555GDgQI58ibQTd9KARImRQbPDiZUHCxDwvuzR3xMSOwtYm3mZqoweABIv
         QKiA==
X-Forwarded-Encrypted: i=1; AHgh+RpqISIeEEF9vbV3rowIWwQc/Ojb0/+OsFb+gA3Y1Cx8apIImlZ6W5129pQOS8mkZlGMMT0GGIWz9WLW@vger.kernel.org
X-Gm-Message-State: AOJu0YzpthRz8R2rh3J3R6yOrOZaryhzf08WeoKerFvFOcSq9mpXgzLI
	8vV6fLtegk9DZRdSoAE7WLMPFtHF8QVcA6SXbHA4ZqG/txXqqrYt5roU
X-Gm-Gg: AR+sD11HVPF3ADQvjY7XZwnGnHkTOfYV2j0/b80B4d8V9daqkpu6D6QpFtVbx/3zdyR
	Ef6OiooNrF7MEYuSdZx153TMoTBVtdNmS4qT51vWqlMfrJpeYbhTGQGPEDJKbSKSq3BjQxS+N6W
	zvIsisFsD+NtOWAPysoSykI2Y2YQF2s4hDbYTT+VQVxIR7sDsBgkwwuLC5rr8KIe4PjDqw/gMiN
	rIJHsr7BBgFS9tNPqLMCn95RD/wkF6MhlpjiP4snMPnrdOdgKAaz3bUqJELMLk6KCHoml24jqck
	MWl+aOW6rwt41OoMee1RApfAxQV56O4DRxXntwqG0jV4hIbBhdG1efQB680dDGK8o3EEYQaHUa0
	Atfg0SMwkWQtgrIJZhc1frGHXNQtilY1hOKfAVZnII9HuLsBlgL+ZRYS87PCjpheXjh6npJ9ULz
	YBLUJzJto7l0CWh2kOCMwlkG0Gi8K4dHQPi5WuIA==
X-Received: by 2002:a05:6000:402a:b0:47f:5369:bba with SMTP id ffacd0b85a97d-47f9fc901e8mr7976564f8f.15.1785097015393;
        Sun, 26 Jul 2026 13:16:55 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:54 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Sun, 26 Jul 2026 22:16:46 +0200
Message-ID: <20260726201647.264108-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726201647.264108-1-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
Reply-To: robazza.alberto@proton.me
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0

