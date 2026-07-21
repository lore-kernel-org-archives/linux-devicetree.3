Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4CA4582C0
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676921; cv=none; b=fxX8KZjFTF19iXL8uZlAI6bHvQleMG0XhLOWLvDgWKMaFcqNlJrZRwJ7SnJT55lZfYqvKNo7VjpDke9XJMWkRqR4j6ZxvpVVsvGSLu0nzaEqtoItmHUySO39u+vpZ9QZ+9BUXgYV/Ms16JqoHUj9gqMfjIZZZapkVfEcu51JXRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676921; c=relaxed/simple;
	bh=rvvIVrU6NElOce9jw/DSBVsP8DTFPxNdAb0x3XVpayU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6YTC8mRtUf+pVEaHQTyo6zTSkllNcaNc3tOu5DIOgxWR2rqhrLk971Dt9H+xmS1xlydjwZ0msA2SwEgh2kD+k+/jUJox06QUNKy8c/SsDUFKnV0Wk8FxrA+Eh9wjYu3NzOzjM9ApVcOFdBy1HgD44hwrPpub1DKGPKA7jlvv8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNVsBF3m; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNVsBF3m"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf49dc28ccso6573925ad.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676919; x=1785281719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIKbYQezXfRqiCRbFbgZE6r12ftiEK/BOxcKH/SDpe4=;
        b=nNVsBF3m33L4T9TEx8z3GiKY8FVs71DBLWh/QbKZ6Vxq8KRjdTuMUTiXikNaZkut7r
         S3q0HD9NTcaYi6HK87oDBlKBPKU9xDaKyfLP9R8jZ5RWqkM3uozLm0AMJsbDlYYzYx3c
         VwRG9FFxi5hTMCavpmoKOHpCLXc0UCU+hqL5gtwkE72o/M5kRYFVlYX4Fu1+LcLtDCsP
         UhYv1k/rMFicHkDYNQGJBuDy/JGcMXJoMMZTshBBYM3pOU1VGABIqXRq5ZFdEvTTRP2w
         r5CDT89dEeCR67iO+PYr3pqQJoFHX6KIyqyPFDXoitS0eqH5B0CsehwOJ/kd6BUsdrk8
         87xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676919; x=1785281719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIKbYQezXfRqiCRbFbgZE6r12ftiEK/BOxcKH/SDpe4=;
        b=W3UJ0tH7P+5vZlFjzxETKo7WaFwLriPbEIzOxJt7LDJM8MCN5Z3iIUaIqQUXTQq9/d
         4KJA8kKFyZPfjhrEvD3Sj2PM6Qn/+gXGXTXEydyM5/QxUXXMp4hMDen0T6k51wU/8w1C
         zGaBNPNeaxJkg/OzLfwYBCqdXTimCXJCbH6EATgh+oFsaKjTQ5kXNNCy+FA89lSsX1ql
         H+Tj/kg1XewiJNZiFey6plsWGqD6lm13zMMq5fprcGHh0yZfvHLJ7OTFmexaWW4oPiOV
         gL9YuMF6WajB48qGaYy5DOr/2I2CP4+AzanFyJeZTH3JS3uIrSKWSL6nhu3mAsUdIAU5
         ICbg==
X-Forwarded-Encrypted: i=1; AHgh+RqdKmqOmGQR/dI5xdsg9wfuvUPD0FRLlkxmRAj+2EHRAD8EEU1zMisqIVt7D3lzX/Km5wQhUckZq7AT@vger.kernel.org
X-Gm-Message-State: AOJu0YwOsUJbdF8G3eTtBdjgqwdVg1f6w9WRXEY9XwoM1F8mzhF9Icld
	PZp14zgapA3Cmd//1FJmuXgZq0M41Unw8FSgVZ8+wCcWbZEMQfcq9Mqp
X-Gm-Gg: AR+sD12LeFVOUarRpym5o5uOUow8r3zggl/DpDlazV+/SmYuI/pu2TcEFGqiP1b1/p8
	3URYi4nkQ8dfO++kJ0eoKyNpMo4ihXwjXi7uEvPnohIY/iuQPLEQAxnhxn5vxslRZ0jeHUtZMjX
	1nwXc/h/IuR/3gilkkvR0f9ROQOAahBr9ilyPi1cC7HbTMj7fTrjnk/4HYNGvpA8n0GHYM02Uqv
	JErpHNgCyBU3BV5bwG3nOzzmzW+Vjm8HXtOaIi9W+mu/URFdUMTW0gDxiwomcNhnNIwTvyjYFr7
	yY73n0T2+CWGessO/KTTtZEVG5BsCQ6L+lD3sERd4Btay844nBopkZZRAsI1yAr8gSRSY+5MzB9
	cuOrbDQnlAjBTccXjDXD7ylooiF0NdW/3UAunentmlOuoafvNCzZs2M5BWD7/NHlMdjZXvsA83t
	8LRcc/C+DteRirlfbadxU0asgJHrByXw60KCKx1WyWuz1UUg3EJkAPtwldIRV46lq+0O33ndBDB
	EBoQzTuY8I+qobo5V+KLJJ+aNKLMK+ETAen6l99
X-Received: by 2002:a05:6a20:9c8c:b0:3c3:5e14:461b with SMTP id adf61e73a8af0-3c40fa2d957mr3995483637.5.1784676919255;
        Tue, 21 Jul 2026 16:35:19 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:18 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Wed, 22 Jul 2026 07:34:43 +0800
Message-ID: <20260721233452.112204-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721233452.112204-1-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CV180x/CV181x family has an additional DesignWare APB GPIO
controller (PWR_GPIO) located in the always-on power domain at
0x5021000. Add the node so that boards can reference GPIOs in this
bank, such as status LEDs.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
Changes since v3:
- Move the pwr_gpio node to follow unit-address ordering (Inochi Amaoto)

 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8bf67ee4eca5 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -448,6 +448,24 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		gpio4: gpio@5021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
-- 
2.43.0

