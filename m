Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626847;
	b=avACZTQ3awExA+xTT2LqLG7AuAASrn/SQmGNQ393l+jHu3yT904hkU+K9ztiu/Qy08+r
	 uBoETN4VxLh7oQ5x/jpYcYFWWvkoi6x4W/kIriqsP+K7K8SYFqTTeXftm/qDot4txjAyu
	 YipjmSQoV62vswRggxKcnhibxkzi7RE16jHbFdUpiZ1Cdue0y5G+yCEEP3kacEmMddTto
	 +jZNxe04wYM1QqKsByfcERyWDjbVHGE9d4J4Q8UzfBFud1UJKmeact2QhLj4QnMLYAq/D
	 ToUrM2xo+A0eaRtXZceZmT2Ghvt8u25ITKg33Xr6isNVxKzgVN6nRSCAtxukysCXPlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Dl78OSEC2a8P0qNwjbCaKAfKyZ4r0+nLQbHmynuYPGc=;
	b=a7IKKCH3ns4EKCHMFV5PJcy8rBdzYMhvwN8hyMwbKHulqbKNjtP+pCbj5+LuYrcqBvIA
	 tetL9WUlmGD5ZyjE6k4pP9pKOHRfMG6P1xA5/BhdMSU5U927mfO71Jo695FspELeJuB2e
	 tzV+b5UHa3vQC6flqjKwRqnKM9wnGhy3DnkhSNGHAlZ3QEfPGUPGr1Bm7vHS+n70aHl0H
	 XX63c6HmpT9EPrRKlOqV1+byBFCoxRNqOTlSKZM6JovPMPR+9GzH/G1dus8ZOT4j+hnuh
	 LysMlptr/BBT/XRPAj0ptvny5tpe457fvPSlDljLXABSUYM2QpIi8gXsUSgrGjSUwdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pGkOIJT8;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B160A3828
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61B160A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pGkOIJT8
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so26297335e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626845; x=1794231645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dl78OSEC2a8P0qNwjbCaKAfKyZ4r0+nLQbHmynuYPGc=;
        b=pGkOIJT8aTj7/6uiIaRBS3XwqfzCUiLgyjr+tCG+wwhMd6uN3K/73Apl4KlOG4GhNr
         gYiqhRrlgYSVaY7APylkHGDuW6gpsEqkcW9llLievmRJBHXfm9PpGGMzdhdv2vGddSYW
         0ZlNtSb020V1mglQBLioU+kZ/Vd+1pDe/n7QRDKkoKOMIqLeJtP9e/eeK9wy01cGBmO1
         K7KtIn/1dy+SjWLlvY7vzP/Jd2rjTuxfGEnhgGOxpBc3X74P4KH5rd+abpBDcCxInnTQ
         xq0hm9e/a+qKjV6NvNW7tDJ4V7hMjYzCF2mOUJf6ONxWc8Z8amvSDtqIJZ2zuKqi0WbV
         xnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626845; x=1794231645;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dl78OSEC2a8P0qNwjbCaKAfKyZ4r0+nLQbHmynuYPGc=;
        b=2XOTPdNhLcod2mUzX77n8DASP43lAUxW/2rg3/VHUaTGg4/HZF/ROt1EigG7K5fknY
         cuyUD45Xccm/pcjlezKd4pjV+3+XGXEfOST3dWLqyorInhtbOw9GNLT9jIAGL9mSuw+e
         vEdjTtlp3eYdk3Hfso1Gy3FzNYJ1fKrm690AtLIPj5c6BXJ8haPwlUOUlGgUYaYrBvD1
         M3Ex3YZShuw/NhCEYfKghNtCnMGkA8WGNylwp330/Eop0dfbyj4jsSy/K+XarSzawp07
         93mMvSm3xaK/HUAHqVJZ4Iq3z3ea89XbdPFy31E0ev6D1dH/DxN2qCbXZmrzF5Q5r33t
         jcPA==
X-Forwarded-Encrypted: i=1; AKwUvByjDdWjtkYCtSV1zWK4bJy/NtEHVc5wizn5zAyfhk9lY2xsmLWX5g5bRmgitTsZVNtp1PVsrYlhr9Fp@vger.kernel.org
X-Gm-Message-State: AFq9FYJGD4hbe3aimRtBWeXbTZ3fcRIVxJJoYAC8Iw08F+DWDqq83SrO
	13AiZ7mTPGaA00HQXOHkq4w5y1GkM6DY9mm6KkETK1ilG+LKcyRaB4hzMg3yGnXCQF0=
X-Gm-Gg: AYBFou12RhIyO7kavZc/Qb4krZWXgeNPmqM54eHsruh/9iXvt+3gsVNWMPIJsQKAPy+
	ldweEe/ucDAg25QSZfc5pYbhSpd2WVyKjd5ITkYVtu7zZHJrHr0aZZzq7XfBqS/fuOCR1v3oE4f
	cXerjASTnjnR9vjlPZPb83L+Wol900ftvTtvhtX36pHNmfN7tCqzVQhbL8uRK5+my8N0Mh8eJ0i
	XkVW9sjWIZsY0XiSkAIhReMmNBTvQElsEr90qJW8TnKm1KfKlMfORIE7RUqQkiYW2YXHdeiH0wl
	Ci3UJ/So+qX1WxIKF0zXy/QcvsWxcydDc4Kzh5VG8ZqlkNxl+zh8IaDEBtNLn+jhZTD5OA1n9nf
	P4c4tiEq14MLx1ZY8PezWNgf8nnH7gOddp7fw3zLccrhDJlW2PiU1RN4Z53D7sWyAOHHfpZYUgv
	JD+CN7CrokIQ7iBXPeWwZzKwMArDLnmCDexs1Z8kE+rJ7pZGFV3ebILZIKng0X7A+i2nUcDckqa
	wT7TnDH6djjybFBqndbVc4YkA0yHPhAswb0hEPiD2T/kwyrKNuJ/7gPyWxm8COgVQiJrDFMyqlj
	jZei9RJ3iXXzdARNvG9cBNkCu5AAUg08L4T2ep8IlVkZflE6i8m9EgbylIIOtiSAoZtO+vI=
X-Received: by 2002:a05:600c:4f82:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4ac1889c857mr215222075e9.20.1793626845007;
        Mon, 02 Nov 2026 05:40:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ishu Brar <patches@brar.si>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261026-panel-ams644vk04-v2-0-e88cafb3e577@brar.si>
References: <20261026-panel-ams644vk04-v2-0-e88cafb3e577@brar.si>
Subject: Re: (subset) [PATCH v2 0/2] drm/panel: Add Samsung AMS644VK04
 panel
Message-Id: <179362684370.3310106.4332858082729247133.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:43 +0100
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

On Mon, 26 Oct 2026 22:09:31 +0530, Ishu Brar wrote:
> Add a binding and a driver for the Samsung AMS644VK04, a 6.44 inch
> 1080x2400 MIPI DSI command mode AMOLED panel with DSC, used in the
> OnePlus Nord (SM7250).
> 
> The driver describes only the 90 Hz mode for now; the panel also does
> 60 Hz, which needs a way to pick the mode from the display pipeline that
> I did not want to invent here.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Samsung AMS644VK04
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/362fc4c73d39eff00ff1232275631a5b05474a52
[2/2] drm/panel: Add Samsung AMS644VK04 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a72e7d5b3d038915e05a1c459b513e40f7e06ec2

-- 
Neil

