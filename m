Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B263DE451
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139643; cv=none; b=p9v8FLHd0gpWEtxtdK1AEhQuzLKZrArcBNrHlEje3nKULDYM3M5kF9HTX8jufNDeEdrJijJgMmU/zpIk6Uj9tS4eziJNZiMt8CAkFERTBe2fnl1EbuZ2U8U7dozpRrv7hReYiMa+GE9+F6uNRI0mFBUFDgV5f+kw0qy4TKSxGmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139643; c=relaxed/simple;
	bh=lX2RRVJ/jQmUFhUArv2mv/m+v+wXhldzy9rtTzJRol4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X7/I5EjXCUezRLXwOMuzK966oS8Ry5vGSOQfVMSbLJHHF8Rj83QoLOyx5JAVp67Y18/6SHbW3RB7Tg/7mEQUEyk5dYQRvtmA0Rngjaj8Ij2F6EkV1K6GugclGFj+wJa9F4AJRSpOPs1Twwvt4LaTNqvIidFd5XPPKKxC430tyGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evxAbuVl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evxAbuVl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1056393f8f.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139640; x=1785744440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dIhxdR5PRoZjvp0DPMU2bowLYBTYHFYuXnT3m8/hFB4=;
        b=evxAbuVlwxBqeiffFvYjwP8putioXmBaOxkeCuD9CPw0nKJMUPBV1/V5qMtZjBh9Aw
         ICoOydvY1iAEJSc5HQLlMJP7OX3SI2EbW9E0CVUVYkPi+ci7923u6WCyYNkRMCMY6rQB
         JbTqpRAzf8RBh8OqUmlIpSLwRbes70VXuBeuaC70LwY9IdXkle/70i4vBaiRqsBFvlwg
         bz3lc1wnJeCL6A1OVPohvL82eNHAqjXTkYuqxUND2jjkJyEp/ON9SOu3ipHRoLxEkc0b
         v69zLVStB86YmygDe7MS3vWlphRNZEi9C/XJH9AhECwO5IopXPQbIzbHoiTaqvato65T
         yiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139640; x=1785744440;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dIhxdR5PRoZjvp0DPMU2bowLYBTYHFYuXnT3m8/hFB4=;
        b=Yrc+gGXuYtRJPriozrCaQcufMNE/dO80bWDfd9kblNb4jF+rMLE7S6PYyNmHZbBDUi
         Z7ANmuk1d+rHYaAI1k4xIok80reRjatOpXoGkovXvCs37MfCGER02pERmUahALCtG8Ql
         PWUZ/4+e2UPMSfNGkqbz/d5BYXC3sT/gaqMbmF/Vuy+KG0rzY71TS7IQXboUOBpiclS9
         N8MMYdz4Oua5xa/pjXs7sAqGLFX9uPaDlH25viPc/i2jsj2Mmn1+cp3B2JRrw/TXJj2E
         QDjnLkGZg2msPF6zA/cA76vA4be+7AyoOvxv5l3Bqsv3TUNTGhqzo/gWoa82yL7yGJrJ
         nk7A==
X-Forwarded-Encrypted: i=1; AHgh+RoLtP+9mhqcRNlyOHCjSK1A0aTyaVSk+SZPaGnzZ8o7zFe085VpjZNMGRkbgdN1HLYJM5CZN3OrWng7@vger.kernel.org
X-Gm-Message-State: AOJu0YzMy90UZCFNAz+Ns3wiFVUvYoMMWjoAHQqXFA3tKFsiZss4cz8J
	J+AYszIrBmuEECk3FrgbGU8iCHvct2EmbjWU/p3d2ip9j2OG8NJzyTeINfgKS+w5EZc=
X-Gm-Gg: AR+sD10hUIlbMZ3tzhFdn6WHXN1UqWgd5urUwVkyPAKJ1wK00qQGEg2cFMDbTed8/FB
	RFDWKTovA49IiNbKAXjFLQ860G6hWGbDDTEp9uzIAFLoOIpYugheXEQwrjGnexvfqtN5EbPAAs8
	nff+hhSFiet18O8yJTcu6/FoVAMvkm850vcRX/oL1LXhqwGfa7x3TgXUyasbhG4qY8hYJEpwO5X
	j7ubTgU87dbXo0t2cG0H3i5uJ1GfCqPd5DGvtZjgXK3YmdDHkUHnlYMt/E8iKq6pT3tqrxIj3Mf
	M3AIdjTn4WOWU/FPq2Mc4wzJlRJ9JpGMndsWuOKlwvLFtKSRVExSBWpZVq9US3nJxlrkXe3XUYk
	UhwrJQo5hxWcGjkuS6FRM0FEmD3QzWxSAyKeCU1ofORmZSpGT9vA4U6pURt03nTkof/mQbocLV4
	8hvBSGjaKe9C505xBqJANefIM=
X-Received: by 2002:a05:6000:2687:b0:47f:6fbd:89eb with SMTP id ffacd0b85a97d-47f9feca54dmr9699598f8f.57.1785139639778;
        Mon, 27 Jul 2026 01:07:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43834608f8f.10.2026.07.27.01.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:07:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jagan Teki <jagan@edgeble.ai>, Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 Felix Boucher <felix.boucher@savoirfairelinux.com>, 
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
In-Reply-To: <20260722173840.3576444-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20260722173840.3576444-1-marc-olivier.champagne@savoirfairelinux.com>
Subject: Re: [PATCH v2 0/4] drm/panel: jd9365da: add support for DCLTek
 DT300250
Message-Id: <178513963895.2733676.7105275296729821815.b4-ty@b4>
Date: Mon, 27 Jul 2026 10:07:18 +0200
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

On Wed, 22 Jul 2026 13:38:36 -0400, Marc-Olivier Champagne wrote:
> This series adds support for the DCLTek DT300250 9.35-inch MIPI DSI
> panel based on the Jadard JD9365DA-H3 controller.
> 
> The series includes a prerequisite needed by this panel support:
> enable LPM mode for the jd9365da path.
> It then adds the dcltek vendor prefix, documents
> the new compatible string in the binding, and finally adds the panel
> descriptor and initialization sequence to the driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm: panel: jd9365da: Enable LPM mode
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b1d7f31f7d55dc2e8a334d20d84a559f67ce7825
[2/4] dt-bindings: vendor-prefixes: Add DCLTEK
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2599b6a5f7f0b2f034531d01e06eedf5b30d6748
[3/4] dt-bindings: display: panel: add compatible for DCLTek 300250 9.35in panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ebd2effb165c2e0ba78dd233bc9eb5f2d6e8e425
[4/4] drm: panel: jd9365da: Add DCLTek 300250 9.35in display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ea3d663c10da692172ab73f68046a54d4b5006ff

-- 
Neil

