Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB443991D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223376; cv=none; b=cSIuhSGkhJTLXPCO9hxNdTVv9Ld8aTYnmeaCBxLGEIa5AdE+EzEj2L6S9kouD/TWv3pnwWxDUuTyZBJ4fRwfTHs31w59ZyRxRsNUBlsMXThM+4g4CEdDpq8rQWk7MBdvO94pJATKw3KxvqzFqZz9UFJGzdIiIfgB2d0puQAD4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223376; c=relaxed/simple;
	bh=fJltLhLA2QC5IBK4IlrMdfGFMwZnwxS8+Su9z2qyXbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJilRc+rVJYRo54+nSg1OC6XQXvJTC0VurFD+k5PXZlwml7+CWlRBsqz2QjMC7vzLl9mZPOWJ7J+E1F1LfvzBY6GppW7p45F9LUu+QxfbCl82rzM6c9RDZF76TfNpHgRo+H+HgIiexlzvO+jP4/DAmX36Jv58+2w5Gbijc7d71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpvWabJr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpvWabJr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49546c690ffso3355405e9.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784223372; x=1784828172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tH3vOBg6Uhm3v0R0bwuHJN3nbISSCYwbAVygdnWGM/8=;
        b=fpvWabJrFHTVvCFIzKUqu66GKsyxEniPU6ix/cU9s2O2d1wByBQ+YWbm9ASt+M50U5
         2/qD8gkNVE/HfX9WzrGjCokdQtK/U4JMt+0uUiun/UxFsTiD2WZu07Vd5nANWTX7t5HT
         4g2zzCROTZVJK2+YDd8f/+yJeNXymt/vknGuMJYdRxN2ySR0hjWI9gaZHTopqvabODYF
         8CFpx2KmkftKgY6sbY3KxXZzmV9jrxERxc2G/zVS7S2Sv+W1xDoO7Wwgj2WvXQCHw5UY
         fn3QmkrQ2Af4SRS8/142X6UMUC2IaKcB+2DySxXYHGzeS4rOS8SPJMtPb6bUsMg1tPXh
         wYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223372; x=1784828172;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH3vOBg6Uhm3v0R0bwuHJN3nbISSCYwbAVygdnWGM/8=;
        b=OOW3q/Bs/R9+PQrSZOFZFH27nwO3eEgIXJ271NZuwKB9wlUwHxowa4B1Bnupxd6O+F
         C6aDRJwevk0002HU6w6VxSz+XtkHkkxQjIwAkZcgnwVZgbAZ6L6ZdgJpypRpOtKI+V7s
         6AADOdHSdVqO3AxVII40wwvuPIA1m1JDlHl8oeNpku5ATpy5h+FxuGTVlhM6S8pGI74O
         mgbtoTn6yXtQx7Kzy76lbIzDzU2RLDXy46keaBcllCgas3f81nTgkWq7GNB5SVrN+hQe
         osfET3W9/wZvJtHCp/HLu5t5NKnoEgi4AUTyKkdOR14yEX2MLWHPvANzTUxIp70Rr4Po
         qUPw==
X-Forwarded-Encrypted: i=1; AHgh+RringOgKU0rWyjKsvz2vnZ0Om6+qDFB5SVwuQVokKSUF//sgNW67uuYEFCkIxcka4gWR5/noeVHAnfw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfrd3gM8GBUilKHmwCwIV6vHr2rrlq45CHYeM6mJE9ps9klOfv
	76JcayRurSUrrWQdP/Fm1KPkwTbrU6sRSxDT0qA6yh/7Pn+XYKXwz/Z2
X-Gm-Gg: AfdE7cm1u1bq2WevAVDOQxeSZvc+9qY20ZeI02Enu9uyDEdE1GlU65IHLDYGu5/ISKs
	qUyODMAhsqtc5G2nHwkst+EXJQoqzwC+GPeBO37bK7tuiJlGWPmGb68eS045b31VsSWDW2q/nYY
	3ppdFYWyfSN5Fo4ZFuHOYNmvDACSzwq6RmkD+3GHjXtcEgeZKynY5+TYwVzPNQfmzbsmYUXvYjv
	52AXw6wTmtf3/CoTOUfb3zLYIeSjSzEuT2LWD8axmnP2tG/qAWpIFvMgvnXe98qM04D0kjpMxwp
	mxKz2pv/SlLdRESprv+TK4RyhLXtFYRBThSWrEkdE5fLKGdUGDken3T/6coS5/IkDmHnGfGixo+
	ZRTmpXejb6gOGd6yEQh/3RQrwoZxyJyCcL+Ldi9jrSA4VV0OM5AiifXJXnW8ygHk4YeTEEwA8Kh
	HiU7Gg5ueV3ZGQiO+7A/b4A3D4tHjEo3WE+y5kCee1Or7URQpP83RX7iQfyfgMAWbg/LLZ9pAwY
	zKKUg==
X-Received: by 2002:a05:600c:4593:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-4953c14752amr98306525e9.8.1784223372404;
        Thu, 16 Jul 2026 10:36:12 -0700 (PDT)
Received: from izzolab.play.pl (77-236-3-190.static.play.pl. [77.236.3.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954812f0d0sm7983005e9.12.2026.07.16.10.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:36:12 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Wi=C5=9Bniewski?= <pawel.wis.me@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] dt-bindings: iio: proximity: Add Cytron HC-SR04
Date: Thu, 16 Jul 2026 19:35:55 +0200
Message-ID: <bb79ea1b842e062dd47bd1fb31fdd15a9ef76c29.1784221074.git.pawel.wis.me@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784221074.git.pawel.wis.me@gmail.com>
References: <cover.1784221074.git.pawel.wis.me@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Cytron HC-SR04 starts a ranging cycle with an active-high trigger
pulse of at least 10 us and reports the acoustic round-trip time as
the width of an active-high echo pulse.

Add the cytron,hc-sr04 compatible and a reference to the product
manual. Update the trigger GPIO description to account for the pulse
durations used by the supported devices.

The interface matches the two-GPIO protocol implemented by the
existing SRF04 driver.

Assisted-by: ChatGPT:GPT-5.6 Thinking
Signed-off-by: Paweł Wiśniewski <pawel.wis.me@gmail.com>
---
 .../devicetree/bindings/iio/proximity/devantech-srf04.yaml   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
index ce795279839e..f4237ae612ab 100644
--- a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/proximity/devantech-srf04.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Devantech SRF04 and Maxbotix mb1000 ultrasonic range finder
+title: Devantech SRF04 and Maxbotix mb1000 and Cytron HC-SR04 ultrasonic range finder
 
 maintainers:
   - Andreas Klinger <ak@it-klinger.de>
@@ -21,9 +21,12 @@ description: |
 
   https://www.maxbotix.com/documents/LV-MaxSonar-EZ_Datasheet.pdf
 
+  https://botland.com.pl/index.php?controller=attachment&id_attachment=476
+
 properties:
   compatible:
     enum:
+      - cytron,hc-sr04
       - devantech,srf04
       - maxbotix,mb1000
       - maxbotix,mb1010
-- 
2.47.3

