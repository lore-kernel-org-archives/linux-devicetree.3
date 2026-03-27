Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04512D94B5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774599860; cv=none; b=BEVFeoC/3HEv7IuhXhBStd5fWXyg1BhIForacGe3YFL7wEibNYxzE82+4ZR/RwYN4FTyq1ZYzIaDPKvzRzQhbD7E5+i1bLqfbI/JhWGncTpRnvF54s3dYjRl9PslZvblpnTbl1Ff8IUob7mn+hq6FIE0Mb8DIQUVRLx94zKNukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774599860; c=relaxed/simple;
	bh=KRUttOIODVPXBHv9YeHki9lyXGP53WyR4SQZrB2TZUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1Gkam5+VkDjAbfnUdLfTZxQGZoD0Ap4kkKtdWNfkuwcpV259czubHHxE7AkGGylss0UOk429QL5C93wyAff1tdO9YR5+x6lf3H0pKxc8a3TDltvlaVyhqGOxxn6I6oTtG/kEWclZpGsdZ+K6b+TQp2gwyXp4ZhxNQy/9oDQwVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLRGwPaT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLRGwPaT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso1847925f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774599854; x=1775204654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYmoxyOBGhgLVbC6Ge6rqLCdVAJQp/GoqInNJcSR/lk=;
        b=sLRGwPaTrd//mAfg6dW+JPUvduXERip8gsqSxQdnQGjEKKBFo0PfxQCJSeIyWpkdYb
         IgjpYOpd5Bh11DhZ9CRT1toJLr0eobI1FVDMPb3gKHAzy9ysgMj4dl5Hwc4kl7HUokCC
         eJBF3nI9Pxcb9fAJDDkdKZTYy4dwMakRul9FVB3pnCjLFifPvYrpX+yau8Q9iX1G3okm
         Eal8GdqUCM0qbfYzlpeD45kzy6+FQaAbm94KWK0JKli02/cKQfglx837/ycKN2ENf+Yc
         cMDOSSPN+mvrZkOf1B/Gn1rZ4E3MM36ECev1aAT4tSnJWZQVDrj5wDLbF4/mwvlPWYlm
         Xmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774599854; x=1775204654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYmoxyOBGhgLVbC6Ge6rqLCdVAJQp/GoqInNJcSR/lk=;
        b=Q24XcQnIxbrpG7YkoZXZYQbC1CKyB78Bo7v5IrrdHFiI0Noo1NyPps0v1V/NxmEIYn
         K30rLOoC3i6podFmlPy68MCPJQJeGV/vAbQaoaUMUtuegUHOWc6ZfJHuNdBCQ6io+YN9
         dofu/ivon42EANFOYOwlSjyyZIxSthhsT25p8wg/qy8Ez8g3PgLPZ1QkuIkNU1ok/tIa
         stdS239p4vjd6fMkWREgy4rOsBPJr5KlsbDd7VtO9sJQXsTarOWyfy+G5rrWCnGKUP59
         ra5tuMH5IUkkK62M/WZfLvaO/D82jS+IVrSOh+pc93lmD1/EnRmjI0Xzp7o6xZE9a3EM
         laLg==
X-Forwarded-Encrypted: i=1; AJvYcCWYUXnfSw/TkR+S9sRMxZba8iEKAPtyhLvLhV7c3Z6za8NC5p1SOTso+ZD+nK0+9rvB39gRDXDoCQtF@vger.kernel.org
X-Gm-Message-State: AOJu0YwzzEqdkgHXdvqzPDBZSuPEEwkEXcY1fWdB5/ht1WXm5Q0SYtMt
	B+VAt7h8lQ64kv8LWFLVCJEsG4lqYYIIk9e4zl6otNmtT7saa6RVBmk=
