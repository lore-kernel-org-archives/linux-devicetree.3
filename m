Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360922;
	b=l/ZoNhhVcEdsXJ93BF/JfWY/XpqSZLBW+jNVkKc2mkxvfdpYz4Fvj6jCsIXdeTFurxOA
	 jLES1Sa3wY3Z+4rOSqEG07CPcxdV2nCnF26OOGOtW96gMnSYev487pG/faSdBjeXoF9JI
	 yK1OlQkhAqi69X6xiq1XtIQPPJjBIwMpGtGO2VN2tAw0yojkJw07wyCrgZbBgd80ivZyA
	 FXYmxEQWl0ESOzm9H2kf9ti27AuZdrs6x2RQOAX7j128OAXVceGaVolwq0NmLYDbI90uC
	 ekOk2YKKO5h+YVw4aZigPLEOjmXHtg+8z6ZOz9mIrNFyfc1Nh5rXHr9WILdjE0DBgWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
	b=cy78WLxJQfsl53r69jTlmBayNxgM0ZJyj2ugvZrKc6lH5QDPAcfjg/+OlLkdxS8+z4/z
	 8cMvcHFUfcPLjgtCYTDtw9YZDdEFZ/pJycJ72D11iFCn3aL8R3VJ7r/u/V0RG6CvFCoGD
	 WYG8ECy044Mm8ubaZkj9kRU3njfm84cTX/t7YV1Jt6F2Eyc1VmApaxBSQRskd39Gsxsff
	 oLx8639JGMhm37HtOOMcvY/Ze36MOrkr/GvNLKhh34KP0VuL+yb5mU5EP6YZe8azb4KLB
	 JhqFm9rCvMrZwDqZJPr29CaNcjiR35C5zhF6xPRkcFNJ5eo0MzU5d4UmhgtYVLielXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=LSdvu+y3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA1606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCA1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=LSdvu+y3
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso361746b3a.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360921; cv=none;
        d=google.com; s=arc-20260327;
        b=LXL6rTuWdKA0cMA+oouGIQvXBfaEoD9CUEzbGnB+RIhXRZCGGxRmdaCAdkWSr5DsIi
         SiGHRaAsedC7Xd84muQhjHj5XvNVfxTPuwvCM5jtWKnSw3MnY+3CPiHh9lhCjVC7Ohdf
         b0+ZkdNzS8dUhPCR38kSjwhRBHd9IDAILf1xvUIc6sVxm49Snh/e0G9C8sb1d66MkbS3
         x0TXCzcMUr/N5PsrvSxSljDgy4YKdEWT+an1t29rQSzfSidcFsMGXWFrH2lJBBqgRFNk
         Uf0xA2gb1RggXsbIqVZSt0fcFB03J95Ir4swnw7WK5m1+WhTtdyHd38f5QdvMzbRkHAn
         FXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        fh=bqPF8Yj9tuiBQdPO8mK0FUZUWtks0sRI5Gd5X29oRXg=;
        b=UliVs1hbVlrd7nKdcte8w9V0xB1Rmz7mt130BMxOpfAnS+swXaG9QcB2lf6Z6VAOQY
         wr6QF639lBnYEy6CRS7U0kKWG2R5ynMwMYrVZXtUiuYN3kodXxEwrKFyOq5Xcjck4zot
         K9JWJbgSWpdO9uosIGYV8X+2aO8q12RwRZGHcMD87lOIia6RuB1eynRKmSYY+BPw5gKm
         yyHiEC2tWZDVEXuaDkyXoKHQC32D3NvneZ5vRnjaP37m9OPu6F1Xg8tGr+A4osco/j57
         +9458P7OBCS/Zp+x3MuApaH5rzEp5QBpswykXOFOib20/gJnyVe5+7Hn6OKVrtU9LfJi
         yfnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360921; x=1793965721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        b=LSdvu+y3IPgRcAtg5miAIlPbVuoMPy9U227DfxhrEUc8OusbTn/n4kyWv4rIf5N4KD
         kb0MeajT5M41marBN+SVSmLB42TAhxaXGb6fI0cUSHaWjsAEGYqmlFIkW59zpAvebknQ
         xaDbsDAyA0pyae5AkMfKJKbuVWlX89rdnUILjmpOMhG16mjCi6pJKx2kQjgjom27KJV8
         e6OWyIcV7NqM1RBbja0vE1wTJC9XZ0ctrCh9PwQHcYZTw1+MC/Qce7hNAZAImXVfl6KX
         HIXgX0xhL67Lk5sFtaB06/YOwieAxWt42lgUp01mG04sRvW+XTi+rJcBWIMf+xuXI1lc
         Hp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360921; x=1793965721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        b=hg8l8XrniyJepL/n5cLZQZWnIom04EaJR5cE4qg3gRFOKgJZhCf5EL6Yv8Q5aO0Szr
         lxz+6iY3rR18l/mgpYF1fsvh9nkqf0Bae+YhuMBa2klTcVqNEY/C863Kpn0iUBiDSUiZ
         xsN0hNMlLKM3hc7jd3ns+1CAj50PNowzEUej7ukEJUOLcRuGJMMGtPg+v5lm6lb+RNw2
         PJrTLNeK0ntBdJcvYLPdc1SuqEKerEWOfqUrlhVirrnFPkWmR7Z5TYB1L2b/+Noa7IqT
         Khefsp8K0UrVLRFMN0fJJGnVKouhTEIjf6nIjXpVNDvVpE09fn7Knn+gMTPZGqOaLfKV
         bylA==
