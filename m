Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360085;
	b=z8Nb1d51BGERo6AXOnYy+zwWVdpmx0i5JJfGnLOGafOLxxcX+cevUzZUz5WUaZ74eKie
	 JFTaiyHA5aYNFOquT8T7YqET97UOY80nWRnbKnVm/s6aZeSG7oJw6C1KL9909qJPkbtER
	 ShPp9DtMo9uR2iB2sHoMQBJDI+zZt/OXKq73S/eUxkdjsP2bogc0LY2YIBaHTc2vQe4BX
	 4zQXDjxNQha3wD8NnBmkR9/Q0UBU/sj7SQ2INkEjGF2CJPPr7Mvze5chgGcnfamHuD1At
	 MwB7hb0diGfY2IxTU4u9TMOtvYfW7ERqO+JRBMbbxw+kNbe9+Imv7ZStDNjhrTUIvPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
	b=iNwOu72qkjo9NLKCNqm1tdng/24Vpw+MODfq0N5c3UXNiMhWF9jkJMimme3mMNOIk5Qj
	 adf75K0A/DlrivfqMrXcfWi4zE6ByFZHHBVtI3OblYTw6aIVayMVuxM70z1HnCQzoakvM
	 13mcIFNzDyQu8lgpjP3+LA9PEDjsb85HQNgEDMdTFmcr2CDO6E5Jk+G7/5soNUtD/Ue2Q
	 J35zzSqSwMwR5M0GRiXYh4FA6CbE8bTs8hh9r/8usFahYmXIspHOl7G51shO3ZzFupiWy
	 gqFwogHak/uRdx/hfv8pIFGDOCmbxtDcIGMRBOp1rt9FAtSJFVpCtwp5qWWCinOs3Jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Qc7YhI7G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A7606A332
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03A7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Qc7YhI7G
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2eb18f4da15so2051455ad.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360084; cv=none;
        d=google.com; s=arc-20260327;
        b=l3O3+eZ+/NCi30wdmvpJaxJkgqLHkgKKvHmArdIk+GWatQvoad7JHP8cj0Huu6RJ1/
         u/VNrAueYz+GK/+LFeDY03P4IGGFtpKHxTVkVDpTyJ3f1Ay10lVi777mx890bvINlILf
         1FehOdwTCegV4Uhghv+enibrT2nQ2i55AkiTXNR1yBFaYQlmPr3/Us0renZXuq5PJKtB
         Dzx1bPxltPTc35Tr2TT6YHFUtGeS3VuQMnFtfAqDwnihr9MLb3vog+iJCkU6SU/hS81m
         5CicCMqvnF8D8DqvPuMY1TH5bNzC/aAf/lDNaOJbkAo5xaU1tF1Q79RKAgFZneAc5aTz
         Rw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        fh=c95jO4T+hY5ZdSazAVJQVSdUOQV5NjUy7mXXIBET+v0=;
        b=sBncevu8F2Rm347GMATLNZpfWaYEQKIdYyzpPOO42iGvIIp3jPKvRPEsEYnakTVyrK
         KtNrnvNPzya4FcsENLHiP5g6lhJ0Vursn/VAde/hws4yR1cf60rjp7zmdD7Z2OTw2SP8
         lA0kUIV/37XK7XtK9JiX59S81lX3ahN3DG3PHTTPSxlLNzndye9aMfZRoHZUUvj9G+yu
         pGxwL944eLutloeOBRQoG9tcBUsobAH6L+/sSrY3LVvAS9NupMXYmpF3zbd0a133BOcV
         M6ds3LQesWyBYJTtpzTUK1UPXu5RyJyhFFBylB65b1FeueHfzzjVS+Wey2YVaRrelt/I
         EDuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360084; x=1793964884; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        b=Qc7YhI7GyZx7JSx6q03ldciyyIpnGDZqIj3Q0iDP0b3f6+IVSx7+HnOdpxWYXk2UXH
         D0mux5RIUJTIsCqxy+hBeeC7tHFc8PMNtdYkMCBFvRR2O1PbZz2fjb0xw869cd6dWjrX
         1w1IiC9dzk16afUwDHsEpdrbzfaXCuvKDenTvwhrYNcMaWiD8myb4RlVA4ZNTksBXXVS
         6kDs+m635xpPmmoWcZae357ftgsxvnPBaQppXv8TPeJAW8bmK5KPBRTR66QXvT1rLEPX
         yr6QcL0li9ycEsf41YQjv+Ss4W1Y/9ERDb2doe8u+1wgTWuTU0joOoOo0Go68YYfDLN8
         MxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360084; x=1793964884;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        b=xTZ11FS2N/FXS8p6BlhYHnUYlFfYweRxuBgQSirdO9M1/SRv/sAp/V5kkdKNeT6S1R
         BPaP2cSIzz6c0AV62eIoOGHTWj53eN9awQsn9vt9Nw3mcEWnxQyClLUi6PVlkb3GAHuQ
         KVbuM00qJJQgBxuBrOptszshQBbobW8vo5hvfjga8oiiBax5+6wn7Y1lVy66eVgtJBs9
         2Dup9sW4tx9X7+gKKiUARtWNKwnqaDQynNfpi+Mqektkeph18Zp1NjD4jtN9Lm87+Uqe
         b/YUvjv5yzxlfqnn5ekJWIYhr/O6cwPsRh6NTb7Vhl7mghmcz+ykM+s5AmOHANorDSuP
         Kivw==
