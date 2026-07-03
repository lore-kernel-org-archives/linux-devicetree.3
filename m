Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444D0377560
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068142; cv=none; b=sn4EWmvawmrTy13chhq1Z743vnGysRWvNNY4RngFQixGNg/laxhhMzwJPlXXphDMkmgQQ/gN0ngOI+RdAzrNPAdqpsF4lk4t7Rnj5QzpoXuNWWncJeHMNeiz58ria8yk/LHuZ8IN1FeEB56C1H7KZ5SHXy7CGrnjAauEG2p18kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068142; c=relaxed/simple;
	bh=CPQH7kRssQrcsM20UNrYb5b4f9/R0lm4FD17MeIgbQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vj90v/AEBU1RjUUCEUMqkkOQYu0TJ+oPNl9Zv62f8LPnUDOQwy5mE9AiW06UtBXGZ71hfm/yB0+zEbap3rsuyFKcQb9u7ofbI3bQx0F2sE46+6NmT/42HP8Tkwqvs2fxvhz9CV8QO41WhPn7gqY/AHu4fm4OKYMXZMcI5BtSfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbapasu7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbapasu7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472326ca506so201384f8f.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068138; x=1783672938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzE4az3Z2WN02We+LgBV5AAaD12sTfY4548Cc+lL6Cg=;
        b=rbapasu7F5n/Wguwh4QvPdLNGQuCwKi1un6343sP6PEd3NfEL4ppzYQvR7xo3cXDLC
         +mdN/o7WoB6vUnt24xjY86w57aWoSTqLlwNV57qGwfPdkTyF/I0R/CdB0/inKRkeJYq0
         1SmWll3w8+ns6UkZREoxJ+bnA4+9V9etjhRrN41iLNfN7Cn8R2L6/lq7NhTc59wZyeBB
         uKXBJ+OTJjAucICOdZOvNQwbhaq43VlsCUq1Jyp0K7Xq9oUzqURLl+Nvqm50ZsHtxz47
         3mnO2zz2B0/kBbzyN62OCTc0hTipsbneRoxIA3WoYssFQgZDjBrowkh2iKzkV+mMoEM8
         7vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068138; x=1783672938;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qzE4az3Z2WN02We+LgBV5AAaD12sTfY4548Cc+lL6Cg=;
        b=ETWT8ttv94jy5DQApAoxq5QS/9XKox9GV44qv9afOP2tux3nw7EztPclzg82tC5uaz
         H07zYvep1SNLUry3U58atWCxGSluQxan151d54RHMarnRxGrO0nihUcP/QpLPmRd9fwL
         dsDcSpU6DtXQr4MouaWiTgMR38dJK+UF8rxjBPK6PfX4TQu1LxJELrDAdpM3XxZuUJHg
         tym5kQtzi2UzT5lMrDjJd8SqDUhdfTu1WJSigNG/ybZT0PlMH2lNjGn+STL+hD2UrAwK
         Lic5UoWzakM7UPBkVoPNY5GnFGs9VCWTTaP1DvDva5YrBb+/QOF6TDw+Q5JaL/GJ9lux
         GGKA==
X-Forwarded-Encrypted: i=1; AFNElJ+QR4sgBr315qzGTAxoggQjcxTowdSWlPVzSuj2rva+eYFtrmz9xEhQjtt6qixibnisT8MOm2ZtaoRs@vger.kernel.org
X-Gm-Message-State: AOJu0YyHrawn9nsAD0pPgUFTs3z2mMCrfX8qZ8whci+LZ1sH+TXYKgZx
	+DKWuA9962PlSUZ83Z1Ja2LzK3nIP3GHoClebDce1sgHN6Ps8HqFb1NUwpsCHiFnu6I=
X-Gm-Gg: AfdE7clVMXC/nyfABwVC41B6sVXpes1xY2cGZqrGhh6EZKEOfrNf5ZXZvr+H4zlukJe
	kMe4C4GV+54kFhWimvLCRc2X/GkN4yYsOYq1GojQIBXFwzV1Lq6FmWkuP0D1mwzTxMD4Awn5RN1
	oyQ8Ep71iZg77ixqEyxsOzbtlq3J0Ap7hxmF+0FMt2p1Laau6EbFWgB81Saxo0m7VxWq9dJdA8p
	yvGy19AycwmHyRRMo21VE70jymGDo+3LakLApQVSTYiKH0LVtWzeg4nh31JeZXpL6OXnH4X1fEa
	lr5Y/HrnhHDq5tI86KsTGTf1QdNYe1Cab6zDnLBy6CeMoGYaHkPXY1dVZJN0khqbiNk5f08gUm0
	CE+7mfyfDG0d9aZggdQgPjrJ1tOFScDdTZl/jsKyjACuDkOJAeEv7+sq7vaQnhsxT6pUnwh0dYY
	RGYMG4ihBx5rcIUhqaxQ8Uv7w+AV1HaoWvO0olKsElK1zx
X-Received: by 2002:a05:600c:574b:b0:493:bc4a:9547 with SMTP id 5b1f17b1804b1-493c2ba70e2mr88243805e9.39.1783068138062;
        Fri, 03 Jul 2026 01:42:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
Subject: Re: [PATCH v2 0/2] drm: panel: support the R63419 based dual-DSI
 video mode Display Panels
Message-Id: <178306813662.3165305.810596884490699694.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:16 +0200
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

On Thu, 30 Apr 2026 14:22:16 +0200, Neil Armstrong wrote:
> Add support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: regulator: document the Renesas R63419 based dual-DSI video mode Display Panels
      (no commit info)
[2/2] drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1190fc8d7b8a9cebea8dcbd2e544e43990ae81d0

-- 
Neil

