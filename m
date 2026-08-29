Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E12EEE7E
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016803; cv=none; b=InG0ae8mT3HldKF1vID+Ivh/lVxa9uDLoMsRSYrNaYxTZSotG1Mx3V7egZGta6e0EUDcUn7oiROwOPVdv8rzam3iU8JfmXnRnYYxTIWOrdYQ4Lkv9yvJArTb5ym06DcUKxB1lz+e9d6AT+Q4XzVpRdfkE7LgrujwytFNZm413Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016803; c=relaxed/simple;
	bh=rRUx/95FOy4sgA5H4dvr49vB4SgWTuJknnNRbGFm4LM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TX8EkSFo2e766HYIoZNw/ErmE2u2gqSqMBU18Y+Kiin2Suicer3tt2pEwnC/ebpomDyp1Pup9jOhGzouI7AIW8SVh23Q5VbEmLM0/Twe2qdV27uiZb86xJSbywFsI+pD+R8TPo4hre/CzZZnt5fSmoQ+Qoync787wdhUmpsuIxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E34/S85i; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E34/S85i"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so19195635e9.2
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 08:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788016800; x=1788621600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=;
        b=E34/S85iky/B/QElnc9GVft7vRCmV4IjASO9Pg6ZvHXDVBN7cyeq5wRMRqRxtoxbxT
         s9bJ8YJmZK5ZkB2zmBLZA0jHbLup0CkrYbqEwFwbrMI8WSuvgVOdH20Fu2ktlHMYqXPT
         /Xm6Bdyvm0tgXGfpuoCyaNs+/8g1uej0P0R1o4Iy8x86uFqVYHusOqIvj668DWlZv/ej
         e8V6FPlZI0IMayFuHH1u7vLE8bP0XeQ5UJraBoHmcggdaBqqucJmzuXFlDxsiyq7DRuL
         cKJIfI0R2+aCdhPvtj2H7mxedlcjRyoQiYK7xOW7DjXTy2bSiJ7H1STUl41hYmFC5iKI
         683Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788016800; x=1788621600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=;
        b=R3yPaXlPrMfQ+SaLAdiWNIJ39A0QhUHkmRU2/9pW/Kqi/dha1yQSk9pOYsZkNrHOdD
         pErcvsn4+frafM3qfUD4CsVSD+Yyq7kLs8z/gA62zfYPoCXKD84ipZ/AVPtnrmc/+eBK
         Mm010lcIy7KzXOdgvvave1t6C8hYDPeCs78h+KtfPT26KFpY7to2M6KEbCl0V/wy89z+
         vTQOW7bqCtBZPs9nPPmT68pWK6fFJ1u8lOFM7bnE0/+wey95IN2ALYUDSmtbXPP6qNPx
         VhggJKmNiFgxpvT3b1tMpARZt+cvwJk+k7vAKH8VFLItodBxB+i3dnAR9ReD7ZjMKv+O
         FKtg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7U71wuIIZLpeaOJ49oRqunXpjrrSm7JW0dT2qipvG0ptJfmtdGv2tTqNuJK9KPOiMaEaZnROBjnY0@vger.kernel.org
X-Gm-Message-State: AFuF++n/4o5SPD83svN/N1BWCQ21r5uiUhHnNL7eA1oARBN473aXM4qL
	V9vpV7gMAuxK7+X1ufLNuRLfZH7MBr2GssAMKZXme7LpLpXGdLc/Ltg=
X-Gm-Gg: AR+sD11hiOVxL5R4p/AA6242rkNgn1JWlD/0XD1tJQaIyQU+9ytNzoqlnzNeYUPBGO5
	sF8bCXmaaSDCxb7Lz73JZtluRTsQzjd/yEEOlmanOtEIlVBVlyfZBD8lMyMS5otEIwrwFktP0Jd
	7YewIBEuNoPRjyDjxJAhmT9D0aqG7LADO3zky12vQzwA8cwuH4pxZFVKCGT+/ew3mbVmSu6I2KF
	kCmLJny28KtnFHPRerQi88qGXYxlaf8pujTCoaE2JF8TF7HNtiQ15WIlKe83BTYlky8kxS5LIlm
	eR4p0wPg2raLMjz/+ofiPMZ1JvfM1+B1kNSTq2q5Q5On4E5Z9EWr7CJvX2NitQ9m13ovYgimOZ4
	dk7wXbNxUCm/ZZ2FYPbhv8IazStw0HVO43SsuPuQFWqLsgCEaY5LqlF4LXHOYOMLcHMnSYR2uO4
	3zYuHZ+n8lT+DglRUjcRRcG9VYCoE5UtH97hH2L4mRE3iAyv5SlWOKjSqZ5OvxzD7sVnLwUx1E9
	Awvfe+h7fS6HunSTqH5O8YmUdVSS2f23d0zY9tj
X-Received: by 2002:a05:600c:3546:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-49b91c1dad9mr216188385e9.2.1788016799980;
        Sat, 29 Aug 2026 08:19:59 -0700 (PDT)
Received: from localhost.localdomain ([193.160.247.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm38959855e9.0.2026.08.29.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:19:59 -0700 (PDT)
From: Andrea Pesaresi <andreapesaresi82@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt7986: correct timer frequency
Date: Sat, 29 Aug 2026 17:19:55 +0200
Message-ID: <20260829151955.3661893-1-andreapesaresi82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT7986 architected timer runs at 12,986,200 Hz rather than 13 MHz.
Firmware reports 13 MHz through CNTFRQ_EL0, causing the system clock to
run slow by about 1062 ppm. This exceeds the kernel's 500 ppm NTP
correction limit and leaves clock discipline saturated.

The corrected rate comes from MediaTek's downstream OpenWrt feed, where
it is applied to both MT7986A and MT7986B. Since upstream mt7986b.dtsi
includes mt7986a.dtsi, add it once to the common timer node so the
architected timer driver uses the actual counter rate.

Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")
Cc: stable@vger.kernel.org
Link: https://github.com/mediatek/mtk-openwrt-feeds/commit/6a4c41c41410cd5042ad10c39da6593ba036283c
Link: https://github.com/openwrt/openwrt/issues/24789
Signed-off-by: Andrea Pesaresi <andreapesaresi82@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9ebc19610..318639a7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -657,6 +657,7 @@ cpu_trip_active_low: active-low {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
+		clock-frequency = <12986200>;
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.43.0

