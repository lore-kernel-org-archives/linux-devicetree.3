Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360110;
	b=5b+qmTzJq6ELkSYg469gGhapTj7wOwYjU7Aes3JpC2jF/lvqw9E5n6NdjRHPwOo+gK1G
	 q7IDNYAyPzD7neyF77QLC16nwvjunt0VhE1toqoc2aJGN5EPGLShSAhNVhr38bSdjJZ1e
	 n0fKZFFwYJUEcWMVy3v1zRlwECercdGtordtFPUtp3fE2zCakXvoAN49oozL02xudnvSU
	 aGfcQvfuM7d9UJMi98vrOs1x2CUkxSC8SHuXpFniWqc38ckGDAUF/uwzp7qbe/pNbj9U8
	 CLTjndGv3uPCYA/eApuscDZfwk4gSUS9Wuwql9jsabGI1BVJW1gVBMwF8xbw1lJ5ybg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
	b=4a908QHXJ40um54T+dtoAab1PtS4TukzITGUUzg2n8iBEATbPGIc4pagyOD1z/5fEG6y
	 8zBZva+P+5Bhyela9tMt+f2Y/taA1YrAHjeT3b9RgkAReb3MXS5Qs64XXCE4Do81p66Da
	 VtCEWtMKVyrI9gy6zAMcamSDEE15+HDZeIo8lOFSbLT1sOgCHo5DkFEKjnGhj+Y2kKfyO
	 T0OwHhi9GdwY11ngczCTKj5QkJ2vkyp4qDIBIyrPxf03Bgqq3q03Ua8g/xZVhKSAPN3Ff
	 WL3VRIMZJvY+jUnYQvPJUpv8SOPsbk6hy/F+EJVHI5QVihSloTWSeVuaRBiKcKQehpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ldolOl9A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF86606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF86606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ldolOl9A
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e987b4a710so9379485ad.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360109; cv=none;
        d=google.com; s=arc-20260327;
        b=sBXyn9DMKn02B1eIw6LbcJFvvo1yWi+9NA9VFaWORnmFyUrWfoL8DYbpCsKAKQhNKA
         ZW4NT0XS1KNH66OmZk9xu6I1787a6VJSskT6pPTlwVO1H0ps7jM7TLHcykOejt1HmPSQ
         c0JmYD8jltlJ6YXF9l7RRAUWder8Zy8ZTEX5qBN0H6/Eamc6KRXh2bq2FcricbIQvCYK
         yOvoaP5S3DJib8KTiX5faE9gjlXazYfAm5aUrKPFK2A4yypJmzMeXODfgHVgh6RA/ycl
         xtBGXSt7siNWg3n1Lo3zAHHH58C1Uo2HLkAAKYYhTuhqOSJSrTtgSxguJziAT3C5HhAF
         ls6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        fh=g84x69Mt7hXojxdF9rTXMNJbkQBZOk6Z+KhY02Locyg=;
        b=XVLsi0eIF+PYwnQpecqqm6H6wmtN3ZrZSOVhVGbuWHFA/5Qos8t9p1xmy2GglCTmx5
         ealxtKZtNOMCRUOmD7xQ9GkdBKHb1oPuryde1j3Ow6oI4e9+fj9Ep3zcrNBkFB+EOtes
         vAjBLyLz3h7mRJBcKz9A6cSgVWLI/g86wv435ZrxjlR0vnP5NnYX9bzdtaw7GEzVH01T
         y+H5X/w8f7E1nGNYOwcDD9s6HlzDGxWvAnPaR7lTJzUesGSWuUCk+5EwlCJs9YsT1lO6
         6lPgp+aOZP1C/JeWDxhhEZjt/NDhpA3jMzCouNwTmC6gza9EavdKx0w2KpzmmTe+JZcV
         nb/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360109; x=1793964909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        b=ldolOl9AOPnMjboUHQyiHZHX+dN9q//I5UUP5LiPJ2MYzVNk+85iKZSZiye6YuWhwe
         ChkYwk9p2+y7HBrXs0SJookBPFIVxtgeze379O7P3RdB3I+tkq/n9WKdykB1DNCjgXna
         eGTudvDN/wUeqRspPJ4yRu8SfGHgid0A4Ahqq6fx/P9mk9N7rQcrlzvGaHoWaBVRYFqf
         NXGvouzrHARjsFCu5U/s4OjiM0ssINYb0GcAC7IjrUUQ9+oGLgG54YRoKWmXiqmqk08Z
         WBplTw2avfGzBfpfXoC2s6dNxQuJW3VFU7KOTeXfmwffuPPB4taU5XBM1MSrloGsGGtg
         xfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360109; x=1793964909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        b=pE2LG346qBeQuoS34GriFd557Opjj0OSfM0sz8Fpz67IxOGLC8iGFaBpJiMUMP2n9p
         SlbHPzW2ffuo2XUkJz4D3F/PEIfgkLBC8zjejrlYg1xr4nRQqvxGN6pVlPe4iRNfGIQY
         m1xHH6o/PIeBXoWvMMOCKYqWKRh/u/6Tmk89+XXnF2+w4BeCXJfLW34woJ1nf63SqauC
         wRhrl2fPUvHfcxHBf9I5UXXYG0nPA4MxwUU0tletXcIRtIqNcN40lNKqaULIIA8xMtaT
         OxukH3iDGxbuspMMZTseBQCb9XK4yXwpjDEPcM0s6yZBA9XCFHWFCgxc7CLrhADsW0N4
         j29w==
