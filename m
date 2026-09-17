Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4754CF77
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653530; cv=none; b=SZkyoqi7NhTHuGPhGTFoi2+TusB2FXtNJx+o22O0vOA56UpHjGjdwLqfTTmO0trSti5720mbuB0MN0aGVEBAg/VsXoGbdNympYxyFI/R38dJ2Wx7ZDvFEGvurLKnhjDnEgfvBq9WKNtG/NsseL5mvP/m+1U0r32dQtjNRgaIJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653530; c=relaxed/simple;
	bh=Zja5ba90Kazl7NPwGZQwwIyfLc90p+z6FNKULP8ntRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnyxB6eIXnZ3Lx3Gkh1JSOdqe1zPr3UqY56RjTGLHcsCtzh4a6H83UtNE+LDJvUatxB5oC7l7QB7imMTvtLjFPC1D2R/elCOeGHJ7CoK2uxNHUNeKt1/I+2kXnEp3Olb49zTqOvwTyNPs/DF7WS7JcpZhptQVDhCLQTR5Y8JjWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh7wGCoi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh7wGCoi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so645037f8f.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653527; x=1790258327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM/W5OiE7zuL0Fj+5+8EggB4ExQGwHREFTFpjNObiQ8=;
        b=dh7wGCoi22nVyeiGkA5UiiMZTpwbyhrPLsFceIFwXvTa+XJMj0591e0EgBTsda71E3
         HYBVgq5EsWXngYnoJ/iySl03ecKqDQL+0cPOqjDc+d1JTW/WNtyKFe4rScvtnh9nUwJD
         fx4hHOWEZtRwjin1QRpLcFpddFpFbzRLfegacsv4QcHwgoLylFu9+NtSYkmqcGc66/zF
         AE0gS4GQ2Fazuwo+m3LkvrCxUWut+qyDwrnbUSEU4MWgVcBnAvgftMbyrJWvOp/w1FNM
         Djzlo+8Zhau6PFm4pYIXNB1rY4PIWpoPzv3YrFv+Ugzo3IBi7kHQi1ggneCUh3tAGkQG
         XURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653527; x=1790258327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DM/W5OiE7zuL0Fj+5+8EggB4ExQGwHREFTFpjNObiQ8=;
        b=sWBjLM6QBpDe02OY4oesISWHxHw0x+cbfR0kZRqpnZRQQy41wDIUFcLvQ2Dhm7sudz
         1FS6Tj8IvhJlmpGKamTho+s1E47M7j8howR1D9VHUQMJfTUQt4JBEuRW5OgOhrjnXX6V
         8/sSB6bwZXnoQOH/el3NWJo49jvI3kJu/Ila/R2XmQhwwgb0UneQLl8daTnH/Bd7ZhiA
         i21lOHtD01d7KKfdhDIiyZAwPUo+S61/tm0wfwtDQnhW9wffOdKPujD0l2h7b7WexLV6
         DMhZ0d4TfIb23ZrBklEQaeZgjaLZdHAKm6DwFwNuxyZ5mWHKiaNsibD63fAldZBp+D1A
         Lu7A==
X-Forwarded-Encrypted: i=1; AKwUvBx0or/gvsT+2YmH3G5Sbq/iy15UKHuWZN2sy3NxFFQXdVTwyQzkVwLlrgAvSRl2e5MlInYqArMe1cEN@vger.kernel.org
X-Gm-Message-State: AFuF++nxjmqPYzmpymwZgr5jKgl8Pjf0ndf2sNXAjkf8Vqdx48kke09N
	47gU6fzjZu7ImsPrfpoMpi8tt/pCPxcNFmjFAFoE6qIB9nV4BktYrQWV
X-Gm-Gg: AYBFou0W3O5M/JWiWH3oeCGp5/PVr+laglpqT8ZTJJvqfDyA/Lq0NHcugalJINZLn1w
	Jnty8z9kTBUtF+JH60HEX64oqIQQEQ+606PoPDAcQgvoEzJxbFIE5jOmRU3mSK9WXJr3/VSv9Ru
	D0zJyt0BJ8XoJQNsAE7KeHjS7HPZgjcMeakV/U9o55c/If5If02j1qUlN0yYsTOdW5CjovAXvez
	QvMdys1gS8fgEO9hG3WEpyJBAvRpFn2enD3/okbBuVxieoe+nSrKM0hP0JbshOIp75PsU24utWA
	FeFFfwx6FZmtT5jLsDaUFYSR9de3c7q+nsO3JJQTbMVAyplEsAMvNAupXp5Txdllpk6BzwXwk2M
	Rj6ZVWFe6Ik/vJfXIBZZ84rg/NNvECcUJVcFSu07NblmNTOffp3O9Cl/PmvMogGfLIm/uEGOwRN
	uce+hUY6BinOfc2cmldpB9hLWyuL46fXGiVqdeBWeQTV0QkLqeIi6ZCBDao+xO8G91ngdL8fIGN
	D8N0JvRzZFbyOvjK2bIMF4eNAUOy0FqMcpyMqJ4g4dtvEJEcWd1BVAKYw==
X-Received: by 2002:a05:6000:4543:b0:487:62d:37d6 with SMTP id ffacd0b85a97d-4870d062278mr12784911f8f.23.1789653526791;
        Thu, 17 Sep 2026 06:58:46 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf414c3sm12851706f8f.30.2026.09.17.06.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:58:46 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Thu, 17 Sep 2026 15:58:40 +0200
Message-ID: <20260917135841.841680-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917135841.841680-1-sander.speetjens@gmail.com>
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add trickle-voltage-millivolt property for the Raspberry Pi 5 RTC.

V2 -> V3: Fixed the firmware property naming

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..dc71fd57834e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,11 @@ properties:
     required:
       - compatible
 
+  trickle-voltage-millivolt:
+    $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
+    minimum: 1300
+    maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -144,6 +149,7 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
         mboxes = <&mailbox>;
+        trickle-voltage-millivolt = <3300>;
 
         firmware_clocks: clocks {
             compatible = "raspberrypi,firmware-clocks";
-- 
2.55.0

