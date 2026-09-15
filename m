Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7F4B1272
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475976; cv=none; b=t5eUxeZWoKxIFnAsONl/F/CxwW6BnulYq+9IX+GEufMLAQGoJm19sV8jpIQyfYTGFTQUqbqkRz7bUPzhZ1xXy9yvT8KUhYdYZ9HDffB4BDOxgIPOl+IauM2fk8TokoZjCGurSVDw+aXV8P/3P/yHkRJpwFXJeN47rOVITRGIYxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475976; c=relaxed/simple;
	bh=/XopV8KTgRYgJTjrUXTlaOTR0QRZ8vtOfg0QiwkYOPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kg5JwPpCYLmhLbP9fdVGDFFWV+E8fiuEu/+djM4BvsZW+yOfc64qAzKoWIiAb+m/KaZhowvTLaayZgJm6K/SjCLVyBri6jvBV8mSsxStnZtyc/wSsZNq03sLiPGhP591VVNPpXVw7LQHDLAloCyaTDExl58GhJWkX75exCwAB90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOgkKz3L; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOgkKz3L"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-39ded0d7f52so1312333a91.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475973; x=1790080773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=;
        b=rOgkKz3LtvesydlkjTKzxKgitfcHUvPmves4RRJDkLF5WgLl9MjjyMTav5Vmr2nieU
         hGhh4v7tyNgjalbnQZ6UfKV4SMSeJmxTgLStWWNsWocUFyjisyLO/E0mfIZvOCBFMtYt
         F//22igbXL4jG6z6/lOOUzQBIwG4exCCqqS4bkFI3OqayveEbdypppCbH+FOakTmXKCE
         9ogLiTFeN3nvRZ24AWBv9XeVkHvqiKBx494T//QWrU51frd/oFgD239q+jc/iSjzJQc6
         RzLql/AP2xA4hjwasFOfcIpjkOV+bsE6sSk2fte9zfLourL2EfuGj9M3kgZYd3Q37Ek+
         kHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475973; x=1790080773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=;
        b=aFDUZKGKrX9f2JGZzRyIobYSQ3/N2/wV2OS/uE4kZLF6f9leV3KUzww8ds/yTJUcNi
         f9r9TL+ONi+FvXbVhIGBweyt4n6aMvuJUIFBkHoPoDizi0tT5H1FZnDv3tjC1mabPVRU
         wj9vgm4iQlfLYjgmEeSAgv0ETxJD8hn4vIVUZwtPH1qImpB72XqH3F/h4pCgra+AdiDH
         L8MAft+DqHs+msbxQBLAPzjt4Jm7gOPzNj+s9x41TYihm69RwdjQ/3+fsphc/FJ7AyxG
         dyh+d59pg+Ev6IuwNWUO83bo+uHWD93yIIMYYn1J/W9kWl9Fq4zTwfAEakTTJ/foy9t/
         ldiw==
X-Forwarded-Encrypted: i=1; AKwUvBzYHWG48C19Ow0pTjfXJkoDHaRetu985L7UCkR0cawRAXkDb71cbh4xCIp1AreWvjPu4StFsvbAqkqZ@vger.kernel.org
X-Gm-Message-State: AFuF++kqhK26WNxEfbGziNFXMeh4LoLCtxjsZU+y/N2OVExGEOBJrefS
	7MP0o98sugDHB45exbbiv1SYxR+PGCg5+1MtrAD9EVQpBGujIapGkd0x
X-Gm-Gg: AYBFou0wy9LQP4iIbNScw0zvWEXGarb8YP8juHNYsv5kHHIGrikUHF0IbF1nNvYSQ8Z
	w/2UMc9g0wltsA+4x/3zEEBrIpGEnD5Uor8PazBO5V0vYXbW+Xu4+lPlW+XSqGXq8OIdbWORuaX
	C7Y5w8j9mwxSuP4xn2h4d+cy/rrcJSxIGUrDjUj+NGP5aZIl4V+6QD8majWQtJNZLUse5twc6dY
	qnFgVK86o4EHsHB7+206Eo7CI2Jmk20C2WzfiLNKUnupAyeZACMlbeN3iWERbUTsKsnC41eYVXG
	F79pgqhO5FV02Vc50An0lINsfMS3hSGawavjJBt+u1dzbHit6+rMoyG34ErcJGSt3eBasCm7kbT
	reWTrH8we//0W0lHH7SckPKzOv0sW/t048Ea08b36MSZNZkNxooUt9bs5h7u7koL/m755AAYmsR
	UWU2uNbvf4MGhnQ97gsVLjI1rm81YmnX/Y/r3RSJWbh217DRiJpD9bHIn88OvdA+lFoV3eKlQ=
X-Received: by 2002:a17:90b:1e41:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39e10e2e451mr1383583a91.9.1789475973476;
        Tue, 15 Sep 2026 05:39:33 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:32 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v6 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Tue, 15 Sep 2026 20:37:57 +0800
Message-ID: <20260915123802.1561724-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip dwmac glue driver now supports SGMII on RK3568 and
requires a PCS, referenced through the "pcs-handle" property.  The
property is parsed by rk_pcs_init() and a missing phandle fails the
probe, so describe it in the binding and require it when phy-mode
is "sgmii".

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../devicetree/bindings/net/rockchip-dwmac.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..67b21ea77ec96 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,15 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3

