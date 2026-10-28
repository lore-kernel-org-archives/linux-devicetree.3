Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195184;
	b=sTrQ5IGhrTZ3VUqiUwQq9a22BC0CjN9L50SgObRr5X3kiLKwSIpl0SvB5OZ9G6gAmkz2
	 PptQ0OUzBBVAfe8KwjPinNUxLTyDaZP2XYkql4eG+so+QVHFbeTeR84lwGVgMnroYsMH3
	 5s7xUgl/edNAy5Ct00Tj+nnKmqDL00+rTwe7G2vyeu2MEXb2G+4XcuM1UvHcKqZgMA1ur
	 EZHnehAFJEYceYqIRh7TIebx6+x5NfUoXFDWt504o0vKJu8Ld4MVZGP2slYuMqtP8SxQK
	 ZNw+qQ5eIOnxS00vvJXMeXaPYS6GGWSbqKDXfW3hjFcBEPSbQZgCfI9yaQmwQX7wzQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=;
	b=vZOOHrCsTHQu4viytJ18qOPjT1ISzPLvn4AeXYEGSkiaMLcFpW4is+gdeUTd2bmXarvn
	 OW5ufxeBf/Eijkj6DY6h0t0KRuHQt8lvG0VoEvuy5E2t+bzWeMYtoTA6SZK2vuw2sw26J
	 h+Zk5TJr/fL6+PeSsnMxQG2wSBPZVx4nnp0UJegi6D8xXJsMdUgDBPu0xD/GAStRTJkeA
	 MhTHoW/eLdWb31A6FhLn9wBtc4yTjJ4uAZlO6KGxKxH/464qtB5bQm5gvv2tFcVwkfX2D
	 D5RNYSEOn9pbkemT6X5DBkwu9SkTBm8FSMQbhBk/BDqUpLhxfuki6UJtcTgzZNf6tWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ROoN+2c/";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7865606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7865606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROoN+2c/
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1846bc43c28so1119050c88.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195183; x=1793799983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=;
        b=ROoN+2c/8mEv+9bfY/JEsHLydAwpD0pWzkQ6bLeEWvQ37MJdyNbVpWLV6CPEuGiiM/
         9XgW/ONO60DSR/wMYtf08tRBRjYYWFEZRGlwoA/4F+WIZHe4lTzRH49qN/3V4BtUao8E
         cIjLCHmPZxwW+hb314/ZmOK1hM9bSotsYtstCm+pbkdph341sZPt4UMjsqFvUFgNo/E8
         tUhlnbI4wLxz00q0sG18BHalkONIXy57I/F261SRMjCZZDLdqSMvqHU2tnPLi/UPc5f6
         dqyekgSV5ZUMDqvRnqiJvZCyYrIpvx0U43c5nrI+R/T1+Fw8nkpQtdaiII+uvIydP6vO
         4wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195183; x=1793799983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=;
        b=2WzoY2F6saqtTWDzW7QX+PyjPgf/IhPgOlbczTrckhRKl1m8fMKFHQswSUTErkJ1Ax
         cPyni7i9o6gyrrjL+GHHZeU+vqKbn72+y1mN7Ae12lhB3OqZSsbmzTFQLVjfb6c3VU0b
         a2g27qA0e3FDfRewGtWbseQIin3HMuJEqHxWQXrqrDMOSVV7wja6yhsQiWAUspmzYiaX
         +2TP+kqn2BStjAZyU8uKSXy5Z9SCipXH3W85KKENV+Ck8gKkwdV0C387tjbyIg3Bq/G/
         30iB+HB6vppX6S63nbJ7EC13Em+C/QO85dtHGvLQ6ffmZD3RV3HAVBUeGbQruJf6RsqQ
         u6bg==
X-Forwarded-Encrypted: i=1; AKwUvBwKu1Z34ONINoh3QYd6Wt7nPycmWYM+cSfGl6+3Zi6KfLpEqoF8IbwfW9JpLzDwO0QKf1ErIHJepraO@vger.kernel.org
X-Gm-Message-State: AFq9FYK9qNlN5OvlSuBVvk1w1FPgfZW46MMC0J3I1nUVDeErWtK9gK/x
	GozufNFz+LQqUXnkUbzQecMA5bPiCMK7fcFbH71LsMcOmCay7LzVEup5
