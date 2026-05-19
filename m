Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C353ED134
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228510; cv=none; b=gPXEYGSuk+bOiK1Agw6W5MaF+plgwyOS380SPMb3XOJku0oTWtz10903PXPkUMJ3nP71azriKohqSAzgL4Owkgh3slaUr68jtW5gLLaefxqNxvvns8dOwCKWkwp22CjxMng3AlLhPkyuxrM+6KzEijAmdlkr0OtzdS8olyjbpXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228510; c=relaxed/simple;
	bh=lDs5Cfur32hVT0EqCXkjR5FWXarqhbEOLI5RNUfKF7A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQex8bCgNXtzrv3UUHJxnbCsO8dv4NUXfPSYsWox1Trox8DRdNFyJcRzgSzFNHFgm/XjbTQaepI0O2Sg8Ws3w/nzb7LcKYYCwgxjydtDBRCag2r+rQFtcK+VntTFBCOTUXio+kmGtk0CgMQpYCwIcHcRtZoJjW0ASMc44JTrAqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHrd+a4l; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHrd+a4l"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48896199cbaso33334825e9.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228508; x=1779833308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf9iiOefjbtai4lpZb0pjdeUtGQL3N0f8U40x/Ratvg=;
        b=jHrd+a4lkUYPmIUgRDc/XTTUzMlxP5lcobx7qN17Q4IRzlDL0mSE7UP2xdKSqReHBN
         1yr7GvgkNQbOzCnrwt6o5jONWImBi5tZbQPEnlpPv9ysKey/WXlKCMzOWY5o2htziuW6
         gR0EeAYrzA3tLOLpmZvdXsUrkztpvjGbM0y85zA6CwZttEcusbAp+fajcWUOwpo9GgcQ
         kIHy2yeGJOmLUEuqp4bjz2g9rFtcdalj3QXM87TJUI5yfMes8kqU+HErH2y/DKIjTctz
         LRj1x+6Y71tzVTkED0QqwD7XdIwuQHX2NmIk8jUEEdyt3WPLCIO/9tzhxlnKxv2NmjNZ
         iTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228508; x=1779833308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zf9iiOefjbtai4lpZb0pjdeUtGQL3N0f8U40x/Ratvg=;
        b=Y2jaPbxC/9N9z0lrQWpU4eI9L5n1+IiJ7oadbSSprr9XMnwoJcg2UwXHtrHaa4kfhp
         spZEglD/sFD/QsQBpQld+Cr+PXv3yga9qzEPHRtiwRgT8VAd9CPMDdtQMEj9YrJ6USkg
         cW2qs3oYyegvEP5DmJaQZTrGWRWj3zIYxRkbE2NIhHs1Kcc7Wx6xpC0dJrcYQjaszMYX
         DFKPIeSDjBMYF3bhba329BQmXWy13TDKu7WmPqik8mqNTXcpO0c+jAnuArqo2wWyCEKe
         b+4+XYVqGKfO/svblZIDcuH7P+3fsrDSVCx++kLR17LRh58+rKB9K8eiPh171EyysP7v
         bYCw==
X-Forwarded-Encrypted: i=1; AFNElJ/6k3cCJhe3sINh+OHsDdfWw+CfPlHiugXSlLpcmje162/FKbZN5FjwfBM3VInpJg3Ej0Q/2Yau/qd6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CISePI5NJa/HOfSxBVZi8ZhnxOU4T4kMgGaFehV7DlKyyuns
	vGZk1lzOIc3JTiCO9QX/gIamcLyKe2eta2GvAEEaNWwaTKZ09dqVz6vD
X-Gm-Gg: Acq92OGd9PoCA8aq1xhy2sYmkfSrKVD+jn3CiusTf/q9UpmGv6TIQr0tybSPi5T8dzQ
	7tBnLw8o+QwgFP1qQx13ayOOzMqaNMOCa9uew8qfkTTEolqcK675VmCFlw2cGP092/D+fFxA5mb
	R4YdkhJVl3B6FUB+FsNiroxvdM/nSfED/DwYDETqCQYUMN0aq1j/lCr3LW0qfyH8NPpzA5HJUqb
	2DikkamUSkAhGdfB+GYUobTTUktophuzzK/YaQP98s1Xu8waeV38urSpWMG0+BlFVe+gV6Cfbp0
	5NH+nlZirjdBnLbGO0qD5o5LO++o6fyvAQwwN4d3Ll1N6HgQDrdEf+yZjCpoo1/zaLWC7Q+Qc3C
	5ifru9WCe6d1eB6YoEExSzPegUht5lVI/xetWWRVemdBlLo9WeGhSRHUClZRu9dbd3Rwjl1sqjw
	dZUFYnzKC3lxYOf1f3zfoDEErl19Dx+meckai6opADaQq5109hFi6Abra+JXQBORT3BOUuVnZEK
	lDjd8HVzQ==
X-Received: by 2002:a05:600c:a406:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48fe632a02fmr276048075e9.22.1779228507861;
        Tue, 19 May 2026 15:08:27 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 2/6] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Wed, 20 May 2026 00:08:07 +0200
Message-ID: <20260519220813.28468-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519220813.28468-1-ansuelsmth@gmail.com>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..913ddc16182b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +72,8 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
-- 
2.53.0

