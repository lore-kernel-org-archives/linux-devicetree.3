Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797400;
	b=i0TCNVAzUFeKHsoWGmUwTjgJ/yiG3BjMIoiwy9aOb5IjDWtImAePXyzfsh+qd1XzVW7Q
	 Cj3Kt9Yg1TZirHCkvzA8yZMiYgmqOr9bFB0XLXOwneYphKtwir2qOjE/ASkeN77k6Tt7l
	 Kbb+sT54c13k6kBASpceDBcCfXD1doUUHj16nIe1WyFpWxwbvFjVWxqc91Yu8keL6+GOn
	 ONNp4Otu/1oSp7FzqVbm/j/ISnfmlFTgDsgpUiSy4nQOxlazj/j+J7fwEOIu/fel0mY+G
	 w21P3IhFWS6XRNzU1QngrkeyhZpksTbxYXL+3x6En1Zzzutae1PyuX2mpFCXA2Lde4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
	b=N9GMhkhpBiiHDX3aQyeAPXSzuG2G+owG/cMkmgOX26GqKzLvI7fG72qeTrXd19QcdttM
	 Ed1htW246Njhw7bVb8SisVWyETckLtutvtRUry9Up7oBDBCM7UWkSm5BqfJjzN1vqd4Q/
	 QnzzjQULAfZZEy8XNjMKxtnqbEq2T1n5WTSUwDx0imybvXWamxFYHNV7azplmTYDn2ZQI
	 aiezNPa4Mw5wOYRk0inYij8Gdk3fU4s6vaMkJh1vrSKmF9/EJwjfGmG9OQrAqEr2R4+aC
	 xCP3tVVsj0zIvmjueQA48ZY/PuLlUIkt1f39P12iIeG4BZyKQzqjHyrUM4duEaPKDZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EtAEAc5d;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A1C606A68D
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A1C606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EtAEAc5d
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5188e17487so397262966b.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797398; x=1796402198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=EtAEAc5dSrkfySaFBvC0m7U6FbehO2Eg7mr34lyQ9l4C+2rQKijtmXteMW7g5HTDGj
         GWJlAVzuoJrh2c/9EnPL5/y7REQYxV7JkZLIskhm5jy++4wMUiJ5UpaTsoKW4j+BAplV
         TzlnGd/OmEI/6RnHWGHy6nJfzdJeZD41+VMZ0mYSzVi4TT2ndCKXMa6ocnRrTt+j00sR
         tLHyiyV5oJ3yf3JJBvwVknYiJ3hItXa4UfyjFDvmypjqhrk4z9GEv6bBNDfsYvCrzXaR
         udpOrOxQzXbDhpMGAi8fBV2Q+WILt+zM4RzhLEn7tH/v5vyf6T9IfrUTpBiFepoPpo49
         z7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797398; x=1796402198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=nNLEP39lSZYtVK+m7zdZvi9pg1FwyIMRkWcdZQMsdr0bwFscpWrWj+aSE4yS7nHWJO
         Yq3aTrCkBHG1PukHcL5YjSG1temeiacazUUyugGnziNXTlShWSUtuXDAYzwCArJRCKpU
         mLiw1UQQn0pCLn5p/D0o1c98/1p1tZdoXBpHRK5LaoXGnxku/NyPqIPNRi2RPO8KwIFw
         OsaN5sldXj5H/+I9JL369GyS67O7JZs0r5DUlNerKMEWJ1G2RaAyInUJFAQje67QUwIf
         XGU9NkOcauOLp3ui71NqYRhe3D+Atzkr9tvvSkCf4orIYgKBWC3WAz+bf1hCTib046gm
         lD8w==
X-Forwarded-Encrypted: i=1; AL+hErHPtdO3zNNofcA+SstwhwaO7yE9/rPD3qgswCGfkbJ4cwUb8YSlm+NHwMlmiaWpyFIJItxjV8ArfScR@vger.kernel.org
X-Gm-Message-State: APuU4Z+SD9InIlLbvobhxdUB3BQ8BB3rmVhBqQJcxJo5L4Ow4ocwyPOu
	pmhgi+482XkzoEEnVj3oyovXe/zL2uzY+xEM0/eCUZRkmLpP1+ty1vOYFTOWWQ==
X-Gm-Gg: AZFdTZcdq9uF2ZQKJUwHgmqk9gxGNnyeb9EYrgnPGCT18Zd8c13cTkJLBEcbrryoBaA
	x29UFmcN/2dHOj+1wJ6Y4DiFG23DTcGWbqNYPllNnPzT3RwkCAkNI9RWbVpg+BEIH6nQeqZOQPx
	8VxmMWS+ksGO1U5whRCrdmtk47NLyDCSYPg6pTwuDV9HBbRBF++Uh1nghf7OBgxonrRUW/Ej6nA
	Xw9Y5P/sUXS/q7XAy+WIbN2AslklfO0Kd4oZOOAYM/kISq0gL2d7LHjC9T5OZjERHwHBcmPnEJ6
	zzxsWey/dLEr2R8wHiTnPMo5R4yXeaFz2AaPyxWQh7RA1ocD+iwPd5y3AIDHwAShyzobyLDba8b
	UPttHhsHMIVe556hrr/OXBgQ94Huzh8ADyhqUyU5yKMLRUBsUe7yqhTI0tgcoyD/HTyviLqOBx7
	RcNcya6gI+P+mfrqKn38USCjk5wyejI/btVlUSPjydz5pgfSVEUVO+yZq0AQGg9IXpOXLT/tvxP
	/N4i6769q7A6A42aRToXHXQ3spKAHissVMLESwdND7+UVs1tqBp7weY7l+0rcKS8xQDrYDppfcj
	S6PLvaV4eQkwBD2PLXKgdnstWfb3svmeD1ti/GSzlJEqVHzCdKyETA1WO0T+WJOCa7wUoAi36a7
	4pAGABGlMrk0=
X-Received: by 2002:a17:907:d20:b0:c50:4983:5d8c with SMTP id a640c23a62f3a-c513ab42460mr2116372466b.34.1795797398460;
        Fri, 27 Nov 2026 08:36:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm893079566b.41.2026.11.27.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:36:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Fri, 27 Nov 2026 18:36:12 +0200
Message-ID: <20261127163612.280186-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127163612.280186-1-clamor95@gmail.com>
References: <20261127163612.280186-1-clamor95@gmail.com>
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

The Maxim MAX8907 has a built-in 8-channel ADC. It does not require any
Device Tree-based configuration and is folded into the main PMIC
node. Document the io-channel-cells property in PMIC's node to be able to
request channel data in the Device Tree using the phandle of the PMIC.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index ee1a305d1c210..ccdeb9ba21e26 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -27,6 +27,9 @@ properties:
 
   system-power-controller: true
 
+  "#io-channel-cells":
+    const: 1
+
   mbatt-supply:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
-- 
2.53.0

