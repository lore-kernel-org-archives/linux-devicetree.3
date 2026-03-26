Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A543B7747
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515758; cv=none; b=OBof4ejt9xzkyuEKwp/nKudVgwH6igOzUVkQJQVlkR9Vt4ZmZ1h+AZsa3YKfNVKRglGQ3P6ETi97YAB2JWc03n9A/kZeMwZZj0uLdY3xByoa+V301Vv6bBIh/Le8jxvD3lN/R05zK/TYPhPoX+vrQs+UIIeD5i8VJDEGOQaZtH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515758; c=relaxed/simple;
	bh=9B5EhACm1SO3cSbQkve3bOUGvRIAUV4jcsmGzBMj20Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KrpcQYmWYd5gEo59UFsaXwNEHVa4oNsi/pnyPaolricU2hvbeevCwfY8OPzJ99ARkenxi3Hd21r3IkojzwAyZAxlBsd0JRLey7DW8lZ/2R95D0et08HdH+7F1lYDyxxGuKe1OKwCy/kWYTwh8ZC2nO34Lu96MIOZUK8A/PgPtqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AekzWrVu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AekzWrVu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so7924045e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515755; x=1775120555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp6nK707lR0sQhfEiF0g4y0avkKejqhVvDLLu739Ryk=;
        b=AekzWrVuZTz0GSvI2RX0wlpkDfSGUWSq1GKeby+EnQNMKe7oAVSit1n5JlYsJr6+i0
         rlOEgn8/BBdU3byp0LWpAMCzYbB/fEyx2T0Z8GqX0dFSV4cvxLodek0YVtbr5Klq00bp
         w/JILLBE3ytICkcYA4oPmcMo1OLTFOhm7fmWxoSvZ5D6eaPerJPm+i7t/AUAvy63QdfU
         FSf3emihVa51keqy9ioTlU1bNLybsvalAY4cA9SbWCHCP6Nmjw06VsOsyoxwAm3bUoBq
         T5Eodm9d+RMTYydA4+C3P8ScEH0fL1AEcLE2cK12BFxwz4daHY62DF4H8kl2mCpXmmnR
         owNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515755; x=1775120555;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jp6nK707lR0sQhfEiF0g4y0avkKejqhVvDLLu739Ryk=;
        b=QU4UBja7Jgvseko6CWMxHw0dKCzIWy3U68PSsLPtNB874tEJJGb/GgSnkgSBG+nuDf
         IH6RoREpiXM5utDRSQp3o9/uj6PA+wfAvljDtmv/EihP7tY6MEGKKXMyJf7XesBOxhea
         3gr9H1lzHkFOY6Z+bcSz6/wB6Jk0u0bYZ8ZAlrF//mgssB4Dod+moxDU+je1xbrig1je
         oK/xBgT10CBtG5PDMjEeHnNE3HP/OuP8bezqjM68yiu89vF7xCW4u6dYBbDKFf9zlzwV
         QZf05equiuUTmt4OHPKnmUbyTlGrMm6v6VKFr6pwx0vMpjTtFU9WKFzyjAJ5sNVn5qGP
         gf2w==
X-Forwarded-Encrypted: i=1; AJvYcCX9vEU3tJmDWulP4vfx7KHLNQXF38gffKgxpbh1I5TsfkonV8FiIvT9oF8ob3hP2GI0hlihY6YFL8cj@vger.kernel.org
X-Gm-Message-State: AOJu0YzVe2T3XaunnlPp6NwGiw0tNaGeQ5N0c8Lg4lPzC0CTXifsel4k
	dPu01VGFpN6g48W8X8jfDAPnF2vIRYug7S/fATra20RE+ihN62dTjsZjnEDR3NGzKcY=
X-Gm-Gg: ATEYQzx9BSA2nBWHEklynl/0xMtBLmfPj7U8fj8O3DvlPEYtQGljaYPtrxIrk2u4r2b
	NgacpfnyM7WxJndC1ZEL+DeLKbgTbff43/eSwjo8oWce+vy9Qdzqn6uHgoTWml6lHHvzvpXFxDr
	MshPBkcbnhI9aS4s56dr6FQT+93sGQJniLV7epaNsNUpgXyuf0HUAy6YlzAlkEWpxl99h21+CrY
	W9u1BGEvLqxNE9hX8UVhZ/8OacF0+lEZ6KhlBgBkUFWmWzmcwIMtCbSgjxPH0BNHDVmXAHuVqgX
	HPmwd4PMPgz4JiWgM9KG7G5TgJwwmhtjkhCNbdE1nuJfyOQKOZAiNU2VGmEN6Aw58naeosmLqwW
	afYtArwJ3BzWxfkjCeTbJy1MkiDMOdY6jTw3pK9aUR6nShHfNapAJW0Ss+d9R287PFHejNa8cF7
	c4uZPgYJ+KxhsKIm4DC5uAsHfHFKxQp5RvVEMIGsV13G99
X-Received: by 2002:a05:600c:154a:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-48715fd6119mr102350425e9.8.1774515755186;
        Thu, 26 Mar 2026 02:02:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260316084040.728106-1-mitltlatltl@gmail.com>
References: <20260316084040.728106-1-mitltlatltl@gmail.com>
Subject: Re: (subset) [PATCH v4 0/2] drm/panel: Add Himax HX83121A panel
 driver
Message-Id: <177451575453.103892.12895641333944069200.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:34 +0100
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

On Mon, 16 Mar 2026 16:40:38 +0800, Pengyu Luo wrote:
> Add a driver for panels using the Himax HX83121A Display Driver IC,
> including support for the BOE/CSOT PPC357DB1-4, found in HUAWEI
> Matebook E Go series (Gaokun2/3).
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Himax HX83121A
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9f96a50d61ecb0ec07c4133b99eed99b72108887
[2/2] drm/panel: Add Himax HX83121A panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a7c61963b7278cbe2c27e35ce93f3787a0d5b5bf

-- 
Neil

