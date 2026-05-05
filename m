Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47243335064
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975519; cv=none; b=MznFSrBbjMUHIJi1NtiistGm1bPY9lQ/Bsa2YSjhrhVX8ef4TEDHbQuRZ4wBlXHw6Gv0I4WXyvyNm/p56ZXYS/RUOB2ucbikMY/rX2oRp6ce36i8wzt2fJs4jYY2Xmg4SaszBzK520cMp4VBeQj3mpqA0mooSgfkItHPYwf9eC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975519; c=relaxed/simple;
	bh=ke6FPng7djht4k6xKEHBruECw8vQxUk+hqB7T4ify7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N3CqmUseEnX31I6HqODvnz8AumkBZsmTkdVi1tfqCPhhGmVwLqNhwi6MD1AZGXPk1hI+6b9bYKE/bh9zApWKpzzSRAG+Il37vzo+tLWuxmVH2d7doZVHQK6y/rC2SbujEu5/UBQN4AO2hd9XWEqcsYkis8cchqaU46WIC+kkBdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfH9USuw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfH9USuw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso26955125e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777975517; x=1778580317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od3JvJ9Kbs1kRGL91hyMQAVh/qreeoBuXtzdq1EUEJk=;
        b=gfH9USuw3HqwiCJ6ddssklAsNnnWdq3/fMhFmPqy3dA+uP16j3r62eKBl32Tkdp0Vh
         dtst6Sdc1h9wL7pyeWwDmD3PQ4TOSyiRuDIw09SVPGDcJEQjaP1Ai051MeX1uCeR1yH5
         4jq0AT8NWYhcGoC/H5Mme6RigFNTTGctwSfoal1jRKnk84Jqtr8yRvhEfUAiP5ZRWJv+
         JVDUIg+sZx7X2NtzT0RJJIypiPJ02ZTixwQU6DYbk1HIMZUcOhpsMoGjXxByKyAu7zzg
         C8cZm3eVU4k2rIZxDRsqb30YvVRY5mjeUz2SBBdsQT4yNsItkiCkBbiEyzRLQl8XzZAU
         CR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975517; x=1778580317;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Od3JvJ9Kbs1kRGL91hyMQAVh/qreeoBuXtzdq1EUEJk=;
        b=NZA8OJwu/M/zW8Vb2Jiefob2aVhL0M1bMZ02ma/mp4wFwDiLu7am0CJ0Xxo52BhyaH
         VaUrNyw2xHGxGuKdFdx6qZ6wxM1jMK98okM7SD9rN4MX2SdSwuIjGBsTbItVLtW6m9HH
         18lxhQtMhZaMWQ2QLcZeCE9/1VHglFdOfc0G0F9yiy9QKEE1ro5j/JcTYkjfVzNxDLmF
         6xkyBBfujROZeVliNLLUbYUhBsbZ8MbIpMmAtBNEnrw2oN/6pWdzpQDQGmMVS/cV6fOO
         M1MLDLMTLZHWpKkBZ56x6TccaEvU4jOX8R/LtL6wuWWUuU/DMwFXek4s+/L00+zcfvwn
         Fd1g==
X-Forwarded-Encrypted: i=1; AFNElJ+Z/fSRxEhFkolglK8ISaOsFzkTc+vOx2QMGjQX44S7Z9mzsgoDucRSB5cUc0uJ9cqdVhO4v8B8revC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6wX2roGQ/c+zIqo4OudFxs2kXGI1K4TOi4bB8eMRHXY1+1Q5V
	NjsK96uEQ3xncR0GBEQaynmjVz3i3JkVHCn5+xlfn0a6ARL3SXj3MA7oQTyBn8fLxkk=
X-Gm-Gg: AeBDievpboKkvaR8cmUqt6wPXeKEhayxj8KBi0odekKwrANzBPXUIN+RKa0KzOQvs5c
	buJbWzGv+799tzdf40KIKcUFDnVdw9k3WXvy2nnYoc3SiwcWDqIJRo3tCc6DoeYlYje8acTRNcV
	1eV8islesiMa16jPcybU/vpU2P1CxCZTHxnJxVg8e8SgvgY49+d1tI3BAbZ5ZGHSKUTosnWHKOd
	S1DVlIGsIX/ap3yditS+bZtNgRmd/GUaiYMS7r4Xgwz7nneFvY+owaS+zrhDCuDPmqo4G180W71
	ubvyPJImnevSVNkMjbWACWQ34Xa8bLSzIeWb5gPniBXY11o4dOFEfqKAIBiplhtgz/9tobkG9Cg
	G9hmsh29h7BKwR+mh97Rn4lCqU329ayRc997H82h764qgeL3asGf0TL97ATbPI8ppk+vZFTYXa/
	CzOa9/sULFG2+bQpQ4o5WolMyrFE+6Wb7Sd9mi4+gMfjpiTDyVxZvVdvA=
X-Received: by 2002:a05:600c:5308:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48d03b401f5mr164650075e9.22.1777975516588;
        Tue, 05 May 2026 03:05:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm381856295e9.4.2026.05.05.03.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:05:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 William Bright <william.bright@imd-tec.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
References: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
Subject: Re: [PATCH v2 0/2] drm/panel: Add support for TSD TST070WSBE-196C
 8" MIPI-DSI panel
Message-Id: <177797551566.290023.13794122301752818284.b4-ty@b4>
Date: Tue, 05 May 2026 12:05:15 +0200
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

On Tue, 28 Apr 2026 16:17:23 +0100, William Bright wrote:
> This series adds support for the TSD TST070WSBE-196C, a 7" 1024x600
> MIPI-DSI TFT LCD panel module based on the Fitipower EK79007AD
> controller. The panel is connected over a 4-lane MIPI-DSI video-mode
> interface and uses the RGB888 pixel format.
> 
> The driver is a simple non-configurable panel: the EK79007AD comes up
> with usable defaults after the power/reset sequence, so no
> DCS init sequence is required. It supports a single power supply, a
> reset GPIO and the standard backlight framework.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: panel-simple-dsi: Add Team Source Display TST070WSNE-196C
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9f5beca48f1a70a730c05bd62fe70295a1a36839
[2/2] drm/panel: simple: Add Team Source Display TST070WSBE-196C panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a0732f5d5803385d8eef16b049f5cdded45bfebb

-- 
Neil

