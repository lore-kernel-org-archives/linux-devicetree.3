Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985032AAA8
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 19:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787427395; cv=none; b=b8oiLCyZkBFiDMOsSQYYgD9j36vJc4IHUeYc+HbUoZJAcW+L3FVee26VAA8nseOaAG5qYvlphT6jBTLmmWTOpojoRbkMbq+CK6Sb/QBaWza1lBmNkhSAWgWn/vOtdEEmHuMsrmw41e/R75pIf3hj+lkywFEXHIYWQnDwyDrtvls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787427395; c=relaxed/simple;
	bh=MbxEwNo9hWBmu6Qp0a0JvOpRXaZcxRIfF//JVvtLqaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJfu2IcJvXn/PlJuHBrzdJB2CUSfvcGg/X7SLcCz5s7j+8BoeSYmACPVigwwfhOimSPyEa/yD0bXhJV36BvlkRKoLW7gkPL0cDlG02ddaUDfP0PNh+KlwT/7QtN4z+ZN/dFCMfDwDXO49oIE+4f1k1nYyGmgtckc4HuL6tjgfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/4OHsH5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/4OHsH5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f71156e1aso784099f8f.3
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 12:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787427392; x=1788032192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbxEwNo9hWBmu6Qp0a0JvOpRXaZcxRIfF//JVvtLqaI=;
        b=I/4OHsH5l9iGNLTuboskQPS/6dtrL9YwYqKrw0Ufk613I1j2lfRIk4OEG7LL2Mh+zV
         bM8LP5MTJlZZTdfwqMX2FmG2sYxY2wtJa+0CjQ0HJb1GbZ1BeGcKHCyUwXMHps4n0hUK
         B77fHxqNP8Bw86N2/KxXSnLlMfyDcB2+yecLbYvrTgOj8jsChCvwwYGxOqOY9/3vovVM
         JrSmGLC0eSuZVflfMXemW6LE/s2qPl96hzzXLWHwz43zpAzNKLEiwM3a9VOaf534rhen
         vLn0YORH/6Fy3EmE9T3YL7xTwlNJvqznFMuqshfv+m3KXRMKYgIsI+Nv/vsdasSI9lve
         jkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787427392; x=1788032192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbxEwNo9hWBmu6Qp0a0JvOpRXaZcxRIfF//JVvtLqaI=;
        b=VFjELHd7vLg87COQ+m/UwM3vnKUzKrC3bnx+J0RJNyrHM9DlWX4PTat3WtP+EHw9iM
         ymg4WCeCa+fvTusyrqOv5ePqUycKwfvXDc8B1ZJLOYvEFwMiwJ3CUBfBV39A8rmh1FOU
         j1G0zfR5daBVtvTmwLQNH62ydOEd5MY+fXG7bhUfo593Ap2nexwa9cz/cxjuDry0vK+g
         dwmlsuyqIcgPyitZ5dzhVv2tR63wMBOztm9fU4xuO2mvi9RIiWTHxpzqnlJicuHyYjG1
         LSP8tMNqhZIz5USGUiCslFF2TlDPjrAupW8r05uUYrB+E10x9hTgcJO7NzCgPWUVN1cM
         me/w==
X-Forwarded-Encrypted: i=1; AHgh+Rp8PFaZkIMgg5RHgJ0V/FjflOc00/HjpCIs4/dpcB4AGJZP814JTsqBlvqVmhgvSdYfltJJPOSfTwPa@vger.kernel.org
X-Gm-Message-State: AFuF++miBtdFrcCWlXCuov5j8/MeUWolJzolUQ97npd6oDBvVxjr+6+M
	6CvufTnamtJU9GXTCvyadVKbPZunVVu74sl2qIcgYbEenly2BUIgB0MG
X-Gm-Gg: AR+sD10oow3qHBAa4YbmP1296OkxRmxmyBbpxDsgYys7sKZR5kgQRkkiG8PlLvKwhvt
	JHKXIUGLWpJBTq3LMTT4FuhL3WUPzRNIPmmT4zEtscdMR9BPAZe9LU1QsNhQJUMakQZyLGmUh3y
	X44LxVwN+2lajebmTzxmcwthxXBsYQvzUaKT5gCLj+3LASPzLH2QUql68YtTukcgd765dvBe9TZ
	wUipL/6Pf1n66rsYTC+5hnsUCGBIJLunJLe9Qv0woyLQOCadtgYojZAFMU6KUm81dGFg2Gq3HSt
	IBuKwKIYVthRqfQfQLdrOzwllZg9vFJ77N+rF+cslrz8d8fV1gGa1FcT9G7Xi0VK3Xxz+mRpSWv
	Oedib3ujfvYBHN2+8jmTBa5jSj04Syd2JtCCh3k9O0pv61tflliN7c4KEmf7HTUnnXCXH7/GrKP
	bZjLQFsE2+VPEJFOW/9Q7Vi1au1y2Q2UPvpA/8S5lLKzNTt2AgNiwoFf0XoxffE61alckYl/a1M
	179sB10YQ==
X-Received: by 2002:a05:6000:26d2:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-482c81c5a4emr6272976f8f.15.1787427392334;
        Sat, 22 Aug 2026 12:36:32 -0700 (PDT)
Received: from fedora ([105.74.8.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b855cdsm2878142f8f.16.2026.08.22.12.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 12:36:31 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: dlechner@baylibre.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	conor+dt@kernel.org,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	jic23@kernel.org,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v6 1/6] dt-bindings: iio: dac: ad5504: add output-range and missing gpios
Date: Sat, 22 Aug 2026 15:36:21 -0400
Message-ID: <20260822193621.18800-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f35aea7d-0844-426e-ac81-d5b156b60e4a@baylibre.com>
References: <f35aea7d-0844-426e-ac81-d5b156b60e4a@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This is one that is starting to emerging as a common name, so I would
> call it clear-gpios instead to match the same name on chips with a
> similar function.

Worth noting Nuno asked for the opposite in v2 review, specifically
to match the datasheet's /CLR pin name:

https://lore.kernel.org/linux-iio/a79296dc96215a579c29c5c9eda464f818f050d6.camel@gmail.com/

Let me know which name you'd prefer given that context, and I'll
update it in v7.

Best Regards,
Taha Ed-Dafili
