Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3933ACF11
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859713; cv=none; b=qP/iYI11BHUuxYMujJkJjhgO5MmYTciwMui4jCI6c80ZT4lMTTnZ2656DdMTFOs6BpzVlhrbH5eIhj3jZa85qja4A40lp9K1PNB3xqUwdCgObwT7W2CwGKNMnM1T/asxb1n+hnRGvQehOp1t2LEaITQTnP7zfO5bsw+4mdE61Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859713; c=relaxed/simple;
	bh=8avPzjkVf9V7xqsFuREDbJnx4rKI5nF9UCQknqLhMxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWwxzZ+IeHlnZAVqyEy4lDdq5dx0S+zh/CnazgEh/0gKOxBFhVVheSNt+Ew7tOKfpJu9nSSkYfY9Lrvsv6NKkUhShOXV0AKc9GMc8q/wgjP+IdKhOGRp1/yienY+nb7RSh6lf+9JurJfvNMWK4QShOQOWN05gZ2KAb4AYgfD/pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIaSqxg4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIaSqxg4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so34774525e9.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859709; x=1775464509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=WIaSqxg4D1Oy6yLpeYwIm0I1o3tDCGmXsgjaNsi4JRYSIvt7J+topVNX9tx2HjYzpf
         NFVeknH+H6J2cdzolTmelBCMzy1Cgb7PUV7YdPinBVbGoLShNUfbeL8GJi0o/Hp6umf2
         NhiD42iomO0CoDv0geDBgSY4io7+VlKDal7LQMDcNkh0zhbN5U7dQRwTgGUnQYQlRp+r
         sfggePAy8NxMuqDg0Qv1BZiG13HAzsjAf+KxKufxfhWRxMGgpFeIXvXwfPrra/98kF+k
         wokUcjs2bCy/Wh6d97rAfZhXMO1lRbshZRKFHCEg0XJkFy0dgsn4uAxMsFSsoc0tgJJL
         SoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859709; x=1775464509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=nqCw1DKjgy1H+T0drx1M5PxM/0wNbpq5zHcN6xb6oBMvo6iqTiadVFBFG/qDPwaVoD
         MkKx7ngSbY/dYQhJr1sm/SV4Pmg8syaYMbJWH9JxAFcFb3uoTR7x0r4NLS78jvUKeR2B
         +3ehWIkkALuogaW7Ygm983GtiJVx4UBSFxhQXf4mNeq94Y9ZdxiFKRJ5D5s9D7O39p1q
         funIOIlj4zu6oSQgIFwSbgViCvK3AMy9TJCbVc2LA7hCECj2ReWCB4TltJryl5dQgJRV
         nTI2ZS6HicwxDtc+7AQdquC34zPv1LVIufeHPu+TpFAMRU3ku4+pkcWEBG/n0FmUThHg
         uOQw==
X-Forwarded-Encrypted: i=1; AJvYcCVnKNNMpYzI8jcZm2ZI8WwRiO7hSVWCKdtVeJCBXmkI+q0cOhXnK/HiuaZElLy6FcGm8TMnRfmGUoTt@vger.kernel.org
X-Gm-Message-State: AOJu0YxGKzAhzXBq6j1xZWe1Hf3XYpBxeHU5jK/azZM7ZIiW7C1q33hc
	6I8IjY4iT+4ddR4JlkWE8LCZKehoIfo1k0wj0J1VpW13L2EBCp8jbgSK
X-Gm-Gg: ATEYQzywjnqt3QxGP0+MT30scyB0s3fSzg5n8vWsR+aRRsRMeD1IZheschFGgjyhI1t
	vRfkSj60JwLkdKGVDD6lMH7UFbWoH++85aDo8SYcg8OHE+MjakT4/WAyM+GWX3ytsNT9DKoR3ee
	vOX7ZVWlYUdH4oLE4gIS1OuY7/VjU6jFTZ1/edVRlWQSaqMxL2nFdN68j5AprBDsMoJSsAy+iuf
	KWIxV6VEL4mkQg3xO/n3/zaFFvp43uRlZCX5fmtz4Xri1eqR3CBc/3XXJCZ+HpAxc4XS6+/kCPV
	J6Jjt9Rf2oB9jLYDPPaUL6i34xkEMt/cvlOMyOrCocdPXbpvJqmik7PoUqYs1wNMlFm0HmlmIiU
	NWQOTmwjn+G31zVywkobY4096bQuTJ2sM29koBGW17Y3U0mcHmTbSL261PK4sx0XMf/tkBt8Poy
	8TJZtU6I/Nbxk/xzPRg7o=
X-Received: by 2002:a05:600c:a10a:b0:486:fbc8:8dfd with SMTP id 5b1f17b1804b1-48727f80089mr170085445e9.23.1774859709303;
        Mon, 30 Mar 2026 01:35:09 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:08 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 30 Mar 2026 09:29:36 +0100
Message-ID: <20260330083429.359819-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
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

