Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9B643802A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620472; cv=none; b=C16n/AZvcj6soIaUfNqZoDTPH4lMwIuQza8vmb0/f66LpuHGmKUwzS4hX+7mhXjanNJKmls2JeN5JO8dA6PaSnS6F5tZk6FXuofrK7IOee57pBfQGwhzpcC9QUFep1xBxOxghjCfDntIefVR0RBXT74nln8ERmtXr9UTdyCBbaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620472; c=relaxed/simple;
	bh=27P+kO3E7rZQANAahmL4oW3JH5FufBpKYuQgwu7HS8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpAaK/PW3ZWjabTZEDTyb27i6kKuyghmQp8YPu9sgmddTwYJ/VU8nMjGdfugvAxGBIwmd+Zuet+KQkdW6c2ZDce3NS4sYqfFKtuQ1BOrBuVaSqQnxicQsuZ7NW86WWsxeMVwbVS0qnaJmiYpkC8y7e23sIka0RwyKf+YLLZxPwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ElZ+0RDB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ElZ+0RDB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cacb8416a1so75662025ad.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620469; x=1785225269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpTQ+x9JRSQEI1YUOvflUoQb8hjimFA84CnTWedUkpQ=;
        b=ElZ+0RDBacwKpPFwIIhI5VknHD0gb05C592rQtcqcctQFFwCNilZZJQtN+6kCigGOd
         OpNOz4TME4z3M3Ndf2zMyb/3/QdIWloDL/Lc8xLJdN4srHp/gZWQ9BLTlgLPvG4RhhJY
         AKlg0PHcQTTJ8GUcN1lDVhNOl8I2Qc4j7pdNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620469; x=1785225269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpTQ+x9JRSQEI1YUOvflUoQb8hjimFA84CnTWedUkpQ=;
        b=p79feP6IczwmIXBIIai2e4lLUKzyxE6HH+7HjSSBE7j/5aZmwq08d2dByRlNc6YiWY
         rZvEO9/4jIpckiFMRaxEN7XeKYoZxAVye2WzlEaD85G75Ee+g5jobV8UNfQiVb7GyM8p
         v2PXGnB+iysBabs7DdKieg1wW+xDU2u6yucgHp5lqeucnuR9JB0CZpRac3F7X1dMxRdY
         Vj3MdZ4fhRiBySY0KmGFnxGfxpsOIZ0a3LWcpn/62YmF+ujzE70OxSIku0S74yuvg8v5
         G2OLLfxGtgliTw4oLIm1TcyPQr6QGPaxLMjUXBLExKTuqFgm/JYVUTvLpWgvW5ZTsawS
         Is6A==
X-Forwarded-Encrypted: i=1; AHgh+RoFg6GxBRciqhBBatoC4CiJhUm16JjIOgR6qhHfhhFQ+bC1SwBUqTUSjM71Yr3iLdTY/k/1BDt1+gAI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv97AcjVkz7CZsCPPiUn+gfRwciGoAezj1QfoM0Y8oRm5a1Ml1
	Peg+9O0WB/WHMNRI6rec/OgQU6CEw5Hsfg/OI7fX5yxa81M4dodVkJZvsi90wxASIA==
X-Gm-Gg: AR+sD11h77kmez6cIM+l2oqaBdJfS/RExruISr76FKZh3HLmIj2nsDMZclo+oOViXfu
	YKmJJYHsp9e06evHygZPC5P8OeQMOksHXLifla3+Q/zLlwP3OAuODiik8HIyFZSH0EEpDvTOUl8
	+eup+Zkp8uPHVpx1v2iFDW9aC1/f0ZzPMcspP0yUhIMDBWbZUXKWypa8EJg9KvcHeg5OYhveA0u
	I801yh/HDZmqEPW/EJrD9SCMAy4+P1VFm1ZMzzQsN7EGelbn22EnBgSgKOT40O2pnoo2qRs0Nlz
	jXakEHjnfeGYT4q9MPeUm79DHhsBrz3PwFS2qIKejUmI6btRVfMpQ9ghyQprmjQv/S+fbPYxehK
	ivoMx7gUuDrRdIHJ6MBS4Dc3fjqhxKadqJ8b6SLqW5nx3+60Oh7BBXVYdT0tnnt+ZMZG0q75V9+
	XThBY9MmChuXUGllGAk1SoqnM5Bafj3zGTQgIi8sIaShcnaDUnECHIpBMlDt0=
X-Received: by 2002:a17:902:ce84:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2cf348369cfmr185433115ad.6.1784620468826;
        Tue, 21 Jul 2026 00:54:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 21 Jul 2026 15:52:22 +0800
Message-ID: <20260721075226.2347933-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.229.g6434b31f56-goog

