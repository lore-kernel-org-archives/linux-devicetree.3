Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D67332EC5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507956; cv=none; b=X7NdF1FJsQv2keb4B7mk9RxeOCe7rahUVPdq7MATzz/Y36gKTC6Zpn9ygOj14Tln12sFsqUMT62H6Zk5WWiEeKqmHvMLmbsEx+ffjv84wr6+TGyz3Q97Egptn6r5HTAyhWfc2LGFQj/teUItm2SccoJyeSY9M5jVNzVR6ETAHNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507956; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaCP8QyJmLUra7mQhkBdTH5XzX7Ntd6z1DkNFrEl6tvicLI1xMTNIGhzA9+kICql2Cyue7kAzv1s3NlrLDEIji/pTcLfJqggviIlpC5at8FCiA25oLX7Aq29nbJ+ClXIwZEiBalWt9YAPAXH9Lypus2D4IZt5GhfGUdPGr0oytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Inrh4Zf4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Inrh4Zf4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b64c8311so30503655e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507954; x=1782112754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=Inrh4Zf4y7O+QAIdZpvX0SiwfgcLdYfay8y6BlBidsFHvweIT3uzAk+iZ7rfrRnVOv
         xW+rRlt4ReycdKZMu8ZA7YdssVDNxALttd0OOrdDg/tvm+iS2aa0VKLQputsp6v/bjwh
         ymRKhPUeBBFd5FV566zYj0/or0s3mkzDBQpzB865uyg5oYB8k0IQa7aRDUpbBnU1ocaV
         NPYisbUfO+5RoLIyVJlFjdSw6fSuhBwvVfpHjS/hN0McnqX2+NqHqZswy6LYujuindkg
         f1cpD2odieixsU9XwkZgKwj8zza9dfr+XL1wk927FbSgwDBjMbw3YcJpRaIknBuVjnPk
         wvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507954; x=1782112754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=T6GJzWjAgtnxAton+N4ASQBKR5+9VadFgdF3Z3CioYe8Xkicuv1/KXMZGzYgty6bVF
         W/oZ+EeDxc9q9ex2T6CbAC4jLx9Po/p7/sWzUm6IoldMKR4CVFXxsOA6NO3QtQz9eoiX
         R2HU06dHjhXPTH/UE2QBPZDNMvqVB9B3JO4qXCiSxFnI4uZYx5Y70vhEaIWt4+RJlpbw
         uGY/dyD/Ldyctxr80A6tmOJz8nFOtfjPPDXMP3S8Ej4i1Emu7azeksrCsiO9yC5UACrm
         y+LWb1iBJtsvWbEdlT/frPwJpYumNkksUrD6SAiDtIlXZl7kDomwiRx00C218g08mhgb
         lXVg==
X-Forwarded-Encrypted: i=1; AFNElJ9tjV10H+6V44AXc0JrDYRg7QWv4PKpmIIdz79JmWpOd1xGUPNjMXns/Xf/gCVr+SQo3/GOLUZn+SOo@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQ3blF/mFF9N14pZraItZkOdYO7s2Pwl7vw1BG9z1huSbJgc3
	rFWH/CRSgqU33QkAkQFyiVAISHh1yILTBSo8nPCMRK7Uoj4bAlgUSBej
X-Gm-Gg: Acq92OEwzNKKRT1h4HCZmve1FW8HpYQg+kyNUd5NHtC2/kERrll/sn9SF34LmTSk1m9
	rW1no8o2j4b1BGE6abaw4dmNM8u8vi9NzvBpOPnPT9VwjTYF7D2A4PUiLft6Rzmrt3hr1YdcZBM
	oQaidWSTKoRuNaoKwepk/pDI08UARJHn+ZWrTSdhNbE0X31jHhsx/lNQAfuwGWHp54QUnSGh2fq
	LukZ55BKHI8kx1AQaIJR64BaROmBxOdJemXxrmclEnQrd89lU0WxO4OkfdBVUJ1U7AICdRvRwh1
	XyiOuqZ7I/BRyqP/4rtdobvt3Gp8m9yOvY/I7+j9fQekVsxHUCdr5psDJwRxYvnzzuve1aytcGp
	yrl2NgZQ9QvmcCMKb9PzboXf3Q0EDLnxqr2aWOZa6hPEylHdW4jA19mQUe7cK19FmkLSVz/wWJo
	lXZ7w2F1Bnxm/tAs4o
X-Received: by 2002:a05:600d:8486:20b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490ec4fc0c4mr117642565e9.25.1781507953725;
        Mon, 15 Jun 2026 00:19:13 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:19:13 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 15 Jun 2026 09:16:08 +0200
Message-ID: <20260615071836.362883-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
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

