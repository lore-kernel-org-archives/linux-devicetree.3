Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793361170;
	b=bfCKCIpfu0pHsMNXaqcoeQQUieaGLii2ZeONDZ0BPF/iRc4e5mUDD8MgzTnvOz/Msj7O
	 pfPBq11MzePd6fTMrJOM2qNChkiT3Gs8AgGzIgp0re+WnPJz0NXIy6dZNH+eGQgH5FvHp
	 uhijWMEUhf8DciZpW9PZkdh29X5MC6PnQKCGz0umvrYjv3ANxIabhUKe9UUhRsxwe7Ai6
	 YSo2l7KujLv0hjrXeD2tPjdtqRcs9Pz1oy2F0MLq0GFZP1Sz1AWACYrUIScNbPa7JNYqg
	 IpZ1LYjvQUZV8a4jUQ0iVYHxnO8MK8LzoTDEWcwW4Pu7Wcp6EehdvDLFO1kCJf2aHhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
	b=a1rJOceSOPBtfb4K7hZ+NVM14N30MiawYMc2CRoNZFEcxa/nHHgeAXkuD0bbC2vO/pTD
	 QjMDstkgg0M2DkGHaTFye5MGBkT1dCssv4HX1vPtxdTdXfIVGmV65wcpzdwpkRWDWS1Yr
	 C+enYRGulROb5rrMys7Wbj63gAesdOiXhSvVopW5Sq+oOtYotZapNsC6DQZ9PAj1mpTo9
	 mgThlFbBFbaqTrK42rF8V1//WQsCAJKtbjQm/scbhjrkg1HOKR6s+RigNMBbVGPtoWGVW
	 KuYzkQTm+PEqMifgZ9jWkOnExetMkMUACUO1qto9LrmDztVOwURfdBkSZ7qspH581Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ikS8efMe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23509606A324
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23509606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ikS8efMe
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so358342a91.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793361168; cv=none;
        d=google.com; s=arc-20260327;
        b=ozyTMToY86+1Bk+ndOHlxYO4uSPsXo3NfIi8K16jrKpPRb17kXd0wv2kRW2LE9cRic
         Phmh63oMbENtvrY5/D3hayj8iEo4/+m/m5cEIcwurv6KKHzTuEu/HGU56NXKrkdvJhT3
         ODAEZE+WXnvndleaXSmWRsIG+su0X6XznHYLlhPzAzQQErx2H0ytYvMGQoAahFszoaHD
         Gea4QmXfc6IXeT/TMHklNeQmG7ccMK3LtBwo2SLhWH01h+4iLwmgOjizXYmy/3SebBLi
         /f0/RuZLhVDsz3rfvNOInIlbQcm9fVV4l2htuyZ3vSeo1WHgGiNltNwSrMvP8f1pMn5M
         wEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        fh=bSQ96oqFEdSGEQ9Ohx0hS9nUlynFs6Ce3UphswbkFOQ=;
        b=dB2Uvfej1/hW3vfqhdVyh6dKThyXIf1DF6YL96SwuJoAoVL7Zg+zL/qs0yMFcvsZty
         sCAtsRyZRexQUU+BqF/8MkLb3jRXpo1litpkOZUkTNFJB5Av7qqdHM5yM8utN82vDVGk
         QGf0SQ9/fdp/1k0RM08gcPkn5Xnrkt2vcZ7lrVcU1bLidWTfvrlICx6JLCBVEfgEBeGv
         McAq3Pee+KjYsZKUARhW5OB33IitZb8CPnFbb4HzdsJGmzZyWA2B58MtUY6VLlNfxK+1
         wEquC4E6wUSKCUI67+8n6B0LU/n93f7yjp2iFeNaBi4QWwXnG+AXcuTlUwjrZkCeMBXA
         4SBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793361168; x=1793965968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        b=ikS8efMesq4B/ME3qWtqEYqBkQSvUsXOHLf77ypjvSGZYuR/7NhhdoZP0VUSKtkQSq
         IYzshig68b62WTRkl+m/DapkK4kUNB77GbJYl7Y1xQrgPOE1vCWa/m+EtqKlcX+axzLN
         xsPlFRSWkvDi/Ia4J9eZ6ByBGc7UgIlSbhu2glWOJk3SFpmeS4/8YAQmUyNuEoIZqqa4
         xuMKUMCUseLRrcyITmBHdStMNw3qMkQaqJL4adJfcmpvit2IBNgoBv0ZG7TVIfEoHyo5
         ff+P/lQUT9xMWCSYuOZx6owYgW34Ae5rIhmEo9TNvkcNSiOOEDJnlAsGCskSepkdpMEs
         p+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361168; x=1793965968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        b=oYKgitrsGWgrWvIlC726OzRRjy5B59j7W3QRHN0ggkOZxPPQX68WnSOVoGCZSP1cWL
         loQeDquheZrdh2KjEI6ClfDA7f2EdBn2Spqs4ruhUtdD6kdrjuf55N+1/zIpkTG/CZbP
         YNKrGXh3UVMeDCB+gTFxWm9HpHeGMwz2eOgy12PAC4smJVWyve6lHRLMUeAk5dcjRQ8F
         01Bm4fPULBiFwjmPjwPO1NSBUC2s4qL3jWovt9QqnvmgBLNvQ2aO0XQQZMxDxaOI1y0Q
         /x+86tyR+wq+kdqg1AWgbBG6lirJclbTjP6UqiHg03HH8dp3T0qxo5NQfoyPWhqgk1KN
         e6Hg==
