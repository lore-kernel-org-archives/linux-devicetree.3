Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8E13F1656
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328397; cv=none; b=apcAvEm19cPxY7whaB5FIl8Fs7MPLZuioXsNoMHIZciE2kiEKBXhlklV8PqUvs2zzfSgC6tQmzf0+kVfy8wbSmvygvEQg/ww3lhMOsMfhNCcD4pRs4FOHMjcev2ykiNM8g4YZy1M2T4oprk9anYURqimBPyHymZi1GS1X61oG+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328397; c=relaxed/simple;
	bh=pXTKmQ4G0i28y4uyk6J9/QqvFfuNM1RjDMa165Aj344=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfuL/uHp8xyYgMiFnwjlhbcepgQQRQNduEhUiMs0sRJt1o9e3xwouAE84fqQtdKYjGy2Bsk5Iy5BWJdUou3JzYNlmA/JYKPgCkOQ6Sj42fYSPcO8co7osN/ij5BveHfl0G141Zxkcgz4TCzIwxr96Smh2var4aaSB+UB3rhzDkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZASHpuA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZASHpuA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1664906f8f.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783328381; x=1783933181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YTszGldjWkBB4DVTAoBlNb1bYzAyC5pi3ftLuhsgXc=;
        b=YZASHpuAR4/6jGhdkrfVE9vwgCu/FQjA+Bs4MczSqJjUOQqcZg+Y/Tt4TcSb5twWxv
         dy9vSer+5avwW8lFEUk6LLGWAhktdJldOY2nOSi+dnMn7gw29Uo9Nddmyefjg5bA1PP1
         BFLr3V/FGib2y5HL6psns7gHk3bFvqX7+iSRrgPGtHzLpiSGtkuMiiOJ16+t62V8FutZ
         vTLINs21K8HIMmrFTeSvsVPIQmC0jQjtxiDjMQmyLEyds0qRAN/2VWxNiMfk9rNfF0y/
         /cF942bH11NToKoLPhq9zwwOwIILc3QU3Sovxr135XgUaxVtgZlN4LgnlKE1sVNMF0m1
         1vhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328381; x=1783933181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0YTszGldjWkBB4DVTAoBlNb1bYzAyC5pi3ftLuhsgXc=;
        b=qVOhzIxr+nHN8unrJFblfOssFozJkiu3Rf9BrcTGcRMKa7DwnO/XpitcOFL8DlLRwC
         Rvx7MU9gFen6VfHoj2Jp68xLvJ5oB7YnUYMEx8EZlm4Cf+GXtRzuWL4c2aXciedWqqgB
         w8lbT0Y9wib/nv43p/fFGdxLe+mx7565P8XQ1ez1PF5f1gbT4T0tiq/9IlLcZNH29N00
         JErQzkiodvUzzAt8Qdd8METLylPcPC5fQO0g2ENLV1LvmESfOhpKd6blOdBqSFvf5xHl
         Ab+q+XnmkRCo3/xWbmDHD56Sh43gN3y+zQltUQ8KEyAAwAjfOc9ZwPiDDeS4oXHflexQ
         9rEg==
X-Forwarded-Encrypted: i=1; AHgh+Rozk0RkP6GwZGS6NxDoiOPYZLXeEH4R1xIF6tTc+FE6ZUGd3nuN7HbxZC+Hm21KiT0C7dJodb++wkCF@vger.kernel.org
X-Gm-Message-State: AOJu0YxO4mf4uSawuVEPSIlNDp5dPAyWW6mUrA34YPyVQ/99UZk2+OR3
	yBtt8/DbTnnuWNqls0xwAVkslKFFjHMAzzZx7NFNdtB7PiGVQ/0GS8zD
X-Gm-Gg: AfdE7cmyvxvkJSxlqIaH5N/c8n2okTkiNCXfxTpClcSsw5sdYpYgP2jrhc/CNkvQJU5
	f7ITroaBKQf6TbqIYdhaLN3YFxosG7lvF3M2qE4Uc2ZiBHg1zF5Jarz7v1w7IhfuF7bpSmZ4/ca
	NcqjpWZD8OESOhRjAsMUjH5plo5uMUl94HEUpj4HXqEYQdgT9a904bOq0IkU290nDNMrkvnOePQ
	ho5NR2Zmaa/oc79Xp8LRuesGnVPWHEl3xcoloCD5+QTQHNWy5DcbqSUAjD9fuA2KAGfpe/HqTin
	0U0QY70tHWhGrPHHmedwREa8l5f9TnksS5sVt4nSVoKqswqBcJn9R+ZhxxdmxuCMBc4rtshyRbm
	zMJbI6TNBK1ntL+8uwa9y7PtOVMlEcUVSBPJwZGoz9Qpo4GCjeGgvsEh4nxsTtSGr2B3WF+c09m
	z+KZB2KeUJf9JM3w4cjIld/ZMkP39hrfZRhx8+DEq69HLbwOfnp/ihbe/sKEfCibnKNg==
X-Received: by 2002:a05:6000:1448:b0:46e:27ed:6d0d with SMTP id ffacd0b85a97d-47aaa60fb60mr11168439f8f.8.1783328381143;
        Mon, 06 Jul 2026 01:59:41 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm22314373f8f.23.2026.07.06.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:59:40 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 5/5] dt-bindings: soc: ti: omap-iva: Document DSP child node
Date: Mon,  6 Jul 2026 08:59:17 +0000
Message-ID: <20260706085917.835875-6-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706085917.835875-1-egbostina@gmail.com>
References: <20260706085917.835875-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the DSP child node in the IVA schema to resolve dtbs_check
warnings.

OMAP3 device tree (omap3.dtsi) models the DSP as a child of the
IVA subsystem. This node was missing from the old iva.txt binding.
Add it to align the schema with current ABI usage.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/soc/ti/ti,iva.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml b/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
index 799461a20b04..d7168d76fdb0 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
@@ -22,12 +22,25 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     const: iva
 
+  dsp:
+    type: object
+    $ref: /schemas/soc/ti/ti,omap3-c64.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
 
 additionalProperties: false
 
 examples:
+  - |
+    iva {
+        compatible = "ti,iva2.2";
+        ti,hwmods = "iva";
+        dsp {
+            compatible = "ti,omap3-c64";
+        };
+    };
   - |
     iva {
         compatible = "ti,ivahd";
-- 
2.43.0

