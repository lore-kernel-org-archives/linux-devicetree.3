Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517815;
	b=U1OJ/yN4XnD1IwZedfUorx/wtNd7PK89Ov77iIF8pdxUgDox/lWmT5gFrWc6u8TWblOH
	 nhZH748OVA5F3U8Iob6Sy0H1BWEwpKCBe7krlMFVM/msVDBEDBwbHv8UDg7BajNo8oRWk
	 a5zAhDHpuhOra6XzqghWQOpHyloDnC0CtsDvXxjT75muFXBpN3ubl5KGkto+zQe/N63VP
	 /ETot8YH0Wm5Tn2lE6IhDI1wqn7rs8JpZEe3uDYqvKvwkIvMRHs8ZyyhfDfqCmqS2ZOQm
	 JVWpGYX4AdOzca7zPN/VQ/kD53cACSq2MB0ZeMFUfU37tyZt9I10V3fO+gmyP4BZtew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
	b=UWStRRIxby6QuLFjG6D9U2Nl53XDzx0XPxqrRQ6lk+Dz4DYIc0NdBjz2ElHLv+PN+xAg
	 vEK7mN1+pUokvaG2ZKm6rca7b3Asq16TYx/arrH4Kv1wB6eZgEDHq+FCEWmUHFQAyhuDz
	 V4Qa6pEh9hAJC+PP/4FkG7Q27Y2epjTUxZJ6U6F3MA+7nFbGPZ6Ky6wU+ApQE7Wm64FPc
	 bMfOqg3UbvnfIGo4ygsUzyVIl9Q0gVoZ1YlKOYtzyydD0+L7ZpXoqxYyepkKW5Arv9deD
	 adgGoLHSZHc+2Xhh7zrJ2X6FVkhRb3Sta8bZ7bNtgS0AnukrEyGlXTbxRJMz5BTxA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=shFLywWF;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E77606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E77606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=shFLywWF
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso35373065e9.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517808; x=1793122608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=shFLywWFYmCew9DhtJQzFsoE4pnvQm941YaCMTCeX3aU+gUEWiZy2vl3SuibviZVx0
         7AwcQcpjnJNuIdq0r5R06ZdCPvZdj52wfgcIrmHlyRSz5i5DTtvChBUjKjsO+aO6+L9a
         RXveUrqr4Q3r+YWUMGdOlUrBooxK8/sxOoDf/TECDDvzR6JsnQZXtS3uymp5F4dRYYl1
         Pm3r2zZQp/uT+9GAJYSQIsZbTgGP/RC9sUTrgDaViWSyjoHaz3nuFMFwpJp+X/MzP+Nk
         A+tf7Qf+RofvAmYXuTpbz31GK489KFlObY6dm/lY4eibdeYp7Q7Dk2O2sbnJ5MjxVWSa
         Zr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517808; x=1793122608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=FPMZwsot8V5ETjvu3qwJiHsVMQCtS//+D5WOxD/4s7dy+VS/K0397MI17E9C9QNSRW
         Zlk3WLGNq5CKd+Z7mTh+hDDVllKIGAzRMqnA22xNA8GxYM41mYx+LTs6e7Cd2LbxhZ6A
         IpPtE5Q4ri/pI5JwhA25KGSy91ZdOSu8RHJkoIF3aWd2r9Qvokiv2ZY01MWCRhh2t3Er
         JTIFlJr8TtCBKPJ9y1QZUFBcfvYFYJTLkmLn2iOWYINpexRAYlUmL8wMZo5iAd0jEqns
         +SRMshaX6RHiLLB4MXbQ7Lbrb0Zd5KlzTKIcYtogvQBcLN8lfKvySjmYgz48uFpoRkm0
         eTBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq1x7a4g5QsR3aR1CLBSzEn5KMMn4ttwA+ScniyISjov86ckesf9UpooOrL1+F3kcL1ohErc/TMcoD@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6w4DuWI1B+cyw9aWQgxDaldYiStCfk9HW6klORmgeGZyC6owg
	xm1n4CJ/DBIHYsjMfi9Ngc+J2E3aruq8KB6NdpAAhQCYOzjVZC//tudw
X-Gm-Gg: AYBFou2BVn/VzCxaYvmxn/S9JGqbpEsdfZpCugDAfJ+ybTSRRVGh7iKcehP0Fs8XlU1
	QJrIj38i4Pfzvm7hQzvMrIGaj9nkX7gyV9Fth1q7VK3yMVr5LWZpJauPuP4Pi3HTJDLsu4FyWe3
	nTBsiJQqiD6K47cNXYAsNcbSFbF7bJ8AO1BRk3uu52F2SucUHXoy38BEdu5c8BhjXe2asm0/Ywm
	VvXX2Dm+Bim3Q6SV5djAwTWNrEvPwmqaxo00pCRNsFa/ig8ZKzGTAIUsnu3cEqZx7IaeXofWhoC
	PzFMa08i3ojAUIn/SSI5FzMIkdSJuGQqbHDtzXXq+C6GgRs/tCt3g1KJhU8YTTVuRAE7w/VO98Z
	uhq0gNH7klDfMQrOHjTc2K3KdFJ8lWay7TxGBRRPkmdOEausHOaMoAXyJBmFH+UKHCtjU4h5fUI
	3aI5wbN3QEw2xaroXRX1xcFZckcDXxtPNCZpQwvTl5aWJqc0AetF1KSHlFEpPuEqFd8w==
X-Received: by 2002:a05:600c:19c7:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1d761b90dmr248715685e9.30.1792517807739;
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Tue, 20 Oct 2026 19:33:22 +0200
Message-ID: <20261020173556.632798-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0

