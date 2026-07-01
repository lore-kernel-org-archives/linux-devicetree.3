Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5A63101C2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921218; cv=none; b=JhKBFQPyGiQfeQbqk0J0Hbe7lhx/6aogYz0VJ48OAIlpEocrAPyi3ms5/o44Qnl+Taqg+R4R6i7VUyP7uR8aJFi+gRNnmGwnphnuoAi2OZnQihk53p2dodhnn4D9ICT9TXOWFBHUEmgFuYoQQVxFAmoExI9PRdhMdr5agLAGabk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921218; c=relaxed/simple;
	bh=gHoW9k3dTGKJFXX0o0/bJ6XuuZ6pUUQjAI5TE+D+E2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRDKKae18XrPI4l+mno7DL/Bi5ifBHI9SGOEOqOkr398LxFqYF/Gd0/Vw2aqkWhg+gltsteFIHYzAHRmNLfG81DTPeiNUdcczqB5/tNK9XmF9PSykQ+2Je0pBQRVqq/GCRMFYs/gOq/RYyxZtkL1ZPofaYQcgKM04UDaU/4sjPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wxv8oyJm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wxv8oyJm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629051c946so623950f8f.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782921216; x=1783526016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ci+x4l7rGyX9PL16Opy1ybmCZaX0NHOsnDWtrHzkaw=;
        b=Wxv8oyJmVfz0kN6BrmtSCL6v3jhFZ+paynrCkQi8oBJhFTR1T1oy5jBS7ttQIP6/VB
         0e1aZ895pGwYYLdUzX5pRx5lv5E+BsvPAj3wJFHwga8KAymWhXBJlxcQD/D3g7yOL9yM
         lDWoK/fJUp8egEOB7+TFF6ffk5CaVNZeM/LimdH36h8Yls5MuOHPE9WPX2PobK5yxw6c
         WlPh/yo3NB8/YoLdMMqVfcM1tDS1mEreIrnE6atb6C1Pe21Wr8sjTXUl/JWPxE43FnJv
         cstD1RRsx5QNEsMlkybrFHHvN4IZr+RFBwPSjqB+K1/1ZmmM0SZ5y9i5usfg/LuN2O8d
         RUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921216; x=1783526016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ci+x4l7rGyX9PL16Opy1ybmCZaX0NHOsnDWtrHzkaw=;
        b=lvlgKoKD5FG0OqCsrIdho9BXPFJ2+0Pk3pEM2k6MKQVl4483r9i86Ik7zrIa0ruiM7
         NBc8mh0a8ZYxPOINQDamm92Es6z1j+Els+EAqXnZSEFgTTMT++tLNptCzxe7iaZuWjYj
         JpJi8IE/k4JXLwA3y382QjGXgcFv3wmwl61x+PtXM9DYKxtK8Q+oEqF7GrEeVHvOQ1KN
         mlpXHvr+5VIIMd2NoADmYWWJRuhWlhh9QdEmKcxnZ94Tu+GDb1io2WKGYFrhP1/26S5k
         b38QVOxsU56WUqOXT9l46z6yCLS2lrjutlnC9qrYc/72nOSU9bJ+ASoMLxncmFIBr+5E
         QjHg==
X-Forwarded-Encrypted: i=1; AHgh+RpF0TgsoHnlQkmWtg58GKRq5QU8IXwnVXDOoMAqiP6yWaS/VzFQL1DWuu7uRznhkW83wC+1rkWih70D@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3SnSBm9DWJd4nSUHkrrbf3pFlLed6o4zzag46UjJgm8YDFXGH
	qUYRmgKhYUr9nMm05V37Gx0uMRrp1ySPYQC1X2JV/II2Jm3FWOiWBr3F
X-Gm-Gg: AfdE7cnzp/JtDZX1tudiqgqiWEGxMTzOENG4BLs0opSVTUT0AgTvmAdkYgt7eCp9SKT
	CEb5+r8gI6bSDoAvnW2lad73SXtH50tdxglWKBasARPaW8tZeMwtpl/Cu0YuHg/K5fg0B8j2gBI
	GszpC1TWP+ZFunvlFBGJA2nz4fzcZdAJVP6tGoOL4ivURdVLxLQ6nHgQna5Rm5ic+t0+jypXH1g
	LjX5dscZu8pCleddPli1RUhi8AoH8XqIFNyA1Onahj5Bc6K2NapoVH1qPTFLo4+5ABb64Rc4Dmn
	Q7iHj/Cu/y55i0dTEel6ki/siwLCE6w+Gvj1hPOGnSETkxoAbMQDCul/yLPflBhcVolrKYvGAtB
	TdpmGJKZY8DYm/hAe9m7X9eAdwEeD9NE5Esj3qvADpZMz/CzzG8sayZf2wL654NHgmotcJ4bFjr
	iBcemqX7W4sZXDkQCcbPD43hAz+/9rCE2MINF1pebDZ3MQWkduqg9+nBU6BVhXUuV3uMxj5wIvD
	Ja6pfZ3lvP3phY02YKQ+0QT5Q==
X-Received: by 2002:a05:6000:61e:b0:473:1e79:87e6 with SMTP id ffacd0b85a97d-477437a9a5fmr3750786f8f.3.1782921215516;
        Wed, 01 Jul 2026 08:53:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm803715f8f.8.2026.07.01.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:53:35 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Herfurtner <alexander.h@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart: wm8904: Add INL1 as DMICDAT1
Date: Wed,  1 Jul 2026 17:53:08 +0200
Message-ID: <20260701155308.40612-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

On the DART-MX95 platform, INL1/DMICDAT1 is used as the DMIC data line.

Add the wlf,in1l-as-dmicdat1 property to reflect this configuration.
This enables the internal MUX to switch between the ADC and DMIC as the
capture input.

Co-developed-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index a20fadacaa6d..d43270a1d907 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -158,6 +158,8 @@ wm8904: audio-codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3

