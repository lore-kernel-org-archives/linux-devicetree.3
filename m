Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320A1DF980
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791318; cv=none; b=vDjMujUG8/vdcDOoZzByItL+OnQAjlTeuu9JIUcxqfPxfk4Zyd31Fwj5Zkd4zZCYJEzq6P9EpVCFRnFHd7uGmvcXXJ/sHfWwnyVgjOWyXUD7z2+oZfDkL6kOuaG3ukiIqRpkwvTFwjSj/RbBJiEM97Eouuz252HWJ1J/O/b+Izs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791318; c=relaxed/simple;
	bh=uXegHyUWTRZBXPDH24Ha2RIhwVxhnwIHpYMj8XcIIwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Snl8MwFHXAn9tX/FNKFJbsyMtxlFCzZRbWweQIngMTT5q8JJuEZRqsJa8Lvdcji5mFEB3+RI/3U6pAJjn4tVFZvzRn8RN2LiQatHgHuIca19EAZo0heZfnLVclCE2qa5tkD99agmsmnRyLlDrl8tYG7eTU7QtJpvKKasyj4teis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hID27F3y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hID27F3y"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so1657675a12.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781791315; x=1782396115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERYEJs276ODTVX1gyq4QIfcbsTkfe5OyvTObXUbWdmI=;
        b=hID27F3yfsWhuvEMjEGzQ6hJf4zCvHZbasyVGZAFi++PXoaw+Q3j8hwMFZSgtB+fL8
         g6IIZirYe/O6a+ORGIW5xj/RnWR/9fh1ySilyDKfrP97E/X+3/kJYeaxdHyLQsGobLMn
         eb+jhJ1iCyH0b+YHTcxz5Bo7JQuULurIg5gPd81Nn3+3c/OZ26pxH2tWa77RahAfzrIt
         /g/VmUfRN1s7jXnEhun4n8pa/X96vlKgPmGIGbWmmj6S0R35h5rLNkrXjIgLpatQIJXt
         XL3JQMdIK4SooGkoTbl/pX0AIwAy9rwgBqHfGoi+9c8k8Fp0YTJCPLvE5byC6IbZOmbh
         i5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791315; x=1782396115;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERYEJs276ODTVX1gyq4QIfcbsTkfe5OyvTObXUbWdmI=;
        b=nMurjZc/koa+QVk9xkLUilV4qCDc1UtjvsCrh9cuNYfJ0TdJ1tyb0+uEIUlPVe28tM
         jplHFKk2YIAus5zPbupH3+x7ITNbJFTZLM8sBAnY1qZ7wBE6PdhtQSOvte+iRG3E7CjP
         oxJNa+2h2Bext6HehY57eUpUDQU0riCzgowFe9oy/fxeaeV0wqOuIcnkt1ekcyUT3aWF
         BD4ZRVszXrCsboGCfqTzDUKDjPua7AflpSV8Um77KEcAW2Pc2JhwGDo5nvn/My5fKybn
         Q4Oy+BVaLqKwnx+FY41iVqcN6AExjCkozg3G9eXCv9eYr12yQlZ+WQKj5MB4aLBQxkmo
         g9PQ==
X-Forwarded-Encrypted: i=1; AFNElJ9i0qZWEq9lQ7zhDS0rp8WtiOr9XPKfQy2DKMEGJI7cm7erIu/OvFNTUrG67kket22fyqIspaQhQa5V@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0geos4XidmGC2G7vIlvnyb8CKj7maDX+hpaSSdYM8ki+Zxhn
	ZtTPkcmgBZz1tPCqbIE+3tGpI6WlU9wJmaOdAb6wiCB2t+iAhdWAP0y8eam7+sjZQeQ=
X-Gm-Gg: AfdE7cmTP0itFUnk48TC4pD5FPhZwZ42DF//QRTgjJTXpM1rOhaVE6r/jL8jipIc1Yd
	p7ysOzyzU9vzNyjQaGduMGkoDJwJi6d7g4w3oT0jKGCOLx8Bm2hNQ44hQnnUUrKCikhOHo3Uu96
	rjFdGKfbd2Y6mP1gUUvxUT2AECYbMsoPYMKNEYQX8Ue5BFmWp567y9KgnWpd1Gtxi3uyWpDSzXl
	xsr2yonnxATsxADEQRFo4YBVwegsSGtzWrzj/qZALF/AKWXA6M+lL1Sgh81eK0E5SXk5xTCycd2
	EMB+MhY/q8Pc/4zcSw4ElJrveIhWXJsm8jfYrmLZH6vtBELAj/JOgHw3QyuGxm2YoTvuyNqRWBO
	btZ1ro7IQ1gepSPKlLvBqcS/0TKmKE998vU3WMABRCjgSte3YSL5PJzlLn/b1kjQWVgJyXTXok0
	NjGU0JJqnmInVXuVjU+d1gKt94ft/huous0A==
X-Received: by 2002:a17:907:268a:b0:bfa:e08e:3f1f with SMTP id a640c23a62f3a-c07c67b1757mr134600966b.24.1781791314977;
        Thu, 18 Jun 2026 07:01:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b3ed0d2sm27901309f8f.22.2026.06.18.07.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:01:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Teguh Sobirin <teguh@sobir.in>
In-Reply-To: <20260607-icna35xx-v4-0-64de514add34@gmail.com>
References: <20260607-icna35xx-v4-0-64de514add34@gmail.com>
Subject: Re: [PATCH v4 0/2] drm/panel: Add panel driver for Chipone
 ICNA35XX based panels
Message-Id: <178179131389.245596.536714771652652273.b4-ty@b4>
Date: Thu, 18 Jun 2026 16:01:53 +0200
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

On Sun, 07 Jun 2026 15:11:43 -0500, Aaron Kling wrote:
> This driver is based on the one by Teguh Sobirin [0].
> 
> Due to [1], the AYN vendor description patch has been folded into the
> AYN QCS8550 dt series. Which means this series depends on said series
> and it must be picked up before this.
> 
> [0] https://github.com/AYNTechnologies/linux/commit/4c5e76e974db7cca853619ca138eecd8f004622f
> [1] https://lore.kernel.org/linux-arm-msm/c7fb3f89-6574-4761-9ef2-2fdf6d4801b5@kernel.org
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Chipone ICNA3512 OLED driver bindings
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/392313ce84a8498164137c6941d5c6a3f7740f1a
[2/2] drm/panel: Add panel driver for Chipone ICNA35XX based panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f747473a838ecc25e842e3c60ea95a5175be932e

-- 
Neil

