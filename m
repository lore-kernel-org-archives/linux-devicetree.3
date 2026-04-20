Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0F739F187
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 23:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776729087; cv=none; b=kKA/XWMvUi+pCib8LWty4M7nmLaeA5dmWDvtlnY9VQQCeG8/rVtuYdqPMgvTyxg1Xr5cTwoFqaTPH2jWg/D2EtWewKQcI44jsb8MsCXbtNnXR7hHw8RvVg5+Cy/D7atv7VE/xzvpfkWCFc++GDSOnQEVPboXJY+bJ49LtIzb+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776729087; c=relaxed/simple;
	bh=Q7DrslDoEzNPakyLJFXorxvjgyPUA3DGKqDVH51Yzcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FD0gLp78cVFdsfeCroLcGw33AAovU2D1aIxPsMcsvG+WniRZXoce6H/w2l1qbfbidVVkyDYytx/gbHq9/ShDdCF26kC/44McWViQ+jvCnZ/TsE8lTDiuk7IEFhMaYyJw8d+1jUOgwGYqjUFe8tT3E3iXTNytLUxSviKZrA/FEew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=jLgvKzZK; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="jLgvKzZK"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso1406720a12.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776729084; x=1777333884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=;
        b=jLgvKzZKAMd1aKLQfqhOpaN5xDskyrAuOB3k9JC1W90OjlUQo3nL5xBxqUvTZu9vPT
         TgpIsu6X2nQQ99gLq4kCbWMfFcgdTqd8LC+ytHi2bJh3SMcN6uZz7BhtERfzvYIC6CmN
         L2R2al76o5NNI2/mv8BiGR7raG56XjAv7yHYCc0rJWf7VPmOyeuARewEawjwVsbxJQX5
         v/WLPc0egiN+XJzKAe4STpRhmQm3WqqoWU33G7vw5rKIVryFpckQiajW0iLFc8nrLJ6M
         WgZOYKZ4k6VCbWRV/w+i4FGP3LpyyR7oipi1y3L/mh84UpPC8uu2KRqBuBr1azN2poTJ
         8zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776729084; x=1777333884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8R1cxPctftOG89u1iC1smvABtKfPmxn/YCB26kmM4dc=;
        b=r3X75Tm4gLZKWrZZrnU3nxJRGAwoEkqrtRbz+q+wRwyd0Al5/RKooTe7qRnCNovqOw
         +0wTTtwwM1Il1uTHqxt5Fwlf6EtyV76PCDNIQTvHYxNYw2ehYcC9y5qeKuWCylU/GrA3
         QztEuivG9aFvrsWl3bt1OlArtl7LiRuuCidxNkLCsipMFyXv+qny0y3te4PPGZXvnqCI
         vNBty48smAd76hCdfW103v1i1bXDQsBCwO79L9AABGkxm/jCKYTjIAWpuSDe3pBL7y1B
         hnK0aWzzJ8NRXbc5cQ0jm1p8/yqi93X7AMoxrGZYO6I8efzjQ7MmzGHvLMDYEOvZdm4D
         I9QA==
X-Forwarded-Encrypted: i=1; AFNElJ/G1d8VbxD6h6vunJTVKFTA2j7FWLbC3zRIZkmFnpEYOi5Ok7JWz6tGPN1HF2+ytaDaVBuzBzJ0q0HT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9VgyfuVXA0OkyYV/Jr1r4i/DVptBhMrglwO77oZU1Ya8hhYXd
	3izVq0aQmNEL+/Bpnn0VAetZWwKScXIksYWBKZQBfMO7rwlONeLRtZ4j4WZEhUAhq7ubbewd8Rc
	1WLOMupOziw==
X-Gm-Gg: AeBDieuLo+vKfzXE02lzFaJxPSl9FI1o9IS2YwkI6cAbonWraHtuhieg8V63RF32IUG
	IpZVuMHkoOJ+ZfVVdPgQTISJqVMJRoZcKJseEoQZ2XXWOPhbj7CBDXcJs3S/horWtfVxe6amFkV
	bJDcY6ibK8lmB1z601Mx8xBqWPBNbEM/M5HS8VXRjVYRnT+jUE4KW1AzhJ3EXp9LSGanpinth4u
	gkK/zT/UpN/zNII0mNDDL4Z6lAP80vtnFMyvCrOpvJ4dMsOg4MQV/teunJh6rrNR2YHgeo9PeYQ
	i0xthUgLGMGCel3/OtD9AdDI3aEOe8zbkKh21bo12+31nyH4RvP8fhEykpku4WAbUut4LLBbaDy
	URrDl3Dua111DMJbvbVTITr4Id4+LDogUFVb6OHb7j7y8/FaAKAlFv1zLQfI6+pOO+TW0cRmMCk
	UCScg5nPv3FSgBHdAAZAy/xG8asxgy6g==
