Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB7947F2EE
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146636; cv=none; b=HttJqumuNaQ7KK3LIoWIam5b3OGvtqDw2+LoIEJVSkB9hnGO5GT7PdNYaSqInjSFsd6n6Pd8z2Q85uLPRt2hc2CHTAKhN3ugI4QgamBHa2IkQB3y1VTxkK+0LU+z+TsVWVWkacxLRCnmsq38eZYu6RMFZm1x5ivzkYMoe8p6u14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146636; c=relaxed/simple;
	bh=gxIq6ifytR/JAI05/Wxbb2mz24KshSEfWdEtAzkQt6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFN/WeFUE1Y8pJMHUU5QMEUJXi+ZYJGQ8RJdnTo9fN+qwO9BIz2Th2ouMqzrvYn3b44/Mkt396CFR71ABwT3LW4UGQAi6pwtOSshlNXyNfVicJwd+NAXLnZJSUzs2YLMRYrln5IiA+U58wh2MziHdV+fWXfCAPY33cViTmQzxhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CryHwVKP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CryHwVKP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c20ce3c118aso169934066b.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146633; x=1792751433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bKjwQPxfej5CEalIEgEN/iRfsSwjtHzCvEmFIdw6Pg=;
        b=CryHwVKPuixPPFVkoEqDZ+a+8ONpHPSF9HPFLkoOncTHTdnsOqyTkoxjIma/0YvlBW
         YRdfMu+UPCAl9RxbksjtfJGMWH78iPhI2f4YW/0MCbTwBlFsLSd2rwlIuKTHRX/vLdSE
         tycOUIVuSjYmk0Yyj/DbSteZmeznfGRFf8WhRbvgDidOQ4Le1YmqV4GCAILmCNa/bK4Q
         GM1YSxtDXaALEJo4rYwdTyXBYulGfTKm3gWc8DUKCTAtoS2HyMnzgTVzEBPYm6sjRlyi
         J3fWj6OWRT5PjUOHStrDNowyvnDq9L7XciDKTDu/BVXJfmDthAyiwflKTdwNJqcZ39bI
         +qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146633; x=1792751433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bKjwQPxfej5CEalIEgEN/iRfsSwjtHzCvEmFIdw6Pg=;
        b=HS36nwWLryZK7l3sQlRLamjVhZabzXkkZpmR1/OitEzuyYksbyTnlJk4+c4z08Ug53
         ENZthutJF4xjxaQeD1TAASv/12TAYRLFcGvIdUmk5x7/1h/eiB/l/sQtCf2BtIMumBZC
         9nEeApVmOCaGR0TwbgPR5SHp8EW6FYCtMY4ccD/VPPlt2/6Ff6+i0cbwecyu/Enpv7xe
         2213uOoCz2PxBXdfjZp/QXgQraJOYQ3iLdZifeH02SHuPzVvdbNtILVwO/jiETTSfqCE
         gZTZ3YxJ0Ckg0Vb9p0stcbIdVXn7QK4TFqXzmmiPrtHSRgwV5jt+7PHdJ0RBJ5pg4bip
         nfQw==
X-Forwarded-Encrypted: i=1; AKwUvBzHKRz3wAH7kz5IDGnaeoryP1tg/ZHtJNaeytNtP7KepBzU9t9mJXlJasTc78ZVAVTuSdVhDjcDQG/B@vger.kernel.org
X-Gm-Message-State: AFq9FYK6jwt7WouVPUIhBcpLLn1J5g2tPKQq1sPJFYsjka8R0DP58BCm
	p+ewVYKYA4JYDzdsmKxvilECK165NFCd2UfMm5wKThkaK6BKA50yr1ts
X-Gm-Gg: AYBFou0+bRpam9NmCZBjf6hXoi03ewMUBrKxZAvx9pzuCzrdtRcK47pxMJUwo+YjOfr
	X1xddgSb6Vg9me8ztBtS68Zp6e/HhTKPZSOZL6dvazQueQdrF63vNwCrUa36WVNd5JBxnp0vcrj
	G5N/ZQ8tTgsmWemL+gjGRIAvhfzxeJy6UZo3iCjSGO/WhAgJ+A9sVOPikSH679b6Zpw74UOcfbq
	aTa/HHEodpo7wYgZytC7kfvjR7+yUuF8/KygoDUN9dFIkqXSgrC6vOUGWKps5SEjNXEHBa5OF5g
	R8rq+fEJJKGcMLjbX3XjMdK5IpGpSFQT4KFj0c3uED+47JVfsVm+nkr7jVIkXLVXGSh4pTjT706
	80Nykeho53uhgFNCTVKeqplJtzm6Z9FRKK6AiBVdNQPmhi9zMuxFhj0DvofVkrRN+sAzGTjvFf3
	JOMuG9qpLsWgAh28NkaecUV9R9koeqqr/jqupBQdFqJF6lhNX9IRvb9L58yLyPY7FpmfrMSyc+m
	rQuO5OrLKZp
X-Received: by 2002:a17:907:86a3:b0:c31:6fda:52b7 with SMTP id a640c23a62f3a-c4020eedba8mr234447766b.21.1792146632831;
        Fri, 16 Oct 2026 03:30:32 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm60613866b.31.2026.10.16.03.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:32 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Fri, 16 Oct 2026 15:29:33 +0500
Subject: [PATCH v2 1/5] dt-bindings: net: rfkill-gpio: document reset-gpios
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ok3568-c-v2-1-068d68430e6d@gmail.com>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
In-Reply-To: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146625; l=1639;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=gxIq6ifytR/JAI05/Wxbb2mz24KshSEfWdEtAzkQt6Y=;
 b=VbqmIKE9xA/W/LJMZES0LcVcRSUOVVY2CefAm9neUM3UYLCdrjlwuk7AeZQMIAGrmt7q54X5W
 UzhAtJ28ZoIBby0Ort5ufWzrkitHUI6oxTUyh4O2Fn91/s2EoQEi5Y9
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

rfkill-gpio driver requiers at-least one of the gpios to be defined:
shutdown-gpios or reset-gpios. Document missing reset-gpios property.
Also add example for wwan with both gpios.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 .../devicetree/bindings/net/rfkill-gpio.yaml       | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/rfkill-gpio.yaml b/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
index 4a706a41ab38..66f6ad2872ff 100644
--- a/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
+++ b/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
@@ -29,7 +29,12 @@ properties:
       - wlan
       - wwan
 
+  reset-gpios:
+    description: GPIO connected to device's reset pin (RESET#)
+    maxItems: 1
+
   shutdown-gpios:
+    description: GPIO connected to device's shutdown pin (W_DISABLE1#, etc.)
     maxItems: 1
 
   default-blocked:
@@ -39,7 +44,12 @@ properties:
 required:
   - compatible
   - radio-type
-  - shutdown-gpios
+
+anyOf:
+  - required:
+      - reset-gpios
+  - required:
+      - shutdown-gpios
 
 additionalProperties: false
 
@@ -54,3 +64,14 @@ examples:
         shutdown-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
         default-blocked;
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    rfkill-wwan {
+        compatible = "rfkill-gpio";
+        label = "m2 usb wwan";
+        radio-type = "wwan";
+        reset-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+        shutdown-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.56.0

