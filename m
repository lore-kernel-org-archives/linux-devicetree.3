Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AAC32D43C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114248; cv=none; b=iBefp3feP13kbUW1UJJk3PtOlQJOci/sC8pxxcdWm4cy3U+MwHEjuy0zRUSXpGOKTAi/YuxTvRyHBOgVihwhTEGBq5+PRY0jqG+jwTxMS6hNOZr5NjR4xzp9CKYH3dxFHE60ZwdfsbO0TgZzDIACF5dpenOvyqOBjUlg22PaHeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114248; c=relaxed/simple;
	bh=fMKaNCHqvdnEkQNOcz/+Evogzl4yJdpF2G3aArECXqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikkic/2hN8nGZgRMxCpMJxa1oVbcEVQ6yHwWTwVxM5LnV/xrTj2cTSQ3sP2eVpCeDbbHZk8hLSA5tTHoXJ+NMJqo3vBE6zhFpSUQwOLPYBp98vYX1yCzb+WppOKMCj2TZnMoHVkclH4PAhGIjERzu38aRJWXG99/nGWNXJgjb1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ4qCFJW; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ4qCFJW"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69e2c792289so4866626eaf.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781114246; x=1781719046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG46e6wh0vfo+H1QfKvpne8/nrh3wipAUO48FCP+P1g=;
        b=QJ4qCFJWtF2rh27kcRgTB51mShC5m4HehjHsRdv7wIF5UD53F2dR/EpbOVTcTfusZv
         uotXBMhwizFawkHhTsgwZhHchPfpP8A+glOB4tYLmc0At8nhXDcVIDR3fO1nQ4b3JvVc
         vlilqUFBsgcrE+clC+iVb49Pd1AQ3AMyHNKBADrweECC45nGdrFrxo4H+Um51QsvOqzn
         zv93h0TJtFb5fEfqp9jgAN1kWEtIqywkv8uqytsCxjT5FqzAj7ekbTmrohn6bRxjVwjC
         puALmye3T+AnhrljzF4hfKF3Q56ZbbZ7F42flWHlH/++0nyB8rKVMhySXbdhuF14M1Hd
         cf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114246; x=1781719046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AG46e6wh0vfo+H1QfKvpne8/nrh3wipAUO48FCP+P1g=;
        b=OjwR9QIA49cmD/fMOxm4njh6vDXuS03rtCBPL8lLNA1PvwLwTD4OG98OVYh8Z3A36b
         iANKCr46Xyl4WuOATMUmJ6qIhVXRj0SRK5+lDUDbfakBAv+SmZv4NooMH0wcnBW++B5S
         1mL/zqYiWeM1RmvdW++XaqHRk6QRJCM8mLzF+tkhUWwLz5XWBNocnj7EWZMxes1YUawB
         lP5xaKc5zMff8EbVy6zjbAlwOMMzTArodnqcp+sbyLjUIQxCPSA3bNGuLnR2XNnPH97e
         aInwoNy/5wc12rupRBeGqYPL+yyzmHl5WQSJQeNc0Dn1wkDq7vv4EUlN07VIdmj1KQ14
         12XQ==
X-Forwarded-Encrypted: i=1; AFNElJ81skfiduzPu0ApzYZLcDUa908K9CZzKmAnl8Pt1l47kyrCZQuAaQYQglIjTaW9z+Qcox9Iu/vbwmV8@vger.kernel.org
X-Gm-Message-State: AOJu0YzaTT/ArhDuLNIa5D8xetW6fsVualt/Q+oz/ncN02U0GJgdonoL
	Zh+XJS4hoszt5xmGguJaoYVL3SFketB2C+TiCaqbRE1RRPd99PwAT1A8VPQxbg==
X-Gm-Gg: Acq92OExPWOLeXA0eLcTcZZEUo6+j3WnTxhX2ihqntjXG/sAZhd57XTx9PPKeX3+qNS
	/XY+H5hzrWBqFCINm55O9r2N4i/tvas5neYFdnQUvUzLoG87oS7p271RBjyJ/pvs3zgM62JfQHk
	tbCtW8IOdYTfsM2UY/lNLgz7O7a+w7jZolp+oSzZlLFGw0OgrXPbK7yyM7SK5pz/L1DQyCa1hTx
	MrGGMq5ex1AxnXh23uLgxsY2tHElWgbEdUt8MVyYoorpot3NQUBUYLxNzZhMobZ4v1k2ZsNDAVV
	1DE6XQ7IPTfGuf8ZuJoLYQ32K5QSdFmykBsCIniYQP0fHJSLrFel0m/FfbFQ4Ps0V/enplCg456
	o6ryQbtlAqiPnPrXOaDj+aZnKyAOR8tjN46+FJ493fQaCjmcUL4QB79ZdPjqEKf3MeIhqjVsqqw
	OlQ1rcpwLoMb9wYciY8kdeshHxvlv7gvfbEGYPNvU5m7HHWHyuCVvqDw==
X-Received: by 2002:a05:6820:4c89:b0:69e:283:abaf with SMTP id 006d021491bc7-69e68c07596mr16296123eaf.32.1781114246148;
        Wed, 10 Jun 2026 10:57:26 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:b86b:51ed:28ca:695f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7d4f449sm21180794fac.8.2026.06.10.10.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:57:25 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V11 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Wed, 10 Jun 2026 12:54:46 -0500
Message-ID: <20260610175455.19006-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610175455.19006-1-macroalpha82@gmail.com>
References: <20260610175455.19006-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the ICM42607 and ICM42607P inertial measurement unit.

This device is functionally very similar to the icm42600 series with a
very different register layout. The driver does not require an
interrupt for these specific chip revisions.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/imu/invensense,icm42600.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186..81b6e85decd5 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
@@ -67,10 +69,24 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - invensense,icm42600
+              - invensense,icm42602
+              - invensense,icm42605
+              - invensense,icm42622
+              - invensense,icm42631
+              - invensense,icm42686
+              - invensense,icm42688
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0

