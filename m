Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690483;
	b=QWlaCsO8aH8NEp+jU4yDBOfu4yDT+upc62UoiaUCWMufiGHLyjFowpYw1eFsoS6fDU1Y
	 mF5NafZv7/Dh3+TDmbREEl0+3IY3foTPS0+ruuVcjj8clsDDFbu5CsxUjj1bE8dO/YKqR
	 E914kJNOdXK1Dr+BG5pmRrp+wsZ+IaYZNTHLbbChR27g4ijo8k0pqsObLf/H8TQ2l9SMO
	 TJtyFslg4Z/3hkPYW+TT1zmteuGeoG465xXwdYgTNSe0jGv3hOSUzfppl7HnJbEyJEeyL
	 +hq4DUgKAQZ4PSiqrQhESILWsmjkNBTeH5v+DUpuNUckzEvgBLSaacAEBh1NTW2WRuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
	b=DZAKoNki7uwMP0G2t77k4MKvU1UBqO3XgfahwLfYsUO8GKoYhI8+LjjMSwLTp3y/Ux4c
	 CzAkfRxGnnxHWCzZNshV87JJvWVGoFCoOxs0WXv0cyk6xbweMcu+eaNr92OA/RfldjIdC
	 UZk885ZokoW2g1K/lElgAs/PQCEOcghI+g5ts4FhAaC58jGOzh1WbYGyLj8NKdL/ptSsr
	 VliKwUj1h7RF/GG2689ulzXy80+mNL+AuXD4UW2mxI7isAedAw/WRM2vIThUNEJ9p/L+c
	 TMaiJ5SKFeTJLR2/518h/LUq5M5iPWQQZJwLoKK6AzC2ub9mW2TFpNCM3HcTNcbijSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=sI4LJ6Qy;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE61E60A2606
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE61E60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=sI4LJ6Qy
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48bbb06e746so15607f8f.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690478; x=1793295278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=sI4LJ6Qy6KS4Az06HsbqBPQPTZ9D3YzEPneAJpoUA0iIU5b/KZFk2B4UmBnfVKtDbT
         1mM9wrXIIbFzjQwUFRTINUd9I+DNl4tERFkhjJAAC8FT/IQALLB020FaiOlnmYdDtW/P
         9mL/0s/jsfzcWne8j0egSHgXLv+klEc2kK7hqYuvF/khOZtrc83J3wO6JsYYl4SuYGsY
         ZNBluYNppvHG2gl4Bq7h7m/oJGbSnWVBDXsM/NhHrbxSZ2rhpWNL+wv83wVYG2z1lFue
         RKfRkYzgkOJQn10QbuYCWdLQDliSLaxXndaPcwWg/81+XK3mJ/OcWLKlJXQKb+HrkvmE
         ayUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690478; x=1793295278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=clL2IFYgaLUZd5QhYfpxBeBORi/82fBkNR17T7ALxsGnUTEw0yBzvCt4/Zd8cPDMXK
         H6zavVsM4F7SjidYyedJxsSqJWlO3cUicoFZ1G6rLBLbhxLYldPvjP3/dp0xjk23o28a
         vE914EJ0GL9y95BdzfI/lxY0SFNgcWdFWDaV+64gvbj/xMygxImZIqt4TtBNyuLYNeht
         Fsix3Q9bq7NUinh+KGSLrMC+Q7mtOTgUMlcQnElCYXXE0YjvTyfl/2UWvSvKUCW6q68Y
         B74jZisa1PhblSdnlL2sq84aiDNnEb52JIzYk5YjjJCBuLQMT8ZMUHoyUsIcdGPzIhtK
         wxOA==
X-Forwarded-Encrypted: i=1; AKwUvBziJ8iXngQugeRQrc3qhs3KTZROXXh/t8UCG/bsN9x7IRZbxf5uEthjgpDCABnOpJhgoyVMlkUXOzU0@vger.kernel.org
X-Gm-Message-State: AFq9FYIS/vviSDSRklWevWWxKJ96ZzOt2l87BsHW+5MR3hWs7EnkZye1
	IvBh3hD1QSZ8aCNxutfofDZsbgeSVlxYOq1jk2p6sJcjPUnrV7LewxBE5hNiwOgQ1xg=
X-Gm-Gg: AYBFou3a4kLIJUiUY7xzYFVkyGrNXrvoETtGs+27nC2kRcPoIlEtsJiT+RE6HnmpL/a
	RecWJD0t8UHWzD/WGCEHx/Y6Xvoz3eZN3H/uoFrEIhegzoPs830G5MWQn6B+YAJo4QUwNMLzIJW
	jEAXrabbLt5cRlYadtFnLFX6Ye0sDEbni6YV1JVO2PdrKQ11EveW4PrSEclCN3dIvpIu0fLwzzI
	3CT3Q/KwmkG/BDmfOxrINNc27R1yYe4RecJwuIokq4Q/2o/Pw90lQn7RoyzO+28d6UZPyeStuIS
	NPgjsMzPzaPDNCA0BI+k9vaYg7P+X2CIs9VDKjU7D1T+/ecsb0a9NSUNGFXCseSk19soEjkAT5/
	/L4WOgP2xvmb1fM3u1eeIev3dWhuhmOKQMyrPZyVorA7MNe6uTTZYXaQvga5W2y06K8N+kfpvup
	f/6nwaTfWWM6ZaodGqKusAhWeJKJrz+hmANkjhfYgMLtvecktC/JlgxMecshQhRh3ePo5kJAXB9
	SNY/npczWNMlupZbsH1BgQ9zwufi4l606j+Db4alhiGXoHCd4dsHxTO7Ofb62immkQxHvX0ufgf
	CYEVol5Qm5U3eyAIMeRPDwY/HFk2tos=
X-Received: by 2002:a5d:6e8b:0:b0:48a:f404:695e with SMTP id ffacd0b85a97d-48e2650e290mr8989325f8f.50.1792690478409;
        Thu, 22 Oct 2026 10:34:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:03 +0100
Subject: [PATCH v6 10/18] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-media-starvis2-v6-10-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 44 ++++++++++++++++++----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..0115f7b00d5f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,29 +5,59 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
 
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
-  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels,
+  and part of the Starvis 2 family of sensors. Other members of the Starvis 2
+  have the same hardware requirements, and therefore share this binding.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sony,imx678-aamr
-          - sony,imx678-aaqr
-      - const: sony,imx678
+    oneOf:
+      - items:
+          - enum:
+              - sony,imx585-aamj
+              - sony,imx585-aaqj
+          - const: sony,imx585
+      - items:
+          - enum:
+              - sony,imx662-aamr
+              - sony,imx662-aaqr
+          - const: sony,imx662
+      - items:
+          - enum:
+              - sony,imx675-aamr
+              - sony,imx675-aaqr
+          - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx676-aamr
+              - sony,imx676-aacr
+          - const: sony,imx676
+      - items:
+          - enum:
+              - sony,imx678-aamr
+              - sony,imx678-aaqr
+          - const: sony,imx678
+      - items:
+          - enum:
+              - sony,imx832-amr
+              - sony,imx832-aqr
+          - const: sony,imx832
+
     description:
       The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
       variant (IMX678-AAMR). The variant-specific compatible describes the
       exact sensor variant, with the generic IMX678 compatible as a fallback.
+      The same applies for the other sensors in the family.
 
   reg:
     maxItems: 1

-- 
2.34.1

