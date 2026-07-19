Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB023128B2
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495638; cv=none; b=YaKhvWJ9xglZfAN4f3GKqZJP+ab5+xT/SEgOAIed7S4YO4QKk9p0Q9quf3E2M3leEkA4hiRjqxzhHzlrhHKWlh/pDnCPW7IUbE86sU39iq1lnJ/0xHDat/FL1MziON9HNvHf0rLfSNzjoBCAflz+B3i3BRMWyZcUDVB5T7YDxTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495638; c=relaxed/simple;
	bh=uZZtbCVhOKhzC2tpXj5NKZbfR/sFeNe4FarJkD89skY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qm2I9nFiCq4dSuIWL07MybX+22RBSQvCELXan9l1HneR/ot3Nf2luj9ZYfIoLBWDJJkNY9WSRtGMSdbU5v4vvS2nke4zjkOkMLgcrIu/EYK4a6WClhNHgBABkWU98YSc2Qtx9r74Lvv+ISUO7J1JiHwrVFUmKcw+v+07/q1gxmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHOMQ3E4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHOMQ3E4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4955484387cso5289325e9.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495632; x=1785100432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=;
        b=HHOMQ3E4s/WUkEluNM15tPgrFhQP51cmgDqqvt9kY4aoF7clbLQCDrgkcQ7blMfbYH
         f/itB+tACSl5q/h+FN9fV5by8AIdZqLm236IHMZ/GFdL5IbqCJgOzQWnb1BEIQv9y1+B
         PcPukeLfhkcQSEdIVn4Q7DEgRCBcuL33gwT2fj09JjXC2Ju1kxnDe7Z70c4bipKYAvPc
         8MoyJ7rwjtDABDPyUCerWNWtI0kjo7jogTVUA9p82qKQB11e6q6mp3J6aQfdL3qQFMiU
         z5PNFcCdZB+fw/40DnBkzBIuJRbuDXMREguBpRuJnAFfaNFEymm0/6Q8zndZbFbca/DU
         ahCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495632; x=1785100432;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=;
        b=Z9Pm3sGQmIhokf+ePO2TLNcn1mnKAcqCo2eDHgeSTlxIk2MCr1R5lwx0C6QjnMKj7g
         iPC0jr5aMZsITcnmxDMzsHgGlE3eGTt+wcgoZYXjzdjopVktHt3g5xK8jTf8mnCFhA9l
         m5kXWzx3hUZfmdujZPp4vIdOr2523V77idF8PQnerhmhT2p1KzqTnUnVcGZaUnKzhpJN
         2XV56f+Gg6GGFo6aJa3bkprozMvJs3+BGIoUyMeT8jHwqZya3S6WqV5ZGd87LAG+NAjn
         EDpUFByJsMDUGBLPdSpSuPX3cWbZLtVwqlvME/bpJF+xY5gNGUmWD86ZwnYdTvEY4QMo
         qPbw==
X-Forwarded-Encrypted: i=1; AHgh+RqmixeigV3GC35dkCb84BzhUm+oAfKKNVBNleW7x7hvE37f+bNpczFqqMX9WcViXw8AhXFYlerKeVXi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgu813ZeENgZG7fm1UFqjYpOJHRJyj74kkqLRq6IKqwVgpIV9A
	jPtjY+5w0ZUUtz60K00dFjX9sLh/In9sKuy8UBWh/E9STpR89NnalPjw
X-Gm-Gg: AfdE7clYjkAr/zdC+mIdboTnhxjdLMAtr06Qf3FfBzoy3arpXWSf0Y0Jve5IFZwMYWb
	HnIb1H7f/z7VAkGL8/2J0Ao98GnA9paM0oPZ9gsuKPLHAAmOELyGziz2S9nww7WTs4+72LDXimu
	EBphR8kl931iQp9IvlMhoyfdbMX4Yub2mVhe4YJSRFYaIi/jfWAeE9Fdf4CkwjtryYKA0oB14zJ
	4qFX7Rp45pL3YQUMKy7NApP4TCZSdzMJljLifc+/d/BnmxenW+uSvr+U6Xtm/B/67Frr4ZV/SEc
	KYDwNnDEXbh9x6rvWX3EdSxBlgzveJV1TF36hTIbXdEhvwmBaaggo57sFSWQS/5mqIgT94Mztl5
	npC+kmizI+e+mzyx2ErfOLqxFt3o8lPuChrEuc1esIu5bCQ8q1lM4WKlXFgp1SRMFESuQmTMCH7
	KGdxx7AuDenyxsl6Eubq/hTE8oEdxrbdgpY7/3
X-Received: by 2002:a05:600d:8494:10b0:495:4056:2c6d with SMTP id 5b1f17b1804b1-4954a402f4fmr101550685e9.23.1784495631684;
        Sun, 19 Jul 2026 14:13:51 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:51 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 4/4] arm64: dts: allwinner: t527-orangepi-4a: add GPU OPP table
Date: Sun, 19 Jul 2026 23:13:19 +0200
Message-ID: <20260719211319.982285-5-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Mali-G57 operating points from the vendor BSP universal table
(150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU
instead of running at the boot clock.

All operating points use 920 mV: the BSP table specifies 900 mV for
every universal OPP, but on this board the GPU rail (AXP717 DCDC2,
vdd-gpu-sys) is a fixed 920 mV supply, so the OPP voltage states the
actual rail value and voltage transitions are no-ops.  The higher
speed-bin points of the BSP (648-792 MHz) are not included: they are
gated by a SID efuse bin and need pll-gpu as a live parent.

Depends on the sun55i-a523 GPU clock divider fix (the OPP rates are
only produced correctly with the cycle-masking divider model);
validated on hardware with the Mali cycle counter: 149/199/300/399/597
MHz measured under load, thermal-emulation throttling included.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 055be86e5..0fd73a1bb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -30,6 +30,35 @@ ext_osc32k: ext-osc32k-clk {
 		clock-output-names = "ext_osc32k";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <920000>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -116,6 +145,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	operating-points-v2 = <&gpu_opp_table>;
 	status = "okay";
 };
 
-- 
2.47.3

