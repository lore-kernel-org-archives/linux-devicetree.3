Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C4347D478
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805595; cv=none; b=mNP39CW2hkmv4p20tCUxpK8I6H42Tujqk+OaWhTBESJygYBLT4HTlcjv772xZv2L3+I6yxjYmcdK/Ojzro3FfCtmoWi3ZE31CfQeOn/N6SZ9AqQhWvsTGC+BH02hRvmwzeX4YpfD7EysojMhA7H1Uq86g5Bt1nPS3gzCVZwdWEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805595; c=relaxed/simple;
	bh=EDVRJCkzx89jDEe+Pl3psDSsRUyzz6EKZz4YhpQWGUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FV2k427HMIndBaRff2a7gqdPMQYDGrwNbxoxu4QPBOyctETR0nInwfxZ1OZqYdoGkhd/Q6e6WZ5Z6JjsuwOp24HoQ+BgNkuzJRqmZhyoVmXzxtT1vnZIOkoGxf336kJNYI//sWUti5AcZ+9e4TG+WO6tDOHAwAUixD42/sVhi/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDs57S5p; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDs57S5p"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e7496f947so285438366b.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805591; x=1792410391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yECm1RLd5ULC3OdA5Y1glV8njf74UTs5u5isG2u8hV8=;
        b=bDs57S5p+mObIf42HyGpoK6iAVize1G1MDd/7DDF5QC6LLMj1Vrz/B4Xg7WO8LQDse
         gvqUG7k6Fu97rYpVwfK+j0ODTO+hRUVzH46twYh0GYM18R1E/fSkdRjyIwdqHicNVacu
         dW0etEKGL/dinLEQI3EYc1jp7nBBkbAlHWdlQ7lYp0v07OrgwNIzzxc18gIminUKbgau
         BKVjRefvuKc0/euZSZFkz7cxh6XNAg+Hjhs1WBLNsa6rty3OBGW1t6nKJkhNpbibtVY/
         J77AskGx4MTX4eaccuvSy5QMqzf7e5/xgqzc084xCJoyNc7TMs94lRiCdzMHi67ycYVe
         xV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805591; x=1792410391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yECm1RLd5ULC3OdA5Y1glV8njf74UTs5u5isG2u8hV8=;
        b=B8YlofS3+X0xHUV4FuHkGRiSqAq5tpnZ+oYd9FSGyPFcJ7SNJZ1HuQfGosRsSc1QWn
         QD7xVwXoVEP+PTx7CG5wo8TxbXZI+kDFTFZWwsoXIq5imO4p8fybt3LeTzE/XW40jQ3M
         C3FQfvUP4I4d++e6nskpIDMZLm+YbbVygJeZXwzi9jnkBovsoagILzPp25NNXySDH8Yb
         tufVKfel4lPgSTtztxprsyFpQnfxyioqpT7HG7O6bsPY+4nk/Kp5Waxll/d/SghxU7YP
         U2S6kYO9JjfMKkoccih+2VbY97yzpGR5taCBaXebjXxvSsZlvjlYjlI/6nmaiNHGWV3e
         sM9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuDGi4lqCcCMr+JbCdK/ySR0oMxcLcEbSQ3Oo2aNOA4G5BZTt4w1VDqJMV/6yjJquEQL4Fsk91pkg/@vger.kernel.org
X-Gm-Message-State: AFq9FYLoaKgQxcHeWTJG4sV6Yk9Ye3rYpDVf65Nb/l3qxxzwaNdnwGkI
	xoea0g+2McvHFNJ5ECcXXT2sjawa/9Fv6W2K0XiVWtbgV+gnHZaCCBvG75B7e3f9
X-Gm-Gg: AYBFou3w/HBkKnfNOWtTItob8x+B8v+evdzV3i/K/UMOdxS/57e/awLAizDDI2rWSlL
	fHc53OhYzTj86fyeTfRlDrYeiBbb/Gnzsnwm6m5kQZ+5x+L+AnRhSsSIs6kKc/MKwA39+xeT+qo
	jKtIJ0zBMHbl/NoSFwJfOQkUnCOn/mIm9TmT1ntD/fUi5JKjh+c43zi28DmTov7VATnqeEcHLw4
	kJT24ewpcU6RMKwi4h1UrM2HPaKOkctMiwJOPXDa8m8PrYDFkDtkXf44JidVuz622RtITriS3ET
	y/scWJUJj/+J9hJNY5s5CMrc3dt/jpMIxxh84CFcDPSvQeP9BWX9tS8Bw5Gp2yS6zfj/QepUQRc
	ZFStEc/ObZ8ClflO7R++joRCunNKVaVvjjknYy11+a/zsAc3yX5qDYwXs1XIJgRA3D0GAarjktA
	f2zfnH14zOgTzfzXPJwsjtuEV240WKbVFY+cILD44wOqQhral3dNuitletCNpd+oxnmg+y3UjRT
	jhDzGTlUP6imq53CwV+7YqVuyJ2HhgaXYduVXMX4V5ONPZwVYYwI8e8Gdy9OVrZV2hS8jXr1scL
	wN0usowQN0FWjale/my9q4c=
X-Received: by 2002:a17:907:7fab:b0:c26:1691:b368 with SMTP id a640c23a62f3a-c31a9f6b728mr950732966b.33.1791805591090;
        Mon, 12 Oct 2026 04:46:31 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm118669266b.42.2026.10.12.04.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:46:30 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
X-Google-Original-From: Paulius Zaleckas <paulius.zaleckas@ui.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 3/4] dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
Date: Mon, 12 Oct 2026 14:45:49 +0300
Message-ID: <20261012114550.1680054-4-paulius.zaleckas@ui.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012114550.1680054-1-paulius.zaleckas@ui.com>
References: <20261012114550.1680054-1-paulius.zaleckas@ui.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paulius Zaleckas <paulius.zaleckas@gmail.com>

The Zilltek ZTS8032 is register compatible with the DPS310, but has two
more pressure calibration coefficients and takes its temperature from a
different sensor by default, so it cannot use the DPS310 compatible as a
fallback.

Assisted-by: LLM
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../devicetree/bindings/iio/pressure/infineon,dps310.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 1912a1b0b4ba..416117dfd927 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -11,12 +11,14 @@ maintainers:
 
 description:
   The DPS310 is a barometric pressure and temperature sensor with an I2C
-  interface.
+  interface. The Zilltek ZTS8032 is register compatible with it, but has
+  additional calibration coefficients.
 
 properties:
   compatible:
     enum:
       - infineon,dps310
+      - zilltek,zts8032
 
   reg:
     maxItems: 1
-- 
2.55.0

