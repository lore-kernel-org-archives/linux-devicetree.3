Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D37352014
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037934; cv=none; b=s4Y2EYX+Hzhz53S0IWNW+tiwDATCMAc9i7pGPZsgktvUoY8gPvT+VFdSSFBJRSbV922Y1CLoxAzelcSuISItn6JbUejTVfcagtnjjkEGySSuMCblIpjb8ZzLeuVAlmGJ+V/6t8uDMeEUfObcrQ2y8cM1/1K7VpPJXjM6wUWpOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037934; c=relaxed/simple;
	bh=Gj+LzOejuhn4QUWRd2BeQZ06xMLgJHxeiRX4lCDRZzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFHOna3HZUVbv1J8BvfY/jHqSxcZVN6jeOOO21R2SzQ0GC8IoWDjCvYPDFtuCHu4Y/TYb/0Y/X9Qr+a47In8f2vJiGYtcoz8irSFcoPdOIGxrYRhTTmo7HpRgS9zK3TM9KK5neG2u6DdjWULygYbGbVPtqLwzqDTXWEn3pNMPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7inqSqQ; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7inqSqQ"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c54eed93e4so1399776b6e.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037930; x=1790642730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=A7inqSqQ4WJ1W9QuTjZA5aBS3Q6LjJYOSgolETL1tkZbq1TRo7JFlWOmid9LnUub1+
         nnjlhjs01OsTjSGGtHJRK92xca3bsPWQjPTBGjhHNmkqgTjq56yehc+1THpWSz2CDYtt
         OKF7AHbTssWe3fnWHdH/CWoW0L6WheFUTY6PfVamnTGZQBizhEMFmY093qbdsGTsxOoE
         phO2hOtUs2TqdKEWOl0ZuWZob/lXOP0E4sJOxvZ0i8xUOkYo4/Pnpyvybu9qhxg11h/L
         R3y9DMtaoZZuW3GCBkrapvTOnzmZ6NAlHOhZmwZPDx35+eVb2WotdMoSIyjasmanHMEh
         xBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037930; x=1790642730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=qriEnugCSNSj+aubNkd+2+Iw5GY9o5xRjB2NS09t9/phmcZnLA3pugpPQA4sYliom/
         o0A98YGiBzSxUv7zZw+4k7wfFx9VcHPQ3t4wa0eofq663rpgpb8ceMneSTirtyiTSIRY
         WEqg7qzIbiCDM+ctQcQqXRX0W221dcRBRPJVNVykFiKx2qTvW9UnBgMLcdbtAIbp083a
         q9hNuxC6yXHlSyLvzZqgYokfAKzNJVb7c+U/I2BVHb/FuBWltDRhcT3FPNiMbLiB1pon
         V60fWnzhFID7u6cinl1naEiATw7OFP+aVX9uPXvB4uV0l0eAVYi0R6HRNsXm17UhOuOi
         70fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm1owdFS9QpRekBnRKZua/+kogmxLwxQ0hmBpihZhoY4Cg1zmKc0sKGQoiSyp0bn3xC0O1aOkobL9l@vger.kernel.org
X-Gm-Message-State: AFuF++nLTsmk36xHi9tr7Of7cYzdogRA9waW5CNCf0q8o550kvrhIkRL
	/fUqM0NbVcuYfo6OXLL0QakavyZdVqNgvl1fjgr5TYnwUWRTCwpkjPFw
X-Gm-Gg: AYBFou3G5iJAGSaylreXKwKsPlI9F1Oo5Hu3XBeVrLqE7WrmhC19V8caN+lMFXuccZM
	DnGejK2cDlBTQ9dc7DlWd5bPmRqburKh2YpdglAn0VxrNBOFNL5XSCvBgLwrNUCRXYp9xNyTe8I
	p+3ivXvvldZP6DQHJAA27QpninstIQFl7/k8yP9b0qJDNH4U5YOUTYQ2GkYjLSBO6vQKMNMBBs3
	Dz77QAtmZ8oZbYDA8Pq32hPi58nx9UQO7CoG+WteMsF1Msl2SRHH0zea84An+wB9SEuPlvDPgVI
	ND91bQm16z8JvKFmtvKDHzyHuSN3YoO9r1NbkjBJAPqVYbOD9lqpG6YIvCSDZx8idpQueloEO2Y
	cZPUjKSeqNMlxxNEDsL/Dd4b6UQrlkTy3zR9zDaflHilq92APlZBET7swQjU3lTjnWAoJ832M9p
	9HeDvBzomLQLOsQevnRnDxcgI2tmxYkflOpUOcukJrUoAOpsXRTHB8LAMEEwftkuYUOA60Oyjkm
	AKg3odb/9OneCW4ieqrE2maxn8Cfbvm9+xmeghqUEGMX24ck4Qw6vpgg3wagarquEN2uXKkOtli
	0C0Y97CWykiSB8uCaQyutwENY4s3bW8w1RpvFpD5CG7xyR/YkghBraZVDwyALDh/6G62BxhHzA8
	fNoSQSAvljxeXTrsQDGb6ag==
X-Received: by 2002:a05:6808:1526:b0:4b3:7aeb:1b73 with SMTP id 5614622812f47-4ccf59c8345mr10592065b6e.2.1790037930082;
        Mon, 21 Sep 2026 17:45:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:25 -0600
Subject: [PATCH net-next v5 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-2-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ff9e3284a06..3fa6e17c3d12 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -623,6 +624,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

