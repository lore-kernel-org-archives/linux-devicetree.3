Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B7346781
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780111218; cv=none; b=j0XdO7pBo8cavZzzmhw6Rf7IAk4bp60IZbVCpfMK1PT5HejTCbXpfWYCHY3kagA7SBlhUeMDYD0B3oUQrxvIpU2+Zq3e5FI0Y3roaSROaxeLa9h+srRdm3H6/DUw2WMjv+nMq+UpKeyaToKkeiZmmCKCknC6cR1lF1cOdbWGqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780111218; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2NECaSlS5mkKBJceJtirJSydf/UU1ACOZvTNpER3ZBPMZbNL1WEzkQ3sQJR+l9YaWjECBliahC+OTcfAHrtbwEsHOaqZExyy045uiqLsPiecMD17g4GFreZ/v/qk+Hst/+GJ8Kq8eGMrJA34DH0CAkRdHtF7u6R16qA2W95Ko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeUFRL18; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeUFRL18"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69de16f5f79so1825661eaf.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780111216; x=1780716016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=AeUFRL184/r9zeP6w7TjOO9W7SwyO9fwaHwo49wMIk7mkk1FNhShblGns/5phj4soS
         jHfA73cf8w5W5ZoMRRF57/vvB11B9c+UJqDZHZh8ouqJJS6SDLaPs1QjsESoa75t3aTl
         cR0KV1GqSzY6mtE1AkvrZ5x+U5eF9yTD5tAoW8vIXCj0IRslThG7Hr8KdBiequL04Gg/
         UdCanZN4HT2rCRruKY8lDMsR+yYid7gEU1XYG2f/DkDnEV0pQ3uLMqiqkNmGTtFjMEmS
         Evs/HtHTNy+2fBOrCMzyhZ842/L6jZXTNF/BElcVLSv2Iqn2+iY/0ygTu1Gah7+EwUD+
         ygUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780111216; x=1780716016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=S/fY7h2DVmzN145ZfwFieh/u7jgP9lvBu/klhxoEgZJur4IbG20ccaOx5TzOMMtuaB
         O5Z4IoHYCxbnRs5RXmKKZwpAIcQL73FMxQAOng3MDhDBZVJlWQS6mROOIhfL4uDPASwe
         CSRM9xZQ/T28cMSgJEPSwMLZFok4F830/Dxe/A/YFgszu3wr0aamd2XouzTdzD1E8f/T
         BQboUozmZt1PdBCb/eTPy0hSywVvUPFy6TQ1pbJt/GxaGtts2Moe+A/9Ro9TRoNh2DH2
         O2Sii+sBEBInDzMCljZSxkJTes3von2r4naRUjMLIAi67A0IPTu1C+kD/G00TTgQ7yhG
         sGNA==
X-Forwarded-Encrypted: i=1; AFNElJ+71SCdgl8KqsRkGV0ERN6OPwAh2NW+DUyLJvD20nt6jtwNARJvqbUcAVSiTY1m6YsDngzN7uGx6VvI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeqf152tglBv2XGv1nRjtVx2RbuNJOlv0dxHts4d1yZNHyZ+kf
	M4dubNqWyrX9D7FPfHAuwsh3UEokWOj88CnyPMe9Wc5JUBMKsqFmUhPQ
X-Gm-Gg: Acq92OH+ezvg/annY2TZ9zKZJufduEHTPTNs2U6yfc/2VmYvKJyIcLbuAuP5/TRr1sF
	PGkIovPlZmONCc3J76ipUllmo1n1rCOp7IXhBnI6rCD9EcSvJ2CBxMfOt+wHVh8+1bTtFew05yC
	wJT1RUdoH0YLHPSsc1ptk0SXLOVEFwwnBxI3tPkutVpvfdTSnQUcT5p1ZzIihD+eD00XOAVrg5P
	DQG4wA1o/p/G1tFA+RbZsNZAK3XuUGY1f0rjZs1b7MOb1jrjRu/MSRD2jhSJyVfx4vwWKxCGVwQ
	+ZSl7cnJaVChJrWX80qwAuIXu4f8PMBAdnEtVt5iMEKNYYnY/hMYdL49qCNq29sYtn3dhycFlR6
	4MxDRbOn4ZP8ZM81lFVeRtcgKZ94g9pTmrmWHboaAetAwhc+AVmwB2Ys3ZGEjICtZmOCV+xHAqU
	I7680wxzhz7xCVVPZLwAEcgL0Wzk7VeEY=
X-Received: by 2002:a05:6820:1510:b0:69d:f3a6:1f59 with SMTP id 006d021491bc7-69e102fb42amr1171488eaf.27.1780111216200;
        Fri, 29 May 2026 20:20:16 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e067e911csm2130737eaf.5.2026.05.29.20.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 20:20:15 -0700 (PDT)
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
Subject: [PATCH V9 01/11] dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
Date: Fri, 29 May 2026 22:17:28 -0500
Message-ID: <20260530031739.109063-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530031739.109063-1-macroalpha82@gmail.com>
References: <20260530031739.109063-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add mount-matrix attribute to schema. This attribute has been supported
since the first revision of this driver, but was not documented.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 119e28a833fd..9b2af104f186 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -53,6 +53,8 @@ properties:
   drive-open-drain:
     type: boolean
 
+  mount-matrix: true
+
   vdd-supply:
     description: Regulator that provides power to the sensor
 
-- 
2.43.0