X-Forwarded-Encrypted: i=1; AKwUvBxnnnBATTEX/oR7yK+g5UuaVtzgaeFutNySPDotk7yVKE3SSYp+zRYAoANn20fw6QO8fb4n4UJQoCpH@vger.kernel.org
X-Gm-Message-State: AFq9FYK+DLTlIxF27m89WFmIcsQf3T7/y1nfBDnZtLtSQZuJ+HuS08kK
	USjsyJf1z0Wg3mV2KyShke4FtyyNLxN7qcstoTc1/TW8r3/TMI7w0qMmXXXOmq4QBP2Qqgg9pER
	ZKugomDm2zz5J666dOjNhng87U3M6s1AyEiQ7Eli3Lg==
X-Gm-Gg: AYBFou06H2jHJcNS8ZbSZZw/F1IBvggfSEoQ2GbRntonFwEYU3VUPfABj7PqMWaTGYA
	OM6tl2YFkN3rZ73/gwy+x+BamSfcVrYRdK66ZdrwEOkQkNt/uyAPEcZ4qY7FWyFkQpDx46YZiL7
	W4vUEbPBg67v/c5FQi3la6rqhqPbiTCKLDtmqcBJuFRhsqINvEu7G4wKDOTM+Ldjnnw1shGlCpG
	/UOQhsSgvZngoIhv2bZPhUI3NFEMSXjVdpGRLICKyM6nBGbr1AE50EomHHdNGd8ZHx39PhfoWwW
	f82DU3trZPLE40B7XGRBJ09Fn2D+eKq4WNOlGHwHt6BPdBpafO8rnz2k94YDVrW4/QQ0IXnb4Ik
	nzIURz6FRryHsZTFdwaRDvcIjczl+Ol6RDvBc
X-Received: by 2002:a17:903:384d:b0:2e9:9bac:2e90 with SMTP id
 d9443c01a7336-2eb3650d23fmr19334835ad.65.1793360084151; Fri, 30 Oct 2026
 04:34:44 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-2-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-2-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:34:33 +0000
X-Gm-Features: AclHuK_tphtpQ4KgZ6QBDW1MCkhoNuUykWSbAiahdSvtWRJxD3fhHMWk1DFCw5Q
Message-ID: <CAPj87rMYHa6NmiwC3DJ30fSLukpyNJdgRa-Ri-TyZTpDu2NkrA@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] drm/rockchip: vop2: Fix resource leak on
 vop2_enable() error path
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
> vop2_enable() returns void, so callers cannot tell whether powering up
> the VOP2 succeeded.
>
> Additionally, if rockchip_drm_dma_attach_device() fails, vop2_enable()
> returns without disabling the core clocks or dropping the runtime PM
> reference taken earlier, leaking both.
>
> Make vop2_enable() return int and unwind all resources on every failure
> path.  As disabling the core clocks is also needed in vop2_disable(),
> factor it out into a local helper used by both.

Reviewed-by: Daniel Stone <daniels@collabora.com>
