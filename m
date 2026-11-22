Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340064;
	b=QCKGYFkG99kjKXN+sk4f+6bUOwfSS+PUx14aPUdhsxT8lWYOFCz83xWiFeJX+YuspBfE
	 rUf058FV52/kv0HNVZT8WMgGN9wgMtrXi3sWjJiMfa1J6kDKQoi0wRtR5MaEjHFdWcQ2/
	 7KhjswGokBbDqjYuX+bJ3JjuPNXtj+u+iu88p9+zWzwuMrUikKsiSs9GXNrjsinE4K53w
	 zam30UjHtBnFVcWoOdP6T8M+z0CmdpYRjyoz7zdDgpKoWJrAb9kyil+AciQwqUj+0zOgX
	 bPJ948NmG4sP9HJtxcPNcUVsQsw+FgzD6rgy+/r1gMa6t8UBOGxkdVyqIQbRkeJfMnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3U7CcHWRUE31wmoeiAHLUkWdPGSZYVZsuRT2MibCOxY=;
	b=hiI6AJcajStfKBUUMOVr9CK/VDWsM6hjuTPzDyoSatGGZ5OA1ROMHa5lDr4vMSwUVTTy
	 ce8Xu+ECbLRil5Nj5/oTadN0lVfXAyPCf4gtMx1RoNjT2PIqjxj8RSx1A8j507SyhkN7M
	 8l4u24gPGpQLunLnTbCJ9HOt6Ux0PhZmuUP5OLYCfdQzXwttLzekP4ClnZkESKJ7LTRXr
	 BmQt/cRE37KswHIudStLEV9/N93BDBLHJD7HsVCeWiiRxqbRRBxY9nF99Xqf/Q0YHaT0Z
	 lJMmFZ7nyA6LMpNXi0ZhOYbCS6G5VldtGbtf9GjYbPDpKQSiXsmPLPR3jwfX5XkIvow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AeqvcKlm;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5645606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5645606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AeqvcKlm
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a9be758734so1338739f8f.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340062; x=1795944862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3U7CcHWRUE31wmoeiAHLUkWdPGSZYVZsuRT2MibCOxY=;
        b=AeqvcKlmO6WuW5/08hABOdRLV36YdZn1cQZDAfyiW0/pWBJ8jTutocF0NbZ8Nxbg0X
         R4MdFnPdIzRvth8dfq7if23L/h2AF7Z3ERsdquRYCP3/9szFrj9hkralLojo3BSIaxOg
         aFFkFqFzbjAmjrJu3ZPAQx48BxgQv+TAFp5SiHd1d/mLp8f1FWmR2ktqxTxgGrQgBBAb
         7fPimDdzgEl9SW5l0KxFkB2rAtp78KYaDG1p78ekLNVRg5EM5n8MEfkc3bzDvXqh7HU+
         rbFnpM4qYmr2VEAFt4J3zCxEL1B8rrpfj8r2dVA/AzYM5a5SVGnkQK8gDf4wZJ5QLV2n
         RKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340062; x=1795944862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3U7CcHWRUE31wmoeiAHLUkWdPGSZYVZsuRT2MibCOxY=;
        b=2C+bR90W2TvLi/kwD1gTgAas+VbuuHtZFR6EvgYqrT8hqH9TGKu2fPIEd6XbpW8ngu
         GjzHaaR/r3Toj0zryW3ygNRoTufRwbMClWffhP7+2fwgOSa0A+ztsrEAKkKkA3H0NHNY
         sYiU3qIvo1N9v7EcIgzENcUAzXNY0F6X3fcEWKKXLztnfy7PdfFdTeAu0B3qUTf7qxeE
         hxICvS3C5GC6nYFRwSlUgZ4Sbl5Yuz4P0/lzcq5c67pdNh+gUSP+tat1lrZcHjJjyPmg
         2ucgwtipar/FqO9k5y9WF1fha4ZMt92oFb0BJg0DW6q4Wycc6nlDZzuv89tL7I9ySaSy
         NlcA==
