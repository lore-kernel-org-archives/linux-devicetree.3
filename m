Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0D9314B8C
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153099; cv=none; b=ZJhaMNkvJqTIGTKBgmiBuQ+umpscuMW8+IEJCyd33qf5EkKiCcBf0Po88NTYAUzf1Cn4pPd/sagfoH/GAzVH8Ub8g2GOpkLa+cTL3C6KgFIq3QgxSDtfikscNHgQLMRLwVkJxYrucZTycWfoyNEud5yRL+1gFxSksxnBIBIzfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153099; c=relaxed/simple;
	bh=ttxwrKZsoNm0aTlARy12cwThMUdvtiwIjDzqKmLJS+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTwgHp7wW3XwfjLrfqQnJ4ZLAwNaO9C3DFFo6q8VpoVUp9Skxf11Iec06S4l1B+9C9V5u08gesektQbRYlIfBjK2iJPQp6fJQTUFp+C3fPAmyvISak21SqoET6QyEQWHBk963CNi5GmYqGJUPy0cUduLIGhaRL/owVneWZ1/uhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAQZZO7C; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAQZZO7C"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45efb698ef2so169364f8f.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153097; x=1780757897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=;
        b=LAQZZO7Cs4pVvRMp0KBDA/bwRCHluusPvvMcODQ5XF4VI/1jsn7UBQ8tBswys2eb18
         ZFBAw99wOOViEE3Dcj4t3AxvIddBqqdpU5q66Ml+cQoq03NkZi5aHPBoKmObjrXgSgql
         bOMsAbp/db9bBQVP5BZacM2/Cfsl57dSuQ5/6tcoFZ5++Lg51aYGhEoZSiVeyAu8E/MP
         iOZfeS8he2MlDDTuwRjzc07Ad016aG1+9748F9nADEmf/W8vEViHlDG/AmDyVKPSP8Q9
         raTVymylLUMtGb8lf0VlJPPWyy2cWV0MZZ1/Miss23R6LngiCEzhJ4SXyAxluOWXxDs8
         R3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153097; x=1780757897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=;
        b=ER5ZxuIXdhGk6RYukaIbcuO7unFqAnU+wJWr8r7jNZv7PN6WLZAVm95BuSO+33z0zj
         +0ChTMqc3p72ddAPGK6tXJMA/cIqSQkdrlZZT03iPEzoMg8y+YLStE2jbdWGahk3eXN+
         BV4DVTCU/CpmVw+VKNlo+OmBABHzHl7nAEQYl+/eHIZ/+2mHOtchFjJ0jedXV11LX+FE
         +UV2Y4pk6m/bCrn9fnwzVCz7sgNmAJTwdUIrcguozv2aQwd9BSeuix1rPQ+SogEyNdxM
         owYWcHk+MK8iYv0DIo4BpjXZoaG335m1B5SHo00CijDwUWeOxdr1lH0+JLzT74tEOiVl
         k8jw==
X-Forwarded-Encrypted: i=1; AFNElJ8+sDBfBjexBOX8/sHeIi5IAlkTjY2WYDUQmPRTx/Ih5VYwLwvxtIaiC8ck9Hn1BfvrCbD0A0ZTAL/r@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsqYoE+SbKCd1KTGUIcSJe2Fp5zEr25wkEZUIu4Hef1M9H6hw
	mbieVvUncIPym4zqA+/LV9rzJM8SZ99zl6ZgXYWYVeXvRZWq8E6ATOF3
X-Gm-Gg: Acq92OGm61uG5ibxhwlBCL1NXGc9Q43LJRN9fw55GvhM5aCGU52a/yh8dSZWjjmRvrb
	O2NvCK08kb2GEuClfRBiafznIykNoU2I9m3LPHCCsW+WMyFljxgpPCGVluTertys48oe3QmTW+A
	b90Q20W3zYUKhgrh5gL1O014quzGjg22aC9zO16cS7i+7oI+jmJKeWR8KV7f2aXBtNREmvgRNrI
	7aTM7n3zoccC3Khpvfb0iXJXPOhNScYMhhTbNqSH57crDpXS8h6Shq53HANt8PZDJGtnZbQNUXz
	JhYZIO1fXr6KJIKGWUUgqfhxCBFxUaaO9AoTxsQW2dLpmObc2HrUdZcA7BG6ewHAhx37baA5rFa
	GQwBq2tcXvyIt3q6dzzx/3y/XaoFONDoDKBzVGPx/iDVM+VvXTUOD+NhVigT9XSwmOo0TnCR1Gp
	QB9uw3gPugpw8yA/zP1I4QzPDWIip0grY=
X-Received: by 2002:a05:600c:c492:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-490a2901b25mr67467075e9.5.1780153096610;
        Sat, 30 May 2026 07:58:16 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:16 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Sat, 30 May 2026 16:57:56 +0200
Message-ID: <20260530145800.1029920-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 2124804c8863..1f65f0fd41bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:
-- 
2.54.0

