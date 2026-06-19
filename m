Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B60A37FF54
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781870267; cv=none; b=hH/LhD4CeRt1vylxn/gla3TaC1Iy9KxKA/0XcHSQZhC+1cuT7OkSw2wYHHr2Q18GKBe6lH7YHcCJF+rDnpm5fVziThPFA5XD+JMH1E+wIXGyfNr4rtVlzT38dqVwWcmeRO5U2UICeYBH7593NQBmrARwePPjeMFuIDBGGzmHRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781870267; c=relaxed/simple;
	bh=qeOyo9+yDQeKXvN0Qu2xfRfXkt7RvI1EjMwY91NBdPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgOMKU+Yy3s9kclPGkwrLJQju4KmqMc1GhZOklhdqu76GM5c6P8GFnuX0+LkOHRX1TpZMnLgAlc7hML9s8apCyiHqdr/GJgSQm+fVTXK/P5nGNqqJSZXMIkxOHAK2AxCaH3x3kA8GytDuED7TkhZs83PpWpP6NvHVUASI/flYVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qk/w/+Pl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qk/w/+Pl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso15293425e9.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781870264; x=1782475064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOLs0rfxO3llnr2jSc7fsrR1KU+Ukt3MCKcwcDXPyqU=;
        b=qk/w/+PlCvJTtZqzzWOQk6Ih1I+svT5guSh8/I9ztBFVBRw1tkeI0zQ8s5oQwsd3rC
         Dm7YjzzxUWxRV9/NGqoquNZI3cEPzxwgmecwVc3UzFRTTL2F3O1avn0LhlYmYn0HY0U2
         ggC+5LhTfA0YBSB8znd8aQ33cenSMa5SdM9lHSprn+PAA+sWhPm9wQE67q058Fu3TjD0
         oOh1jmbjQMMBDc+3bMuzVO6jAntzBNEVQdyBdX7/xsZpip7zQifMrHAG30WSlhTvaO0k
         HfrbpEivsO5udcjSjaDUG5riYR0uMcxctlgQg5kx8v6gF6DuGG1eFX1Ffhp1hf3Fh3e5
         RSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781870264; x=1782475064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOLs0rfxO3llnr2jSc7fsrR1KU+Ukt3MCKcwcDXPyqU=;
        b=rIKDhuPeCM0dOV/s0wsXAf+IpUBgLAjcCWrxJRquOmXNq4My3g4VEGpb73tSBjA6sY
         nkszDINA3FiP6NoK2MJ+5gICrJWuXQ/W/nTcqSKPtYOhDEJlfNOoEL1ZBkA+b9LmYwc7
         lEjNoQzuD+AJSu5m6gKwhnG12AYDR1U2PK7Y11CCgXYKxxZcj4Txer27/Lvur+VjEj1/
         /0HNosig+1RFGLDFWW7fYkgTbLiZw5xBhFaHx6RcX2QNdJ9gQ2e7T/LCN01O1z7shhaV
         jcyka+4bTxysIO7z6pnT32U0QIDLgOq4dG3N+O4mv9CmuXtI6V7smqikv1O2Vvh5qtWc
         Id3w==
X-Forwarded-Encrypted: i=1; AFNElJ87F/EfrTnonKDQq6kSabF3BSo0L1X4jHsrcJnAetCcubIc/39KH2JSl6r24i26/G2jmpkU0Dr+n+RU@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZ3BvEKzNfrsjaeZ6tXs1MpRmSuGoAen25Sp1qD9fW3X845ZF
	1RX/MXVW38CeKuGM+GI/lNO74UcTs4QdpnunpmVbvDVw0zy/xQQ1i736
X-Gm-Gg: AfdE7clHxeu+MZZZFixsIYRQoHdR4kkRtAvDZEXmilRZlJA/ya6gNjck/ccfvc3IB2j
	mWjxq7UrkC6MjifU3niPDLVI/4wTOGZ7cX82CBTkMLUsmQvNkhOoD/zOoZ3oXMNeN+/YJdLqQem
	Ks3vKCCMjl4phVaDtGiMAqFDjKkmrOqChduwJgSbleqjo7S27oAXLzmvER1WI5PW5aPQg/f2AwN
	C8zRJvMK3hhANk8er/Pu9V0WrIvHSmobRK8x6yF21+fmfofT+xOjF9y3phLaUOisI9p3KNMF6R+
	NkGYUQXeC6jXhgMVo40v6R6GT0dNBMKNdt+yE/aogX/0h05u+Wc/KmXpbQZ5UyBuFENcFM+f9Kz
	9LfbplujVE/J8Cn2SlQbyAL1OVv8fWzGCr/kKuPn1xUuWINkJJ5F2Xa5yZak16HzNUD/Gxx/uft
	BtkHD6Rmd4IJ+26J3RwQfvFy83SFhMioJJXAx4lUgefU2v71eWIxG/5R86C+GknKaqreU=
X-Received: by 2002:a05:600c:5289:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-49240e81ac2mr51163645e9.22.1781870264183;
        Fri, 19 Jun 2026 04:57:44 -0700 (PDT)
Received: from fedora ([196.112.134.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650b67a3f3sm8326131f8f.20.2026.06.19.04.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 04:57:43 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 2/2] dt-bindings: iio: st-sensors: drop lis302dl-spi from deprecated list
Date: Fri, 19 Jun 2026 12:56:49 +0100
Message-ID: <20260619115649.840676-2-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619115649.840676-1-inasj268@gmail.com>
References: <20260619115649.840676-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

st,lis302dl-spi is only used by the misc/lis3lv02d driver. Its
binding is now in Documentation/devicetree/bindings/misc/.

Keep st,lis3lv02d in the deprecated list — the IIO i2c driver
still matches it for LIS3LV02DL support.

Tested: dt_binding_check, dtbs_check.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 Documentation/devicetree/bindings/iio/st,st-sensors.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
index a1a958215cdb..2a5451589fab 100644
--- a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
+++ b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
@@ -90,10 +90,8 @@ properties:
           - st,lsm9ds0-imu
       - description: Deprecated bindings
         enum:
-          - st,lis302dl-spi
           - st,lis3lv02d
         deprecated: true
-
   reg:
     maxItems: 1
 
-- 
2.54.0

