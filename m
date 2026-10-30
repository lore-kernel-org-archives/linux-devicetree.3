Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360688;
	b=TYzMGbEQwqks+1knqpISrwWds3/LvHsZQWKGAqfUnTk3K71bboj/2mJqA2AYI9CzFZ83
	 C+wYsIaN0RzP2KEoHlbbdrTOTuXnS3fqrbsImIPQ1GRKdXzK9iuHIG7gVAZwGOfmzzA/a
	 gwpP2jBbX3bqkP2SKREQJT4hozu0zJkNeAPdpaixIxq0LgJ5JF/ZqzM1lg0M+iQ1mED5T
	 dhn9LwRUC3y1+/h/omRosVShvw3wBoL1FYcgKR6kPp6+AO039vLsRAimQuM2GzS0a2n35
	 tz7LAx1XvxiwxvJ8+/QHqyt8iaXct6RBDcgCUU7cdNsPNy2R+/LCDKLS8B1eYvDOZAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
	b=BNdwdJkYsKows2gCVIT8pvoQ7TFKmMJy88d7SZ3HbtU3hWAT5cy+ZnUs63GoMTY2etUb
	 /y35Y1eTueRCP05TYDM9q/xbelJikiFCCMtHy7Vf1FN7L1SJkq1eZjihW9Yn1A9DAXArf
	 qSjUMhZQbUV4qlnmylYgKqtdGNkZE7IlJaZcCRyYEUS8enWU+bvUNnW6x5/Lr4fYx9dS4
	 iNmLUI57Lpt9c+J7+kZEYeL3ong6OVt/chvUI8syDB0dcZrESNQfl8preA2ptMGRbVaAs
	 64A+XwM9GiZwmlZlm+4/IS0zyr3StSdohnJbrrlAZ60Q3mdrRVmFccf+D/HOp8Bi7Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=GAh88GJw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F97A606A32D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F97A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=GAh88GJw
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9e53d011eso5405795ad.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360687; cv=none;
        d=google.com; s=arc-20260327;
        b=WAnrAR1phLEJMwGj77iDL/vye9Z5cEuXH39goitj2v4Lis5dmOLVsYPgTtcviUQ43K
         yb46jqVjuIkpd+fQi1NLfr8ICHygpm7hhikIbvpOnZS8NNIuI7Qr4ZFw6SlB3o6WRcQh
         x+/ps3FP7pXfng6smLAYhqpgCx2goa/z1dDRwyMSwJ6u0sKzWd30IminoRIiHihicbhU
         /dEfR82nwbwq7M+jXxUTfmifLrzwmDc+ojn9evBE26aoqgLaNm0KOISIkBC08HhJt3DV
         79Yz3UivFPsuCQVj4vVTA3boOZkez+dKl370k5dVGqZrNJy1tYGknavLl8LCcYAZV9EE
         2WRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        fh=yg8cPG75kG+AEqrW3kwT5D7xbTgfseT/PrN3qcMfuZQ=;
        b=UveBNRZwbTlRhSK8NZUjt0c+psW08nNSZGCZEhqmHvr7LS6aVXdDtkL6APIPVuKTr0
         1l4W6WQiA5oj86JMZ6PZE8Hf0Z0Eo10/aDWwy2dkMeJVjilFznxive89kaYSnb0SaB5o
         LQnfrL/NaLlSydnhZx9dbgyZBP6aIekuJMVT+yHC4UO2RhdFVieuc/IU/HXawLW8KZbK
         nNTG3fGh8WJ8SongEZjK5EGehDhH/O0UWT2z/VA9QMhG6VOSk4mTRlfWvPMlwLD6jhvW
         PsNv4RE3RiNv8INIR8MRdcBIVRfwbmvMLJpknyo2lPOSOHq10Ui6ALL1CoTgVUDQxiQz
         N4XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360687; x=1793965487; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        b=GAh88GJwQN8NKkj9foR5zmReCQEkwgJJ6OE8L2/dYYFWjcjtaoE7T+TJKPTlRXv6em
         I524efNvsDKUnOHNoSreO+XJ/Jho9cMqLvi2xucn7t/bmmwY5MfWd7dLzdyRxTpnreRm
         NcXTcY/0WsUa1J4o8Z3sUR+3rswBzee/0NTQgqeSG3cbg6AGU0H8LDsx58GE34y6aNRh
         0JhJsHewnmuF/+p+cRG4ox3fr9NrNgFjIfVoXvG7xkHakQvIt4RvCVKHndexJ2iTAcxj
         SfEvGsT1EFxnr2Ax/KfQZDy8dpjePngDmSfq/zMLjg3tA21BpA1lWHpfsqVfwa0BlBUh
         7C+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360687; x=1793965487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        b=rJlvN1LGSu3qoTdFnMmKmC5GKLFSm2bXGMRxdLuP02ReFSJ5ciyTqKaelX6YWdJU3x
         Yywg0oNdgoZvvHIBcC+uzvFlyUd8bpOO4TQw0nOGrEaC8oAiB3YD8Qhy8vfONCsQoL/g
         cFz9UtRhS9Mo1gGw8TiZvSChSuzrmLOr1W85D14xXNXOOBYvKVswKZRNhD8uF725qMz/
         hOgfz4z+QDYETCkPB4AiC5irgZLaHENhdmH3bs1BuIp69Ny3FrY4GeVBfjSoXRuUASiS
         Ps+qXcInxNxDFELTN8PAqEvG5GIed240EeoASD7GW9IffgSG5vgUtIEJZzizK+kEI6ED
         Fvdw==
