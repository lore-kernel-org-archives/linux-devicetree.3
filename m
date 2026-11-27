Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807416;
	b=ATzBka8UHOmtbImz+qhuzMimiblsO+kuVPW9ao8l6Mqbn5l6EQzGxXDlQQQT70AS/+ks
	 INCYF739/RYwhS5hz5Q/KLUd8gdDFfF28FWXGNSbGPyQ9BC7tWq2KtENQzeYBLx6MO0rX
	 XyTMpD+TZzdsO0qQLj1mmzRLVFF8SB9gpaCFRRgHWAgXWFntNCwy19wncR1Kv0zHYZ57m
	 E/q9+L1K4fqsjOcSSk+jGMP+VFxpKF6QBVk/au0XzdDRR3AIJIS5IJ+FiVoSaO9ovzrNx
	 7HQZ9UCgMfOD4Zzs6fnmYGRjgfuS2FHl4ubOfcD0ygME0hlInjYEz5Nfc98Gbb26mZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sr3t56lz2ew1ExXZcTsdCaVtIgRa73m8p4gNG8bPmz4=;
	b=FU30/QBEAo3HiIvXZGmMQHLiJ/YvLPyYYUGOtx3o0yJnhYSrgSmHakld8TCmlJPYeCm5
	 bf6sTI+AVoWK079w2uftTG7SnAInggbEHb4XDcaLxPvj+ErdzSwR9NX2sm6h9V0qI7lNF
	 pjadFmpX/QqCAott6mlFO33HKXk5UiU0Lg5LRp6hZ7G3rK2dVpysduCXhDL++9Yyv1Ddn
	 CHefORpa3VCYODFZxZY/PX8+n5O72vzK+GyztTfUrGw4d4EFMmyqtOqqMhrED4jyAgrkG
	 dedZygpJgpEroAS6o9YJ7aMbAR+AE6XFbvNU+qTR2TrjqsZSRmgF5rWT52z++AAVAsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTsMJGKa;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA95606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEA95606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTsMJGKa
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-48ed188ee81so4507705fac.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807415; x=1796412215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sr3t56lz2ew1ExXZcTsdCaVtIgRa73m8p4gNG8bPmz4=;
        b=LTsMJGKaAjMGdRZnR7RsseuolEWWuGpq1vMKt9y6t/+iWg+J5hcHf1uuKUtvegOQEz
         3gBG2rsyPZMJ1lk07sxsMLSzaMMYSFb26qojP1UGWGd6OhORSzTMewNZv3v4pITB2jzr
         UU2JHvNycTvYE5VcxN13EzCNcbs4uo9iNndE3c7QuuxYlwqLafPPAf0W7nxuikMgextt
         Vqy0YkPAbRktcoovFRO0+PA1mLlMU0gfiSPiwxz300rAupaUoHD5OkCyHdz0PpwoapPo
         c4iDs3DzSjH1PDe+/bSpqcbjAMdKcGUzapgsojOlK6N4meJz6rshkmVwK5oOkmfXgiqA
         p+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807415; x=1796412215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sr3t56lz2ew1ExXZcTsdCaVtIgRa73m8p4gNG8bPmz4=;
        b=mlGxEnR6kNVFHsQY8T/oOEKzXc51krhcBme/XarlL6nm/4zbT4GBZzPGT+LgJw1P1V
         4cs9cVdQqw2CzULI3kOuZBnhQlpxOK6Cf+Ut96h54CdXQKz+yM6G1dr8cgkI6jiDNkbb
         yBlrJvlpNS6kBKgv26xP8XtrpaiaZmmSp1lUVrJZFQMcnqD1GhzJIPUHvya/Ph6FRy1i
         xd0DOrStnqthz7URZaFNJX8eeAHGSD097420yQ5fW+mctPxVbgjUOckVvjDvxNLZZmwr
         ssTUO38OCy97c5IOPBGvt67ZBEsUeIWhTejx6n4XWhDZpdKFDiYhM5wvIVLYtFf/odUI
         ZWWQ==
X-Gm-Message-State: APuU4Z9ZDvqjBuhM+f/SiFP+ZyECPU0rnNLFnPsF/XTE8bnP98y8SpC0
	LTtZEB5WpFXSdSBK5xFaysDq0EKbhsnURjygdD5EwnoqP+I5DP4NVFjQ
