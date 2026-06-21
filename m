Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E02641FC
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782029843; cv=none; b=HWbgYf5JMkqqhqJpqmn1atGe2JGOsjE9AIVWrYPmf1VmgmtrhUiw62QpZrxjQZLZ+6iHt2hQbYSbfrPWNdBSxFGTBdfgsZofSbBOr0cVpq9F/sFRdjmbOLFkLNOmzkIOjteQ7hsACx+Gumgw0B3SIGlcB9pQfMqeGG0imIxEz24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782029843; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRowrrs2UcOEGbK3AtkatDOvk/vXbAsbu64EVW/xnj6+NxFVQ+oB0bnyY4w8Dns1VXfns6/GXoi7iywnttT/bZygMlfAbv5WQyAUdBJVIFyWcgSZiRj/c+xxvjIQA+14yYW3pgATUXag9iIJIm4O6zTJDCKXlsEyhmUZqiah8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbyXZtWB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbyXZtWB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso22858215e9.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029841; x=1782634641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=dbyXZtWBNRHT+OgstRcFJ3dvfYdKvLxQlxqWJgch6ivGYs/N37G7ZFMoBt7Glg+tQY
         GD/3vVUvShCeY3TsYHxpyZhrJ/j64DsZLJ22uS8IPJA0cSZ4KrST4PMMzFi4pdQpCgn7
         Jo/bFBR7ATKZQwnl3dhiaNLK1lnLXU4+Lmd8BkL065B+CMMgRU1Uv97mFX2+vC6utVVA
         PShYw3/Uf1xWEhHneUGV2+g+ZbFHm/knuLSoKhZnebmQZFMY+Of1XFy2rGx5SAhtKwIx
         bqr8Bso7QPYoUTrtVddxlSTmDocICzbBWxJpQ0xCICkPhrx0KRH3Ee0hFBFprmaG5/RR
         /uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029841; x=1782634641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=Hpymt1UAJblDLxPmDS0IbV9H7eXqRh5wtNFWHTJuO0lUPS1hFAvIy1FGn3MtoOnrxf
         YFjHPME/rR+Ckv9TBiwD5X0AlqoOalA5yOgjDvqkDF1m+EsMMai8gzwhPNwxcwe3824R
         3W888R1QC6sSuFgo28mn0ZZ+KWmHT+xBlOk+5goqq0aPvjKEOY6mG808Z0sEOpD8XjGD
         cUng7lNYJQOQdqcLQ1M8dEtUwQFHzIGIXJbHa2Qr0miMt7YoEijjjosx84E5Dum8Z2xh
         vvQp41sSYh/BarWM6eyoMIMidK7Xqa85U4LWOymvlhrrfQ5zhuKfChQec7PXsxEKfI2Q
         FYIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SjM54DlkxsS05W7ubyrqoeet1TYP0JL5aPCTCiUngRunaOlLHatoxSYPVA12XQgJ5FjvU9079xq8W@vger.kernel.org
X-Gm-Message-State: AOJu0Yzusz7QEglRPejVe16Xd20Egi/wPsVMT4sAxhDEzjd4LVthLA/d
	NUWyoz69mmkIxTYYNyGFbOxq0LjiEO3Ixz+E4Eb70VkcJ4mKxsEEGDCs
X-Gm-Gg: AfdE7ckUAOTSxKLKROn64KbwXdQa2ID5fVUoPvMg1aprrNf097p3hCXm/1ut4ly0XIi
	s04imcnuRKGx9FFKiB2O6gwvUhRrTjrkNu1JeYZy9G17NIAJHEsAQWzjm1yR3LNNI5tgHMQmvNK
	lGtvB6lPsuKMsTsY69bSnMzG9X+V4g1febWcTkSy89e3H4JwFUGH+rn4x98LPTdFoL6FnOijQxI
	LdFBT9uUBOpfqS7p+nKdhgvy3kbD/DyuFxioKSMhTQSI49w68od5XT4YZZAfM6wjAu1LwTCsQNs
	JXKYUrkyNNpnCDhkDxEWmZL1qG+gWo1hcNmiC6ymR9JzgFitL2NPfkLh2lyhG36g1horIjtjzn4
	2HSnTQZ/pBnKf6O2DDLwZU6ea86AM6ElnoOonKpyJg5GbA1vBk0QoToMNDuxEL8PWKa23BojdBE
	1KwPigqw==
X-Received: by 2002:a05:600c:5289:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-49240e81ac2mr164933815e9.22.1782029840525;
        Sun, 21 Jun 2026 01:17:20 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:17:19 -0700 (PDT)
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
Subject: [PATCH v9 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Sun, 21 Jun 2026 10:13:27 +0200
Message-ID: <20260621081634.467858-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
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