X-Forwarded-Encrypted: i=1; AKwUvBxBTcjO0QBezadJ6hkvfb2CenX1vJqBGTmU+PxnuTiXtJPXqNvXdNaHdPk6Yl9vHJC55jxndDpIosOe@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ1QoNITdzp7RJ4LnOJ0+n1W8+kYRu9sfg9w7a8Xxg7b9QAngI
	NZABkfB8l4/wI+Th/PQzPzvOdfu6NwJO+uNMarglSXFPhRg8TD/mf7qxXisqg5qEIBjmUSZgjqn
	tzfoT9dIptKxsWJZmazj93rGlOB5KuEXQXAirQfh9wA==
X-Gm-Gg: AYBFou2nI5hg3D9jLpIITgiRCSPqt1JxC4mWPDa0mwPzCvW45jbFMhO0hSGLgabOgCI
	FWK/FFtvL1tiKgorYfNYyv0lp0gA8mjdRg1vTbdE0v8+Ssx6YPHUZv0+WTdnjX6oWdyPSv2qs7o
	Y1ip6H9sFnAEHwAqO7GGsODRThqd4GGjnHWF+jjwLuB4shhT4XA0yB0ieLShEF6cnSSBm1R9vc/
	FnRzuoDawNwuTHwwdZx4vIKfodUWBbQsKHAXoyiJKF0Xkkor6AoUkZLAzvEIeaNmsxiCbMOA051
	SMo+2S4H3lfnM9uPUHqAfOW4j8kLcamrqOL8HL1gVesv45ST7/u72LEWzLMdt1EuOewGKLvF3qz
	ark5eBMCuaINqk9pWwAiUmIaZkeHZWkPu8xtuUEopeRNwMKb3isTQkNhxyA==
X-Received: by 2002:a05:6a20:d10f:b0:3cd:3e77:1dcd with SMTP id
 adf61e73a8af0-3e928a7e442mr2014372637.1.1793360921012; Fri, 30 Oct 2026
 04:48:41 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-11-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-11-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:48:28 +0000
X-Gm-Features: AclHuK9bHaRXHNAR7u16We-RytuEmqtwRDDQT6RAcbrEMxFejcbNnPABR9ssHjo
Message-ID: <CAPj87rN7RWfEa_YypQq+quER7V6pt2A3q4fYRuUXF3_Ch7yL8A@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] drm/bridge: dw-hdmi-qp: Log resolution and
 refresh rate in atomic_enable()
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
> The debug entry in the HDMI branch of dw_hdmi_qp_bridge_atomic_enable()
> previously printed the literal string 'HDMI' as the mode field, giving
> no information about the actual display timing being configured.
>
> Extend it to include the active resolution and refresh rate by
> retrieving the CRTC mode from the incoming atomic state:
>
>   dw_hdmi_qp_bridge_atomic_enable mode=HDMI:1920x1080@50Hz fmt=RGB rate=185625000 bpc=10
>
> This makes the log line self-contained and directly useful when
> debugging mode-setting issues, format negotiation, or TMDS rate
> mismatches without having to cross-reference a separate mode dump.

Reviewed-by: Daniel Stone <daniels@collabora.com>
