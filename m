Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A029146D2DD
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149658; cv=none; b=EDF6hyC8xA3Vq6BX/ak2ULlV3+bSQro5t5iCQ+vZmTrEDJLcpiIU84PaKhxDLhCcDhtTIYScOo5Byzn/oX0wYmTQSKAsNU1EzzJAaLn4bPvqgdc0jZ0VqHIUHnhKdzVr6I4Dfnm4fHVgJTAfELknTcZyZ3hA4DldT59rcx5H+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149658; c=relaxed/simple;
	bh=K3HFfRXhY985XKq73bUHsf8IzVEDhqNJgoVBj3Mi1vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBPNSEIxTlG5+9HAE5NiJ7nGnE/6Tzz9R9pBMXDrRK4R2hdblDZCVEYzV95qHJ5Hf37LcsrCiELayrn+MTC8WRSaYzWUbACFsXT/dbcWirAU8lH4eIi3YBdfTG3jxiak5/wqQrfzTkw4lkxAwT1idAFiYKxBYrXkxxcHer/sOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=FC+OWePP; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="FC+OWePP"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c247f6687dcso63674666b.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792149648; x=1792754448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RP6t59lytBlT9EpuEl094ip5/Z9ytw4aKa//LaCI6yc=;
        b=FC+OWePPP9UlnSw6nwfJIstHxvVUaOAgxrOH+GxV07P4pOfcNWd/FpojR6NP5Djgew
         fnevroSh+3r4d8lwpxOPSqbe3gHflKi04HGBukfqpm1HvPh22cAJxc4gNMfpvHpWfMXU
         jbQM4zUEGDnQnsx/QX62K+BeMRwfcAQk0JMwnx6ygV80eZndNIcy8b/omcQvAI5wBGpL
         SaD1TeHN/41H5cW18B3+6+H9LvsW59lPhMdlVAQKWiWLXZAyTwoCEbhm883f8K/0U3HJ
         dX21USz6OzZX/U/AqEYmIzRFPTVkZcnfadis1jAhVbXKGFxYm39iVJ/UKl/h7mVpB5Qi
         tH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149648; x=1792754448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RP6t59lytBlT9EpuEl094ip5/Z9ytw4aKa//LaCI6yc=;
        b=lXFC1O0HqbR0XTzlV5ySGmfJITGgMFLad9N3tl80DqIn5QRh1LUdmrOQydpjf9tAwd
         Qxs7GOoMHOyv2sQTBsRBReWMmiUNEFkE0ffbl52llbnADQaEQAlLY/Y1ZAdzlfBXbUok
         EMFmAvCd6be3jT9noYVYoLbej+XVUacmYfu42ggq2Vlvclh5fwzZdXOjvYwQlY9FjVOW
         0ln62x5QV7JUDZK8aTGXs9CJYSuDys8edJ9tYhWQuQ69wO3sMgiKanGbp37jLuPeOCqF
         RiJH+tlLyrO7KSouPnqhIzdrQQcsSB6a1IOj6V6mVA/pLAHey4BHXJNRzS1/XudMW3+6
         vlUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmnXn+zokx7FpIZdN+CRaH8+Cgy7DTsHIRxfVQ+d/6FXkdN60ehf2xbCMrZgj9HUYbzSqnMfMLp24P@vger.kernel.org
X-Gm-Message-State: AFq9FYLyCAPNUgNuCoB15KKXtbYyMNOCG4keen5lvpalYkwts9ur5x9R
	R/++fH19w+uBBsdLPFJRZOWnsTMAtSBJZKO/e9D7yuU2dkwOUT26xIQFzVJlWMQCfxA=
X-Gm-Gg: AYBFou07PFwW9nDjwppCSF0fQmDV2K4fQhqIrMxjgQkDvCuGmZjDLcWS2oNBqD6CZrc
	IrQnVXH3SajmC3Z7P4lkqRtevlFYLqbJT5d2x+CNCGmAQ2YMbvga39q7HcrktZDPJt8N5JWVbRs
	sTXnxpHrY1u+1Ax/IWQA6avEl4ff2mL9de0BPejagWS4Wp6yLNSBitf6PcE/T+ioOJxF2Y5C5tZ
	/IMeQ5qzYDrqAn6glaV0Viy8O9NeY/ch5/c4NzHR7RhOz8wY+xAheboIbGLgGjRsaohNsEVGIHA
	KeZxpyHAnsyHIjAjZ8ITEDqX0u/2+R7YIKgorgF8QTW96VBsjjOy4Vz/+cLihAfTo+ER/+IQ4Pw
	0e2lH/UGzBy46o3jLCzEMZzKJ5PcOVcnctNDf4/hyl61SN9bevAQuvnWh48A9o57/kIG2sf2FcG
	nkByB/OALHamQJ7ffDp11NG6b99XR0ULFCyv+6FNsYXJnuNb0i7VuJnJnwFs+SOf39TIIdGOrzk
	dcmMsMM6I1D65gQAj5c2wgixBmivA7k+rq8hTT79Yhid0OABRJJT6lAkwNJECMzU1c3U2jT1k8J
	+mtrlWDScImKSTMPftR2qkCq8adL
X-Received: by 2002:a17:907:7212:b0:c2d:bd95:874a with SMTP id a640c23a62f3a-c31a9fd3559mr1982434066b.17.1792149648629;
        Fri, 16 Oct 2026 04:20:48 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-194.xnet.hr. [88.207.15.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm63947666b.11.2026.10.16.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:20:48 -0700 (PDT)
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
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2 4/5] dt-bindings: net: maxlinear: add MxL86211C lane mapping support
Date: Fri, 16 Oct 2026 13:19:35 +0200
Message-ID: <20261016112033.949026-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016112033.949026-1-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the optional board-level mapping from physical TPI lanes to the
MxL86211C analog front ends (ASPs). This allows DTS to describe wiring
that differs from the hardware reset mapping.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Define the lane-map property at the top level for type checking.
- Describe ASPs as analog front ends.

 .../bindings/net/maxlinear,gpy2xx.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index a0dfb6192d81b..4323be300c721 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -35,6 +35,7 @@ allOf:
     else:
       properties:
         vddp-supply: false
+        maxlinear,lane-asp-map: false
 
 properties:
   vddp-supply:
@@ -42,6 +43,21 @@ properties:
       Regulator supplying the VDDP pin. Its voltage configures the MDIO,
       MDC, and MDINT pad voltage and must be either 1.8 V or 3.3 V.
 
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
@@ -91,6 +107,9 @@ examples:
             reg = <0>;
             vddp-supply = <&vddp>;
 
+            /* Swap physical TPI lanes C and D. */
+            maxlinear,lane-asp-map = <0 1 3 2>;
+
         };
     };
 
-- 
2.56.0

