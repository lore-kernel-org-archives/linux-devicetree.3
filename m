Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401392F3C22
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343668; cv=none; b=hbOYD38PTCwVTTWVoPOO8Pc/0gn7vYkNRmElXBboXzY4Vv6XxAEnG+FfQodZMlI9QjqZCjq6gAOYysyKpE/BZq38XX0zPV3oaGUuhfgqd63taqAlnS8nngZN2+wTIT+oZ2K8XfJx990L/0BQfDaXCf+SA8OjTYqZp7juSzfo88E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343668; c=relaxed/simple;
	bh=CJUlV5ZGL2a0Kw37Rv/d6rN43lebSWKZyj19oPTDg2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZqXTQZqq5thaNHKy00p6dvd9qdtgvSxb6wl7jbKWqOb9uwdIiNRq5uOKBGXbVcAb1Um/1q/IQNrtGsWPtYVYTESN4I6pGyZLntrdap2xpA/J6sN9x6HOftirIbOUiNmepFsbTX15QuNq9h7tflDJS5J64IwUGrqkUvxoSnCpjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9ItfmiJ; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9ItfmiJ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c156c4a9efso14970018eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343666; x=1777948466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIvaBLCfPoEc37CPnNNc7g+bHLIb1FyeO/iLLKd/V/8=;
        b=d9ItfmiJSE200ul8V88MArVBTVlGWKgdQJPc7OVHmePD4OamPh6nM+Kqgm9/TKDdwM
         AFxSxco2bkFqhdWhtAGwHZ55QSkBi0tfJImOZGi/7bAXa90XBBQEpIkcBsMW/SxLg/qL
         Sd8n8AmLvPWiQPb1cZQkhb0AvvtQqZIhlrYOJJUcO9rAyyrbgnTsyiB4l/ytKk55lP6a
         efHC1CsglOwZbtC52XJjden48132VAbnDm/0hzO2wudbYFBjpwTIzqrPmzcJK/I4uSm0
         lnuNpTBzVbaRtSK+wDTCxk9W6IUQ1kFaRUbaufVfTEL0/ipL4w7e59RL2ziLemQkNsiR
         oxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343666; x=1777948466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DIvaBLCfPoEc37CPnNNc7g+bHLIb1FyeO/iLLKd/V/8=;
        b=oxwxmkA+36rNRzk3OQ8BYQd98rU5CjInIL8UXlj8fzQZqWfobNMWd8Qg36l49gmscY
         lMGIZ40CTktU8JSHGuzaoMaKI5FjFr8QrADLUTUl0SX2i+ZyWe5eJtY9CaMg3IjtmHVr
         RTfGKfDqGrt4UyhK1oIW7AK8O9uq3D5quGML08GVWDMcU0cURdxNtc44RwuCZcX8AyN8
         XqwnH1ED+x8ad5oQ0AMmoahuMQ7/IaTdMtnSLf40Xe8zMjNMczza42aV67Vwr+MqxCTp
         PHgRd4jbLlGUej6fr6ks8bF6mRSB8x/K+mywqlDrCGLntzl0NAz2wubcZEOrjcT7I+9A
         QSHA==
X-Forwarded-Encrypted: i=1; AFNElJ8LS0cMSMCts9IJJUP1AKA+GohD8lx7RSJyD9Ixr8yph9X/VxyLJIlKNGHJNab71Vgd1Y7NtpG6M9jC@vger.kernel.org
X-Gm-Message-State: AOJu0YzegrJ7B1kWDEY7Ebpo76Z1O4Y0PtZCyo30VmLvPA6YeYmGOGXM
	bOR/G1IpjmWEJ3GA7QqvBXnzCNd1vsk4nDQEumDgPhP5idgfLPaqxg57
X-Gm-Gg: AeBDiesS73Q+D+p0msY6z8t+TSZFSFF4/INpYi7tRzDvWbvvPAnwiEm74a9KV2o4fW4
	ZSEZ3/mnxM5yTwOpeUoxXrpvJyz+kTBkiFVuoAY5ECeY0TnVyh6Ag8z7q662JCxBIKIysZsmA+b
	HPR0FfOyQT0c2ItoBrvsFGC2Peq8d9wMQb5J8cmCstHDujk9GKRIQiWHw/Yem7UArfbBBcwdGX9
	Z3f/DI5+WVGXa75wkT3/duZ2uBvH0jwJkQxQMkIEqihTeGcGpazQUOvuBcDAyDdRhmMIYU5Yy7h
	++aV44qrPb9TcqHoTqaIU837f3PFWEY4aYycNP+GU1kfUJP+SGvWZ+KYkhW8tBQydGdTuEqk50b
	eG42R+BPFB4WyqGbQVbI5hR479idvr3H9U2StzFXYhEEcPVlNpALCQ9tybQjl26u1He+oRsY5JX
	GIznZnOlTUC3ryqr+Okaa3/MmCZnXXUSl9Ukf6K4j83Q==
X-Received: by 2002:a05:7300:4309:b0:2e2:d94d:6175 with SMTP id 5a478bee46e88-2ed0a066883mr649285eec.12.1777343666244;
        Mon, 27 Apr 2026 19:34:26 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:26 -0700 (PDT)
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
Subject: [PATCH v2 3/5] dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
Date: Tue, 28 Apr 2026 10:33:59 +0800
Message-ID: <20260428023401.330308-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428023401.330308-1-jerrysteve1101@gmail.com>
References: <20260428023401.330308-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add shutdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index 25ce67940c88..4654aa07dc63 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -45,6 +45,15 @@ properties:
       When present, the chip's PWM will operate at ~22kHz as opposed
       to ~3kHz to move the operating frequency out of the audible range.
 
+  shutdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
+
   "#address-cells":
     const: 1
 
@@ -158,6 +167,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -170,6 +180,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.53.0

