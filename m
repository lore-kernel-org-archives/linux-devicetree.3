Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542531;
	b=di4pilaUzijFP8tA6PIjAeL4Ee7scqMsy7gTRLBF/QFScTzAOmyqpQYEytE676MhBJjF
	 2/wMUd6uoe1e7xnAsrFzyDQlwUUeQuq3NGRyCJVq1plwKx87AqKRIGsif0OZyTpL+1fVr
	 2RnapybjSPV302K+XPfaDT58hTsrIQfHR0too88GLJdc3Z+jBdNa0IYdLOHeVvwsvg8eN
	 sF4GnCktC8bAy2/zuazj48rNlR81CuS/mYXaAvrA/11D22cRRvmd8zISvTpyqHwnLKTl1
	 VxrslNxl1JGkVwzpwXe6J22QPN0AVyHHvuj3cnhdE1g2s3UdwauVefPmjp6yDSz/1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+HyPC3h0+CjA+c2wC2QKJxSGQ6LFt99JUqVEiYe5TM=;
	b=nfmQ1rrgVEcwtcnv3Q6AXB7imZnOYpJ054Ha2R1aEFWtAPYNNfqM6T6ePIWYrZoTzNEW
	 H35z6Ge/l5mEMKZiRympM7Gv2vCKLqiacLPW/z5J36dDU8Fu1zEysJJZL46kySVimVueX
	 WYTpShpZyzExwgua2ht3tklh8nZGCRmrC/shHr8PpUZ5+ZQT6BGeJaqAbbfZBL2bMv+U1
	 Kz+ZApTnl1WXOYWjqm3cXAc7CitRFkC/BxANRcEEuYdC21o8WfcvIxC+lKrm7M+8327Ak
	 nenG7/euPnth51PU/mUwXBXGTzwhKhHHM9fa9tGzqhjBXr9w2kAoXw9z6inDGjTBpsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/0dqfDh";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3DD606A326
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/0dqfDh
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40f29667e6so328768166b.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 06:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542529; x=1794147329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+HyPC3h0+CjA+c2wC2QKJxSGQ6LFt99JUqVEiYe5TM=;
        b=v/0dqfDh/LLX8QuRh45hi2LGiNbiGbswWBbiecwizZ7IU5+c+Mj8bdNQZs8JkVPT/Z
         mk5A4AAKTV5wdg8mRDxqoIEHPsbaykj+7nFV329SfGhcfdAtFWx5RBCv1NXQcnfDL3yP
         +EP5Je/iBDNzFe70NuX/EghwgVSEbDM39NNh4W96uEkY11yLRaR7LD9TGNbd+DocD8zN
         O2V/TtKTu8g+juww1i8It23ymEObXfH7rIRurTQ2Bylvr8jvYzD/1sGbRgiXlPKE5J+F
         cz9op2k6jamY3DwOWtxxWrdLKljI9M0a6r8xZs9L7tYIRafDql7+MAbA3NW4a9jBvgBs
         cKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542529; x=1794147329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+HyPC3h0+CjA+c2wC2QKJxSGQ6LFt99JUqVEiYe5TM=;
        b=X/pUEW8yLNrhUVnQGPmyWR6EWvTebrdGll4CWhHMUN8YK1mCqNPw6I3JUHsSVV/tsy
         8BDTS6moFDCdfFSTZ+rk0nCa8BgMmbz3cyUvRAq+x7hJSEqYOta7WeZZiKF+Qz7OoGl5
         oJW/he5+7a59n8mwA+x/EEqxUaYtyNAvZGKMQZ3L2QrZvcePqU+M0TPuPo2WlvNY+QeZ
         r/YwSuAts9DpdZlIiaYHbbKBQrnLKNj2qrctZWcoXMEmKyPh8snr17Z5XPww6SUbTt1A
         EsIK77l/tp6MBcvaB9Gojoeg3U5eyZ5Yz2Jg9Yulsyb9HTFz/sJgocukVGRaV9fEJERN
         EeHA==
X-Forwarded-Encrypted: i=1; AKwUvBzYYkYgEiUoYPTNlqBCVgkSBbLTeXJDHow1ahSpbypkuPYY8LQ6C5EHjhh5HuImAHgTXvJNK9sLG3jP@vger.kernel.org
X-Gm-Message-State: AFq9FYIFvz+BuHOSjAEhUaSDkPo9/SZrOmL/XHwlDBXoIj0Dlu6LNDuh
	Vo7DTDb39E8KyFy+d3uTWnXGIwRR980okcFUqoVRVkTcn4UkzzBoruo2
X-Gm-Gg: AYBFou2jLEZ7sYuL/kNu7o1X4biZM1S8p8GUMP+PiHV42f0ivOQ9wp/+Q4w4w8T4eAK
	ikpxHFfMvp+3PAtDLt1Tt1f2pgD+EWOGkwf30jIVgNx92foBqlu6WNm1nXWyvjBg/FNrK/HpowT
	AbRI8MepmfzjISnWiXj+hOv0cSfF7NbqEGgbvC8yOWbERTJAedIi0Kr19Q99xhuboVu+k9/ZoeD
	/ULUm+YQetCbwptRv09Dyn2mJdSX7T1xoJ2Fo2NIgSTzZbViCwFRY3nIHE1rSdpp34qfD4t2O/x
	Pi6SXnxRiZvjpTkDT8BoclN2yVersxPIERFBps5iLfUy0DAKrat51SMMBptsWAdEk64wRpIb0Rx
	0POuob5Fx7qktgnoiws+P2tbhYS0mj927Vqz+Ih7jTxHgofCOQ69vx55+A/9KqmVH2xFOjUxZGy
	3eahnKgfN9/UWAoMipWvlPCkH59iPrH2bzvI9gPZvZL+AXw328LJa3BVXgLgAXUC2jSmDGsghiS
	eTpEB/U8x2SXxNW2hsmY0VZw77o5r+20O0QrNKQpmo5h/YvhInQzm68tM8SRF8uQZs87+uBX5MV
	9RpXRdXWPN0rUtQe5SHLpj+Hp0p1TUaDT8kTL+xzWUshIStwlA==
X-Received: by 2002:a17:907:961a:b0:c31:91f9:60b7 with SMTP id a640c23a62f3a-c4ca7a69731mr631054166b.34.1793542528615;
        Sun, 01 Nov 2026 06:15:28 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm281769266b.12.2026.11.01.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:15:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Sun,  1 Nov 2026 16:15:05 +0200
Message-ID: <20261101141507.119186-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

Svyatoslav Ryhel (2):
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |  1 +
 drivers/iio/light/ltr501.c                    | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)

-- 
2.53.0