X-Forwarded-Encrypted: i=1; AL+hErExA6W7g4k8g0/ZUPbLPNslIBVpJ+Rfec91YOPhsEI4gHjD6NJUuywupAntFTzHKSasNqNjLQIyONJR@vger.kernel.org
X-Gm-Message-State: APuU4Z9RSmlBqRMJ5oWTz6IZn4YRPUiqO8D42ml/lImmPAAIsecnuscT
	uLYg41FtrJB6y3ygZTStAPqSsUFiYrQ1DH4wGAb+brX7rX2WE5kNI10TP61mtD7tYuH0z5xmzPX
	DhaEr1QNbQWTb
X-Gm-Gg: AZFdTZeHVMunCqByUqGZs88Esj+PpNc1MDLBg3+qbWiyVgZIHQKzxz6wRuqmf/OqCkT
	6gs4828kcErMgvEIU1qtxNtq2aF0xWMqTj1iIVeHtpnFnrqtcRrHY7BYG8tWve/P2sFPAI71W1c
	QVfvJl+L6hD3jyrOYciYB4XO/BROucXsvIDID6zFzr7bevwqsXRH7cVXl7G3b5IKXNnF0Qalgci
	iWmfgEpBqvkxW/XXg36E9I2P7o5cAxwvmo5spnlWJRg4bvvnPWw5edBJabIKDa1ImSTB4MR6IU/
	IwB77/dxYIQ96DFgs+HSaFO/2szxelESlgVKX7tE1kAWIwWyfnSeppO1RIVmbzFvLESlV90kln4
	xpVEwrc0Hw1ctPn3xpeWkydEjmIbu5F22HVrqg24qjeIPJcHdmTOy0odeDIZvWwUXCprfllFRbT
	W8gfX0P1NSnAcinonKfL9AR7YUxy1aaSWm5nC2ytRcsz8TH5Yg86pkucxJ+xCrGpbVcWhu3f+0v
	3Ub2FrixLhdvuz+Qui8OScHYpLXi4xs8FPodxke7CcDQWpRcw6r3RGjeg1m3nP3pZ3qh9C7/NDb
	eBvgMdpIVlNiqM//CvG5UmcSxx6QFm7pftVmk2rBiQ2Je6VzZ6/u9b2VQdsXHMqNS349sqkcIrh
	z5/W+G+xCYLg=
X-Received: by 2002:a05:6000:2f87:b0:4a3:7954:ac75 with SMTP id ffacd0b85a97d-4abb2910fb2mr15442071f8f.37.1795340062126;
        Sun, 22 Nov 2026 01:34:22 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm17007803f8f.13.2026.11.22.01.34.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:21 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: awinic,aw8738: Add AW8155
Date: Sun, 22 Nov 2026 10:34:19 +0100
Message-ID: <20261122093419.72135-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The AW8155 is a class-D/AB mono amplifier whose mode is selected by the
number of pulses on its CTRL pin, holding it low shutting it down, as on
the AW8738. The waveform the aw8738 driver generates (2 us pulses, 40 ms
start-up wait, 1-2 ms low for shutdown) is within the AW8155 datasheet
timings (0.75-10 us pulses, 40 ms start-up, 150-800 us turn-off), so
the AW8738 compatible can serve as a fallback.

Only modes 1, 2 and 4 are valid on the AW8155, mode 3 being a test
mode, so restrict awinic,mode to those.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 .../bindings/sound/awinic,aw8738.yaml          | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml b/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
index bc6c6b172238..5ef7b800226a 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
@@ -14,12 +14,28 @@ description:
   (set using one-wire pulse control). The mode configures the speaker-guard
   function (primarily the power limit for the amplifier).
 
+  The Awinic AW8155 also has its mode set by one-wire pulses on its control
+  pin. Its modes select the amplifier class, its gain and its power limit.
+
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: awinic,aw8155
+    then:
+      properties:
+        awinic,mode:
+          enum: [1, 2, 4]
 
 properties:
   compatible:
-    const: awinic,aw8738
+    oneOf:
+      - const: awinic,aw8738
+      - items:
+          - const: awinic,aw8155
+          - const: awinic,aw8738
 
   mode-gpios:
     description:

base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

