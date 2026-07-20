Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF6D3D3CE4
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539701; cv=none; b=TMtPbj9RdE2ZmYf9Ez20WkNX8FbaVONCH+ZejPNbc5XsKCDp7+mVTYPLGxmWiNA6SfHgzSUPfHxsJWUsumnjE3HwXh7RJ7aTOBnIJauMSLug5lVorgZ3wAg2mhl+vjOYvZ2F5LnAKBu97VR4bdFYOuKcFpX4fG/d/0GfCIhmUAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539701; c=relaxed/simple;
	bh=/V9sJvZndpmsRScAh3cP0r3sgrdNqn6XjSrUe4fCf2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CoiSbOk/SOO21HLUW0lzTQwetACZgeXfe2do2E1YvX2mHpdXBnXBMUgV11axF01kefAvS12lFktNJxarUkC9yoE7RWDF5D7XDN1kugOMPJNiwgIQzyJs1w4F3UmnQzPVpV8TrD1psp3CeR8ysTeiYnI5YJ9Ria/sHXrU7J5s7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EEZWUTwg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EEZWUTwg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so5084047a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784539699; x=1785144499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KdohSLCmhYYN5xFaerOht1QxlaqSBPNXnoi96FiAJc0=;
        b=EEZWUTwgOs1s8bt8GtU86QmpeCTd4x2QAE+ODeOE0LehfaaLvDq3cawndKcDs2a5iG
         dZsFodb+taR5lNmtkOA/mfmQhZiiQ2w2z2+DCxKQ2mGWhVnGvzTqPslj0KVOuBKSs97O
         azUIsSYKsy/bKKNHdJBC2oYjOeTNNfBTJ9Ias=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539699; x=1785144499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdohSLCmhYYN5xFaerOht1QxlaqSBPNXnoi96FiAJc0=;
        b=LzUtva17aNCm8jQas3zonb2E8WdOaBMt0RHIa1ck+okjLQKY6sOUgwYCOfgTmj1dNi
         MOZLyfZFuppuCFZxZStKnlAe8dlyX69cUivgSQgBwD1xOPXfAY7e1OsphPkN/6PcRwdm
         Dc2qYYOaNnfvuIE5WFRUYkpORJbSK+yGgQn1VT99yO9lk9hfV3SDTH5QOSFXBygVw5tq
         ETiDGQEWrNGyI5UsJ7uie5NdADrDiJCapnfbWbGF1PG0ac2EYBqnaRgrVYhNT069LPYf
         B9bdsCriWaHIDBwybeH3QIIV2zutkV0flNq6dR32dqva9/MytBwqD6CPFuYuhZ4Xa7Dc
         x+4w==
X-Forwarded-Encrypted: i=1; AHgh+RrwXaTfOxjlG7lubLqa0Wmuc5Or+B0uwF2ZDmKJgUMzy9ljx/ipDecqpEW6IJ/V0KzOo/s4XHTG1V4p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1PDbK0QZGIY0Jze4w6mZtgYljgAIJIGCTddRTKF8TCx2BsXKy
	TZgGScAWE9ag0l1TLI6xKi+rPeBTtwuC1dt4yqINAJ8IXAPuEd6bqL+5e7UumR5hyQ==
X-Gm-Gg: AfdE7cmHnSRcJ7+gj2VTe1ncv9kuHZsH0bUU2joZatGCyrP9cls8OwRZWVZhJcXJb+2
	ZoNREMzURA3mFt5uXsyasMjoEGMHrdueetTrofzeqof0Sj0HX4kxyecTmcOfvVvzFY5nI8X9T2H
	5Y5j5otvZWag1+MHbMAkl8g1TsIbdF5BFgKbd7yvCX470K2MRgmGivLoQawXhu74aYDsDP6Iu3k
	2rETRN3XA7u2RnoYRl84JDXqAUPOD9K8d/TTeCO4WhRnXHobeMfyp/ud0mSDWGDUTrcyQnrdAdI
	mYBx5Ka30VlqpBRasIGG2igL7iHvvnFTvr5EcsdUMx2S+Msv8V8/+i+Xnl+FEjRqw5nn2n0384N
	Tqj+RZ9vSdtE+Dc/8qTOkS6erPeTluxEWaJx98niLU7oO1XgFowkcMe3UzT8dd2kVYpCgONLllF
	BVq1uvyeTcQaz1JEo6FGL8gGy2mxjsl4PORa7LZIsBSN6jrUGkpgIXXLWUW5I=
X-Received: by 2002:a17:90a:e18d:b0:387:e0db:bc29 with SMTP id 98e67ed59e1d1-38e4b57ee17mr15411812a91.41.1784539699255;
        Mon, 20 Jul 2026 02:28:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm7342610a91.2.2026.07.20.02.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:28:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on Spherion
Date: Mon, 20 Jul 2026 17:27:57 +0800
Message-ID: <20260720092759.1831105-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spherion does not have an micro SD card slot.

Disable mmc1.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index c02edba73eaf..0b976b09d47f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -64,6 +64,10 @@ &rt5682 {
 	VBAT-supply = <&pp3300_ldo_z>;
 };
 
+&mmc1 {
+	status = "disabled";
+};
+
 &sound {
 	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682";
 
-- 
2.55.0.229.g6434b31f56-goog

