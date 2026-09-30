Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78063624DB
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770997; cv=none; b=NferQqFsAFsOmXrpFouKegJTgfc51SxOo423SUP30UC3OjVyjZooOz7o5iDzWmCXK4c0bpQ2PCbeL/MrsTsh9qvlcX9Fw1kHNemjYqmiSeO2QQW+zwbSXZ+IJ8c97DDoaITRyC49BRoeI4FFzq40AkBOZHzFLtyaS6HdFkz3B7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770997; c=relaxed/simple;
	bh=hd66VCJ3K0RoXkl/bUrVexrnvv/K041uRHih0HcPJLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htCyerG/nD9GSg5YWbYL0RqP7zW1C7JUOVIqyHO3nlNQpRtGXFbz25gj5My4LTdYeo4nnIA5mtrHMbX++dzx5nZe+n1a7gPfpz0Uam4W++PRwJEEVhjsEXskICgW/vCZ7aPsHnwAnDgor04hdn9aObBrrEwc2TtIQ5bTjiXm8cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=AR7Kjy4h; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="AR7Kjy4h"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb6b726b5so2894185a12.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790770993; x=1791375793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTmXsnC8RxOPoTRudDkJpI91DV2+W3uFeKU9KvirJ9Q=;
        b=AR7Kjy4hQnaTlj9ensLiGt5clD38S8VlpsFB7IJErtO77C5cjJHEOnMSMSOC9C++d7
         BJpfRYlwt+RcW37w8I7uwQh3EFVCiQiE6hL+oZk5bgL2eAZzprPebRFSTYv1xMX6VH8Y
         zs3do4A4lQf6ij6ZkGnVT6Nwwswg5nF6adcKdiGivpgLXKLb93kCkY7xZS0IsdHSA67C
         yewrMpJJl7BixUSB2Dqkb+QkQxRmYLx5BzRdeXUBocGZF2aD/Lz5BpB1oq8altRT6o7w
         91UnZey9R2nZwBU+HNZBuldEbm2M74l5rfhn46RvBF4AAjGHo7kV5oNEvDhcCQO3zhsA
         3ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770993; x=1791375793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTmXsnC8RxOPoTRudDkJpI91DV2+W3uFeKU9KvirJ9Q=;
        b=WN/5dpW8zueRb7zULisB3j/11eBkxRmtQO3Y7SVvVHeXWqGbr242wfcJdy38AFtdS9
         OgxIoU9+V991wckLSjcZ8p+aNIT+QgbQcPBCvOdjp3pasKFU42HMrFLkAHizyQlfcMjb
         3cKpdkgFzcFIO3JimsKQz3W2mcK3Yl2qwbKGu+f3TtXM3lI7eP0jD3PAVg401A/Ou5pL
         Xo8/3FdiUpMT3UOpCSiyuPQqTrsBu1ikpgT3U/78I+kjzvyMEYVryXqK1xk5SmmZEsqe
         Y9GSWTJJrCtY4uemyu3u8hwwIT6Y1ui9TREcEU2zCHUcUiJ2+7Y9wUBIQuVLYo4Zp9lp
         b7hQ==
X-Forwarded-Encrypted: i=1; AKwUvByMbkIT6vscLs6yYs3MmVVlLCJgWoxv74SrIjpcfP4PE0W8KqqmhQJrGeDTCUM+1FUosCrl+646E8a0@vger.kernel.org
X-Gm-Message-State: AFq9FYKOWoL/HK24CqF8NALNP44x12TMe7GVwAki0aTbQJPaPfHxCfhe
	HZudqbODVCN3kmGdqLq/hx1F0P0iwMENbED33/0IIMUKFEIPFRiieJZFCe5LwC8AOxo=
X-Gm-Gg: AYBFou3QIB+iKK8oUnUA/R7tfe3+IqlkyHFbmVwQHMF5NAgKqmCD7FObeNXwcz/Qxys
	mmA1SofSSS3UyoJL/S2o6DPWU7rPR5fis2YhqgK89hrHoghyL+DO7H1KpYUTmdCMADYZRRX1J/W
	6HlafDdtK/zV7sFMKb8TR6aCOATkw3tlut59T8HrKC9NkWMo8ze+68tp9FNeUT9ufTInnJGidu9
	gBl2lstUdwmzhy8KxNrjOf9l0P2+3Led6Wt6+GJLCkPjpgZECbkF9Axtlu42Fzjv4RaLR5bQ5Ao
	oW2ijkr2CQSrEiswuDZDIASNF6NsEc9tWkf+oaMj60py2liN1CcGN1mKkIa29cpaG7ml3kR4XTi
	gv3SA56bPvZ1IX2oJJ7TDiIE+xBGEwpuOdHv/w+R7B0TQl2jGct6hOhiSxBjJbapcB38m+HUojl
	iFfHI8IvzE4PIXVKgaTqACaD1UsuPSfA9E3qBCui7tnLWAe8nkjjFh4jNd6/atnj1lCLaBNIwYI
	LhlgSsJ6xmkSYjzc2Hxgmpw8el+lp/jL5Cdab9JiTYWg1aJB82wShOfIOmtaUuAORJgzLcZf7N/
	VMGK07V2jQNr7Idmnz2/fhV7YdtpSA==
X-Received: by 2002:a05:6402:23cf:b0:6ab:373:54fd with SMTP id 4fb4d7f45d1cf-6ae1993bc30mr808003a12.44.1790770992881;
        Wed, 30 Sep 2026 05:23:12 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-187.xnet.hr. [88.207.15.187])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e5a3sm744042a12.20.2026.09.30.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:23:12 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	lxu@maxlinear.com,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/5] dt-bindings: net: maxlinear: add MxL86211C MDIO I/O regulator
Date: Wed, 30 Sep 2026 14:22:13 +0200
Message-ID: <20260930122305.293686-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the MDIO I/O voltage regulator exposed by the MxL86211C PHY.

The regulator configures the MDIO, MDC, and MDINT pad voltage
between 1.8 V and 3.3 V.

Restrict the regulator subnode to the MxL86211C PHY ID and document
the board requirement for VDDP to use the selected voltage.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/net/maxlinear,gpy2xx.yaml        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 8a3713abd1ca9..0645e885f1747 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -12,6 +12,29 @@ maintainers:
 
 allOf:
   - $ref: ethernet-phy.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ethernet-phy-idc133.5400
+      required:
+        - compatible
+
+    then:
+      properties:
+        mdio-regulator:
+          type: object
+          description: |
+            Initial data for the MxL86211C MDIO I/O voltage regulator. Set
+            this to 1.8 V or 3.3 V to configure the MDIO, MDC, and MDINT
+            pad voltage. The board must supply the VDDP pin at the selected
+            voltage.
+          $ref: /schemas/regulator/regulator.yaml#
+          unevaluatedProperties: false
+
+    else:
+      properties:
+        mdio-regulator: false
 
 properties:
   maxlinear,use-broken-interrupts:
@@ -45,4 +68,21 @@ examples:
         };
     };
 
+  - |
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-idc133.5400",
+                         "ethernet-phy-ieee802.3-c45";
+            reg = <0>;
+
+            mdio: mdio-regulator {
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+            };
+        };
+    };
+
 ...
-- 
2.55.0

