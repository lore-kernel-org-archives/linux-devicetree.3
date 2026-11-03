Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680700;
	b=yx8BlFtvy0EshMnhvdE2AWBC7DuoYbVmDY3twzHO9qsKU4MbDU4Qf95J/qz4ChRe7bqA
	 zhNcdaIILhjkqFLHKrEVfR5q9I/8+fL2I0bImk980sg0iV0Hb0YHzhzwZw6jU9zL+8I5g
	 f+HiBiOIa2WQxCiFFb9QYkDzy6gnKFrCPkdv1QXo+DS+j9PYNi2zjs98/AAFGkyqDl/1L
	 BuCgavMw6OgsPAP3oFyp35oBN+KH1oSPLiVgOlEIZf4mgX0i3usYcWVWHIB12YowKEmpr
	 H8IUpgJxiPN+fZADG/a87Lfp4OEK65ShSX70DFyDte9NThbjGR45ZGBpyORv1Za7S8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
	b=iwg3k7AZk+2yyNNsDcb4fUBf6t2maOBI08u2zA8ML/tuDbTLXkBU2DnNGKfILQwQjGjL
	 b+SiGwLMImXpkR5PAAz5Jtfcj2lixTnNQpAGea+zoPm6JUBtdzDYMCl2OO1dZp99ZSpaJ
	 jnO0flnkfxy0AUH57HnwvUp12BtoBL2mTTE3+7zNE38CFDg1sl2TRG5VNsMGu++HeFxec
	 qK1JjMiw0nBj7SKH6uV8Gfh2d2jY088hOCti7f2NORGL81yoVLev32RexhMgrT3EcrMiB
	 8lS1n8BtQ0Zwa3U8Oyn8SSD3WvIY+IeAbR65AdyTqNjWbnzrk9Bph9+G1dPEbQR6n8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XElVPPXI;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CFC606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3CFC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XElVPPXI
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so168804a91.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680699; x=1794285499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=XElVPPXIpP6fosW6+7K3jVrmtXYfBRPTpzAlgEI6/7G5HJ+9KEJPQ3UoWAaex8SJ47
         n5pY1ZRXvWc8XMYoR0maYVkdsXoSj0uwAHnNUnJyH3KKaMRiAFJdNbx6yD/d+aqssFad
         NSUa4WrlOGyXMenr619P4qq1AQplaGBT6NfEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680699; x=1794285499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=mazcD8U+R79/Oh0oZsW2sEwsW8DeYkQ0hqiE0jF4vhRtaNSaex+sATf87p913QKDir
         lKcEnIMEhJypD5BR2p4+P0CWH23f8J0WgY3vWwRRfq/zqKIsA3pNnlVhL94FINOGHlGP
         Ml1IPkYziR9tKD8Mj+Sth6dZ6Ra8d65KLBZU7UmTD96HPG5igPiXvqfauWzgBAotTZLg
         G5QAi+tEwf2JDhpHw14Rz2/S8ZH8X5jGBvHA+v3zQ9cAMXgXugUNE8FAUvBfaPkF1OoF
         0BooExf5M/TxceXy3e081n++ihVMJ5s03+PvaDLm9e6PWUmkez+gnc+Xilze8HxCztQ8
         Tssg==
X-Forwarded-Encrypted: i=1; AKwUvBw2EFWqmPcd1/m3nXjt8Ny2VW+FtofvD6CrJR3yX/9iFv7TiSZCEAT9FSZHpAXYyiaw79mPig/acyU7@vger.kernel.org
X-Gm-Message-State: APuU4Z/T2ToC+jqHBmrUjW0ZANNH37F5oAsNUXvOfPZ6DHmc6TN5Mp6k
	kgPuT2W6/OzE1hwgazKZg/4t0GhnAwgNCClpRhPwRTPgvRWtIzn7rSAq8YCz0l5nlw==
X-Gm-Gg: AYBFou3jloN3jTm9dvg9GHyScSk/92OC7E7R8+5B74/vSGQc3X0X0TXS3VVb0+IBsHk
	QQ29qFFqCJorH2TV16iC5sr0WYUkcifbfHLmgQ7RrbQmwx3cp4ft5qJKgOAudW3Z1y3/oo2Jua2
	YQ1rb8r+fJ8KJ9QLVEWR96d/jXcoGWoL8JPtSZpOixuSxuETAmv5nkp4Q+4TUA56CmF4x9+q50k
	q0Whv2/lhuv2uxofe3ZW9BZ6gq4uovmczPjtBI2g14frKAJE3ztw1twTf9otGS9tiCRuMG9YPRv
	ULv2KtluQRIGhr4r1f+GqTCxWDn0Zgmqw/gDIkJZ91gf6p1CFwVNx+65EIIyEe0oOOlSJDHPw9W
	Jz21Cs76q+tGQTRxj0KdiLbgwcugu7n0ony54mNWvkcT+SRfOF94VvVDkKFwLJSWBe5kFPUGt2O
	GQrnL61zcYR/2dAmFWj8ys5oD5EfqFn5q1MLwgeJ9N6w3ro9IUHW1aXPjTRcmVypJIVt4g6oEY4
	5iHxi/25wKR2we6j8RNBWD9oVtskMnfJ4W0EijJQxGuEbfjxxoWIgdQkBlXdiO0D7JbiifqdtNt
	i2Y1hKEmbxWAZHWQGdyRLiEU5oSCjrW98HUBsktfKJjQRRzwZnVWAJdA8mB0Q71tzpF28JGYMFz
	AWiIA2xoV+bcacWZUJcudjNFrXumm8NVGWw==
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr6631601a91.18.1793680698982;
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
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
Subject: [PATCH v7 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  3 Nov 2026 12:37:32 +0800
Message-ID: <20261103043734.2179858-9-wenst@chromium.org>
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
2.56.0.385.gac671c819a-goog

