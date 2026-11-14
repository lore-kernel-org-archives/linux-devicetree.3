Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696949;
	b=dHaOBGlw0I904vGeoEZyAJd5eD6/n90BCqaiYzq5KJHK7p1j57h9NJjZOGxa0m9sa/e4
	 1sRucsupf3jJtjBUHb+k7LbWgwcVIxBe0WXvIs0hH+cpknMGyKKTlcvjwBOHKCO+22P/v
	 duwWwnEE8beJ8HlsnK95c8hfMunH0cSwr3UbulwOo24rqewzFHs9chJqBG1lBC9+4/K73
	 UaO8jHDFf9ijchcy2qmEx7cs3VyqkMAKQ6Wfn7Pskizb0gxHqQU+0HbM+oxkl2MdQ4ISc
	 HSQieRCpTgM8n5mkjEMNYjwpS4eAD8Y+/ZjtDCp0fZhBgCqS0lr5q97/D4ItX8rgU7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696949;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9vlfSvYfqwSc8ODI6yi7UL0SJ3h1s4wGaTk0B5VZePc=;
	b=ClHdHex4bSZ+YDfCULRZSUrUM+8vzpspo5tC8LnyyUy9UPKkONrClFIPKhVKzlNJ6F75
	 mxzUyuIsH4hc2bF50YE7SuTpdaN09FtPUJUmm3OLoP5UIk4CTqckeBts0LO6M/19xHd5j
	 Hcp08ekxZpj4EVttrjZyT09VJ6YzWyJOLbpCuCUDI4IMGsZk01F2ebm9I9Eb2rPkScq+E
	 uD9TDZZUtbOBwkYZ1y8kcJK+d/I7mtzsnLkAjKFVVJoJo3HJuxbXkeODX+oka1dJXGEzN
	 pzi/YP5Brqt1xI0gzXJmmk0RTXl7awv9k5IzCiH460zmOfLktUnZXYKUdFZ8m+3oilw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=ZP+TltsF;
	arc=none smtp.remote-ip=91.218.175.147
Received: from mta0.migadu.com (out-147.mta0.migadu.com [91.218.175.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF842606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF842606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=ZP+TltsF
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RKdUJFZD9nYfhPbO5gyGhjv6SKsiWNCSZIbQ+/pFHgI=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696946; v=1; x=1795301746;
 b=ZP+TltsFhmOodrqHpQw/GARgGoAh0y9zKiZScs6fqIrdkGgXZAmdktqbV2OF/EE3BP90m2U4
 u0dPeMDaDdjwkekY5OCKgffSUufX1cClCoCyBkkj0E7cStbAdOKgdaKlNHlvq2LGW/oGPaM7hUz
 zZnYTF5RbF5XGQXvmcvIfEMfM6xd8tgp/DVESZf1Ec0+CtHeB0Sn27JKHKNhvruurl37fEqdd7c
 qPbXU5CP27LeuN9CcaG85TyoUNOT85FVE1IKDbYxnunROcsOiRcFIEN+LLDPPsE2laFaD8TG4QQ
 S7JTe2Hhtkt8Sc8ugNBKrLxgz9f54VHpWdXnIezTigRcg==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2131ee82858e725;
	Sat, 14 Nov 2026 22:55:45 +0000
X-Mizu-Trace-ID: e2131ee82858e725
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 14 Nov 2026 15:55:14 -0700
Subject: [PATCH v7 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
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
Message-Id: <20261114-aw2013-aw20xx-rename-v7-1-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=1313;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=RKdUJFZD9nYfhPbO5gyGhjv6SKsiWNCSZIbQ+/pFHgI=;
 b=HcZAzW+34QUpywu8m6ruxphJZTEwPT33NSZWrLVRtmQIXeW9VsLTEFV7GcdQMZssoDIJYuBCv
 qhfydauzKyNB6g+Klut9DvVV1bPxYllRnJ/1X/xrtmy9f7UltPvX9jN
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index 26238446f2bd..1ad165cfe34a 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW2013/AW2027 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.56.1

