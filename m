Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883353;
	b=Yjj0ykpsx6Ou9ZA6Y09cn5sWOTZn3xm+KeoEetckEF5rGfkdm3Kw3xW8m6/LJ/D0mUxv
	 YMhi7BBZJOLIHEUKgmS3NHzNN4hW2n6HSn2/USii0i4pfNrcLjiVvmqxLSAiGqpdlbOF3
	 HF3oJRmlNtN9T+Vk6v/1Yb52h31kDYJ7Ad3156hL0/TD7dHDFhJwKCz5CP2Dzm3gllSQT
	 +YqchUr70oGY9mgtRVEhcadkw5CdVBmJrZA3u4bwAchswmsp5EgelW80R/2jdJYidxXzY
	 FjFzhxX3zwNamKxnNBgSb/GtUdQFUuX5vJIY52Q1SitJyPmGAmqcBbT0BouMhqhcEhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DluxFtlMNRoUKWvupun2bed9YDR+SDe6lRKDozU0OjU=;
	b=XDsLcDGsC/wjo0zJfzJuT40xNgj1pZjLvvBC2tLuBUQSYoqDQZPOLReDzCR+k2nHtSPp
	 C3i11e+qAkv16cbgqbQOmI4OnumrNnZ6RKI3D64meMO7NLPLw9BeHPTWSp0Ky/c1lgNJs
	 Y/i0GoRJUCRd3uxb11OayQnFmXRGlY+f3KgbjSoWLg/vKlFUsSMfvKaQyhdnBybCm2vwE
	 kw1dxPsDxMF37LCPOcv0DdujL7XpWhBqMW2uWQSoHjU6SwYUayPRi35KjgP+DmNbLn8DH
	 Q6J8B29IrW9y7/W0J3bmNwY6xuzwEy1e2bbq78VA/A52YsalXJ1Bz8TUDKQiaFUJPXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oqqm3M+L;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4658606A323
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 16:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4658606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oqqm3M+L
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso91197765e9.1
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 08:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795883351; x=1796488151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DluxFtlMNRoUKWvupun2bed9YDR+SDe6lRKDozU0OjU=;
        b=Oqqm3M+Llrq3Wc2FcuELBIJBZC5OCHQlv3rcHuD2AJ+b9eTfYrAvklUaFk9zeAuXMq
         IsKimKGfp92qBrkVdDB8OBBs21tTl7i1hDRo1+A5tujmAhGIUSngevZNjGq0gIGWJ4hE
         02A73hBJXYQgZ410aog16SlWlZOW4UmQ+F1DylMBtqMRQ2B0kktHJ2AnFRfM1NKc4gB/
         MKkU8ZoB6TFHFnDkVUaLZFk00HXECVNYBtmxwq6RsqPrhFu4tteiMHNs8y7BU3viDslw
         oLlOyg/sR3zQCB3HQ+XW/zS8gc5VOpx7SMetRhMx4ogK+YdNcFiFlq880QiwWr0JARtH
         QBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795883351; x=1796488151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DluxFtlMNRoUKWvupun2bed9YDR+SDe6lRKDozU0OjU=;
        b=A6w2F5XIwKaIJ1C68XtcM8+y5jrIv/3QwvZHxrEnY+CDaUf4bGbXQOsl9ZLpBedfau
         SD8nUbVFa5quJq9D3PFeWB/StyIIgR/dITS3lkHblxbSPfBA9+DYG0Wnp1FgFAHenPKz
         qc7pen9fMU43OnxNFOOr4XFbbBffWEfB91EorcPmagzSSZc/+X1nUji0BLGplb9vR8JM
         CI46nSUfRzk3BETsGVTz2gQfCyKEsvNaUAXZK8085pXoUAyVtOTeDXV2Wn4Ldf3k6QEn
         PiOkp8e0i06AXWo3yhBZOfJE1XqY0YA01oTI1cFnIyOeS/f+xTytRcWPMY9+09a46qol
         rUIw==
