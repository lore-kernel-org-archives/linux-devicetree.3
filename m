Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920269;
	b=HBUTEiGY3jWaMrdRq4s0V0g4TY/NVF88rb8VJd+vgOtSn0ZVenTMmcnOtqakYwxDsnxT
	 jEPITnDezLGDqkvG/hdDguSUIo+06ABV/mHy+bu9gYk2/z8VTS29jtuVDEmv5Zf7CCOvG
	 AHMZOWAhBbeIa5vGNDPxL8bCI32EQEoPTz5CUCGgwECDvjqhYYSDnzh8+I8bs2WIiONRG
	 gQ9IZEmPaSkDf9WYejSZzFIXz9Z7Mk4Xa6Pk2Q1ZgQucoUm+Zm7+xpo2LSKNEgYyE6XA3
	 JKYq2W6t3xf7d4X2NUFIqqFkrwr/IGuDybCP5dUmwmjgNfniGrvL41zkt5iRt9KoA/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
	b=eUzlba28crdYITzBJ19942bNYkKHtiHt+Ssd0Xtigvf2zokATePi6qSn5fM03K4h5NWd
	 /5I9CR63UKp8TmKGTViojT49eBBFFaXlcdeUaBYuQ16gN+cAivNfNXtGjzUEVkRF9+XXf
	 bo35x+2cJBSukf94hU8Vxog8pBzO3Ms89+vB34YIWKcquT57nysmoco74T+5cprbp/38J
	 q6PjWGFFVhwHjjLToLvXWrFUvoNRAsdoRve1bpcno3D01TmVEBabBVH2iHdGs0oV6a1oj
	 U8XfI9OxMf55VOfJA4b1V3bPO1adcWf7rIaCLLMxs2kup20/SNcP3MWJXORq7k8YjxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DQbT0sOJ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2F6606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DQbT0sOJ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so868874eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920268; x=1795525068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
        b=DQbT0sOJQ7QP2QSpio2o9wdDmE/fEoD7TkjFqt9pLg+kidMYB7mWpnHPZ+38Fo5pOo
         pSefdBrNecz9uCbYFbmVP0TYvoQwQFb/50s+SfoDO5UeE4kkNl3jjKyS6siv8CHVmCep
         DlaHs1wubkm29ejkWHosp/6doJ3BrZCqw/rOWNxjthh9+WnaaPxK6nN5rvwO6AcqH8LI
         EFy0cZkysJWFSiJ7uRP5S+IPN3iuC05HymhTwibT/ZnL3g8C19RfbHZY5gsVmwyr33t2
         fEAGxVQhEpDoAx/Gp68qAWZ35L+iY2geEyPn7PqSIH/ugldcJu5a0zi0sQv1JBKv8QOZ
         vJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920268; x=1795525068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
        b=Ysf09ID6vhPTsIAImzjhH8L1M0YjB0mQe2oSpkcALgkA8HBHDorg8QTDlGkEGIVFWK
         AFpaC3DZMqWA7M+AcCp/TiaWJHRkcbIr9vWD13RI5UwL3d5t9Z9G0QtaevJtNVBDiZvh
         cAD/RZzEF7FCzVvHgbUz4hR3QcTUiRuz8lPCRQNq/BS7dA0ZTJxHPEf7m5O1VY8Ksep/
         /Er9MGEv8U8jLw+jl6PezmI47xV7BOrk4d7iUCpQIAHMhetnt5WVHQpbSgEqO6a9wReg
         gXNmj1Lo3F5Ap3uqX3v4DgpwylZfjEfNfonbTJZ4IsMjSi7NFPOOXPH78QrDOwWEVTG2
         7C4Q==
X-Forwarded-Encrypted: i=1; AL+hErElMCiuDqWazDBkLHv/tIlBlSwBG2ibMr9w6sdbvnkLlKErPN/ymi2V+NqI4Ih7b+H+dJsa139/0W9e@vger.kernel.org
X-Gm-Message-State: APuU4Z97wzeTK6hSChIUMNVToBHAow3rCFEzlXQMvHRSI888LNPKKgyY
	ZjleiCzmv3N+ond1H3k4mpqbDS+JF9O6bv2p5a1YSZffYou/kqabd2FxCm5BE9G9VYQ=
X-Gm-Gg: AZFdTZcr3k//IYv1jNQWvX/N6g/0ui98Gi4qndmpqM6+6m6l/gtTTxYh5X5lHyE92pp
	puNaEU+094kUTTc8c3TmPNfDUAnDICqPCPhnkpdTNMylrHbIPYOiWfcneh7usmqvb7CMeOXrZRU
	k/kEr0tnVj2zq9WJfTf+0Xw8V17jDd1ezry5iFRleMnlTeqDWCJbTClei7I+Im1qJXMBxrauNxs
	SazROCT5Wm7P8nE4S6RQAL+89h9ue/YppFOm/coIjhtL9WWl6fVr8FybzuK2XUCdu2T9KASMzB4
	8UR2miWkCZki/w42mKVuExUnOsIWGJ2FFgsvlzvJhEkAHmcnqzWRr6AVr8BBjXrfEnK23ZM4sRe
	qqk99ct+SbDOW2Pvs49g3klhOQG6tA4uvOsV3nub6r4ofeguf9RPLGgELkHxX2Dv5SivEB8HXt9
	tpMimWNLn5ARC0y0Gb7hYMy5FJxYoyTskRVhxzJkTLb+4Qns9kYHf+meWYvPru8lH4VhiB/TSkT
	ZI5jynJ7czkXfVS/nCQmHtr6wV0gDjinGS+FIrWuyahNZNOzd6omZvrUxair2zwBhTSpR32kkKD
	zt/ChL4y3lc3Xmd67iRtuu8aRyklqjfiiboMO4+FoZeyzaVfu+KGTF1JUg+c9IPtL3gOjXBSjSZ
	McK3iJRwvij2r0A==
X-Received: by 2002:a05:693c:4097:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-379635648f7mr13425750eec.1.1794920267749;
        Tue, 17 Nov 2026 04:57:47 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:47 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:15 -0300
Subject: [PATCH 3/3] riscv: dts: sophgo: cv180x: add PWM controller nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-milkv-duo-pwm-v1-3-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

The CV180x/CV181x/SG200x SoCs provide four PWM controller instances at
0x03060000, 0x03061000, 0x03062000 and 0x03063000.

Add the corresponding nodes to the shared cv180x.dtsi, so that they are
available to every SoC including it, and keep them disabled by default
since the boards still need to describe how the outputs are wired.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index d2ec70fd515e..c478e7eb549f 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -160,6 +160,46 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		pwm0: pwm@3060000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3060000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@3061000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3061000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@3062000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3062000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@3063000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3063000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM3>;
+			status = "disabled";
+		};
+
 		saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;

-- 
2.53.0

