Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B813E3C4D
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785090131; cv=none; b=eXUNWJnNF/0tbw1f6ZKeNDocIHTsC28vZ/R+xgxEqeuYSNJH/CtZOwCMvsZWypjsr0DI3rGfIj+vxMQger8z5gTM9HXog4JMJcRxQGHXo2Q5Q2SdTBUoUtoM8Y73J0XddBIDZeiHv/3VJCE+Bf/f3H4n7vxqAxtSGlRQWTypXS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785090131; c=relaxed/simple;
	bh=jWByeww0ioS0EROsIt8b89RS3YluucAHA8QwppJdOa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBz21Otymlcgdjd2bWBUzePAdT1BqOf0Qu1n+dxTbeCk5z2HaqYR75T7hXXDFE8NqEphPguIfVt0dYnLVkijcVI1Kil0V+Up4DfVIneISwSY41nW42AaI3K+irA3yAyuo8dwPJyodBI7vLnJgUcze3zYgFnXiwA9qb6wKYpPaSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hefbk7XS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hefbk7XS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13135665e9.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090127; x=1785694927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3SlIwUm5bt7YVM6EyfiZIEgRZEN3wUHTuCE/oWFfY7s=;
        b=Hefbk7XS4qj48G9TCtndMnUQqaqPyT9aBTsymv8gr71Y+OconxrbGI8K8MlN4kwwD3
         HWudr9brnqSstIk31FcP/3DQcsngSQ/irFsArf7qebJ28+Alq3nywfrc+KceR7sWrYT/
         TjbGu0flFut8BFJQXNz/TfR1TX3CKNK41N+H2ztih3wP88op/BN+7HUCwTrdDxr2FIyK
         1gbzrFYLjnlS8UZLFfT4H529OU9svOl7fmd1z02hMoxNnnqPi7wfonv77Pcq8XzeqqoW
         tUEbaJRhmWqnWR1Cvr2XVEuE4OgbHBH0O75fNVf1/u53hKwBjnEH47Njpe+gW6dQItxK
         m8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090127; x=1785694927;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SlIwUm5bt7YVM6EyfiZIEgRZEN3wUHTuCE/oWFfY7s=;
        b=e2x750YAY39SGNETPm2zpIiaBOW2LzXneuNdTnBj22EQmKNWNhNRUuSQ/9zAcwQX4c
         pQdAoYzo0G/yj8o+5gNUz6nBYEm4lhYKeZwUXCYYNItadgTO8BvC+P7zdU8FxvZdHlVo
         xyPsvW3EYfdmV/bab/5MZIsbaieM3x1cEHHoCQPTabiqfwaKjyHRi3c29Ei7irGhkQol
         yjLwekWUuXuZW7UTPiCP1VQxyPoG/VuSHEYBDBryVdg5SW8TGQhgPCQg+2MIaNuVhfWr
         D3JbkOiwTuVtEuRQcWQFAQRibU2gTHpvY0YP6xZK1oDbnZ2yf7BDKVwHCvQJEoxFo4by
         RSpA==
X-Forwarded-Encrypted: i=1; AHgh+RryJBsxjXzTiBy9kBrTGYYdHSsZJrsJXPZzEMzb9HQgDNwtcHF1kDEtjF1gEcaY8vn4fetbxd+0UHpq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Q2h1UKxQ2eXdnGjg+fHE5ADrRqd7zjZ2jJsXQLBYudqqmI05
	wwpE2x5YH8ujZKlBaPaMAHqzpkcxIEZbaY4ZVnaqPksvC5lteIAt/d4u
X-Gm-Gg: AR+sD10zn0k23S30QSw69cX4I8Arf2PBAkT69j7nr6dobqJvq2D3eW3ZZHzhQrklSt+
	zdPrhu06BspcImcKn1jqBD+2S29fCi2AzvNE/n/CeDdpu5l0wYClkPEDV9zHLoVrchiRCL4JwWw
	PafbmFHbOKvaW/3wfX3eNPfCpePn5md7rH66ByTaujKo7aicrDp1aH9eYEYmNmHsq6zpAaCXVvv
	4L8B++mDQtODWxpmVdOFntPv+/Hj7q9shGVpaTs89z43LocGuT/D1HAFne+GNOvrW06XH2rlQLi
	RCbk3/MwSicrkZ70aPImgo+v8LY54EF3aKboTBNe7WBUxfZ3m0D8XVYZHdkUY7jKtr4TjRmSaxp
	BG57h7FCFg/lJu0BXCJfPaBZHV13oOAdDxbbyJ5zarc0h6Jcf9I/M4jeyz2R6Bm5lgkR6plo5O9
	zb+JYRhu5QJnFAzOvMQmUJrqaT5YXVLLOozUcnJA==
X-Received: by 2002:a05:600c:a102:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-496b575ded2mr58213725e9.36.1785090126740;
        Sun, 26 Jul 2026 11:22:06 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:06 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Sun, 26 Jul 2026 20:21:56 +0200
Message-ID: <20260726182158.249449-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
Reply-To: robazza.alberto@proton.me
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alberto Robazza <robazza.alberto@proton.me>

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..f205df64a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1213,6 +1213,8 @@ patternProperties:
     description: Orient Chip Technology Co., Ltd.
   "^oct,.*":
     description: Octavo Systems LLC
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^okaya,.*":
     description: Okaya Electric America, Inc.
   "^oki,.*":
-- 
2.55.0

