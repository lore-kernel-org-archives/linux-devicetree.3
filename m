Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8C1443E40
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938502; cv=none; b=mG2k3JZJmEnZ0IcqaqibJ7eqrXJWRSI2JtcKvgPz0NCo6OyP2AqtPPqj4RveXRtNEiZn+QvxB41kVURYXXvPJnfLRm6OuuYtF3mZ1fiqHxjJB4sbPPMz89+u8sxxwzQXlawdkJfQtusGQnwqEs2/7oK7FCgjK6n7erPHBcwMqjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938502; c=relaxed/simple;
	bh=bdtfK8hlgNaxrFNODYutQUM199Ay4f+K5uqqRn3MwW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HyPT73trko3H//Ld8yGgSun2ZHflaprrfRPX8c7YBol2vOknxvWJEN/97FOJTRte4RtgAhnQabo7RP0j61YbHB9sRVvpaoXekex5YXuZVbT3MneB5xDGatkEAYwf9Q/2YJD8EwIUDPJeiBtf33Rfb6uF9pTxdFG58fvJDVjyD0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDBvlvib; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDBvlvib"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso80222955e9.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788938494; x=1789543294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=;
        b=SDBvlvibwtRp7WxoRjBENUi5Mk7PF4tbHz37lIYZBerv7MR8wWxDs45RYaxKpgFAWV
         pYI/DkS78MuIAuTGDO/NrjRYSVn8xVNEnDW60UocPGTgW5jSzIjsAkn/p7BynGilfNw/
         kdsBQsT7VKEX105ExxrK1qdogg9mUsbg4QXYchZS8K9PL85mU5trPa6zwk4GtM0i8CxH
         9npTCSxiJr2Ln48+KHPLMYHC8cxwbiDOrkPAkywyRhRxmylyzsieYIKOu3Hxo1LJdxYI
         pVevHD4eqqxqChgmWHfNJpBs+dYl69Yg+DxruqJA0H9OHi+UnZT8u6qZZkT5pkAe3Gjs
         La5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938494; x=1789543294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=;
        b=gEpC4VAcPLeU1rL9KoQyFTWz2KYC/Jzhwn+wAkBu8vN1KgwIpNwnobcP+9FF+cUiRr
         sJ1JLHjoET7/p0rH4YQn5Iy/97oKBOGgkKFLwjiRPVflSwfwLEpE8JmqtwenNdK4Q2Yi
         w3p5LPwQGbB4j7ilds4UFnh5ZGshGCKCrLjHeZtUo6oN9rBHpQEzkRrhifaQ8Tmq9dt9
         kZpAJnK3CevD3WQm0A5WmFdQd/vxDnjmp70Z7BCQOKIs+j7Tn5ggvlQUgp7pfkU8fnCA
         9hs6jFg3VuXYp/sdcOCSaIQ6hIIygYo7QbHLHaToxGlnDP14smwDtUIfa98UBpXcg7go
         Glmw==
X-Forwarded-Encrypted: i=1; AKwUvBxktTzqWqkqgL13xDQetQHbib8zMWNuZ9+Qix7S3+Xr5neOebWn8mHd9KP3PNKR3GBIjogOLQ5sWFf9@vger.kernel.org
X-Gm-Message-State: AFuF++k1qIkBUcVKbUijvsIBSCNSL6qywOgvazfszwyosRZzDJHRJA1P
	76vD2xroKOHNBCMbYud8LoDNfUO7VypMohqI8S6WbrmGQNdYl5DkZ/sB
X-Gm-Gg: AYBFou3s0emrD6SSWe35MMZxGVhHL21l7g4NwLBgTYQedqNhxABJxvWbebu58MUNE7U
	yx6tNQYb6YYS0/7Dyrr5LFMIVwNsqK/vffagqPvi7aZydgIjbw89lnZ4QLxvIBI06wSQAnvyi6c
	UX4bik2Wyw87CJiihzdlGc8XsbsXc1P+DRYcLBTOIoXGp1srZnwd4zlUL7/o6MUWOY+b7XOrzM6
	169nxDoK2FgJL3vYlwb2ZDvninmvSfxUAvV9TDdTJa4B3kft8fp8W3oo1/Z5ls4Xu6vY9Oga8BC
	jfyYAPxY9W9B5un/BemC+1wncZHO+RjmlanGvEvV7kihduTUT+GYGLy89RoV60EDaDTWTazMflg
	KEBYVgYvqMLQV5K6l2U8a62XwcWWWivPrp/VNgtso1gfj/LRG8/csBCYgGNsC7ZI0rm5Uk7LyCm
	QVLkBuQBlCE1daVIAm2yUw5unXufz5dFzR1VOcoNQ0IcTs9ghft7PP6SyZx0m52x4LCXE=
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr325233275e9.27.1788938493693;
        Wed, 09 Sep 2026 00:21:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm46703902f8f.25.2026.09.09.00.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:21:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Wed,  9 Sep 2026 09:20:14 +0200
Message-ID: <20260909072051.4627-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..596f673a0d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -95,7 +95,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-- 
2.43.0

