Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC5C3DC4CB
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344238; cv=none; b=SV+3JjIZmnWT/ww03v6bXFbVP5rrDKbI2a+B2yy5MgaFH2bBQhKmT4IiSmlB/Cwm7QKuBPxZTtFAzXztJeW3ydb6wWs6DQyl6TaL5OBsyEGXitAOFIQ5K21oZfpD0Byf2BSA41MJep69ticJ75T2QqXg/CrmQs/jXLqkuRbiyR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344238; c=relaxed/simple;
	bh=eORHv6uMOxEZQvZKT0NGFZMJsp3s4BCbYLo0O/D16Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l0p8+xtzHHhvEJ3fiYnm1rBtEain7aybV2Qpfax3O+8uH8t0Q4mnco3exycpye6zn21z0vxqqBHWQ13GZDVdhuk0R8KNeDsBboEQEhCXFQumo6TvfQHEVFAlgqxFDwmk1lx3aT0Laawxr3N/Fq5XzxRgQE9lJloGIg/9sLRw7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTlaY5lB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTlaY5lB"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so35437735e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774344226; x=1774949026; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5BTS4Xu7BcfhUbuvKmb6N+eqgb+/BungbccHaCogJs=;
        b=TTlaY5lBI780CEmaF4G6s2ABEbZEWSzZ1EONPBx3jInjBgAa4HB+O5DJRlJ5WTAv3g
         Qbewwz2/QM8/eLhZJMCr74z5dvRLdP/VBFKby9XZr1X2UsBOG+hkLeVvxjqAZ4wLLoC5
         gPhHmj6MQdNo2IEUabVpFaqKum3i+bPb+/KXRq+xikZAmO7MWXExUU/PkDnJZdwNc23h
         b/1f4a2QhDt27syw9Wc5FdCL2/gKPbPgaJWgoIgD8YvNqPIE0f1/lkgSt1XOA3TPEQ8Q
         K4YVcZQelrVd9Zrzg/7yyICI4YjzFW8aXg98pKmlGX0X2TXcQw+L5les5r7NZk1EIccm
         t/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344226; x=1774949026;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5BTS4Xu7BcfhUbuvKmb6N+eqgb+/BungbccHaCogJs=;
        b=NeVlk1RSAvy+T9yleccuaQpL0QFULxyDocBKDtdclx5A7fvggUm4S0LmS7tbh83/Ts
         YlnhMtn1xobUWy/d2UBvFFRkMUX4Lgbp0j4DWA+xzwd+BIBsDS3NV6MISkYycSGVxg1W
         iWjZy/IkP7G4EO+yy41HkK+OfayN5WzK2pNEUq9KBEvE3hzgdxOjf0LGKKAsUh6xl1/7
         IcWLsvRI1jZucniOxfXPBzsxhsyb3X2rA6UK+qZS7F7We10d/mVqmwjXTqy6C+1EiVa0
         qrBSc8bm12KlELX47ZtBx9Lmk2KxBn995ZdrxfJ+DU1+3L+VJIx4d/1eI0M8ygHIm/6A
         F5xw==
X-Forwarded-Encrypted: i=1; AJvYcCVKy4FLr5SCQwBgvsuzRMlVrq3DOuDCBKT/AOua+J0RhBmi3qGDjdLRJa9sGK1agoZBUauXZ4V/UqRJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/lct5vuiM9BDWgCpf5RmUP5WsC2UtE84mO78ZiMbVWCbItRn
	09y5mf6N6LUOLFl0w1ivlW19/NxdLhToolC48w4bcnNgCpqIgybjEKtGBEbc3X/+ILM=
X-Gm-Gg: ATEYQzxMlkIAjukT+PUJ/Ympxo+OXKZ+S1eyK3y+brfbUv/okCigzPtwznMa8csK0TY
	dB/Axlm0eXnka8iYwYBQ2eLlMrio4nC6GTrFfjZ/NzGqDbYNrzo6h5PtEiw0v5Xb/VH06yrnY46
	2s0/Eik5yxBmKOIbsxsyRwQWScf/gWyNbLJxQAkbwJjTRmUG/gTDfO2qQlVuZOenhP3vgLxOXih
	SUkf9b1UM+5yQF+n8yY0yPY6gJ8hB6dgibx/TiihcK94w+YCZu0HUFwh/PeRSBjg1c2c+8tlN33
	jgtniN2YARftcrTuX9y1aQjWF/nTPKk42fw1Y6fInfPFEFl2dF4YieVmryvZCP65WNF6cf1hS1s
	7iwWuLM7q46QIqI4MfBYpZhwD/9xBaXihUQ4Z7eSghtQ5Iixrqj/TDTpfeSAuMgGJfJEbJ+EgJ3
	qHSRXxiDVlsdJ4bdOXk1bqI3AIkhAJK3kfCQ82+w9y8lsT
