Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360861;
	b=q8b/mG3Z03PigRGz+wr2VsGl+58M4yWyfyy/L5lPlXWK1Cdql5bLh+2QNAcBxI9EXcou
	 wSCRYoT+NN6cit46UvhSa+Ybpx5gBPjq4V/YqsA6CfzGJkjjS2vDUd9s0jilc41j1Ceu2
	 1b6ZGT0OrIxS60ZvGg+FFm2UuI6Tk5DgHundLM38ZLUfyI2ruO29tjeC5Ik5cqFv4DWOs
	 9Z4tHBHV2fLVxgGhEiZPfRayYM3Yj8Dn7UlGCinNmmCWpAYdvsLFfTuJU86wOOlTgkYZ+
	 0MotnPvF/xdBGjIHFAPGCbIQ8pGPZkc7JsK959bDEP0XyeQCK91lsrYr06EIVk9KFow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
	b=R9BWh8xJYrJ6lSyvWrrmEwKwO4enKiaNVcjysvuWXWFcEVNF0Y7F20NmXxXXv1joYW9P
	 o3pUsERFO6WoahrhrgKI4+m/tyO98kzqt5huyUb6bVscVRhVOSI0pu/l6Hg3CZlo6BYSt
	 HgR9119Z5DmNAhAKJS12waN9byhPkJjafFoSA5C303643aR4xmyUFxKikGpLpoi6R20TD
	 rNgzozye+b7HklVohPmo6/q69t4VToR9IagYXlxa+gCRvdEKsnzEhVAzXVH4FT187qcOv
	 3aT9aKOWDOMSguLKWXbV8PGuakQ2UR5nPor77Z0aultsr/Ne3b1AXiDAcxL8SQR8EqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Phf9rpGL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D17606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D17606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Phf9rpGL
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e5fb79ce82so3731455ad.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360860; cv=none;
        d=google.com; s=arc-20260327;
        b=U8MMhGQY0u8/beSUl8rJvS9e7K5x7jxo7O7u5LIJ9cktXxttYwUeR6yimbqry2eAB/
         pJPEy6xNQdhPXawoZ1EaxdEkxzpY/GNrv2kKZe5GZyeF3Up6iUCYtVRTKhqTrZ8LzbFf
         qZWe0yu7Y6nv2ayj6w7PDVAhHqnBoHnsmGkceqkTYuhxzXvD9a+aFmG2nc+yCAUNhXSW
         iKdpJxWSc1fcreqs5wcKqkRuZzFf6d/Hl4Etys+9EkVakivgz4e4eaHVZ+O89QpIC8hQ
         wQmypH8ql/bwyweYpqHtqkboeE/TjawMDv6uBdS0zm9WmZqDDk9GcwIjvaxNDAL9OBML
         qjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        fh=aWZQ0TgY3L8mpk5ePyPUNd6ZYDC+4sq2F6JkPRpY76Q=;
        b=MQacgIwADCGJmLqbSf0jAphYpwFAJy4nzjs4eP7c7nrC19BNnlzQtFgE4HVQ/TimZd
         F9uLXYVicLIpFTb74TdoeLQQpciU27R3NPKNN1BdupWuoYhSXEyPZ5y7Q9HlBBZ/Ef8K
         qietD+2vpsrUdsfoh3i5K8wV6GayS6AindFxk3K880bDSkRPY49+Vdgca86Q/AzJvtHb
         1qJ4jdpiCjvnFv/sJ83o/xPyNeJZ6Jiq5mNj5rx6G7v4GRlRMJIXZV0Vc814DG28unkd
         FwzplIeeWXrPnD3TVafhRVLVNJsVmnJwAuC2brU+fpcSaM1kl7Aqfbip3j3pn41te4yQ
         rUmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360860; x=1793965660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        b=Phf9rpGLm8KgmY5bsirUc5ox8sd3Pdui+luz8kOrJUleJxxhY0B01dSXqOd7+GUzAo
         ffa6zX/6DY7VQ7q+U95osZmsgSM3O/JHVSZnYzJRf5/zgFSqnR0oEqP3KzYBrgVstXV9
         2Qo26uryh8386gvPJlo5b25EveQu5QR6Cb2T7a7Z6A/dlOK0ijNExE7mDMcCxxHqYGqr
         uqhfCqLSCQB0vuzNpD4+SZUMvi5HAHYvUu9dJxAI21x8OmFX98tb3qU8WLDxcSiJPqtk
         cp+RzH8P5vqcCvBUEfsBUkofvd9id5lUkwWaFY2Eyu8/oTLC7E8FaPaPs0/xXcUR9VYe
         IXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360860; x=1793965660;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        b=krQY2zFjATX7Und1vkKF6hsJfURuGfByRdKmQP7lwr6cBZnc5O0GqFX1xM2PoHPS21
         KKeYr06X+uOUutz+rjn6hFezse5Pm3U00A8xcTJjRD2A4gBiGbhc8/InDgPZVVn9Amhz
         6sN1Lo88KqkISFMNIML9w2mQn+NnEYCP7E+vTym9j9GyRYQrvj21wC0Hf0m+0/IuFKas
         r7WOIkmKt+lwZIbD3tTK5ppyyJXY/lr0JFtG8TFmGOqu3PhAvtYroUTOsd+q9z61NMzn
         ++dzPpQmHsZeYKKbboqmreSDwb260Yonoqf8Gbz+cXaJgod8XGyACbs5b/mwJ/gnupvm
         7fwQ==
