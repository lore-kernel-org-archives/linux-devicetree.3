Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360540;
	b=3tK3RTEQ2EpXNBV5WY/NSSuGhdsdUg1yGrQf0e7U6v22lkZ4ln3GCNdM47QelIlpRv2g
	 opo457+U25XSL7kgeDnuJ9iQY1q9VpWmbJPd7FiKolBtEk8Xs+nPWVa9SwOF5u/6MEXP7
	 jG+BrpOV1F8heb5vTUmLBy4Ni40jJ+maJ/HE/BkYSv73YvyvKg5oM1W9rtd9+KyfSs1w1
	 6jLua3Pqo2rM0sJAKgfJ0pZCBcMwMGJADETO0nb0z9MeotwFQgcdEH3QTmmeDjBLf/OBL
	 KnVH01poJXcLLRVpY37Bq48JmKlzt2+kUp2DmvBuv3kkmQHqFeyuK4UArwPK40C+l9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
	b=IyIYorKADuJPtULRiM8BwcmVcPeTyDj1RsyYkECsEB3hdYkzGaNO9Rpcb/U2ENaADUGk
	 WvCn8YQYtNaK9edR6UJDW3zZBYOoPTwI1mJDQ8wNUf6UWO2fT1rXUptSHVkkK63wzP+n+
	 O6pQnxlzgGNa7Guf3Y1kuAiJTMG41rBTeiK1FDIknVEQ4RgpSU+yiCR23wu0CALhslEWy
	 FJzPc8MsUpIKBH7ovmlk4G/UFS7konSIdEaQ9ipLNb31ND2uEH/oWCT1DPrz/mcQJXCc1
	 PPII3cB64tGJ/SRqPyDY0Qrc7dxkcm64iRwCQTrdvJ0CLBGfXMEKmQ4fjGhobSic7lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b="jPlC/G+U";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA64606A33C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA64606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=jPlC/G+U
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so501281a91.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360540; cv=none;
        d=google.com; s=arc-20260327;
        b=TmB7fXE5rDqx1jP2UodkfL/4ZA/EnWnuVw4HXF2fVEPDb0h5RIc2Jo2xzZ6AjcPMP7
         /TJM4uXlTxZ6WrCK5pi+/76EowzjXqY5Ip54hEUbtRoD4plG3ODGzRzaCBg0n5rGT5fa
         m3M+gWufeb3zTPooUxhcISeFvowBCCnE2SEOK6gs9VvZNhffuaGY/meAMw5aTQI0Qz7o
         e9ZIRDr54Y2Tj5TWrDa6RhKnpAWwiKr/Z2i++FZDV63H0+0JKB8eUAFeV2Y6mdH4cGsV
         3K6cuxTmdyzFtnbNrcRJ5p5bh2mHy5G2Q7z9vpt6F+xFnMgLCdpFAPjST/pPqqADfzIo
         Vh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        fh=Xo04IQUyb8yPjEgJGMcLImJVVvmjkcw9gGCn7c8z36E=;
        b=gRr/TofV+QV+xv5BnV19ZPOOE5cieZ+J2p4mHEkB9OPZJP0/wjOXdVC76YSL/3KMY6
         3+LmbT7N/gN574PEIVe0JTmaSvO670r1T8mkTKDiwZ669t4YvKrZCfKUjIm2htXJw4Ls
         PpL10sI33mPiBWSHmPcYkoJ9XPy2y09Q9Pzjo6zly5uF8XKkmLw+sN5kuZfdXfZNWoSa
         rpq3VmHY0md/FkC4kVAuHAG+j/lA/NYWZIc6mWEQuVOmBR/ToIeAguLlDfGDgwFQ5WeE
         pOK4L6WBeWOW4fGKm6L3QpHx3ueUObsfswHh3aLt2b4kBeSaj/eymUkHk8YRMgAauta8
         mMkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360540; x=1793965340; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        b=jPlC/G+UIiRplCL2fa1q3u0FLYjvWCUNnw7VEerXiu/Fq/DXer7IYPgZsgWK8b83ha
         syvTK6jnc+GsCtAEeWSB6cAI6NZ0ly1HAbxPogjfBeJttiCeHGrib4ojDaaDDSLIZpys
         I4RiW3Qih/kJL5q+L7Xp4VqfYqG/37iowYQ0XJGv+ZM7RVQy9WOIRIad1ZHe/85ek14q
         il3bo63wQKriM1/asAskIu7Z8qWArH6B+bXvhCTojziJc6/J2hkN30htQiaPT//g8Ydp
         j9jzxiothIrHcsTDKykhUB83rf5avigcxED6c+572x+8fYxq+I4G0hconBxphgr8nVYC
         CIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360540; x=1793965340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        b=yV1oVX4PHTCZIaWgUzYc1Ky+D4uvx7DJzvH991Plujbhf3dIteqVIP/MrIt6SxKQ6Q
         3nEjsFRU5NvMlTNPz/vKVKhHU6GbJ7SLSU3xt/mP2BYpo7ZoxBT58OcMFRArRQTPlprO
         HMeNS1BSlMD1TPnn9zeGYtjhhNBBHcsBN0wMteALMkHEZQGLju0yhQNjKnMY6qxd6du0
         EJVvZpQ7RJ0cWeMw4CEHmVDieQBqMJ3uxQxIABBdoH8uQs0lIEbNzYNf44d2aU2yfCMo
         EQoo0Tki9FELhKPF9AtPK20lEwowm/Ev1ne3+2N3sB1Ygv9E3Ky6BRD9+WlDWUHlL6UD
         ldhw==
