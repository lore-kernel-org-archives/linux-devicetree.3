Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818468;
	b=ckZ+G525YhgKfxn0P68cT4pz5E4zCgfcGk5BoTwtYFHqUmUXr7oGwkHeQK+39AXoJv6F
	 x+TNbN2kYkH5wUn199LoZG6nXYijsXhvbix/L138AdlfhjH6Jx41/eko3xE6BwYqUqCu8
	 uY5zJ7AN3hXLtfQbidwnNthyflIcSw/ZU/JcVFsDszyq93aHoA5VUJgFZTYkI92iQ9cT0
	 79MdZ0JsN8nw2vjQ2pXK7m1RTPG/luU6lXWxFIPTWq+1+gisd/hxNGnasT3dQNmAs20WP
	 gkFlSso7TlssfMQ16yOq9WWGCPRijT/1Y/YEa9fy2gvDaGv6qHcTFtLymeKhaWMHLPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
	b=0+h+FpUV2MJddgqt91DmvYNjzVoAwfcax8gGdIDBCFbSZ1Bemd2Xauo3Oe7SG2rxkPlD
	 CkRX/vlmZeIbt1gvBsnYPxje947zxPfJetMEB28E0f5D7YsoWfodljYb7w8TOR/znvXv+
	 93Vlc0Ep/3rosp0DSbpiuEFoFRsfK+/TeSBLneRu4aE5fLcEhP/t2MkpLn40pOCbV3QVr
	 cGSok8ObEwovXWTs8v+hsTIv5ORIxJGkm8ciYpuO5FjpR065Lu1pD3h2/dVVWL7szLd37
	 PmC+vxFNjn+ugy9Jfz1aFCllSGGfOZRx7oCcXJ2UBcq1dNAROOcCNS9TpZbATZQCpsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7hwtTTC;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32438606EEBC
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32438606EEBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7hwtTTC
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8102585e9.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818467; x=1794423267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
        b=E7hwtTTCqW2epiO/054BcrJ5x+cx7VA4DDCSjg0uECfKGnWtS+FKv10b2UhxUHAJ53
         ouFEx7jKZLBPxA5L2DQlcC46nwWS5hnkER8yfh/6Q+XJA6UcFp5dLzJTgNb1p1uIhgxN
         gcR44tb/rk2c0jqHuE999JuHKTSdfhaA21Iniy5ur/Zw/bqCRyAezkt4xyxZtuB3jVTp
         eWFlP68kpNDF3hJilTGg862+xpObQmlrGRPNux3gpQ27bifH7dk9eu5ui4I7jcC85SYf
         n28h1w3CPbLT/7LJIqxuM028n9ZeWS/z8AMirzKJiBF71pimXtWCHaUFMvlADY985Wv+
         YCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818467; x=1794423267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
        b=Kyv+TYzgVouju7DZSt4QTFdjd8QfCdUp2QwDWu/bloIfvgYl4X5SB5ZqwtogvRDSX+
         cQCsZizAlzxq8231Gbnfionzs1wJVmsldwunQrHh42XEz4uIEm9zCRwRN5d/08GYinHf
         L93SnNCORDydriA+OL+iDfvq0hfaKr16xrgi2yUYvjAD4PbWGR1mo5H3Fi74DelGKFK1
         tQugALDiPZTzDiPypoAC0Hx62sjCcPYqOdUbCMoJF53VHmSnP4jXk+EkN0BG4ocX9Guq
         XSta8paO4fkufD/CoPSMog4GiLa++5s1oDwOuTktJq5tuM/Ufd8fhvACNByYMhI8wZxe
         7SDA==
X-Gm-Message-State: APuU4Z8zGXMTX6jkmCZPvjru5EUyo7hoJMsU0u+cK8sQkAz/BJyCHYRF
	mm8idM+9mp2/rIuaWdBcK84BT4MncstsmWDV6SLnmmyCeiPNxqzhvrpB
X-Gm-Gg: AYBFou2TUocBViatBe4rNo6DKGbL+8DpIJtYjZ//tHStZ2PhsaVezHJxVrb9l+ZQoPZ
	4+QNrIu1SrFrgZoDbN+rbRMvsHGOlYXw9vWGs7B9V0Rq0jXDKir95HLiv8Xpmr5k3T6L7xmfYcW
	mNA03OW+fhk0gciN28SXBX8lTqb2ceuBb+Xq/+g9Vt1Nd8O+3PhkedoNG5i3+4HN+RJp1qshaOE
	r/pfwkl7/Hktiol9NRMHSLYHCA0qssMv15Lrf5rALRQ4Es5MD6MdsHC7+YKS2nqt8h9vwBCkr1a
	W7AOq21yYLHTYi0kThNnnPDSpCbFe4Wnu92p5dz/voESP9MIkc/gw6LFc4NOk2YKGrS8/yj+JaA
	TNJcmSX911y6Houl/EA6goc2/1UlMkFl+ZEaJiGHA9fh/1a+mUSfvO8Pgji9xsQAIf9TxN7vDGy
	OdWAcivBYWvFp9qsv6MF1zcMFqr7LinDTH/77nHk/U3mE/UCr46cqD0hM1kBn7nlpbJEKltu9CB
	zAmxyvkBZmfZezE1X30GaDzR/527tPBgI+YTZdoUu9lsB+Cx4EuSdaNN7mS+a9gRQfubux+jMHI
	EHV0Sa5XRGgHGZA4p7SzfY5udij+Y2TU9naRBnUo9AMzIGjfM5K0vIderU+dgO2vxpavAXnBBZl
	tuQlZUUlXqUlEQ6ofhW5H4oBWuKdjyaZO5ivH6wtp1snbEoctSSxwYa3Sqi2QL3RHnqA2LC/orR
	YxFehTtVX1n8S+G4HWEFl1GsjXerMuzasVkTzDmTRswzsDlmHMTWtmT20tymySAgIQBsITSsNNv
	i9c4O/LwPG6XBcgrecm4yo6mJKCunLASAJv6AgkMxGqWpwjmyEeMoCZB5A5ZhGMLg==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr378666935e9.18.1793818466426;
        Wed, 04 Nov 2026 10:54:26 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm4687805e9.11.2026.11.04.10.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:54:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h616: Add CPU cooling map
Date: Wed,  4 Nov 2026 19:54:21 +0100
Message-ID: <20261104185421.883883-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The CPU thermal zone has passive trip points, but no cooling map, so
nothing throttles the CPUs and only the critical trip point ever acts,
by shutting the system down. Throttle the CPUs above the 70 C trip
point.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..e4e0b999473e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -1105,6 +1105,16 @@ cpu_critical: cpu-trip-2 {
 					hysteresis = <0>;
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_target>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-thermal {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

