Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239112;
	b=M63dYqPr9DOEHFo1UrtzmAKiGg7PG6qgsbqY3IWWWfTCxatRhu8hdZI+BARlFxqzpaRl
	 hXyt/1F/2QrZ8WE+mBiratrbV2N7JA+0xWK13pgy7C/I7vTr/MVE3/e1q5BIvR4Pm0dVP
	 x3NY4CC59I2UAI8jlhYzvyXyfbLVgUnL5ujxruqGxqIDPpViGFx8c9QohPFhLE6GYk1MC
	 m4LbP4ikzZqkw/xo+OQ/Iu+tlQHCSlgHPvYKsvtvImPowGKPAuRvf4PzmCkRn2Lc6AYj+
	 VkfQpjYSOdnZJMYAI6ECK48k/RnU96xb5KHd71ncmXtYpNwefq6n6fUMtp8NxHaAuPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=++xuuyWKK1G1etes6zMMtPPyYRZJNwwBAUgMD6pOMi0=;
	b=xWJCGjgP2+qKxTcM7PwL/7EGfTorOTo1J/MMbHDQs3aNUWRPzs1dBVyabuVHm7YmtWCg
	 pGp5sWLxmgKEdQBoI17MhSO/0LIlJNdkcDQ9sP7nu6/8XIPRHzGxjiLv+zmSWGxNd0Yl8
	 BkCzwPXhJxWGXOBrXeU36gnXzDxDINHu5dv/qgVJPNRpAf48T0SmoSGiikOrUknD1RRVa
	 /65GZYLOuzcPeCCTnNrTnvlCU7zw+H4A1RDJL/Oa6pZDVupdH0mEBEmMOk1GmdmMYpS5R
	 uLXwje3/w4RZQFhcWFBiQK7udyXehpLCs8QwGlc+0jyWwJxod5p0yQcrbLBfQmKAOwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaOJtD7j;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D48606EE81
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D48606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaOJtD7j
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so6978175e9.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239110; x=1794843910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++xuuyWKK1G1etes6zMMtPPyYRZJNwwBAUgMD6pOMi0=;
        b=xaOJtD7jx5mEGk5B/pZ9Exhce5KGFHlTlXdlBgbOwA8PLMypkHyTwDyag5aMOe3y39
         pSDHg6X8ek2rff9JHpDnbQ07TsroWqDA4IgkASDG5Vp2lSaW8NY9C2/QvDSpYIi7UvCM
         zzHZqxIB03YAFS6CGOzmJcf9u6cUe3D33u/wN7A1tL8IHQn0lfrGWqzm22xTrlRSqLlu
         Y38vQSBocLTXUwllRhKLQayP/lE8Ud1aumUDHTlLfTt56HhUrgss/cIMq4NZfaC+uPXo
         FdHSUbOoHqYZZJ3L07+tjToh3N3t2xQIPPLX7TyufanZwheUU2w+AXJqCQSky6W7sogI
         Sdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239110; x=1794843910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++xuuyWKK1G1etes6zMMtPPyYRZJNwwBAUgMD6pOMi0=;
        b=XfQ5TSQLo/DCxopmvvkVwzR1NxJf6SBv0Rwz5g6tJsYfWfYhpWt2zhgX/FspoJwrYh
         JFfj7U+sOi2ipmvIH7LLp7u3kfm9qLvwREBR05Sxeu1DwuRyVwgvWLsvCnFHKSCKysfp
         RROVuShgc7xZ/O572zx6vuBBIWOZ0jxZ/VAoRTS6jEQhmvlpwQYyYrTMiUeKPZ1YFaCB
         8En+BslLSyqHnjC/e4LJjDUHizHh0fXF1CP2Wz0+/uCQuWfqN330fVPzqf2XjGvermdc
         RHaJnRASY/nNu/lCSm4ie+JTLcz1lMY4sqBzbFwDB247CRm3krUaprrZ3AzLgLsi+78K
         Nq3Q==
X-Forwarded-Encrypted: i=1; AL+hErEM6y9cBuOElTyN+ejsP4j7aZlKdNvDkmPBvC8zRcqbIT9PTqFkI59FJNeTpZb7ID836OfQognRn4nJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/92e+RwPjSzXw/C7lvpmP2d2UkS8nGED5V8IIa8QHuGO3mJ59U
	0j20Cbm1iKua67HY3l5d8oRQG6WV8HJ4rvHlDH2IcEL6prSte73o38UG
X-Gm-Gg: AYBFou24nc4pVmg0YrJHuIqvensRldo4ejEnOaNDj2e96f/gv3UrEVqFhfiHXfSJWIw
	c6+Rq91PPl6VCxl9xb7CGlP9EIRvEl9J8Ug2oyiFUYOjY5SzxvFvY6BV2owEZrA9AlIJ5dnUcMH
	GiTRGka5khw0e7fHhhPOM8R7GBEhJvRpm2cSH9ZsgGL+P1kdDDJeobolIRAqoH28agEmNNA7AZZ
	NKVCKsPe7znF+EzJi33PCsh6gTMTIq5qHonYuKYiMpZOkuBkw91lB8WgBPYNXNeg2PBt4xc5Bwj
	ktZTfQ3AOuMgM7UDE9R/nzpvnA0xsycGgrXqTsdMQpuk+rUojfjJcdGaTr5KcWS1atGWFvCsTXj
	j0Pq7YxJ62kShm5HIsurEnsaEptXbF6UHJ56mo7Q9KuWrFY0V6K/3P0KbfklAMfGBD5SlCue3A0
	ZmvHH/CPf0dp2QuHWWOQ0OZk6T14SoBJaiHO8zS6g7jLUi9Wc32j+8N3RUQul+6oMReefOvZ/Ot
	tNNnegeVn/HSWuJK2DoZSMvEKCwLEEKj1N+1qHMn0Wc7aIBKkAUrGU4RCb0kKWW0mYcq0T0BhSf
	8KyXaU+cKOaOAQcEWakBqTJDGjkJNWIc6Q==
X-Received: by 2002:a05:600c:5397:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4b963c8d7ddmr76018955e9.33.1794239110309;
        Mon, 09 Nov 2026 07:45:10 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:09 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 4/4] riscv: dts: starfive: jh7110: Add the RTC node
Date: Mon,  9 Nov 2026 15:45:01 +0000
Message-ID: <20261109154501.63762-5-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
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

Tested on a VisionFive 2 v1.3B.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 82ea63f71..817898eab 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
 			#power-domain-cells = <1>;
 		};
 
+		soc_rtc: rtc@17040000 {
+			compatible = "starfive,jh7110-rtc";
+			reg = <0x0 0x17040000 0x0 0x10000>;
+			interrupts = <10>, <11>, <12>;
+			interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+			clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+				 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+				 <&aoncrg JH7110_AONCLK_RTC_32K>;
+			clock-names = "apb", "cal", "32k";
+			resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+				 <&aoncrg JH7110_AONRST_RTC_APB>,
+				 <&aoncrg JH7110_AONRST_RTC_CAL>;
+		};
+
 		csi2rx: csi@19800000 {
 			compatible = "starfive,jh7110-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x19800000 0x0 0x10000>;
-- 
2.43.0