X-Forwarded-Encrypted: i=1; AKwUvBwHqICTmIUVV7JxRf+6okXLxTNxPwu8EeHHhVEkOHO6R+b7gpbPk9C1u20Cs/WGwarHV65kE6eYuUUd@vger.kernel.org
X-Gm-Message-State: AFq9FYJJdjnU3YKEjI93rxzPoO3BDCwTLHmXVc+qxZnurzQcQE6cKlcO
	vC8xm9Pzq4mQVWho3t9K/HJyWXc3TNY4wRNF0n0lhzVOWXgV+dfv3xY5jOm7k1NHdzXpqzsc6SE
	Pdbef7dqrDpsEaX37Qdn0e/uQM2fifjmObiEz9A8alA==
X-Gm-Gg: AYBFou1GTcXb9qd16LKX9FwVygfMc+yhUzsfvikbLj7O6lhGyi3GaMv+4MdJYDM3RGb
	CUxh8pZGjQafwtKbOO5iwsDtYEcVSNjZ9VbznPcGrN1cZAHnH1eFAut2T3pYQi2VPQGm5Sv+d1C
	HVp2ZvsYPyngSwutjDUK+FvJGOMTeBxQ9K2v9Utq4QKvD1sqBROxqGWREXMXZz9b2D0Tq2GUa3z
	93V4JxXSx2BCC82be5+UO1eVlfK0CQWUoafJQIbkQ0MdB6TiIgGD4iG0Dh+16yIh/rKENEMKq6J
	/t+lJNSOVbq8JfxG2bXFUutpvWSZ5sZxCnIB930c1xWfEoWeZSMrWu8+MUMQ+sSuMsRuRNhW+ce
	qL+hMeg4RJNWE5VYLc4hHyuGxrYFH1V83goVm
X-Received: by 2002:a17:903:37ce:b0:2e9:6333:fbb7 with SMTP id
 d9443c01a7336-2eb364f49fcmr22277985ad.51.1793360687631; Fri, 30 Oct 2026
 04:44:47 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-9-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-9-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:44:36 +0000
X-Gm-Features: AclHuK-Q06xdaUmiDGoTsq9LRujvtZmp-FKJhNsOOxfBrNNarZ1Qbmr7JOv-ovk
Message-ID: <CAPj87rPEz=Y+dZayouddZRn2ZHSVNk9BAjBqz34PJyjDRba5=Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
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

Hi,

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> +                       if (!vp->dclk_src)
> +                               vp->dclk_src = clk_get_parent(vp->dclk);

Why not do this at init, where we setup the rest of our clock tree?

The rest is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
