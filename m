Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E5D3A4505
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432259; cv=none; b=Oy43LtC1W4mrTt3N+Ep3b/Ml0Y2YZtA4wRllLnOzisfHDRZtvCb/EKsj5H0AjzOWWn2EeZX1Le8MnGtqjAUP3ZZZfrCRB0FXMgfuCVqw1SJZnxYu3Lw0VD4oyB0Wys+kNaqbqdGzsEmNISiXCXDrI4KrAwv1MEfZvz3mTnU82gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432259; c=relaxed/simple;
	bh=00stqMDSLC8zHkq6vuvmGRmlLz7NFbDhqHtOZK7Au68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAgo6pl5pcPic3+JR29rNb0X+flHsp6Da5MGwimr6nOPWkmTHasNKfvYlewHi0VrdbzBZQrN2FrP5KYgLj0J5e13BrQufc5zNX/AqDka6pcJeZbzv4CIDUhg4wLyTcLzT/57b0GdSBvROI92GEFAR85vkcU0bqoMMsBMw6y8hE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqinl9dv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqinl9dv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so49455615e9.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432246; x=1775037046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p9U89LuLFXoVjIbPXNI+E/8nZsSQ3ZaCzlKQvO4O4BY=;
        b=oqinl9dvBdFxKNJpZUuRdsXVGk88H1Uj5c7Z8oUwnWgbL9S51PUBs4dQGLAoQME95K
         sGEgzNSdbrkwdrzv4mvtzCg7vVByTplJ9d/oB6nXebFw07X9h4vBRpIBClygeSE1q2F1
         SBTyPI/oAw0y/gZ6Vg9OVn+CQA6HqC1UbGldVgDQvcvUIcGXo2DRlszov8tCWKyuOgCl
         c+3GJRoYyL0ZfI/OQad1NhMg2IXARZ0skVX7h+lm+dVUwKTOQGaeVdB2oQN9zzdpVpBN
         6yNd3k34u7Kcw6DegEWsTPOMU+DfdZ9W7fjUbBiA7iB2iedGfWUintBTIqTId2gwZ1Pt
         fTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432246; x=1775037046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9U89LuLFXoVjIbPXNI+E/8nZsSQ3ZaCzlKQvO4O4BY=;
        b=VTPrRcruN7UrNtJlMFpmB4yIG4Tmqg97164APHGR8J10pT1mAPXyd9mJ6CK69UR8YS
         vcZJsJyP4xYUcHdtLtIgZntmqSXc+YB6gGIaxI0RB3nQU/vWUsE1WjYqsrKqDdn/1q2x
         ejYgZQbgxcVCxlATX3ezQj4GQ7Mw2zQQc5q5gZuIc6+MTsyNL26bGve3Do6UyR+HNUhp
         H/JYozKz9aT/p/lyRO6wFk3WcWQQw63hqKCo4Og9jKHo8G0AQwZkPLppIr8KozpoAs72
         Fq+r0nEIvxrIKYel9oLVz9ZPZuNRcvUSMueHpgu5B8vGy265w9WwFQYiluBiilRtZdW+
         7LoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrGdDpEgtxmk1C84Zq4B+/XlqKPlxFSyGHpEvrzvawSdujc6Iqp07IbxLj+c1MRmlKIecZc6MMzGp4@vger.kernel.org
X-Gm-Message-State: AOJu0YwcA2OCi5ZQgYpJ3mw75wIEKBagV7+pRw+E48Ln1slHQ3nB4YkU
	tymfcQvShjip2aTGu8jpKRcM53So1s0EgpjeFlvZjEGu2057MpF1Z/c=
X-Gm-Gg: ATEYQzwmBRlvf5wAiq8ekUz7gptVx8ySW+ymW7PPCjeDz2bH5hoItqmtdSow1hJ4xVF
	p4QzFFeSeUlkw5z0Lernu/oxkUmH9AN3vR+7QAp0DLoHnhxNKSOGT9JMTnsp3RjOeUKJINTckiS
	7WcqvaS6lPbnNXZOrXNHvbxibtxTAgmH+Ok+jfrK/Y3/D7W2QAVTmdx+PuyVTuoR/qmWCMOZLpt
	/Y1UYMJj4C3Blzf3+TRTvualVIbfxztPQyKe/6yyjNM/oKD7BhyAMRLTDcjQdcBF4BqjXztn3hy
	dnphhcfKP3x7Xe5IfPTjjZSqGlpnW1pZ41cYlYGXNSLhgDu2ufc/eCye0bpgpMD1ndG0+XnXBsU
	iUiqbiwJHFh2LcB17AUudg16rLubMfp3LpwfmMi+vj0aPpU6SZii++RxP3luntIN8y2804hhW6t
	NOFuz0VzgYU5UXuZtqF0AOpkB4PfS6weZ8HQvGKGG9iahoR7TG5YAjqFk4x6msR+7KQWxsBa5yi
	iydkNQyV540Fjfr0Hzu2tIadg==
X-Received: by 2002:a05:600d:1c:b0:483:badb:618e with SMTP id 5b1f17b1804b1-48715fd4787mr34101735e9.8.1774432245606;
        Wed, 25 Mar 2026 02:50:45 -0700 (PDT)
Received: from localhost.localdomain (lmontsouris-658-1-96-160.w81-250.abo.wanadoo.fr. [81.250.250.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711764625sm122268895e9.14.2026.03.25.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:44 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: lee@kernel.org,
	andreas@kemnade.info
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] dt-bindings: mfd: twl: Reference converted YAML schemas for subnodes
Date: Wed, 25 Mar 2026 10:50:16 +0100
Message-ID: <20260325095016.48752-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that all TWL subnode bindings (audio, keypad, twl4030-usb, gpio,
usb-comparator) have been converted to YAML and merged into mainline,
update the parent ti,twl.yaml to properly reference them via $ref.

Previously these subnodes used inline compatible definitions with
additionalProperties: true, which meant properties defined in the
subnode schemas were not being validated. Replace them with $ref to the
appropriate schemas and unevaluatedProperties: false, matching the
pattern already used by the madc, gpadc, and charger subnodes.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
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

