Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360191;
	b=S3vM6Y2jN7ff9EZvHyI6JCCb0LAgEzLy5kWN4ZzFSM/n5E3Po+fPSypTZYGGbUDSC+2V
	 wN91xXtCytvihUxqWTPV07gWyjVG3JunZTg3ktUapBTnm+o+2HNnvBV38R3EI1FHH9sCb
	 cgu/gJBMJkjd/QlDpD9bj/t/kM4s9fHEiCeK0S0c9vnzM6ySizAW7lrIyXfUgkmzpALaC
	 PXNqFQ7b4xFTe7xvo/ujQKrxfqlFsqKtGQGm905iN+ab8SioesFQY12kNcorfWEC3WujK
	 9aIq3Xec4pGLLEzVg6v/VacjqhjFEneXfdnn8fskejWRBsaPXdsheXrfn/cmG95vIkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
	b=MpjuzZjVvd5/SdmsZHvEqAKw47uK+bwPYjFXWAGoRTpQwEYlWcg7025u3vF7L6EsB3Wp
	 CKxx5ERmvpIluSYslNIQrNE+Kwp2HoZWpSU1AShPQ42VuNWl002J/7FVgh8H+pMwjz7F+
	 E+c5bI4PW9iPpRnKBWZzRkzVBfgBK1bzbf7JGEy6czoM5KVMbYnrSCXKQcloAoaHJ799y
	 L3hDn+DHaXVX0HK6fXgocaFSLJgOWdL3045+3gSwyzRaUFaCCm2F4Gzb0zfrsp4V2KRJr
	 Xu7ScaLx8pJ/gRApCpqxrd51ob0kCHWwNDRm0WqjVL/GsrJASHois7Xkmdn6GyEmxuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=YE69AjFJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7E606A31E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=YE69AjFJ
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso352856a91.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360190; cv=none;
        d=google.com; s=arc-20260327;
        b=FaEpiKUXVozWm6EMG1GP7W1CxTXp+ld5hbHWexU1ztX9XpnzmZcwefEp07vWv7OC2B
         ntVtedw5SVhvb0+8STXEqo1W2HL+3C4dkZIzTVIqLfXG4d1oR1a23bwWb3pzNGgfvmue
         UE/sXNVMU17jfGw7wkYEbr/Ay5qAIQ0sqa+Vv7hMDE8OrlejhuFRlXIbx5jCoqqgUWdB
         neVEKutKaQhCP1aY5GWyvny2cpMO7vO2jf7tkb/Mey7XydDgN8i8bzUxGwPMCbVnINRo
         jc90pOgvmlSXXxxDkatoDtYb8PPcRzZpHEqE2aZ7Atqu3Fg8h0ciVltdDOkWbyzef8cL
         yn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        fh=UlCLWfPxBidpzn+0iiC4qmCVNHk2sYkQ/q5cEBaO8Aw=;
        b=c+bwcBa64gq4Ib5cbcv2O19kMpRsD3ehfU45rZ4dvEvv6BkWpza2MthMDj3ZZ63d8O
         Wlqp+FWQ/A6cTcR+ZhAVZkzfDbFZnh6merUXdyht+KJbLVfx1gb35vRNoD/W4fuppWqU
         y9ficDZwZUY3kRmROJvxP9CwEVhc4LJtmjrXI5zjvxsfsPrUNd4jNqyR6BggPUJHAxrV
         Mj8XnRE7BmduSqjXCclH5XIXKtQVwQrk+uO+3BeZLaB1BXiLaHVoMx8I+F/w+tGM+WeL
         XGimO9FjVVIaR4ESHAVNiSJWRU1RTreOzHjSWpnbd8f+oqgdG2pC7BGiIMj6OHyEQ3E3
         7uAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360190; x=1793964990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        b=YE69AjFJX8iH/bYVabiBDOlLVZuf4MDa9bU458YlPkxrzkq7hkxPVR+o3YJSNYeYhQ
         o/xTq+Vdgo7EMIdvC0T/La4V67J7KtkDP7jep0ixIgwq1GCulpTp3bdBXMM/bnXtHJtO
         L+paF29Jv1HT0M+d63Bty+LpwoSHhkWMkaW6DT/PmCdViksjsyu139fl6XGBuAAPmWCh
         wFjOA32Geyi0GuVo6xT7eWxyaZ2CmoREooUoC509h3ywjQfh1DBeF7HwubcHMFht1GEv
         UR9F7mOocFcgLCbaW46DhEy3OVPU+uJFn+Sk2ifiFzjaHrgS+1v/nvNwkQtRsbxjAw8j
         g1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360190; x=1793964990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        b=jhlovGNZd1zXkKS6ukawUNYvBcKK/W5umv3YOjB+ma8auh+7Oxhjd48zK+zoyWIMVq
         JfTdDXaubVdf6FZdOoWwAnhlz9DdfErmiZChtwZGi0CnJ+sUh1BHFNSJDF83fRZHQVuy
         hOO4uLSRw+gQgdQ7LEXGOg/pZe6HiLbBLHAEKonJZm3kQggFFEf/dudtVqP+rJK8Z6+w
         jZU1Ycsa6gNxRVZhg4xXPSDBC5e0AlQkGz+HwQkziync7eoWIpaE1T8tB7fJVlyUGcYC
         8YPrH394U6yHJ8u6ukMEcKICWL+mxHG7ngNKZ3DgyZpD8B8W4EIXeZc6j76rGnIFf65W
         jPnA==
