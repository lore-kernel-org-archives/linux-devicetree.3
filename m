Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B13B0590
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506042; cv=none; b=YQcOw+LXOWJ99dJQOFvSYOiTuF8qonDcIG6bbmNoxAO96E/lv5kR0Pu3kwLd/Kq1EzsCRsXg64+BWWDa/QUw8JF4SXjFIuOQ0wA0qdNMTHXgNpuRY0QfaJk8A/nPgS0Urh2d9JB43k2ysqi3QQdm909GMWr8RsIQF4+hSs/tj5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506042; c=relaxed/simple;
	bh=3NlwmlgeR9UStztzEJOa5XxE0OKSg9rGXxb09yHnIZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EKzrchqheT1fcMQUE2E0YFrc8Qeyvio+6QxtyPbEl9QG1dKkRAV/v6fTWg1dvY3wHEMAyzDZf5fxxvtwb1NLY75PiGLeN1GZj6dpeb6XgC6uP37pgvQG42z0oN/A94vywui4sSN8btMR9ntFc3/dnHgnwaO65noo4RIuA9H6ziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIMvNrJX; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIMvNrJX"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-399026951a2so21878a91.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506039; x=1790110839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnvNRJTUsdTr1CADcV3hYsbAspY/4YujciextqHo7XU=;
        b=OIMvNrJXZTiWrkry1QwhcUj3CbDaE2vZUvx7LmScDOlSaexeFtFd007VOergZTEC7l
         OSEfLRXo66pbbmwIJylTCksYSuAvh7TBQJaUdx1J33tSLE2+c1ikSqWJbxI1A5BMkXoQ
         P5iTifbtP/kazNhc/NwVxP/Do/j1lMQtcG4yLKwKFDL3yKe0SMx4R9mrWOf0CDaPFyCX
         7lcmS7kPX/XT6VqcJfsWKXyFVI5S7Lw2b3MfWB1dqnx1bBkV8xyXOz44lHlLea/ywiqq
         g0VAh4sx0RDTPh48aXlhNXsFxwDWvwXcOZ/d5STDyoEeuQTX7R+io+/MUiPgDVv2Rybn
         74nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506039; x=1790110839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnvNRJTUsdTr1CADcV3hYsbAspY/4YujciextqHo7XU=;
        b=SNsyZnKxQJB10LUE2JjIAx+ARMRLs+8RraX25XruWC54opnIO+vL1CWg/ZPj4MGjBk
         IydLuejbdxAs78e/DgcNS80VpQhZz7b3f81mOdpG0MfArLi/OhN8ddXOBK/7gESBQ4qb
         ZOPn/AadEGjQnp9Jv2yA39mAIjvfDQe7Tkw5CmEC8/4Yw/Gl38s65QASzDevkEihRnTm
         HCL6JBNj3emry4qL1F7Ir8eEygD2xHuzICg7tL3/vFSSn1MuDyI0AZIrsHYAmX/pWxjp
         l8SaHeztmh2K6DEJ7JGqBUNcMYdI98SP5DLTUGHQTboBjpMXUgWvTIp/AbPl/0FxSD77
         tQvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDKt4DkSbtqsetwa96RtOuuFWGsISjuq5xgnka4cDM2SrtJ2fBot7LHPxCij0Pmwy4zlylXHRf4l6p@vger.kernel.org
X-Gm-Message-State: AFuF++nUpOBZIKOsqyQTG6BNi4lMDhKSs9hVxgvEYVtjO++NTimcUf5r
	TNyGSnlPwGkkpVmiz0+rKosRpq3UZE5N+K6nSlvvCDXqz3g9r5hph+cr
X-Gm-Gg: AYBFou0pm+53jtVZJRHBenLJNx0uGAVZ0/yySHCiZq/Da7Uajg2Ac7wBNMOEuVATMHN
	E2jZBKFSCuUI67ozqiqqXAOserjS3PeHdxSCGu0yjZzRQLPk1LPjbpRu3QbhAgLUENAqlquvYO1
	lndfg5RvBdO4ZWgnLPtzF6SAf3XwDkEyH0VzhW5ZE5N6oFFzJaULMqztXWb5bRxBswwcoR0r+Kg
	knq6xqGaoHdUkTBBwx3gj4+hxbmwFvt4ptGwt95AxpP9trepBRfkjUuly1Fo6b7/HPN8zGICwag
	GvsW/lp2ApraQ51OpiI4xVqv+F7nV3EXRGcGdvHsrefa4YQNOWsVBO1HSEWXDn1uWolYgps/rDr
	/LlX7vZBBfu8kv8AQ8uDx9aD4tKJ8WNiigljWwPjblmb1lDQnWn063NxClp6qOTPBjeYXEKH3x3
	YcicQrWldrbWt4EKTrrVxO9rkrOqpB+Ypezu4QDJng1GAR4NTgN+/kwmXX5AHjvP9dCKyN8/wwx
	rq5eody6nc=
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr118300a91.5.1789506039587;
        Tue, 15 Sep 2026 14:00:39 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1483sm465432a12.26.2026.09.15.14.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:00:39 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 02:29:40 +0530
Subject: [PATCH v2 3/4] dt-bindings: crypto: ti,omap-sham: Add OMAP3
 compatible and deprecate ti,hwmods
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-dra7-omap-sham-fix-v2-3-4eadb60081e5@gmail.com>
References: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
In-Reply-To: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789505986; l=1381;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=3NlwmlgeR9UStztzEJOa5XxE0OKSg9rGXxb09yHnIZY=;
 b=ZXwjniFsJyTCSkhGvIbLpRhULkdgCB1/C4/QtgW1ponKnqrQv+R+rEN+sSL8c9Q+PWN93nCPH
 5czedkWgtzcDcn6Jf6cbKfzpFYJPQpyBOOEkwg929QDKmLqi8guHMLK
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The OMAP SHAM driver supports OMAP3 SoCs, and "ti,omap3-sham" is
actively used in existing dts. However, it was previously missing from
binding. Add "ti,omap3-sham" to the list of valid compatibles.

The legacy "ti,hwmods" property is no longer needed as TI OMAP mirgrated
to "ti-sysc". Mark it as deprecated and remove it from the required
properties.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
index d69b50228009..3ef05890e13a 100644
--- a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
+++ b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - ti,omap2-sham
+      - ti,omap3-sham
       - ti,omap4-sham
       - ti,omap5-sham
 
@@ -32,6 +33,7 @@ properties:
     description: Name of the hwmod associated with the SHAM module
     $ref: /schemas/types.yaml#/definitions/string
     enum: [sham]
+    deprecated: true
 
 dependencies:
   dmas: [dma-names]
@@ -40,7 +42,6 @@ additionalProperties: false
 
 required:
   - compatible
-  - ti,hwmods
   - reg
   - interrupts
 

-- 
2.55.0

