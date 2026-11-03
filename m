Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680695;
	b=Ui6W51dewvXeEvOwNqN29edmhxEVX6ZfruRxjgjh+GjJvKAM+8re85QIdxjeNXpFiLSH
	 DNm/OEExBSjh5ms2JEHVEtQ70UX4kLOcz0xiHPXmctOOrfR7TnNHdxwFUBjMixAYxojKR
	 +03NHvoDA6guI2UjZIrkTKzQATgna09EG+k6a+YvjlpZkix/yvU8BcLsLsyRJ5ZRkrAkc
	 pxt3SffwmqMsfk3Pr7+h8T7QcpPnwcwAPjt7CJlIQ/5jPIgqhdWCHBwvBPP+9UAF9JLe1
	 4VnKAeCTqVZvqniirGcCMj0yTdUygOuxpSi8ESY0pgfTkSz2AA6g/ajNlZ8AA52r7GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
	b=PnuodekRrfZ5Ei5uBIMeEQycwkJXX1woIfWmIsntOxg4FuqvkGW7l1QO8wf8+amsI26W
	 bsqUi00fnehPmHLqwBvs2ke4UeMywqrvyPv5beShfz+t51YY3BMxVWFMD1HvGPIyypwhW
	 rh7DjNhil7sMzzfD8UDNuTRPg7pHmHDjaP1t1FZD/gA6csPmU0ip/yJqiduAIaa2gwCOT
	 CesRKpi6B2ZI/CDxcXRbwdHFTnzYV+mQEPhyWKthy9oG83CspBtSXamv5cejGa2iFSHIY
	 IqHHRUqgu4FTlUIAWh7Dm6NB/1nbZvfo79mlGNndVW519lrWV1UYpIH95Wzv/X9D10w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RoNQqV9j;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5B1606A331
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D5B1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RoNQqV9j
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab41538192so3014235a91.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680694; x=1794285494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=RoNQqV9jBrmKq8aPFdUcTGbhVq76VWe87Mk0rL8irAkCHESNHOA4Uxwferz7yyQfJh
         SJWMN3tlTNiv8tPOeYP9r1CMapa9/kJJVIQpyaVj8d/rM5Joxn/TAlRqQpNSj5fXICvl
         EDvslT7pOQqwACyXNaamHO6m6jd1OzMy6DMpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680694; x=1794285494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=nYsDELmGhZUt9ANkFvPWkkHrUn0W0WFwwhMxGyodLpmkav9mzd9RkqtVLFOs+Uzv6X
         8jTamzAlDm9Mo7drshMdQ4eqNZIXfDkdwe6V1Ljf3v+i3ZQ94ApQ12IKy583FKiTNrbh
         MYwY//xYipGhK4//heKmzLMBETX6Rf9AbOc6M+NveAnISWXO2pcZGDkcmKAbHAEGWjYJ
         HLqkEo8kVAto6gIHaKrkgFbbeJ+qtG8V4mcivCkyDu8yU5fTL/zKTR0YkODy9oEmCQIn
         ciuoAzpdMyT8ciA+KkFu0B7XtlDU3H/Bz62LKQWhkD1yeuID44YRUxKESZ1nEBEYSfz8
         qTUA==
X-Forwarded-Encrypted: i=1; AKwUvBzTA6eFyF7r8DTp1+OwhspjSQxrwjFcNI3xBBICMtom+lEi2KcZGttt9I7jRX2rmvNJUE67mmjlO3qm@vger.kernel.org
X-Gm-Message-State: APuU4Z8zPlPwdVMfEz4DUtG8MK0pVmjiC8Bmp/m+LDTisBKozDJY8OhN
	E/hf+qUs34RYehzHvutBGHJjqtcBoXElMC9xvQraBDcx8wpDbdzK8YagUXxH4/NnpQ==
X-Gm-Gg: AYBFou05vzkxt5X8kT34iAZVoDB3w5G3/KhVMZrtqashjgGofFv1NjE/tzHUDXo/yrm
	DS/tJr3NcMOvBRmt1fMOjx1uemXo+NbEUciMPn3akRfCpC0155h2aY8WJ1rR1pFUYcYZrB+DVHv
	x7feJqD2cONPerOpqSyK/P34eiDAoTVwIY8lo0T/SN/fGr71qKGFpIegcH4enfupx0BcHD62dgr
	54+lOaUZtGVRwWmMGkPngqljH7xK2PZXthuHn/lJIM/i6vlrjdp1v938/i019gi0LZhqVv+Ragd
	9vqEon+lYBe4ur7DG9TMg+V2ywMxu1Xd+fbaShAUf+/d/CGGspAisoOwFxuk4w72VLMOq6VNmFk
	U2v50yiHtjjJKxmQFOJHVLl3ipMv4whSx2e3E8Pday18SREdZEKZNdYf7FfqqybFln8nEhByZZM
	E6DYtoJ2BQ9X73eNlW9zlByoCa5fq1HYVf3811RScUDHLMFcvLWYa3bi4dCERnuKLb9ijHciXdC
	mMtgjDMZ2RpULmlDT4r59WVqqvsZ5utBXLtYEywoKjZ1HDpnND/VOyQntGZU1F5xJJj+LzjJQF2
	SgfUjJNQ7A+TaQS9jgHp84i04vudB+eFhEktsvj7TB+TvctHeVUvLD+Edl++fmrJStw0luUt9Kn
	1fp26hk/Bd6Bc
X-Received: by 2002:a17:90b:4b10:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3ae89724b06mr9920661a91.10.1793680694591;
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 7/8] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue,  3 Nov 2026 12:37:31 +0800
Message-ID: <20261103043734.2179858-8-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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

Cc: <stable+noautosel@kernel.org> # needs matching driver changes
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag
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
index 777da2129e77..2c6ec714e117 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1098,7 +1098,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.56.0.385.gac671c819a-goog

