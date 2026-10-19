Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23813573F2B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420119; cv=none; b=NwexFv6c1EbcING7hkitaFNHhxcBZqINvsl+VEMfp2cQmkNmTucazTJapBPNCIxBObYzw1oXtd4FYER6kAHF14UlCOOZeRMOka9doqnYhyrm9KjvPn6p/FWXHEaEMIODvrU21UmIWf5dcHxM4/KLIKHmpf7TCUGyPIV4lDELraY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420119; c=relaxed/simple;
	bh=LjEmyleO79NM8uWuMzakkcA0rXksukeE3zemrxG3uqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdqyvXU0GJ8iC3fSalsSub1ui2VJ8fkL1B2TxyoGvJjBcAaEhzVMkDNThvFYYBwLctpvdvCFThQvmjqeFQz6/puIpOEu/vA2Ev2eWVmpRhEf93AU9YCvS9YSm4Ujb6kSmGqQJwGC0v1Cu5w7Up1S1glsh3xiWdRqKUcQWlyahZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OAWKpFV5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OAWKpFV5"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48de72fc832so1647978f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420114; x=1793024914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+bUFEmLPS4/TdrbxhIqdaZX2ZeBKuPS+ZYgOUoKgys=;
        b=OAWKpFV5fC7ITiG9MvCp7m8hAUvR6iIf8XDBT6fTbnpv9nsuRp/3QHN+fCud85tnjL
         eWeZ9WOulfA1Ci9iIinYt3ISS4MbPBYUE5RMgyRdsudoLZrn/rPeYpktjycouz6cNQ6n
         lWAcjEl7OFHW3admBjuB6DxYuUDvlqV6RfrMGKFdPGlh0E1qLqZez6aJ32RM82IraQmV
         TfpGI+PSsHmbc8rHQ8ycMubd6F4wshjUE7Uei74ZoYMrHuY4J9zzuauYp25xz8LCFgFy
         KrVimdBoUKIOb3vixoZmwy+sTUrqPHTmkgcdx0T4+dn2a44eSyjggYRk1uIw0JFsPflZ
         idtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420114; x=1793024914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+bUFEmLPS4/TdrbxhIqdaZX2ZeBKuPS+ZYgOUoKgys=;
        b=wfxljxKVaoEJjad+L8RfZL5kbNN2CDagVDIFXUJ07uCym854uzW+JZIgeGAlVY7rYF
         uuitpJJQ5F8iJzR9eY7Uu7iLIprdGK8/mD7NVEPozdGP1AfgsPHGVgQ1lQfiM7XBpsMo
         fqjaelacoEu4zxQJv26KFezn9p7HXfnNNzhVFRcmuTYRZR+Q8Z93nZVzxu7ghDCdUALZ
         cSDxxKFnjrCixWGninoHkrjon3uNG7eKaaDe6yWobn3hzr4J6NfdG6dV4ji86kZcWS0i
         sYmBSzqs7WqAUiwPBnafejehW/ciIGs1tYSDm8Jtr3Dhp9542pTcRKwWEDJVex+YT4f4
         viAw==
X-Forwarded-Encrypted: i=1; AKwUvBxUkHN4NL+DxpLaSSfx2kz8MF718RH4m7ngGXSsPPIPOILLrGtI0VNq5dLTW1Qka1BdjhNZfVm5fdnW@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ/T499zKQ95Ysh+SQhZTMJxJZFQ8dEAiv0nscbNlX7sL4Cgfw
	ltZPY1raUP3u9KvG1n6nRRczYoKu3iuAe4Jy3c5gedu50xhon9RwNShDXD1lrDuP860=
X-Gm-Gg: AYBFou3h583Ts8rXMjJHBLBQY7O9nToitgiCmL2z9a0LWRpU+J647hkkLFlOXMkxrrY
	d411f9prFE4B2zjfC/cXswnwEA9sgZnYwv53qIXzKxKSOpJ2taKSTsdFxoi+y0a4rkyQTf1FbVy
	XdIjWsZzGo7kxk8E0Mj1PM9FkeatA7Est+DuQ+xv09BLC+35UpqlPN/6b+2B52kgNVNlSDZEltz
	gdzVSXEn+rKX9mSx8BJindUv6K5H6YbkgbGNuqyIpnxsNxhtoZyEYIzUso4EPNt31itXh+SQxrq
	91E4fwIBAreGaKEDhAvmeoDsnVyX0veycGUjJRJTb5RAHyClbEQwj4JdGW8XC2L9501XUaw83kx
	qOxp+K4hBIks6jJXooCO+6tVf7FW5/1lqd7Z1nYaVEfC3obx98AiHJJIMW7mvtfQHh/ZOM+dkfC
	5Q0sa7w/2LEtGu9zsK6UrsXZuaK3eDJVP5OuXR7U4ZZmS6fvPp0YFbfF3ji0/EWPvq/xWeBW6nb
	s1XC2S1471ye7rJzkenVsZrxCW3JiNWDPBalb/5UEUv7AreUA==
X-Received: by 2002:a05:6000:c4c:b0:488:8384:c382 with SMTP id ffacd0b85a97d-48e07fb36a8mr11991206f8f.49.1792420114082;
        Mon, 19 Oct 2026 07:28:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:17 +0100
Subject: [PATCH v5 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-10-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..027872a134f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
@@ -13,21 +13,47 @@ maintainers:
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
   image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  It is part of the Starvis 2 family of sensors.
+  Other members of the Starvis 2 have the same hardware requirements, and
+  therefore share this binding.
 
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

