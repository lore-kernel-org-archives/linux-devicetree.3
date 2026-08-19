Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DE3822B4
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173095; cv=none; b=djg7LxrTY3BnT4Rn2EzPDjjT4r8llWTdjsfiTwdgIEznGZedfikrUgWxhbw7VnTs1fA8NELa9R1bdlKJapjHNXc7o77T2FYIqANK0/W4Z+Z0F1zE3fQWgVF8apj2wsrhq4/YmG0Adw9a7vc/iOvGdZWWuJqCBy7t+YAsxkAeEss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173095; c=relaxed/simple;
	bh=4yOAcHCi9um0K8UTl3s2TjwG/mb+CyVD7wWEW1YbriM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lij24Eh+PDsI6IjPsol6KeFk4dfIvS2CwzREt8EsEvrfWZD0gxD3GLMgAcP45lrN1pHl1vVj2SH6Qxmhvj+I0ZVa5ux0X7St79lnWtB3zkZFAa5iRJ8SmgcrKEJsECB/nWNpbDx2lGHSGemGcyzH9lLdT033f4XNeyRuRYQ07sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwzrVC2y; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwzrVC2y"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7475a4f8b05so907399137.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787173093; x=1787777893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58Z3XVoKaJQbEkvkG1Y4mEaTnnepGYJ8EOpBbp+pok0=;
        b=PwzrVC2ykJqMgE40Hyig/XgBOkPYDjTnj8dtEm37E1jXxZXNd7sbDbetMUBj6Q1LZ6
         clqwpbGpzlOsGoMperUzIIFmCF22go3RFWBYhrd0SEVc1D5FsdGu6HrC9E1s1LC8zJ4r
         rNfWYVvY1/8Nv9qblWD7HSydOfWx38KVqpHzK4XyLP5ez7rFnvbJIfLnAYYslmCCm87B
         UJAuwr9+LD9sPwNvlvVmz3b3b49rAi5MaATk2E4PGhPzOW6meMMmcZuKyh03hMNN+ZPr
         FExCbUji6kAKFM/6yBlH693pDdsKofwqLRJQdE2iyBWyJCex8dUsegy+uxyumLk3wPX9
         rl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173093; x=1787777893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58Z3XVoKaJQbEkvkG1Y4mEaTnnepGYJ8EOpBbp+pok0=;
        b=ItPtA8LiaK1IL7XojE7WBLu6Liy+IIac47Zcst/Ai16UzdnkFVucPlolJqKhdSA+Xc
         gOWqzUFTL6PVk5CQge9WURCrH3vDq8HEMRQbLk2AiGoG2c1Po1RiaswSqtApChKSYmyA
         4rooYl5Na1i1ybm3g0F/D779lOXRQyd6HE7ayOz6R+vaXB8C2ut2Ed7jtDLr3D/uPgEI
         SBF3XJUV4G9YuvjbYkYZtJus0FbdXReK3NB4lT+oG5JHMsUJa6/N5NNOS7fCXgyZsdJ8
         u2oR+Ogw3N2ExIV0/w2RcLwoczFEV1R7tVMukblYEOr2j5rsX0/wo95mW0odNTb6FG+b
         jhqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr305zfFdk0Qd7cIDAvK2Vb1pHfdO1kaDrFnpNXJLg3HaihDPBVYDfypGUixjgQvfMTmlW/81vbqjgg@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtusOdfWiMYd7THewD9asruAaS1xmfyjG+ZQJWAF3EsL0w3nm
	cFFzZWql/QTib4pEhm2Qs05VX6V0on4t0c11l95P8Mr8iKvHcBmVcOR2
