Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A857B37BE88
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 21:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779311780; cv=none; b=HAcjQwfZLZp0aC0LcpvbYoPaFF8jpmyjjjqGArZ9YhdXd6Pphz25Fg0cwvGiSSYGPrl+o3L1l+YebatOPCB4nwNMmFFj4PCOZQKrbGwbIUTWoGW0y37+BYS0wXZpbMWnkjNuhLDlE7bNRTIoE0HqNbeyg31IPz1jQ5l9HflUXJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779311780; c=relaxed/simple;
	bh=1XkYcOKA+WTVn3JK4BNV1oCNe0e+OpnigkVRiFBguZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lq5lZ2z+ABX81VJvac0nhSCTa0DtsIoDdNaifjXiqm3GpxbG/IDz+w+d0AifTsHAdVYipxF3G8Tiny4BveC+aUuSf7umfnQvQ4vHUpvqktKquAn9rc4TNZ5LGFvtfqucmy+JgzikVjA4tsyHv6x0aowes+jR/hJUHVH0sMCF3Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quzjOIeZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quzjOIeZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso40279475e9.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779311777; x=1779916577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZst/ZH65PjeWDA2ZWgHjBmvAcSOI8pmTlTBG3lg9wE=;
        b=quzjOIeZJXtWTeeiz3zJjKxmpzNXsjKwMewy+XpfYysV8eW6bjto7D0yTdLYIVtcVD
         Ty2Lc12IJ4SgRVP1mnBFEFZhXjnbpWV91cyDg8WGeuLQmOu6KzAQNvJJ7zhxDmz/TtV9
         VHi/OGVUhPlrDjleQBoeEyk+KGf1FXx+/kN9ynB6D5BqG5LL1+jgFGsyayJ1uBYT818i
         5Alxq7Z1tL3b+a87EGf4om2UI3yrpuQkl8UOOiYNzBY2a1yyVZp1Dg78Qx5YDlc0hVyy
         hNDZLUv/C6czFqsnHOAOYuPqxNUbh4EXc8V3c5eJPGN4pS1izhmHElGRKuHsSLybbq5S
         0gdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779311777; x=1779916577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZst/ZH65PjeWDA2ZWgHjBmvAcSOI8pmTlTBG3lg9wE=;
        b=k3SdzDf2b+2lwDwZvzjCaMfH0vVlbrJrpvMZ4wECDFxitDow+AftnNvF47DWNOIeXU
         vyyF8QtbCCSWh3Elk9orbcYXVv1EI+y8I/oULCPEb/FXGKP0EgnzCHz/mnSy0UZhf68f
         f8fhGfxEDBmyWpHPqy8DN2A/BINNcRalk00KVKv3m3p3oYUwcphBEoMpR/ufMA4K3leM
         Wj1apCQWC2l4MYUszR5p8uev/N4tYsswb7+RZvG1EBFj34MTooo6WXYLg5ze0WeCFelV
         lPlNv5vz2/2wNRzlxMhJSplpePtjM1mVuw444YX0rxMjZ5HKWWvap1TSJrn8B1CzpVkM
         TPDA==
X-Forwarded-Encrypted: i=1; AFNElJ/ikXfil8LvV/z3CgaV4Zk3YTeSQFOeIXLt2gcX4bizGzjP5LuvINL+6S/WhOL2TfLnNkIuMD6TTTxN@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/u7agBOUsUJLe+mmOVYbe0si4qNUlOlIHTjCcURpjfjSVVsp
	pP/0O2I1FqSgZ1AQU6NNFWTsLQ2q2RLBX3TxyS6r2WwV39/kzOOpdC5C
