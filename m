Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8EF47F3B1
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932595; cv=none; b=glrGLVOJvTOfvbOf0ojsj+GcuZEEXTI92Dv5AC/C+o4bZWbcg325e8jlM3gm1fRedkvOsfPDOJIwfrge7DarDUhTIqgw8GXq/052I1j1jcl3V+us/CzllQXgHhyquumtyOzG8vQ834YzsIJ9iChUZboZm1u8SKlmPi5FrZxR4Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932595; c=relaxed/simple;
	bh=wzEvL7aoXZ9DPdwZv8U1uHRR/rUu9UnMW0cqiOXa9sM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d+/cfN4bXNUIpm659xg1KRaaq/jWjMSSzi9Z52o9yKwDL3Nc/2ZJowO62wPXkkNT2FLjig7X3+G/9ESfWu0H64QsUTZ7cl2c/JOyyETUbn0CDMr8RkI/DFFvBuHOzX4XJKIX1bw77eP5nRwbehl58J42WSYtwnpSwrxNM7vi194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZG+QgGoH; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZG+QgGoH"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so4417369f8f.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932591; x=1791537391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9dZvdj5g2Xf7CgbEOngSTP98R8970sBXh4beZnL1CI=;
        b=ZG+QgGoHvd4Ky5ZxCCKFq4DEmC8GKeSoQFb5L/x8fAPFfHLxKPAchXOkrlEG3Dr3VI
         hAa08uSWVQJsIwbBd4QGesH+bn0b2xCzIhLlGLgWgEUncrAaYRmLNX3Svgwn0tZ3IFFD
         cQ1tuPjWVMlFP38nBRH99PrgHdD2eJ2DDo6iJgzlMW05a6mva+7hd6DJWK+YPdCvFiWx
         rhsyxFh7R4QzkoAfL8Z8eU6HhWvRNWSj/f62XWG5+3vqd7x/B4yIANPYigbWbOi7QxHZ
         A5KQFifP4eH/sXjaEFL3T8Ft0xHPDwch9aADd59u7jK2zr3A6Mh9nwrmVMoOX3SCCT/z
         YCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932591; x=1791537391;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9dZvdj5g2Xf7CgbEOngSTP98R8970sBXh4beZnL1CI=;
        b=b3AD4s8asg6ECnjth8jepJLNAan+7LJlhGH93ciTLYqBo5IpZgOGN/7yJmTPx3BOjf
         E3Uuzq5s97Vwr2DfqvaK6p+0+vUJ4j7eTyUjE9COFjNGfVd/S5AhFhNzId7ig0wY6d4P
         ddFN64xcNRX0x0r6fc/CYGYb8LFptqE/umu1C1/JMF+ww6VP8dxp5+0Sf17Hj+5HwCQ9
         MotxjX2HQ4I/PqU6azyOpF6ET682KKwHZ9W+Y8j2/opuXCWawTqm22gyBmJ8scl5Jq9n
         epLINuxV2D/BI3RacoA+lzjfUQTRysebtqtq9Fh+jgW/tysEaaxSOFj9LMMkx4pLbQYM
         UeMw==
X-Forwarded-Encrypted: i=1; AKwUvBwxB5P2w8ZPQfoNY/39kCV17fyWl7I0BMF1f9uA7YokD2uZBKd27bMV0qXS5fGmmvMDOruuFXyXck9a@vger.kernel.org
X-Gm-Message-State: AFq9FYIgUkE8pq7ZZ/qGd3HNGkp6uBbS4V/rwkyaiQVGo+2o6baSxQOS
	wBY16jgaLwBL4gGITq+izTc1XadU+kuyGpFzG4lk6QzPkGGLXcuxUdMitvhF4bwOf+U=
X-Gm-Gg: AYBFou28GCS5sAXsJuKVYFEF7HKMu8/4yrTcv/BATQUT0bCQL9oq88ZQ7iwPvoYjQKy
	dF7JtKFKZCDpsAFanXxgu1+INwfkMUV8886JJ45Qe2O78yir2JLJk0pZsHPqfMXwzLnw4E10FZs
	2Nct2+CVw/mOdqs2n+qn8L2snmjz1iE2a4/Qu21T0g1vlw9X24+Hc2FO3I1B7ztPAfUtUsA64C8
	I7sGLE1QOteeVP1pWy60KAzz2u3Rg0cqvZnckWyr76M0cgZjapFGz46vnK9Ad1bdWUTyBFEOVAJ
	MK40uLq7wBg1LC/E+qzMvV98rbBfeoKfnFHrgH7o9oSdfrsqGRobkuKmSeaZmZ9rrUX/uDdf4sn
	dAnIS/CZSHnUJz9FFHthAbOgRo2BpeXtaOQ+31Fy3GQu93EcJm/lWmdpQ8qS9+D1AYnx0GujwbU
	Zg/CVon+DReoZUSducJnw5MaRQVuZ7Tb5jrTssj+FwT/1wHd/HAWvO0yObAOBVZFWa/Tmrmjqaw
	SHPsjiRL8pyhcM/vis=
X-Received: by 2002:a5d:5e92:0:b0:48a:efed:ac97 with SMTP id ffacd0b85a97d-48b1271d746mr4025071f8f.33.1790932590900;
        Fri, 02 Oct 2026 02:16:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001-asteroids-panel-support-v4-2-fb228194ad91@pm.me>
References: <20261001-asteroids-panel-support-v4-2-fb228194ad91@pm.me>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Raydium RM69220 DDIC
Message-Id: <179093258996.2282096.10304907203936947883.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:29 +0200
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

On Fri, 02 Oct 2026 01:51:46 +0000, Alexander Koskovich wrote:
> Add a panel driver for Raydium RM69220 DDIC based displays such as the
> BOE BF068MWM-TD0 found in the Nothing Phone (3a).

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[2/2] drm/panel: Add driver for Raydium RM69220 DDIC
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/54e61ea6c492d69a1717018826d8340810c812eb

-- 
Neil

