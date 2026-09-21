Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55B548641A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988526; cv=none; b=tCHwas7FjVB3/jGIzl0JWU+8YdhvYMvGZrcSoCFvEQOlDLWCqCYQmb+ftX4QCSKBGyFzuKfAwMgCQsx7snh9AGdd9suAW2PyCEWPDeR8rItm8PRdgHYSyL7A9b8LcORtomGHNaSC/JP5QM16InUFhKfd4jP3QshCXLBe7gXv76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988526; c=relaxed/simple;
	bh=El7Fck6y7ypxHU4T5nHt8VEDERbOkkCbpy9voDft7SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dg+uFlCRkcC7nPWoBE4wTNPCDVJG8/lVfr9xJbO8TOg2ap9uXV7acMMfBzGw19z6Kq3CUVqw3GpRNpNL7bZ3srXubzI7UApUpqZKpXl4q9NEjQ+Lu04GJkpwXioaVzEe0987yEv9KZidh5jIuPK5Rz96LiBpyG5kFiyJpbMLvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wdutu48M; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wdutu48M"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so16275455e9.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988519; x=1790593319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Egn531y6D5eia68zUO0Bjiv9ns5XoXFVaQXnVIjBldw=;
        b=Wdutu48MyDu83WQgyOoYEJSJt6nOd191ZbXlG6BiVca/lV2ZU/d7vu0AWewuHIsmd9
         pf4Fjrvo8bBTdp83mUMtmdbPGlVPoYT65cDUFcFULQ1FCr/gH9otxyoFI6X2f2P6dfzz
         /xmwjq3RpOY3YKv8mDu6ZXnrk0PV4y3mr9mn3MbzyYy81TDAtXjUj1eOpD5qfcb4sxLu
         LzX+48opZTEkN9Y2f8i4xb4ImEstL9T0S2rvnifTfA4PKxrGT/2ElGNkikoJTHjfd+VO
         /DmGwDAyCW7gl6rRHZw3Yx2SttXDwfZWXD11hsBpDzm1PfGr6dVhf2Cg+0/C2UE42z9i
         b07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988519; x=1790593319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Egn531y6D5eia68zUO0Bjiv9ns5XoXFVaQXnVIjBldw=;
        b=2YlaFkq1GjWsz3AQ+4vMIpyMlLI2ffN7LBZHPLChNcRXTZ+Orpnq29adjAsJL8irRD
         sszct88YG9gprXD9y4v4YBRZvYu1OVRIK9BJ0uTpjtmRU2Jksa8T04WhiUYkRk8xewec
         LVzQLg5xylv9te9UHFQAxnI64b7+NgvKOWoIE8oK0+i/rWIdRQx9+oHiL8kLyT4oN+D2
         7+Hiay/Bnn8Crd9+w4bT3nj6PP84UlSlCM2hLT3vwy1mXKTAl7paWXFDjtI23jGgehfT
         JqvlT4r+vIJ6ow9z7TEwXPaoUPX1+XrfJefjQ/GLfFKhsuydO/KlQ/FmipDtKnFJo+82
         m38w==
X-Forwarded-Encrypted: i=1; AKwUvBzWtu6DEp/oyhZs/Qt950MP8T5OnDY/UK440HIdLCLvIXZ2EDCha9IXh6ajm81UKv75t/vWQ3Oatz7k@vger.kernel.org
X-Gm-Message-State: AFuF++lG0WSQxjDrHAyE2BV5kTny8lHQtAqeG88ETh0VJJMEpr/+7MqF
	B2gjpwpsFAfm6jPTSWa8LnlXEXIUUEMmVeekED/oq8oJfX2olSDsQiYW
X-Gm-Gg: AYBFou1cBfgU7ZlAe5RW85dOY2S6t8dW1KSq7FyIbKGif7LWIRPVAOEzldVeZZejZbI
	YEdEUbEe1XI16SfMhsFtIUsupT2wkH0ynPiBkeaaPdyrnYF1o5CotD4g/JWvB4cYO1LTHy96XGr
	eMy0dzYeh+wxWZlrjBVRDYPuyR8tSgOcQOHTeUjVoeY2sjV1yR2wKUzLS0d1mFSqVW0mKAAigdC
	vgq4zl9he5HatTbx23OyQnMLyEFH+nEK4Vn/AHcQyut8k0hfKYy439zscvb0r3m1/UaEb5SVOGh
	sEjhK9enkv2yZdGTij9mhOTgsDHKRKaGZAh7/oqvTjozyH5fJqulKOBe/SqsBp+KO6Je/gHIeTa
	W2r3MHq8nOAROIvrC5It86HxQwjGovKOzurBzNWm/m/dIKZHneZvPzmJ9rlKs5VINRlbmh8JJZN
	6Q8JUS35tPjaRXuEH6hr8ccTTzEI4FizyZUER0MYWAsIwiXUj7ldcia6dU7/htAm8YEQsccH5jh
	GksfbiPZjYCdiCcADKrCS3WEaHDatj6PKUrQ2cYgCAB8EyA0vP91XhqQ5QtE/HwHbhORlGK0QHL
	sdpDixM=
X-Received: by 2002:a05:600c:8b24:b0:49f:ce78:3563 with SMTP id 5b1f17b1804b1-49fce78360emr88120395e9.20.1789988517491;
        Mon, 21 Sep 2026 04:01:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:856:ad4f:1ab5:71b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm214267425e9.10.2026.09.21.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:01:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
Date: Mon, 21 Sep 2026 12:01:43 +0100
Message-ID: <20260921110144.44425-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the compare match and compare mismatch interrupts from the ADC
device nodes, as these interrupts are not wired to the GIC according to
the hardware manual Rev.1.30.

Fixes: a82a42963c89 ("arm64: dts: renesas: r9a09g077: Add ADCs support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 486692bb84cf..674e35e4f242 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1271,11 +1271,9 @@ adc0: adc@90014000 {
 				     <GIC_SPI 699 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 700 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 701 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 851 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 852 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>,
 				 <&cpg CPG_MOD 206>;
 			clock-names = "adclk", "pclk";
@@ -1295,11 +1293,9 @@ adc1: adc@90014400 {
 				     <GIC_SPI 704 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 705 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 853 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 854 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>,
 				 <&cpg CPG_MOD 207>;
 			clock-names = "adclk", "pclk";
@@ -1319,11 +1315,9 @@ adc2: adc@80008000 {
 				     <GIC_SPI 709 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 710 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 855 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 856 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>,
 				 <&cpg CPG_MOD 225>;
 			clock-names = "adclk", "pclk";
-- 
2.55.0

