Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C7E4A5EAA
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420305; cv=none; b=mZ40LUkblm9fqAyOOwbfSAb4TSX3tqJplfg9wSUpVcIyEP6EdxGWqdifPDLiHt3Do8XcuOqk6RWqe8Rf0k2YLm8r8BsSqVSGrhvQATFQUwW4uRpBGEsVAkJi5vUhuhuuM7euG3j2fH29xi8ipTO+Q4e2TyrLLoWppB77X2bfm2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420305; c=relaxed/simple;
	bh=3S8+SIZMe++uc49JSNvJUaBmn7A9ZJ1K3lr9hNoioA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDrENBCiiW1mxrzq9Ah5E8SIdE04pEhJZCpEAusJZj51+s+sjPXEO6aB/5iXR9vobU4RXUuS/OVsGfBpRtd6QzlwD2V2oi7k6RUh+OcgA6uwqKqiKofSma3p0YBNoJ2P0K1xruCQFK8zmIlct1K+Hd6Q3zxoUmRRayhK74yS9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=KVGEmQ+v; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="KVGEmQ+v"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so10282435e9.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789420301; x=1790025101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYSjeGcJ1MZAeWSYitC/YaPtibetrH4tpM+XIfJ1kBg=;
        b=KVGEmQ+vfeO2uyobo0FlK/Bj4AsmveGrc8+wmc09acKvGyMa7PwdLRIdzVbuuFQzPF
         r8l0AOP0PvUw5Z93VntXYnN3zIlwLQ9Luv5UG/nDG/frZYiAgeO2hfyG/jnFRR9phe/W
         +l/cEpjGmDK/H0IbC/RA0m9YxcA9UQoyPehZ9FG3C+/I90B906GD5ep6QyE9DnurFGSG
         3oEsKUrW/xT73tt4spHGIfqCjn9OpH7zqQxrdKxxahOliyyAilnZ2jCF1kRdjhuQvzzU
         Jmg5ZNRzVEbeB3/oyF/qXNBFrUiwWg+P81kYAAuzvCQKP1TYLiTyhKnSi8moFHrDG7md
         fRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420301; x=1790025101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYSjeGcJ1MZAeWSYitC/YaPtibetrH4tpM+XIfJ1kBg=;
        b=wIogv9YrvaHrcwFTHTVjuyhCZCES7CZu3pJA+zYz38WF90yETQDvh/z7GoaXu54vUz
         Ld4uB3B2iPE6kp3viZ0dAH8J2ElV+ISAvV+c1yNrXm5ICUjgDM+Q4lPQgCizVx9PJLJQ
         Y2SRmb18Fdf7gxRQ6TNPPt1+C+sjZGAzs5jRPHHLYltPmcIjEy1t///VMg8nL5s8oenS
         rv/AtLOYH3QFmHmCo2twcK/DvESEDLlgmnyz7fIZylLuy89O+VaIxRgdjbsTJmqrDSt7
         HYPT6v6jPxDektKa5YQvnRzn7lWF5vkPzGFBB9sNo5ArhLAuJ5K4IrPsmuuyRz9Q98xB
         AeiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNG96V8I7V+19MuYyvA8CZAnKT/TO4cY8cOC2uT4dsoclud/Nw+kO3yPswadiyrTRtJ/DMFewMGUNA@vger.kernel.org
X-Gm-Message-State: AFuF++n/cdtTRpNOT41RJMQUOErOWtq9mgiCkyMrtmlDCVnFq4jQAAaY
	DYuAztkPkVLz4FlOtnLLRfGzF6Iu6ABVTB//EPm6HPUtUsTXpecnZduDnoIqjVeQZk4=
X-Gm-Gg: AYBFou1UC0t8pu8yakr5h/rsbUM5ryETyzSkYKzi0QH4E/IKAisuhW7RNau6tlYOdw3
	GyALKIic6HxThQ7O/1P7L4mOCI0vHVBc8h5AOQbwUXZicyd40e6SCKT8cIy7h93wf3CFRV92LkD
	6YVpmDeqJPKDfFi8Ou15quTO654YH0Zfu/uVs1ReIu1B86ksT/kV7aBL4kJ3C8+DpGYsjMYsqZF
	/Nd/asbBJYLy2NYGCZQCdJrMxOSL7BvrMidSR6WzA4YkacfJq3VzvvGO13cRF59ImPJzbYTZ0Us
	zJTplAoZMCBq47kCMbsl+DJNxFu6XX6J+L1SJgX7IUOG4i/c3be/RHY4rNDVNmMPP4LC+djBoj4
	uqMdV538+v2Siz9rhNzWjZhfIUrwFu8kqL7E6WtGKQV1+7vDMWhQmqfg3/IDnvmsdc8lSBWmkzz
	i4mFf8sSQKPHCKIBLtRFHy7aR0UbDoeWJUwAYqm94TanuBmsTGag==
X-Received: by 2002:a05:600c:6095:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49e7d6deeb3mr16021605e9.0.1789420301380;
        Mon, 14 Sep 2026 14:11:41 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef74a5dsm5642305e9.7.2026.09.14.14.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:11:41 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
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
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v3 1/2] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Tue, 15 Sep 2026 00:11:36 +0300
Message-ID: <20260914211137.2760618-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914211137.2760618-1-f@lex.la>
References: <20260914211137.2760618-1-f@lex.la>
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

