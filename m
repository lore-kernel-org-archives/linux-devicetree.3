Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047319;
	b=b8mEQ6j2fs6eio4n0jipbnl5N+vd9iv4LNB3/4MxeMwORTrItR6cvOUcJz+Q1j7d/zyT
	 1Rkqpb6RgP5p7BhGwlo8OdBE15mw4a7ZH3KmZKoGBZRQySNVUVail/dT6qFY5RMb+BKlO
	 SQ8bo1uEvE51kXRrbL0v1Hx7+6H2DZxL/LfFOtUtdb9y3zXRZbi+1+OZH7iJRi8krDL/t
	 GKAQ+xH5nl33n4W+4gVi5tJaoP2SizMQMsz5gUtTtgo85dr/o8Y1+t6GoKpLmlC/DN5jK
	 6TWU12HerCCiUtrH7gVwlrH++TBvlXseytO67VIjruohDbZIFQ9wx8HxNk0hX0qAQfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
	b=ZfOQqmRdie2uCxnK6tMjuWKV8mDUvmoM36BN17TpZeaXgatZDn2V7Z0vJwnbsrinAfhE
	 Xao/I8bxl/dpCKhdu0ox5usTwwhe2qgDsS2I+eqAOB9J75aRazly/4FWVOVL9igKLgpFZ
	 DjhFOICFM/NuGwjDkbOMZA5kAKeFW06aIbee+VXweqjoO3WOrNpEagiu4SocQFAs7x83v
	 lXmSpdZmVV8HOnizB4U3Vj79aDcTHX34IOj2cRjRUGxtUQBrHytvaf1aSGsd517k8w5b3
	 8CKqFJvYwdKbctoif2Wo9B/6OekS83CMrk3ZG7MCxTU0x+z6+qExuq3iDc02JpL7Fow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeGzgw3o;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFA3606A326
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 20:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFA3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeGzgw3o
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b042c0728so942938f8f.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047317; x=1793652117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=UeGzgw3oKj1+ar5nKLRK1O/jDI0bzDmuGoNYiHwFimUmmwxSkxH7UMv0x4tfGyka8/
         aC8ne+vIpoijlMr6SfGjUEPf00hxtbGJ+hNl1HRmeRQpwMFCgvj36qQup19O0OkFldin
         roKQnHtDayITfy3yYbgQPMvf92RZ+rEKQFWf792wT6MJZkI2f9+QsaYeicYaH1EXNIGC
         1Q26GoO1AJt5n9itbQ87kgiYBv6XRFvl/vkagTs9U/WChlRHULgDCjcyx6injwhrXTox
         e5lXb3/4p3cYopGTfV9tQMUkGm/RpW5E3sd34nNgW0lMmhBz7REqzbDbz4Ou/+13FPKu
         EhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047317; x=1793652117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=gZMLJZ4uqEXnd69DdD7OmBSzQCBJgFnaUx6dOQTP9/wBCDLcu1kw+ciDeWc3fxNNwY
         bgvY0D/hrX/rfOVrWIcOXJBPRQpUe6AtO9LPqQ7rWVGZnjRD+UwWfGeKG4MDg4jZj7si
         IMn93wZGDRv0w+XlYtd/NaiiJJ7BUUENPYlQ3y4Nc3e/L7Z4RdmfCrqmeKGdjK77Js/7
         1oh0Q46kCx2Jt6jmU2JlXsjlGKYppAl0RuCTC6aGELyEJ+5X68iHbdfaEaXvhkxEBwuD
         0ylBzj7et4YxGwoZINiYC+CRlMmEHW/9m8vSPy0DrJkg8TUd+PWXw/beKyjU0x4VGO+W
         78AQ==
X-Forwarded-Encrypted: i=1; AKwUvByqu0nFR2f19B+zpm4B8602rsuRWKg9t7KySVyu98J+qMr5TGF8nk5Wp0zkYiE1IAWO1WKAa4cPfPxv@vger.kernel.org
X-Gm-Message-State: AFq9FYIPmLW+zGx/y2p07AOupO+8DYNHsIIJxvEjeYvrf+9UJP9xGuLR
	2lRtU9VvOz/HrnKgDo8jd/Fmoc5LBglIZstgFHf3EciMo7NfhloZ0p/+GTl/o5lN
X-Gm-Gg: AYBFou0BL9TUpWoU+aB3KyCdzhr70QpI0AXz/Y3Vh6yDfJAEDe1/bpj2YVyrO/tq4Yh
	yDrkjdbwrhpv9pHbmrgt5rrTR1/qFfMRlLJhK6FWH1krbVZo5sSLFD5iJ1umCdozCSlXOY9XM2I
	h86GcRRk19rnb0L8Qbj3fLEUJvZqKafubDM25+C1Rper8GjyqGskRN7Mhzmhhi7tC6KTA5o3XtH
	Hncv48EqCioxUj+LWBux6prCFvzWqnSEJ+DNhqW4m9u5eUQsGlIBVJIYyuxLJt3QBtJlrc1ci6k
	qGM9df6Bd/XeOtpNtICofpvibrMV+ELyrqbBWhG7NiL5H4ri68PQGO7nYKIPZJS2jihfrZPr+lH
	6nV7+qSTBgg3OcG4q3tM3lGZKe76Scc8z2gU4jGFv2Jp4effzCTQKPRqP6pRHABVJge16QGhM22
	BXH88MPLxMNNtabl5EHpMegxWIU9DVSVEA8X3jzalDFLlcpg5BUZdNPjNr0eGatP//2cHGP6SSM
	fPA2OChbN6P2n20M2jkCG21x8QCfBdnVKbSxv3x38UiKJvYarCaYpxTkA0x1JOSRHVG2knGIthA
	FqKLPx75LN9Z6E8qAgbf0Fg2363hVxrV72p6yb7N8Qzz/GcA7I5jqpeb4os1ATe6PS1bDAGMiY9
	iBJ1BRPgOn9PNEl9AP76sh6sGMYw2+tlsMf4dkeiDPC/4KQryrncF0jawUqF/EG+auZtmxTqmjt
	wgtwJK
X-Received: by 2002:a05:6000:41cd:b0:48e:d36:59 with SMTP id ffacd0b85a97d-48e3eba9916mr13011096f8f.57.1793047317271;
        Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:56 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:53 +0100
Message-ID: <20261026204154.26378-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
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

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)

