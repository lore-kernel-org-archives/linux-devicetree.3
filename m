Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626838;
	b=hw3lsC5qjEl8EtdOvjokJRzrl4yn8Ne6uaTPAvfQ6mEStV7GLWHJ1p05OmJkDIJy7pJp
	 YFGXN4rp0JurGuKBr7+Yh6Othx2oI8FRyVMBPoZSjsuB8o0Ags9jg/A0ETXfQMPwV3zWV
	 UW3dn1OGwWP9qUz3Sm16cH02qgHmKkLXt9Yzig3dCYfNbsX7sU5oJHMyKOWwxbzTOekjQ
	 D7jSZpNYxzk6FQXXUmGuioqKiAqzBian8ZZsB+eHHg58DgRTLG0BZ2QYCUzKl0+O3tqYj
	 FL2Z3ogLUfvab+IvVH2uOJ25VK1WZII3IXRKefaLIX5ywb4FVHOrkLhTCQzZq4mNxtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=ijcQqp+PDwh0iYp+MD/r/nuQr1SB4jBOpcMmhui2GqI=;
	b=VHyHAsQbCQbx/ei4cz+gC3yIZuD7eS1lZQiOC8bf23uIFnH4UrRvQ0AbLwyfL3IDebZQ
	 xI71sYCzWr+JmQp5SmVDWRISEwbX55WFjMiLsM40RsX3VXIszO6A/a6WiDxmiYKmQp6dK
	 O0hWS+dkxOdj4XX8xZyE1I+IfekrYcuAhYGSxUUqUSl0yfIfveZzJtICahR6d7aiUFBes
	 iKCv3BCJl5ClS4IPSgr3ldzsIdKJJD0hQUxEn6mZ0lQmKUetP9XJXJTQOcYCd4JJ1iKhh
	 no1CYlVZobk9h5NJLmGVwk+llMAsCpJA8hCxopsowjSXLrTUpoj2qjpR9JnK9I5AlkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEAb9kZe;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5E606A334
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B5E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEAb9kZe
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso19164465e9.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626837; x=1794231637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijcQqp+PDwh0iYp+MD/r/nuQr1SB4jBOpcMmhui2GqI=;
        b=vEAb9kZeP/C25ewsu5ITdxJmy7OKRRRgBo0AfsRkKR3ew1HoA9CLk6qGeh9JOHEDCL
         ynS0Gfa2GApWXzOJBpNchtmgFhfX1TTsteJBw0I59TI0+NwJaJYCKJ8BozyQp1ENWhhI
         akP1wqHzylHwApLzUbDz5Jmu4toyUvj/DE9KDMHTcfpWDOHRegHrgzXaDNc7sAOq8Lse
         6w9KRpYaxYbgLVLc22PpmNa7pwt3m8/FsFcocIC6V6krmdqouUKR96jcJhbvhGysFU6B
         1pOmbgAZcN2FYBaU4PxYRMNzTwYVD4MMdsMz7B2R7isbcq0pvn43rTMn7501rJSQYNgT
         2jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626837; x=1794231637;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijcQqp+PDwh0iYp+MD/r/nuQr1SB4jBOpcMmhui2GqI=;
        b=dcKf6dEIEByR89cfiQelo+2DPrau+U23JhF18ttB2YsyDY2nhsCVh/U6jxT2UVRJ7R
         ziXp3/+cPeu0SteHGCwNxgHDteCD06OKdVpIyqGr63vkzQT9qfhnpYYSva0pMzhgpeqT
         pugFF99nfCiG8EW1ptpPfZdSfP68i+tTxl6tRBckNDwEOYjlJ45ZdYbogZ2DdpJYAWK1
         hQd0HzA5qRIymlDJiQZoCVKQVU/yD4RXTahlvC6cye9edhcRLfE/CEHHna1EbZ0ExRXs
         zl1KbY4O8HiFkVdwog8/0YibmRP7+Z7EWNa89aN1XOdBf/Y3xjLFUwmkJAsMssIL/QIC
         A1cw==
X-Forwarded-Encrypted: i=1; AKwUvBw66d1veNMJjju8uZxFvPxujzNPV9dnaI6hmNy7e2JoQpa9wwzFrzVgn7XmAUO9BPMyCUzF6yDa3agQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKaNst58fCFEj0KTDqOOAaRwSNVpZZWwIEX1MVpA47y6pvzD8HR
	XLTwOUPJQfjYN2qfG7xd3aJARt90cSta8CSMlG3g/022Rh254OsyDnq1bwHftu/KQzA=
X-Gm-Gg: AYBFou3YcpTBQidyigTuV4K56UtFOU8usIOcKBbH3hNMXy8/rGKOpvy7SS1d1QpWDjg
	Cs4r59l9xFyFIlrRiItgKR/rTKM+hY2pBJX1pljUCJPUOplQJzqNw6DCAXKgdb4mG2jUjSG8CEz
	rog5UrBh65xZLf5ed0Yorw42rL3H8C3i0Lhytds1WP4zABVZDqI5YV0yHCIs0sg2eFCUyiXGfCD
	cu4yAHwHMIvX/d/mVQDQtZcnT19wrM0G12/hHh1g0S6o6DnjGmlier7fbv3D6BB5xkLxmHYQYFr
	XkLORyTOiX5oxLZEB7UHD2VXDf6dYmbl/mDHq/ZDX8odTvvqbnelRPhixArti7J1MJIvjz2gEpM
	UgEMUp01KYbzAXVgxC0aOynE8hSM8XiXGByx60Wn0/lpSURIl5Txu46xWFlw1ear8iHYPbP1oXw
	Xd6Fyn/E3DI/3mGOFRbcUcAPWtJ25zh2ljbXP7Zpso2/+z/mbL48BdhVNJEX7tXBAHt+WFKuM2y
	DSMD/66XG2Ig64P5tQHZlcfL+8sJxc+qekgx3TZ+JXk6iQDFa8pLYqtdg+j8zaAmNqebAJ57CdZ
	ykQJvLG91J1x2B6ISMrmcTZBNRjXucjAloDW9feg9AduG2WTIw==
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ac1899353bmr229794415e9.31.1793626836593;
        Mon, 02 Nov 2026 05:40:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 Felix Boucher <felix.boucher@savoirfairelinux.com>, 
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
In-Reply-To: <20261006183455.2350966-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20261006183455.2350966-1-marc-olivier.champagne@savoirfairelinux.com>
Subject: Re: [PATCH 0/2] drm/panel: ilitek-ili9881c: add support for DCLTek
 DT300249
Message-Id: <179362683550.3310106.10835901197698489630.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:35 +0100
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

On Tue, 06 Oct 2026 14:34:53 -0400, Marc-Olivier Champagne wrote:
> This series adds support for the DCLTek DT300249 5.5-inch MIPI DSI
> panel based on the Ilitek ILI9881C controller.
> 
> It documents the new compatible string in the binding and adds the
> panel descriptor with its initialization sequence to the driver.
> 
> Marc-Olivier Champagne (2):
>   dt-bindings: display: panel: add compatible for DCLTek 300249 5.5in
>     panel
>   drm/panel: ilitek-ili9881c: Add DCLTek 300249 5.5in display
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: add compatible for DCLTek 300249 5.5in panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/342542e4ccabf8e768293eeab4c4b43337708a54
[2/2] drm/panel: ilitek-ili9881c: Add DCLTek 300249 5.5in display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/164ec23bad8e3885b7ff8b881190d162feaa32dd

-- 
Neil

