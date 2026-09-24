Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBF6363C59
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258373; cv=none; b=Oj8ws+TjjG5LxnbMizmCs7hq3lCDdFF2oColi1f9F0Jo08FzTJveYEV7rp+/z7Y3+UYRZDzzzxwgYSbgaT40bIeouXHLtqIGACgxC6FjL+UjLBdvLvFjePtKYdSL+ZAU3ZmT+dHWOcVYYywKIm3T4NWkXx8wFzAhxvDqxLTmzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258373; c=relaxed/simple;
	bh=L/4hv4EZEMiVQux+VtgLwWpL0BikHh5yp6cw2LC0nRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pAYEJ7v9vT9zcXK0/6wZ50/q4qaWKBtdDms7Hw3q2O/yC5Yn24Ok1/c+Cx/gl5F1bb/4vDOdShVaEODofomPXozFSKRdq9sW09fPRSp1QBk9JDujOQlHMuNRrNMKc22M1sdk7sGk0jaYBv+IAJVJIuY8yoXdtTLqHjfiq7yXT1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUesZJSa; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUesZJSa"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488780459e2so176437f8f.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790258370; x=1790863170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tts2aH+0naRt7JQ1fJiXvGThSzsg6pVhDhZq99ElXD4=;
        b=lUesZJSa+l5W2MHsBPczoONAi3Px0Nx1dxTEHTlSea5q8iUI3tED00EXk86fGmp53R
         iCosFJVIGJ6FhicGBEj28mxp1VpNONQaUbZrO2ImI89eQ7a/TWN19kEblZBkqk3AjBuC
         8WngNz5JWrO+Ei5kkouMuNFqK9GieyQpjXBM+R/qoGar7xIJvcyF9Yyc3DxLZB/eZeyK
         EhnTWR/QKrrNi4fqI9loH7XVG1KT/YLlmLd5NVhE47Cpab2vFEk/5OsgDviDnirgePn7
         8x0oSJ2A9CBaopzZVkqEVW8GF6PqxJ/eC2TfApuvb+q1JN/vDWfa4Jjypi+ZJToGAjCf
         H4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258370; x=1790863170;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tts2aH+0naRt7JQ1fJiXvGThSzsg6pVhDhZq99ElXD4=;
        b=iBIvIgRl/zmlsl9vnVazwpG1AITwsKZDEctEvp4vSV7Xawm1bXF0/j51XAbeeu23wy
         CDOs4awFqJb1Tb9Njg3UQbBurjG1jo7/ZSYBPy4iWLKZmfvIqyox4RoRg8CecM0hrzDe
         m2GOhCaTxGSLsJxq9KrDMYBhVLWWlKG7kiNzNrIDkVx/lW+oL6BRC8LhAzf9Cd8W5cCR
         7JH1xDuBXjSLUnxKxwYWE9BdUo3Pb7ZQJx94+pVu431amdG+s0YArSaoQkfzMNrXzBcm
         BnJlGCNNhUpGp2TEkydWYBDgJxVLrcKDYaAy5EI0F96FyBTwFyyUVXm1uS+zrpLJ1v1U
         rBcg==
X-Forwarded-Encrypted: i=1; AKwUvBwZlyEJYr1knMfeap/mdVgcexK1OQVaNG6vQGpTUVy0jCHEeGyFkRqbb38YXtNTm6MkueeakbbpOe+0@vger.kernel.org
X-Gm-Message-State: AFuF++mLnnFFVe/tY7H/HqeaKJ9MU4vx9xvexM0iQdXU9t4tFSQHwPbC
	F59rRQXE1+XiUBHiEMBDX7dTTxlEK1MRzZr5N9ZpyHMxOSZ5YF1G1BDL6978h4wWayw=
X-Gm-Gg: AYBFou3u4XXl9kRhq5/YGZ12eXC7RWQN/xotd1Hs2cWQ/IY3wiOJKSMXIAUb7GapHWo
	xMVmPSHJGjyH6NYXZ++kJWO1SJrOQdBOBMXJPXWQ/hOa+Bv7m+mFYQLh/V8JJYPOP32HFoMrUWB
	Y1MKxtEzq5eVxM4hRQ7gxm/BSd64sb2Am63hWvGuJqzdtUed+rgpE5JAe4STG0brvD0/A0nVJXh
	r/drV+JY4qPs7oa56JfEovt/cwLst0zJKQc3IUWsWu9/TuNwMkXgKtVpw+JipAA4Gu6STx5OCp5
	iPnZ5ZgQAXhYpO/M+07Ua1izbd08s7oeH0kuhFN9XxDHODlvjHvIs0kMwHIK40RUHerCXeaatA5
	Qi4gLRcUahFHOxqs55snb5834gfL6vMIBGt6qo6kn+u+EHdg/Ko0Mpgjs3XQc2ArE2h600iS45m
	NFLKdSTxX6/YW2hgVBk/J3Vk7OGpwuayDW8lH8WwbH3mORSgFmZERnFiYV1wxiTikU+ppEMBGIX
	J9Ndj6rfKQSMHqIQNW6
X-Received: by 2002:a05:6000:250e:b0:486:f770:787 with SMTP id ffacd0b85a97d-48871769a22mr5154051f8f.31.1790258369629;
        Thu, 24 Sep 2026 06:59:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm15799213f8f.19.2026.09.24.06.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:59:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
References: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add Truly TFT320240-229-E panel
Message-Id: <179025836882.3234093.130291455472831294.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:59:28 +0200
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

On Thu, 17 Sep 2026 13:05:13 +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add Truly TFT320240-229-E panel support into panel-simple driver along with
> the required DT bindings documentation.
> 
> Alexander Sverdlin (1):
>   dt-bindings: display: simple: Add Truly TFT320240-229-E panel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Truly TFT320240-229-E panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/001a7baa873891b7558f6b91e36136bb8fc66fc3
[2/2] drm/panel: simple: Add support for Truly TFT320240-229-E panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/45b46cd3c477a2e5ed547450a15dc80f0593f418

-- 
Neil