X-Gm-Gg: AZFdTZcJtUP61t6K0bf8FG3aRXzVFqEpL6AkK4U5i2K1Dq9q5TwLMQzIIxuQFBIu7XY
	l4D+sa+ny7R1MIeOc8dxGiMFfpxJIz3UAQ+c1oSki82iV7DUBjwEdglFnXj+rce9tYSnVeYvbUR
	SpFksy58BTnwLBpDe6Qfc0fvI+nvx+dnxhM+ID4AVts8X0Md1w7jdnkhQ+ZaVj0KZDt0l3ToZH4
	sNYPhvrsJ1MTA51VfWnb7ckaHSxLRWup2SXU8dv2VpRsmilHKTJ7sLTeikb8gkrXOsux/vWgoEF
	1U1RQotdg+mIRWwb6wRnnhHJP4scOJi6CHrGRD7ZgeZjUSGB8qyCHKMFj8jt2TyG2qoOrpX+hHt
	hD+gscDcc2KgOGpfHIlTTnC494J6fTr6ICXI07OR/ajSXEEGsWshQ/Qpdpuw1+snkl/J0FWXu+Y
	tHq4rcFOZvbXWOPIGmTDaRyXjkEjDjVcPIHg5+9VlPL/IYSuc1eEn47/DHKpBx6iExENMRVreVi
	xNBHDRBEhPY7o+BdB9aniqMIYCkCv+j+UF7lPRgK5iwJKUZCWhI/V11sErCtGVPrfUjsgysQAuc
	Xl6g2kGW7b54DstAkj1nmaxNtKC9Jw==
X-Received: by 2002:a05:6870:828c:b0:47c:c8e6:23df with SMTP id 586e51a60fabf-4bc84f22914mr23087614fac.27.1795807414615;
        Fri, 27 Nov 2026 11:23:34 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60891cf6sm24044850fac.13.2026.11.27.11.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:23:33 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V5 1/3] dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
Date: Fri, 27 Nov 2026 13:23:28 -0600
Message-ID: <20261127192330.610452-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127192330.610452-1-macroalpha82@gmail.com>
References: <20261127192330.610452-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add bindings for the Cellwise cw2215/cw2217/cw2218 i2C interface
battery gauge. It is similar in function to the existing cw2015 but
with a different register layout. Each of the cw2215, cw2217 and cw2218
only really differ in the minor specs and the hardware ID they display
when queried. shunt-resistor-micro-ohms is a property in use for
multiple devices so not appending a vendor prefix to it.

Update the minItems and maxItems for the battery profile so that the
cw2015 continues to have a min and max of 64, but the new hardware has
a max of 80.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/power/supply/cw2015_battery.yaml | 41 ++++++++++++++++---
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
index f7bde324153d..2db80287def4 100644
--- a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
@@ -14,12 +14,13 @@ description: |
   phandle in monitored-battery. If specified the driver uses the
   charge-full-design-microamp-hours property of the battery.
 
-allOf:
-  - $ref: power-supply.yaml#
-
 properties:
   compatible:
-    const: cellwise,cw2015
+    enum:
+      - cellwise,cw2015
+      - cellwise,cw2215
+      - cellwise,cw2217
+      - cellwise,cw2218
 
   reg:
     maxItems: 1
@@ -32,7 +33,7 @@ properties:
       back a test report with the binary blob.
     $ref: /schemas/types.yaml#/definitions/uint8-array
     minItems: 64
-    maxItems: 64
+    maxItems: 80
 
   cellwise,monitor-interval-ms:
     description:
@@ -43,12 +44,42 @@ properties:
     minItems: 1
     maxItems: 8 # Should be enough
 
+  shunt-resistor-micro-ohms:
+    description:
+      The value, in micro-ohms, of the shunt resistor used for sampling
+      the battery current.
+    minimum: 1000
+    maximum: 50000
+    default: 1500
+
   monitored-battery: true
 
 required:
   - compatible
   - reg
 
+allOf:
+  - $ref: power-supply.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - cellwise,cw2015
+    then:
+      properties:
+        shunt-resistor-micro-ohms: false
+
+        cellwise,battery-profile:
+          minItems: 64
+          maxItems: 64
+
+    else:
+      properties:
+        cellwise,battery-profile:
+          minItems: 80
+          maxItems: 80
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

