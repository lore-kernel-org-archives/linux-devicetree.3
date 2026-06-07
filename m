Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D322773D3
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845628; cv=none; b=rzUHSkNJaekRpkSyhjBASMmqVDhp9dLNH/4iT9n3n2JXOndNMulJAL2BypxJM1+89hWgiFbQ9HekeXH4U5sUqOQX+OvpyHHkSaWracNQ7SWJ7lOwtzwvGos+9CMSDSCCOYbS+wQj2jGAKqSXbSNxrdlGDo+XEoBD5nfVIsRgq64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845628; c=relaxed/simple;
	bh=tqRyoaZBs1tvjQrY9z9TFd/uxGf92frpQLPL1VyfqU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+s7nVmyNMtUE3q7SB0ZLdMx1FQ7oDMxNwOKJ6HrBekX73D3nwo3yF1q2ju+O/KCdnl4bEgwWJo0+z+tF0cg8sUPBOFIiGhxCp73AQwgG1x6p2tG26nH1RqVsxmXCEdY86b2sXC0i0JSD8j9MyYJmUSRZw7oAV1sPuWdDKnnH64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hyqp46Oq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hyqp46Oq"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so2219226a91.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845627; x=1781450427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=Hyqp46Oq8KWqJXrSwPUWUb3qxVpg3GcXChKeASFd/c4MoO/YA2KVjGhmXIXsugneVT
         2V8IN9ZhUAAnMAGWn2/hd1TWIxww2nW9e9uwMgrCegtOmKVudokQ2MdfLPcjFqO23wrX
         1wU1qo7up56vqjcrs48TUFnC6zAabKWNL6a9o3bhs9Y5FQPdHE7arH4l2usUvqbFZIYM
         DNfk0PMiAx14aAYk0HN/VvI8fFxUHX/PLn9I+Pd0oygrJX4dCfgKD/JQNdezv1CHXfWl
         JDS16dtqzzV6u7bKMBJrg4DAY0EPNHvEHb0eV2HMi4UlmoGkOqYtKpuuWCmGg1EgzdNc
         lxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845627; x=1781450427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=qOH5jy4yR+BjH3sHM+Hhl4Sa+h52BgDJ+TPkYulLIN87Qk5OmJJ5/jFyAPcLRIEebj
         GDS6Qrh2WP5nYIuEvog7+QZzV5SD8fJpYeWDPiSTmTvZxQPLUfm5bl+XPpN6KepP/Abp
         456XfCr190edlZJFoUCiTF//l0fmeyyevI9dRBKAdO6cM0Vlv0hROSn21NBvqGvsP9tI
         G7rOyRhMPDyAUKixT3LjpmOU641CQmv3dIp7zhap1QqpGR8YVZLxnevVCHN1MgpyD65c
         JRUaNHi2E/axzfvSh3CGXtXOBIJ/OYLJBf4jNf02QNS5umw62QR1nY6oxYySmMJ2BEYQ
         sa2A==
X-Forwarded-Encrypted: i=1; AFNElJ8yX8kp6z+brn6vLO7oB0FVHD2JeCDmkWo96yo0Ck4HHzPTUPjERyozgW5HQptbElnpaJ46nrL/Dj5Z@vger.kernel.org
X-Gm-Message-State: AOJu0YweMEn2iJEyWtF1ZEvJvNnvi9AkuIxsvOJkZTHMFaNM7UcPoHC9
	5gx20zq2wHY3sC3ctuzPUvjUE5cPOjmnmNO1yzpn3sMd5glAjO4noUng
X-Gm-Gg: Acq92OEkttbYDydh6RBoUDg/SVM6v4tZVlaikA9lMhSbDinf6tNZrq9EhsBsEToLyBA
	BcQivZWYOdgsQS95XunzikTKPW3O1zUe0KG/zQTtCTGv17A7g2qx13nsvX1pPWvFI/RqGyQqbdl
	su8WKs+aHCoSLtrO1P7UfaMBuh9bkmQ/H9En8fcnEP9GWQgcgijUa+O/POfUGZx21AomMjOVEG9
	l6Z33YqyzlafsSF0huBBgU5iLxTk5Z7Ugzz6arGtre8HZTpXL0nC8u3EnyZGMcG7gsyA1BaJ+45
	bd4nCGm/DRmuRYA7gC4VZq+kjTu/Y24hMVQ5/ObTZmKYKMfgpz1CXes+Jus1tUbkrAomNLuDx8+
	zJgRc3387rTwDp2znwx5obJ6ixyYinYWUmy6/DBo6y8hGztbmslzql8zkBIx/nmNhjQTeR/dYbv
	FDjOCvWXaihGKYFg+j9aSp0Yh1j1HziVQZtKBcpjHVATNJNrRkPHZcPxNJbyT+
X-Received: by 2002:a17:90b:58e7:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-370f0e4ad33mr14187674a91.19.1780845626785;
        Sun, 07 Jun 2026 08:20:26 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v8 2/6] dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
Date: Sun,  7 Jun 2026 23:19:58 +0800
Message-ID: <20260607152002.446617-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/leds/issi,is31fl32xx.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
index 81f1e30e493d..5f22d8b77edd 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
-- 
2.54.0