X-Forwarded-Encrypted: i=1; AKwUvBzHrdGRKHku7973YXPYQnNu8OvKnYOeD52/NTSjygRF8jwt4d6uOl2dLOzwUtPa7g9mWR37CCD/UIW2@vger.kernel.org
X-Gm-Message-State: AFq9FYIwkCEB9e3NyC78ZLklGfihkw28LV94qgqBkcgfrp37Y9XIOoeG
	UZicNIrljRI2c2ip47zuezaP+VRVIkhk3NBpLWw8HoQlI9JnKIcbT11E0hZHNB+4+2VTiEu4FdB
	BNF4NsCUI3TFCxNek//gENmVPVwxNQLDqsJ+N825rDA==
X-Gm-Gg: AYBFou0WBI2aNg9sNQpC8h8iqwbZYiExTy+rEEG0jDnbkW28fM5id6BnKjoeNE5v4nA
	cGgvR4xP56xyykCZ9Z7Xsi1Vps/2ARvCE2JP2A5nO6zwIW7h5mSdOLO5tkQ4TDLkxnq9RR1GQwq
	uZ4lqJG8mSCuQMBEmRUH/VaoJE+N2N4+NSqodLqL4ZfQ2WsIeFvlYKjZhyyRJUr7RC1f7HaIFDY
	Efve12c8Wz7sPo9z0WUq51Wpbtf5x4ntdoChdj2cIoXMPGyCUpFvl4shlv8hpE4V/BiT5Lm6CCP
	s7l/u2usAvLO6fPtm5J6vM7sAEP7F50rNagmeN0/by2tanzau7Ln8Eb0uJEoiJcTUCBjvjJTgs9
	pF3tNoQAs9a7rZ5WjpDBNKgxCbAbzoy6B5PKw
X-Received: by 2002:a17:902:e549:b0:2e5:41d6:178c with SMTP id
 d9443c01a7336-2eb364f8d9bmr16400675ad.33.1793360109306; Fri, 30 Oct 2026
 04:35:09 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-5-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-5-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:34:57 +0000
X-Gm-Features: AclHuK9zIGd0T_kGXOKSuNwCM4dWmBNTN1uB9T4b5-OFaEClVCp9NkMOArmh8_E
Message-ID: <CAPj87rMh7_Efefe3D7DyOFmMiFUtBYdC8e6EXfJYzhEu3DXDyg@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] drm/rockchip: vop2: Avoid division by zero when
 computing max_dclk
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
> Default bpc to 8 when it would otherwise be 0.  The resulting max_dclk
> value is a don't-care on the non-HDMI paths that trigger this, since the
> encoder loop will not select the PHY PLL as the DCLK source there.

Reviewed-by: Daniel Stone <daniels@collabora.com>
