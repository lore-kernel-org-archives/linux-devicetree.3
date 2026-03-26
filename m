Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5253BED0F
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515766; cv=none; b=DNfQraEEPhy9WJ6xNkYfro8ykprxJsNvxN3Wkp25m4/JjuTWaIJgNJ8h+Bl7EFN6WGUSsLX79AujU/95U2bKCOWB9UCzMkmj8BJkZGQbQd1iOhwJT3FtDIY7pZlyMP6f5eXhOukVAs1DpwuSR3/Wx7KZ9Cfzb/lgmYgtwUns31k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515766; c=relaxed/simple;
	bh=kC4f8Hr+laqsiqLRNBlsElLNUuG/yDm7JSOtydy3Fyw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rnJTtqr7U6QbjFqnA+RAhqWLCd3TYc1Ewt0lVtjg5tOKbvkOPsXj+l4nRSB40+Dp198arZNdJbfNpnIhS/XCxg32vLUo3zGLCa9hOneZLH0wowWMlY++9ZPxVnle1+6R53QZ86Wf6z/4lyn4PmID5CNzjzqQCIQBaSpbkroLCV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nB79GShY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nB79GShY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fb14227cso8652925e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515763; x=1775120563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SO+1oE17hDIKR5mphj28NGtnxtIqXY3QHBAqdZU43PI=;
        b=nB79GShY8+M4ApzQ/gIYax9KrLl41Tman17FIQm/6ogi0mFEBGcNY8qsyB7zzvWivD
         sCGahLw05cPItJfjqoKhy/sKmVkKF9RRflqlfd8rUkNmhdgBylL8w9Qz9PILwmXCKH6p
         0gimI6wdama65I72t1Z6Sah0yWet3LL5xPQhvVaHQOt3B3FoaBmLDcle8zQ1zMictcik
         z0aQZtqfsJcB+DyuPfxLv740322QGkuKEhX2h9fqNC1i8wydS5l0uEGn6tg6o8iEOqPn
         EZIV3tNFoPGWGdQR3bG9SLOZ3WC3Qz7XVF3RgO0RqlI88hWLcqMPhnI3LuXUisA4btZ4
         p/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515763; x=1775120563;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SO+1oE17hDIKR5mphj28NGtnxtIqXY3QHBAqdZU43PI=;
        b=qldDs4XVaPRb3VJe+9M3rtvLx/OHpEGUNXvqCWE+Vrt0S7uKnQO7lTQh5JnS4WwFuC
         mw41NVM0ZiyS9JVKOx2wWW5iao4j9xkLnMPgDJgagfYjQDksfXWdpuGnBML/uEV3iV2Q
         K39yQPZgcWYpyMXYpH8ICtY+qoIsTL3G1W5Fa7WP6PSAjo3DF3Lg6nLXHEjLuV3mmVHc
         WAmmVb44Z4ZROXVyc//RXWYu6Wl8ZebvCnDgLh+cGlZStJk+c4CHYlxk0FHBevMXxw/k
         vVdpjIXO04sV8OadmFMnNpDrABmcuaZVP91pjBMs5ezG0+AnwU1fIKfBSM8ekrQbgtDb
         K/sg==
X-Gm-Message-State: AOJu0YwbsSuN+2UISj8DRybIJ/II16ElOKc1Flpd+GJH3ZEHkTph2fnv
	Fw5z22LGCM6uNbmXf7YhbA0efUFgOo0+Z3IdxsTtGfkFsoeenw5sxwobNxR8aB3QIhk=
X-Gm-Gg: ATEYQzx0vDfB3IIvW87Anu3S6BfBraWiLd+z8aYnpkCzAxzV1onfEq7re350li1Hu8j
	Qp/AQ3aBEACYT3Kuwm80eJ6QrTS4X+/rLCDAEScjGltsvHIVLIYFFDlqHLUh+ADmodlcLWrOIG6
	Luv9IgC1kgiGoG8pBxk1iEiSMCaJlXST86zm870madKr2/Sox2P3N/TkkQEOg/VP3MG/CTRfVFh
	DesJCYoHR22kF078vvynBAjFZX9rgtue0xsDGhA/RMk7Wwe/bRNUVZbMeijFOIA7giUw5yD5ZCV
	KxgoosqsUzcneXSRfle2f5UlT5McsJLN5aOaVSq4nF66HJNa5PbpI99HeP1HlBg8v633JcQ0G6h
	tLjIR1WKO8g/DdS0ojiOZ+Hi8jJNaV4AP2TZXtBeGJx2P1dy+8jN1CLWNaSfNFpfXcXCcuKgXeP
	Xu3r5WTpJ6ce+t2EbPU7Y1iwLN4dhbR9lhOHyurWbLQ4k4
X-Received: by 2002:a05:600c:4ecb:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-487160aa232mr97071565e9.31.1774515763192;
        Thu, 26 Mar 2026 02:02:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info, 
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 khilman@baylibre.com, krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com, 
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch, 
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de, 
 andrzej.hajda@intel.com, Mithil Bavishi <bavishimithil@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20260303203017.511-1-bavishimithil@gmail.com>
References: <20260303203017.511-1-bavishimithil@gmail.com>
Subject: Re: (subset) [PATCH v9 0/8] Initial support for Samsung Galaxy Tab
 2 series
Message-Id: <177451576215.103892.12129135091369769725.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:42 +0100
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

On Tue, 03 Mar 2026 15:30:09 -0500, Mithil Bavishi wrote:
> This series adds initial support for the Samsung Galaxy Tab 2
> (samsung-espresso7/10) series of devices. It adds support for 6 variants
> (P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
> based on 3G and WiFi, but since they use different panel, touch
> controllers, batteries, I decided to categorise them based on screen
> size as espresso7 and espresso10.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[4/8] dt-bindings: display: panel-lvds: Add compatibles for Samsung LTN070NL01 and LTN101AL03 panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d37690b5e02418a2365548300628ef3895a24ed2

-- 
Neil

