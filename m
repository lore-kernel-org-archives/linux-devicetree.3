Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131808;
	b=gOJdZhc989ENiLmEvkZVdKZqFDiyD+jZuANGJWgPw9bYYxDejLQ1JtVkEiVkc3OzsIrK
	 mP+fB5eXlVs2xYT56RMnZVDk9o8bcJACrnu2pc/Ug1OfU2m62z77MbeWskpY3LkMIswcc
	 kRLc9anbPiYXjb+R+1/kqZwH9j23yXFC5yUtOvGJuf5GcQy8cTzfiTNpUhxUQWmTvFcea
	 QHkI1+gtV5++ihN0tucckq5g4vlfIQR8YmHRACtIy1G6z5vIRbBBEg24vJ0XXEPBiIXIB
	 Db8I3YXAzSluu+MScpWbes6Eu3Y7FWIJrsj1yTANMb7eC+pns1brYmCJczSpIm+9jCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
	b=PjsuCpjf8wyIjCbBzRRCDqHFrkTF3Zn1Jx3y7dlxSp4k8bAmL8YLkSBwcKQ6sUKyrw1p
	 hWPH3tI1ohMVueLVoYje0EbhPPnAN2tTjdJePGAr/vdB3e94nCRiChyucMUvjS2qIe5cp
	 e2x6z10eL000mQMS18EZJg16XeLW8FlGZbinPmzKUGD/a4JHCAsOq6qcjmf3b7qqRrqxA
	 VDqyN1P6JqTYbeF5ra+adabowzPfKJz5+nB361LEGsEbrfjJ9Pjvdoh0CsFzNLHUObMv+
	 4bsZJNmxGF806FoCzDlAs2gikW2vIiRqPpkF8R6ufV76WXlNPLNcDJwA8LQCxYhyFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6k18Nsc;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3E5606A32A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 09:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D3E5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6k18Nsc
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so20406a12.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 01:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131806; x=1794736606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
        b=d6k18NsckswXQJHgdv7ZJdN5lnDDlUwL1IC9wGogAAcQnYo3m/Svt3Moax+Rcfwg10
         NnyvNM/9ItpHXc1Z2AS652d13hEAzr+N6eP5UKAYrEK+zJvLq8i3BzEdR8MXFRMVF385
         awNQfBN8ngK5jSTbTZRarUrRM2kxH3IAuOw1srSgxGfPCqkXw93cmdw1gmzj9bbTKXNR
         8MCECcBRKFdPq4kuu6XZQypB4OYiXym+TiU3FVahUScgUPoGj0xtFfVO46q9DCIh3D3O
         BEITlOGb67SAAh1uk0sKos8qGzbbewGKY/9dHdhDuYtY0AYM2XTTvjgE+AZcO7km0tDd
         9S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131806; x=1794736606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
        b=jdRYNJ5sU92lYtxNaC05RdojTyyUbV/VL5z9a0VbINpePcqxHX/BpymihQwlPJ2pE5
         IphWWRg5jFgAX+ABhiHys9i4Jq940jGAYH3rsaczneTxLMrgfF8G/9FSgjnbdGT+FEBM
         +gTzbDzVyWQG7vH/qYYr1JzToSVGGVsVjD0AWwPinUNMc7SQKTandQyZ1PmlAl9xLeQz
         erkKmAEP+PZuHKJKP6gIe0cgq+YP1x/2Q4rCKsN5glIJyNpY4bCwoDX2dEHOhSphTTxN
         tyE9MMcGHbMj7ffPhXneM1a8St2bm/CDyR1RV2ajY0naJrycTLv6aw9Y9PjiKLRt0/S8
         AiCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIh3+O64FZfuxhxGxEFYhI2NAZ2fcqif6KMOOGcFb/LJQzttwS4d1+5Lbx+yJsHq8kesCCQzvfkrFS@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZL5e7Lz2XS3uvBESrgIgOtgZ8YwTpsgRuagGgUNiCwoUKDWYB
	zxOjY9Qs8NPHV6Y1v96drtiSpsl4vFuCv5uZF5iQLL2pQZlhQMvaL6hK
X-Gm-Gg: AYBFou2ua+7iv9FpafD0xV5fFt62F/1OZFfkYI5OSBtN/bZk1w80u0+omBn1jHp6nyE
	zBDQapsGprKGmFamWC6UJi0FZp8Mgs/UCn0pglP49AcOoV1B7FHpnYVCQBnpnSnhLydRz3yIri2
	cB21TLX3BCfsc78B5jfG3IHqLyOtnxrplmAMMkXtC923YOeUKN/CDxC6Zlq94sCQ6oLkGdxhON7
	ls6+hDrOaBCjTmQ+iFqAmBhbClSadQihz9OL32zlMqgNtnInRIipEPpLXbdJ/aiKVDUyiBC/0cN
	6sGEfzDK5a5xtuP7qR70kDwUqbvAwOhb2OmNBHF62trjOOlyZkqW7wetB4QRy+4TXHTHXhhwbiI
	i01pd2NK/DVLdd5CmZTCd5PcNlxmiKDyHmSCW1zbcf2NE9IjBgp2ubpyEZfcy3JttnZUANJSdpE
	YCyKw08q7GeQh2GgajXx6IZGFPXyFgWeO8hFYhZjq0tnznS4eMdNU54J5pjl/cCUZ2WJMSNBKAo
	8bw2VzGDBCiVAeaU+CFqwvqv8k16xnkFDl3oBfLC0khs6DUAqcDZiyenkkYDuJTyxS8yrm5VrxN
	n6ditV6o21ah5gEEJgFDTF6YvhYSBvPX5NdjC3Ft5XRdOEYo3eRnXpv4BRSn8VGWffka8bqmg76
	8mNeTQnfIcA==
X-Received: by 2002:a17:907:da1:b0:c3e:d0ca:d2fd with SMTP id a640c23a62f3a-c4d6d35bda4mr86080366b.12.1794131806225;
        Sun, 08 Nov 2026 01:56:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:45 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Sun,  8 Nov 2026 11:56:31 +0200
Message-ID: <20261108095634.100517-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108095634.100517-1-clamor95@gmail.com>
References: <20261108095634.100517-1-clamor95@gmail.com>
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
Device Tree (DT) based configuration and is folded into the main PMIC
node. Document this behavior.

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

