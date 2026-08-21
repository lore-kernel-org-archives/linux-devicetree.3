Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C0E4D8D98
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329018; cv=none; b=JYrDjOhrWq6teRrHKANmuUB6K1xtYbUsZTT9fXUUUXVx9E++YW0j39F4+yLZX7JLrZh92dgU/pXj3uoM8INjKpWxboozv/k6ILuisqPZiEorr9TuC3vREkEp2wBRcCS8tTLBmYRnVdp+hwbMLFCUY8zokHPy7QKkPr7OrffYDGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329018; c=relaxed/simple;
	bh=1P6RDhvtSiDFXb71Q8qA5o6thf2dYrqwTXxVWaBRO0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rY2A0HyXejV32UixddABaHbf/FpbIenFqidSUHhZ2OStU5BIBym94fnLQr4Zh13IiQOv3Mnzhmuy3cw7cx0V6z73cWjtRV2GkJKxGr3AIL+15ZcedMCOwIQkrwIv6EW7/tCUAdXjFSfryrDjwlr1F5JOifK+KC170DewfDoJpTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ImLx9AMY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ImLx9AMY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49800c6a846so11193815e9.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1787329014; x=1787933814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+zNPBGZnzCFSe3FXKrZanJvr+O9PoiberfFLnMHO0A=;
        b=ImLx9AMYTs4T/IiV2rmYDLrIi0zkk86sVK4jMXFHulI9StSab6FDF7JRwmUPDdLMnb
         /UKM/CDsP7F2nfg4CZRaYeXY89rIBHMyhcxksjoL0+ppXR127fXQeYOxb7dh23+ym3yK
         p0gZwWF38HKAD8MtMDQ6+Ccw2beO4qQkRbOkrBPcUIMG0lJ3H1P3ReSnVh6dE84OJX2R
         VB6QFk/2pNUBC5JOCeDfV8o3w5jqZmhWM+K/mz+D4a8mApb2VfgCuMCglVYNa0ee8v+Z
         06gxloE9JLv8kGst/cDm9LKucF/l0ojXJxiwaOWAfzpfd7Qoor6EGDflOnWRl3VMlMxD
         z36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329014; x=1787933814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+zNPBGZnzCFSe3FXKrZanJvr+O9PoiberfFLnMHO0A=;
        b=BIOwG5YZ/iaWjYWoXDM7hZoSAvdoaQoRDdY0CDo0nUyjGSGZ16JqASBoEkqE/RnyCo
         uWzV5Tr9HBC8FvXR02Yt0SD6SXvgNd9TKQSyJKeoRD0OFVKoA+4M91v6fUIw+LIX3nag
         gMCPEEds4HuVYiSv0J9CiHdCtCRzTilk84ovfYW2D3NYnElAGYozM7uOKR5oJI9mhNmO
         h41XD3t6X33H7BXfRKmC9lIIjyU6E3kesq714Sir9r9D9GIlayLBu5X9EtR/CTXWY+Tg
         Zz5t8JJJ8oNii/xFL+Miliqf3FRQxGmoneorZGzdLsOwtELGgQdJfii93TyWHenuXCkl
         1S6g==
X-Forwarded-Encrypted: i=1; AHgh+RpybZ8UAlototFE9rSgVffRYG82nGh/QobYcS7bQlfVKQzoRkSrOAEgHoyiozQjJjSzw3tkYPt+O13v@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh02KTyER+RE0c7JIakZFVJo0TQ0fRGuMohlNOTVk4mDdEXdcB
	9ZU6fbYC0Bi2/oOytWmufkntCMbmI4r5UnfUiQdYYY5aefgbBwbp9VTSO7xxCwYfe0g=
X-Gm-Gg: AR+sD119PetgIhTegttFiSR+ChGvvZ6PkMBuoKYZyWcbjdWEkmK7+GFo5sMv9WOi3VF
	eyImxzwcubUOzJaHtBmfyh5VO6w4psy2iLmAtrkdDEhZM3kOD1CwJvC2nmwZPtWKHwhJYTtzgl6
	PqqpQ6X63Dxszzw3EnvRIxGoCkf7QfB4moCZEle/RXn0MB8wEnypJsCDPXSjUJAK0vRvYBPGHOm
	q+eDKujNqRXzuI+I5ovxLmc9YfsafvF8MTVjtldv10OmLLA7ZfsM1iu0qZKxwwgyswPud1uJqtd
	q2lWEArl01g5IOPM3DuJLwkW5/sI4sCCsPJ7x5n/Bq8V3MA/Cy4eJeu9SVx2J/NsIfT2BYpThsf
	P9gmZl4xRrhGNBbOoKiWIThzpPN2lhdD5QWpAbjPBZ+xoKgNzGAuojLYoQf83lwWkHrB/fsK7CU
	jUaYEyaIRgPyQb/+fpz7WoqRtAyyhFcT7qHudT+TlsI5JG5QTHtKt/R0itdafALEwGjtKbes0j8
	5ansFJKRjuPPxuDs2THE2KPfM7e4fE5jOQJYL1Hfw==
X-Received: by 2002:a05:600c:6217:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499b8460e7fmr126925575e9.12.1787329013587;
        Fri, 21 Aug 2026 09:16:53 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-94.alshamil.net.ae. [86.98.192.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bd581a49sm10245235e9.1.2026.08.21.09.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:16:53 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 21 Aug 2026 20:16:34 +0400
Subject: [PATCH 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for supply
 regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-hd3ss3220-regulators-v1-1-405e5c4fb306@flipper.net>
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
In-Reply-To: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=alchark@flipper.net;
 h=from:subject:message-id; bh=1P6RDhvtSiDFXb71Q8qA5o6thf2dYrqwTXxVWaBRO0Y=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR1VL5eOUtJWqxvPeuseqXGhYbFEz69njVza92FmVOVV
 gdFv05Q7pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqteYwMmzqDRS4oOJ2o1HNLJT3a6PX6ogylfhriYJ6vgvPsnc+OM7wk7FWOnz
 KTJ5+c/sZ/eaXODRWTZeS61+r3ue6bIHragVNXgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

HD3SS3220 requires two supply regulators to operate. It also strictly
requires that 5V is present before 3.3V, otherwise it gets backpowered
in a non-functional state through the 3.3V rail and kills the I2C bus.

Add both supply regulators to enable their explicit description in board
device trees.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
index 06099e93c6c3..654a982666dd 100644
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -25,6 +25,15 @@ properties:
   interrupts:
     maxItems: 1
 
+  vcc33-supply:
+    description: 3.3V supply (VCC33 pin), powering the SuperSpeed 2:1 MUX.
+
+  vdd5-supply:
+    description:
+      5V supply (VDD5 pin), powering the CC controller and sourcing VCONN.
+      VDD5 has to be stable for at least tVDD5V_PG (2ms) before VCC33 starts
+      ramping up, unless ENn_CC is held high while both rails ramp up.
+
   id-gpios:
     description:
       An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
@@ -68,6 +77,8 @@ examples:
             reg = <0x47>;
             interrupt-parent = <&gpio6>;
             interrupts = <3>;
+            vcc33-supply = <&vcc3v3_control>;
+            vdd5-supply = <&vcc5v0_device_s0>;
 
             ports {
                 #address-cells = <1>;

-- 
2.54.0

