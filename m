Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264043A7FF
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203878; cv=none; b=OO+fPccPGmLC2F2zGwMY0FPrrskBcksKWpf2bJ/1zyFgnCTuaT1LyMFMU0ms2tLeqZ4O1AZkB6PlYDHKyMrXeIMj/irmKbCHg80gUHYDv0TO58RXfl52IoMNfq1BFtw0TTsDcjU+dK5OvT7iTxiZZhOzgxCOwcJzgLbq0dlAjXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203878; c=relaxed/simple;
	bh=EKX35ie9/USsn0Lh1pIBDFxv7amLEruPOvFxMnWeGnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4sIe3JeHncPraga4SpeNdkO3f6dDcYzuTCdzQrlw5GZW5FYyNKZsmIUKoah/A6+mzBTb3RiLcWtPKlLlpi/a1QZfaXsmXeuYnpEgbS8CTln/PpVMKVg9v2oBA8hzUWw2xK0JfU70ges2S1bLDetF2v8G7Y0aHcGdNX5yVY6knM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7P36F21; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7P36F21"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e73611928so2286845e9.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203874; x=1790808674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mI1/ZYE5YHBF2sXaFTZzYUzCnN//3DiBm/zH9LcBkPw=;
        b=q7P36F21o8SR9xcYCLCdLlzodnr/WLXRH3eQy77uiPD1la8KmWVLJpczwS36SDjxz3
         WjqMrm3e5Tq+zY7m8dB92immHr+Y52qat2rwiCO5ILWnABEd9eWCZoDfaIe4omahsXu4
         OEyRfurBc01MmD7qj7GxH4PDciCVoXOM+L4Ul1Ayod71ZYCiz6wLApQqHtMG3ZaJjRsy
         On+ey/i6RvKmYhd7sNIR3gHrKWi88u5i9NTXBmjtsx3q/2V8X7LeBOvXkvR+zFk3PZul
         maCDCs6yQjo8ZPVFJSFmwZ0D4DF5MM9/Tk0ICrQ4FRxa3Rmb6tI7fNeXlBgD+S7xnZVJ
         BEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203874; x=1790808674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mI1/ZYE5YHBF2sXaFTZzYUzCnN//3DiBm/zH9LcBkPw=;
        b=YhsgtV35zw1PNVCP3VnxwgijkZOUa3BMVAoIlPXrpzOv0pi/9eia3ghH8FH6j59J1D
         3rorY2DW9EkC5XYZBo/9edTom6lKD8/imxmkGYBQSWIFfTEXS179BlapFY5UFz/RwdC0
         K1VkHAR91yPXlp4VqvF9IjnNK6CB24Hbi6DbWFDY0XkqwsXB4tOAmJu5GDLcruRhLTp7
         JUfpTq6cqAWbTkM3+ppI+dB+MG8Q/QFoI0aeF5EixHptnItc6baGnc3X5pgGiT1/2UJd
         akP4jXdgFYCeKdq5tVbAU/MTpQgc7Ed9DxQVcc/M37UaKozbSInh3TEzNvlOhMGqR/SQ
         h3uA==
X-Forwarded-Encrypted: i=1; AKwUvByim1t0YoJIDdYassrBpNM7EInDl7lcdWkuEIv0Nt2zDVh/0lIU8nMTB/jdxc4MjCRBrjD9I2A8N6N6@vger.kernel.org
X-Gm-Message-State: AFuF++kubmZTtLq2rbqQmDk2T7zXY0Vq/AdxAKQ+q5THbYiBjotz+hHn
	rWhsT7OmcNaPGWN6wEU38yQsCDFqpW6keeXorAy0Ql2V032rSglg90yB
X-Gm-Gg: AYBFou2WIy0Y7EhWCtVSABiYrBeQsHVG9Tq+gJhJcF6uNfRPM4a5xIn7rc141PC1d7V
	REdHvau5+r0HwPkVsyRtZEifOIewUmURKs6VMP1dSgo5lJNve1Pysfpjbkka3VHjMDXuppEHk/s
	GZCH1L/DtfmWWXfOhgM6Z0PRgEsdBOH96onbYEBd4U0aaacJ9leiLwiOiBDA8tRkMftEn3h1ron
	mfAa5+86K2kBR01Qo+NbmqSgJtnReMU3wd42B9oBZC7yYB+ShxYxovap6nhJ0nMZtjE+BBw9y2k
	DD41zhYTWX8Ek8WNomSSFKxdr//aE0gcqQGhNaMO2GSVEdlsNh5SQ7WaVMdaZmwlbvd7fDnEgZt
	M1toMXCwqKV9TafsNDtolEfJtlJRrWc1rqREFbJj9K4yO+Rab/eF1/3JTbOSz9+7UjI/W0wBZhE
	lNcDBh9Pk8qa0lgmqXVE4ES+hBbVmlHiUrTYGbMQzuVH8MLl+ivp629f2NjtvUs9B2UL2ibUAh/
	5nHX+KCVkb9wP2Y9ARYAgjV/pXcQ8pm1A==
X-Received: by 2002:a05:600d:8642:10b0:49f:c305:f4ce with SMTP id 5b1f17b1804b1-49fe6705708mr6898435e9.16.1790203873928;
        Wed, 23 Sep 2026 15:51:13 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm9822109f8f.2.2026.09.23.15.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:51:12 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: devnull+david.ixit.cz@kernel.org
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 04/11] drm/panel: s6e3ha8: Introduce AMB577PX01 panel
Date: Thu, 24 Sep 2026 00:51:07 +0200
Message-ID: <20260923225107.191388-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

...
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
...
>  static const struct of_device_id s6e3ha8_amb577px01_wqhd_of_match[] = {
> -	{ .compatible = "samsung,s6e3ha8" },
> +	{ .compatible = "samsung,s6e3ha8" }, /* deprecated */
> +	{ .compatible = "samsung,s6e3ha8-amb577px01" },

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
