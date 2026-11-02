Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626848;
	b=rR6swOK2ADhaHqiaFFXfsnd9dE1XboUElUUDnxcnm0/vhKnkYbdMn9aNfSR3419YrSOq
	 Nmk1lH93nLI0xcFDbnZqHkkncwyEbq7Ul1Im2nuOg8L6yftCDYHECqstkaO1ljdjCFnwE
	 3+1mtUtYa0LYO4O82EooEwDVcPQqMfV9tlppU584sN66uh8Nj6C3gLicXpY/6L7TsxMKC
	 nS6bzEW3dv7Hb2wEXOZ6Dk/QL+DU2Eg6fIz9HH+VjZ3LR1Eh+1TdgObzD8vv+zOze1nGP
	 EepYviepoTxmAcgn3t9eOUUyf/DDse70kp//TQ8MBLJsSdlFofcKkVvoqepBECeoJRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
	b=0F0xUtbdq6ShuXmv/m2WJLN6bfSse2pybtsN7B/olEA2s+VIh2Sg74Wgap8MCWk41jHN
	 wOfxqJhy/ZXZInREYI6nU8NYU1Nxxamo6fAn9XQI5Op+PEva2oO+KsCAp+Q+VKrVnSdJ1
	 IoujCWUJVgQnsAnSiyKrPmh4BS2zlTj2QYZFjBJTN2X0ryLKgW2+LdKwP8Qg0UEEIug3p
	 kV0U8+X1QpPFTSUubAHeUtYoKw6QlxgJJuFOJr07OMfpLj94a6tLHPvOJ4dAnXu3irtaq
	 Zk0T/BMx4dh6sy7dHBmqnGz8QOVj/h1eInUGPQeQNTVcVhwqD8U8DxMUFYmZjximR1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwnwl3VI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB2660A5BE6
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB2660A5BE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwnwl3VI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34649795e9.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626847; x=1794231647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
        b=wwnwl3VIHIKqYxybAo0PJUGsxUMaTIWRjrnNuKQhh6l9P0tcxnxCepwxgMDxUFKLSg
         ElcWQYzbUF9cGkO3FueRCNxjPNm+Ww74W6gm5lyhssrCUGZQc+jl+o1bgnxb7zTSICI+
         7HlPF76yiJHEHAq2lTrsQqDKrdRH2wDMPMb/JHctjqJ13BN4fnOTEsCKWA3k5b3H9vi1
         3dXoHWOAZe6K6lVFcTLRq6KmwuZXsdWxpso+cXiJwscER7W7ALgGF2StX6SSfFKLml68
         Sxu2WsRdAABj78UD1yVFJb+T85G3sHlL873+ejNza3cwirNqNwM6FvfeUWkZUdj1RFzl
         pM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626847; x=1794231647;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
        b=X/QPkBkdYc+oqW/6OuK6J/0evW0AzbBUnEk6sWIVHnbFRtmb62jIRb6YJ6ibqaeN6X
         +Yzm7lgM3sKW0qYmLmxL4HsHoxoownuFpuKstDJf48J+w1RiTvVYRR3Wq+OXu5rSbAVM
         TdZOLwj3j7wcUQQqz4LdhLgA5HrzT3u77ACUsvg93Irz76Vlmtv48TIeDFPjozw5wvaK
         QQUhatGlccdjFNAqd8xaR+jCZ0S4+JO0ZkIY0xn2I7ifn06qrk/DAqk/EU8S6DpK/w6g
         3zE7CijIo7ZsDcS8/QeNL/DO+j3j2cFIDb8dYbBlV0X3Pcb2CLqwvb4v13qLdYg0iQMr
         sL1A==
X-Forwarded-Encrypted: i=1; AKwUvBxzHDyswAViEv/2ENrkBpE7eLFFkmPy4F1R56c0dAQ5kg1XPRW4NhJHpMvHXjqCPNzE3ZJ3VfMDekLs@vger.kernel.org
X-Gm-Message-State: AFq9FYKpOFgps289P3GUh6Bt2fOoWB1AGgJsLhSKatcrum1rwExlI0fg
	bF1uNsWoM+rRAJ9sYlfFZBkVqkXRmg9X0GNMDWcsy9kSpekchAs0BO9UxEKW/T4YOPI=
X-Gm-Gg: AYBFou1RUsS0+kXefZ0gnyUcEiYLv+RzLoc2oAJVGn+KBQyHC0KJtHQh9JRNLJBO7H2
	GpAl07UUKxMFjvRK/2+73nyX+MofH5PocTY8a16VRIFf+VGHoqmHTzpMfWjDj9MU1bGK1qVGsG+
	DF5YgIswrMv3K/kw3uEGB1ukDgitYLdJTZ9MWHWtOgqQ1zLXr17DiGuUikyUgVsqc4DyrOYVsEj
	QMCUo2YZd3tSBe0JFMgLjnXKP/ewEm9d4mUIdAU0Zph2HMLK39eYZZEz7/ZUPcWg78/Z1IoncXJ
	uIchXHF06/459r7VcYnHFhwO8IvZ6BOng/QFEa454aAk4Wm8EpYdjRoEfm64ociRQUdkxH+9ne1
	W5FSOMQXdngKOPbv+PBeTnfaYXKnlUrbSF6KFLZ7SskGKSAqivjR/FRUOOcRzA8VYanJRe8H/Bj
	f5Y3vm2r7YhJr7pg2NirrxMchN6RupQoj+LFXiWWqgy4Acynl0Psa6CkByD8NMW6wvS/VBz/CHL
	crTceb1wshTmkutq2U9UFsKQd1TDLx7ozNdS5IxlEWK+GSEOy+L/fxC/vMHELtvlOZCgHERPKIV
	yxL6PRA64BswvqS8VRNe4abzo5lNkw2m39g6//2GlJfytZJdO5XxKv/BaOp5ADsPY8tOsKk=
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ac17471285mr229234705e9.7.1793626846731;
        Mon, 02 Nov 2026 05:40:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v4 0/7] drm/tegra: Add support for
 Tegra20/Tegra30 8-bit CPU interface
Message-Id: <179362684510.3310106.12424997423646231725.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:45 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Thu, 22 Oct 2026 16:22:52 +0300, Svyatoslav Ryhel wrote:
> The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
> that closely resembles the MIPI DBI Type B protocol and is referred to as
> '8-bit CPU'.
> 
> Add DC parametrization options needed for fine tuning by bridges.
> Add 8-bit CPU interface in form of a bridge linking to RGB port.
> Add 2 DBI Type B panels used in LG Optimus 2X which work with
> the 8-bit CPU interface.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46011a636fd729c99781533e265297748b5a0b0f
[2/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9fe804e2a3001fd024c0809678d09c5e0ed359ee
[3/7] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d87ca1becbb095b6204cf657508c91e5e995d9b5

-- 
Neil

