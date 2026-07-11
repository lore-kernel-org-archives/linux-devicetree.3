Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7380D392C4B
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783770084; cv=none; b=uIs3kWFD18pcyA2uX37O5U9KRDdgRrt0QRud/rqeoCj6SQGUGIj07BlllaTfsY6Zt4jPCc7bNzy6YSuwblLLKr/TFp+vMaa93qdkEcmNtdBSSewna3W4JsP2du7GgBhYPC0W5x5UWViGjlN4zhoi1Haj78YWKnOcDxuSbdypPLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783770084; c=relaxed/simple;
	bh=pY9ue3fWD1k3HH/iHVCcH6RHdxD5QejgwuhGaIH8CcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o3llRgyKDK1dQBwesLOh6c94S1wVJI84ulPGdKYm1Phs18QcXTKOyRdjSyopFlaBZo5+sBP39oJxjLTHrCnHmtXj8skfZ4XyD2UVj1r3sCgBY3gEcq8m7J/SAZI+GHM7B0hUnjX2RH67sxKbobZerjdoAtHN8Cx9WHdXBjC8k6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWaFQoFk; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWaFQoFk"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso1550447a91.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783770083; x=1784374883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF2r+F7aUjvLppp5OlMxLDe4toTwbQve0N2dz3KscQA=;
        b=QWaFQoFk+ApR3MyKfY5i2oNkh9C2BquMdyCsAZo4l+R5qa9hHukohFwUjmoQGpxW3l
         mrLjA35ofFUFd6BNKhOegvnJf2lBl/h8yTsYnPxO01jHacxrF86lCuQWYf4XLnmQwmYT
         QS3FA1fmmZW1vzKcIbukYDLH12KWsyCMbfy+b2jEpBQ2Bp4EYasGutBozco+n1jhS+ty
         TXIAL/UoAbFcXjuT+Ad9IaRam5A4giuawPQLe115MvzvJtO0t30rcmvvtobPst9F+vg4
         k/nyicChrjV4FIcnrcNJl4oDPiUZ40lWnPapr6w3Frbkcg2D+IlhhlhO+J53YHeGoYDh
         2gVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770083; x=1784374883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF2r+F7aUjvLppp5OlMxLDe4toTwbQve0N2dz3KscQA=;
        b=FGHJzZmbC9+6S0E/vmNZypXB22eJx+R+57zFENwrxiKvy1avSeKI3GKv1xLNBd25H3
         4k4LuJW9NLkHDGQCPhVqetwZ4LNtJiNCgC/AUpG+1ewMqdvRdbf8DQGsAUZvE9wcuklb
         4zjm2FCI9QdSpcebQzcPWQbWRZyOgYgdUP3pvS9jm1hhudtgw4gBTiwVoNWBDboZL+xe
         Wz2GdOtSZ2vdOOh4Xsx/kiKrx+whVqmSofu26Mudqp8Preuasd2sGoRYpPdU/JEIsgIP
         OUWqxNZl2C++5SwyALggMfHO5oMcfw6u50rZBHmwAx6zxoUJ53zVl/m2UXCTPLR6hUAs
         //6g==
X-Forwarded-Encrypted: i=1; AHgh+RpJUvzVAg7x1Ger/Q283i88I9PXEc5T6KbG86XXWGaJoXlFN8NfN+SirZ/K4Nmc9Mbi2Bda5SKI95kU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6YFdELgU3GzYSuAbRmOpunNwKommlN5uROTS0ndnvb2Y0QG32
	tPK/80d9iM97V97qnPpSFv/ceHWFUH02AJd6yWCnip7JtStjbP43ISdX
X-Gm-Gg: AfdE7cn+vI1MCNIXJ5pA/jOPKtltC9j9beTpJUAIgFOv3YEs7kUDYJ4ktkFA6jLUK5/
	0QuVLRcoyWExZUJuz/ObDaGKTMLZKyLhqWJMfIh/9ElnwePp268tgFnN+LLq9MkKdw2+/vreSXn
	ceM9cJNysV4doYhsUQhgoHa1sayrDm3JxmX9vwJgViD4wkABPGmmQa3O+qtFNsX71pmZtin+gr6
	/Wkyehs7e5fK24gr0MgwFpfxxov9QYzfR3h2k5r1iWGtqiCxo8w2tCyxHMHdjvzeskDX49geMmO
	+SMS0i4zdmYtLZpLlELabX3ecd1am4uyKFWoHngLyckPDtQ2wT29j2dkXrIWSlCoomYFCmhCbbw
	DBsYw0Zpo3wc2IO8lHOkI0pi4JATrsbi5ruozb2r6DUa/udoqLQgao+6o4CS0PNNoycb4DTucmy
	NuI7fVFcORhlXC5KhqhEva
X-Received: by 2002:a17:90b:3f0f:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-38dc75e607fmr2500103a91.15.1783770082826;
        Sat, 11 Jul 2026 04:41:22 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm32390087eec.24.2026.07.11.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:41:22 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next v2 1/2] dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
Date: Sat, 11 Jul 2026 15:41:00 +0400
Message-Id: <2133035bb22eacc8a0e21f86c0c800a45023ee01.1783770059.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1783770059.git.naseefkm@gmail.com>
References: <cover.1783770059.git.naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EcoNet EN7528 MIPS SoC integrates an MT7530 Gigabit switch,
memory-mapped in the SoC register space like the built-in switches of
the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs. Its four user ports
are connected to integrated Gigabit PHYs and its CPU port is connected
internally to the SoC Ethernet MAC.

Those three switches are MT7531-based, whereas the EN7528 has a genuine
MT7530 switch core (its chip revision register reads 0x7530). The two
generations differ in their register programming - for example the CPU
port is selected through the MT7530-style MFC register rather than the
MT7531 CFC register - so the EN7528 is not compatible with the existing
switch compatibles and cannot fall back to one of them.

Add the econet,en7528-switch compatible, with the same constraints as
the other built-in switches.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 815a90808901..90b3582b7619 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -100,6 +100,10 @@ properties:
           Built-in switch of the Airoha AN7583 SoC
         const: airoha,an7583-switch
 
+      - description:
+          Built-in switch of the EcoNet EN7528 SoC
+        const: econet,en7528-switch
+
   reg:
     maxItems: 1
 
@@ -318,6 +322,7 @@ allOf:
             - mediatek,mt7988-switch
             - airoha,en7581-switch
             - airoha,an7583-switch
+            - econet,en7528-switch
     then:
       $ref: "#/$defs/builtin-dsa-port"
       properties:
-- 
2.34.1

