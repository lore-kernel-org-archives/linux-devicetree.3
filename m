Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489032;
	b=sUu8SMSMexsqbX7nUqHLWGularFC/5rELeCt6fr1yJ+nFdngy+sxED/5v+uMVKr9wdcC
	 Ys6PFzbbW8TcnELG89W2GErcsRjlKrOyjLtApkOdGRKh4lgXXm6Mnl6vkdFmOf+i0QiqV
	 SpNBuDhnGK+ayQZzWKY4mZeSnhmLc6MahiYZS6gLPw6xiO+RGwPVExdnEkyWgaVMWR7Go
	 zml3ShkpKviGx79qNyapYfMazMbcKJ4FqJDKeZQBNwNN6Au8yYgwmiYFBgjyPBG+oO6ve
	 tnRG7QRCv0x22lC8XHOmOo9fL6PYms7RQtZ57N2sM9b1PNMXlCUnENOaslUzVzEyhSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=26eHFzDuq75BKMwszFnGzYlGwf+oiqj/3YNi48CTJwY=;
	b=Oj8W4YBOWvDuuK9nzvBY0hZiGKzkgN5KiPX+GcgupyAvpZuXPAeeACuFR232G4awJjZW
	 RZS6RTTgGDcn5HsUchpACVqhzJ8pTxXeJCnKRKHNbKDYgN5lRnuY/1sPoxWpyzQaZ4OBT
	 ocXt62beZjCZmzwIWa5iC3xPISmW878nGGHEvguYx8XVRys7iXeJ4J/v5DydyLTKSWJLS
	 IRsaMLZ8g38X3nqG2/JTTMYyafxaIIuDK/sWN0VAecoa1D77ibbEfoKfGQY4au7v1k1OH
	 HpoFhsaQkox6APen292Zj4Xi1GZKXUHARBFSbOcWJVpkbsV+0Tt2XfwHCJfdDkhauig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=LfG97JUD;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE80606A33B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE80606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=LfG97JUD
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c20ce3c118aso93974566b.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792489030; x=1793093830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26eHFzDuq75BKMwszFnGzYlGwf+oiqj/3YNi48CTJwY=;
        b=LfG97JUDdY0f5xn16pZkZ0zfGlB14my7j7PRX3fpaoFMYMUGLVmkTTabUGQe6+uuJF
         a7Jj061lJm7UkckA/KSvUewsSv8G1jdgD9Z0uw1Af6dWE09ixRIQPJOMM/t9y1ddsLOP
         9sBEOOdmaNyqZeqiSF9DaSic3o1LcLADe9HDrlMju/Q/3xHz7LGKq9HUXNAQ1aAfVFTh
         W+NPcsCLXzoLaQN3OcJ7YwKPCeJ8vqzOEU+vX7/6RlnRbukjcTTqrpy5vY6lMwH1wccf
         RAHEsze2gwkUhKv6dJHMkkBknioOC9EogPdW8y31iUaMFim3Gdvrq17TZKeSD8JQvT4K
         MB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489030; x=1793093830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26eHFzDuq75BKMwszFnGzYlGwf+oiqj/3YNi48CTJwY=;
        b=LADOvmKNOwWi1dpu1C69FjseqZXcdkY+Zhy5LvT4XPooV2hNqKtsax1Z5PPRi1goVH
         yTWMxRlvUKf2mSUg5w0qn9dii+d7kmEL3fjvIen/nH4GhiN5XeGJznU2npm7q0c8WmNC
         vxRbcklkVrlkIzdp4rtT0BEskJMitzNxARrEh6NsvP8UV+eVJRDaP3tIUnf6Vw5pKikv
         0Pag3aH3sLdJlF+r2le7TLvDZXLpl90LkBnJfYFfHhsOwKxhAGgoFYafxDDhtoanUVcM
         LyOMCfUtlDIduD3exS0pJQ2V/YDYrgfkAj4fGLRnYpgNtSEWVJFoDjKbJax1q1u6SbJp
         9cCg==
X-Forwarded-Encrypted: i=1; AKwUvBy8PfoHMpRjzgkHD01aiPq5KrnkYGYLRnpvujye4TTG9GQrC4mUoEDggUHGODSN7XsYYIPIuIvagOzL@vger.kernel.org
X-Gm-Message-State: AFq9FYK6LzGPTeHEHBBULuBFAJ/PUHOOoNVuyD67aXks9kqXi0WqecMv
	/4P1gP/YaM3qorma+lV/npsRbDvbJ7hooXjGDVX62kuNEYmLVd4weMoCPE9qyr5P/Sg=
