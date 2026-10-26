Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018112;
	b=V8ny63DnvdNc6SBS5FWFg/EZy904VKd69qN1+RqwHvhufNfIyE1koN3P0ZDDxHhCmwJI
	 w/0A8TYkRyZl9KP9OjmodkiEDcLzTTMi8/LSqSvGMQ6UIXfy4HnkgR95lGGTVBqzF461x
	 dvagPVPuUqI4DQ4bQHN7jAetoPuEW45xUBptjQWsI5mpwZTnssm9AUH0eu7/v7S3f2ReM
	 4glMgflsX4Thl7w2GvyP4W8qrecV7AzQb09wJl0bFRJd4RYmh8j+Ik06V0P4aQeHnhG2n
	 VfZVH0JIMIo8drktPk9eX87mnZqRtBPwhRNqd+Xto7Ga79cZ/9QJ9E7pGm3+aD5t0NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
	b=NTl3Dex5VkzwQ91l4bimb72/12nAnI7KmVlQCY8ixccXa3iiGhHpIIyoxM27L7khetAE
	 TlsMpltmKcS/wlPq5ozOf2Oj/ylRNooKVSd7GZegcyuZD6EHJ1VVo2IcdzeybyViKGJW0
	 uX53bzrAtjQ3OZN1Ir5SHUzNFsIhd+yloYNKpqtYbPRPDAi1ISOqEX4Dy7U5xvsqbOy0z
	 43PdIyqvUyNhPg542TIKIDrLb88Ahq3RMiHSKmvmXFWDQA9mGuhE55avRqMIOkaZK6mjw
	 cv/DfwXrcVqYFa5LMDu+pLOFK32cX1u8NWqjWcsNfwXXGGAJWoCuPGVY+bxRVAUQX0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qkhv+Hm9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0618606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0618606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qkhv+Hm9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13684145e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793018110; x=1793622910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
        b=qkhv+Hm9IYH3dXC2pNRxrOmXBhnnePnkId7peSsnhaChoeVp3+7806GdtwGAS5i53p
         nE7LffofTV7VqZUr6sRHceBvM9ne3E+RRNxrkrK5i7QSvK7377A8EzSmcF7HvZIWVBwJ
         ASC3LtPK8noipN+A8tHTWY3+3YSBFQwleV9UyzuBKMnxWwrCWNCjhJmra7agliSt5h22
         6UM6qOnfUhFZrdt/+jLZy6gas6JEF3pL/65l6XC+qbqnaGlMlaL7B84RHe30WIDjlpw+
         vrBAUxc4FXLpmg3yrWW7aabuYTmrZi0ihqHLP16OOHAIT80DdbhPTWrTJKe0HlUBIZCZ
         tSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018110; x=1793622910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
        b=ta61XIiwghLxCLGJPnNRr2ZUpw1PawNr1DnOodN3uNpL5VIs6vECmS7nRXz+A7c0j3
         zHWm6O/XmNYJlgHg9d4ARJPRGAj70GL+zYALpE6JTYaoFdmhdIlqAo6qlkfM14Za1sQC
         oShv3CY7zfK+SSfn3mjr3JJp0QxiGocQL/sdNyTIfME6sT7Mr3G+/gDQReDmtcYuS32B
         dwMM/2uGRzzfonfsRsikZZXfj3ejkWKdQdFlqXwufIpEE31MUDHoddx+2EgNDmxQN6U4
         zKtBK9gMt/zp+yfBURsAyn3pQyXADdSrEdt2GaxzWHvP6BtbLyGsPbRSs75WNRnf1j0G
         vBVQ==
X-Forwarded-Encrypted: i=1; AKwUvByU4A4GtpNUjjIeiCtsxVMpxNxPgKrI1racMQr1sD6qcxx3MVP407YVT5drulFIBLQ2hAnJVLULW00U@vger.kernel.org
X-Gm-Message-State: AFq9FYL/40YVNKQsmqd534OlxM9Fe+r8M5d72WOOd7HkEwNrNcM00JE8
	UWG1kxWMz6JZCQY5m72g9AQJ6aFuR9drCGntkdWqUwnQNO5jye1EXugp
X-Gm-Gg: AYBFou2mNYF2aXQ5Ggh0Qh5z6P5wDOc1FesjtP5HoKjPikSc72xoBCcdgL/ZiqoXkAW
	pU2AKE6P3OInRTjcGUCAbM0uot9N7Nc0dzn4K60ICwz54bAxjnrEjWIj+49NKM7uVP+Zcdh32II
	ZZPSv/bxJgnu1y8dEL94JAaTg11vQzPm91EUg6d8CcNE37TtPGGOCA0So5ilDQTw/J+Cs9GM+Ma
	Nk2McZEvFsNLDp9m0J8OeNisD6htzxDH/V76JMKYyZnbXT+4pyfMCWVzWFaBZ8VfGilGzl6BvRX
	wjGAWsX5bnLeKqPpqwOWYs3z1QATn/bLDx1lO0hLl38nXlhcIE/RUx5xTticAkca+05TPmCXtUp
	pagpHehkgogrgj/5Jsyw7P+FE2+tJucgaaHZeggLPsjtVMEoyQ/jEQVLZEv64EYkSYFMadWJsuo
	XZD53AFbxVH4NIaJ3nnF3bxNZEeWyPP4oqsbGFpmssUSE76c3xEB4YmZS4LkUMwtqQMyGN4+2aD
	7ON6Pl48tjOxER6pJ1dFhNYR/rWJ6B0OcEstmVvOxdu1QkNle1tSiLAJApViROV7jRyo/2Y/UFL
	tBmpfNzEU4ScDm4XCw3jzHyEklg9TKaaQjd3EnOw955huMTN21c01DjlJd4cF5eoZco/30BjwpY
	=
X-Received: by 2002:a05:600c:83c7:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a35ac39cedmr117361485e9.3.1793018109889;
        Mon, 26 Oct 2026 05:35:09 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm19175944f8f.45.2026.10.26.05.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:35:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix TPM reset polarity
Date: Mon, 26 Oct 2026 13:35:05 +0100
Message-ID: <20261026123505.48909-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

From: Stefano Radaelli <stefano.r@variscite.com>

The reset input of the ST33KTPM on the Sonata carrier is active low,
but its reset-gpios property is declared GPIO_ACTIVE_HIGH. This
reverses the asserted and deasserted levels of the reset signal.

Use GPIO_ACTIVE_LOW to describe the reset polarity correctly. This
fixes the TPM not responding on I2C and the resulting absence of
/dev/tpm0.

Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..2644b7c1239c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -259,7 +259,7 @@ st33ktpm2xi2c: tpm@2e {
 		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
 		label = "tpm";
-		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.47.3

