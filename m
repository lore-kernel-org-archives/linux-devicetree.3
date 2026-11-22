Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340050;
	b=bwFm2ppkiSWHAGr0HR3Qo0m0GlSCt2JIpXPYiQwdRQTvo2cyk2BMD/lJQb/khlz0kN4j
	 JyXcV4/qCfrnQjOEm7gXJzCt5CmOaS6zdDTL2Sjlnl0hjVucTmWi1bXyg35dshuqkqsa2
	 CuG4trjSW6i4gSsyXSK7CC5uc6ynWjCLpqSQ237skIJxW520H+ekEHQH6Z2iiQTlgU0W2
	 jK4vVLv3bdnG6a8LvlNmqN2D0NkJVG9uxPTDC3M05AanwCIIpj/kCOqNAy4vDwiHZJYae
	 RLdCZvUDRcLKs74Vg1GETKepResIBWWyb7S4a+A14uL+mSoCuysRm0RrkF4MtEPNKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EMGZeiHC1km9rdIIguTSZBczlbZkEbh605v5+C7/h1o=;
	b=scADjn98dqLGfIRLoGOzNxtlPHLkRFGQUD+hZDH0j9SvpgKWnVhSxBcUiS1fhlSvb6k+
	 NgjQpnLyxshHki5nHamouv9CavNlAyF/zne1/5Wmrn7gP1s96tjzzqIe50rxj9l/ye3GZ
	 uqi61Z0Hqaw/XEr85bmgggTfVpq4+gN4UKWf6jAQw34gc/gcxr/99muQI5dxpQuLfvEAA
	 MOdWrWe25Iriw6uCMMOQpHNmOMGNlDnMBfAOAmUJOajft2/S0lgnzY5YrbfMp7tFsfWku
	 L5c/cR1XCTNRLsSSt5eKxA+hQxUWKwMNhcOmz1BTXfPbHVFDCPNVJ8cRXJDePYeHi4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B6fhYufr;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBE7606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABBE7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B6fhYufr
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4aa5833c263so2148163f8f.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340048; x=1795944848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMGZeiHC1km9rdIIguTSZBczlbZkEbh605v5+C7/h1o=;
        b=B6fhYufr40VSF2/kzijMbnYxB648vZ8pjssxb+JPNuhijzjwKFnrcuFJ4CIBls+tKz
         PnrMNTTLa/ddouxB5hpm+9a99T37Yz3QKh3u6vu2fjlPDuTW7cOEJndzgi9a61czhR8V
         TxFinq+72O3dRH7BxXu5cT9TU2WiK9Tbpc0wLcqFf7gEttly1dO80Fn/IONv5Z7/HXBy
         v8zAc0ZguLpPv8mwf78oKzbOudYOO2dA7iSGfdxmk5elfFEVMwdXTeSyowJNf0571g/4
         RrmeG4UICtXTfnWk5nojO3ADd6hMV7aGk6xfHmWStRN37y/V6aBeTT1dRxfMZSOW0iFZ
         41Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340048; x=1795944848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMGZeiHC1km9rdIIguTSZBczlbZkEbh605v5+C7/h1o=;
        b=JoLGt3K0yM2sCAbeiW2ssr5XbD9VeNZCRfHDHSmCANFpRcN2lqeO32dx2MKNk6Paf7
         BXaZojAJQflZL6o/Ydj1DZiX8UI1MPSLMPjpywNjlMxCu6Q20YzeV2rQL+WfTp1hB29D
         6htNTOVntHwZAapGpcGECDzHLXqAilJxxoWlVpdzBwUIQ4CCvE+ehuZHUxXnvwBstQmI
         0BZmfTRbctvhDop0xBnz+uSdRhaZPnRtRHfM8mT9epcW3LBz2l3R/uurEMXqOAfE8X6Z
         25uLwxFg4skrDqUN/pADo8ojHOU/VHFSs0/2b196JQw0jhC0lBY4JyZR2B2SeKURuqRg
         tpFQ==
