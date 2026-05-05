Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BAF42669B
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976079; cv=none; b=orcf0F9Pzm9+mQEAhOPYyZhHQATCPcQnLNPgDlHrjflCAofAfpnchV7CLfvEipw2xSuroor6E8Y+QM7ZJ5OUbTXw7ZEUz7osxXmTmjhFs8tYxGctl5Qtw99JarMIqJgArhHESsWu47OA4NQEJnXBOfT3mD9xYdRAYWNdlXUgUaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976079; c=relaxed/simple;
	bh=nI3ftRFCx7BvI5aHP6Z5Neq016/qdZrGqNq3rdXbjFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oX5bkb+1tnmPo9gkdmaQkDyKMLhq6lwKaWCMMCO9CV5GsZBoWAlJSUS4HQ+7xQRFJd9Yaac8dajA2fJ831iTLV62uorDmPFnitTY8AKIWrOEAcNRvl1KustAa3TOmyfCxqs/rniMAPCL5GvLvarNQvysgS2htuBptcA3ctjybtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O0/BOW0D; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O0/BOW0D"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-837dfccd950so902547b3a.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976077; x=1778580877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=;
        b=O0/BOW0DIm5eA01gny7bzrMa2ViIAnJkyQA3bL/7tl2lgHtKN6NM+HgJDtqGjTQfg6
         esxW8RpL18thyhgQq+UzzTJG3F2zhnXFMlGWWrXU6IF3Ui/RpA9H1enP0erbRviCSUch
         PMpN+bQj/m5rDQEYHIYAWaiQDyJ5azYmcE2CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976077; x=1778580877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=;
        b=qYzxw/7zJisZxzSuBYquj4PWNU1qb99G7XJf4Ur5bWoHlYwnnzN1dtEz9+3v9VFz4b
         jsYQ80FeF+9erh5XPvoGzYLeH/Y12E9TMOoco26E+WLbilebj7UZYI39yzViKLtgRp/L
         QNlF9GUbS4Jgtclfe3FL55OInSzDXYfnfyp6uL73TN1n2mDha2rIqK96nQdlfZKRJyOs
         EQTnhkD9frbLjAtcH4QItvLoy4dM1seVWFT5ZxVPRd1Cm/Q2NfsjiMD/7IJRgVnQEO19
         WT/fMNQrGVNAjXQnvVo0f+zzwUzktNPZACJY1Idf5RO87SqeUqtHTPgnc0QXtAJFlYP5
         bV7g==
X-Forwarded-Encrypted: i=1; AFNElJ9xI5E2qlXKOXVjtZwiRgk3gk9Poj+/eJCR5VT5L/9kqq53/14n66fMytBF3/m1moqU+PHYMgCqm1r3@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYxXIDtMEJonXNLy6765gkkGmd/MHTbL4rI6ACMFaKSNfTkRh
	PrBxBw8bS70cyO/3Nhn/Uvuqy7g568ABYZ1PtGIoda+jR/i7ry8UqQOUN+K94J8YLg==
X-Gm-Gg: AeBDieuNwuWh3LRYxTB+XmaWmqe/C9Q1DFhETtpisiMyzQBaCW3vQsKane65agXgPEN
	QNbA8OwFISbyK+aKXHaB6gN+WheNe0V1s0iRYx3Y+tqQtiLZUfKViNFpqxEEvo2FTqW2pRMHdIu
	4EDOHERk+xHBFl4x5dsX8JfTnXsji2+6DWTO+GFhCoUTkUT5kR2mEg6JiaLyjcxeitsECvJfdoR
	z4Aio7Hgas1DkoZkvLaa7Oc5+9nCWUqKI1V5uYdagCVgSSYNqshsJYT7Spigg0prkRNA1CXdqZp
	rXflrFKwdyO4wfzS8pyod2j+ezC02hYO31D2/RqON8krFrCVGVTqsBTkJV4OOSkZtAPTRIXij4W
	H9EE41U4fCxk3Bk2pNEh3/suMu9GF+X8mUn8wXcUJqFzPijac74eS+fbC2WQkd5qHylTaAzZS0m
	WoOhyrjTnWa+K6QnWyzi39aS1HqYZv3gaWkU+wbwMJL5Kdo2GRkXSezTCaZGP2e+dV3ZsK0vlRI
	ovJZxVSv1Eo9LuOLhE=
X-Received: by 2002:a05:6a00:8c2:b0:837:666f:8fcb with SMTP id d2e1a72fcca58-837667f0d5dmr8094589b3a.5.1777976077208;
        Tue, 05 May 2026 03:14:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/16] arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
Date: Tue,  5 May 2026 18:13:57 +0800
Message-ID: <20260505101408.1796563-8-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device tree for the MT8192 Asurada is missing a power supply for
the SPI NOR flash chip.

Add the supply for the SPI NOR flash chip.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index a6543bbcbfd0..aae9d5ccca13 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -637,6 +637,7 @@ flash@0 {
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&mt6359_vio18_ldo_reg>;
 	};
 };
 
-- 
2.54.0.545.g6539524ca2-goog

