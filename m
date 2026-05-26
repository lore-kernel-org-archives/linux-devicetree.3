Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDF3FF88A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807221; cv=none; b=TLmyNFNN04nzATZ7Z5q2q/xegk8eShzrLMfhoUDGET1H41awhWQj6tpdL8LZeB7K/GbBK/ak+TMdXFH8P/EW5WJfTH8t0xVD0FQ8G4uME/ivngnm9adqFy8kQuLz0bE3Huqm3hqlwbwamXrIcEJo6QomRUb2W/Hagplni8cY9ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807221; c=relaxed/simple;
	bh=7x3ygg5wVj6+tkN5rkZuxLDp/1t2QUtz+ZLesG+5BWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B8TBZohlG7sEHHmelaa/KXrOW4hAY6QQ6HTSdWgJgizjANtwtxpbzV9Yx/a+oj2YcZh3JeLNnXo7Ozs7QOuWeSSLKn2SOVfpWuiPAnlHMQYGCjw5/XLG3jr0KtxEi54MJdG3BvyYZpaGMi/VFrbt50DCw8jWZRJJomm+x3VW2JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0ItoQCK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0ItoQCK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4585a116a4aso8889259f8f.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779807218; x=1780412018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5Dr3zYrFSXyxUBIKW5jfQLWA8VBkTchLSTQFuRA3B0=;
        b=g0ItoQCKM5foOR3MukHfKJ+ygEQW7wY/gf+HJtuzwcWwjkDzcMqAoAo9PswX7yNA+T
         6hpZSXHqmDI4T80FMXHggpyc6YjaP7D6Xmux2Q1wi/RXTRqtb8o/PkaenVKW/oJxjX0K
         IklIMmIdu3zqQ8RHgzYPgK2YsWuk8ltzIyQCpWqV7T2M5R7iZX33oGj/SlpiH6G4ZDOT
         6D/UOlk334QU3/0kFT3B30AqIhfFHJl6nVEzej1Ty+dswEyQfv+bcyfeLbl7nDa+RE7P
         Ic7QjbkRxlS06ow7RVGUJ2PAXh8BKw5iTTxd5JJWdWchPMlso6vO/1BcQ9D78O5IDKtU
         qxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807218; x=1780412018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5Dr3zYrFSXyxUBIKW5jfQLWA8VBkTchLSTQFuRA3B0=;
        b=Y/mcn9/mcfUpNg1Lh+X1cZnwEhgo/Wji4BkgSkzPBmuwLUhBIuMthWVFEHgFl6cJSW
         IqggQUdoxzPKjTO1mGfFldNC/qmb7FnqdOOEDvhhlPrfWQyNdotru5L1LViQdGDb4qKV
         EylNEVcB724DnR23NAl6DmUuyaWqsjCYc0ElB4S62rts39/h8DHVKMxv+FbxwgiCwPZQ
         U8516vnJrXEVoB9SfC+2nrTEolnZeq1yMspxSP/sAX3r2QnT5qsQG1babHhvO6r9Q7HW
         VhYxqgip3VEvSGy9uiXmFZWzuUXNzpPrQSHsSWN+TDWMxvIbjLNz0jWL+mA68v2161mm
         nPoA==
X-Forwarded-Encrypted: i=1; AFNElJ/kFpxhyaQAVnFAC03hQ0knm/W8jwxVF5RhqRlElVt6fDX2mwc11hkhYzTGTiBwaoGLCyKb/oMIKlG+@vger.kernel.org
X-Gm-Message-State: AOJu0YxyD5uWjk1+huAPzorEdNclCRVKyiM8VCsp8xJAfX/pk4C325UD
	Q423q92MnRTu6/DNJkARBjL/vhdtcOm/XbJl1LfBSUr3jpxJGhKVGWTuPGHDvKtuuYs=
X-Gm-Gg: Acq92OHon2imfV3Tbj/HfZImODoJIAUzQ/e4a/0nJhDo5nWn6T4PKKhNK81L6fra3QY
	kxF8+JapdU3q1heGI6Qff44Ad+yfELOWnFslqml28JfehAFSCBU790XVte7p4mUOTUQaMvub+PB
	AvZ9N48js44Xau0VKLreJDscB7+2nBbLXWFQTotDAwjbVg9bdk58EpdNHCXHabIOHoWAhpjzd+L
	oDzInHKykT9Lkfo5A3m5+6rP4lj1gf+zhaITHYyQXg3xBElrGPrvawGuqDpb22c8RKwRUGZTB1k
	vIW1gKHFe9C9If9UvLsEPASEc0dcGs8cJY9PGr1TCIIJqHEBYbRH7dkfHwBZUKp7iSBKkcQfB5y
	JGyoWB/PONGg/mHHf38KYhJNGd6IrTKVXILwuwtBW/bGjX0hSf8svshOAgHAjoLH3PXesTeH5qW
	FCx0SfR7bJvUV+twXnaYpSSNpRfaLXY6Zd+0e1NPzJWBih
X-Received: by 2002:a05:6000:470b:b0:45e:8547:f217 with SMTP id ffacd0b85a97d-45eb38a6bcamr31101990f8f.37.1779807217972;
        Tue, 26 May 2026 07:53:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d49132sm36278884f8f.24.2026.05.26.07.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:53:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20260515082232.1766586-1-dario.binacchi@amarulasolutions.com>
References: <20260515082232.1766586-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add
 AM-1280800W8TZQW-T00H
Message-Id: <177980721706.3070642.9809257251059448282.b4-ty@b4>
Date: Tue, 26 May 2026 16:53:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Fri, 15 May 2026 10:22:00 +0200, Dario Binacchi wrote:
> Add dt-bindings for 10.1" TFT LCD module from Ampire Co. Ltd.
> as part of panel-simple.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add AM-1280800W8TZQW-T00H
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/adcea8fcedb67cbd2f8a164393526f26c36c3dbd
[2/2] drm/panel: simple: Add AM-1280800W8TZQW-T00H
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6acb810ebc5d8dea5c250326c14dc44e32dc8e92

-- 
Neil

