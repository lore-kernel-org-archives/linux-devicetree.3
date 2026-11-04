Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808968;
	b=T21fD6bMuzNitSVnhUcquGAy1xsSzoH3kOeyOQi9mz/37iYP5sgjDYp2KAHuNIYayK9j
	 lj/v8dUbqcVQRcCVmfoLFNsZ9ekEeOqBjEQ94bJt8qQn5vHLipFpp5ZCbo0frmIXWMhhC
	 GGFsuLF3bxDgE8FzxXLIDSt1P7zyzhRjHitUnXZQNJOse/NlXU4DMWqu1WmzYH5HwNYcK
	 7NBIicFdf9ahW3qdzgIDYYb5xD99FcTRJxRbA9dfedRyiGi8ktRUgNQvcyX2N0suS2J0h
	 EBISHGmRRYRcWgUGL0z0qEG0kkLk/CKjnN4AhaozM4dFPQRO66rBtwBuycV/r1GR3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cZO12q2rUYGTJsRBXXjfwgfWq9/ftofCaITTyvCFUto=;
	b=sw5tzIiZTrwviHj4qs1GhyBwNgv0jKrpiFyAFszRjpPNhc2QPbcDxXk6HmkXbq+6N97J
	 qvPqU3y8WNwJh+S9GywVjTWUIDWtFk6iSxKeeaEkKWcbQ+TS1j6FkANI4UivXJOIUj8iR
	 AjwgP5i+DypldHW49sJLAkdJyE1w/uPsHrnGG5Rv0qAAd4WDLNeOP3ly9dGMPnbZ5SocV
	 EltxF/C9ISSaqaQ9O7urUaVi5tuLSznuV7Zr+wIEJIqPcv9lliATe43iAFk+vqn1XxLkg
	 NSggwtQkYR0TZMcgkRTPBx/1e3NcFrSTVK5g56ra5ANuckac8hsWbenelz4mcS7G2gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b="KOLG1A/V";
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6012606A330
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6012606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=KOLG1A/V
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 51586240103
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 17:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793808965;
	bh=cZO12q2rUYGTJsRBXXjfwgfWq9/ftofCaITTyvCFUto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=KOLG1A/VP/BYjsOCqYOiudOKWdcUDUf0h6xyndjEuoqPFAg7estkXYby474OLgno4
	 Rx5w1hYLvHknmBQlKmV9wk/PUNCKlI3chOwcUIpFcaRsSFTIyEAph6qS4Mzzft3Cha
	 Ui/Ysjvq9s8ytfuTBRZSCD72bNMDHixzERVhK/JBE6CcxTTHz66z/OiZ2Llg+0h8bi
	 fbc052edij+AoHTzX2i0I+cHtstnjO5Mx+jPW6KtY0gko9ACXYEbtXI8mtjQr9bpgZ
	 TdPD4LiuIryRTCvWQ91cH56P9zo7GbDeJEBUsg4iHelK24xDB97Zo1CM0A/kS55AxD
	 ya/yQ+y3luFLQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKVtB6Cxdz6tsg;
	Wed,  4 Nov 2026 17:16:02 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: watchdog: arm-smc-wdt: allow a list of SMC ids
Date: Wed, 04 Nov 2026 16:16:04 +0000
Message-ID: <20261104161553.30115-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMC function id of the watchdog service is not discoverable and
differs between firmware versions for the same SoC. Let arm,smc-id hold
a list of ids that the driver tries in order, so a SoC dtsi can name
every id used by firmware for that SoC. A single id stays valid.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 .../devicetree/bindings/watchdog/arm-smc-wdt.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
index 8e9d0b7e8244..9844b23ef51c 100644
--- a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -18,9 +18,14 @@ properties:
       - arm,smc-wdt
 
   arm,smc-id:
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
     description: |
-      The ATF smc function id used by the firmware.
+      The ATF smc function id used by the firmware, or a list of ids for
+      firmware versions that use different ones. The ids are tried in order
+      until the firmware accepts the init call, so only ids that are known
+      to be this watchdog service on the platform belong in the list.
       Defaults to 0x82003D06 if unset.
 
 required:
-- 
2.56.0