X-Received: by 2002:a05:600c:a596:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-486ffa30b0amr132702615e9.23.1774344225686;
        Tue, 24 Mar 2026 02:23:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c44bfsm41808585e9.9.2026.03.24.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:23:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Mar 2026 10:23:22 +0100
Subject: [PATCH v2] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v2-1-b86a1543b76b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAlYwmkC/53NQQ6DIBCF4asY1p0GEIntqvdoXKAMOmkLBKypM
 d691CN0+b/F+zaWMRFmdq02lnChTMGXkKeKDZPxIwLZ0kxyqXktLjCHSAPkV6sbDmY1HgPEMDx
 whizhHS305C35MUNdi15qq1zvNCuHMaGjz4Hdu9IT5Tmk9bAX8Vv/YhYBAlqFCl2jFZfy9iRvU
 jiHNLJu3/cvQADm8uUAAAA=
X-Change-ID: 20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-331b26d4fbf6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Michal Pecio <michal.pecio@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=eORHv6uMOxEZQvZKT0NGFZMJsp3s4BCbYLo0O/D16Zw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpwlgUNXlsxFgShF54TYDVG1RvCpnFEmpxXa5+pnAN
 EhfuNCOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCacJYFAAKCRB33NvayMhJ0ZAYEA
 CTtXaX+QkB8DgDMLvFTrRnE7nh8tqLti7a4LyO4nYHeud+aKpAFrzh09iL9TsRro7mPdHVa20bNJ9u
 3Sq+qZQd3ThEBEDzeO3oXDrTE0oTpH2HshAymgxaMQpG1MfnZdFHYFMpnU27xKmo/7OYVNf4DNoM1A
 zCoDM6YBHKNuxjO01QkwtivZgSaj8MGqxDAHF6juKnTscUri0qJpo8gESOppMHz+3CThUSeUphkY0K
 XiAEEe6tGlW5nqkQljBJyUQLvKpViMFEp+rcQPc/BCMYx7+rPE+XeNBqak7xO4G+dz1HlIQlaPp9Vz
 heEswCfTFi+shHXTfxwfXfge85LQwwS3G7fsJ0CCTeLjuJ1T73JH0422eshrdxwj3Qk7FTw7kr+xFR
 6OXhznoZxjDIvo9EwOPZKPJt7XWtdBvJeq/9YCWyg0DuR/9veDp1zBiw1AG9VsJfnZzvjD5rLu1vIH
 EV2o0UhJghb9n9EixQakI2MFilElfB6AAeNzRW6rJo354neqKYueFNtxNdbMkle/TTFze12RolMKJS
 nHRBaY8DsbBqbpa0JFEW+u+i0FP42fTqv6IfGyDWFZYIMr3kJCERDevPoX1Nxe+K/h31ykJnhuzaHC
 DylioeoldQHPsoyKVyXEoepO/MvydYe0eaxUkuFgEgmtV8UYiyV0+JB5QwBQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
which connects over PCIe and requires specific power supplies to
start up.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
- [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
---
Changes in v2:
- Added the PCI ID for uPD720202, thanks to Michal Pecio
- Link to v1: https://patch.msgid.link/20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org
---
 .../bindings/usb/renesas,upd720201-pci.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
new file mode 100644
index 000000000000..4e890d0d2070
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
+  The UPD720202 supports up to two downstream ports, while UPD720201
+  supports up to four downstream USB 3.0 rev1.0 ports.
+
+properties:
+  compatible:
+    enum:
+      - pci1912,0014 # UPD720201
+      - pci1912,0015 # UPD720202
+
+  reg:
+    maxItems: 1
+
+  avdd33-supply:
+    description: +3.3 V power supply for analog circuit
+
+  vdd10-supply:
+    description: +1.05 V power supply
+
+  vdd33-supply:
+    description: +3.3 V power supply
+
+required:
+  - compatible
+  - reg
+  - avdd33-supply
+  - vdd10-supply
+  - vdd33-supply
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+additionalProperties: true
+
+examples:
+  - |
+    pcie@0 {
+        reg = <0x0 0x1000>;
+        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+
+        usb-controller@0 {
+            compatible = "pci1912,0014";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            avdd33-supply = <&avdd33_reg>;
+            vdd10-supply = <&vdd10_reg>;
+            vdd33-supply = <&vdd33_reg>;
+        };
+    };

---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-331b26d4fbf6

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

