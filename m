Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D813344A718
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115854; cv=none; b=kUTWvMz+QHVugxcKz3t33go6j2PKsJVZPFS2K77WI07j/8/Wfcb/To3/3n/OqFaBXDZ/rh63ZT8j/HQ+SiHhnSF1KcGaVlP5cQwmgl3LO4EXMoNPH6lDFVCoT82cnhDp3F/eSte67Rd/sbKtBkIgj3CSFo7336DAIPsU7Dmc7/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115854; c=relaxed/simple;
	bh=RDZWQZuinWfD+cU4EhZ+Qa3Kim+iJSBL7wAOTiV77wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQawfVSYT8nG0Q2/aWo0sliwaSRD58qI4IqCeheXvZj5LbC6R+9CWleExO8QvgAO5mJpW3LBXzofubWhvR7UtIuRAw58T7TfxJ07YpixDl2X7F46lWDSfrvenNJPkDYelGyUDSqwVYAdGGU/EVNVmSAl2nYsNNh+Dz6mqeA0PMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=f1AGOqOy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="f1AGOqOy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1276748f8f.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115851; x=1784720651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5o9RlxsE2MKhjLVDUh9pAaiwDabzRmi61sj7zjZ8Dg=;
        b=f1AGOqOyd2OsH+O5Y4ykn+BtrqZJIxCxH1/Qk+3NxoWcGmTL6fLBSb8QCBAl/aeu02
         oyM4K2g5hUFOCfiyAXlnLzKQJgm0FyvArvTArdePPpqJsvcxsBjXil6aX9oTPdx2d8Qa
         9+MkuDRYyvj5UXL94xkfgAE6JFeEtxJ2R5flO4+NtgUhgY2jRkUZcWs2tjLKgtnStvTo
         bsbL4sOOEPrByBQyImHHoBMA8Xu7aVW1Pfa9QH4vPe8DrMNLz7imb/XDvaJ4l/VPGGjE
         51XIujYD03r6RBfR2YRg+V9ip1Jl0I+RP/uwdTiADl+FPo5JYaW/j9qh7q41JYR+d4rt
         zUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115851; x=1784720651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5o9RlxsE2MKhjLVDUh9pAaiwDabzRmi61sj7zjZ8Dg=;
        b=o5WMLJHJ+ARva99QiYX8ZpZAWMdoyREzD1ErJcF+GPrpD75UYlZqOoJvYjm00Vz5Bs
         rMgZl5vKmOx2QunRPjBXqBW1MEiEncgJZBxApL2zYX1NkFfzGDqXYa3MbuEQwwAKZO2/
         GSgkaNzNkqjIw45UKqdTozhEFisNbsTpOWEPhQvy8heWS8XgHJ64koNz4WAWZQhCp1x9
         TqSx2CA9k3F+xpY4J1VjuHbBx030h1ZRUgIvh3Gu+EocrXfzZXFULasTuq7hupNqHJf1
         bE/ufzIer4oicihnh3Ntc9jnWBwBeTZTeWZlVbcKZ2pZJzYduJX5GnYfojCtwLCN3T3h
         pLzw==
X-Forwarded-Encrypted: i=1; AHgh+RoHeaSZdg+oKqKnr2OnicOEgWpNS7UwvGg0hXTpYZmlIq31cvwgiCxrX//XfP4XygIUD+oDlQcbgYzD@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKVkyI9mTVj2MQF0rmdYMGv5vKlouiuoYoPD5kI8eJ7Ph5Hwg
	VoC+N8NXtS9D7945zQ+QeqBHruqChtxbiQWlqM9ggh7JZQuQHbXYFvY/QnksZwbVEK0=
X-Gm-Gg: AfdE7clHV7QU8L5rNjem1P1niIkzWeHocq3pFv3UozHUDSfAYjaaroj1AI+4bqKoOeF
	138iRxmt0ogQd+X/ufa0AhLNxb2iNKUtgTWznuxnshzbHWirAdhgCWTILEWkZ8mENIQKbUI0cU+
	b8mR0uLZZz7wLPgXMK6KxUsUnypLkue2bgXC1MSQ96S/VaK7MY2uPUgFIJuHLVSPHsy6y+EDF/g
	qX80Xdrt9rmaSPFVhrs934f0OxyYcxFIscCuQjXvCpYNKDctwhavIUg7U9LjbRuI3tWZF8wrbbs
	hMqGdMMmruWpctTQpMPBj1Fo3fwxQyDSbIjFRyGGTqbHJWS6RqpkQ5XH3g/AGBPY6JIvpDa55E2
	XeAlMH/B2y94nCOZSaiU8sERvUeJyel4U1K7ZZwRwtQlEIM4l30RAyUFia39RLfKXK2fVEtNMsP
	QGIotDtEYVuPsd53pYd2nuVgot5Szo2APIcJg7/oq2qVwdQhIKlEpjh5wu6UdT4utg4BCPv5xvw
	Wk=
X-Received: by 2002:a05:6000:2004:b0:47a:c103:8a2e with SMTP id ffacd0b85a97d-47f2dce3062mr19855884f8f.45.1784115851121;
        Wed, 15 Jul 2026 04:44:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:10 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:16 +0100
Subject: [PATCH v4 03/21] dt-bindings: media: imx355: Allow 2 CSI2 data
 lane output
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-3-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

The sensor supports output over either 2 or 4 CSI2 data
lanes. The binding only permitted the 4 lane configuration.

Add the 2 lane configuration as an option.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
index 6050d7e7dcfe..d9cdfda699bf 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -50,8 +50,15 @@ properties:
 
         properties:
           data-lanes:
-            minItems: 4
-            maxItems: 4
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
 
         required:
           - link-frequencies

-- 
2.34.1

