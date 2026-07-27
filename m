Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6703DB65A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139644; cv=none; b=bCnVC4bPv421oBGwIQOHN+AFF0364Hcl9IQr2cMIoBN71aPUypaRunObYO5dYakPpGS/QZZWS1o6poK0n+oTJgVskDUScptBOJiu32k7fM+ikAaocG9C/EhNy4b8KyJn5uu00uIm8eOpLlCYtAsNCrZCe1KVY8b8BbSWD08kM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139644; c=relaxed/simple;
	bh=2QRzrhfjSkuzKZilx4Tc/C1ZLdFWF+3cM5d6PpRYEGs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QEtR6fqPb1RFEcUUj0+Wtb5GdesorZlOw9ZaJo4cn2TRA4/0nKomPsmLhXPmRQQxW4FDTQqE+OcYEVPXLLHGQcBCayMIue16tHAUdkPQ5KiEgbYJbQhjxamSL152/NbkwpmzcQGYxs3k8Vx0EcoWk2/RBEMcv2U5J0Td5ltW+vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekjaJCE8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekjaJCE8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso13999395e9.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139641; x=1785744441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJtjZe0isdR+1ITQ9mcp7Pq5OB4owQNXa7kCdGPeWeU=;
        b=ekjaJCE8PGUbwJEjCsxlMU5gwzFnqpYJ+p2cpAbkYIkNNVOmXIOCmIHrRfxOMGKedL
         4CDyNliIcZ1g/1ynk+pV1zzS7iDKVKsMGB/UjX+oFaaeo6UPnSXCaRyJ3A5ddM5WIcxB
         IwcDgAg4x/5PL0XKLJAGID3JzQVpwRivSEohhG8/W/R7b8JYcMUvJKyjhZfbjX5We2Y1
         +Np9wLORkj60hiO/VBhtVnsTldtncm8y4Zc8MtF9tH7MmrGtie0WrgPo4goYAYcOt4y6
         V40vpyOIl7ihd4Aw8b5brVBefCSwwzsiXiQYvI2yfho+WMS56hGkWX4KaLTlWA7koaQJ
         npLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139641; x=1785744441;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJtjZe0isdR+1ITQ9mcp7Pq5OB4owQNXa7kCdGPeWeU=;
        b=FqoAmoKy75dgUyv0QqH454N3at/tswhDRZbfkUv/rexasDc2/4PLbzQmGxoP6vFudh
         v66csuqOBlUOg+I/s2H5DoBrn3ELjIMkZWa4Um/w+49hybZxfFXv1PaY3iXX2B/eCkb6
         MK1x7EB8WEDS3vqMf01P9+NC34D4/X5bonyuEY0akUy6OSqbHZzgMaOabNN2Z30lgRcK
         jjACZOW1Nhq6Fp5HaQwrYHY6YRoD1UItZV/iGQ7SF7QLKpdp0LrFtQwoLWdQI0gFyKeX
         7a0CFQJhZTsJZKMQ3qYmRdRxK2T76PyezpyGVpNlvUTP0dY4qUlnfj6lzftJiKeQqRkC
         3pFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSWADUpbPh5RWZDy+Trk3ZQo9lI2bsaWcTzFanWYLFYbiQQ56jTZebFM4MMKWlBWrAdoUuYbWwAgU0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0IbUmcqvyqbIU09qLeqgxfBXyjjMK9kQupSJ+OLHw+SIScc3t
	8FqeQfV/n9NuWfZ8LV8G1qU9EuXTOk+RkbDDoLTO3Jir21Ytt6dXywruOV5Z89HNZ6U=
X-Gm-Gg: AR+sD12hbnntuY2lZZJd1QESe8dVfV/sofjuFeB224Zs2xEuDIiPk2N514i58XVxmrs
	OZpKbmnM3f4hS+AkLx3w9SmRZ54yhyuJ0eFFkyUvFB2Bck5BwlGIKvFAm1v/IjFBs1zi9StVIq5
	/tDeySP7jY6Bv9QYQMm3vmfH3YfIHrOY4dA40yxRGSoJcRqms/alvULFV3WdPScoMCN49J7+ijh
	hCufyVZECmN36U0br6M+2WoM0Wb+EFIcg2+MD7WKETyr0PJF2hyiYEtxkz3jmIvxfL26VCmfC1c
	FhePvtnGBXZ0K0r49j7Ia8o7YEkh9XSXoW5neh1hJdZHIW5cOaGs+Qn4UOph/TTfD5ywFJNjEiY
	WgfvWISQvtLiYHvj5LsDchlZhmSYwZ7e0aXKqD4NW+Fiisugqd0olDRG8FTULxUa11ljN2nqxyx
	oXrVdCBL6IX9NcvMhv8DYZwbw=
X-Received: by 2002:a05:600c:3b07:b0:495:6840:9728 with SMTP id 5b1f17b1804b1-496b6aff6admr91690975e9.38.1785139640616;
        Mon, 27 Jul 2026 01:07:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43834608f8f.10.2026.07.27.01.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:07:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260723-b4-st7703-pocketds-lower-v1-0-e3db246589f4@gmail.com>
References: <20260723-b4-st7703-pocketds-lower-v1-0-e3db246589f4@gmail.com>
Subject: Re: [PATCH 0/2] drm/panel: st7703: add AYANEO Pocket DS lower
 panel
Message-Id: <178513963988.2733676.14601809562787945661.b4-ty@b4>
Date: Mon, 27 Jul 2026 10:07:19 +0200
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

On Thu, 23 Jul 2026 18:26:27 +0700, Alexandre Hamamdjian wrote:
> The AYANEO Pocket DS is a dual-screen Qualcomm QCS8550 handheld. Its
> lower (secondary) 5.0" 1024x768 4:3 IPS panel is driven by a Sitronix
> ST7703 DDIC: every opcode in the vendor init sequence maps 1:1 to the
> ST7703_CMD_* command set (SETEXTC 0xB9 with the canonical F1 12 key,
> and SETMIPI/SETRGBIF/SETPOWER/SETGIP payloads near-identical to the
> already-supported Powkiddy RGB10MAX3), so add it to the existing
> sitronix-st7703 driver and its binding rather than a standalone driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: Add AYANEO Pocket DS lower panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9836f0236b4325b142c1f29904d09395ac4b87a5
[2/2] drm/panel: st7703: Add AYANEO Pocket DS Lower Panel Support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4c0fe6422f3a06d565c6d891587db5d3a1b20bca

-- 
Neil

