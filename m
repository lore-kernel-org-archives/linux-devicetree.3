Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD825B098
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750143; cv=none; b=VCOML3qun2XB3AXakTRda9noDF1FvxwDHp6MMgWK4wHDQOiCQ5peidUITYGGSE5O9ToZymz7dF/6e5VM9DD0HMQDIFuZv0Oj6DfZt53vh+dxSa0ZubZ2ip4RgQXVf8Hai64Ba67RD3jaFWmWktVJZVaRXVvfEWXkGD6Gi7nIleQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750143; c=relaxed/simple;
	bh=PBV7gLpSSiGNi6k5OJEnkIJJK1hmODST82g/5RRr8Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVYcHpmTvVFVa524gJ9VZ/+vwn3n76YieagcNVbQmorMlIdbDfq/d6F4MqufRdAmxNpg/zceC/hq6zUQi9BRJ7QrPnvwKnYmVdBr0wXF5bJmIsCR9rtOBVjzC7+mpTw07blh1tgxi3HvKi44QOT86wB0OvUZBBR3saXgOqdNRlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XXP4DttX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XXP4DttX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3692bf38290so379989a91.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750141; x=1779354941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=XXP4DttX0r7ocTcFv6DqhGlCYmfjvzt+hxMJQoEhvDmSS3FY/F5Uz0v4/gc1c2uTYW
         +fSt7d6vZU8AuNUGNJ9bUa5ONN56yPbPuKJYz3FGufxi0qdVR901UeBzOMwtbrZnKq//
         ZLyajtp6+FkDmHss2Wdh+UHmoFU44MrnAeJ9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750141; x=1779354941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=rgCWZYEQGM7kIYL7wmsjb7XJxQGRCEnKz7nGIbJj2TUwOmp8WYrY6wuCLFgdMSTYy5
         jwloHAbE320Ed3iQgI8cWkP2mmFKkxgav21clXftK/7OaL7rKW/TaT2GXM3OxBEtOm40
         tXG82Ra9NlfLQgR+ooAsONtznfyoCVDhHH5qyUmq+0APx7hREx7qcfNBphAlxjYn2Kfb
         1vc4buqvHEv2/UqQ+4F7eQVQdgRbePn0eYdZbHNYjsW06BDF7oMCvNbIHnigKAIu6vxx
         teR5J7+m3ImX4GBqXtyog7IFDDLgEUhXbIP1t8bnkqsJ4iMpCGZ9YCUApMyaomw0Yo/e
         QW0A==
X-Forwarded-Encrypted: i=1; AFNElJ/Z8uF4A7CTz6SAkqpX7msRmaJdt3P7FndjHNM1A54y8dngLvMYkNG/prlsVi2/WvxmyNP+vSjBu4hx@vger.kernel.org
X-Gm-Message-State: AOJu0YzsGkUp8eWE7DpcsVlav0T6f+elQZWhzwXqSNlEWVUIl+vlvToU
	hl4/Bn+QGz6LmownI6s7J+XDx59K7RON2E61GH2lFPrTH/eZBLb/DUkP3HCvcy9Brw==
X-Gm-Gg: Acq92OHTJiHUGXPzcxbDe77XTLATNipa8G6rHGOR+gmAYXmnM1T/FP4Jg4vlHJJwCha
	hv+j6MjnbLC3wPzTFhUyo4PUPOFRC7pvuBmNwOSp66mU4LE2rkSqONtO+fRUbTmwVTrITVvdZxr
	Z2yJDw21u0NxuayUIZDEv4cBDvj0ymAScmwAJxZV0LOPbuF5Vns5zDMFKKnbEM/2ySfCQTa2W6d
	wLBF9T9cljvmp4rJPXIa2t6LG1WbsbRT4kBfehKGIcOqb98m/+FEqhz1UqztKMYrr9TTkqGvQdr
	VyPwndqE7M0Y/j4tVz5KJZl10lFdpdIdEVDXyABLqiI6J0slI4MejIbcSPw4XK5mCTKqAgBmWcc
	ulJ/bVVb0byaN8+siK/+XS8gv8XbVo0Q2BUhdUyqI0cuI/pl5KSZiDLzQZnUzkk/d06BPay8RgE
	6zQpZkFu9aEeXnLOdgesLDEZbHx2OvG0XyqvPLsqzURYgwgRqXs5a9I7RhlRxkpoveBHRW+7a2g
	Jw+lFVT
X-Received: by 2002:a17:90b:3149:b0:367:b9ed:6656 with SMTP id 98e67ed59e1d1-368f3e5cc2amr6642670a91.13.1778750141249;
        Thu, 14 May 2026 02:15:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Thu, 14 May 2026 17:15:15 +0800
Message-ID: <20260514091520.2718987-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name of the regulator should match what the board design specifies
for the power rail. There should be no limitations on what the name can
be, and they definitely don't always follow the PMIC's own names.

Drop the restrictions on regulator-name.

Fixes: 8771456635d5 ("dt-bindings: regulator: Add document for MT6359 regulator")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 43 -------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index fe4ac9350ba0..ac925334ae83 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -18,84 +18,41 @@ patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
-
     unevaluatedProperties: false
 
   "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
-
     unevaluatedProperties: false
 
   "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(fe|bif|io)28$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(fe|bif|io)28$"
-
     unevaluatedProperties: false
 
   "^ldo_v(aud|io|aux|rf|m)18$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(aud|io|aux|rf|m)18$"
-
     unevaluatedProperties: false
 
   "^ldo_vsim[12]$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsim[12]$"
-
-    required:
-      - regulator-name
-
     unevaluatedProperties: false
 
 additionalProperties: false
-- 
2.54.0.563.g4f69b47b94-goog

