Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC83C10A9
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290867; cv=none; b=e1Bi5y/Ui2oELMY1u7wl1YqsjkrghdYyASbaCHWlB46Gt/cNelRySPhma/CEHkw+Il/GNzydesU3A/lCAMUgTnsNwnYuAB0dGfQHjvAR/on0O4OuNYmMSOE5/eWabM202KZ7bhVWLm5pcIUs9AejGyGpljd+sTGbF8ltSX3O+cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290867; c=relaxed/simple;
	bh=j6mlx9CPkum7bpd93df0KuA9wXWsuLKzELZc3PzmjK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y12kYRkmpoTA085L+zYxVe9oD4j7p0dIxpdrWgjVZj3zCsF+nNY9F7SRPeiNYhkp3SK6NNE9L585mwuS7BdK034Qa+vmCtstqza1gF9v3dhHErqlGRAI9NR3rU3f0lvdgoXj4PCy6kkJ91yPyiqCBSYXGxvOXDAe99/0OZIlbkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=dBtWmZ0k; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="dBtWmZ0k"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a168355946so6635545e9.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791290859; x=1791895659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URnF0WpPNT76iwwx4OUHbknNShXeDW8wlFWgezHCYwk=;
        b=dBtWmZ0k8CwfKgtLEQbpYwUdconweRIQDnJ+hj2SlCqykC/27iUMZ/xGWduTT7Hpx1
         lIvdnTPRsn04NtXKqJC0nVlU3CiJZisPz7RIxtuVoDKHdyyAMS2y6lf5X11zsXbJNzpb
         fFMDOc7TWbjrHSCE2Eyq5kvgawoi+6S6sdSnqqIbRTBEkaftmh/J17Ca1fQ1JEdrzGE5
         AD/palnI4ZUTfoVRcTlKwSRBGjIXy1kar1BjW/eTUIhtnlPKX2z+Mkee5o5/ucI0/M+z
         RIkNJlKxsRrfrlsUuhvx2nBbjPcz+9/38Uz+EZt8uHUbobDgMSNV3EbESX31+UIaYujh
         2B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290859; x=1791895659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=URnF0WpPNT76iwwx4OUHbknNShXeDW8wlFWgezHCYwk=;
        b=kMhkrSBk4Si6ph+M9fnce6oUON1IS+gukCJtGpaaGqJvcWS8vLxgpzfCQDSYMqpqnP
         Qb66Eqh3pi5kzMQLc/LDuL0Xa67sAvJOpHPe8brhNbBbxNktN4zYVkzFuZfGjck0uRyd
         JJgw/zBrVjO/eSEhcbGhv59z0R4s0dxoIwf2g52pqweCa6Z4kgR5JcbcuBidb9k11gEv
         8Zz1VnmwfhtCRWqmOd4vvpRQL9/ayukTIKT6p7W5foohWCP48Q2LYqg3MgQz8KB3C3tc
         SXzEBxlrHNvxEBgaUIW67TB2Fem2lJ07MZTvQkE6FL0AtPVcxaQp/5Pm4nbvuE2p2jR2
         DWIg==
X-Forwarded-Encrypted: i=1; AKwUvBxYckKqWUecH7GXfpmgh6KJBghMHLPEFnQu7RqMeGWeDyqWX/zeUvvdmyEkVK5f7G2eZNjDK1SREI1k@vger.kernel.org
X-Gm-Message-State: AFuF++lGR5lFZzQfsBII+uUeX4mx/8WR/nLLS1pXeYymxOiXejWpaVL2
	+KHkOh1oMB8tRwdkg4xKeflqHxrsWLpMp8o6ukEcHKgGJAgVXvGh2A46C48dKYSXhUA=
X-Gm-Gg: AYBFou1t9cck7aXyoAIq1sYR5XhqvoVYL8HEhURwlg47uKm6gQhZmMtdSIP9knRbLzW
	k5OEsUsmXCwCWJxSfDiFRw4FiGblqP/kQPaLFzx/jG4+n0VME6Nh75MQgpqvu1eF5agI+DE1eFJ
	3o6VcpzXEVyWYb/7LO14CetFp1/ffMX7Z5z6C9kxVd7igC4ZJEVzLR2R6fpPjhvtsc0TM3+KOXq
	s1xjPf0esFTSqBbbWkfZhrwlAsjggeSNq34OX54AdBAtBY7O+0TkZYJGf5xhxb6nU3/foqffX8n
	osWvtG1cn2p/UzyrJtuAaxZcC01zAJ/2djADgYGarnzWU5m4mLKt4xBBejF2vlXaoKpsT8pAzF6
	YI7HCFEqp5n46C9Ln6SDrqv6kZrY3XjYb4sG827Ccy3KaoBEouP+UWKnypJGt682nwzH/W/HkZC
	CL0/yjKMzF7+/OQymM6vk3GPN1B5x0n6q5+7x3bLCa+P8Y1lYN7Q==
X-Received: by 2002:a05:600c:4f81:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a17b53be50mr23583605e9.10.1791290859097;
        Tue, 06 Oct 2026 05:47:39 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm9722003f8f.41.2026.10.06.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:47:38 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v6 1/3] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Tue,  6 Oct 2026 15:47:29 +0300
Message-ID: <20261006124731.1528963-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
References: <20261006124731.1528963-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY can be one that the host has to load firmware into before it can
be driven at all. A controller that connects to such a PHY at setup,
before its driver has loaded, gets the generic driver or no PHY at all,
and one that connects only once gets no working PHY on that port for the
rest of the uptime, even though the PHY works seconds later.

The flag declares that. A consumer that sees it keeps the port and
connects the PHY once its driver binds. It describes the PHY, so it
sits on the PHY node and needs no prefix naming one.

firmware-name is not used for this: it names the file to load, and the
EN8811H driver keeps its two blob names in code, so it would only be
read as a presence flag.

The need is not derived from the compatible because the knowledge that
an ID needs host firmware lives in the PHY driver, and that driver is a
module not yet loaded when the MAC connects, so it has to come from the
device tree.

Found on a Keenetic KN-1012, where the EN8811H behind lan4 has its
driver on the root filesystem and the switch sets its ports up before
that is mounted, so lan4 stayed dead for the uptime.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v6: none.

 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index df50c4c33d76..ab95b9a5d95a 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -215,6 +215,12 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      This PHY runs firmware that the host must load before it can be
+      driven, and is not usable until then.
+
   resets:
     maxItems: 1
 
-- 
2.53.0

