Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736136;
	b=SrLDzPx09p0W62Cf00BrMEyLcOMET9A13iblb23huIgdy2DG+ooggoLIpXgEYHw27ygk
	 pXjTUvynVy/IXEM1S0IS+Jul0vTlHLKcBWeOXQUFljW7ypkAlB0siYmJ+Xh8cKYxyJ7Ck
	 e8SPQPUlNnyUj6PaJPEJuhR7+YzG1b1JJ64eQsfK/xN8whQJJLH6yVg5wob5o5R2KVbOl
	 EBpjWpSCxMEuYTgOONJI0qyErZs1XsQkrrnI5yOohw7xwqFknyczPAVbqMEWHaBaE8Mpe
	 ozgBLsVT61bIs70S5tAq+83fHXf0rMWuU10YiV8NbmaJyaHqgQM3dTo4Xeo+crRnzqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
	b=VbbR8i3+Yn7AJcTWAPxvNGhnuKM2IEau1t2x+E+w+Zvv/kCZNhHlpGeVv21vDbuVloiD
	 9888WLoYIEWaUncPZFi8TqqL3ZnXVwtXVwRkGzf4D4BTA5IbFqYSJTZ2FsQSVfSVjmugy
	 L79YcwlS03Y0axgTn6LOOm0XprC4YsU4Vod9dB+au+P+Mu8KO/ix3JQTetYsTu9uGnRJ+
	 n1CfwRncVJ37IIP5MKFEA7xF/jYd/fKPs6vaBFZHV++2PcfJYWbkMs4LPWZltOQ9tbBdL
	 HFWBHN8+hWylQ6vhxLXqnLkyaKzY8/9nrEFsMjmMTNNLqV4BhvC7xWdsX0QLng7yysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI5xhvfq;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE58606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE58606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI5xhvfq
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6798af41644so32924d50.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736135; x=1794340935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=nI5xhvfqJJqz/LKU3zu9PbzpzfQ5Va50DydxwoMOt8UGt+zI2aGOnKnPmhWE4PvpgO
         /jTWkeTivaXjLbzL4+7hJGs+vGgdNVRC4351EbuQnq6oPZrzzQ6uS3j9V5D3NV5yYtW+
         CbkFsNgBvcccolvTvLKds+5z5XXUJCRRXYGDya4kmX4KMrbgPKbUm8TMZ9rA8+Svw1QM
         8Bn8rVQdvK8VcVczpN9jw6uimilyL6otP697wUg+DpBEnweVU2NOlW3Iz4mYQrB4Q+0U
         dtuVH8TH8z+VORkTnLGEc0w0t/QwxZLluGu93dj4Ei1eDPPa2xF90n3EI5CGWdpgAHh6
         Vd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736135; x=1794340935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=WegzWI01tv9mo3To8d7BKNVQD9iqzxSKeSnWiy+nOlJYOs8MHpAxp3vIyw5huODR+J
         G+mi40wtvgA2GPJNxyeJEISsYttJl+FEUE3hfj7JcTq3bHQZcns5rb349+M5gAIGobrA
         bUa3NOWWShjU1KuDQeQgj2mts1LJL7ArW0o9bVNVRnY7Azdsiq78kdM3r/1u22L+bGeD
         m18pPI2DBK3GiJDoO2RUiDUWxzQ9JxGzyYGLId+bYDFwjJNbpNWvzVxYMk+3e9PutmMG
         J+Qr4gSwUPU968Xz8AQB0tBgcRTrh2w5e82SAB4YcnSJTfbu2G6lCMQi669VKAnJ8vxp
         XYgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3eEARu42BhweQ8s5cMHsPcpWcju/2M4T399M4dpZIBVQHDNMbTK1VPvICF2xzh5mCkPGRFXqlig36@vger.kernel.org
X-Gm-Message-State: APuU4Z+AeMmf28dVDmc/Npdd96j9/0AQNcMjMxsOO6OtHxbSEVAtT0WT
	oLUQQ8VqFscrNK7XBRpwryHJNjAxWMjSOf7TTduJtOrQTeHXXb7PL/4f
X-Gm-Gg: AYBFou08qtSqqXy9+1iDOfWTn/rf4Jk3JKl7MIM2q0pjb3jfTRj4YO/uJ0ap5X8vXc/
	vxWr3vHuJsG09Z+QaLE02VFCEWHMobzpTdbZ0NoM2l/zVbCKFkzq0XQyQfT7YwhtubKbQ/DCF7h
	y7H1GCakQTH/swwGMp7nUD0rRRpop/GHdm1yzwvDUDHunV6iRh5tmM1SWSTk8ZVhhvpW/4MKSU2
	gVjr/HeeJTI6pti9+DQfdF2gnX2ED4yGnji1FhLJ7PmShe/SigdkZTI8zDnpYbPSbZVjcckPvsy
	q1YQsmapcT7wJx6SXH5YqDqRT3MXyd2zQvZeeybH53xnUQWIAnlZsFaac4Mc3Ax6zc4Zghaj83Y
	LrW03J/4XyZyLfMnCiLGObIC1QyPdawo773XttHps9s7XjoRUb4IfJmW+vNDmtNiWillvBzXyWN
	4BOqigBzMr9wCxQt490zYEBdF7afFjSW2dtob/bnEA6p9RZxV79hOw480c4Oyzqc9fI1yB+NkQg
	YjO8JHqkr2qyjZWWy1Mdi10F7v5FvouiBqG4x2TPjlbRYgV3l7YVaoT45+rU1cYRqlf1arl8GU3
	aESswig2xjHWmil7G2umPtuNn99CfzM8iFctJzk+3cQ/J0tlUTuO
X-Received: by 2002:a05:690e:128b:b0:67b:d315:7770 with SMTP id 956f58d0204a3-67bd3157831mr3828276d50.27.1793736134436;
        Tue, 03 Nov 2026 12:02:14 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:13 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH v2 1/2] dt-bindings: usb: microchip,usb251xb: add battery-charging-enable property
Date: Tue,  3 Nov 2026 17:01:53 -0300
Message-ID: <20261103200154.125681-2-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103200154.125681-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-1-jhonwilker0112@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Describe the battery-charging-enable property as a list of downstream ports in the USB251x device tree binding.

Add an example that enables charging on ports 1 and 2.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
index 0329a6aaaa928..0eb3035553c37 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
@@ -230,6 +230,12 @@ properties:
       Specifies the time it takes from the time the host initiates the
       power-on sequence to a port until the port has adequate power.
 
+  battery-charging-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Specifies the downstream ports which will have battery charging enabled.
+      Battery charging is disabled on all ports by default.
+
   swap-dx-lanes:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
@@ -264,6 +270,7 @@ examples:
         manufacturer = "Foo";
         product = "Foo-Bar";
         serial = "1234567890A";
+        battery-charging-enable = <1 2>;
         /* correct misplaced usb connectors on port 1,2 */
         swap-dx-lanes = <1 2>;
       };
-- 
2.43.0

