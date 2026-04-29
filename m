Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751938F923
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441589; cv=none; b=u3gXo4K0cEkS5ZovKxAJLV7REtnTvV87N4xqZqelqykVq96+V3wh0AcAadcSlYuIJb6Qs2/xE68tU0lfAoY1mOZLiZfwFy1gGrYcCJ+004Lyx3xGZfvk5waEOvBMcC8h+higLqcjF55+s78CBpZ6OUaOK7L4z9PeHa0GhjiPVO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441589; c=relaxed/simple;
	bh=8jcauZUpKBKt1Y2SRePdT2j5+qzSTeLWSFY+PfQPmXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQ4PPUwbZt2cYG/Cz6+O6Xe0NdD23KzGMfnEzLz45pprlNLway8dKgweqlb2eCyaVwzKm5pJz+ZTQxBUZ1a5d5sNgRMDgB6PLj7GUfc2Xe7pDMEOUkENwoi2Q4FmF6//PGIY6muoM41s1ksBmvy3SvzxPrX0YednkZuMinuigoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g17JNizT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g17JNizT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b4583f0a1aso76980455ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441588; x=1778046388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9GS+fDU8N+RMGg3TIx8An5pT4tHPP5/YiqsDlbIWGo=;
        b=g17JNizTchzVAnSbb3u+gEZiiVPDHhOKO4BnQ3ATthBgEF5hjMOiMOiF73SwwwXb62
         djZpvj04prQbTLANsVCv/lyFUCTZ64TrCJ1IX5k2evLhJif5EXs1IIC+DAp8xe4DYvGd
         Rq3lN4MC9GEneoFHQGtThEsdkSSz15MJK3MPBAJkA4h7Zo3jhar6LUGj9KppqbgmihLn
         n81cDBYLUIz1U1qvSgPja7hmnK38c40eeBkfKL41S5EdxXxGxSXYej9Q5H6SCrp77DLn
         kdpJoMhK+TzQ3LAKtOwvCY4VGyVG1RUgkHMM6FuUN1jx1btmfEK3kYkLFyjorbngtRqf
         Tifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441588; x=1778046388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9GS+fDU8N+RMGg3TIx8An5pT4tHPP5/YiqsDlbIWGo=;
        b=XzKOFbjxUDjw4EhBZPQvLbtHrbLvdR3Jz6uJMmK+DuLCmpXHaJtZfQWn2q4XlToQl1
         N2BodSYlySVnRpoIuC7xuqjSK7bzUytVRHJQhOgK3zuIGcTZvYt4xw6+jW5TZ1c6k8NQ
         esFzqiDjSFMwqiHtGaubqmviRg9DStjAGiL5s6lxVy0wTXokQyEn2AHhY+6Tb28mAhVZ
         G/O/vgLCFJfFrtQ7xnsZ/WbyP4PBZlzE92Avglgfwx2jQZdfol44Ncn4WhvGTbDjsIwV
         aIB0IQQ2DZaBIIBl/JaeJI7G2LgNrshLZdi0rlz7vKvIIjuk4QL0ui/WcVAJeyTZzbSR
         j72A==
X-Forwarded-Encrypted: i=1; AFNElJ9nHtukc9L9x5STugkI8QN2AQ6nuw8vMr/GnPcbOXwF6Y1CsMgfmaRZObI8E1h4208aPgUjGtk6aU5G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CrHZZ+XPajiRVVPBIZ6vWx4eDY2XAmMyzH8h7DpzL5rkgySt
	4R3fbQ/rpfOPlX49PqKQc4E3/+VnaBhnRare5HfuPbgrLSZa3DniduaB
X-Gm-Gg: AeBDievs+z8trdWMAKKDz1iKwWzNIrhJvm7jjVB0OacNDn9pmr79xfpFoIG1dlTFYp6
	a8Kw1j8Xddc18YCh1Uu0XZOJe1JLnSXAgf1Lie+aZEFcHtIL6G9qQ7dx71+CIP/3otsAZx5VsDb
	ATv3qcjOJMyZe4McmPJUtxvIYkRZRhBNNdEJkjAlIBMSbFSr9s02YkcTFRm0M6ZX6fiJqZOozoa
	ghLkB5+78i45RL7aA2tK0lnRZMcNFU1M5A9aUUDIq3PSrGQtOkS2UHjamADkUpjmCXIy4N+A5pV
	Txi/mauX+9lsxQma0rCCFulPJvzDpv2qbE1V3nk0cMtM2EcE+rR1xsQfp+tgQCucbueSE20z4wj
	PaZMo9jzqlLZEiu/aebu+6dsbIyCYrcca1DBNkJXkHLw/BaanoMEDqwEh/CDEEp/KAXdhMLh5Wo
	XwAEbNyeKQeUzcVWXFYokYjgVfwX2bVp0lW6jQftJhtIgRzUvAkwXwBm83q8J9BkydW5kN0r+Fc
	o9QNbB4EqDZqNc5gIXyhV2U2Gg/18ORgbYrMHwS72qVax3esQ==
X-Received: by 2002:a17:903:985:b0:2b4:5986:cd80 with SMTP id d9443c01a7336-2b97c47b524mr63574105ad.26.1777441587586;
        Tue, 28 Apr 2026 22:46:27 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5fb:20b2:c2f6:85bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879656dsm9346365ad.25.2026.04.28.22.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:46:27 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/11] iio: adc: hx711: localize loop iterators in hx711_read
Date: Wed, 29 Apr 2026 11:15:41 +0530
Message-ID: <20260429054544.123862-9-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429054544.123862-1-piyushpatle228@gmail.com>
References: <20260429054544.123862-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tighten the scope of the loop variables in hx711_read() now that the
trailing-pulse refactor is in place.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v5:
- New patch split out of the trailing-pulse refactor during review.
- Use unsigned scoped loop iterators in hx711_read().
Changes in v4:
- The scoped loop-variable cleanup was previously bundled with the
  trailing-pulse patch.
---
drivers/iio/adc/hx711.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index d85ff2f4a3dd..15b9f78b6a25 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -157,7 +157,7 @@ static int hx711_cycle(struct hx711_data *hx711_data)
 
 static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
-	int i, ret;
+	int ret;
 	int value = 0;
 	int val = gpiod_get_value(hx711_data->gpiod_dout);
 
@@ -165,7 +165,7 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 	if (val)
 		return -EIO;
 
-	for (i = 0; i < 24; i++) {
+	for (unsigned int i = 0; i < 24; i++) {
 		value <<= 1;
 		ret = hx711_cycle(hx711_data);
 		if (ret)
@@ -174,7 +174,7 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 
 	value ^= 0x800000;
 
-	for (i = 0; i < trailing_pulses; i++)
+	for (unsigned int i = 0; i < trailing_pulses; i++)
 		hx711_cycle(hx711_data);
 
 	return value;
-- 
2.43.0
