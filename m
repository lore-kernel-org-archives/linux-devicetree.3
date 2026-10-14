Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E41515960
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983962; cv=none; b=uidsBCTRny4v1VYXREV3/9BspbCbgIt4tmUr8lt5f+E8MQ3DR3K8+jr6Vtm2pHM3/JeYrl3PqQdiayjgLTdHaucaepNx+YeHWSEZoh0BGYEF9+Zv4Zicf4/LpaowHaqzIm8KgfOxBoxEjTWEY7zA+abgihc4TI7nw7hBq5vBcas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983962; c=relaxed/simple;
	bh=phckpz9l4hI/ogTzT+8tcTcfXBXrn669OobvAgO/ejE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q99Ni9g8Ae52Vma+XmH4K7OORUV2Qe8kGXueiHFuMWWXTp5FrCdznEBB0tPG/8AkTLSITPHdePQBpRXXCbHsJLOD1GDdPAat5x71tfD49t4sugBbkxyX4Jb/8RT4cAKPQdNahCzPxOing5uTJjo8z7TqeYqUQGlDFA78alVFrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3Ehh5tI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3Ehh5tI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso29903155e9.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983955; x=1792588755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNtbaLLa7Rrlp7J60k6J6AUx78ugas5Q7Nay9oi9mko=;
        b=s3Ehh5tIZyBm3R9IEqOyhqh3uKzeSXcjYVFPwO7iMYxDEKdwD/QoGn7eCzIN3Q0xKw
         L56ySXSbmucLOzkZ4qkJiiREMbeo5fZYI3elHu+G4ecXeodL9ZNAYsyZ65l1pqL/Xj1+
         r6kS2wAhizgKVQuWphHDoHUs5MXkixS4t4lPSGthfpxWTwdDSDZ4tL7boAb+ai2oAdgH
         THNUCWEqIb19wqs9OUxNHVKUhM+lwSCUrTi/iogur2DhsGvdc/2WqiPV2rHW+89wSgYB
         C5G4RRE90OO1+5MbSVRl6RLryjrqovVc3I87cAk7PTcjX4xE7cD3j7Gdd4cgbpPqgPv1
         dphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983955; x=1792588755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNtbaLLa7Rrlp7J60k6J6AUx78ugas5Q7Nay9oi9mko=;
        b=Kr2GPTzVv1TCU4GvONUKnI4dQJahzIgTTS830vKuiHNkneEthstG6ieI6Q/9OTV4N1
         zgg06XNY2TL33G3EjiOUakFiHAVJRsnn0c8shUzWxtRJ1lDNAVgpCVo46MvzDxte0vnl
         HvaN2l7xIdOYV46fQahw/6Sv91U9JfrtSvVDQzITk4u8i+4WEt/uY6N7PhdcfH2QXFyo
         ee+pmYbMEjnKewZQK/lHZXBJHjngqHebql1N05BvXyAYYEVH5Qj6ii36YLCkpVx8xvlQ
         VgIP/qaxlpurhvarb9tN4dXoS/BTO6q5DojWRr9YPPMFsxynIhhzHeww58jzh2zylDLq
         YZgQ==
X-Forwarded-Encrypted: i=1; AKwUvBydo+cZvIrGIHC/4u685QIu/GSxmv8kdyI0nY7Aj6hWq2txdpXdkMefVs8M+qFDW4onuJ2e818sI49F@vger.kernel.org
X-Gm-Message-State: AFq9FYJSRHisXP6l04bH22Mh3S/Z1Rz4V6kYN3vgObEFmtEvjzkJ56Hq
	Cut2lNDZwWn8CbG2lZ9SktNAhyjhBcW2EeqLCvW44Gugw7wr/jwWJog2
X-Gm-Gg: AYBFou3kMBK2neVbQaxUiaTyyigKyyKYKAIDpz3nNbxdYJw5TSv7rhkJuvIoirMRo1v
	dwekG+oDUaMMDgAJ6neSfdWX0owXCrqyGof4jeFL0gTyaA3xjDuEyjyd6vowo6Xr+VQ1Sy9P7Ue
	scxYcf+9/cAkg6nWAAFSZdvuvzAFtWo7+MV/s+CgFdgY9gspvFrYsx1GadHgSKYAvrK+qpwPBkL
	O10MuHPPHarMrwCigfsqvZ6wsJ08RNKnD04cNJ0+o4O6AipZ7LmULtPdT4HpXN1YuFEuuGEwkJL
	yeodzR9QeNSUUmF0b5i/nmuz0bVqfb9HtBzG2EIBD0yFV7YCFxW6FU7XOhsQe3blAIOmkFQGIYC
	oIp/M6xBh2LSKvsNnePrK/P/Q7TuVQAuxqtJboQ3xb6GnE3vQzrpx8abWwCTrh4huzWpP7NdZ5x
	7WCwozz2DgaJz+iaczccKiEti1gs+jUVNovHLZgIc7iJHIfBIzXUwJ4BBal7Iapf2FjjtTvdhAa
	HDAdpnAZcid887GsBy/dCwKZ2FhPnlmBlRVrpZRZO22dpSYKgntH9aG4qup2YzHp19BFFBUR/08
	14S/JzgD08BsXejR8Q==
X-Received: by 2002:a05:600c:e555:10b0:4a1:96a5:366e with SMTP id 5b1f17b1804b1-4a196a53866mr164144585e9.7.1791983955422;
        Wed, 14 Oct 2026 06:19:15 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 04/13] dt-bindings: net: dsa: renesas,rzn1-a5psw: Disallow ports beyond port@4
Date: Wed, 14 Oct 2026 14:18:52 +0100
Message-ID: <20261014131906.990077-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching the
hardware configuration of four external ports and one CPU/management port.

Although the schema pattern limits port nodes to port@0 through port@4,
additionalProperties: true allows other port nodes to pass validation.
Set additionalProperties to false and explicitly allow #address-cells
and #size-cells so that ports beyond port@4 are rejected.

Existing in-tree device trees describe only port@0 through port@4 and
are unaffected by this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- New patch
---
 .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index fab6aa6237e9..c5e652c057a9 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -61,7 +61,14 @@ properties:
 
   ethernet-ports:
     type: object
-    additionalProperties: true
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
     patternProperties:
       "^(ethernet-)?port@[0-4]$":
         type: object
-- 
2.55.0

