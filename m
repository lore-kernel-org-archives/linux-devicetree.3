Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A458B6A4
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883057; cv=none; b=jq5RHDoPKbLFqqOyMIQVEXOcudF9AYUdwqdmjZRyzj8tBwUGuSP7N/ctjRulspLj3ubArGR3U1Dp3nbYiOK9z82dM6gyO6Uf8wwUhTItGVmOZrKJ5ObxeFVXOxxrUg1jo/iaoRQjhGfS/vl+44SEsdTQW46toDBZHkWVDpdQjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883057; c=relaxed/simple;
	bh=3S8+SIZMe++uc49JSNvJUaBmn7A9ZJ1K3lr9hNoioA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4E0CZ37mD5IkqJUihFeMsD0adRRWqHZ7/WygmeOV8OzzY17tz/s7xuqehqNfb0bjwyGXgSSyKsN+u5/jTQDFT0lSQAewrQa/jnZqMJLP04KE7XukpEznyRIl/4mnKjCTzgDlDBJ05syxe4srSRgCKiNQ7fMEj4cAHbR+1BkCWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=eVK5xf7K; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="eVK5xf7K"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-485850cf499so3185199f8f.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788883052; x=1789487852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYSjeGcJ1MZAeWSYitC/YaPtibetrH4tpM+XIfJ1kBg=;
        b=eVK5xf7KjGe1194lZRCfwEUhxfJZmJGwmKZXQ0lMZvL65VY6beZ9+BN6ISyQmuAeHI
         relgsr7oS/xlAJrI8M5VFlK9L9X2/sFc6MWEBofvj5BoX6Y/MCBhHKM3caJ3I6sYg+4I
         miVeqrDn/VcoQR4LeWjpetE6/cWLuvQC6nNvkZZ6W9jkZ1MpTN692RF8Jju22lZBMCOP
         LaFRTTaO1uXMYm+dheRLe7AdkXa0owHDZbvgN+7mtwu3LK4mjmCupHSNiI1CsjaU4GsH
         8OfsD20r15gKfKQfyZzf+rDS4OysOSGvnZOmXg0ZfoaOTEFrylGr1MDzqZ81cJoetXvm
         bQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883052; x=1789487852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYSjeGcJ1MZAeWSYitC/YaPtibetrH4tpM+XIfJ1kBg=;
        b=JQPXVzgQsei/fCzvsEf4fjnqeXPR5GEziW9DUSNXiEgoLlkbaKmMYrzF2HcWp4ouak
         4tSKNyNdBsylMpka9q6NLQRGnHt3pya0x87uDRM/D0QshqkXSTUvDN4iCeAOYclPdmEl
         BCR0SNkviT1DsHesoBUyMhcaavGQt9pxN9eCbdNql6nbcXHMUJwfPGgqEVBmj9p0zxUe
         q70mBHPPitOIU2FppfZqEnj6sSl18//WQ/ZhubocbkMSyZ+jMdJqfyK3m/Fl+PhIllVH
         KcMy9KGfiykxL0kOSSEBOHy54BfCY443yBt6B6gULO+lBwU1igs0UAKfz0QXEFhr6+Lu
         vgzQ==
X-Forwarded-Encrypted: i=1; AKwUvByKJ8hWd7fDaZVktmN2RwpMyDvy1DFIr8i6OVpP5ulHIXExSdrCd+YGS9od9wwmWBoz5ta43Ja243mk@vger.kernel.org
X-Gm-Message-State: AFuF++mkEsFNxQcEbRDcW8HcquXU7KDhkz6YhwYK4dYezIrjOE9Wq7J9
	S8n36hmDPD1noBiBqyRrOFdvlipL8VqUE/wRdU8OtkIeD7n3R40EmSoLF8dyN8lqFKc=
X-Gm-Gg: AYBFou25f8EO9as8SLjZe89K3z3SHMdJ+6+nVdKBQLAStkPtI3d2nIJ2Z3z7J2Khyu2
	A5zXs1bQ8POp2XITbs6CS3DGFzC7e8uKC2RalZZqKcwtBWyay9mMexzIyd6tyXs3oAvjmZ7RR+l
	ygJCk0lVAsubxW9qBF/+omBZKnxu+A0pcgcpOlbtcBzo7J0u0Yyd4YgbcbcXyLnX+m7s9ymAO+d
	cyNDEtQKVP9oRiQoQleAawipGVWjawTfMqG39+VtvINH05WR07ux+b2UEEmZtTv63Q1zt6VnNtk
	VzJZclqzX2FHSVCguRzA+asKpIDuIou90nDb4TBQGkz/d+scDCjKbK+5qAlYKEXyCASWdlh3IyF
	houeY0pRDbnoFy81lseKzbWtAr9twSu5o3Yx+woDG+R+M54AL2LHaKF2ZOiVQ0tAK38pfIr94+5
	yqPHfeP8sp6NJd0HfPBbpigG+VQC7CZVstMhQNA9k=
X-Received: by 2002:a05:600c:4e16:b0:49c:fc6c:bdfc with SMTP id 5b1f17b1804b1-49cfc6cc01bmr257597585e9.19.1788883052584;
        Tue, 08 Sep 2026 08:57:32 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm542370045e9.5.2026.09.08.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:32 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: linux@armlinux.org.uk,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: conor@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v2 1/2] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Tue,  8 Sep 2026 15:57:27 +0000
Message-ID: <20260908155729.4164814-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908155729.4164814-1-f@lex.la>
References: <20260908155729.4164814-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY can be one that the host has to load firmware into before it can
be driven at all. A controller that connects to such a PHY at setup
finds nothing usable and drops the port for the whole uptime, even
though the PHY works seconds later.

The flag declares that. A consumer that sees it keeps the port and
connects the PHY once its driver binds. It describes the PHY, so it
sits on the PHY node and needs no prefix naming one.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index c3ebb3af8b52..e217101fd54a 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -215,6 +215,14 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      This PHY runs firmware that the host must load before it can be
+      driven, and is not usable for as long as that has not happened. A
+      controller referencing it keeps the port and connects the PHY once
+      its driver binds, instead of failing at setup.
+
   resets:
     maxItems: 1
 
-- 
2.53.0

