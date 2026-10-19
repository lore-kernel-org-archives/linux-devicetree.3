Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74D1E5714
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392956; cv=none; b=tyMeyjxSYXbuGD9A/fPvsWsqdbT7npecWC3q/3CzRktc79iYmLmZluMx89tRfvF6T7gd+evgLhFyJVZxEqdBeW2Y3smyfFjBwOf3/CUvyGr3mxbTrJC6eeFLaWY1pOaMaKjRA9hV6vMKpMmXABFHpwG6VxNWVjN3CMNUEnVl5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392956; c=relaxed/simple;
	bh=FZ2zwSutLzynNR3SPyrjH8fZEghMurXsmINrjU6TAss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjslLelkrX2dQoFf2tthtwT/ngJuANou+JDOa7WLR/VyH5stbLy3tJTf5btkm8qVWekwMXdXPNB9YF23/YDcuZvQON+6OxuHsLXSySP4l+Ptbo+xN7MYawu8ycMx8rvMY094UxIpk5C74BX92Wr1Qqd22tdyoF/4tVy8pNStv1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HvmUoZmC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HvmUoZmC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so15644215e9.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792392953; x=1792997753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZ2zwSutLzynNR3SPyrjH8fZEghMurXsmINrjU6TAss=;
        b=HvmUoZmC/U0CJEIPObIymq3BkW7W0A3RRd/zNZIQb7tljSdQIec4Kpn//g54HtOswU
         e8XbY107FOLbx/dW9vlHiIirX/ueoblc20vytECa0aWzfHqlyjjnQUnN86rEMzem3foJ
         FkVPqZv8mCrLFfIPypOyib72C/vDz9KoI4A7OTTEEOrPdmDL9rFcSlEXaTG9g5hw/NjU
         7iAQC42fbAVYs+n9/BPiDjm0oX/H9Jqdahf3YeEeLqLoKT8GBgFk/z2kiWu1u4Gxg3lV
         sGr2pRuTfnr6x/qZQc8Jy7lHf+OmmSurZSdg7qPlmPymHw7DDAxsg2UfscQfVYdZ2Zzw
         G2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392953; x=1792997753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZ2zwSutLzynNR3SPyrjH8fZEghMurXsmINrjU6TAss=;
        b=dnoAhgh2a3HmPZYoNOOLAo7ORdbfwbDZz9iDJJikHZAQI6pzQrdarIFmhJe5W4vPye
         udXb8kFPbD6pP047XY+z9T6jmd8wBBPot4UgYvXGdVDaFBc1rYaDmhls8agI7dg5vmyG
         Vb8EsHuulFBu8VF2Y8CNPhejkXkQuDSV4978W4s7FIcYOQLHLiazmg+9WEo5celcrO+4
         2HlDMh9C75Q1U8hJEXAG5lEcJL/WsxaB1iEid7BJhY+uShdiaM8PV94DMYWcA7+eNFAD
         n/pWkuDOayiZaKt6JBRD4/yUHQs2tdbWX0Wc/SSRBGDXTAZBdrqUXs9sdjXPQ3OZeB0+
         DCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgKiPahky14VHFYHnPoKBpSZNdNvu6dM+VPJRkj8IU48asruUwZlLr0+SDxlz77T7m5Hi+65Hn8Te7@vger.kernel.org
X-Gm-Message-State: AFq9FYIalZK1Gxk/aEtHL1GpHHbgGw2WX5AbPGsFV27azpzjW8GJPTB/
	Q0CHQ/qlu8tfvNGzSJAovbxBZVruHYuT4Jl//TwvqB7a/uJxPqMFu6AI4NJa14mKxCA=
X-Gm-Gg: AYBFou2WmyncF1+7g99g1T3W/KHcfz0UtnW54HLkKYdZvfO2sCkbLjFxCnJk65A4XBO
	T/G0xOQewtnqdmoBpdStZxGYMVgOFqAzknLBb6SPqn5TuOty9G2FM9qDe/2KNyAnEvXCqJ8hO3K
	8VzM2D0qLuQxBzfvwtvcsVCSXEAmPPyPUJ7YLrBlo3gtOlDj92DVuq9HAC0E8ZCf1ncBk54nuJl
	hv3a/1lZyU96JN8C/+O9xycOq7SJZrUrr1O4yCICqAuj59UrOD7ftYY6+87yGshd9ts/K5UEnQS
	zwsiFHWh+bGQmSuDUOUvcTakVcS9/eU2L7mcbFwvTNef5d4YHc7VryG3SbAvbU4RXAZL+yGwuEL
	nCyPcV6z61LrYg74jN+Nasux+wPSXHQ6Tv5BNAqOHeEo2gR6WNvczwUYrBIsiy+miA5t3vJ3rO8
	wYOsiXroB2rTB3u4zA1Cw7TwrZ+PH/0DPayUGYFQs+PXoDCiDGaOuyYBDQiPqSC/4TJ01AXMY6h
	1gtdrUmzV+Cnes664Hm3UNjxaGMGXmAbZToF/NoOuZnUoUcEbswFm9Sz4azqiY=
X-Received: by 2002:a05:600c:8519:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1d760d830mr178658705e9.23.1792392952999;
        Sun, 18 Oct 2026 23:55:52 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1ce3302b5sm172293625e9.4.2026.10.18.23.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:55:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:55:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tianshi12127 <tianshi12127@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	dri-devel@lists.freedesktop.org, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/panel: add driver for Smartisan TD4362
Message-ID: <atW-ch6H9WggWrAu@monoceros>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
 <20261017103250.800109-4-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ytu2emq3ghdudri"
Content-Disposition: inline
In-Reply-To: <20261017103250.800109-4-tianshi12127@gmail.com>


--5ytu2emq3ghdudri
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/3] drm/panel: add driver for Smartisan TD4362
MIME-Version: 1.0

Hello,

On Sat, Oct 17, 2026 at 06:32:50PM +0800, tianshi12127 wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>, that pulls in a lot of
unneeded dependencies. <drm/drm_mipi_dsi.h> already makes sure that
of_device_id is available, so you can just drop
<linux/mod_devicetable.h>.

Best regards
Uwe

--5ytu2emq3ghdudri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVvvMACgkQj4D7WH0S
/k54LQf/Uhjypbnj1ODuf9SNZ0G+AxzxxiJPag9wwZDs7qe4jie8D09Q66x3TN57
yYyjySPnatXWtfX97FW4mzln9pMGWaHlUsd/S+FZKgDWm6Kl5UcwiNdd6Pq/Y7Ko
NMMKlEBaSDQq4IIiINzrblck045eCWfMz5lFU31Ub62gt8odV6wXiKJJdY8MAyZ0
gxiTiFrxi9umgHdrlZy37R3PVW06R1CYFyBR5Ou/cIS+6CQBKEXCGwOaEP2h8NG7
0dAOrN2EJcGqcImgdrzJEFn2qSo1GrOLN0euisKqSA2eU2uoX/pG990ABYWO6nnj
5dX+KkkM8ZyxJbseo8q/CT0upMYVaw==
=EMs/
-----END PGP SIGNATURE-----

--5ytu2emq3ghdudri--
