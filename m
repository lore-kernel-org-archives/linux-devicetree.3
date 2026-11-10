Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320434;
	b=XTqFxQZ/kHQGJZ/WiHLExNhRv2gn8jJtJjIPeMdpocEXz/K30YZVMlI9X21VR2IJnkN+
	 K+j90Y8nNRu4loY98wLHbJDt3FKnU7+ldIOrJr08r8GYOpw1YLdIrfLcvY3yiGeVeY0pZ
	 NsVrmYytuqfch9xhLUmRBG9D/pqrRD53ZXlmU48d0ZvtOSLzPz3r4SjDQZJFICvcSqIfo
	 28tkPzu4XwPj+IqCo/HU/37rBGXG8HxJhgVfqxmSWn5BT7jfE4XezmpvFu7C3ZTx3NXcF
	 +ytT8R3P22EJgo+yWJLNpEnPT918j1gam+JaIXvW2DuSYtCiV/vHoIbYq8Scq+g7X1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
	b=T1x0YloX2ZPKh8pqYs3CnN9xeWFI07nERGUjxNg4s8cgglP3O8Jsh6hLrUDFKYAzH1ft
	 r4IQjDuQN7wMmySBEFkzpVmoRVsNQgrxHlYEamYq0ngNZzAQVQE7VY3HPeIDAYjAVki7p
	 EdFdvrrttZbk9yF3CE7f+5Ym62QB1kom6h+s4L/WR1jL255F6aGjX/mImsfIhJZrSFZVA
	 vuI2sj1fc4k7ok9e+Kkskl50EdfPQEO+VLStCfefduGVRqkmqenQoyFAUjBqJeMWNnF31
	 SA+jwSBKBOxG3jlIA8jVRuOHllW4Qi02ovNn7Uqom9V6kqQ1aOoLnO/L4kAykEpeQxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDICeYXe;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5463360A382E
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 14:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5463360A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDICeYXe
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0cf2c0785so20539547b3.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 06:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320433; x=1794925233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
        b=IDICeYXehUCODeb6gf08r5i2r/Lverd0wyvsfsCYPyCpfVRD2EBgtWpUnwoAar6XRO
         wgxoDhY0VKKJCAv7zWsmxzdskVr1R+CNe/rqFPIafdLl0x1F/sKJYx8uEr7TnUk0zgTX
         D+7kqoaEUnsT5V8dnYR3PsOlr+dI0Osb5bDhYC7Tvc7W8eOeQRSEYmWMcBHqjAjdSEY6
         j6QQEP7+SExFix5mFuGo4XXctgewthQmFzntr1vFM+cuMQXB2lJTIS6PJMrLlp+Gjjzs
         G8JjPocE3MDl8wvYC3ZVxFwN+O3jiBNNEIWH7I9QHv1JuJxQ/SJBCG4hheXqaTQ35ZLz
         GAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320433; x=1794925233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjjNjXW/DLhm8uTgpvdp1RvacwHSWzmRlnWHV9BPT4E=;
        b=jbr7o6bKyr3QA6ALph1turlEU9gerCR0lZkSt5miJl6Bi+VeesLzcX0Dp0YGMeVo2n
         MUyoA7+67sk2w2AB94n3A+76GWzMRXwbOqOrFs13bGCBDD87LHmHVHPXW/1BCjAq5tkd
         o/5qcnP3SYj4m6UsS27i5Qmc24Lfdm+l17RN2JVaalR58lW9GYRJtq2X6VkCeRpaiUbZ
         4CYwJEMyibGiButsqKpeootYs/ajc6inEqE0axb+G6HopLpWXKbkWtwCXBCOzkSIDoay
         DiU9UGLb4RQYAgvPFcR4BNOEzYHvkcX58Npz3C6cnzW6Y92ob6czef+pGFY7FnFkWa2N
         VDDw==
X-Forwarded-Encrypted: i=1; AL+hErH4oTZ4u2UGUsIi3vdwnAnaRtste61sALmRAUdvDefL847U6C3IbOt2we+YSILT7Rznj8WNx8l+tc8j@vger.kernel.org
X-Gm-Message-State: APuU4Z+fxsGdFH9ngsAPRK6w5yY9kgslrqmEhO1w+FEuLCz45e0LYU2N
	USWPBYPsOIP7elD2e9eqw+nZOMdqVqWAY/GWL/44eLwyC4TFLxu5PNuw
X-Gm-Gg: AYBFou0BVhKwjyNKpVfmaGKNk3pcmYP0xioSWsLKmzHrASu9K9BydU9aeO8mAcKPNPy
	24mj1tTw5tUHQ0te86NBsEH9jeAW2omVBsN44Gbgh4nhAUgLsnA9RQh1JTQ641ufAx9i/0P4RPZ
	6N6jL1X8GjISF2GtiZcePIx8N86lwvFLgvxICtbMkzOt+wFfHb/2QpqPhSIjiCD+SSW98/AgETk
	iZ4oapByHhk4XMm57aORFhtdpmeRhxlGeU/OOv/7SK/HgxMpHaOYHQ1qUu1BvZaF2Dl8ZPo8hc0
	Uy5NFCwsLzasNfTVGoeP3VTxpuiEjWJeamqHafh9NrH2Wp6ki9ZEP+zl6pPlwvFDPl7mm+iyze1
	Jn1SSt/pGQbeiXdonQzQTUyEfQYv8dwwJ2SY/xrbkdRlXDXQ0kpPTFBjTITCRIyV1eMfQnwagv1
	q/fx6Z9eVT1EEa9VBceWw9h5mcxspeL2scV0EDosKvFjZRzb8l20qlaNErhDW/rHtkcXH7rTj2o
	MjZX5iFQSeWUjg0HwzMCBXWhCfTL4iputhdA6YQ61EiN1XXgnTx8k21to2zdM5YbHNTTGQ9YYgm
	1CjnW5Ds6jgOxdbXnpdnZLNskXi3fVY+vmJKknFnJ34EEZq1A+hF4PhKAezb8ULjp2fUUWJEe/1
	xvF+sdk+iL+kX2zLS7WGysD8=
X-Received: by 2002:a05:690c:c4e5:b0:8b0:4f12:d28a with SMTP id 00721157ae682-8b392c0b62dmr12596647b3.65.1794320432935;
        Tue, 10 Nov 2026 06:20:32 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a802:b7f6:2185:e89b:b285:6098])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a229csm1863712d50.5.2026.11.10.06.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:20:32 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Tue, 10 Nov 2026 11:19:33 -0300
Message-ID: <20261110141934.42490-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The interrupt descriptions added during the conversion to YAML do not
match the ICOLL source numbers used by the existing DTS files.

For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
detection and sources 37 through 44 to channels 0 through 7. imx23.dtsi
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. imx28.dtsi also
lists these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Newly introduced.

 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
index 782b2f4005a0..755029880677 100644
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -87,13 +87,13 @@ then:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: channel 0
         - description: channel 1
         - description: channel 2
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
     fsl,lradc-touchscreen-wires:
@@ -102,6 +102,7 @@ else:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: threshold 0
         - description: threshold 1
         - description: channel 0
@@ -110,11 +111,10 @@ else:
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: button 0
-        - description: button 1
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
+        - description: button 0
+        - description: button 1
 
 additionalProperties: false
 
-- 
2.43.0

