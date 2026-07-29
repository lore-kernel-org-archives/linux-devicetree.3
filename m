Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B4337F8DA
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347508; cv=none; b=kcA6FN3rtZNKNvAVwjI+/UNswM3DbVEq9NkRINrdAdF33efCVAgYK7JdrRGU5M3K7VM7RYiSC0V9fhmliA303HOpSwRHDxPXwQ1SkA81xZHx71h5ZbiS6HR7AkRdHesRDAy3ewiWbTUzudkxAI6XHkxmOz2YsrInVGvQmPG2jTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347508; c=relaxed/simple;
	bh=skRVUdaTKnKxi/OizqE0dh29sfxzdtKj/EJ1F0yHHvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSxZ0OK9+Z3kYAdLmQ/GmZu9iuCq5aSS+GHZbPfadnVog9qYOK1/+IU/JrwLXBjdulgJJqyZ/I8hOEmUU/DoX14+F+o8NmyTxvJfgsNSPV7PwTaxhKqhz+bWy3LMb5N2+SvT5XtuRzFdvy68MZjnMOrh43BxQeR6gOm18dthwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNKQ7aNv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNKQ7aNv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso9250095e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347500; x=1785952300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bz0ySSPwLkjCZQjoAOssGTzCtgnTiGfSJWwyPJTSyPU=;
        b=rNKQ7aNv9/mKZDKwDg5j1Pmb6ebTrN0ib/x5y8Kt3onfsQv/NNdS0HCHeE+dI2woy5
         Q9uFIx0LG6H4YqAbci24bGen1oNPTi8Sk4wsJ/IbnsoavToUxyghtmWbYchVkKo35JXc
         s5ZBpVm/jrha3q+8JJk9DprP2gNw4LTt/som2mkL1puuTc6WNJ7K7wsQAtR740dIppav
         pVlsrYjev54ANRb+CmZ/KYNF6sVtKYh/j1IIf/0Z1Px4HUoAWSo+rhiRQ7y6TuYpTsi7
         2Hl9EDDx8BgmBFimloyXv9C8FiKjGdp/xviB7s0sBJItxQetMgFdn4Bf5jCHi/6DnVbE
         CC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347500; x=1785952300;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bz0ySSPwLkjCZQjoAOssGTzCtgnTiGfSJWwyPJTSyPU=;
        b=R9ugP/vOJ3rhyKvLYKEbOBDIsFA2Old4ZKHwznIRU8wgQS4DAJAS5FRU22wGyaqgim
         71ltyK8V2Lze2jMP7gsiwSxhsDdjW4XflMuQTUD7Ikh+4hHNNJ0tjn35UsJkwHeqQpGa
         7mtWEwDjJj1K+n7Ex+qTfdw69IMDB+JBNT9snZQKv52RD/y0y6nUxz8+DptJJ3OYvWk6
         FxM2QHsPXqKyhZBFlWJL+XO7F5GLegOEMn2gs/zp9P7gP/aOlxq3hNYBct6y0fjiOOt+
         zjSNMx3dADmopE9CrujGErYRxoYvV1DSItILqefwbox5YzrGKK4Jldoxs/9Zy67Xv9C7
         0K+w==
X-Forwarded-Encrypted: i=1; AHgh+Rql5nOP06bKl78rX8azlEuItwZh/ROth+zlKosr6SydaNQUbTwCisPDy8h4atu4UCaxBXDdsf3lfqdB@vger.kernel.org
X-Gm-Message-State: AOJu0YwJwndIYlpYxCRYSFq/mXYEhQoivQWJVkFaLMsoyn5DQH9vG9La
	RUNWeZn83Wa54Mzi+LNmUbiAWHZOyHX/3Lt0bVTs6UxEx3Vth9bLYu/S
X-Gm-Gg: AR+sD10IW8O3z9sX57jU+t8otsV/Q/nWh5xxLKYBU/S5z/ql9J+CStNNS86wemhKR+Y
	KT0BCHFpo3VENmgeo1uGUm8XAqkuX4VraEiX5TEtbFl3NinUh1b9Ogvxt5XfAQxcCM9uy3daTL4
	5AfKECaW6Em+1udxdH0Ub2jjJe0LqMxSW3OJWK8T2+ARk85A+jtEAPoNj6g94xp+EfhZuI2IBWv
	EaVGMW6pGMFVDh795RyOccRHVN/j/iyeAS/L3zWY0yaJQFiDdrq25XwFnQxDe3AMkxt8ru1d5VY
	YuUEJfmqQiW0JZXtqmY28wFneEq0BCTzIOZEDqDTUtmsNuDsF+x+o2rfHUQN8z4tn57FL3ihMT6
	72mnn7lsLpg2aV4WqMwS0Ms40zXCAb8A+8xlBLzWV+3z5g7ySHkBapMKxzwPDt2hKkOzdvLwr5V
	CslUtzinyhczr7Ami1wosWot0p+ru+jYYl0QorENi4uZshhbPv5qV5sB5a/dv4raMrSxhKf1TNR
	WqWnYI5qZ5MULAjTT+KQg==
X-Received: by 2002:a05:600c:1c1a:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-496c60c1c4dmr81087375e9.0.1785347500402;
        Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Wed, 29 Jul 2026 19:51:33 +0200
Message-ID: <20260729175134.92909-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729175134.92909-1-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC

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

