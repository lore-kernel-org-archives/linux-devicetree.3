Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0026A3A75A3
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209717; cv=none; b=LppwcxHiCRp/T9Zn1VAS2XJk5Ay+JUuzGvx3nfFjJPZd2203AzB0VQoJvTRGWNTahtgEksuX2BJsA5WW+ZTUt2XP+alsv9/2+M0167VBs71/xflzNl/FW2i5o4w5yKNtfC4bnW4uRT/pZ7UcPXEsGFwaBgQ3PjD/Oy7JoaIKG90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209717; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eu9hU7K1CAvl0D7OZwGaCgTzSNH+ii9YQ1jz6njYZJSu8kiQNj2YbbQVgcGptZsETJNQGKotTj9BxupTeKWRPbLRA1EGyNFFwYee0brdbW5A+FkonI1PN0frAKoGfY9d4w+NhqoZfGp8qlkl40oJWy13z1twrBbs0vApJ2RdrWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+I0TCVR; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+I0TCVR"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69de9bc590aso240868eaf.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781209715; x=1781814515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=W+I0TCVRDA11kccuECYsfkJQ9k+Vb+Gu/III/3veZvp4Qvmpo+Daw6qFKWSphfcmOG
         z7uPBPyWwfkaupak27fCK4TzdSgRBYhMn6dYxpka+Ym29MCDgzZy0zr/J2yLUb9uoepV
         eQCgSzeylw2jvGqhWNpmAHXUswg/w7by+b/X59BWFJyALiqA2GC5Cns7tAZvYd3j7/5c
         dE5LNjS0xc2I3pvmfGVxXedBwR8HGePKUtkqnmeAMOhqoULMZfBkR1OGk8kELKVnO5F+
         HAIWUSvsU/fEi6LD9XOja507fmNHCR0VWculGsMQ/pL4vsNlP+xAG+GStmhIqJFLO9pz
         KGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209715; x=1781814515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=h1OPkeaO5OWGjWX7BhbJqQec//IfwAGGtqsDVxQjaiU/OoWk3rgqyMi42LJ6/9mdL8
         gDUdlmTFe9fDerirI0wSwuJMSnJcI3iXIi7AVV7JrfJtK7RbGbemBFHurzm5ac1Lss7b
         tYuOCwoxI4r55Pe4JQ02O4TTfbRvy/7+JH2SUpHbX4rGtR9T+ibVAwE4hUhEcf/fvcMD
         WzYqwakqmFUIiYB4jN/NrUT0m/ty796fZ5MiG8dKCv3fSUbAU7R8vUGUp0ilHqFC8R6e
         dOIoAXL+1jVvuqmkAcGT8ks+9KRUTDezl3hQJ91q2yqz2jjS8Oym8PcYlP9fC1kPYnqH
         xQgg==
X-Forwarded-Encrypted: i=1; AFNElJ9DFmSI0o5387hSkTsn59+lXKag4NcsprUf+ymrPU0KpaUxYdHwOg9W8qS520Vvt/lFcNx4MC/9GuC1@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQXioQaswR3MPtRCuLzaTwjjhhAVTCuZS8+O6h39K3XTZc0Xn
	hFjGTRs4CJ5uWBdhlYMtClB9EumZCFFqaRUyMKjNApXhMBPpBx5UWqgW
X-Gm-Gg: Acq92OHl36ztpsUXGMZfMTTvQdT7i0ax+kMkY0qMQuMVY+6PCW5Yo3y02qcC7zND+4a
	Unjslhd3x9WL7v+brGmkmYmD5OWa1BtJa8vBMCXatVElZFykJWRcjcfY/n0x7QiRaLgD7gqFOso
	3bXI2AzzujZfG4smrdlaN5RG2C4rFl3fORre8Ii91LA/Q9p+kUZjfFHoIKauUou2x4PAKaEraoa
	bu0xpARY9F/D6yBV1qc3wjMSo8pqRF9dIhOz2weW+7FvGsjwXcRAZh2kHQ3CQ51JzIDR8mi3E+D
	PZxuBXK/xUmjxIsgzNgfuQ9d3Ph+8nrWPQqVYCHFX8i3Xnw4AcZR2szzbdO65Z8XotlTFzs5iBb
	iwpqxXe017NbBkpctgP0UJTXWrgT+CIdrMoWXaNtundIaWuwPrHaBi8v79CduOpARc0QevSZqke
	8IWjK9nYYCRZNxi+tEd7g8axq0Q61eyeuw
X-Received: by 2002:a05:6820:16a2:b0:69e:2cc3:16c4 with SMTP id 006d021491bc7-69ecadbf2ccmr3008961eaf.8.1781209715020;
        Thu, 11 Jun 2026 13:28:35 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44244cd05c9sm1796134fac.18.2026.06.11.13.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:28:34 -0700 (PDT)
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
Subject: [PATCH V12 1/9] dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
Date: Thu, 11 Jun 2026 15:25:58 -0500
Message-ID: <20260611202607.85376-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611202607.85376-1-macroalpha82@gmail.com>
References: <20260611202607.85376-1-macroalpha82@gmail.com>
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

