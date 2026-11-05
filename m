Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793879032;
	b=ONpPAnl0qSwRA/dqA0fAKgqy4nzPfR2Cfit7CqvUBXk4MImaYju75orbjZN2Jwmxh24E
	 A0SjnLJSQseFzwR/hVdlqjHGDV9o5ear4FYzRLdp3w2BHR1IIU2+nbKYBMw2jX4FfdVDW
	 7HO+rjXgdocWWBE6ZzE8w29UzOy08CtvPLfVLwjeAxQygyobsdH31pwjXdZFm4bpAxl8J
	 5QxzRkj9e8zMOMJy4Ofji7u0ygTKPyEasBe2jsApQkCNFe766h2H1x/qN+i41JhGrKHvR
	 j1ix0meWhKB7QkS8N3e/SV1e5mrkXOpwHQpRbSoRBQQ8Q7Qa278pyBhS1hFrBda2g2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
	b=h2DnzdD1qyqE2WnLD+AaxvNEL3bdBNaXhX7LyztpFr5J0C/XgLZ02uqNQUqikJ6dpT4Z
	 5xiOkU2zr1/cUbv256UDHA5tUJDanETi79ZhHPTbc0hHlnx589LXwGCxpI3i1DFv+RF3O
	 OdD5HRn3ErImscNblXnqF1nlgHitvkwhzTYGB3aHdvmGqn3CjwKl3nhfri1dXKAHOpNGZ
	 zokitcjF3CFq1kSN630KGezQpmLG9uxAAza0XTWro5nI/U91aAYnQZwY+I4k5/owRaSLj
	 FUuZtlDaPU0VWGMkpLPrvGc+X1ZQgm4noVzfyM9JQ++f3xI0j25JvWHPwx9W+XWJIwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=lBrbOO5H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01943606D81A
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01943606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=lBrbOO5H
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed06b725fdso3302665ad.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793879031; cv=none;
        d=google.com; s=arc-20260327;
        b=aHSiXAYM80ryj5Cro4IfWZzkTXhUDoBLXB7A2aeE25rwV63VRoDWTONTK5/UXQSqy9
         kyk5SseONe3VMZn6mIMbaQcSrtGSYjKBPdxBWIK0ryRY3G9TEm2OS1lG1sNwVgG87MGI
         Lnyxz6Uhto92cMRC3xFN34LZpY/0gUFkWDdEGrIolPeXNVjDTsjYdkiQ3jEjs5OQefWO
         ueomGJAhAMkWwfp/35eixkRagrgZ0kgj0uyZuvsU/E00k0miYe5OrxqPgYjk7xAqoAU4
         RP9S1v7Yk8rKvqcQE5vnV9YVeTaM4yFOwCABRGDKjvBNgeO6y3pM7ZzxAWFwvj/Vz/8X
         UAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        fh=smlh2PSmXx2xjtFfynJyxzGM6y8bR3ucU1ncmVPUq78=;
        b=USZDNbP0Ti+7X340V/fw1+5w3zMc454VBpEGrYw17E7A+26nJpGqHJObo8t9bZW0L2
         a67SK+Rsp7C4RCQzAYWruHdBPBECO/ww2uVIU7nYxS6d2XSnhiSgySOWZjTOgQl1ur/S
         JUibZY/TdJWRiZ7xYCQBxbVG6LmLNwUamTQ7FD5IKIvcTKxTHF8muBNwawQz8QE16Z2j
         ptNMS5x8jAJuDhZObjUQm2tP7SBLZRTg4g4bAxPhwPHa1al4Ozkqlku2ZC5Utkg1UAI7
         C6K8CjcGRu4fcAfzbrFdg8RbPBd5twxKkbV4ipftXlABwVRi/cHpsDr5d2XuQckqt9dO
         azMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793879031; x=1794483831; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        b=lBrbOO5HeljfsIiv402sCbs/EKe5ZKXzXimiRCIzjRfpzTYeVFhDIiEhQGyOX2S4yk
         lxewofy6L+gOuEdQU2H89T7P8/U6cDouz3bPIlm34+8vxFRJoyr7fBtjgVf0QELxtFGu
         ddVeVZtRXGhpm9QMwJXNWSNy/6h3DlQDGkzD3WQ22l3Hu6o+6uIPvZuUEZWn48QYKCUJ
         QPLsZmBh65G8biiV7G3kTb/j0sNZ+PNSwWzEQjwzJcAce2Y7vGyTg8z71ZZ9XJs8/FC/
         B4cbnK6oRdiF8nWlBg4q5exGORQaA8yFXhUShVNU463rhOZpjVA3PZHXerntCU1XmRR8
         XQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879031; x=1794483831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        b=rr4ePUHVmSSnwTiQQAJdZRU8XNgAlksyMJWQYYm/+rEl+qIbqiB8MVhRO1Q0cUIff+
         aepD7yrF77abY3W6vqMD3NMB3Vvvj4/9LlJ6q7Iz1/tM7OKT3Ek99ED9Q/0L7Q0DTHUa
         OFXI2H1F4MQ9+jHpzlgYVAt+K/eEqOLbpzPl+rhMLRYKTDh5EDk8YZAEWmuEL3q55UgP
         H38nvjVvoMSrahvqWj5OA0ya8+5oowL+GxRtgZJOXgKxyUPL4li86HSJK5tueCDJecnm
         C8b/C1PHP3cXn7b2QclVrbfH3UkM20dn9pl+yssli28dfvuiwCG836dyDQPC1dWIc4+k
         iQzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW/58xcLxL4yckbYC4j1X+UfFGv7EsFy5GLmj+sFSXnPiimodTptAQ8f57/eg4mnouABkuh/PYxJmw@vger.kernel.org
