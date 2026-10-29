Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283530;
	b=MT7YFEDwI5hh/vnT8IxoC6y2hVI02RKpBQ/getaPQuRMfTILPTRyIRARV5egnaOMK9Ak
	 nSZXwuZMHv2bvtRvAxNSG/uSDj7WrgNlEEUNdfnpAzrs7ZXPDw47mP5+ztpuplxOIqkGs
	 LbV3aV+4+VQfomWHi3Gg0zusdtMXcVQzhX2xeINSEC/d1IMqT1DtI5O9kCLYnYZC893G2
	 lX/G8U4O72xGic6oeU4eHeHBt6QFbZ+gSeQaknnLl4mB/R3PLz+R4OCz817Fqk5C731/9
	 jApC1Iw3Pl4D7twaDImrU9DnLgex7v5jILFCdsEviN2qEKaL+qBawol1inU0Scmwrng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
	b=pg86vSzJSvKfcvTtytIL3A8zB3qkcfQ1UutBajrTh/qBs6IUqBUa98PHH4Dp8XvXAX0J
	 9eqM18Ilx6WkVtYsK/Pqz7QHQIsJiZ3Gsnj8NkFFfU6OgL4r1+clVBUa3l7LeG1XbK3I7
	 eUCQlphv2OKq7f/oZJHmEhzK25t7crS/SG4qVQd9TCJWtPbwEfJqEQDvly9roxV4RRwJO
	 Nqjbrg5G8WtiqjyUvobM+lHxaoimcsa5ElSuo1lk06llNDPKxKzgOHKU68k1HgVsXw8AF
	 mkjO6F5OPWN1p18xVCrsMwV7R5gpb2o3IDN1aDcEwKe5hcqLPTa4LkhY0XgyhwPEIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LMzM6aTL;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E3560A5BEA
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E3560A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LMzM6aTL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7494915e9.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283528; x=1793888328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=LMzM6aTLoKd8Cru+xZpRaMXjmDhPnBRho+NfETPuWNz4M11boDRJCoeJ2fje8SG8Vk
         vwk2rDplqnrhRNENUapJJssuWVZUQLAqa2qyvw1iRwl1ISvrOPdDs6K0mP6eR201aTGo
         av0YFV2H1V81z/Ih5rXCN13dJuK1nymT2kMGfT+bLMj5GLvEM+A374z9HN68unNMxH4E
         dqWROmO5uI3lr1vF1CaUFrvse6zx3gZ+nqr/3hfKcPmb6UBmg1BcRt7LuRh4c3Tx31h8
         hGRqQV8rY3peSeeMwAnLZCU+lDkjqcKdfW9g6OLuDrXyYgjPsEm1K5LMsj2TjwIgJ6Wp
         sNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283528; x=1793888328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=kDBbwcKhC9HFZh8bukbKkrfeUUJG2mCKXM5K4c2aAwpWQFump81N5OPiZQV0VlRMql
         QRzgOYSOKeeYcKY8ioWKN+GURR7vpDrN5FXa9LwENzTcpN98DJiIvjnSpBg3nBKNETFv
         A6auhkN+RwJX847QTJakZAjx2p8EjFy9iAU2H3Lya4gfnZBOcF+zU2fXU0dvpYVHrJg6
         sFwnCf+yA8yr6nhHpTnC6kkaA4zG82G1HApSoLvWu9yESlCXAUtciiz9sAy4erEdmsvK
         aWxXc5lFBO0OPdPlaldkm1H1cuSLguc+rXWyVd9cina1dPLV9jECrNATz1jAOwypb3jV
         HznQ==
X-Forwarded-Encrypted: i=1; AKwUvByANkZuUuEdUawCv5KTmrBTSE6QnHW0JhCEhr0BlJ1oKWMCsFAClXDtLRZsaB6rOg2PQXSZG5ADaJE0@vger.kernel.org
X-Gm-Message-State: AFq9FYL/Ydg8Dgf6XbbUncnDs5eWVWCafX4qxOO3ChAq5Qko/YOqFHd/
	hYv0yKeTPvEPVHpcRuAyzNhoLfp8rQlGb2QEZVXzKIPmdntcj5T53cRFzYasMN4PEas=
X-Gm-Gg: AYBFou0ewljt5iLKjHsoQ6KtiTLUSuIiPJL8HLrLiHxpZ7nvrViGrkbg+seXMtc26ya
	3aUiirNE/9XuE5R67IdKB2XUUGQHGxm8PmLGEZFpvkFhBVrnkc6J47HFzUV4S8WEVwKe07IHUk+
	6VJTkxdRKfIaXTSYhKvcnTR4Inh7TGBsLKfY9sjDMrO/OHV/KzkSzQWK7FpCrPFLtPBkoKPAcJN
	lWHqpw1WtxY9qCcJLs/a68/cVfi3O35xT8gI8Uz1aAQ5Z6HWpGaQX+9GecOshG8sFBXtP3NZOHC
	3ROR36WE4pOeHL3mSWN2YqchPwbX/eKsKQwWldyXKuh8mQ11RS/Rrm+PNbDeIuOVPPSR0hDD4s+
	atYevBTBzcKziPdf9W0s3XVDkfZtND5DMjx6AV4AitPTIgKL4AaX1DVtKcfHcnb24pg0Zp7l+Xt
	1vZ6LNMoAdKC9TQmj+5Z6ynEZ8MYSm7RjhBihbG3tpOUkDGFKrHDO26G/UK/WR4nyxog9GVnMZ+
	sW+sIPG5umBHnjILXClPFj73C0jE1Ni++BU/NugG88XMaob7B/muEIvL8FsIlJod4xRkc6Tj4Wg
	J53Zt+fy+BLJhVCvFOZ6yCm1001XPi+/a65MTbf65IubFEbmYlgHryl2W4mOgZTlUzAs3bRl/cp
	L1Q+k
X-Received: by 2002:a05:600c:e558:20b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4aa87d702f4mr44584355e9.14.1793283528130;
        Thu, 29 Oct 2026 07:18:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:31 +0000
Subject: [PATCH v7 10/18] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
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
Message-Id: <20261029-media-starvis2-v7-10-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 44 ++++++++++++++++++----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..0115f7b00d5f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,29 +5,59 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
 
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
-  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels,
+  and part of the Starvis 2 family of sensors. Other members of the Starvis 2
+  have the same hardware requirements, and therefore share this binding.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sony,imx678-aamr
-          - sony,imx678-aaqr
-      - const: sony,imx678
+    oneOf:
+      - items:
+          - enum:
+              - sony,imx585-aamj
+              - sony,imx585-aaqj
+          - const: sony,imx585
+      - items:
+          - enum:
+              - sony,imx662-aamr
+              - sony,imx662-aaqr
+          - const: sony,imx662
+      - items:
+          - enum:
+              - sony,imx675-aamr
+              - sony,imx675-aaqr
+          - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx676-aamr
+              - sony,imx676-aacr
+          - const: sony,imx676
+      - items:
+          - enum:
+              - sony,imx678-aamr
+              - sony,imx678-aaqr
+          - const: sony,imx678
+      - items:
+          - enum:
+              - sony,imx832-amr
+              - sony,imx832-aqr
+          - const: sony,imx832
+
     description:
       The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
       variant (IMX678-AAMR). The variant-specific compatible describes the
       exact sensor variant, with the generic IMX678 compatible as a fallback.
+      The same applies for the other sensors in the family.
 
   reg:
     maxItems: 1

-- 
2.34.1

