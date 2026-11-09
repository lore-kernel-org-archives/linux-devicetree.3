Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197116;
	b=x8rykmBkiwvf6H8A3gP7S8ErU0zPDfbZVpEASqFk0DFY5P1HUGoXYoAkl2GeuhPqoJE6
	 86saEcQ+NeEUZXvf7nP4izInLjTFG8EXEmSG8kQLeAZMg+jCztDUhmSFMf+zI+4hVJNXF
	 5EdRXPjLIAd+uPwLa3bEE1vutcX73uY33gRDwXf2/xbcbupmC7kwCHvstV9KNQ173F/w8
	 egHju8GErN/otKz/s/5vE/X2kgxQu8xTK4x7jfOMWTR0d/4jlu5adr1TTpsT57c4YKYqr
	 1C95tUQKfosrU7jaRB4fCDEtE2hEvj/obhbTcgSnjJMX23T3t37SE2oQMd1XtK/4rvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
	b=wf0ZiioWJrII24syg/b6/oC0858vA3XkhNJFb0m0Uk3a9xTM+m8Fae4Zztgp07VZAOY/
	 CSk0zNIOS0b3pBSnvJoBh+IqraFPXSmqnV4TT2c/HRvHP3UZJLvd+1G6i5cNXSuHct1sI
	 zkM7t3D9dFGwczbKE/6aiLXwIaJ5gKC2CHofzFAWlEHDWYhuT3WrEhlF+3+233Xmx0DfF
	 sclbSwBsdl5e0smyR1pu4Z3l0wUQC8at16AIeAt216NBkrI8v7qdaDCjzN6jHnVGs2DOz
	 5daF05/bCWp72PGOkFrxsQSVlTz6qb5MkueuaoGoKAIaud46ABnDpd6F4fqwrHeIANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZGiixoj;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4147606A334
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 04:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4147606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZGiixoj
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b14b96448eso199552a91.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 20:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197115; x=1794801915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
        b=XZGiixojxhGrpL7RX9KoIGDpUPBaSpf7vBiwjdTA4Cn3bM2A6vNq2xreToPAGaS2d1
         bhaubbweVY59R++EyiT0IRAOpq0cxGu8N9OgEEiONV1ZOxRZSl6dgm2bZNWuXxDIC36U
         cHgrwewj5ZaOJ2zfyVsiCHFlhAwq4TXXILSZc6SAacNpDAkKAfb8wLCGt8b9EAeG+tkC
         lJ/UVBD6CB9mAYm7QTFHvWHMMoImKql7STXMS3zvoRxmZfbFh588IfyBK9g/0Lium7L6
         LZNXrUCzo8EGC3VHgOc6ppqp+Aw5Rdh2P7d4kvdmNFLtaYOROciBVThqCnWRVDGPWOyn
         6sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197115; x=1794801915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
        b=WSGKg8oRAmbgIn1O0LUr5EY7v2NF2+MJAItRsmAgmQi5AW18MS4rjxGMZ+tII9yk3S
         GT9Wr3kBFDVY3n8nmDyR4vZOQNM3EslsdAtARjhj1e7JdfY6s/DoydtxlLAEPfuxOOJC
         sgQ1YEulMjtCJC2YuXGvnTiCw8B94pHRN4QKzhYX7w7korNsaTNWKBochn9uaHlzXjWL
         IJbb7uTL2WHw6YEPsfx7RMm3BxAB092RU3UuRXjVAE3y5QLte9DerGGaHDeeR/OPwc8j
         YMiqLwuTjr/TBJP9UpwIjgtS9RSfZAkCYX1nKabkZu8dDr8Wp7cAQwUEaPuSKUkDdl+V
         naYg==
X-Forwarded-Encrypted: i=1; AL+hErFLn6yG0UrwgpcC4WxCpWn/GPPYDzYT+aGIaCjaEEZ4/SbFbBOcncZQRJnA4QoOzHxEErKp0iB9p3a+@vger.kernel.org
X-Gm-Message-State: APuU4Z/xxgHwtOwylghBgBJ8fqicAFGZP6B782dRu+FhSyCoMVnlYRN/
	qjNQdBhUJxcfPPHEM1kiaAJ7hBYjPdnuw2Q98VfAe4MPZqTRj2vz9uIO
