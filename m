Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608914;
	b=rVhuaAxHD60eP0l35vzQHwHC5AFuOzAmeXyejSfhpgEwe1kEFEC1z+jf2ObcDvsIN6df
	 cXDzNjTxweBLOxpGr/OAi97ns49j5lwXxa3nEQeHTYL0gE3RG1hwLGEvNst1/r2fB/agO
	 OUG7mbJ3iVGzqRo8RjwVJ8lY0ua6/1hY3L9BdSC0udpQg027tLR9otmDp5mju7NiJCsVD
	 FbfMELmNpxf8umL8psjcswYBnd+5vw5Pa61H+VHvFJy6I4IpPMVwoQJUuxMCc+bANr/bs
	 Etdsy93V9VjiBfq7yksempDX+B5VPYVKV5sIaLxc2/UW7yWrcL+ZEjfqVRk9y6mW6mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Kfn2kJaqj5a8buHgct4ElOlQsQcSrldmQLwAbXiDSN0=;
	b=O5hbZCAs0bi+GZ7QItB8tFpmLJjujRxsLwIrzxsgOFOWw6sAaDa4jXyQnOBDiQ+D/4O2
	 uWJUqaCB2VPV9TtP5IEXZwwolWWbHorl/zY4lBCG4lzuyzrYv6iqRpU4rtXFSlrlPw8j/
	 5dWHnGFk72Djg/ravrokH2ytBnEx9XvKbxepzZG0lu7AhxtXqODYmWCkpXS4F5Qkz5nCz
	 EY+7pUjqTlpJFCIhkbWrCpqY/ewIWmW42SnxpzF7lhT9/Y9yveb7NfuqfndhYt7Ny8KUZ
	 cw45k1FtuZUSHR3UHsX6q4ze6TIkw03RwH55a4CQzsRQ3rLrSDFvhUW1Jh5wFS5z2dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X85TOkdJ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC198606A32D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC198606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X85TOkdJ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so58414135e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608912; x=1796213712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kfn2kJaqj5a8buHgct4ElOlQsQcSrldmQLwAbXiDSN0=;
        b=X85TOkdJEVhcb6xeLnK1cYMl4swmLYzFbN9gCBJulecfPqWZcDt5mCLbK8FHCqeD08
         3UAJw3vNELa5KzowjNG+6JbKQ7j9NAvwOP75FLrDf4uVPXs+viVbr5rxo/IP2XQRLLYf
         WD0xp8Y5tgIpnUdbhRocviC12DKnOH5XuIygxEUxrIkdQoeeKZuzDQw0yjs3mdBtPJou
         gE1K7ts9+lxO/9GjsN0Re63xWPeSkZ6lj8p866Jl2M+/PyDgbKGqTheD/zSOyMiXrxQH
         5YMbo7L9xY00Uc/BHr44O/AWU2YU0NQMxPhhLZLkNwyMi32SsJpgW4zzRwSC4ZVe41uM
         g9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608912; x=1796213712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kfn2kJaqj5a8buHgct4ElOlQsQcSrldmQLwAbXiDSN0=;
        b=lTNMjrnR58KuoAywB+5nCmwAYyUPRH3MQczsxgigZjB/9XXKzHLPuk2u2WKGAOTmvr
         1V4uGEZ3jy5QjoPWOv63Xc5TJhpVfNGq2wiDhaXJx11knEhBdhwfY2n/866xdEK5vFEZ
         PpfIr9dV8ETtj+E2id0SKetcRW52B3cduW9De/rL1rg4LCr3ZPYDhRd/qjB/QzwYZsjp
         AuwOMjTPEbDkoQT2qg3Dhpu3NJzDnVUoIfq8AlbbyLY39/01lfncN6Ic1QTUnyS+q7Ok
         kxeSuMWHmltUDqu7zrj75uHxnuLhJhpK+HW1rfIgpsZJKrCGcebhlJxG4S5sw0yqcpZY
         MWcQ==
X-Forwarded-Encrypted: i=1; AL+hErGIFK4LCRpqgQmwxP7lunr3UcxGyMF4dV5YmEBIIpQYNTwOUHvWAruiveVY4Ya9NMbt3d5fl1Hn87sa@vger.kernel.org
X-Gm-Message-State: APuU4Z/ezIye1nLzKjyKoehgHv5L1pi4cNcO4bdivcI+esAgAwr86drp
	wU2p6JMBCjGroAXKi3oG0ka/aiIx7lCqhOuir0yCEyAt7jdzpcXcR9i6
X-Gm-Gg: AZFdTZdDyHYA+9eosmWOcH/BDRnotf7OP9NKq5YQjZTyQaZK5ss5WWLbHMV6AzVfxCK
	H47WK8blrvSmT+ExKm2Dow0XYIgns2BvuQzDecmdewNHntGlA1RcQtU/6l/s7gqCQrv2ybk7jz+
	/asHKPrKswmpNZ+l3WzdZqznS/XXm0UdSIZ7k74cXBK7oWuAn/rUzIFrbhiSHhGR4/1sKB/4iMP
	ojUeG/gLXtcS0sOOo8UDTcgTg/GRampSdcj/Ul8WhvYKoqBmJKLMjtOgJXTBGiivn3EBiOfBeny
	6QOz9+SNfUYz0/BNl7+KI834D2PTVFKeY9+BmeZlpBEl/O/OxnZG2qf5vui1dDLR8je2h2JM0AZ
	HowFQM3z9NXYaYxnEoOsDz6vkXD0vA3R58JncFSZC5Gv9vEIEnjHhvJ2mLi93PjIPM78qypOLsu
	JwQg17rO0Ro/rsMT7A+z7SGdOQMTvrMJQcLZ+F5Njqog8RpXIvWGYWTbgCueJZsJq1gI/H+Y5hL
	Z42aKU8+Q9KUvSsiqHHW4c2dePwEeDIv0G2D+4golFaA5i66Zksc5V3p20HLJJDsV3PtM4rF9Db
	6G+rEjrrg2fdgLVbcpyM4qaZXTWmFgrOEA/d9Suarbw3mpSI+J2HuNV1+SjqMDkCHQQVuQrpnw+
	bnzgWSAw2ZXLQ77Pk+wij9NauB1khzR7dlmODPrYMqZ0LARa5kEz8ef7ksQOQ2dgE4cuzA1INT7
	y+2F3J+JI2Kk0WPG03i+Z6F3boom9Uqw==
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr344179695e9.32.1795608912020;
        Wed, 25 Nov 2026 04:15:12 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:11 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] arm64: dts: renesas: r9a09g057: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:46 +0000
Message-ID: <20261125121448.180847-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The GBETH nodes on RZ/V2H specify 'snps,perfect-filter-entries = <128>',
but the IP provides only 32 perfect filter entries.

Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' are
discoverable from the MAC hardware feature registers. The stmmac driver
does not parse these properties for "snps,dwmac-5.20", and derives the
number of perfect filter entries and hash table bins from the hardware
feature registers instead.

Drop both properties instead of correcting the value. There is no
functional change for Linux.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Since the driver derives them I havent added a fixes tag, in case we need
one below is the tag which needs to be added:
Fixes: 050ee38d0002 ("arm64: dts: renesas: r9a09g057: Add GBETH nodes")
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index bbaab75681c2..ee8bcd2bc767 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1664,8 +1664,6 @@ eth0: ethernet@15c30000 {
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb0>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -1770,8 +1768,6 @@ eth1: ethernet@15c40000 {
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb1>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
-- 
2.56.1

