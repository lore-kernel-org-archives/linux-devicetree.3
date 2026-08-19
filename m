Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BC1478E39
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150197; cv=none; b=ABgmtlGYV5X1gU+riTOKosVWI3kbXSV8gHUif4n9ZST7dihd9r58F2BzOn+AuJO8e+AlKMvUZSRHQsPSSQ4DIe6maMPuUVKRHv29UIc2MtDsQc0lYijr9OVaHDrfOZ0TY068k26D7UHUJWIC1Ktgvk3/zyzYnxFGvC72Hp3T57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150197; c=relaxed/simple;
	bh=X9g9f9zNnjZporS8dI4PYZqzMLpP+8jgApko9JxkNpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxGtQHGcC9lEJAM9HB5f4rqUdthqaW8IAYlwUTS15YzgRACn11fx7YuCsg8JOKmiEy+HqKZJyONi3+/8Xl10SEEZgOIoZkO15V8VWn16nXxqi//To1IW52X7x3RWLtVq67boi+TetKpXumOEv6J6Gj9+mGJrrS2/X7RHTpK1a88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OKebSvQV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OKebSvQV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499b02fc590so174645e9.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150193; x=1787754993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpc193AsLHROsaZ79+wDxlRixh2ukohZH538sICJG0I=;
        b=OKebSvQVLLrUfOCQ5S7mdsokJydN2UJV3f4XG2sllwsZ/bpIAURnjsKfsrK2WDYIZO
         mk/LC/3jq9FmrxXN6Ai+LBblZzjGsR6xKeJGrb3EJuez4RViMSyuZqPGgC3nszB8hAAa
         CaGBWKjnWhwhzDAniIsX9aygu2sziyJt6Ji5ZMvJw67eBn7WASv3ZAHQ9JEUa0rScvXY
         i4l5A2+xhwNk7XKtkb9MkdpfMndun7d6+Woqd/nGgT/1OmHvkt3QDkYKPAm2zqs30fEM
         8uO5WSpElGvzq1QkRxNdIb4g5gBU2WY92owkJqIJwDnWnHJyCIDpeFxPht3PqWH5NbqW
         2SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150193; x=1787754993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpc193AsLHROsaZ79+wDxlRixh2ukohZH538sICJG0I=;
        b=Wu/9BqWyrDnHijB+Vu2gy+pqCGT612r4XbGy3Q3HiP6qOuOaOtgo2YEZc1qb8STbfk
         3tMv56TTSfgVXY8OniHbnycoav9Uzjzei0nsvFFEz8QLR1Hb1QNFWD/4OWGcrGUSsg4V
         3OKsxOVPjXQhIFDyYzki7Hb6M486M3YQrme0jGWsqwJ21k+7d4FZsHasOYoQPgAde/My
         rjDSZfV3rtUl1IQOUBJCHIE/ceBD5mH6ZtwM3giZyUnaUtImdi0PNW1QEwpwVSjkdS/Z
         B/4JSsWUXSFIzBAZVCUFXokqGcxY3vohEjUiPaQ2pQKuaixmlHJvJEtFVAPjSi8ebn+y
         Bp2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoKWrzH7rLkd+21PW62OGT1lfvBHVozKKDcWPzrwUMS+rnCJ+q4LW4X67+Z6SdR+9hziIJg3TU8uG1u@vger.kernel.org
X-Gm-Message-State: AOJu0YxeceJ/IpAkeY6mvwvLtzbccavIvM7XGbZb0vlHu8a2YGet4Ltg
	D649xwFqk7RWrGDRL8CEgYdwjQDallLRyDGZ76trTRNscVlAn2n2BGsQVo9WAIgp6GU=
X-Gm-Gg: AR+sD10RWv4EWrrVmKFbCodSTIbAtVl3+zeFRV1C2asA4UyGTrSr9r0I+21nal1/6Qr
	mGKykNgYDmsYCiLqG1HR2/kd437Bu5UWRjX+siwq8lF4+M3W22VLgHQKtk9Z4IxYhvgnQcObi8e
	crYqEI+yg93UFx+OnDjlih6MLP5VePp5Y+WCiixxhmHRZ9q+gAK+SNASHbnFJL3d1D5lceLMxft
	ivVA8zLUMScE2y86E8oUyoOnRoopWxJThePQecN51nk62ua2RwXY2KI0RxtvQEOrL3k3bi40uAo
	fylIAJ6rx3dM6VM3f12bzQr6EjL3Q7FwOvXU6UKd8mIzi3dXP1Hao6N2wFq0keuW3x9dAZDCHNB
	s5ubCQGFMztl1LOjJ/j4g6If1ihyMTUOJhw9lWIATTrqHXYStbQ+JOt4Wk6RfpiURGuJGQmnmXs
	M3N32tbCIO363d9lm3OYrKZgXxhFnDX9BCT8xbYizf0yVAuUNJ9h5PnyDuWqfZKIkihcomzfid5
	Uag/x6fEhf1rRNtrx+xmVJ3wNZiCinsLoCGQWg5e8WQIGHNWQ==
X-Received: by 2002:a05:600c:a012:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499aa1431a5mr105639935e9.1.1787150193466;
        Wed, 19 Aug 2026 07:36:33 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:32 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v5 4/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C power source option
Date: Wed, 19 Aug 2026 17:35:52 +0300
Message-ID: <20260819143553.2478984-5-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
1.8V. Document the missing 1.2V power source option.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- collected tags

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fb1fe1ea759f..32864c9add4a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -129,7 +129,7 @@ additionalProperties:
           enum: [ 33, 50, 66, 100 ]
         power-source:
           description: I/O voltage in millivolt.
-          enum: [ 1800, 2500, 3300 ]
+          enum: [ 1200, 1800, 2500, 3300 ]
         slew-rate: true
         gpio-hog: true
         gpios: true
-- 
2.43.0

