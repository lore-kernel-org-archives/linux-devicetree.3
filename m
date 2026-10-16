Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D7C3DB335
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149648; cv=none; b=Ui+PtqMbDdGjEyZnmrS0FONvCOHTD0dJItKTArchA+utRfXF2S0LyzwCNWJBoAjxvRSI43BtEMrHymUGjEUGHju28q3vKPT+VWLDb9WrYSnOZl6b469JyE8kW5YMEEtPruze2GgNeNcS8NtW1Xbd0BRzedU2hv4Dw6sLf13WOu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149648; c=relaxed/simple;
	bh=+OdSs83QXKRZeXBku3v0tG7jLA8SyVPmuroYMjYCBl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/6yb4Sne1gUVXj5Tb0CoJNUuQi/xQ/uhhwun1nxl/xMsrkqtg9Zs2OMOkNoOERCaCi8tluGeM7wmDM2d6Wx1Asue8sNwwV/0VMMzTKFSmpXtj2e1IYbjkDschQBQvelEZEnZIKxFDDgZ7y8RKScVQgtqcmor1be/RzAKa/bGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=eNjmrs5l; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="eNjmrs5l"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2acc1e170cso1068923966b.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792149645; x=1792754445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nP6Hen4ha32UaSHEgIpuQsbgsTYGlvUW0UsDEzDl+hQ=;
        b=eNjmrs5lbIqzIJ8J3huCanjBIWaxjFGuEudBBZEpadeBVSF6NNWLmuN/aqs/plPnzq
         34iCDo16j6BEewJz/hEbuZ97OdcddusLkWcrOtqDSeddl3KY4aF8ZsOh+KoNrwNlagQo
         lgofYV7gXr4IqgUChJKZ/YQc7tlvTMOIVhFX6o0psOK9SW+1lKg8hBsX2Vxavf8yUYxc
         fN0m+EjONRqPJtss85P6/fiBsZYVN5xSax3YyqaGMP2EDfArUJ8X/dhV4T/B4SnsFnf9
         Jem6bvuQyUTeag+MRZTagzqnT0sZSMQ4TS8WJ7gzk06sKWYoCrHkLBRyS95TDQBe3UDs
         kx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149645; x=1792754445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP6Hen4ha32UaSHEgIpuQsbgsTYGlvUW0UsDEzDl+hQ=;
        b=qD024FHG7bSy4geKh+qTFFh4NZIxR/Wa2d6M4AELk12RpgFufrZr2GWJp3xqKKgWX3
         vhGFdxMBvMCAGKn19aIxUmFlYh1Gi3tZcdvXL9e53+k5MViN86WQ56HjJHinEmDRyV8y
         DPzdcMSoRYq/26kItj2qBVDAPlC6/1rmPoLjg0Cz/U13zoAOi4U/z0cD5LE6Hik1VRcC
         OWvMkYeUO03rQ5QNo03E4RLxc5/Ha3k1lSC9abrdks61jgEEXTMHuUgWteHew8pv+Zeh
         0R0dxCuv6lYgAHurbgLLDaDFftgIT8njwqI4InuJCF4AwPW5e/d87u0TY4PHa9SLoK+7
         oJQg==
X-Forwarded-Encrypted: i=1; AKwUvBynLh8qXgjwS8sfAlpWvSCqukXf6Gq5Lpk+SklK3yAKzlk2lS/HDydE1UMJ+PKiXR5AFKM2p7FQ8O2I@vger.kernel.org
X-Gm-Message-State: AFq9FYKouxqzAvKEst5/QAFP9+BdCr478xvLQ7gDZ/MNFX4WsQkJIql/
	lVzcsTh386tdBwkr087DROeKkDckpfa4BH0ewt5KEKroqMv6oitQtYv/ZVXI242SvUU=
X-Gm-Gg: AYBFou2kZi9Cs3wbPsz99Q+pZBD+7nnCi13DszC43xD9MzKzJgdSe2s4vhNyHX3xp+/
	MKn7TT4w1Kwe8p6psOEzznDCyY10tMPidlUw9Qh89jvXkFaIL0S0ZG0XNyp8SIVid18WXvOL17d
	rod0HV3/ep43TGfW/1BmoSgD/6t41ou2NjlRuSWm49iIvgG6o48FWsDeMbJIhjKrkn70k1dXH9I
	b+7WWc+nljjL0vX8y/FUf9gNOQJPBSZZEKjIb7hKFxNcO6u8EcaPROrUGpaUEFf23UeGLdOgqtq
	OsVqlKMrLza9vlUPdt8gA7DtFstirrFy8sqWG3D8YgcBqg7/diUZrtEtBLSW9Sy34RuUMDY6zSY
	e9lcrN1F4Do3ihxlyy4uhDqWU+e8vgWCCB2uelzLITNhixzVBAn6rbzzo1kMhuW1nvsY6tGckQX
	pRZGX8GVWyIWbP10yud5OAvI1XBBZ17T16sJiyVo6ijgVk9PfXrKsJgxpp2P7K+eZdYyoacw754
	mJWGmR/Y1yeHzTdGxhe7t6ZG9N8LxlogAAZvIF+G/qh1BjrJv/gc0i21IVDqwGlQtpHgLLh2wDy
	pm4JI8bv+tQ1KGdmpfPkDiBXZSgn
X-Received: by 2002:a17:906:478d:b0:c41:4d5:e97c with SMTP id a640c23a62f3a-c4104d5f1abmr63177666b.37.1792149643725;
        Fri, 16 Oct 2026 04:20:43 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-194.xnet.hr. [88.207.15.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm63947666b.11.2026.10.16.04.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:20:43 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/5] dt-bindings: net: maxlinear: add MxL86211C VDDP supply
Date: Fri, 16 Oct 2026 13:19:32 +0200
Message-ID: <20261016112033.949026-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the VDDP supply used by the MxL86211C PHY. Its voltage
determines whether the MDIO, MDC, and MDINT pads use 1.8 V or 3.3 V.

Select this binding for the MxL86211C PHY ID so the supply requirement
is validated.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Model VDDP as a supply instead of a regulator provider.
- Select the schema for the MxL86211C PHY ID.

 .../bindings/net/maxlinear,gpy2xx.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 8a3713abd1ca9..a0dfb6192d81b 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -10,10 +10,38 @@ maintainers:
   - Andrew Lunn <andrew@lunn.ch>
   - Michael Walle <michael@walle.cc>
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: ethernet-phy-idc133.5400
+  required:
+    - compatible
+
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
+      required:
+        - vddp-supply
+
+    else:
+      properties:
+        vddp-supply: false
 
 properties:
+  vddp-supply:
+    description: |
+      Regulator supplying the VDDP pin. Its voltage configures the MDIO,
+      MDC, and MDINT pad voltage and must be either 1.8 V or 3.3 V.
+
   maxlinear,use-broken-interrupts:
     description: |
       Interrupts are broken on some GPY2xx PHYs in that they keep the
@@ -45,4 +73,25 @@ examples:
         };
     };
 
+  - |
+    vddp: regulator-vddp {
+        compatible = "regulator-fixed";
+        regulator-name = "vddp";
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+    };
+
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-idc133.5400",
+                         "ethernet-phy-ieee802.3-c45";
+            reg = <0>;
+            vddp-supply = <&vddp>;
+
+        };
+    };
+
 ...
-- 
2.56.0

