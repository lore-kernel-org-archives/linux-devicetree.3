Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39A3EF0A9
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892522; cv=none; b=si19IXbszwFrBa4ZVR8ANsV084zKaZmiiJDdroj2uxvIHvCoMqG/9PWh5GxG/GZdpHq0HsM+NkGUIE2VP7nHPxgCZfIDAjK8Si7N1VjWJTRKOG80rvegu0UsKyyomQCxg730Ov44YPUQbS9fzKs/w0x3W3w1HoK/H7NaTGE87nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892522; c=relaxed/simple;
	bh=MLaGajL0dv5Rl6YmJd3uu1+U4BhprKGs7QN1vKZx0x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcZvwXl3IWeXw+I4aNHmab7sBVfLdoUx1Li+75DdJOCEFywMJICUQOu9I9wBLKg5Dd8/8g+8/kIbjIAkvFq6TE52qEezdlnrZResvSTB7pYFqmhzufQh0kvsafXvtGLtHjYD5p7wxxSQwBzpxxrTb9SY6LkcdCqnxXJNLMfBHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyfbAFX0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyfbAFX0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-449de065cb3so11599470f8f.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892519; x=1780497319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXHVO11XsXQ2J5E7IFkROjo+IhfcHlRoeu2sTpJXq7o=;
        b=CyfbAFX0HzSL9ZPWQrlvcC9RKh+rZzd2Zn/81/ZGmYUXShubgV7RNX5S/YXzeQdQMY
         2hpiLayvLw7y23VdS9VFldN31CCrzrzg85K5bGQriH4g4hmhltyR3UQ9EU++Qx3cu/EE
         /s6nZDz9kwl3/qFm8/BPb5Y1AMiXjjSFU4juCF9CMYtkrwRo3GqXyNy+5NfD53xFs097
         ksQYBGdwnuq7wOIGq45qcs7Un9BZhEYZDGfv3XYXclWlnlqzB7OWQjbD9z9bCf5/9UPF
         LujE91Gve4ehlJoJAEG7zr2JT69aYs3ZOZH5rVgo8vg5S+k3CwUKlFKMJ9J7Vh3+W/xr
         2wpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892519; x=1780497319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXHVO11XsXQ2J5E7IFkROjo+IhfcHlRoeu2sTpJXq7o=;
        b=mkWgNNDvfrHKUhovo+za1LL9xICfsZPrBn1APwOnTuzq4NfE1TWvOpeB3kMrHlu3ns
         pXwQOYzEDxU0anKNLFxZSjILMgxMKxb7XgAWX5HGW8CSbbeFEcrAZbBNgUj9xFovb/vN
         mYz2v2uw5yUPAwiKS+0GKP5PA9hFyOeZDIPgywf7oHrwrCu5B0t10ARRLaN64DFpa2VP
         OIEB0cgfTGvtHUkaB5lOWE/r51rsBqdYBZNEOO2intZA1l6G5dhtArVMXzh09oj1vE9P
         vHy+vfWySNDWMYoCWpdKI2YWB8nq/mirDwn9uyLuajVx9iWGDvTFYxkGYAW16we3JXs3
         DXgA==
X-Forwarded-Encrypted: i=1; AFNElJ9bSLcto1HiinrsHZH5hGzxqjAvKYjYtATDmBMcAcl/Rvw195HEvXrCwl7RjWAEKsNqZUbvbGvZa4VU@vger.kernel.org
X-Gm-Message-State: AOJu0YylKSelNF3UUkFpjTa92zWgucYIiAaadkaQQBN7uYeCGaW0qraM
	AK7962YlRFUefatgUDwTX8WCkd6mcUS00+2V3NqJzEfr0q2gj+e2dmqk
X-Gm-Gg: Acq92OE5t3yKZ1FkMNrXBW8korusU6Fe0c/WIYNjXEwgJ3lveuJ/1SdhIQXA2KvyeMP
	uUuefkTMWTCbceAs9DzpWQOWf2xAjCQp6s/Y/Xd5HplR9wbQmu+mCHsz2Swy36AN1CuyZS42/KB
	t2HUsZEBJgQsXZR5khfROSuDV6WD6PQVwrBd01meYrSyDX6pfnJTd8fu61x2z6F9j52W0Z+RUfq
	WrhUFUdOWeFlTI7+Qszv3lioqS2EM0r74c/4Cqa+5MX/JXEbzog1W3lzX0rXwiwFJbuydehUjd8
	i1W9zG9lnfpk8LTxRgz5Im/YVUpC+UISnZ/+U0zfeR3Mm/H8Wmjd+uG669j+dNDMOKcx3i8J/d8
	/LosmX5JeiStfQGzEClPB4LWx+MzpCGvOdNkStQzRfCLgLWIjMOZvBK1u1eWmCbr4h2VZapSH4D
	RNkJC2JfOWUQCk3tM=
X-Received: by 2002:a05:6000:4804:b0:44a:be4:d0e4 with SMTP id ffacd0b85a97d-45eb36ac4b7mr38832146f8f.25.1779892518554;
        Wed, 27 May 2026 07:35:18 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:18 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] iio: flow: add Sensirion SLF3x liquid flow sensor driver
Date: Wed, 27 May 2026 16:34:59 +0200
Message-ID: <20260527143515.102794-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260526174229.7c7414ae@jic23-huawei>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-4-wafgo01@gmail.com> <20260526174229.7c7414ae@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 17:42:29 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Also see:
> https://sashiko.dev/#/patchset/20260524205112.26638-1-wafgo01%40gmail.com
> It may well not be correct in all cases, but it often is!

Thanks for the pointer - went through the Sashiko output and
folded the actionable items in (bool returns, unsigned ints in
loops, fallback-compatible cleanup etc.); the rest is in v2.

> The value of _scale seems like a plausible issue to me.
> We have discussed expanding the range further than 9 decimal places
> in the past. Seems like this might be the time we need to do it.
> There is some work under review at the moment to allow more complex
> fixed point handling but not sure it applies usefully here.

Going back to the datasheets, v1 had the SLF3S-0600F and -4000B
scale_den values wrong; the SLF3S-1300F entry I added was just
carried over from 0600F as a placeholder.  v2 now uses the
published scale factors (Table 16 for 0600F, Table 15 for 1300F
and 4000B):

  SLF3S-0600F:  10 (ul/min)^-1   ->  1 /   600 000 000 (l/s)/LSB
  SLF3S-1300F: 500 (ml/min)^-1   ->  1 /    30 000 000 (l/s)/LSB
  SLF3S-4000B:  32 (ml/min)^-1   ->  1 /     1 920 000 (l/s)/LSB

So the SLF3S-4000B scale_den drops from ~1.67e9 to 1.92e6 and the
INT_MAX concern is gone.  Happy to follow up on top if the
extended fixed-point work lands in a useful form.

> I also missed the crc table is global. Easy solution is take a copy.

Done in v2 - the table lives now in struct slf3s_data and
crc8_populate_msb() runs per-instance in probe().

> Suspend / resume one is a value add for the future.

Acknowledged, parked for now.  Easy to add as soon as there is a
user for it.

Thanks,
Wadim
