Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B14398FE
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620474; cv=none; b=TxfC9QCv3SLuaHK6mXZYmAxTDho5KmeE+44j6+XqAk+9qcit6ddG1rFdhfAF6tOzZ1GcyaJLTsvYfNWOSYvpJzfkpSxlac+z+nR30Y4boXoDvDHjBkkGN9Tg+L7EIx6bNyJOR5efQflXKsporJ6EmvJ5+YdFjkoja9lldiouHRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620474; c=relaxed/simple;
	bh=YmTP+U2Zeto/TOo03rVHUOI/jAzel7OhJkJFnUSba3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWCrU7CERYG6phfZuDadqWbM561TJHeSgesCSRbMCpF5MgnGs5qL5kYGlDUyHUMp71ESPlbrKhbIqlktb6cIR1bwQe2obf/+RpIEdcrqyjHvYTbX1U2EzEk6SjwE8DRce6bOtScakCKAjkx9BUXTmqfFNP0Hfepa3ab8XVLfHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MDS+uyY5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MDS+uyY5"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceaf8a1265so108677915ad.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620472; x=1785225272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=;
        b=MDS+uyY5XftEq1uR5cmUwi+v84CjXBTLfiNC5c4T6NnSUEn9MKKbUZ1A0oRCTswDLk
         LD/qdSPlEXGvimFxAAxA+uOxm16hqD77zcGariCV+CO4GtfaGGAO4W7vhbvdI+bPdujO
         5O5OXmaKy4H5KWnYju83Q/13kyZXHSw5Czfc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620472; x=1785225272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=;
        b=rkwbE7G801TJz4ggkYwvQe03VhdJM7kJ6THRW77SyqiWuyZUQiEUwNrN8qcxLnz6Eg
         rgbNy4jsKalCvnB7tcG42jBEVP2FpsUhbtoDa+PS7fg+k6yayPI8e/u50Qq1q8GjWcCQ
         BobCiZa3LAVUxblgsB2dgRtkKlcORTusIxgCDuPUY3dydj62XgJ5L62BJFcyl2ObOOMp
         M82jpGdUfFQ3Fh0a02BS+6dhzBPpV4ATH/G6vw+7L/e0zzH3TsHqoF3JKzKhPQk/+jzH
         xQKFsCk0QW7pRq+ZDC+vuXzrXByRQZhlP7Mryw+TDO9P5caRCUEeL120alaXN+35GYEp
         Qw1g==
X-Forwarded-Encrypted: i=1; AHgh+RrvWz6rSEKr+3X6FGidbfW175crdybCCF5ZGpu3d3dsYemP4OWbjwPtPBHCKf9KAqfbP+foZJgj/sE4@vger.kernel.org
X-Gm-Message-State: AOJu0YxA7LbJA3r2jw/EcSwoAM3TGPpakfViuanPMzyv+QM1b/Z+nGeT
	bHuDeqw3jNkWaGVf1KtFZ4cFu5nRqcPVujpF8Leftf9hzMvcyrMsXxB8c5jNPFnHDQ==
X-Gm-Gg: AR+sD102MTsaX++3FaJ6bDkkLHzu6nJJkiGIRP03dsukzcjVa18cquxHZXO984wSq2F
	0s5W6WFwWTrbeK7M8wKe1F6gBq3urMFcI/aNEBLo/gWFQMjVMugX4c7j2UPXOiYCwJECxOxbQ0k
	qbSw7kGpLqcz46tHWsAgAv1PTx52QrNUbgQqhd/NNr3o8wzvFgOvaTDSISo41UCttIZersbxMtk
	mnGgnOXzNyGynebYYfWWZwMdwVtsHi1znA4fWZBGGsazIJf2/BaeBt66t8ImyOrD5sQSDebxZsQ
	v7yVMVePOSXP813KzIJeHKsLV/MkQr2z42TNA+81fu8I2quv+GJTFCsOF6U2t40kn0a2oF0blHe
	HuSX8YBwhmIlQRmuernF5lgzwkuHreCszv9l8PSuMYCALcHNKdF0i1CQT+WflSe2PlHNzZRXiJC
	qSOmQMk+ZNdXYHBbuxNqty4mBXb15z33kT9Y5WPq2dRijiO19zWvw+FUvSUJ75xou///SO4Q==
X-Received: by 2002:a17:903:2b06:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cf83635d95mr15956285ad.26.1784620472296;
        Tue, 21 Jul 2026 00:54:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:31 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v3 9/9] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 21 Jul 2026 15:52:23 +0800
Message-ID: <20260721075226.2347933-10-wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog

