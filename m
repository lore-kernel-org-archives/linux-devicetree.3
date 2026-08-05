Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE603C4555
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 02:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896917; cv=none; b=IicDMT3taNh5wjuA1OfiWJ93vzHzPgdvjROyDg63dgpOb+kw2VvTIQ0Ni5zOdxRMf1+Vp19jN8RWz8TC3OmoVcH8YNIqdm2w+sZLLb+7FZw8IEeGVQzJf3/N+SA/+O1QZ1ZdX0TvtV7fvNkfLF7sBgyVjPLEOZXsmvs61ssGutA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896917; c=relaxed/simple;
	bh=q+8gVOKLd88te1BW659igZ2T20EfQQD8SX4NxV6IpGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yalu6Rzdq+AcaejqvkzluwCsoa/4swNl5rw8UEVVznvkY0djVe2OB5DimropVI/7/x/AEiJ4UG5MPDGwu5v3oEw+rR+1lvp50FVluqkqHR8vOHI1TPIGGGFsysuRFUoNEpFCyXTlpUjeMRwyRSt6T+Amv6w14JvxJVtULR38FDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sicZo6g/; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sicZo6g/"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so327697a34.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 19:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896913; x=1786501713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGkeXkcQmVAMhKi4BRouTjNasW9FdK69cwCP5dyljV8=;
        b=sicZo6g/Xf8d0f7Qvq+03BET0vqr/ZJ+Hb61loW89qAHKJp+hTH0MX/PCAyHT8H877
         2I5inoAr6fE3LL9mBqATKLHMBd2hkTvIR+ln9PlMdNoie2TKnO4ybE2PdcHWAP73DO5S
         uig1Xejd2lBOfFXFx51v/jyEAAkuTsAontgJLBY3D0UpkkYgltOeNOFBLaoe/YIioOJq
         OJ93A2E6CrTIqQ7HVsQDdL9ZW/Yn4sDyYRNqVrs3sgNJaHdwv/ybzyU949GLzZroRHIW
         mKpULSnINHm3mTaJ2sS61SB6DHdv3H+P1y1/i7rrkvRhHJdPDJZzA+A1f+JuwXv4OU5J
         PhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896913; x=1786501713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGkeXkcQmVAMhKi4BRouTjNasW9FdK69cwCP5dyljV8=;
        b=HbWcn5oRn9kRa7VtY6ghip3Vx4qr9ZpQs6CpiC5eLb4XkQsAWeFBsHT4KiW8ZU+enw
         jNgm4AfnQ+q5yviSEE8k+AMhIvN3wd1GPWgcnzrU72rpmmeiEPNF7GmziYHuRKIngjCb
         qzUN7EfikbFhvRU1tYL7nnf21CxGwIsEHfT2qCN4hYbWoePWlFrogGdyy+ToKJmbAjzN
         ZprZVexzf5FHwbWoUurhKm5doTMwBFjjBODgwSDSdsdLpEpXDXd/Fr2J/7BT6odUt2c1
         jtfQ/k0Izf0R88qPI4UszcEu3eUma0K+S092JTFFn8RtK/YviXylFeDrTSPd3QFJybrP
         8u8w==
X-Forwarded-Encrypted: i=1; AHgh+Rq9qgGuHEw1+/q7INSyKHoQ4QROnsy1+dY/AbUtv88/zkRViWsHbcS1S36yHsvJpwmcGCzWB2s3+OR1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/JoYa25LqK7oNmLDSRK6VT2oP1trgoJ1Mjmd/1qvuT+p9cAzn
	XRySMsqB/s93S4lfJD1kz15n5bjIQV86yQqpb4qUavHVzeCu5H8P26od
X-Gm-Gg: AR+sD12oLDstOTL9XtPQscwNGTVcyKzBPOAfTr/o8JIiw/ujNxGNjYkyuponNrVBGqO
	OE8mP5CXuIEJD8KqaHcMlzLQLkt8dgGLdEKhP/HLoNsgVtRNQi4q2Zk5mVfny5Vk/bQejErjrgI
	39A4Pnt3On/sWaFHYasy6NLSPRsIJEAj0hRGNiKvsZpCaB5HALCrmjky0D+iIQAjgHj5foJTXsQ
	Szp+G0k9WuCnxWSMTIMH0HySMUhqKylOG/LWJWQvaA5eFbm8GRQUjay4KFyoTr4dZjWLZkZT0Cx
	E8+Jr7IMzLaNlOgtZnSe1wDUlvs73/p029yYj39UqGuPAszp2EriFEqIp/dS1Al6ct4wa5+zQXe
	Hl0HQJ6mkZ032a33K9ix/3DgxyhjxyVBC+qu3WoqyqfVv4GL1UEhq2mC/DQZfB+40H9A+TA3dJ0
	W0s1niDuaVGJFqc5PzvFrKxRrtTHmKAhgXeVOfRnW9okPmotmRwsRJprNvGdfdD11vU4dFgPLnj
	C0HTHUbdlA+sALftNeU5R8qua8mSVMsBJVW3tmjno/JWQS28fUNTUb073kqBanWsykbcQdlFdrA
	CYadBgIKr091hFbBQcYh5fUg0gtYe4+OuM7KMhRWWb2GMROc2KFQFM/sLaz5SFwb9Xdqj7D6Lyi
	gPuySHD27Geb1hTEK
X-Received: by 2002:a05:6830:7010:b0:7e9:d634:77b8 with SMTP id 46e09a7af769-7f1e5c13e8cmr2629082a34.2.1785896913436;
        Tue, 04 Aug 2026 19:28:33 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:03 -0600
Subject: [PATCH net-next v2 5/8] dt-bindings: net: x-powers: add AC300 EPHY
 control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC300 exposes its Fast Ethernet PHY control registers through a
separate non-PHY Clause 22 address. The manual defines that address as
the link PHY address plus 16, giving control addresses 16 through 23 and
link addresses 0 through 7.

Describe the control endpoint, its required VCC1 supply, its 24, 25 or
27 MHz input clock and its SoC SID calibration cell. The actual PHY
remains a separate ethernet-phy node and supplies the MAC-selected
interface mode at runtime.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
new file mode 100644
index 000000000000..8a616ff3e89f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC300 Ethernet PHY control interface
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC300 Fast Ethernet PHY has a separate control interface accessed as a
+  non-PHY Clause 22 device. Its address is 16 plus the address of the link PHY.
+
+properties:
+  compatible:
+    const: x-powers,ac300-ephy-ctl
+
+  reg:
+    minimum: 16
+    maximum: 23
+
+  clocks:
+    maxItems: 1
+    description:
+      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz and
+      determines the corresponding EPHY_CLK_SEL value.
+
+  vcc1-supply:
+    description:
+      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog front end,
+      and internal digital LDO
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      SoC SID cell containing the Ethernet PHY calibration value written to
+      the AC300 BGS_EFFUSE field after adding 3 modulo 16, as prescribed by
+      the vendor initialization sequence.
+
+  nvmem-cell-names:
+    const: calibration
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vcc1-supply
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-control@10 {
+            compatible = "x-powers,ac300-ephy-ctl";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            vcc1-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_calibration>;
+            nvmem-cell-names = "calibration";
+        };
+    };
+...

-- 
2.53.0

