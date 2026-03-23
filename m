Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBC38C2DD
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261186; cv=none; b=Zp4G96AL+ESSQQDT+nuaM6kwPrHHDdjn5YgFnHLYKxTxc2rFMW0d64+LQv4beb0xbz8Os5ogoCsfqH7k/XFm6vQI1LHqXFdb0QDzdlx149/9S4ln8G31KhIQeHiS50hiCw+dUG9Np9auMxHUgTRtTkzuLSKXMl/4V7X6RvcfcIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261186; c=relaxed/simple;
	bh=9/EPlwM6vznVUXBNNDHgVNiJdTMefP764Y35mcPkq4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuF4mZtC7UQTE9woQGU36eEbOZlZo1Pm/Bh4Owy+irAQOroIOh7S7/G6x3r3M75s0h74frNTZkNfxSQ2uKKw1t238E16+pioui8g2fzjm1Byuh6gylzMldqbvxKKWagIcHvBmbS0GCzXM3J2wYsXBKQGS8eyVdHFJb/SAVGn1MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0gkhf4X; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0gkhf4X"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso30923025e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261183; x=1774865983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Zbg7NdVFVfV/LiASAwN6OwVtEgN5JVFcgTwCKtL1AE=;
        b=S0gkhf4Xl0vbIDjVI6H3W4Df+X0NEwD7U5XNgwReSB0xdV0CxlYab7SgeflPWou1Nd
         HoQWL9YGuknK92aIwbc28ujIIz0G6t/pfGLo4fwSsq5dyx+WkbcMrVkYTqN64Uq7PIA0
         I1Z9oYD/WoOil9mWZwNUI6Mvi8TWfKOqwNf0VBxgmo4OUDzfTMCFRV3ZOb+ZGXuJ1Aqh
         AnqC/txJxfn/Ys04zJUMXa0SbVcPWxoyhP6SqfqGQIfDB2jd+OtdSZUGNn0W8CSJH0wk
         BKmrZB+zTfHaAkOGMNiYuYuigCQI4FQIeIxbPz4xD4g2hEfgR9L8qEJHAytiLDd4iLC/
         LhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261183; x=1774865983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Zbg7NdVFVfV/LiASAwN6OwVtEgN5JVFcgTwCKtL1AE=;
        b=stOgB3qqzcrI5vbB3wU1mvzMKtRz7NreQbwtYAjhUL93HNhmViX9lrJLyegWgbvnZH
         jbDqxuB00nVDCR8ezd1uSvCbOqrE9CoioLcQEVUuBM0hGOX4WQThhXmrdYsXhrua5UYR
         L/3o8ytmrRnWCMRgJfill8gplkeUDwVuMbjW94WalEBHIRRmx2jfoKd9GsJ8nnbF8pjN
         Hc2i4nrVB/APaDhfDnwu+lbDYQJQVUDkON0/ed0chOEJj7pyTOa/OS0wOjWOd2udq4Hj
         XZsZve6YlsQdI1qOk2Cxip5nWQvGfYqk+v/xYVIEsAMKtN5FdZTwl8+2qVkz5y5ZST9f
         WAXw==
X-Forwarded-Encrypted: i=1; AJvYcCW/S3I2+menFKiXfEfbM4Nb/pd/axQNdIjA3vl0aMCExAj0WaB1gtDDAqcwZtL4HaRtko9VuXNfUQln@vger.kernel.org
X-Gm-Message-State: AOJu0YwCla0vhrWcDNeSHYwMn2QSufbrmO4djXOmwimgpbI4DgLFUdZz
	bQKw8AsE6T/hr1ypRMkOX2XUmN2ys3KyRHOfHOVKv13N+rQ8tDWbXBeSy/6C2g==
X-Gm-Gg: ATEYQzzjBmNOWx/evHWWzTw2HVSP9uXlTb2cQBEta4KTdGc7dNkOkeTQPLbkiF/hAtB
	1WTNbgyfeYSkqpSQFV/j1+HzpKcQTB2Y92EjOWhUj32YJyntlZUZNPkPU4C46SEBQRSDAkyz6PO
	/RVwEOtxTj/mHaxa8SukUutnGqQZ2OSyigAjaWWv5e3gwKSWFUIbt/P/LvFjmH0z2D0l9JFUlMT
	TWsp2wwtPmFmpmAsHAYJ/SmsGNp1IbBvPgaR8nFX9SNEMhHAcGxpXSDD9PWFEHyBP+uLfVfKnwA
	3abqGRH98A5+5B5biJoAJokJmq+9hfQUQSTHIymQxVKeGFqWqOOFr84amARjJw/sGdXTJErnpr1
	+eZEPQYpSIbZqxmcMka1nHoTM2n8ltRyEFQgBeIBefALuDQVECk4cIq43aySBt4i7rfiYxyttFg
	0m3EwOUm8rS9IYKSi7b6MhG3BRpermQf4rgjOwWyFS3fk/oFvAJeHQCXWUQYA7Vx63
X-Received: by 2002:a05:600c:45c7:b0:485:3fd1:9936 with SMTP id 5b1f17b1804b1-486fede721amr149755185e9.5.1774261182461;
        Mon, 23 Mar 2026 03:19:42 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:41 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:10 +0100
Subject: [PATCH v4 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-7-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 404b69c47b91f8c37d74a3031dbad0d94a28d1b4..6d042f905d233bde2e29d1366bd177b41915ce4b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -222,7 +222,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -243,7 +243,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -369,3 +369,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	broken-cd;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