X-Forwarded-Encrypted: i=1; AKwUvBw3mpYOmNg1rair+yaWpWXvJXQ8SNvNAk9Vvwb+B1z9YqM31LWVvfoZj9FwrMKKNTGaDyDlUbqr9bC/@vger.kernel.org
X-Gm-Message-State: AFq9FYLfdkWi0rCA1JmErlz/lL2qvOeQ7H3+BghmtB6NgqGZIg20xxwG
	rBLZ1nmxPjjmYva+1H8EPOARhuscNRmparZtUlR22IFseg2l7lXasUj5Y9yty4IxvXNC4+xLcRf
	DaOFoaYhFW8AYo+Y93+7mdbIrU5ISMFYm6WGKw7+I3g==
X-Gm-Gg: AYBFou3h2x9Rx4DQFIZm4fbRw1CACKAPIUjmqhK6hc+fzbipbjtioe+COx/NSrhlGQC
	lAn6d+MMMH4HY4AoLeR6q31Nq9QkISMwyNdXMuM8P8WjDpT4kLbxURxefWPTsQGf55GOOhuqT0P
	pkVXGBOS0Okyw1DulnOwfttPNm5GLvZFqNJHSNR3GYAYVAbf7aRGxG2lXDO3+Y7TqhOZBkr1cnu
	laEuTpzMD60XbiefSXyXuPsFUAChce5JmKLTa8zZuoAeJBVa0aOP4ZxuO9ZbqNkpAsmQ0oYGRXq
	hi673geI8ZIyGiDOQBkwTN8BQSqjwxARctQ781rKi9xmJrjLSClG+GIMyzYmLfnaf0qWNMxDokV
	jYmh8dflidEmxJG5H2K1VTVyjqo5xCV+z0xuo
X-Received: by 2002:a17:90b:570c:b0:3ac:8897:7ba9 with SMTP id
 98e67ed59e1d1-3ae8985d52dmr1762888a91.56.1793360539713; Fri, 30 Oct 2026
 04:42:19 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:42:08 +0000
X-Gm-Features: AclHuK-tK26BAq3qSwy7dk58hnLMShmnME05ES1MHznr_rkGJBFi7nJKvVCEwy4
Message-ID: <CAPj87rPsh_cVQWtGEisDrXWiT+Zj6D6n5wXpmbuoFvMKtOi7TA@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] drm/rockchip: vop2: Avoid DCLK source switch for
 10-bit YUV422 output
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
>         if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
> -               unsigned int bpc = vcstate->output_bpc ?: 8;
> +               /*
> +                * YUV422 always transmits two 12-bit components per clock
> +                * cycle, regardless of the color depth, which from a rate
> +                * perspective is equivalent to three 8-bit RGB components.
> +                * Force 8 bpc here so the bandwidth check reflects the actual
> +                * TMDS rate and avoids an unnecessary DCLK source switch.
> +                */
> +               unsigned int bpc = vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
> +                                       8 : (vcstate->output_bpc ?: 8);

The nested ternary is pretty violent; please write it out explicitly.
Either way, the equivalent clock adjustment for YUV420 is handled in
the setup_intf_mux() handler, so would it be better for YUV422 to also
live there, rather than mashed in with bpc here?

Cheers,
Daniel
