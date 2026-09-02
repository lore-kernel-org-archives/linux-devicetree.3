Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036C9386443
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377685; cv=none; b=ibBbPYZV0DVeyfZ9s7OBbfyJrpMqMvufNpcmgjQPmDEHhZOOm/BdFEaKxQvvYuLvBy/LjQhBFE4jtmAh2iikEoU1l7Ffg03Usmjjx3KrRFlE3SphLvtEueTttdwqNsABLittF16XAt1ab97hduOK9hJP0Y7F7rHzUd61tg5rNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377685; c=relaxed/simple;
	bh=dCN4MSGnNu9qg2o82cMQqSPCzo+02NG8UMe2Xwsmd1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfAaeJswGJxfoxcdu690OGuo+ttH4MfaLZHXSaPKkzPSA3730eiIaiDlubY+2+IDdZZQfK4bQ8Y1zXuWykCpNPpUs4suopYj922VAhg6qDILpKzaRYmE8BHH2FQ+7tYOdKA+P3pQQTZrv+6B4od2MjeSnIKj2ydY/cBO5OZaGxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ru+rMLAj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ru+rMLAj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482f9309813so1461214f8f.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377669; x=1788982469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caCex+BmvEH7ghZImY6FVecBuOi80GskXDf2a1gswus=;
        b=ru+rMLAjiINO7EaHjU814dGHl+ynYGkwqDSOqR2J6F7nxjMDgXiN63Ulp40yzY6SBP
         /8onhapFUKnQcpemxMjb3P6iJJtZvG/05JX6hGiHhwlid31rId401GjRmELfEOjntnax
         Jh5h2LvMYSD/h43tttfJ4mMpSUD2S/9VKA38qZPZLde8uQkihvnMNkCZsAsykdBbTnz5
         GspW2VD64CvwT852vtSrumyjAlwLUaH7vqieCgDh2lhzMDhITet3oFSNCSYn9y+9V3HR
         tra8l9W+vOip+RCwFKVuF3C18qW+dechV7mTQsaUzZAKIjWSV9DG8j1pzzEFvogODY58
         wfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377669; x=1788982469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=caCex+BmvEH7ghZImY6FVecBuOi80GskXDf2a1gswus=;
        b=ML0OBk8QCwXh/tnPxP+AIkCcPChvkcDMgwYx9WzAShiDGYjSdZtPhQNgnzekwZroUg
         bcKfuieiytxDjxL4A+agJH5X/JRjh513PlMTAQY4Q7Tu1VqJVID8+pX6L10vISD7iP1V
         nKJs7TPDpzosGsTE20jCkG3zEgGGlq1jabyxKl2NiEKaigMJKUb5YhT13eKlDOwC7FP1
         HeoAmgSaKK1H6abfPDtAHDHE0MuK6H7zptAXN/XfKm5naYilF2Eg877Krn2DIiY0ZJZL
         ZITAZ/sI0LzotJGrnFMvw/sZ5A/XnjeH5puhLpIJRunWpXg3AwB5Pa60R/HciGVQTyFN
         L+sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk0H2OLH6gq7i7IoCzgdlibvBl0fQSq9op25lmXHRSq917eVYw8oYtR127QsK6NGxTx37ROVs4oL6r@vger.kernel.org
X-Gm-Message-State: AFuF++miR4VoDVY7SZKFbx8vfGWr3WxtFYtL1Zu+U0XPtvMrIIWSTHoG
	f4wsposPNPUw8VpnHvn1ke2TzkI7XXuI049HJzqMmJW3vFdr5SWKSxD6
X-Gm-Gg: AYBFou0plfzCAlMkr4jcezgYYOINkjyvdCTllaGChCzwH+HZ/F0qiyBK5Tpf6zXOyzx
	waYVUYBKVcTZ/QdIfdI7fAlEjjxWjxCmaHxmUtQGohWQPMWVLYiODjt43p+qQNbsCf/Yk6RZ1jB
	G5JRnn6gsmZnL2nGg87L7gLaSFMk0HCpZUS3bAGRlD45GnwSt+9cRFfvrs8uDuJLTn8pgvv8oW8
	Zk0BCbzPLBxwnQRZDbyBHc9OCE+PxKXY1z8m7frOC1wnM0Opv3lwgJXN4DsH/+7AQt1z1hF/Jgl
	usotAg6mlOKSEefPBpBSJEhj9NvfXAWBOHMq2vOnI1ssC9CufY6LF7ZlijG2ueorBB5DwG14Wun
	JXxTf3ifL+rzjnRIePDEatc5ZsfieYqzRUSHLWca+ckRtw/mKSyIp+xSe6zyprUiLsp3KlOaS3b
	UlcFnnJi2SsDMTuEOS2CGjTVEVRpeS3U2E3nPJDCfALB8VjdXM7PwIRqJo
X-Received: by 2002:a05:6000:4819:b0:47f:e748:3ae3 with SMTP id ffacd0b85a97d-48488deedc7mr13797916f8f.3.1788377668785;
        Wed, 02 Sep 2026 12:34:28 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed,  2 Sep 2026 21:25:37 +0200
Message-ID: <20260902193351.185771-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Previous version of this patch had the PMIC device declared with a
fallback compatible to "mediatek,mt6323". Sashiko pointed out in [1]
that it would have been wrong as the fallback device is not really
compatible with the new PMIC.

Since the change is significant I have not included the Reviewed-by tag
that Krzysztof Kozlowski kindly provided in v9 of this patch, I hope
this is the right thing. I really want to get the bindings right as they
are harder to fix in later commits if the need arises.

[1] https://sashiko.dev/#/message/20260820125850.3B34D1F000E9%40smtp.kernel.org

 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0