X-Gm-Gg: AYBFou2pMUu1zisieALnbY0EhsQdgSzFj6oCZ2TjoENMSEZKWWFQwz84M54oGLtr+sG
	095jdykShjx8pSR2iVTw9Kq9XJOHVJyDxQp+frBvB2oS0sqzg8xDqYAvktJ7+g1M9Va5T69D0Wv
	+gNoMFdZYzpz35GIQ+SQCH1OA3CcPtrTUi7m0goKsRqMctT8jIz6RGD90EXThewKyOCw0qhS6P0
	Em9rS+NDbq1iUJd0b9kFYG3L4DGNVnwTe24VVsjHLD8rEZqkk7G/gJkUrIZxxo/m9OXFSQQ/l2A
	6YsONA3RxPKmhwYbDfbda0Q+btqIwVEl+yBBjdVNauEioRyo7YCFQ66+J172+5D7PO9K1KbvGXt
	wsvNQU4hEQAyyziaktSyVYzWwyuW7lGx+TkjaeIlunoezuS0D5lME7SGZJqOI7pUikuDKzRkkZA
	OtvN9dCMgMc300E3pAUcMUigy9DzEIzTaqiFJ+YA7XMmqH1UdEYyrjSRT1aV4KwzD0aaTQ9Dp0c
	TNf0u75cLzvqzRVsPIINnnfaj+bIXcowanlqHKkdGelWnSU4S3DgADaf7D8aniuucvRJaWpY+5J
	jbqkh7qnLkwkZiAGIDdCEjIu9pb+Z9Wq/g2OoPZnFPEW7JHVDlP1QGs1wD743ulpmkNPRTJMM0j
	eo6TnG2dtqlPkffHydbN750jXl7wHX3oTAzgEqDfIav+rrUjih33SezHY4Iu/0StILy/WthHONh
	tcFjs=
X-Received: by 2002:a17:90b:442d:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b12d4b6839mr3064156a91.41.1794197115134;
        Sun, 08 Nov 2026 20:05:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: qca,ar7100-usb-phy: add AR9340, QCA9550 and the analog reset
Date: Sun,  8 Nov 2026 20:04:50 -0800
Message-ID: <20261109040451.114135-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109040451.114135-1-rosenp@gmail.com>
References: <20261109040451.114135-1-rosenp@gmail.com>
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

From AR934x on, the analog part of the USB PHY has its own reset,
which has to be released along with the PHY one. Add it as a third,
optional reset, and add compatibles for AR934x and QCA955x, which need
it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/phy/qca,ar7100-usb-phy.yaml      | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml b/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
index 029665530829..358b3f345c12 100644
--- a/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    items:
+    oneOf:
       - const: qca,ar7100-usb-phy
+      - items:
+          - enum:
+              - qca,ar9340-usb-phy
+              - qca,qca9550-usb-phy
+          - const: qca,ar7100-usb-phy
 
   reset-names:
     description: Names of reset lines in order.
@@ -20,6 +25,7 @@ properties:
     items:
       - const: phy
       - const: suspend-override
+      - const: phy-analog
 
   resets:
     description: References to the reset controllers.
@@ -27,6 +33,7 @@ properties:
     items:
       - description: Reset controller for phy
       - description: Reset controller for suspend-override
+      - description: Reset controller for the analog part of the phy
 
   '#phy-cells':
     const: 0
@@ -37,6 +44,27 @@ required:
   - resets
   - '#phy-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qca,ar9340-usb-phy
+              - qca,qca9550-usb-phy
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+    else:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
@@ -47,3 +75,11 @@ examples:
         resets = <&rst 4>, <&rst 3>;
         #phy-cells = <0>;
     };
+
+  - |
+    usb-phy {
+        compatible = "qca,qca9550-usb-phy", "qca,ar7100-usb-phy";
+        reset-names = "phy", "suspend-override", "phy-analog";
+        resets = <&rst 4>, <&rst 3>, <&rst 11>;
+        #phy-cells = <0>;
+    };
-- 
2.56.0

