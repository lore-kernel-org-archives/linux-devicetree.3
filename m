Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095658;
	b=s6YiDpBjSOgVC2x9gN8G2OPjYrDhLHRq30Jc5+lU4QdJU7PfYa3VgREWCqdAVsmoZv7O
	 0dCConvTVQcKZ+jf5lbMS3r0pPAi9mioC1LLz4IKDJ5YQwBCFZRDwE4QI4avfhXOrq4Ed
	 QhLjy43jiw5MeKKsOVyDoV9EHemsuXeNGDTDg2D+IdmMfhz0lYQgR+/86nynkEdplQL8Q
	 EvM6I9oet+Tc6w2wxAwqOQgHolXphx0pnSJYqLm7T7z2xgN/yg5lFoXRC7sB/z2iOzc8C
	 1vf4YxnWvGBr4JA2ExWgky01pf2N4kj8pzTKOz9eKpZSeB5pcqyavJOOd6qBtlY+5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
	b=3jzRgjPjOqI3g9UmX1mT6vlbPm18V4YKVZ9NFlKirT+8Su+SYe05d+R9Xpe3qPMPNttD
	 4eUQVPYJqsdLqKL2c8ziUYWa7dtll1SPd/wOCCHdtndti830SU2N1Jkv6Uo17Avkr/UWp
	 nnPq0+MI56WPrglajtm2CWFzcRgQ/04m+hPMVbq9JHOEkVcGoLn1oDCgnGKCG3jyD5Zoi
	 M7bQh2Db1gVIZce2CchT3fAzk6oQewzaP2BxVaWPBrwC0tglVtGRCrnl7kw7Kyw3aELqB
	 7l1HsC17Y1FgaMzSap7IvIDY0+zvcgCEed5u5tqGKNa9o7JefO++ODHHtwMIyiOyQow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdXZDhHO;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7F5606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdXZDhHO
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2d95c5d81so700339137.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095657; x=1795700457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
        b=rdXZDhHOsEz9CaLUyjruA+CqbJbKEPqMupYrT++jViMeQJVer+/hLdp+EMubbRt/R/
         2hPLO6jmI/DJfw96d0srhIN2GAVfmg6kDVpxKl+wpiGdm5wsYGvpgvo25NI8PjOYHNlF
         9G4v6Lwgnd2w4KxhZWclxwqq3WX7NdSXc518D5PN6EIbwGnbRxpqaFoDD59qentEUiP1
         IoSWZXYYYVJsqxaGYgd+TUEPswKqkT4H6Fv7bLASgh1hXoVhbTTRQKVLVdiVPFhlQekU
         9XLYGZf1mFJmHdRN82BQ/wJHuwP0s+Hr0OE1IgHt9urSwoOdaCxu+nw9jT+exb1x3svG
         OuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095657; x=1795700457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
        b=15CkCka7xdgkEl6GuS7CzsYXorzB+nakIdPHfArtPwCfVtpnTwJ3Ja+9cY5ZiuL9iF
         bj6Rejgct5bLhaRzQA//9k+SaEoum5dyodCulrcLZvj81wKU0mg3wtKJ+G/2RPA781J9
         0+/qKWvfKKqcItF9e3LpjmMKPlMLq0kjjG8BQh/GHAZ+5Y6/KrHHVaeIM95nhjcENQwN
         bbtxIxtmix3h5HihWRa1krYJWu5SvCXv/N/NFz93PvAQ9mueeYcHKvNh0enGH/ZpGLf7
         Nwi+YIdtxGNvVHJODNRMErPB78VUMCNHWXSlcu/dKKL+jtzJDNzNkwITxDmDtJXcdcRd
         3KTw==
X-Forwarded-Encrypted: i=1; AL+hErE5595Z6f+0N1n64QlhH5Uew/2PKuOWLIA5Wzq5XxRNiq6HeUo5MZomDY5s7pgA+J8bUpRY5xFHvr/C@vger.kernel.org
X-Gm-Message-State: APuU4Z/QmUfPUKT6PJYmUpUBnHXVkpL9PJvgkTroo4TTYRCmsZ8Gv7xF
	W6UBjKa7LslYi/g/s7PvHwNyr5w8nhg8OqHZASXNBVfrdASa1zZ5wczV
X-Gm-Gg: AYBFou1HhrXGes6Dts4mL8EHrwv41FEcIu3vrXRlEfXXb6jRxWtXOXnzga8VVD6iyji
	U1o+jVhgxlBiQI4ZOYAL5kmCMAxpH6nFLtrNthLzrHOjUtiLA+RyhBKf2jNU7GfN+AOiu8QVWI2
	7Es/c4OlXNUhynSumz/RyK0Vllwr7FGm4kdG7+JuIq63f2O7iA6HDGtRXM6BrYgvgc1d/f76/c4
	T9dCzwg2MgAuQR1Yohnyh7bEdpG0SOC7UEmsnHxDNDU/Z1bpWbk5t87W++Wk9eyQRoNDBOwxewY
	fhXTQBDo4ul/8FLn0p+99i6H399jBgKtg2Zfm6VC3kO2Hwi/q8M2rkwtpHizUth2DbYIbLf3Bh8
	Z4YjCfCXF1fXWXJSoIFZceYNQE+Y6gqoEWXUOdvVpI8oLOhKBuIZpe/B5Zi/AhQTegXJc0dCerO
	qsQqhlBG3SLp43n2usZ3o1fcI2qM8ivnVLcg2Ld1dpHUU1qeMPTW8n5gnYJwgW2QPr+1P9h6RGS
	VbWecrOd7TWa3zbe6pSKEWHNdqOP36yMuI0WftSSBy/hfUotk1SYYwe4fx78jOkwFtr3WJPu3pP
	WwY7zllfCTAGAYYEXcMACixNCyOOg8EOtvrvrnQIVRtVDUk9zIIG0n42pgmcX/rMDi1gBgodnos
	cS615Kg835Fhemwwty7M=
X-Received: by 2002:a05:6102:578e:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d6db9e66a3mr319517137.25.1795095657332;
        Thu, 19 Nov 2026 05:40:57 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:40:56 -0800 (PST)
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
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Thu, 19 Nov 2026 10:40:38 -0300
Message-ID: <20261119134041.16611-1-festevam@gmail.com>
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
detection and sources 37 through 44 to channels 0 through 7. The DTS
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. The DTS also lists
these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

This change was prepared with assistance from OpenAI Codex, which was
used to compare the binding with the reference manuals, existing DTS,
and driver ordering.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v4:
- None.

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

