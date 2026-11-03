Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746121;
	b=ZEksjpEecum4bHe9IWIiqNQStVsCmqWOqKsBFj5WMiOu4WC62l1+e2ZzvLGlhzC5Up2V
	 dQ45Kw8IefbbEM46Z6yiyC18l+2ky+kOZI3Zd//TigU6JlOoa7kwKZvVs2wyEWb/csw35
	 u69mtEHpyN5cnwavuJRWIEpkwIoo84hvkZzCR7bx9/NM7XKHanza0jAq2SZt177WjXvIO
	 9Y2Zco6FKEch1ifcjh6UVCmFCVqzq4xQm3Mp0wOzdorGDZ88nFiuwHd19wrHti4qmGSf5
	 GMUQ8Di0qSiPSOBgW6vWuwCjOe+X61XYXioYAhJodh4so6hpZWMN3+3gtZJG405rXWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VpueH27K6JlaQKxGbcQGMz0cimxkNE7G18UyqQoWER4=;
	b=Js4uQg3fVIqgn36FMMEuNvOmaoaueIs6CvBxtfke00NREV6t3PYQuofU8LKnuKxl+TOt
	 M7AauKsbOPduhkGRVZM8haJjkQZd21fWN20h5AWYREEjlWvLJrrxEtN6hsK1FlwsZSwK7
	 5HmCvyvOQp5Q/8Aamk17thBcPrMqVZRYU91Th4NlpsbHsJZwHA2kwZcnhncY+OqYjpbp3
	 TrEke0sb/F3Upbwf/rrE14RAV9aMN/l+80um/KUR0PPbSe8rMEYPwIa5/lt5gPQZ2+ouN
	 Cg5XMOOhbj5eY+4edAunHuz5iwGekrRRj2UrdwROKGcS1UT9qFGVHJqFVQi95/gKANw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgJoPKxa;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264AD606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 22:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 264AD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgJoPKxa
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so51921241.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 14:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746119; x=1794350919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpueH27K6JlaQKxGbcQGMz0cimxkNE7G18UyqQoWER4=;
        b=kgJoPKxaGtDS/Pn20I3W2B2NTNB+o/HoDNrTgg5zISByS5lUQkcnkzLoT0TzZRhSEs
         sihvK5C0H1sYC6ILWiCZxGzj22UEHjQ9CHYBy7WNTgxym7QGYgVKgswvQAEUdCMvfChz
         LgflXbiJaoA2dgE1zDPXW+SJJOdJ0mbyWkhAgSiL0b7czX0LrzqtkWvQPdzZZ+9xv2to
         DoP3+P1nXYwMPPpbLzG7QSMN5+kyzqn7L2vaEgY9NMbseBgXnHNQ6ktRmUSb6kaAkv7Y
         MueM2YXflBZe1n30R9MaqT0z3HzhICeKpFTWj+OJdpdpcnQsqPCB/JNSgOtbPe+kDCzA
         Brqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746119; x=1794350919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpueH27K6JlaQKxGbcQGMz0cimxkNE7G18UyqQoWER4=;
        b=1h6jhqEbEjRqY1cqlCdcDCHyIZiIh5KQqmhlAdqNmj4jvNYYXxDuQaOUtLOh1a1UnT
         m6vkuuX++SLmThSymFuY9cczcr+0WWpHAcSNcO66rQNeeCBkMzKHT9teA01wK4hssxtc
         QHBKtHpQo2+rJKDzsAwBjlrP4iDTFiAzY/POMHXv8a6vv9DfGROVbqSsr9wFqJ9jE0bo
         yXuiexJdygs0J92b5eXHh78UJv8XhZZm4FvZQXYD+wpMoIVwkBr2tkqKPZihNJH0nAKx
         59hOVYyOh6XVoq1Se5Mg4cM6KsrdDsoPaXVkROCmgcfIliOUG8VDgq8YyvmlXPx7zxFz
         NjOA==
X-Forwarded-Encrypted: i=1; AKwUvByZNa3YZ900tdSDI9kXGKfS747aWUbxiH9B0Zqx1QFTJ7vyLLp0UJph4vil3ZOJWD2bvLNXX4SwLEqp@vger.kernel.org
X-Gm-Message-State: APuU4Z+xI3MRHj6c5GflTIrfnp/m3CI01dZZg4CPV2Mm8OaD+kYlShax
	67YJn1TmmHYl8aMXvZsYCJeKrHVCKF9CdIAAiz0B3rViFMQV2t9jxafX
X-Gm-Gg: AYBFou2UdDUkBNiXkULeg6DemGYNYKNRyQ866oyLqRpaFEGmPKzeoa7SlU0jjvMd0j9
	1z/OGzn3S3MtaYGETQvAQ4bUfPdy5leVSqzrG4ZntHAvGv5StjIXJ60glQjWO8HFayTbRtP1g1R
	OOda/kDqdDKA9ajbtQGCTqqycu2T1ujvgpbRSsUOKf96yiLduAz9CBPU92BUbqEbIupoLo3D/rK
	t5Mz+n6dFm5EZnCgUv2TiudGbeSqN6hNTTGudLBt+v/2bqCNshsP0EX1EFSSv6v48yLZv2arj0L
	aJQNIw8ONNJsVST34pXauBmZDV0K8BAWwLwOpT0SaSQSndcVQWITg9igEJUusgqNgoXJwjP+jJT
	likBr2/Iz9nr17leEY38Bhvc7sSiTv0fEOeDeqYkCcbE3/Lcr85U3Jc1UM5iOKdXdBA13Np/oQ5
	gbug8M/7k6xAenS9PiATNb2XKx18RZ03wYRtyLLRPiPMmgdw/Dz+nu+dFB4pmAMyuwE0UGtzdMW
	qG0Eg68ggQKK/1jWyVXZFTCBIdGf868lptasXPOVXt6L87vYny3vmlNzQz0rAnhS7S7q/qD/XQ5
	s0YHzCKo5CZrCFbFdduFG71cImvObKm4RS5BlpKmX7ksvWVmBOFRtJQDzkWYgw0WaJDM1Qnqccz
	dU3B6pRedn1ZmM0B/hXmsdVU=
X-Received: by 2002:a05:6102:160e:b0:7cb:bbcc:e4e with SMTP id ada2fe7eead31-7d07271116bmr5937597137.23.1793746118899;
        Tue, 03 Nov 2026 14:48:38 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a802:6062:72c1:c30a:87cd:60c1])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d69af4fcsm401286241.2.2026.11.03.14.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:48:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: p.zabel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	luca.ceresoli@bootlin.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: display: imx: Document fsl,pcr
Date: Tue,  3 Nov 2026 19:48:30 -0300
Message-ID: <20261103224830.377009-1-festevam@gmail.com>
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

Some i.MX25 and i.MX27 devicetree display nodes contain fsl,pcr, but
this property is not documented. As a result, dt-core.yaml reports
its raw bytes as an invalid property:

imx27-phytec-phycard-s-rdk.dtb: display: fsl,pcr: b'\xf0\xc8\x80\x80' is
not of type 'object', 'integer', 'array', 'boolean', 'null'

Document fsl,pcr.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
With this change applied, imx_v4_v5_defconfig builds with zero dt-schema
warnings.

 .../devicetree/bindings/display/imx/fsl,imx-lcdc.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
index 84610b5690c4..f1931436a4d8 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
@@ -65,6 +65,12 @@ properties:
     description:
       LCDC Sharp Configuration Register value.
 
+  fsl,pcr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      LCDC Panel Configuration Register value used in the display node
+      referenced by the display property.
+
 allOf:
   - if:
       properties:
-- 
2.43.0

