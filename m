Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA21F315D33
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 18:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780857449; cv=none; b=iw4J9WSzqtMCCECOSDa8fWmn6ICpAHUJxywTODlrZKZH7a90QGUMsE0jN1aCBS+w5qY9b4n48vSNW9Xo4ezAiCQDTmow8uHqQ7ZvwoODQyozRTcWdSHIIxVBGyW7e5dEoUV7UoD0KkQhVjMH7I48TYCRZiqCKZHLYdj+6oxykXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780857449; c=relaxed/simple;
	bh=yEjOX07S4zJvX1LEDBhq5IvNEprQPi0UWzNcFypZyWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFUzlIW7I3StoYDl92xlozIYnWQn2rUDTvuPNX9ZhNyPAG5xSU8EsIdkwqVNN/XVpNQ7IMEgzTClIEOyCYtGR/aDdWZBvMPFQdVkYINc7fKaG/VhEm3pj5KG1vR+mYQqVN6l44W26N0QsRITbDdyMAOaMJ8tDkJ+MkQApnZ6cBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkVXf2Wu; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkVXf2Wu"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa68dbd44fso3569881e87.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780857446; x=1781462246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2akuz5+DPpkEGyOUvAGrzEL48qzjsdIRCCP8EQOQUuU=;
        b=HkVXf2WuNm5RywlEFaUdp9vZ3uj+pS5f3BDsZJRfB0m0bAcOIE1XomvLz2QOkgWtt7
         YiOexQZT44XIOQJ3/fkxkOUe6HgOC4D3f87iPD9JPfUL51o0nqgIWX67d8UXFV0nvZEC
         7jX9oL/t7VBqaCn6vvYsyNn82ihDqPWSnmZtU2hvugf6bhJHcV2Bl7G2tpP/juqlReDG
         ORtBqN67vTLHPbcmaKmZ3esNbZnJ9HJNy4DOHLT2DZl6Huz32ehsaNqF0M7078+HN3/4
         qnF7yoJ6Fn6d5AMHrT62A4CxovbWWNuPu5zqgs5knMMIcR/2H6vbRS0ISN0SAghXzFZq
         K/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780857446; x=1781462246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2akuz5+DPpkEGyOUvAGrzEL48qzjsdIRCCP8EQOQUuU=;
        b=YJXN7yTM9kZxHUypFacRpONb6vXp2KHeUJpYRdF8rXukZWKFIzPE+tqyr0q4xvRVGC
         LqK0TDou+ZT2W/hQcnQKtYgjWzMBM6i+1ZER8Hp76R95XQPE4ZXg7aLPy8ju8zTNB2Ws
         Ph/0guHKlqX0/whobBt3prpPcV40c6EpAutPNLWHXe+X/gfOW4mzEzJIyrOPat7rEk/O
         1G2ZcrF8A+6tZNGfnA6aMkmFM9lIDOu/oY2YOQWQGsUAuwE+r8M7ZZVV+5auU+MDATM4
         WvbC9rSQKHTy5QkzXAtHO6CwbrzbfG38xPArZttwhYPZkR3cwOyK8Huy8SydvdZFQcL8
         +P/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9hhr8mWNJdLESgNYGsfiVwhkWQAnUaHoEDu2hGYkm/YX2auvGhv/m0xUPsHjaWNSpiE7rq4zV/Q6FW@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzi9usQxECWGxT5c7QozPJ1R0CFO2j+6tWvvLA3xEw/hqz5L3
	o9e8+D4ASvoFqqbSuiuthKC859HCl+a60fKDLKsU+Ff3ALB9cqQqYhF6
X-Gm-Gg: Acq92OEsc3CuZjFRra/grlP37/xn3fDRk39q5iMiEFoy9Y0baDh+40hNYpDFkCHyXA1
	ZMXbUVaGKrblGalcKx65eqmFGM+/7gvselgViEFlsKokDtTm1zpUwkV6bo3uen0htzrD+E4MqV/
	dAlqIuliwKnIBl59rQ5XmZmPlpg0oIiH1O2P8Fltew2hoCmnvPe0CJaBiKKWlbZuzT7GNJeHtI7
	l6NT/VYPSXQi3DJZGfoFWCOuHPU4XtVjJRPtLgFDmAqpblFelslJlU657bkR66kULM9+yMKDf6n
	IZVZlXVdrZgySoAWJvTfzyuKJwCGL8dTjGAClRVXsfQdUiBveSsm73T7Tq4eO/YYTiYw/+gEnOQ
	eSLbx8Ho8+miG08p2tCuaJ9t2KbNyrjAJ2O0fu3NcrL3KQxCUjdmHhCavUWIo4qZo3JlCmB/GiI
	3t7cMXb1NWLeFUehKn3fop7YtkP8HGL8SObi+uhNoeCu+MgXq2Ot2gghwjmafansiGKXM=
X-Received: by 2002:a05:6512:8046:b0:5aa:b6b:f6ec with SMTP id 2adb3069b0e04-5aa87baf627mr2236328e87.42.1780857445711;
        Sun, 07 Jun 2026 11:37:25 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:efe3:f920:63b7:5b7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fc426sm3240809e87.26.2026.06.07.11.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:37:24 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jorge.marques@analog.com,
	antoniu.miclaus@analog.com,
	mazziesaccount@gmail.com,
	jishnu.prakash@oss.qualcomm.com,
	duje@dujemihanovic.xyz,
	wens@kernel.org,
	sakari.ailus@linux.intel.com,
	linusw@kernel.org,
	jszczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH 1/3] dt-bindings: iio: adc: Update title and enum
Date: Sun,  7 Jun 2026 20:35:40 +0200
Message-ID: <20260607183542.368184-2-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607183542.368184-1-jakubszczudlo40@gmail.com>
References: <20260607183542.368184-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jszczudlo <jakubszczudlo40@gmail.com>

Add ads1110 into title and enum compatible for ads1100 driver.

Signed-off-by: jszczudlo <jakubszczudlo40@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
index 970ccab15e1e..4c43996b7ec6 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/adc/ti,ads1100.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI ADS1100/ADS1000 single channel I2C analog to digital converter
+title: TI ADS1100/ADS1000/ADS1110 single channel I2C analog to digital converter
 
 maintainers:
   - Mike Looijmans <mike.looijmans@topic.nl>
@@ -17,6 +17,7 @@ properties:
     enum:
       - ti,ads1100
       - ti,ads1000
+      - ti,ads1110
 
   reg:
     maxItems: 1
-- 
2.47.3

