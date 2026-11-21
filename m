Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296668;
	b=Un0cFYgLYlHTC9Nsa4fYGwZMz8qdkYY3i3r65wm2YeSlRW7V47CvHZh2pQA2Vi3c0Rei
	 QT9lNC4Dh8dT/yGdcBZG4kLBaaMMTZ5fJXNnuJO4w0efOqABWReKm/27OvdSfucVPxjaC
	 4G3ZtRvMRhAL0tn+z8g/aXqfTGVXPYhJOC5Sm0ThyPsHAvjEYLAVgKEDY0n9exsKCC1sJ
	 PNCH0oexnjvWeIOGGVM2tmLgnBNAa87uwcn9qjUJo8npG1fGZXnk9Pb/2Sp5rlD60ebU5
	 S5VD6JMiT1HoHPl2Yi9F72y+PINiGdCKyQDg6YLjX/fFk1GKJQ4rl4kpY6OjmuobHBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296668;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=;
	b=pCDT4VBxHbqazYO9qaIj8MaAL0xjAMgnzoY6G4tDo8AB54lhW7MsZAP5USaNGIAgg0Et
	 bk7YiJ+RCO49M6IRfGxhwycYc6xgd+Il97IqkjR+sXk+eRkYmXP203ZL70XRVbCLO7o0E
	 N60kCmEaDSe3vzfyxo4urb6PXTaQ0QKbSZZ5Mfd7+P5rzPpe8Akw9iY+9L7pqDy57Ltyi
	 ZM0xrQigPF2inL84ujb1YTP83rVUeuXIZSuYGobf43ZFJ72rq55M790yuSMxf/14fSWap
	 uLVnywb6r65ygG7mQGJWyzrxBLHyYiB6q+TP8vRELBZml8cnUa5H3LbyBVuGp/m3QoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CAD606A335
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CAD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so1908653f8f.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296667; x=1795901467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=;
        b=Sg9FwKcEMVrfLxJ020lwMhBBTDNtQiirJ3YPhMIt2T0XxPqCtWqCCugAuEEl0MFDnN
         3Cq6tDAz7EqeImmSYJPlIUHgwVaYfjmERmR6ncapuSWaT/MryRQZBT0zIpwRnBrz48FI
         gOcKe/MgGDMApj0arlLRTsDrwzlge0e92+Uo18FeA73jXx8r3OIQv2UGIaUQ5doH/Plo
         /F19L4NjpXOP/np8XI2pFyUOsoDqZt93nkhAfXY2YZ5b6F7z7yld42dtmJJ9FYO+hido
         I3Gr8GFXnWAtuLu3kor6BbEvCylGA2QTrkBq73SOupHD8nrV0+txI+UExFguhmNDyVqU
         VC+A==
X-Forwarded-Encrypted: i=1; AL+hErFjsMz78nAKPyfKFWuHGxACyWRc8TVqW42q+ZwfeTq7ADuIJXJZdm+xoMx4O6HuqXmq6dE7hPXmGUX+@vger.kernel.org
X-Gm-Message-State: APuU4Z82JfJPSoQVyrsDkClnJe20FHqNp2SCGosSUjx/KHtH0mdfAlCy
	C2fL0VDbsXUsVsJjEsSetYTsO8/WunLwz4bfdAOXNjt9wpJunVuUnnFy
X-Gm-Gg: AZFdTZfolkpJI1hpDl4VLAa3gShB9JqTsLXSCRE5z792SgXfinkPO7X5rQj5pG2ffwZ
	FiwOaRHHnvWm3J1GDN6wBZxZ43gqILmK991vdLjfejeJ2aUHZSdMb1eywkF1bPu1dhtvB9uLZhm
	aB3Xg7dQ+1nkz9EYRVAdNvltz5FSYvlXf/EUR4qrRQYHRDPvYRZmF0QRqV7z6m3wvgquqAWeZ50
	7Q8tP7eBhnoqYGnlfHI+P0e2fr574P1N6Ukrl78IVAiTyqCAajcnEamf9cqHv7GsHfpGu/Ylp4i
	R80fqu+Bd0nd5a8ZS93chIOeko7RmkSe19+4hvfJkH0/NQjB9GMkUsldQME6n0Nfv7yXkZ5V1m7
	WdUkGRAvC6Of7OpyAiWTGWzhUnnorax+7weLz4zTdj6faQ2ssS4mC6HceL3HN/1WYj7IxkJWDZ6
	yTn6DLXrTxNAXlWXt12LswB4YXibpdZzSl2KnpmNvyUhuecV9rElu3y5ds4Hk4ZSAkuRkkvheab
	dBtxjvRZmZ2JrobyWmxOFANLCCf0LHuhiOHF7sl/5AsGu2IlrxtTy2S+H8LzurtQv7ubFp9axBR
	VUT0U4XTrIvQ9rAnuj68fdqNHJe6EsV68sMHcx3D0bwjwxNdYGnxTKjXPfDByN7eDtUGbfNbL1W
	EgpwCzAvbTMelGomeUMQfn1U=
X-Received: by 2002:a05:6000:1847:b0:4ad:d65:ab13 with SMTP id ffacd0b85a97d-4ad0d65aed2mr11591573f8f.51.1795296666841;
        Sat, 21 Nov 2026 13:31:06 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:05 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 21 Nov 2026 21:30:59 +0000
Message-ID: <20261121213102.143130-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
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

The T7 has the same management bus multiplexer as the G12A, in front
of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
But a device tree that names only the G12A string leaves no way to
tell the two apart later: if a difference between the two blocks
turns up, every T7 board would have to change its compatible to get
the fix.

Give the T7 a compatible of its own with the G12A one as fallback, so
the existing driver keeps binding and a T7-specific match can be added
without touching the boards.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
index ec5c038ce6a0..ad95562d1f3b 100644
--- a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -19,7 +19,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,g12a-mdio-mux
+    oneOf:
+      - const: amlogic,g12a-mdio-mux
+      - items:
+          - const: amlogic,t7-mdio-mux
+          - const: amlogic,g12a-mdio-mux
 
   reg:
     maxItems: 1
-- 
2.56.1

