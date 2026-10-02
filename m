Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D30628B4E2
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931421; cv=none; b=c4DrvvxOKj0JEC3vAxgWYGtg3qVz+WpTE4i7IE7dcyE0Dx7URC6F6ugMr/YIXLgokOyEzPsWb9uxObQ69epuL28IBwzJNLBKBA+QBUs5pg9o7r7Gw/WLqUoacxckOm2Qa1kfKRGnWCOsLGanEGw1/bLS8gTD83v8FgFMA3/Uxw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931421; c=relaxed/simple;
	bh=AKpAwGrAWkWPODtfuK12U4uxiMLieKQlbgES8jMWlzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otFD852aMfeezS3zvZ4+EUgmHeQ4MBM6WveKy8ltAWYPPxQHOh4JW+3m/qzQyTe1H/SYe01HTGibfKMUOualRxsq20diFlew9TyJd8FlfwPbE2AHUmwbCg3LgHz7BVDa6KpaWzjYi2KDYu9LxsdP5hEVdXZTAZCjCR/qbyh2mz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpSTW15w; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpSTW15w"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-887d4b0e846so608941b3a.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790931420; x=1791536220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpvwnxAk9svVbGHuD977nmsMKCoPbElte6mylNvKXkA=;
        b=cpSTW15wkqe1gxhkUDXYsc/8sDgK5EL2/zSlxKAx+691YPeYF6/YhH+9ZggmKWPKaV
         92WUYKm1IWIQeFk+j2d8p42/HRgJJ1Imv/qi0X1gnyZ6EEgSDjLI/LxG6GFNlucTmzJk
         z80myiv7fLn6nhsDJ4pDSxu2P0bHOOwNGUHZHqbf9PMPU6fOevM3LGeMfnB60/64x1EU
         MIdVGQ7qlZGuLQtvuGnqWeQz3iav7ChrguC0YG2euIqnuBaoX6vQMOMoVz6Ebnl0PDhh
         ELTQeVidueHUoJkNbuJjxvoEoCrcO05D744vNGCG22DR7Py47YeoFBLEj3959UQ0FZLk
         N91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931420; x=1791536220;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpvwnxAk9svVbGHuD977nmsMKCoPbElte6mylNvKXkA=;
        b=sOLV2xR7DFiant6fa4XTeVqH9btuCZvbohR5ivywHfz30XHhQP2PKLMiM/eYwrA1fo
         2Y9jwr7VU4rvxW8DqjjphdlpnJPnUphOWJELOtw1LkpY1+FfOm4OckXrF3zEeGm4MiDo
         H3c29mOQ0FKfFq8zrRKx4gwkkMPCXv8rVtkSwKso2y9pWQxdqkx9g605dsKGbRkvuaGG
         o8LSMoU5Hjq5Q41eESY3CpHV+GpFHH3l+Ebv6Dq1afBvpT3fkMWsqbldNJQMAI0h3N9F
         icp57jzbb2TiCWL1D2zIllsSxkUqXP9L8Gcesr8E6TLOJemW/JpLRilQIDD4ceAtPonJ
         7ZWg==
X-Forwarded-Encrypted: i=1; AKwUvByj7hZpM7kyTpZ3NideZAX+FLQE5sz5RzeNgcX5gY3BAD+87HHqUzw+dIot4SmzTUuGCFPONq6McmDo@vger.kernel.org
X-Gm-Message-State: AFq9FYLS0UmJZ30UvGmoajcXEftAUNPTXPSPxVCGlybYcf1zs+AYdgd+
	1HMTcE2wQgwlzaQHOhKlB2cTiXVfcvfE35qos69WeMLPAePBu1k43EG9
X-Gm-Gg: AYBFou0Ewon3sftu+P+YHzsXw5fMKzxLDMstYFvpE+15DgZPGeH0X7vDDg+xP3iFpvs
	e60euNaB+RpC3PoupTgRm3VZ6ty20kJjLsF4NODo39/cmJP1zdJx/Xk+1jGKi/TCnJsYQIUm64B
	aZ291qBYxFF1/yFPBs+/blDiQsMg/XS4cgn44+IuYKCBhVD0XG/BM/wZmjXgJ8kB/5BnFrgkK28
	de/PeWmLt/NZ1A9PJf9MMux+GuOtKAQHkIdAmpgUHnhw7yuA8IDkzl57VB3rSuguFqfx2vq9zbU
	kFArCLFzrKt/K9rh4b6TZq+0eDXU9AUeX+3jPxfb5kTtCwr68aPxD46211QC67wD2dMB+Rpq2DJ
	wbzA2OPadV6tVHfmd5wNNEQBdympZ22WZgjIMQqKUWBBHYzhgWnatEsGmUhdKCpx31KIIVfECic
	u1m96H1DOUFqZtsQDTVXt2P2nxdbahPDTvezMNJav+f/ZUHqiBm2xYEtNojhevnwT5v2GJjNvRg
	wT0rWvBAGV/pHSPJ50NtwpE8ak0I/isRPwoFUSowBudXlNFthJkdp3fGjjQ8Lz/FYwRHpoi9DHv
	l+sGTvLBrMd4bOGNPeX0sIOwAfzQR1Bd3fFT8j+xSQlBblVeW4L4lhY=
X-Received: by 2002:a17:90a:c88d:b0:3a4:ee64:f492 with SMTP id 98e67ed59e1d1-3a6cec30c01mr1156984a91.33.1790931419389;
        Fri, 02 Oct 2026 01:56:59 -0700 (PDT)
Received: from B11403806-N.ieinet.org (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4747100sm7956667a91.11.2026.10.02.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:56:58 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: devarsht@ti.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	vigneshr@ti.com,
	LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v2 00/14] Add DRM driver for Solomon SSD16xx e-paper display controllers
Date: Fri,  2 Oct 2026 16:56:39 +0800
Message-ID: <20261002085639.109873-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927182329.4193961-1-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Devarsh,

Setup: Raspberry Pi 5, rpi-7.2.y with your patches 01-12/14 cherry-picked
and the panel entry added locally, SPI0 CE0 at 5 and 20 MHz, DC/RST/BUSY
on GPIO5/6/26, CONFIG_DRM_SSD16XX=y, drm.debug=0x02, no compositor.

Bring-up is clean: it probes, the connector comes up at 800x480, and
reset/BUSY and runtime PM all work.  The three issues I reported on
31 July [1] are all gone - the mirroring is fixed by 11/14 [2], rotation
180 draws, and refresh_mode takes effect.

All four DT rotation values work, and so do the plane properties -
refresh_mode, color_mode, clear_on_init/close/disable and
refresh_mode_init.  SPI is fine at both 5 and 20 MHz.

Tested-by: LiangCheng Wang <zaq14760@gmail.com>

[1] https://lore.kernel.org/all/20260731035705.3198816-1-zaq14760@gmail.com/
[2] https://lore.kernel.org/all/20260927182329.4193961-12-devarsht@ti.com/

Regards,
LiangCheng