X-Received: by 2002:a05:6a20:728c:b0:39b:8b8b:39ce with SMTP id adf61e73a8af0-3a08d8a8993mr17248087637.28.1776729084324;
        Mon, 20 Apr 2026 16:51:24 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770512afsm8971320a12.31.2026.04.20.16.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:51:23 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Mon, 20 Apr 2026 16:51:17 -0700
Subject: [PATCH v3 1/3] dt-bindings: power: Add power-domains-child-ids
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-lpm-pmdomain-child-ids-v3-1-c2c40bef238c@baylibre.com>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=Q7DrslDoEzNPakyLJFXorxvjgyPUA3DGKqDVH51Yzcc=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp5rv6y5BVxIx65aoeOBX8R0eL+DjLn/kqdKdjG
 dQAzKibPciJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaea7+gAKCRBZNxia0/vG
 ZbjvEACLFm8MlgnDXUwIXc34z4MIVMeC4pRZKS5y5cxAvaZdis5Gxu5fOKT/+s17jCAWuK0q+fJ
 DbjLai39AfHqDfnLFpEDUQHABLV2HYUD6OlbhD2R4Rw++dgo3muH4Uh9fwQQhi91qGsqqKBTn8R
 pl5axwFaYkNQ/XefNvVGYI6JAY3m6BActyrFbjh9VzVVJEUlw4ghAte13QAoN7uLTfjDY+tAob+
 cgaWr46DmW2xvpGTHgg5jpLSoyBVlsi0JlWTmf4KJ0yIn+AVW5ba91z4b+R3Ig2SZv4uBRo0v/G
 KQHjmx12T+bN4wXKuCkgEpcx6I0vISxobB31N0GaSd2a5NwktJeS/WPrSLRBEUR0IWoF1dqJPCp
 KToR7eKTzaCvxRL0iNKEeIHx3IlBIGphI8U+2TeqYd4/zrQuHnX7u98R2llldy6lLaKBc0PR8Jv
 7fIMns0u0h3P0XAtvWygGW6/RqqIXTjbqUWXHPtOIdQxWACYpd2zB92iH5UmZ+3Hfu5Lblvfaue
 Z7211y5p/CKrXtFR3F7FU4bChCS0HHuDXWxfQc1X+3gsMJsEz7XpBWxSAhV6ROnNEnBdxYmKdIU
 m5+6L4n9dW507Co3jALSjmPbc/ZSck+znnQTEsmLplf0gX4qpKc5RSyfZqujiPT8vxlToYH/4Vh
 rDwvioXHnY+8WMQ==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Add binding documentation for the new power-domains-child-ids property,
which works in conjunction with the existing power-domains property to
establish parent-child relationships between a multi-domain power domain
provider and external parent domains.

Each element in the uint32 array identifies the child domain
ID (index) within the provider that should be made a child domain of
the corresponding phandle entry in power-domains. The two arrays must
have the same number of elements.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/power/power-domain.yaml | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index b1147dbf2e73..163b0af158fd 100644
--- a/Documentation/devicetree/bindings/power/power-domain.yaml
+++ b/Documentation/devicetree/bindings/power/power-domain.yaml
@@ -68,6 +68,21 @@ properties:
       by the given provider should be subdomains of the domain specified
       by this binding.
 
+  power-domains-child-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      An array of child domain IDs that correspond to the power-domains
+      property. This property is only applicable to power domain providers
+      with "#power-domain-cells" > 0 (i.e., providers that supply multiple
+      power domains). It specifies which of the provider's child domains
+      should be associated with each parent domain listed in the power-domains
+      property. The number of elements in this array must match the number of
+      phandles in the power-domains property. Each element specifies the child
+      domain ID (index) that should be made a child domain of the corresponding
+      parent domain. This enables hierarchical power domain structures where
+      different child domains from the same provider can have different
+      parent domains.
+
 required:
   - "#power-domain-cells"
 
@@ -133,3 +148,22 @@ examples:
             min-residency-us = <7000>;
         };
     };
+
+  - |
+    // Example: SCMI domain 15 -> MAIN_PD, SCMI domain 19 -> WKUP_PD
+    MAIN_PD: power-controller-main {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <0>;
+    };
+
+    WKUP_PD: power-controller-wkup {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <0>;
+    };
+
+    scmi_pds: power-controller-scmi {
+        compatible = "foo,power-controller";
+        #power-domain-cells = <1>;
+        power-domains = <&MAIN_PD>, <&WKUP_PD>;
+        power-domains-child-ids = <15>, <19>;
+    };

-- 
2.51.0