X-Gm-Message-State: APuU4Z85APCoIEyp8E0287TuzTz79jqnFrUFNe1Awz81fS6ZeXctizLN
	UE8fsF/Kl3H6wCOmu+vFQpky8QCoNGIxkErDCYnOhfoUDQZfY6/Hqx5STG0fYc9m24ZQIZSUI64
	XVhLnjulg6ofYETzp/dPf6+LjCjA5Iv0TI+h/X1rqoA==
X-Gm-Gg: AYBFou3VulRwTq0pS7uJUlQjRqWx2vdBQ+kbncJ5esDvenXQvhs04qO3oV034FsRgNn
	JSDeIim4El5RV846SbqY25B2FozOvym1x7DzsVRQ6upzWceogP8NguopkWomfP6b5kVGdMU/gi3
	jCYwPt0B7x0EAYhexlJFdPMRFSBTMNMSPNpjh1By/tw02G1mk7b39Ro5YBwe2yIuvvXtlnBGTQH
	JMPAItoTrVMtJblw6UXMVtjXsyYwLfhMVL+1EvSYDEAMaRj9/kyuDjklHoIXJ8CnnoIqCJQcFku
	RNvfbpIeiFNulImbFIs/m/cMMs44bIYGxUh0+3B9g6/ydY4KMMASVjAmajxyeHIzE9s7G/IzA8L
	Vdb/RSyFurj7zxxQmt6TeYkZQlFFIth4YNZja
X-Received: by 2002:a17:903:acd:b0:2dd:c100:2521 with SMTP id
 d9443c01a7336-2ed2405ebe1mr15348025ad.42.1793879031149; Thu, 05 Nov 2026
 03:43:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-3-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-3-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 11:43:40 +0000
X-Gm-Features: AclHuK_G5HVtKeWQBX7RTZFBduxaJbvsY8isCNKQp8OLwXCa8s_PlYhYGah1Zi8
Message-ID: <CAPj87rN4sxAmb+Lw_xGeQMsQeD_hR-GNaCHeRFivAKfp+Ww=fA@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] drm/rockchip: vop2: Disable core clocks before
 dropping runtime PM reference
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
> vop2_enable() acquires the runtime PM reference before enabling the core
> clocks, and its error path releases them in the reverse order.  However,
> vop2_disable() drops the runtime PM reference first, potentially
> powering off the VOP power domain while the core clocks are still
> running.
>
> Make the teardown mirror the bring-up sequence by disabling the core
> clocks before calling pm_runtime_put_sync().

Reviewed-by: Daniel Stone <daniels@collabora.com>
