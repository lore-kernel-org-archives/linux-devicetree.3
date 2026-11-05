Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793879764;
	b=hTYqrDHKzj8iUvuWgQjIGbjVxpQ4sDroGIObC1vZsYAmfuTxXAASV26xSx95tjV3pnof
	 nIGvWGj/22kWFsKgvdmjcvpikzcvb+GpaT2kTqT+HzUAPOAfIu2ODSwuO+O70urzdWAGh
	 8sdu23uoFvoxi9tPJx2vHknQdTM24Kh+v/nJPwbPXVqZw4Sdj48qu3MAbAm/x1xPZT9OL
	 A3QGHM9SoeiPlg8k4QOAiP7rvXchKCptMuIdZeClWTZs3nINoW+8S+XiIfV8yPfhjJYbx
	 NSIOm/1VujL4h/gKNaxwNq271TzqwxDGRj2cmcsU9eIdLlRJFFRp1m29UgqjzsiHTPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
	b=o6wdb4wXFygGeSfUjt3HU17uGjjkW2FOEpxrLRm8cVeH060WgusZeAWp6rKC8pxKYDSx
	 SWTJ/HzcfoLfwTuiKHOWsKnI3wkvvpC/lJZ5QsZB9vFEDMpxwmvT657AbI6QK9P1GT8+X
	 aqJcjUUxQ7SpSl2dfdiwcjmzVT8AI5sxM73OeDaSzI0Z9Kpu67y2sYVIMoQcJk3aeJwg0
	 oqVH3tez7PiVhGdAPLD8cDe90v1kOy2dYAN5LVarsE6J6Wpj22mERzLCnF/pFoovQRQaV
	 eSBJ8sMj3UtR+7+leSuNDaTMoXC8FmYv+8KiO8uqMs4Ku5eqpax40o76vypB8LBeYsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ZWNvpwl8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663CE606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663CE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ZWNvpwl8
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1414722a91.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793879763; cv=none;
        d=google.com; s=arc-20260327;
        b=fq6MWQHMFkhNUAgSu/N2e8cV3IAzdiKlSVsKdq3xIp9dEeqD7iNvgCUtRKwCotAo/p
         CHUKOryqde8m1G0sj6EFKgn4CSklB2D3IPu76q/mVGBHBt2wZOl82L4Lmc2Q4ENWSTir
         lUg82CXZbxTT9nmrxDUCWOnQ1uOhztzyD31ZLRT+xNv4iGmZqR19zajlGakmlXOViV86
         NItAOG3yDY3LeeQwMiHVdLxNmchxtFjFljrzf9J9lIZK/TrDX+bSC55C/POCiTXrXAgc
         JQ0GcZUJQK3B9kTFTtV6Tk0hUrYnh4nU9tCsQXUK1syi0HyGQETolkGy7bn2SMQz+p8T
         SE5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        fh=8vWZxSDed6ZnN4lMvCIuRPd7pCv1hmIfW3w2u0oj9tM=;
        b=a+wPYTTVCpVKI052QWo+RM5LxWYvIbb1v9gKtZ2QDDfk3rhCO/EuHdU35MnNjVv2/n
         hKP9xefxZhHQVhs/MBLIY/ZudT1FUJuDufO075BhIVdILOq05Py5U05BaC9FLQMKaixT
         EXqZzxYjUqdmEq1AtByx+OJIt61/dLdUNbcB3q8exh0wLHbZ2P4LMnvEttatLhS+r097
         0PXDRgEWduXHyEVUXcDQ4jcGo56FeqD27AZj4SnwwDieoaewkFJyTvdqfnUpe88x/fw3
         nNux4iMq1skKEG/NGStk3fe1GhiWBGtXPcMYeQvvYtohO/wR0nHsdqRm8vBhMDvt6i+j
         LypQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793879763; x=1794484563; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        b=ZWNvpwl8JhILyTVSbTkRTaBTLVZ7JjOfhCR2xdaoogR5HQKIXSEFWL/ay0ob5rHOnQ
         bbAS2bOh2TibflBHMrpCUztkxHaOB8TTeHumBu57vauYSY6tFgzb/Q8bKhHb71Ys/FJR
         vd0s1LsZWJcl2zpxO62xN/r/Xww/z/D4zBh01Ob2rzHx4TnqmyGcaudlKg5DYmlHi8F4
         MB7dPe6YX9aN/f+0uZKhvZa1+fFYQKDS+oIx3ZZEWjrCn4tEgSU7EC8ncuA1rFBEcXD6
         zcrhHxCvR+tRxuUMQG6+basHl/gvPyoJgySuKOngpo0XRUP8rj1A1QbkU/y9U1BrLWpY
         RL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879763; x=1794484563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        b=m7qj0gY7hB5om3c00az0OM6xKaVM3xbcqPZdP/1ywqWqzqxF6LfPf+U7/z+8jligFu
         CBY91DzlQBtfWHQoukzrSfI5af/GI7YifGtJtfvzPNp7h1EUEoOEKF7SCfP4zx5Gv7LG
         kmHDrzD4v3rU22/NfEg1RicqIoJcn0Tx/oxUEQVgeFx1JiGV9ak5AbbUUWyutJ59krvv
         9oUVK1yDx1PM6D5sGNj2DRq6oqnJP8wJyZebTcQRZX+b2WNzqm9euTqZ/HfTTej0tspF
         iyYnYqhS2+9+FSij87UOpvSRYPgMbzCUEwnyhzuoED1NU1S0OHDFiPdOzm1MeOo7ejaf
         OUZA==
