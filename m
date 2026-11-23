Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425653;
	b=FWPDB+fKz0Ps0U2ZJAHvcQRMULGnYTYyhq7u8ovKYFItetWvyJuIVKVmY4sB3enW00FN
	 aL+OMBmG6/8ZJXWLLVdCVOAcwPucrg5m8tRKauBYu6cJ3kUlfYTDQNv6zXyheMkMcAOPo
	 hPgcQkPNINsAzY3HbQ8fZLJvqf6BGMlD+QlZIOLUV3iIh61tIJ0bFel3oUoNz47MeC66X
	 jeNuFl+1whfdHrhKR9sFiYuQZ89qbma2dKjTP6BtPG5P7DnTnU7ERlX9vIHmJASt0P93L
	 7IaAXp4MmUFxeqyBo6bVb+QxRn3d6PGV8zH+q9F1BOpiczTCoQYa/Efgl9l8cLdY8Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
	b=YyAlJwRH1GFrCRblDZ4FZ9XO8gKICbUPoR0gwc2C95ITPKihyDCyuk6pj/HBJeMkiNgC
	 YEfWwopTKELMCLP9/6hnBixTI7zH5+JOHECBUZ1X6ZX7BQ2h48/RT22rIS4J5eXY2i29A
	 PF5eCwS4y22VIQMMGi8MHu8QUUuZQS2dAUGoCmvYnNehOZ3hnWQjDTkmXcvWbdQwpIBF7
	 KdvvQu0/A4XsGDt2u1lf9b02aFAbm3QXqgJwAwikYMFcQxlppJtBas4J0cPn782mrMrsV
	 gxpeleiPFBnU1kHiVVn4+51OpATASNQlXWctHd1Sy13KUzi8vzRML8ZAj/K9FVetHxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lEpqdFaE;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E2606A686
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8E2606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lEpqdFaE
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so27741085e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425652; x=1796030452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
        b=lEpqdFaE07TsAr7exCVtdRhv3oKb7jtKTc85YgVZ9z981Ij4+AdpasPg58CZGQ+SD/
         O71sNYyXeAGg6irMdR6pgsARnNvNFcrKZGf3dnVABVTSGXJHHHWk/sLsB03B/3NePgHq
         vlzF5iBjPOwGh96MXYke8PuIMKao/xllN4opX5AHZIzwDx3NUJDZV8xyAFC8YIzHj7if
         5QpZ4DS4mihJJkpcVRURhAm+2zF1Ubsm8f5oKtrHus5siSUwKBz8s0tvrBux3PGuaumC
         aAlj7SVtNAz7A+5OyBGPCnXRMUI/enuknfRCVd5jGYaL9UyM0tuxhEcAdbWUi+3wjRC9
         T+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425652; x=1796030452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
        b=2vaovwvQa6BLvp0HmgMROD+cKn5/p6b/bfzjWM4J4Kmqy7vTxzGEHFk6iv8F2/57ZZ
         VmMbKyXsODMFFWWAIiAkYXRVXRkXgW20Ne1LtBtolzdFPPKJ2x92IWBbMU1csRmza+dM
         YhctR1ubO9H6hZWdq0yf2Q/mwEGwfRhuVrGIwpgxU1Mrnqar0d0VN5rYgyGrH8JurxHL
         S/pOnnOSRaE5Pv6WhLlovLI36vRLWMeEGrbWAHqHs2shqp02ZnCB1sr4OY99CRdV4mw3
         hCXPsawGhLadSNzr460D5Wr1jwEwKDG01oaYtMzFARYD6h9L+V1IKT/pKY+ACWandmy/
         PT5Q==
X-Forwarded-Encrypted: i=1; AL+hErEtI/CccdR1KVu6+ZoiyRD2haljAQfByu4psgSF3FLtqxlnkK/++SHb05sNlwFEmb2AjnDsu7tPq7CN@vger.kernel.org
X-Gm-Message-State: APuU4Z+5OY5sjjy85GPxIhaX6unoJYQ6+haNZZmC+Snbi4fcwXzmY8xg
	tBVht/3sjmZHcDAvTnRBxOd3hCNSQEmnAVLQjz5tS+dDTa9hsjk1VrTJTwVks8hO7+c=
X-Gm-Gg: AZFdTZfhUyM3DlEbrkxOAKb+UI86OjYZtgp+oOmesiGyf0/Z9TTFU8BIJZ/FDo4X9tq
	lKhiHWKZQEk8vW7dOHrrNNSASeKoHmFsqfb9yfjypjjcNBz3q9JZfEXATShn5xm6ljzD6oWBQyZ
	+wqKYJlcVXR0JMYNa69gJmGH9xsfzbdJCrBnajClSF5CbaN1qP9ryWRRAmb5c+rIwJTCst6KFMN
	V4Kv+YQe/0NxbJErTJpSTMZ5l1YYL2cd459E3NvizaOVvE4v8ehOr+lhhZhsspvTiJaer/6CRzx
	reRoliELgevOx4hGUn7BajcvE1f4c0FOMy8wOxKarZdAO0cu3GLvrYwRS0UUXvL9pFXG0ufo/Nq
	JsV68uyGZsXd9PhvOxXehJtrZXi/3F1oV41bVatwmxYHOtzNA1e/APEP1gRtONde9xC0hLOV/8G
	ketiRJhn/88ZM43NL+utueiwavCaPp/KUSj/5+MuvfhAEnm77FH3EgcZwTwCQHQGH0N01ynGc1T
	8pywI6grLuiaMC55k73wTnhjaHDmn/ci9hhpF6P7zmWpI8fx2bxIJIXot4fNAQ5SYLSc/QZQMRD
	h0yfsSUSD//BtBF7edUpYyO5MNNfj3hsFrA/fPkTW10iSE/+0ico8MkrBupLF2IAiYpTe4LGuQM
	QK67EadStV6Iq2v1tpbm9DcsjFRL//fBZuVyE8YnxJiAzxQ==
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr216221585e9.30.1795425651936;
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:46 +0100
Subject: [PATCH 2/3] arm64: dts: amlogic: s7: add the PLL clock controller
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
Message-Id: <20261123-upstream-s7-clk-dt-v1-2-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

Add the PLL clock controller of the Amlogic S7 SoC family. The fixed,
GP0, HIFI0 and HIFI1 PLLs share one SCMI reference clock; the HDMI PLL
has its own.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 69dec312e7d6..eb123d022bce 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
 #include "amlogic-s7-scmi-clk.h"
 
@@ -161,6 +162,22 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_pll: clock-controller@8000 {
+				compatible = "amlogic,s7-pll-clkc";
+				reg = <0x0 0x8000 0x0 0x1e8>;
+				#clock-cells = <1>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_HDMI_PLL_OSC>;
+				clock-names = "fix",
+					      "gp0",
+					      "hifi0",
+					      "hifi1",
+					      "hdmi";
+			};
+
 			uart_b: serial@7a000 {
 				compatible = "amlogic,s7-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.56.1

