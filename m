Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479563CC315
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079798; cv=none; b=OcN19a1TjN5B5Lxy1tFokyl88MuYnuVkHWbRTqZDdIGss6a3H6AvlAbWuij4rCs+u4GFVlEO8/WAzC9DAxI17gnVA20ol/UPpBhr6ykSaS7+JtlKhNh9vBoFmweLxJvo84BuzAiKCXyVEGDBEZcV3VRS8jLlTVd9vaKUfOc6h2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079798; c=relaxed/simple;
	bh=df+Oxwu59Tqkfv1QyLsVXk0WC83aGGx+cVeZR7rfgTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ui+om6l1c1DCgqucCMr5R+WNOcSA9uUXBheU/DyOPMigUrpnzKI/uk5c5LClsOU5m+6lYa8XyW4KF28clM7CRpCJ9yYDQThLwwueLTwq7tcqqshGkph9JPjwhz3zeq9wJxDYFWsjbLyeU6RtU9UmsZwngUe1obIoJ6fhey7SRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cvjdqbMK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cvjdqbMK"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso489071a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079796; x=1783684596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wQQi5qAJUnUkHX1saOq3zIx6e8dXlHzf8E6xF+VOzM=;
        b=cvjdqbMKx81gRQXJnVcSuvVfcJjglCzgnvtA8W/kTXYzZraJKM3EvtzK6IHAqz035x
         p6Q1M0zOE8wqFb44Ouv3Js+2FUY+/XnpbkSgJ0ORRt1pI5CqG4jpDeyJnhZzHYWRrPhk
         jcsdOXNzQXg/GwkKjMzjy9zGapKYBFzH/7c7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079796; x=1783684596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wQQi5qAJUnUkHX1saOq3zIx6e8dXlHzf8E6xF+VOzM=;
        b=Q3JP7cd7fXrikQaCCk+By5QbF4FWDg4OASHP/oKba5qDp9TdtVExVdDNxPfHt8e3g8
         At26BMHiCeX4ReQ88CP647C7Iq6vxIQ92rOLX6N21+KnOIrcsdBTLBHJuKtxDOwmf1n8
         pWmC8AtJm6uw7fGE0d1zswZKNT97Be2YrpYK1Frqu2euOSGV4/ej1I8Ou1eC11MHYPmm
         zxYLrUfcqNHCffwXQUi/CEsk3CiC/0RYUU16wSLCCPXlZ8YdrTqHDfOQ1BcbnogW6VL4
         azovCAnoi43VNGAryohCRZw9juNFD30K1G7na6figpSJ7In5208exiHdlr8TX5nSjIjk
         anBA==
X-Forwarded-Encrypted: i=1; AFNElJ++/3xpX4VlTm5K5nTmtyp4Wa3Us98FHn1/QHqvJN50DDxKRhErC7cATFpFjER24wTL1nnMzijejw2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6wwqrEiI5KjilRVP55W24ChYgdXd5Sc88Eqi0gNeg02EpwtxV
	i0w21hEQe0yRkBALJORlSaoi4InAm2m/ikS8+/YSb6gBJpHMHl+FSaPIMIhW9Ilv6wZVRwLTsQ5
	qED0=
X-Gm-Gg: AfdE7cl2RDU/btrWOEqZedsc1wTu86nyeGe3QPqdw9G51VA19giq680XVlgAlenHOv+
	sUSeJzVSQhAGimdCZtvVd5xHUVT94rhGi39yKNhGjvmhUL4JV9KvcaD28CHYIV/9ySrhjo0OGp4
	SRe5hT0gASiFsNbJNpnBGcHUQv7aP1mzUks2bmYfvwtrBPG8dlBY6w9YYQD++KNcfczY1ez6LVs
	Z4KhrrJ5vA1jZe6BJB7eOlu7eF0VB8zosv2zq25RkDpLoPTuxLrpghKOzjg1r10kjxTl+ypnEDa
	158brzh0XC8XsplmJ+tpvcwb5pN7X2YK574OeJuv4p9fqx153MuCmPc05PpHYz+FxeIt+hynFy3
	TtlRv8X/5WXNGUaw7751IQs56vougvz0AaZFTt+lNOnk/qNY1hgBmipVlGIvVej8vn8nOsaXEQb
	0TVH01DlNv6wv/tQrq+N8R/N9uNNVkk/Guu85kb+EemSchbQJIo1gNO8Q7JC2xxOV4zW+wiqrWf
	VFVxymb
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr11946730637.4.1783079795734;
        Fri, 03 Jul 2026 04:56:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v2 7/7] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Fri,  3 Jul 2026 19:56:00 +0800
Message-ID: <20260703115601.1323491-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 163960f58db5..147a8e9a3a71 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -90,6 +90,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.rc0.799.gd6f94ed593-goog

