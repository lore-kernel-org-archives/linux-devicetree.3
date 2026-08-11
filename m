Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3E444705
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450873; cv=none; b=BBlVQeylmJL0Lt0w2BGkzQJ+ag2gxbukDEet1uzQCnf0ExLpKlpBwsGLRsmPnDyaHnOzfrz7ybGS2jgnG6gMXH9nJKp+RrpbjJh/1CPcPDZ8e1rm1dm5CItOfAhu3e75XULXRSTWI1OeNtVbxIkzHm0BdX/NEWDNoTfVD3Z2lYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450873; c=relaxed/simple;
	bh=AcYr1FXo/iH50loWw6bRNXzrMnv1gP4UhMWCRYTk09o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4F1wS+yBIy3GzYjOXdPODwDnWhZw8P4ymLDhAasJiVi5TXOJOaGKWTllhfmObSbaqezZmP2uYXMHMjb+FW3ackf1j66ZHHRksu2Ci5Z18LhFL7NCa4sy5cTr532zWZzrZBcUseWbezA3kdNnWqDTJjRGR03tEub35VfigyLNTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ScxbrV9i; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ScxbrV9i"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84eb992a881so2225920b3a.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450871; x=1787055671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=;
        b=ScxbrV9ily9IznGof5fmsJPoTzTNyC82zZbJQLMMM96uywAuNcIzv+MMSs5wIJs3QC
         q6KDt1hRVN59iihSuYJjkA64DoWY8qeyhUi116dSzhZConu1RKzkPr0lO8qEklzLWGNN
         GTp5S+pwRmB2gwBR1dbFwhqJrhmtTb0ayMCDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450871; x=1787055671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=;
        b=oUOg+Na0naCXngSFHlFIAPhgfIpQ6rszQeuxYyS6nLG2dAkV8eBPUcs6Frpm9/dtZ6
         IhcK97annd7sLK1tN40arA905/dLui6VdY+PC4smRuHYYYMzEwjMacy6S5ildnoopkGG
         WRkQbWU4WH3AkfLiUypT1xya37nUrigHVpxC3iy2TPF2nIy10qw9okamIpNScGY7cmVo
         LjeBb0+Ytni5V2btXdsnFj1dvemBGs6R1yNONAhy7Fe4mnX9t4SKdt05Bb70e6cz6vGo
         e+Vcl5UXRjwIPXEFzhxGmCzNtSqW8SgNAV+bZAA4SHBzVccTGLno1z03T11whLs61E9v
         x4zw==
X-Forwarded-Encrypted: i=1; AHgh+RqRGkltSts75okks/7j9SLzZt9pCPL2cu0Ac6J8F5dr9m7j4LbcQbA+yg8NZdWOGEXWOjk0X+4BjfLN@vger.kernel.org
X-Gm-Message-State: AOJu0YxrS0I2hsfSwt97AQHpOz/YYX9aphsYHh2qOrWEA1QzS3QA8yTY
	RWnsUw2xo3B1eNBXvwrtj6xxKdZc3MnlkYpSLOXHsCIrNcecywIyOMH3FgD3PRfG7Q==
X-Gm-Gg: AR+sD13Wb7IOhsqYqlSPHjo9ozQhdGHeJWosFhqNKy20eo18qTgETZS4mLzmHh4HHVx
	HI+GinTjY86cv7ZR6N6MQMYUjiokYaK+Ue7C3PPBTxTrLefl+kIVD2lah0bNB2h+HeJFr1fO3R9
	IlBMtY/TxXbtCFBKduc1ZenDoVlcf5EVZSaPYVnvL51lJq0PBV0FZCnDPHlDzUhuPHhiCsRzLHz
	PeHNDYRyu0M+PlB/WMUHvTU+343ourLoDjLfe6WprKx9+VTenpUqZkCWWiXHWS8K1W7Pkp8nu1P
	E2OVcTWcoKRTPjedY390akFvmEQQXhW5EHXWbgxP2wXFinE4gkO/MX+IOqBjcfGxYajr+YYIBlK
	xrDwvt6ct/2DzH/m8QqXhr6/4F1vCtZ+o/jJhmeRKJIFrgXvxiVn9PPfDbRa86IgGzQHaB5B5j4
	ZtM9/MHeBzMUs1vQCEL1wk24dfMYVsItc1NgvkTbrMcy1lGPqTMO/SRgiX07I1dxSaMjANV/HmG
	fLFCpPKWvzelO3PZORKgAeY4Wbl0s7ilugPvldsLGTY8Q==
X-Received: by 2002:a05:6a00:17aa:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84fa86e19e7mr2769479b3a.12.1786450871439;
        Tue, 11 Aug 2026 05:21:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 11 Aug 2026 20:20:08 +0800
Message-ID: <20260811122011.3539250-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
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
2.55.0.679.g6767b8d81c-goog