X-Forwarded-Encrypted: i=1; AKwUvByt7+ybEYusz4JEqee/JxZffvHYT0aU0k93m1l8jkqI4ARfdK7OCVUa3f0EWAIUfcRzP+23mOrERv7b@vger.kernel.org
X-Gm-Message-State: AFq9FYIPihxAKTcDsL8idUjdu1FXSxaSmqrhQ45xN0A99/ud+dsWQ09T
	5EUfXxgj6ufJDoL4KAC6sBOolR0VMtqm45C3dJZM0S5MLkhRpURLsl2lvxV0HL3pYkodjlgZsf2
	Fe+gh5w7qBP7j3NT9fdNzBRRhR6H2SXNFWL1fmoL5AA==
X-Gm-Gg: AYBFou3vh+jEAccKVV7T4jNXXTMjkqrcWXZU9Pxxu/FdDITJAo0lHQMMEk1qiSa2ZSQ
	WsiGQP7CK+g4QlPnQv0ZtEKe5zd5noG2j4UcBWmKUdlK9uMg68yi79g10TfB2fnGFiPcfbCLIqn
	0oca2gXAHd7L5M6Ii57ooivnDwgqD1hlIc1Scbo5JyLJdXdhjM8I54CY1A6nc4wxEFGGZovIQR9
	0jq63uFXndDUWj5JMB9k0YZ223OGSA85I4h5HP/PIofZ4DmSQZL0JkzoR45A2IF5gg8cXKMhnE3
	uDtsOMf91b8MmE56HBpfdY+Xh2Np4TE8qnB4sLanp7mtOdX8uXryapvMg5CHKihMXcVxi/tig4P
	AzbrqT0XeE2s6d32DoL7USTJFJ8T2pyLSMymy
X-Received: by 2002:a17:90b:4a46:b0:3aa:f2c4:12e9 with SMTP id
 98e67ed59e1d1-3ae8953617fmr1788397a91.3.1793360860430; Fri, 30 Oct 2026
 04:47:40 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-10-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-10-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:47:29 +0000
X-Gm-Features: AclHuK94pfXkqJW650Ejw1KMr2XP085nv_elOXQBTTnf3Z6vJhDk_9RcSiJIx78
Message-ID: <CAPj87rMMHpeE3WnPQp-M8KvAH9yZjT7goWU8dGtw+ykzvY1TGQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] drm/rockchip: vop2: Switch to enum vop_csc_format
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
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Improve code readability in vop2_setup_csc_mode() by using enum
> vop_csc_format for the csc_mode variable, as well as for the return type
> of the vop2_convert_csc_mode() helper, which already returns CSC_*
> enumerators.
>
> While at it, replace the nonsensical 'csc_mode = false' assignment in
> the no-conversion branch with the equivalent CSC_BT601L, which carries
> the same value (0) but is type-correct.

Reviewed-by: Daniel Stone <daniels@collabora.com>
