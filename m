Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31423B8D7F
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515759; cv=none; b=XtPwz73pMLeB72SDG/OUPli1vADdhvADnURmq9VOn3OuNfP5WaMa7rUsnHbybM4wseXhfZT/fuZh0IEcGCyIEIoeUG2+VTQUzEPKOTpF7FqgffAItzDCGfvQXBrIGQb3go2Nr261ipZAIL/8dKaGK96Olkta3Ttd5cDbkyQIhgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515759; c=relaxed/simple;
	bh=rsYSOkEvaBXz6UnE135GRc+igXT7NK6N6reEKrkKwUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DFhyUuELANDx1o2ee0J0I2AFnJLBhX0jM9v2RsJ5GNdemcxsW0lXSjoRZIC17Mr5eQpFZA2TPoHnwkEgMRfardGPfpKh5OZNYoraPR7P4Dg/Nl+vO7K4KsX+5/7xqhlnv0OjI3moGcZGpAEdTxHYV9jOpGcPSsecIDirdrOb+Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ro3G3ws4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ro3G3ws4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439af7d77f0so544840f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515756; x=1775120556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uDgwVygqNPr9RHXvzVoREYuOBHGBAMwYlaa7aLlgho=;
        b=Ro3G3ws4cOHUJRK4tniauPUsaqcRGJ/mg9E358kLOYU/61JNTuMyg9UNYztXS4YYCu
         QTNwEgPM/dYyil10J2+ADWlRhizdVPUXVeUOssBNyz/kC25MSt+GHVSxBgPKcuBa1C7M
         0gmgxT+RUAdcLH+l+xRLafoWU4tQYhNbiHYy1Jjb5k0jiWc75mrWjFg5fMWLm5/5ZyoZ
         cvXQYhb1ogNAMip69+22gZT8dzx1mT+NSYv/dm/+0ZUCkXkQe7R3kjrYOBezoXaArxno
         qlFJ79tgkSccyNCzMs0u9VG8yXmmbSdkpzEtDm4/9xBtwVMWuW7is3r67TG2Pae6IZnM
         Do+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515756; x=1775120556;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uDgwVygqNPr9RHXvzVoREYuOBHGBAMwYlaa7aLlgho=;
        b=jTfeoFSj0eHYkU7qm8HGtw1PlD/DkvMBv3dVNRaPosl9xW6dyiL8mST7FSebE/K2gF
         YiHHCAYQ3s6fO8FFR/G9HhPRUVvAfeViHDvb91LP0obkLEYq3LzkutnKcFA0Fy4W48IQ
         y4fHsNazHsdn5DEzw0x1b1wEQlsDtXy07GUeofHmFxPjoTxkxd3ToLab5lq6dh0Zlh3n
         8w/4ZnrFRnrGnCGY7R12YduWXJavF+jdoBaCfABNB8LyV2EvrQ7v9k4jXvQa/D5jcERo
         07Bgt+0eR4MFdioN4xT3ceWOPExGsX9L8cTYz+P/1QXghUhwfxWn3sKPwSJcGdWibq0Y
         MTVA==
X-Forwarded-Encrypted: i=1; AJvYcCUObEZQKxwkMFgnsN8pkxMSzlyZeb2VgNbw9xtAvfeV54A85K37GKoIQ6u0b+Yr19C/7aYYVrHrtc6W@vger.kernel.org
X-Gm-Message-State: AOJu0YwK2Kr4cGIwUQ95/V3tNKVjaKDB1vbNeOsJvtrvlO/OuTm9xgp8
	jsBuKqOJH1I4LE7KlZStaRL5kKVZ60OYgsHeMkXN1tpXV0Raft4CYKuD4utEiAQGvTE=
X-Gm-Gg: ATEYQzwrX1zLWbOc00n7MXRx1Kg1JmBVzLoJzNgeTJ9i7hzK3oDb0uwZH5SBY4hCU0g
	mer5OiKtBL6X7XsrYPFO2tt/gw40Jsq5qW0aPrSbx/ZXyJHXqjfySbKmEcnyujqnEP3P6s0t8sD
	yiogaeXIgVu9GKv60cqXZbrKXO0Zng/K1meqKRnsVvYnFkZLcVG8TqqZvubHTcuFZNZttB8yJcj
	dZ5uXESdnL/PkaPekQlw5DvO05OoNgxrNKXzZK/MgimDB59eV9SMYW923iZbVV9KBOjBmZQRf+u
	/IW5gVKiMHwSofWDpc/9JTs8MpOgSobf9HKdc6LN9n7jkNb9u1YuCpX3kYBbQ7erjtPF+AQPqzz
	Q9oLyugj85mIMgJilCb9wye9eNbx11jCOV7QL+xiJD3CfTHW1eH+c+RmtxjNoWyvimjKDIgpmo9
	p5kV5qu0s5jziyb/muPbDZaIASCKYeedpMwzayNMtfIyTI
X-Received: by 2002:a05:6000:1ac7:b0:439:b440:b8b5 with SMTP id ffacd0b85a97d-43b889f5b49mr9488507f8f.43.1774515756148;
        Thu, 26 Mar 2026 02:02:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20260318073346.18041-1-dario.binacchi@amarulasolutions.com>
References: <20260318073346.18041-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v5 0/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A support
Message-Id: <177451575531.103892.1628569309866054058.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Wed, 18 Mar 2026 08:32:49 +0100, Dario Binacchi wrote:
> This series extends the Ilitek ILI9806E panel driver to support the
> Rocktech RK050HR345-CT106A model via SPI.
> 
> To achieve this, the current driver (previously restricted to DSI) is
> refactored to support both DSI and SPI variants independently.
> 
> The series includes:
>  - A refactoring of the existing driver and Kconfig to support
>    multiple buses.
>  - DT binding documentation for the Rocktech RK050HR345-CT106A.
>  - The implementation of the SPI-based driver for the Rocktech panel.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm/panel: ilitek-ili9806e: rename to specific DSI driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3bdd847ac2278d675e86000fced794fd61159974
[2/4] drm/panel: ilitek-ili9806e: split core and DSI logic
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0efa7924243e461a643a44904653f200bfd40ee0
[3/4] dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7cad20e339ea0493fad76db27e4675b2a9629e7c
[4/4] drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a05f291175f2cc01fa95c29dba4493cd3f8de594

-- 
Neil

