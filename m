Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748945;
	b=DbPtd7yJ/5Sifaba0mDp92/Srv4JbcClQXirVt1O0qYmsVv69F10kSDUC/mNuIwUZQ3Z
	 uQo5tOxyhZYd5qhFGhP4B+SMTfLfuFTYr3UJBhL23a8FVT2fNBYRyKgvxYkY1j4Szxzvi
	 hV5ncfVajZCsd3H2OZtEEkDiIjkY9Vi6dGyj7684cNEeHXF7yG7g24uVcq9gAjGAovtc5
	 INJaDFes8vkLg/3VWFPX1Gd5WFOCF6U6tDH7Sp9Lc3rSgNpAzhsDwgpZzqBZdX23Ia4N9
	 1IOR/ByYHO9yPxX5EHrGvImFbKTWAG+RKPbas/okAyPBz7zgOJyLoEt88m9Y/cMTSBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
	b=VTchR+o75/EOoEY5XZHJdX6BNa8PJiC7R1irmuPpwKEQxO2enHo+iN3Ed6f0i109kaEJ
	 hvmtI/2ZCXLW7S61c0kcgg76h1EXlJ7i87/plZzmnouxIeluT2uFy5uQSHp+iS5zzqAx9
	 d9Gg/Mk7gVfOA7R7+u2foqdGD25jAQvLuRAZcRkJMoapLLlIRp/AFSvKEIqJOT1T3FT9b
	 f1RsBY+oDaWv9kJzvZ+Gkj8KNdGMXjgy0eZ5cuKjaJ/DX+Ukc3yFOoZmBMpe9CMxYtfFn
	 JZfFKdPHQP3k6dH2qEMOGDMsV3zfjp91zfsLLOSyQXjfP/yTz40pRYi1UOLYqAHU5eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IgNHwqxX;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226DC606A32F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226DC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IgNHwqxX
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so19262985e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748943; x=1795353743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
        b=IgNHwqxXvNW1hZYXNfVds9D9p3RTLPCq2K0q2baQ5XL253mblrwn3/3E4jBxqg6Fsx
         fztMEYxhIGurvuahEMzXuSap0oIcKK8w1btfHGRJ6W2FeNF0ZFjdPQVujWyn7ut8bEFn
         xieekb3I6/d1FHNpK5I1I6/fF/EdYSbdlseJshnLNABDBYPzh+JoZH4d/5k/8dsXHaOU
         32Sd5jXkBLljMTScyQRedWGZC5pzJEPr3rIWimSWZlSpF17TTOlWHXBhkOPY9nJqpwup
         Dh79EfIvKlkkO7trFnwo/EIf82ifoEYefBpTX7yT566DkbaMu1EYGxEziUBeAnEkJ9AL
         Qjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748943; x=1795353743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
        b=ARUosOA553pyz8tkMoIK39c4e5Xf+/KFqYK5HFeXZtReu+qrLCyi+qEXFe5HhidY9Z
         EQ0Epi88zsXXh7r+zrN2x3H1NFiLkyN6xP5PICFzNxtYCsgwN0rvELo6dGjH4Qe4e9m3
         ww9wSwzLyAzjLDU0nbxp6NYtQp+oikMHwyWH/3mEgdRd7w6jbQmUh+YMPgURp799tHSI
         rdX0eajC5bI6l24L5PrWS7zF9dKpwlj54jAkFvJipszzpSPI48ez1pacRZIf/zRFgMq4
         FDcF7e/BT2G5CpGIbjKHZvMglj8+wuDztiQ3awBxw1d3vnLZua/6L+wrw9RSa2yOxmlp
         4uXA==
X-Gm-Message-State: APuU4Z+zJIXodBDLWzVkDyJXQgI7hLo968z4/OPuon+T9HHMqJ7wCOTl
	/iuAb5jNW3dSvOq8Cu9cXlKT6TXeodVFfDlYmXz54ZGj+d0vIJEXyMKL
X-Gm-Gg: AYBFou1TNXogFbZE6cR56Vdz26cPHGP69KkEhKKMTNtMIYRa6zHGdpRmel6wBpQkrXn
	Ndj8CPdGMXnls6/5O5ygQdis8f8j55aaOj8O6NTy4DXf6WY6jHyll7OqxQH9ubVzRIj+M3XWCF7
	qMGWjmOlnV2zCaDZ55RixCfJA+kUWa8gsJzoUKhNz+z4nCdbQNFZaeIQgL6va31tos+Z4soH1w3
	pwvrmWjVBhLn7WRS3NXkcDrVO/zzyJ4fXnQ+0iDuNdqVGTnZ+4FVyS+Kgb9nF+H82Q/yX35ljwc
	pau12A+mBvG6QqGO4Q3foly79TnJuMz70GRr4HwUupDQJKueimDj/y3bbscbEp6uEbJ2M5XkcsO
	5xvsoLuTP8cXpO55gdgvdyiPFzUZL8dVqh6IiGY99zw8oqWlhFIgIKgNqnVyPJI4IYr4kgsHYgb
	J+FuzzVnXC8c7EjAGCMW4ZSmDl73VKtWpm7WyJLPgaE1fCMdVJXmOp5JcH58cn5CUlX9DR//KKd
	V/EowklrgPKEC+Wt8ncbFUGX3dmY3WLcMscl7rlTjMH8L50ydkMhr8qzsBxQ/Zz9HX7vTpZctWh
	1HTXLf1Pr6sEqG6ym9ORvo6amlWYDjEcpsGOQ68j9yYFOe4K/ney9spx9G76Kn6kaLvhYBKoe5E
	Ow57yaGNXpCax3tGvAdQwLnK40BL7uEctZGa8i4fDIYk9vX2BBliJwnmOUlIqqxb/YZUv2ptGjc
	lFs8L1hV6zoM7NevIlANzlcBPvtZKIkd4ElFRcGU3QjEXODzTpJDkTOjDb4+6y6oslFgHG9Ova9
	oyiGLK8vlXNGg==
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr212058835e9.2.1794748943340;
        Sun, 15 Nov 2026 05:22:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:22 -0800 (PST)
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
Subject: [PATCH v2 1/3] arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
Date: Sun, 15 Nov 2026 14:22:12 +0100
Message-ID: <20261115132215.289236-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
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

The vdd-cpu and vdd-gpu regulators on the Orange Pi One Plus and Lite2
have no ramp delay, and the AXP805 driver provides none either. Once
DVFS is enabled, the OPP core would raise the clock rate right after
setting a higher voltage, before the regulator output has settled.

Add the same 2500 uV/us ramp delay that the other AXP805-based H6
boards use.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..cbe88ee6a487 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -202,6 +202,7 @@ reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-cpu";
 			};
 
@@ -209,6 +210,7 @@ reg_dcdcc: dcdcc {
 				regulator-enable-ramp-delay = <32000>;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-gpu";
 			};
 
-- 
2.43.0