X-Forwarded-Encrypted: i=1; AKwUvBx+/CIW2L0NvL9f1pJzZIL1FKSZiWBQBr03i8qifh0C61fP1Ni0VvEQUNW3d7jOHvm8hgbjjfP2x6QX@vger.kernel.org
X-Gm-Message-State: AFq9FYIE5QWgNi9hdRJUrb9iADsinbNY/1824m2evaCcFsejEMc/MhOF
	z7oc0qRyO9n2OVIcZv9CWxvFKsrDJWxRjS0iIL6Y83aNJKNg9olBye0rs9Hn23ujYXsn67n/Xx3
	s+56i9kNT43MlhgZ25RAz6IAo+uGJJCZB7v3RuEReZQ==
X-Gm-Gg: AYBFou1KSTPCwnxcXg7RoCqAhko4QGLct3GZyVBwlnsIz0qOSzh2YEClDMWg1y8q72Y
	YfJ8PMVkUxVkTPZxs5mMaZb6S7EtTYL51C8zfyf5DDR2sWHAnsB1M/0ULAc66CosDXs/gJTbRXw
	ThQeMKIzAAMJuPI7F+f0nSpxqYpR8tcXAjmE5nUyYauezj777gTp3fsYoFu+N6iaWZSsIWXwof/
	L27L/EsT6CbmmyAuUUDYg3+K3ssj6hmUj6sAS04SCYqqMxH3W24CVxAt89j3y2mSydMzBYjVvVg
	aZDX32BDGrxOwPBbuSi35wn4OjRscXsBSFZI/O4mcbDO75Sp+wOH/hl7N+18gl7NQfywVtnXdlN
	gWaw3JdPWW3f6VfUSNC0Ox8NDvR8d3uYOcAc+v89RXxcjdp6JPLzkZkfXUQ==
X-Received: by 2002:a17:90b:4d83:b0:3ab:d26b:c2e9 with SMTP id
 98e67ed59e1d1-3ae89763ad5mr1536469a91.33.1793360190259; Fri, 30 Oct 2026
 04:36:30 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-6-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-6-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:36:18 +0000
X-Gm-Features: AclHuK-U0mC8XWkCgVPn0dV4tOoEVFqDFmKaCqBI68agDhWQD9u0tSx5WY3ydLY
Message-ID: <CAPj87rNJgUPhXtBj6tw7pzeHqmbPwkmVzzc6fT5pj_XxAuss=Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/15] drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE
 overflow on 32-bit
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On architectures where unsigned long is 32-bit, VOP2_MAX_DCLK_RATE * 8
> is evaluated in 32-bit arithmetic

On architectures where unsigned long is 32-bit, we will never run VOP2
code. I guess Sashiko doesn't realise it's just asked you for a
functionally-correct but completely useless commit.

Reviewed-by: Daniel Stone <daniels@collabora.com>
