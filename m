Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FC348883
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632436; cv=none; b=pL/qcao5BR+xBNc2zK8Id4RjveWLgPcCLv9ju8DFfPwBsN5v4JIHSH/bKZQ/QkUQVElOfs1guziVYdMcBHgeQk9rDPIVK6KcSaBepYRGRSImO7JfUCl+b88lPAa9Frc04f9+9VmOtE+UMN5a6o5zu53skLVJbmzkQOVFCoZsBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632436; c=relaxed/simple;
	bh=EE+LUrGjrLCUzObF2AhS0Yq8IeA/ddk0uB7J5ixxoHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTfIqxmTCmcrqBCPBAP1xgEPPrzmjoQDjB7E0LUOQoQdMp6pt4orzCbAtSbfIC2PtKFNjAx9wMcAYalzvdxzMIQgP7jO4OBlzZWbOKNNYQk0MbrXHOW/cmYck7ByP46KowoReIWPxxo7Z0CltezaWoQnO6cnmpdvOYbvVXS5E58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mHUi/giB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mHUi/giB"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3964b061528so532745a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632434; x=1788237234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swqV9OkZUZK5n8fVzKea7zlEh5+bBS1TUXycwoDYO2E=;
        b=mHUi/giBEqzlckpCKp2GQjNZwzhpJhQZaWQR7vio9UiMbOlHAafeAF8MjBLg5mNku/
         Fwuqt7TtgK2Vzwe7GW2Tm7D5z/1wsCAdY6V4uGl2KzBgltWAXlwXkBvBfVU9X3pyY/Zs
         Sna9hQZM5QQ9VgnoSzNeJojT7p0cM/utOkgQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632434; x=1788237234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swqV9OkZUZK5n8fVzKea7zlEh5+bBS1TUXycwoDYO2E=;
        b=XsB712rKmCpKCQJavpIHezwIdSziHGje3mHcUCcgkINE751lKzJhSWuV7LEKQCpBDF
         7/ZVZQ2/tqwO6Pc6htNcyxs2KrWF1JOs0w6/QxFhLrSKZRzdvUaE7UPVcLoQx3JpK4hc
         ywcPYkGAyw4WiOxHdCm/m86m1yi/uW5bKtwQCYwZtSgO09niePVKz8VYrAXzdBzdXkOi
         D0t7oRVHMRu6eqzo9mWAnfIIFCpZ99rDtJ22YTSOES/nng/3Ijna9q0fmEwT9kmXMZmY
         QlLbz/n2ThjIPgXtqg/hO2A1isI0Aizm2fakfHdKpJIf4zYc91JNoREThcYHNAYUrROt
         ZBfg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb2yOdLKJCy/gu+zpd3iJDH9FViNQfKKFyx2asoJeZOExs1/drceP5oTkh+GouP18cPBsZ1II+yMPn@vger.kernel.org
X-Gm-Message-State: AFuF++kY6rFfbURplXPVl9wFK84ZFIk9eBLQR/toCuQFp7Xl3oNN9A90
	qU5wp6o7LYOVBHliqMWAZXctPb9jaysRGGMjdeq5ZX5QpTFKNUWXVbKqA+sI8/zoiQ==
X-Gm-Gg: AR+sD10i9Zc9TlANCQ+NAcCMyPFoRhbrWr5Ii89PBorbmnQK1GWzYc5GhT2o5Jmhp7e
	1JQUJCpmU31FAcjTlfJmN7VH8ZUYur+GAbaxREYPeY5gZN1A0jUxIZqskibEgJX7T1UNy9IgNaa
	ZFYModFAoHynfNcNgyslbzNh6xFTsnikbNJ2ISixniBCotfEzzUMJyPu2H0N4exkWPCOdH1nvZQ
	8IIEl7DFLCx0t21ac9b6WTEu1YNoL4Igwex8i7SZeA7fBBHEz3LtKbzJYnfs/adGH13o1gcf51D
	nOHhi9qzUsA8K70YF9scifWQa1kYGXrQtvoZ2kLG1aqZ9sNefhtWyzHyhmotyuKQI4TmtQEFBsD
	py5H3eZ8HWut5cYcPWV8dQGW+guQy7/BKZb4GkUKSWu1dNPqIVv+eSFBl3ZtMb58dyOyY2/JkE0
	ke4CZyzimL3KYWz2cU3VvhI+r4iyFgjB3WynQw4uNAjf7gpeVhRNSO2Q1urECj0yox2O1v5SUah
	LL74gncTHOr+X/0so2mQNmbCu/cEYqBnnV7vkCalYyU2ZI=
X-Received: by 2002:a17:90a:d44d:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-395dee7e2eamr44794746a91.1.1787632433680;
        Mon, 24 Aug 2026 21:33:53 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 25 Aug 2026 12:16:24 +0800
Message-ID: <20260825041628.988369-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
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
2.55.0.860.g4b6b3295ed-goog