X-Forwarded-Encrypted: i=1; AL+hErHEloEvtqKGnHPS+0Hd+uRtKUvktAk5b/Djj5E5Ala48jyazei4sBuJhB3gw+bUdnlOO+EVpfGp6W2n@vger.kernel.org
X-Gm-Message-State: APuU4Z8kVXh1fJ6MxQazYTWrknfi/kkw3d3s/VQbHf5yZBu7ubnx/CIH
	ph2GsjDf2i9ba2rCn4821FB4EoZI/v8pomzALKbnvFLkUsb24GtBRr2FjO0iFeWn3Qs=
X-Gm-Gg: AZFdTZe116oZM7umY9FQxoz6p7clnlO3I2VvGe5M22gRzZyyair5gwta1R2qU8FJo+U
	JP6T7o7o5Lwa/qjA/05kGEQBvZ70zYVVBoHHRye60qmaltyfGAKafv3B9mVQyuBFONqc/LV3CnK
	OH2vxC4nJwRidfV1rWGgI8doL24TXFFBqxjdLK2jHOdq22mpJt4CdnyRVU1WUQI02tMcd9trKmj
	H1ENol6IWWahyBn82kRhaER5zu2ZwTY/jQMkL1CChOPZSbSNiHIO+J+pAwPf4AhMEQGhWhrp8az
	c6WaugOqRoqMEMg/dgnhLXuxLeXWvl/YoZT2akonC1cDdgnTwa9YtH3RyA6lqc1XkJwgpNEu/So
	qLSEyNQ+Acf7/2m9nhVnmrXwEfmNiFmHG+ZzNbw0BFkPtZQF1bDgtMMJzEhNFRk0utY5JZVdTcz
	buJe0YFp3yEwZBdomwETtKrOPyG5yop7oOdJYJwndWl0gN/0DCQXGb1bhoWlP/x7Pb2c9++m4FU
	ab7uq7uwGuQNEgFL/oUxXTGXu59eYut8pD5sMy6t+sWPhz40XxNlPJQBY2Ab/tglLjMEO7m6gHz
	v3pGmCp9nqWD0+sVzwH5tYKxkstNT0d8U2tdAUtOVvG4UIZbuNPcnMKaH/dxY2p9zziGobJKxwI
	HiHgbpMOhSHg=
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr11673178f8f.47.1795340048064;
        Sun, 22 Nov 2026 01:34:08 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm1552848f8f.43.2026.11.22.01.34.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:07 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: hynitron,cst816x: Reference touchscreen.yaml
Date: Sun, 22 Nov 2026 10:34:04 +0100
Message-ID: <20261122093405.70406-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122093405.70406-1-gerard@teslabs.com>
References: <20261122093405.70406-1-gerard@teslabs.com>
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

The controller reports positions in the coordinate range of the panel
it is fitted to, and how the panel is mounted varies from one board to
another. Reference the common touchscreen schema, so that boards can
describe them with the common properties (touchscreen-size-x/y,
touchscreen-inverted-x/y, touchscreen-swapped-x-y, ...), as other
touchscreen controller bindings do.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 .../bindings/input/touchscreen/hynitron,cst816x.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
index 72d4da636881..df52431b1d49 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
@@ -13,6 +13,9 @@ description: |
   Bindings for CST816x high performance self-capacitance touch chip series
   with single point gesture and real two-point operation.
 
+allOf:
+  - $ref: touchscreen.yaml#
+
 properties:
   compatible:
     enum:
@@ -41,7 +44,7 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -57,6 +60,8 @@ examples:
             interrupt-parent = <&gpio0>;
             interrupts = <4 IRQ_TYPE_EDGE_RISING>;
             reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+            touchscreen-size-x = <240>;
+            touchscreen-size-y = <240>;
             linux,keycodes = <KEY_UP>, <KEY_DOWN>, <KEY_LEFT>, <KEY_RIGHT>,
                              <BTN_TOOL_TRIPLETAP>;
         };
-- 
2.45.2