X-Gm-Gg: AYBFou1VfT80FuLTVq2yvCe30MLrSI18vu7XHpSwk9GKYIcfr+PRLEUVgXqQJrsb9r2
	ziwgtSrFqTTvPlwlKyP4qFieHUVRNeLj28ndY0Tb3wn6G5gjToVzVSVjc+fmu/XQiXq/cCKb1bo
	9+eXcSrdWagNw8wb4tMN5C2WxAYisZuuQ/G7853m6gA03m1uCVsyOo01wn46GfFEGRTjv2J7r+C
	C4EYlgEfAlY9+isDXzmbUTyAJWWkgycNzlVUvaqigOkgg0EAjBfSYq16WVhSSFKs8n9eB5qpgx0
	ubL7mRFBph+fldcGEyebKSxWDAj2s+NH7x6v/AZw6A61yZiVp+pOKWRo494qMDgnmlNxX96vA8N
	W0QDwvLbHNw2lFpHcm7RL8ACNyncYlyUYqDsVRP6Wv5CRAhhMbxUzZVDNSGdQnTGseCC8VSE+Xm
	2qdAk3/YTXTicsOqo8gqInWX2pH9OwElHcELCmnMJA32ozGAWWNNOrtFc6EcpoxCQ6t86vmHoaI
	dSXJXBJGugIeVBKypwBlS1xLLxW85GKIIqsPbjjOzWECnKbBHMhw7cXcaZmGH+bDsEkX+J6HjfT
	K5a1Z9ikHYPxnrhIAw==
X-Received: by 2002:a05:701b:2044:10b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1a6cfde23a7mr3093747c88.41.1793195182199;
        Wed, 28 Oct 2026 06:46:22 -0700 (PDT)
Received: from jklsarch ([38.244.63.126])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76056a001sm8583561c88.22.2026.10.28.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:46:21 -0700 (PDT)
From: airjinkela@gmail.com
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Sjoerd Simons <sjoerd@collabora.com>,
	StarField Xu <airjinkela@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: Fix malformed SRAM ranges property
Date: Wed, 28 Oct 2026 21:45:44 +0800
Message-ID: <20261028134544.594888-1-airjinkela@gmail.com>
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

From: StarField Xu <airjinkela@gmail.com>

The eth_sram nodes on MT7981, MT7986 and MT7988 sit under the soc
simple-bus, which provides #address-cells = <2> and #size-cells = <2>,
while the SRAM nodes themselves declare single-cell addressing:

    #address-cells = <1>;
    #size-cells = <1>;

A ranges entry is therefore sliced by the OF core as 1 + 2 + 1 cells:

    child-bus-address  (1 cell,  from the SRAM node #address-cells)
    parent-bus-address (2 cells, from the parent bus #address-cells)
    length             (1 cell,  from the SRAM node #size-cells)

The existing values place the parent address in the wrong position, so
the 64-bit parent base is decoded as 0x1540000000000000 instead of
0x15400000. dtc and dtbs_check stay silent because the total cell count
still matches na + pna + ns, and the sram driver only translates child
addresses, which currently do not exist on any of these nodes.

This is a latent bug: adding a pool or export sub-partition, or any
other child with a reg property, makes sram_reserve_regions() fail with

    reserved block ... outside the sram area

and the driver probe aborts. Fix the ranges tuple for all three SoCs so
that the mapping actually resolves to the SRAM window.

Fixes: 65f0e3970143 ("arm64: dts: mediatek: mt7988: add basic ethernet-nodes")
Fixes: d0c970091abf ("arm64: dts: mediatek: mt7986: add sram node")
Fixes: 9846a8c60318 ("arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support")
Signed-off-by: StarField Xu <airjinkela@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index e63ba3ae395e9..2718c7dd7eb60 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -492,7 +492,7 @@ int_gbe_phy: ethernet-phy@0 {
 		eth_sram: sram@15140000 {
 			compatible = "mmio-sram";
 			reg = <0 0x15140000 0 0x40000>;
-			ranges = <0 0x15140000 0 0x40000>;
+			ranges = <0 0x0 0x15140000 0x40000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 318639a7c64e9..98fd74824653d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -579,7 +579,7 @@ eth_sram: sram@15140000 {
 			reg = <0 0x15140000 0 0x40000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x15140000 0 0x40000>;
+			ranges = <0 0x0 0x15140000 0x40000>;
 		};
 
 		wo_ccif0: syscon@151a5000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 8c9a5aba25791..d497ac826d669 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -1009,7 +1009,7 @@ eth_sram: sram@15400000 {
 			reg = <0 0x15400000 0 0x200000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x15400000 0 0x200000>;
+			ranges = <0 0x0 0x15400000 0x200000>;
 		};
 	};
 
-- 
2.56.0