X-Forwarded-Encrypted: i=1; AKwUvByfCxi6ENXflv9urdX0m32gG/RBm4if3SgLywfScAWseblkludW1dGID2d7Cf/nVSQyPZBBwkVKTgfD@vger.kernel.org
X-Gm-Message-State: APuU4Z8PQBWp8EQKDZz/BMgylDICZ59LUql19URLitSuoBA5wjhntExH
	Mh5F/glLMyHH8dOL0ntG8d8K9udwdQpbXX+z+CZSzAdGzi9h1t3IBO0ZmKzOtZEOSdv9hyDrV+7
	Oe7w0KiTmxF/k1C/gPFklSlUE/7EuEeNZ+gj6FL/AkQ==
X-Gm-Gg: AYBFou3QEEBF6FYIBussdCX7vTUegLnIJPhoHaks+ijs9QCSM6Xgskd2Po3nl6hbGjF
	URRBGToc9klFqvNWwATGvrtLvwDR2HQlIpxABHTNRPJrsxzRerwv6J/ANyAbElggE46UQWyAWdQ
	Ejs91REHcRoNPbbzCEN+a8Eu5ANPe747+yBKbsXz4UJuA3X45bzKBBrEzXaSvCC+INUKYU3KfYG
	coDlUQOnLoW2k9akjrf44pNbV2VEcMkthG64rd+apmogij22LjZ7HOptsnTrPe38sOCtTYgmsf9
	GQJVZJ/Hw5WdkgbMoxqZOW5GdzKEJmI2WvyXTxl5GsHmLTJ3QSCca82tweheEfDRM3b/9y0zqRs
	ivJg7C3JIhzMgXKU8Q1eHRCqgGIOxrzpcc4F0
X-Received: by 2002:a17:90b:3b83:b0:3a8:5d1f:59ad with SMTP id
 98e67ed59e1d1-3ae89819ff5mr17083778a91.43.1793879762611; Thu, 05 Nov 2026
 03:56:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-12-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-12-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 11:55:50 +0000
X-Gm-Features: AclHuK8Jj7G6el-i8_82b6TJ0oa9AUPdN0owTnb0JTIANqcEHa0Ic8C9cFJ1sYI
Message-ID: <CAPj87rOAjcLZeKsKCMr84NoN89VzRDLV7Z8LySHK-DVyRW=u2Q@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/rockchip: dw_hdmi_qp: Do not mask error code
 in atomic_check()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> dw_hdmi_qp_rockchip_get_vop_format() calls
> drm_atomic_get_bridge_state(), which takes the bridge private object
> lock through the atomic state's ww acquire context and may therefore
> fail with -EDEADLK when the lock is contended.
>
> The DRM core expects -EDEADLK to be propagated up from atomic_check()
> so it can drop all held locks and restart the commit.  Replacing it
> with a hardcoded -EINVAL defeats this backoff mechanism, making
> otherwise valid commits fail spuriously when multiple threads perform
> atomic commits concurrently.
>
> Propagate the error code returned by the helper instead of
> unnecessarily overriding it.

Reviewed-by: Daniel Stone <daniels@collabora.com>
