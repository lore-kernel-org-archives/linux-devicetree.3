Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28B038F235
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721022; cv=none; b=ZNLXixr70hJCcNGs8AYN3eAtKNT2o8yeFtSP3YS0YmthlCTGSf9Hpd+ozUFTNaTRG2bB5lBVfuG7gYMQj5b4XO0rAA9Yy8k5Qm/4haxKCzrjJHXjn4zrU7FRPLTm1eTyZVLb34/d6/gls+8Q9XqH43MVx0KQGxTlBRfDNPuFiZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721022; c=relaxed/simple;
	bh=8avPzjkVf9V7xqsFuREDbJnx4rKI5nF9UCQknqLhMxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BX/ABH6PkBa8Q+5HeJ95YH5X1yOi7vQZD7VN8uxpgJoZhSIdFskHQIcAGDsU8QmVpvcaLGZpIYJxgTYi+oB8WVFokwQzQ8tEFH3Ip04kAQTCOWuLWbAcBxt08OqdvRFq28oYtPdjbs8pfxuAGT5wgsMZ4iTs1gSvUtrN/sRy8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIVzQOng; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIVzQOng"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so45965805e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721018; x=1777325818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=SIVzQOngeh1ibnbriZVEw7KtAeRK5U364aE4zfXi97A74xg0YSIoUbjgKtlyO9Nv20
         /Of7Ba4l6se4q4taGQE0YCG7/xRYCX/ci8QjMzuIM2LN1MjCSms4RrcfrKKaks4uQa8Q
         JDE7PH0b+sJGDmly5ZVF+qL0JetVpHu4H7QAH+LxYxxDgu846R7CQgLgXC3TCO5IvAki
         UcdpaqWHoC3MkzoWLrz9u7tHH83Syf8FZHBqd1wCMmUXXX210qUywwCUi5bVdHy17zq6
         T5h9jQGSzRMcWsO7BgZl9S0LFT4P8h6vWhnirDqR6ZBlbCEsSKa+yCBmMHZRsJ/DqtI8
         B62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721018; x=1777325818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=bTP/HD1H6/ctRHfG5dLxZwcZmYvf9rW8t3H+iJXVoMK5P6FZckHh2N5XDWBhyUD2HM
         24sljNOmowAROIa49lPfoKs9anPnGM3p6GhcN8h64IyXoxz2vs+2y9WKVEI2bIJACLKz
         9DdB7CQ+wOGyg4aYgxQMIntXxkMT3wX1Mm1vbIIoGCgmNTBLENZAmvf8Fw2ZKThElGl7
         eQMV7Ets4Nz0hm9MpBj6MxGznRykmmDuqvF3Hdx5FSypz2Jh/qBpG+6MVX0XF7fk8rzW
         w1qAEst/LsvNAl4pays4jtpC2Zfg0FVxDMaxHNYIGdbJT9mkPdXIXYBuF88f9TBFz4jZ
         Bl7w==
X-Forwarded-Encrypted: i=1; AFNElJ8Ut6cwQibpn4GBPzmTTlHLboCQjyyORG3YLnF4ecZEGxib6I9FifUiaxMvwNKJXKXZ8kIWPJeR9/wO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzv0eem9Wt8mae5EtkU2RbqE4jirRr+evffeu36RTew00V+YDv
	rEUiuHpbajwYeBcb4f0qsvcVQxSALkLhlQ9XT02W9Zlo7SxWoLK/SH9I
X-Gm-Gg: AeBDieuRqcEGibp/l8A8Nplbjc+rPirr/eAW7/KyNa3pGVs9Vw+gucgwbtsqDcdwVnb
	d3mFcmwDX5ptke4t3yjS3bRsP+B1tjfhVVapJJ/qFXHLlFHB06WAufgpPz4LLP76LDmGmHG32WB
	rWcA6P/32aabswRWVvdbHRuHy4jBbBArMTGNmJgcMmG7ZE7z2eTST/FIJ8dF2qBUBOulAOIiUT8
	BihmCpZ6pnLS5IXILpSgarbC1674wewtiO2CD6OIWFNut/pl05B/39cd1X9+BQAWNwqUrZq5jXt
	tVSucB74iFbrCNyOGNyzU9MIJ6rPZeUVSd0mUistNLJylX4Xf1gMOMkJ0HNLFPYXfbxu2KVUt9q
	hhRpbWUspKzYyl3+d1oyLn+WsekPMUNvW+HWL4RpcCPpPgrrSkfbyj9o5/1SHNNTNmtwpoJRTnc
	5xZp2MO7lJLKc59hWrtRJTbWVRKFtmuGJ/qWM16KjD
X-Received: by 2002:a05:600c:34d3:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-4891cdabf13mr74014935e9.25.1776721018309;
        Mon, 20 Apr 2026 14:36:58 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:57 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
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
Subject: [PATCH v5 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 20 Apr 2026 22:30:01 +0100
Message-ID: <20260420213529.1645560-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
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
index b95435bd6a9b..2d3c4161a7f8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
+      - mediatek,mt6392-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.43.0