X-Gm-Gg: ATEYQzzyQz1dFqvvR1ZTRPxyA/lj8REFI1DXFIjUxwsO81yWaHclGxJq5N/LjIX3dD6
	X8RmyBcwxhMW9ukdaN6ZQz05DVeBT5GxVQDZA4yST35NJZFRSuna41vFCPDsgtg01v4SbtQaBJb
	bm5njhpx1JHLuxea8hRpLFpi0kXK+c6i0dKb2KS+XSaoZ8lfV/PaeLtuzRtoMiguWGhVs6Kkd3o
	q2MzLhEUHQseEj/Mzs3VBlyAQBY6sjrI7iYRIR4t2anuPYrv+EhLICsZi8gg0QMlGLxJupeh++B
	uNJslk47m8h6r/JJsXGgv6EX7MxnL7gtCKUmmkagYXC4FfP6SgjHMe+OGL0V4pPSglBuvguxfim
	E2KOt7rtcxQ7v6Iyu9jU7YOwlUZX6pkg/QWTvev4IYg3XLnDpqQW4fFH1r7q1/EWtjIFupMl5Hp
	2aWCy2NcP2pSeg+pcGpF9zwdh30+bSoPMixK+R+XHc
X-Received: by 2002:a05:6000:4287:b0:43b:4e32:c28d with SMTP id ffacd0b85a97d-43b9e9e8f1emr2355811f8f.20.1774599853449;
        Fri, 27 Mar 2026 01:24:13 -0700 (PDT)
Received: from localhost.localdomain ([78.240.68.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm13439147f8f.37.2026.03.27.01.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:24:12 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: andreas@kemnade.info
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v2] dt-bindings: mfd: twl: Reference converted schemas for subnodes
Date: Fri, 27 Mar 2026 09:23:50 +0100
Message-ID: <20260327082350.20573-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that all TWL subnode bindings (audio, keypad, twl4030-usb, gpio,
usb-comparator) have been converted and merged into mainline, update the
parent ti,twl.yaml to properly reference them via $ref.

Replace the inline compatible definitions with $ref to the appropriate
schemas and unevaluatedProperties: false, matching the pattern already
used by the madc, gpadc, and charger subnodes.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
Changes in v2:
- Drop "YAML" from subject and commit message
- Remove incorrect claim that subnode properties were not being validated

 .../devicetree/bindings/mfd/ti,twl.yaml       | 50 ++++---------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
index 9cc3e4721612..a3af8e717ec7 100644
--- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
@@ -265,47 +265,23 @@ properties:

   audio:
     type: object
-    additionalProperties: true
-
-    properties:
-      compatible:
-        const: ti,twl4030-audio
-
-    required:
-      - compatible
+    $ref: /schemas/sound/ti,twl4030-audio.yaml
+    unevaluatedProperties: false

   keypad:
     type: object
-    additionalProperties: true
-
-    properties:
-      compatible:
-        const: ti,twl4030-keypad
-
-    required:
-      - compatible
+    $ref: /schemas/input/ti,twl4030-keypad.yaml
+    unevaluatedProperties: false

   twl4030-usb:
     type: object
-    additionalProperties: true
-
-    properties:
-      compatible:
-        const: ti,twl4030-usb
-
-    required:
-      - compatible
+    $ref: /schemas/usb/ti,twl4030-usb.yaml
+    unevaluatedProperties: false

   gpio:
     type: object
-    additionalProperties: true
-
-    properties:
-      compatible:
-        const: ti,twl4030-gpio
-
-    required:
-      - compatible
+    $ref: /schemas/gpio/ti,twl4030-gpio.yaml
+    unevaluatedProperties: false

   power:
     type: object
@@ -371,14 +347,8 @@ properties:

   usb-comparator:
     type: object
-    additionalProperties: true
-
-    properties:
-      compatible:
-        const: ti,twl6030-usb
-
-    required:
-      - compatible
+    $ref: /schemas/usb/ti,twl6030-usb.yaml
+    unevaluatedProperties: false

   pwm:
     type: object
--
2.47.3