X-Gm-Gg: AR+sD135J7Ng6HvN/by6KLop7GMc1u0uQSAzXG7FR+XnKLIdTl8HPI9GWEphHM/EVr2
	IMywmn2M24BX2SaO6+sNm8x7NfoDZYdFxaQTOh4dPbsEri2yNzcwD6orTeONDhdiWia7i60LRW2
	nFY04aST6zxeOI7l79fNCQjFOmAwJbMQv9TFvr6s9qt71fmat7YsQQ+nn6zgJibqWfbScaar8nS
	uY43QhcnN2ZHcgj5KcYxtx8eZJ76Cq5qp/bDaAiAq8n1hx1x5KyrhctfmNmFX8s0yj2kT5AFBBw
	vdkpjz/NbtFGheZrtG42tU3m4wdf/fKgXv69uypFOThT2xOjVPQMkBGk52euwtrzqFuiOQ6/FR9
	F1/Ul4B7pIacYsN8PvAQX2Mu2NLhNiWPEslfeeir21YOAqcve6wc9qpS6FHL8iSEVW8XDl7BgGf
	VS5O+ujnlybqzC3IRnb6hpDH/k1iOmYXDQd8VQonecF+F8MjN3KQO4sVdKIsxxxf3jwC9gNz3IX
	W7OV3OjlrXYETIeCsFIOMJu6ndEOIwCqgjSVCs/3Xyf
X-Received: by 2002:a05:6102:6ce:b0:738:fd01:5b60 with SMTP id ada2fe7eead31-777f897904amr3350181137.3.1787173092636;
        Wed, 19 Aug 2026 13:58:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:3443:53b2:2e07:b3bf])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777ddc844besm3616259137.11.2026.08.19.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:58:11 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matt@ranostay.sg
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] dt-bindings: iio: proximity: document LIDAR-Lite v3 fallback compatible
Date: Wed, 19 Aug 2026 17:55:18 -0300
Message-ID: <20260819205751.166030-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
References: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PulsedLight was acquired by Garmin, who now sells the LIDAR-Lite v3.
It is pin-compatible with the v2, and the driver already matches it
directly: commit b257c1a45e99 ("iio: pulsedlight-lidar-lite-v2: add
lidar-lite-v3 property") added a "grmn,lidar-lite-v3" of_device_id
entry.

Document it with "pulsedlight,lidar-lite-v2" as a fallback compatible.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
index 491960bb3a0e..dd739319b9eb 100644
--- a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -4,15 +4,15 @@
 $id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Pulsedlight LIDAR-Lite v2 range-finding sensor
+title: Pulsedlight/Garmin LIDAR-Lite range-finding sensors
 
 maintainers:
   - Matt Ranostay <matt@ranostay.sg>
   - Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
 
 description: |
-  This binding covers the I2C interface of the Pulsedlight LIDAR-Lite v2
-  laser rangefinder.
+  This binding covers the I2C interface of the Pulsedlight/Garmin
+  LIDAR-Lite v2 and v3 laser rangefinders.
 
   Besides I2C, the mode control pin can also trigger acquisitions and
   report the measured distance through a PWM signal, without using I2C
@@ -21,12 +21,18 @@ description: |
   remains the active interface, as a plain status output signalling
   when an acquisition has completed.
 
-  Datasheet:
+  Datasheets:
+    https://static.garmin.com/pumac/LIDAR_Lite_v3_Operation_Manual_and_Technical_Specifications.pdf
     https://github.com/PulsedLight3D/LIDAR-Lite-Documentation/blob/master/Docs/LIDAR-Lite-v2-Docs.pdf
 
 properties:
   compatible:
-    const: pulsedlight,lidar-lite-v2
+    oneOf:
+      - items:
+          - enum:
+              - grmn,lidar-lite-v3
+          - const: pulsedlight,lidar-lite-v2
+      - const: pulsedlight,lidar-lite-v2
 
   reg:
     maxItems: 1
@@ -57,7 +63,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         lidar@62 {
-            compatible = "pulsedlight,lidar-lite-v2";
+            compatible = "grmn,lidar-lite-v3", "pulsedlight,lidar-lite-v2";
             reg = <0x62>;
             vdd-supply = <&vdd_5v0>;
         };
-- 
2.48.1