X-Gm-Gg: AYBFou17JsR/aNprXhS5k0kAk46sNNrW5GYaYYSG3LBVBwCAknB6U6kjKlGga0pYUDh
	NPx6TmdesxwJyFaSKOdzfAMJWFv71kzvfAp55emq/GSBoQym86zW/ljtmZImxqcOxN55ikqVmYW
	iAaDc5KCZBR0o1Dms1uQ+E59xqEznAuZp5xJkN3jAqX7utj+nOBl+io6MJmQHkga5neIM3CFwf7
	lks5M46IGEZIogDxJhugnNOmw+XkPBqMlZAUnLnqSon9GKHHs037ySRJpODjfZsKHDdWMLtb8Fm
	qJOYU21jAgTzwC/SwVHlt/IPup9P6TmVbE+aCshnU6+TEAY/9Kmvo4OUR+TNxT6ccZVITFVj7QD
	tUMeVIF0WzF/qTCAUIZtgYtMmkFHoBiBYebEucT8b9927l6edJNvs8THtnWaGkAgCBi1ii1aDv/
	5qmlbiPuWHmtfrMPXSm4y2rmwtt+jvHI0YQbaC8AeO86FYBFW6pMo3tgvog2OabUoUFWFA/hQk3
	Fgqsex0AhhqwwutY89VohHNwnpiUsYTF7jUnHQUC3pNB7ABWi/oSRmVbNoMizOSyQ1XPJVTGKr5
	R2JJEGZI9HV+Sndh9BPNwuYo0sfHZqpwVvnU/WPzmXkHUtAl5e3WplGi
X-Received: by 2002:a17:907:c081:b0:c43:bf29:1509 with SMTP id a640c23a62f3a-c4603c04e5fmr108178866b.12.1792489030235;
        Tue, 20 Oct 2026 02:37:10 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm462730966b.47.2026.10.20.02.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:37:09 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lxu@maxlinear.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v3 4/5] dt-bindings: net: maxlinear: add MxL86211C lane mapping support
Date: Tue, 20 Oct 2026 11:35:37 +0200
Message-ID: <20261020093655.344585-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020093655.344585-1-robert.marko@sartura.hr>
References: <20261020093655.344585-1-robert.marko@sartura.hr>
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

Describe the optional board-level mapping from physical TPI lanes to the
MxL86211C analog front ends (ASPs). This allows DTS to describe wiring
that differs from the hardware reset mapping.

Select nodes using the new property so invalid uses are checked even
without the MxL86211C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Select nodes using the lane-map property so misuse is validated.
- Restrict the property through the negated compatible condition.

Changes in v2:
- Define the lane-map property at the top level for type checking.
- Describe ASPs as analog front ends.

 .../bindings/net/maxlinear,gpy2xx.yaml        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 53f430e121510..7b6140baf1757 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -20,6 +20,8 @@ select:
         - compatible
     - required:
         - maxlinear,use-broken-interrupts
+    - required:
+        - maxlinear,lane-asp-map
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -34,6 +36,7 @@ allOf:
     then:
       properties:
         vddp-supply: false
+        maxlinear,lane-asp-map: false
 
 properties:
   vddp-supply:
@@ -41,6 +44,21 @@ properties:
       Optional regulator supplying the VDDP pin. Its voltage configures the
       MDIO, MDC, and MDINT pad voltage and must be either 1.8 V or 3.3 V.
 
+  maxlinear,lane-asp-map:
+    description: |
+      Mapping of physical TPI lanes A through D to analog front ends (ASPs)
+      A through D. The array index identifies the physical TPI lane, while
+      its value identifies the analog front end, encoded as 0 through 3.
+      Each analog front end must be mapped exactly once. Omit the property to
+      retain the hardware reset mapping.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    uniqueItems: true
+    items:
+      minimum: 0
+      maximum: 3
+
   maxlinear,use-broken-interrupts:
     description: |
       Interrupts are broken on some GPY2xx PHYs in that they keep the
@@ -90,6 +108,9 @@ examples:
             reg = <0>;
             vddp-supply = <&vddp>;
 
+            /* Swap physical TPI lanes C and D. */
+            maxlinear,lane-asp-map = <0 1 3 2>;
+
         };
     };
 
-- 
2.56.0