X-Forwarded-Encrypted: i=1; AL+hErEreXy+SujP7z/b08f+lg7A/dPX90b2KPldXZu3dFxV+MlKK71vcCk6M3x4FoMFv0cblsfDjm6opiDl@vger.kernel.org
X-Gm-Message-State: APuU4Z+djnYFCBZpEtcwVq4B8UNdJpTdWBiLHHvtNoiMYT7ciY1043xC
	XWZV8skDGqMq4sqAAVXpihs9mXtSovi2Y0GYkXalMd1MS0Dqpqtt9geU
X-Gm-Gg: AZFdTZcOe876nqH/LbCRJs/yM0Z15Shqr7T4N7xE76Y++lxs1BujXk1kWUo2g/fDUPh
	V1O0K8ZuIptOfbpUp7Lai9b5tYfiQx0AETEgS7u/f9vVR5K4A7j9Gbgr5bGoZKoBNb6CAOcfHHa
	ikmKOlV16GOll4dARE0z7p+Luu9zgGzvDHaVxfmnscOrsmLtIjmUhJzE3GICnWIXmob6xZcB7UC
	ykFocFF7uHmCka41FiEm0m0NYf3WFDpGMs4PgroV92BpB6Qnxpc2EnKdoecWQUdMXcpVxSzBUD2
	w8XQu1aWZ7HScBqzVfCo4Bcma+jJfg1nKPECV8Xv7YvTBGyc0nGqVKgp0QrCZuJFNdc/KkOY/GP
	klkczXClZuOCG2bO2KXyvhM7lwOyFY9tttWDPGp8IOQoCmX8R7ZD93pn9UwBrHZL4GAh8vRak0q
	Z97zTUZ+7/N3fM3d6MyfoerRr9t7rwxWTvCzglq0zNyLvPvr6Ke3l33GopY8HXlL7ttk2HWof/I
	+TrSattt6ftl8jmMqtibJ5tqfZAijt8u4A5UIpQ+arUQqnnDKECo1VW4jlEE1BQ3r7lt5Yc2sFT
	NtzOKw6cejFOX8XEIXmm6bNT5fgLZoAWVSndYR/rSrjiPsBdWLBkFoK4inpX60E+faUFbhddC0+
	HJVGJT58ioWspuMkNnpSJwKKZlXgSgAgEpWCfg1NrLfmCOQ==
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr541316905e9.12.1795883351147;
        Sat, 28 Nov 2026 08:29:11 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:7966:a38c:a84a:d91c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm748927465e9.6.2026.11.28.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:29:10 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 0/4] iio: adc: Add the Miyoo A30 and PocketGo S30 analog stick MCUs
Date: Sat, 28 Nov 2026 17:29:09 +0100
Message-ID: <20261128162909.2534617-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128021144.67d1672f@jic23-hlaptop>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com> <awluLgvMt9BN1Aj8@ashevche-desk.local> <20261128021144.67d1672f@jic23-hlaptop>
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

Hi Andy, Jonathan,

On Sat, 28 Nov 2026, Jonathan Cameron wrote:
> On Fri, 27 Nov 2026, Andy Shevchenko wrote:
> > Why a brand new driver for each of the cases?
>
> I'd also ask whether we expect to ever see these as useful other than
> for the joystick function.  If not maybe going directly to input makes
> more sense than using the adc joystick bridge?

Two drivers because the two MCUs have nothing in common but the job:
the A30 one is on a UART and pushes framed samples at 9600 baud on its
own, the S30 one is an I2C slave that only answers a 4-byte read
(value, complement, value, complement). Different bus, framing and
flow (push vs poll); the shared part would be the two channel
definitions.

And no, neither MCU does anything but the stick: no other inputs, no
commands. I went through IIO + adc-joystick to follow what the other
Linux handhelds do (Anbernic RGxx3: SARADC + adc-joystick), and to keep
the axis ranges and inversion in the board DT. But since the readings
are only ever a joystick, I'm fine with plain input drivers in
drivers/input/joystick/, as qwiic-joystick and adafruit-seesaw do for
their I2C sticks.

So unless you see a reason to keep IIO, v2 will be two input drivers
(bindings under input/, Cc Dmitry), with your and Sashiko's comments
on the shared parts folded in.

Thanks,
Romain
