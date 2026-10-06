Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C95254706D
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272930; cv=none; b=MyLExeBR1zgz2Sb067EQelzJbW9F66U7KqRwrrvltLYNHliwU6uIwIeIG1T6LdF9si9RAW7newBLPN1gTPO4UXAzFTMh0fqdGCSWiDbzUn4A7ReW4GahDxeJb3zGa2QJxXNRpaaZNN4Kw6pbz3WUzQWLKTYiEjK/1EGAWH+7g0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272930; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnLGH1NqZqzwXURnwAOBpAyMQQ2a7KJN47lAbj9hLigFS/LUs5gErJhI+RGQHJgwhO7bIvQlwbJG9RQKkIjhIZeeV4O69LksqExNIoaITGQ9nnCE6BiaKVe0FLQIuLFz2wcGg1grH49i7BohZGZN3fmxH9Vx6nTaJxcxPH8er04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2IH+AMs; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2IH+AMs"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2e13013f1ceso5399955ad.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272929; x=1791877729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=b2IH+AMsw19eZFaM6fD8gX2FEse8knHqogP2lSXHE9tuqBL2Va2I1YFh8BY4BTQvbX
         HjivTQpTANv71Ks/RlaulzJORLe2IMe6y/Vj3BwRSHsUr1TtIoCL8kL4sGEwi38B7NtQ
         85et5COVNSL8CY06jhvs3v+Qv8758bhteFODvaEB1rIhJuMRza4zruAw4TyrhTyqIXra
         lctQTQRwyJa3cqr7aU/1Lcf/yZrMpJjs6eX8oq/xznOoMjhl9dCOMzoFY20uQT4NDC1x
         ZZkMT2FWBk8PM4+Z39vG01D7clekDXcpDngsAQ1Y5H725V/SgOUsdZzrT7M7Jj0Beo81
         BKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272929; x=1791877729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=eXT38BVZ24W/Aw7+c/Th1dpK2QAut/4GC9sSXCeew3DPJpVgXkJ7K6VArDL7o3+JRw
         V35nAP1HUaY79zaVMn2itozDHei8Mbdj+b3dbUlQzWR9gUGLYm2yQLxc/ie+T8HiGlym
         9I7vvFayZJ78/r3HF9yrb/icj+OQdRLK7imXMSgtwWNQ+7N/vlcWfqO4ON8FHBofsCHG
         GHkWsLpNVdJplLp2tP43/4gbqACIYXeKWoZkHUbWAr4YUmxpAkViLdf+iIxHX07M6D90
         4kXe2b0scLWxMyT4gqqWCjfyKasLnYu1o3KGHwUnukzbLanYlv+mIjLYlXW08JbRMkvu
         zpGw==
X-Forwarded-Encrypted: i=1; AKwUvBxAUcJL+flhf7z8TamBwEjbP7ShxOHckUg1etuH/Njub0+W2Pzrji99vv5xojqNaVcVmN5XF8nkcOaX@vger.kernel.org
X-Gm-Message-State: AFuF++mcY4EzhPUATlLXJqzVkc9HI837OwzGdUzmr2XRgmYgaVIKxp7U
	Vvx6Alz+1uZu5hWj61qo2Fq+bxnzgcouWEVXcRbViEnxjoZbk8eXEyvq
X-Gm-Gg: AYBFou0PoTm/hSY6m34yCwN6Oe+vhbgccZsIC2HDAJt6gfvzxN/Q8nXforqdVsLvMj/
	cIoAkC7+G/ekJI3NBAPs+NX0K/SP/db3EXjH1u3CKb8nmica6FKlwnQGmJMVQWRwbIrir4F2NfL
	Nk3B3ePOBiOyLQGhf1lac+qApfLG5Ryb6U1MIGy0bLcOY7jRBW9BlkW8PRO4ihH8EHOHKL2MQld
	tSarjy5IUNRH0cIkTjVbk7BVDO1FaWGBWNF96cTl2b4gyAPJYiy6bJOUXs3UDxTCS9dcStQb+lo
	yJShi0YsBXvIjqcbG0hoPNm5bAyqEQcCVd7ZU73lL/uLxeyu8HyuGyd8kQ0jtsCeVmnux/O9Hk9
	5uJuusyyR+6zmlAMnKmF2l/7nlClPvKIHz/zg9XF3JQc4QfTcA3EjabL7x51/58w8NFBY0KC+5F
	uaaW4Xw6Itrb9cDcUHpEiAh0o4wgWssEQODLL9uJRoIObIdtbB51fNf7NQt4W0p1jZ7jR5
X-Received: by 2002:a05:6a21:6b01:b0:3e1:1689:1ebd with SMTP id adf61e73a8af0-3e12485fceamr550520637.49.1791272928795;
        Tue, 06 Oct 2026 00:48:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1998173a12.8.2026.10.06.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:48:48 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue,  6 Oct 2026 15:47:48 +0800
Message-ID: <20261006074749.2010233-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006074749.2010233-1-coiaprant@gmail.com>
References: <20261006074749.2010233-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3