X-Gm-Gg: Acq92OGtuKQYaiv0U2hEz4AoEbE9hZ3MbLtyewbku7+6bBWtEmSS2gxCAojvo/xQibP
	GaII/FUacH2aP2/1ANHNxJGWmx8sJyUE1t4PXdvwFL6yUyfSmbTPWnhTihrDXvJ5xRjO1JSHbYd
	7dBSchLG94C5IYYCYL4lcB1RS5QM9pyhXyHGqO8rMiTeKZcnBgCgAUrKfxwQKENxg4CG8LvQPhG
	Xtp6gJRNX/8SlG9RyXhJhCr7I6FkQVg0basDy45lIHgBLkHyo9+jo8+wvEjZLKiZ3TpQLv4MwZB
	uEwY8U/iN4UTXE3jYr9FZQLr/5AKFpc/8122ZfLUVu3yu8S4bKRrE8QRTRkrpd4ha//60qmEoZv
	GwV6eQiEwnA8aZNlAUue/nFTiwk8VHH5sZfzm/UwW/TPXOqhYnCYwvp0xU5utkTGF/DxTDeOmre
	MKbz6emS4G9hDS1DKfA+fqTi8XdG/VPQFeTfqG7d6vHW6BNZ6W5wAO43IRWigXN6ycZjAqYAv4V
	vLq6OiZ29myuSeLe6hb0KGFdvZVUs+le2KN6c4sQV3MflpcMxPpLwXaou/kxU6L1B+sI+iT/NdB
	QLiY33MrjqY2IynO+Kzw7WYbxvuYlbmuQJoJREv1UkjmbiIxrTdpJ/1YNzlZJMdwAf0dV0aV75o
	HXFJKhFCtEJV5eg==
X-Received: by 2002:a05:600c:18a6:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-4903604cc9bmr433635e9.6.1779311777048;
        Wed, 20 May 2026 14:16:17 -0700 (PDT)
Received: from systembl0wer.localdomain (ip-86-49-246-187.bb.vodafone.cz. [86.49.246.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d5987esm16499845e9.12.2026.05.20.14.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 14:16:16 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 20 May 2026 23:15:37 +0200
Subject: [PATCH v2 1/2] dt-bindings: iio: light: veml6030: add veml3328
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-veml3328-v2-1-a57f0d9e28d4@gmail.com>
References: <20260520-veml3328-v2-0-a57f0d9e28d4@gmail.com>
In-Reply-To: <20260520-veml3328-v2-0-a57f0d9e28d4@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Rishi Gupta <gupt21@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779311774; l=1787;
 i=joshua.crofts1@gmail.com; s=20260516; h=from:subject:message-id;
 bh=1XkYcOKA+WTVn3JK4BNV1oCNe0e+OpnigkVRiFBguZQ=;
 b=/xdMl8Am2N49J/H77VcjWCtkO90/twCwwNZUre+UoTEK7iRlXJnQ2fAcleGu8auCgpC/OUOqo
 uXe69X4PUs7BBSYy8wN751CIfkWX5fFVqiTz87YfL81wgSZWqB9f065
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=d2X8EVKEB2uF4AaPPi3iSSI+IJF3/9kOoDYVVmc+G1o=

The Vishay VEML3328 is an RGBCIR light sensor that shares similar
devicetree properties as other existing VEMLxxxx sensors in the
kernel.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
index 4ea69f1fdd63..0041e1db6838 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: VEML3235, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
+title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
 
 maintainers:
   - Rishi Gupta <gupt21@gmail.com>
@@ -21,6 +21,7 @@ description: |
 
   Specifications about the sensors can be found at:
     https://www.vishay.com/docs/80131/veml3235.pdf
+    https://www.vishay.com/docs/84968/veml3328.pdf
     https://www.vishay.com/docs/84366/veml6030.pdf
     https://www.vishay.com/docs/84889/veml6035.pdf
     https://www.vishay.com/docs/84286/veml7700.pdf
@@ -29,6 +30,7 @@ properties:
   compatible:
     enum:
       - vishay,veml3235
+      - vishay,veml3328
       - vishay,veml6030
       - vishay,veml6035
       - vishay,veml7700
@@ -79,6 +81,7 @@ allOf:
         compatible:
           enum:
             - vishay,veml3235
+            - vishay,veml3328
             - vishay,veml7700
     then:
       properties:

-- 
2.34.1

