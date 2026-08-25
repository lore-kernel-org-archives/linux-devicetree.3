Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EA32222AA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 04:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632440; cv=none; b=OsodF4er1osYyT3XoTkr1ynENFcv+P+KKF5LCINhWHOH26qPqvu4mXSEkXYd7uagtFBrlE+U14zjd0Q5MLPL4YFSeB+8egOBypGsUPv1xL89Iwfr9kUVZtnPSVYMHZaxbT2nCFNcR56me9bqE0Qjmz29SA1TmYMWnZ5CUmcdV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632440; c=relaxed/simple;
	bh=GMLwta5oNasseK5udjS+I9A6d+Krjq5yftEXv9H/4cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOFb8XopO7xqLbDExF6iMUG2bhlY4JX5j8we7ntQQ7qC7fww1m9+8wypHnER7uR0gBOgxy6ywM75Wav5GILMcS2Z+PK7DQs2DEukOCZk6JdwLBCvn1fmQK4+tV98jfaB6Y4SNN6meyNgdaQiDAFrBDvP2Ob/180L1JI0bT0wS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e5kYiAs9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e5kYiAs9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacb8416a1so37344465ad.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632438; x=1788237238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=;
        b=e5kYiAs9AUEqkLYVl5q/MccLd0weqROGKSD27dA9zlsQVc5Y3WxaKxEEj6no8L5bUO
         PHJFA0L+IA2eb5kDD34qacx5HH3zsNvbf/XKqZCQDJkuObLi0bGC0I2hsejE7JkO3cuz
         dFeBjbaAopcVrjwBuaHwlCMt8jE7wFKltOnpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632438; x=1788237238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=;
        b=ATC/XcfTGY8hkKI0TgAfgNBUvBovbWXWfUhDQGzVOaUyK0PLvu2HICE3xgP4VoY76q
         j0ecDjfXhxu/veERWzwS5Tasgd3YZvm9P2S+0IAKkCHobBkZsgoCUbGZ+R0jDu7qewgI
         Z2ONGhhERPjgSyGpZEtaprS7Z19aMXabuZMk06E5Aqp8J7idiXjVdzsftCyh1SEmPuI9
         OQYBMYfvrMP0nAXLGb6/Vc6DnY7Eadg+8kMNJ/c3HjvSVEKDFlUFRGIl+fdihVkD3vpu
         mHedSNT1rFWM0XXmuCJqMn04piucGywY7VgX3x5oQoyoPl/iz0XbMWObrXZVJnY4XbwB
         Z3BA==
X-Forwarded-Encrypted: i=1; AHgh+RpRNJ1hpOrLGO+N5Q7obs9B+oFrZv/vA130fkxs2JyPgIS7A+buVNXLrxTC4N1lW+FKCHsrbDbDS93q@vger.kernel.org
X-Gm-Message-State: AFuF++mnyudLUM1E2Q1V2ySrTDYxaZcEd/TT5EVhhNfUVcmsaslGNMCx
	hxRFrr2JrJygyvSLNH01ALYjF31pCxyvYjrHBTaD1qu+7N6+qr/zUiEkXVKSWY3iyg==
X-Gm-Gg: AR+sD127sIj33Wz1BD4KCFNZwg7sORpIrCp5QgXaQAQ9KlIKZ0dUz+30TaFMsWSPXxz
	0+eJf38rJfDNyV+FC6FQfQr1mbyZWcvD/2xRQjTVPbQp1/nV/vZkXbTfi7JD42ACLr+rs3ziq2J
	0VQj8KFnxnwF63wSSJl3Gj2tzpLTD33qSctcobHaQxPfbmuxPQ1nbKO4dHexnG+OVs/6ZvzNEMA
	IYBOi+MnfA2X2tI6onAXe0x+l3s0aHm4Z1fdRcxIXrow+xPnPh0lPX4ZttZRM+nwBj9VfbOglQr
	vgi/gFrYn+pnbf+q8hxnY5lGeBlPE3uys4EBHH4cqy+2O5nll6zQxb4GL0cXrncAMoIHyDjydu3
	CwNWfGpzEtLuePxS1hwo4lVw7OWt/YWyCgWogWGL4eKckFX81lE9qwadCQ7J0VmJWcbvdQd6jwY
	M5DKTsQbe13GSB2HSsjyhPkDXreZy1CeWrznX2i0hSPEkIt18erpRy+p2NV/TL/WBL6H6TkpUga
	Y9DYHH1PrDU4JEGojMv0R9R0ZMCAYtmlRcbqMpm+eaUS6M=
X-Received: by 2002:a17:90b:17c4:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39646519363mr6944892a91.13.1787632437771;
        Mon, 24 Aug 2026 21:33:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:57 -0700 (PDT)
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
Subject: [PATCH v5 7/7] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 25 Aug 2026 12:16:25 +0800
Message-ID: <20260825041628.988369-8-wenst@chromium.org>
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
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.860.g4b6b3295ed-goog

