Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B9848A8B6
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933550; cv=none; b=nvSOYBG2UYDiiEOvX5Yxpdhci815qHautwACOvEzyo8kZprnaZBE8dlhe5csta9daKHzgRODJJaMtPFGhmNiw3iWBDdlVcwov33hYYsOWD9j3O75moBRa2/JHKuJH3Ln1eOos3KV1JCv/VVU2kDdIifZwAcG9PZHOaeW6ixdKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933550; c=relaxed/simple;
	bh=Gj+LzOejuhn4QUWRd2BeQZ06xMLgJHxeiRX4lCDRZzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJv7F8BGXLNI7AZumACvW2uNz61yBPnpOAEi4aXqFZKogEeWNPRu/JfrXuRaVhnZzx6w0iymOrr5HeqK4w91B2GywFhblyMSOKwqa5su2pGKJUDHms3FRcJbX630ZbkhI/Wfc8YHvcXgsLcuH5rPKqpOmwhY/NROz/P0KDUzvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6CCX2Qa; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6CCX2Qa"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-4788fe5736eso1425414fac.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933548; x=1790538348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=l6CCX2QaYTWF0xmANFskLvprELdoCxBGDgPcQY3MP0X/1K3BAiXENuPTSpZxLGDKKp
         H5dABEwxYOaQJkrUcfbcpMwPFyHMVI0i6FJiPE50g/QE1uYDec1aEGhaRZ1op/8AuY3H
         9J2zH30CSgxzehNkNcdDL/BD0lOqfQcXrBgi6MgGDqh63iUmZSuobG80jjJ8NGc+U7KC
         KQbgjJ1jNVwSXFw6V1Fl7CXvJFnZeLx+GsS8S3fVqS17e0X0JEQA8Hg71K1bSGK6UVMm
         ZzaLGUiWbWFg93hkK77LgAtfyLOmoAfBLrKJEwlaj02N5/iVuF9Pf71401KRwfqiI6sO
         Scwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933548; x=1790538348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=xV/ss0cATDl2Xu5X66gyFE8gCcExWUmQGfFrs/2Y/5hsH7B+PZUtK8Ecb+m0c/NMIt
         YpfFD8cmF2RxdHcU76n6WNJv2TUal92YvTcu2HW41mS3ZiWdbxkSjQYX7MbTk+bFTC+P
         QNKXe0FNz+F/2lgTQclSd0LlJhopfmhupagduKjBUA2gq/fwhxlQBl8ALpH07RyfKK1s
         EYUaPKcJSCeXNCT+Sl1f44e7s2Sw2a2+dPerS3mBTgGYhdaCB11ATDMYrV1aTybDxVQ2
         Lbux/rxgxvJxeivJvAmNS88eymWH/l87C3n0o0mltfDjY4Ku+E7bZO3IJeeHhbCzoBms
         N79Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBQpbqGYvVlYf1gpYXzITX0qFVhDTMYqt/uW3fzw6WUdhuBn9+egBBJSXnzFGw7SyPJNV+hAAELlec@vger.kernel.org
X-Gm-Message-State: AFuF++nCZ2vhrFkz83lkkIclSAPGAfEFHHJvKyyywBkxy3xXGO158zId
	2kPPmKQdjQu8MK2Dt/rkYO76Xfs3H8cCEl5Q8e8xAl4oVbnLY0kp1YEu
X-Gm-Gg: AYBFou0z+2HpntFKGsdiwtA+SMKH7JyJpA+Qw+F3HlUw2+bzvyTTIcowmYysJ7Awe1y
	Xs+u0AQap0tTqqn86P37q1Pf/4vj/Z+fnaUnRz8Yyw5ia5puvMcXjmI54CJwqkz/pXC0s2J4aoW
	COzw39E/g+1ndjcx5C0obFisoCqwtZdCmHNlhOWUw05kukFqQ2xcu5z9g1pFl97WBhdXUhPxOV4
	u/9oHTL/6BbptY/6iOwA3bQQATs222msm9Pp+pZWr42hqQs57Yo45NwZ3D/qesdz4l6y3UhIVWI
	fyM+8S6mpMD0UUJP25Gst9erTXdZY319qc4ZxbJSzmCHC02B7xt6CVGsKr/eBqjQS03w8CHg2Yn
	jG/picrRPWIEJUpY69/yY05Xz66AGc4917I/I+TTzJsD1CfUqeAmHXkyyWzWzs5pEeu1tu+aFh/
	COlx+8/ZSpYqYLlv2cDm2hIeI36Fxm3YOnPPY8XMDNLOd68YcFrZShijbEgUYRc7vebdFZrNwOk
	rg8+QApiHgZ7a+tJsU8yt7LH6OB3qunS0MqAff3i6CKeNklZC83EU/BTcdpsz5+0+Okl2kYPcFc
	tlNEtdXg+QmZ5m+hRRiy5FzC5DFRPWIHaXn1iOOjcXPkoM2/5YFdwIO/zQUwQd2WpA+7L12PDp9
	GkurZMYahFwVzKrX2RzeM
X-Received: by 2002:a05:6870:140b:b0:448:cf96:25c7 with SMTP id 586e51a60fabf-486e5a6680cmr8538751fac.17.1789933548079;
        Sun, 20 Sep 2026 12:45:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:31 -0600
Subject: [PATCH net-next v4 5/6] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-5-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ff9e3284a06..3fa6e17c3d12 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -623,6 +624,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

