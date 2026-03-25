Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1ED396B9B
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425523; cv=none; b=ad6bq6S9IpVIetQcfVaO8spA7cr+lTWmSlHUuxgE16MUMHkzHxqaEAe/NKh0PbBxCxTyDvdhvI9TssHyeocr2ill67AKlV0NHI6PwgUOm8P6JwcHevGjYWJ0Oc/38uc/eMlPXXwrvvK1XwOw6E/kRq6RBGovr4+bRVorEZFir3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425523; c=relaxed/simple;
	bh=CGqkR3mWoMrvedl9PurJ8WPDCGpOFl6GsXTaOWq1WG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNGhGBvbp4dN4cyj+PsPZTT8cvepjvBYzBaCD0YpAyTyzZJmoVNonC+3cl2bseFE6U7FmZmYb+uUKEf8ilul6stIfEdobO6C9VIup2TcCNOjMhNDx3Bx15poYZ7rR08Vg8Be1LAMmDb4qKAq4Udbl9NiDd8xbV/PFXixWE1WhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UBCEbWQJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UBCEbWQJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab46931cf1so5167675ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425518; x=1775030318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=;
        b=UBCEbWQJlLDQ0cPqF5aOpwqAq2ieTcaHKe5A3//wDYGwvPx4NXFvPkoPJwbfMEhgzu
         ZxfSCrkCdzdmFq8s9xZFfgVNg2GTsHBUbueNNNUa6MAaxmmYb4uH4GuOlboJVdv4xCSq
         wu5iDrYoRwPr+lgemaiwlDfYEN0UXIRLg9ZVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425518; x=1775030318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=;
        b=W884WGUv/ACk0KcV6e84RC+DShNG2g+qFfgN/6KDIjd5M/JRwFpcTTZfOUv1ERVbXK
         GO2RPIWpk8Eh1SQGu8g1QUfF5fwb59Cn91j4apPkg+kPGorwv3bRLxLr9A164wg2S4mG
         V75U9vkOMn+f7cLn74g2oyFvcgZkK4k0zqbpujBuuzf98FJLLC6GWHBCFVJvo7ej92bV
         9CtD5oLSsvD/SW6tfWmY+/xbSlFPBtjNRQSyw9vXeGk47vJ1vYX9uZbRMro/cw3cAfNy
         Lo0NqRBe0uVnUtyLZc5Q3MJlzMAkQPSznzKKW5UGqz5msUmPEXWu2sFr0fNcHCMWrlkb
         g4kw==
X-Forwarded-Encrypted: i=1; AJvYcCWwkpzcJ9QPro2mPHoHz69TXc5VFX95AaYnEX5bFvVke2ZozXBHtcI6HmqR1vAv5V/NPoss5WtvXlp+@vger.kernel.org
X-Gm-Message-State: AOJu0YxsYYq4ZQgdnX7fsxgxCBKjl5hNFqB3O/RY3bs7q3Am1X6vPWBk
	ciw77lSyKM3DP1GCATlXU9fpQNFBcWa+VPTEVrOyYKMm9GgaM1m6TZQTySjt5yAXmw==
X-Gm-Gg: ATEYQzyZEiUNkdEWvQwxwvwKEfC1uFC9DiYnz3cE4o+19rI228hn4PQo6aMWSU/atqT
	loFLjaySU1vs489bnKfuhUX2fOiRuRR///1ng3Ss4YodoV8jQ8ZcpALTv2n2W1IfeuYN1Ndk5xb
	nlEhiojY3QeP8D1UwdpIGjZ+pYtbYuXXXeMJrJcbfzG5Ojx8uXx66xQ+Zpak860KkCR54wApm8A
	KTEFr/scv+i8wCTDZNjnSGZTK6VpTVbxoLZof0ARAWT3jntvK6RlGStYUaJkxrKYgDBSCs9pkgk
	rRnOZow7zMlXFabs5uioC54khLzPMUKfaBUdjjh3ipgF1GdkZT0WrtaWvsJC5SiyVAd8ZYVVmg+
	6g8BN5OWBy4hJSAjL0QFFqip3kzaHuo3ymBGVo6kakHULkbat6vCH8KDddafvw/+IMcJcOjrWEL
	J1iPkncIjw58Lnfs67cDbhUp2hDSiiaQwvyKa7tD3yayOTLj9K+vgV4ce/EUAa9sC2+ExBrv+VG
	JT1d4VJiPG6/adXeQ==
X-Received: by 2002:a17:902:ec8a:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2b0a4dc9efbmr60505455ad.13.1774425518163;
        Wed, 25 Mar 2026 00:58:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Wed, 25 Mar 2026 15:19:48 +0800
Message-ID: <20260325071951.544031-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.53.0.1018.g2bb0e51243-goog