X-Forwarded-Encrypted: i=1; AKwUvByELVBYP8QDshwVjupS3tCMP751nuBXL98Q3om3UTmDZ68y3XVqctkLjTOekasmFtYz0KVEfdD6DXtD@vger.kernel.org
X-Gm-Message-State: AFq9FYLySjDMqO/0NDaIq1KKXNxk4BpfuQOgJc0E+OZSi+L/wGASOgjf
	byquD6ZZtO9wh3BjkfJF74NpY7Ns5n/GFCzO8bhlFwAXaIAyNGWuko5vVYOTCV9ra/h6tM9QgYg
	3Q0durH3pTEudYOQrLyxfXmhcmEiP2vR4DDdia7t6SQ==
X-Gm-Gg: AYBFou1qt3zWNi516U3NefHWzMD7VzJwkhG01oOaBV3e2dKJzIjQV7fbuzHLOBDQVpH
	+9qvNTNmJ2YQpZA6aooMPOLVHPmYGwJN+DJ3RGnKhhjRLTOrEbXIAAdHnlITrs5k8w+5yqAZB16
	0Dj6jKsajBGq3TNiKA7XLcE1kAyrjR4WnOFY6e1lTQ26b6TIGpuyf+yAVT5Uebh8SNh1OBjI8Cv
	Pl673VbhBA046tVD5la6l5IAqdU7jcbi61GPLo2zprKSjIcPkJdyH4q+bnOCSE+h1cqEJzP1/FD
	NVGqCBeRrmCnsGCt8xklZcFyHotXIdZmJcnNhA8bLvYdsD2oR7oMS3HLy6oIdy7t6mk4Wrke/bs
	NlLhv4icbWXSILIn2BSHkWo8A0yN3gM6YpCCA
X-Received: by 2002:a17:90b:2f0f:b0:3a0:e568:ed63 with SMTP id
 98e67ed59e1d1-3ae896d7af2mr1070361a91.8.1793361168540; Fri, 30 Oct 2026
 04:52:48 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:52:35 +0000
X-Gm-Features: AclHuK-idMrAXuG27Lf8hdgtB5yVIMARZUjc-ne4rm8j_v5CZmkmZ5d54vPJbms
Message-ID: <CAPj87rOMjFEjOQ9TVgbGWu3gTwVjmjuFNtnFiyxbWO+g_RPqeA@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
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

On Tue, 13 Oct 2026 at 23:52, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> @@ -229,7 +230,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
>         }
>
>         phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> -       phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
> +       /*
> +        * YUV422 always transmits two 12-bit components per clock cycle,
> +        * regardless of the color depth, which from a rate perspective is
> +        * equivalent to three 8-bit RGB components.  Force 8 bpc here to
> +        * keep the PHY PLL output aligned with the TMDS character rate.
> +        */
> +       phy_cfg.hdmi.bpc = (s->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
> +                               8 : conn_state->hdmi.output_bpc);

Same question as for the VOP2: why only special-case YUV422 when
YUV420 also needs special treatment? And presumably in a way which
can't just be mashed into bpc, because the maths doesn't work. So
would this be better off being handled as a separate output-mode
adjustment?

Cheers,
Daniel
