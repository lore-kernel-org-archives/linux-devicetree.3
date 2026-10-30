Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793359304;
	b=2bv6zfo5ibMrqw3rAL8oAwjaI+b7KpDNY93MMrzksXiY+ATZ/nRvC0bTYKHAud7XM8va
	 H5ehxyD/Loxf/fUfn5aM75HV6DTobfipwjxjcIq38D+30CL245X5D8kjZ6CxUogG64Mv3
	 eY0FC4L/t4qHxZABhxcgs+wrG1tA2iqMFMCpu+X3POt2O1EnuD5bnmzoiAxpyZKJL2Fqz
	 1VYKK5nx+Y3jIcBBHrKe/KsbWBTkkELzb44facX9lYgE0D3aHrtHdgB02HT9z8a0pGQ4O
	 ZAtaHOeRILAerPeLwVG9XcQl851Io/axOlAwzZ5RLjsrnT+JM+bjT572mI6h3Yak83Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
	b=J17Y8TlrTcnt1VjcyH2Bt7dwMWMGjUNp7SX9Dt+KMhVoN7A/aqsLqbtrr0EL3fsEXDv2
	 /NZhTrsRvSHcTwr2aSiAsLblyer7db+BLJET3u7J5oyqpOSFYxYSOFeE5Jr+G3RN6ossK
	 OSLLVVH0+vh8SSPEKEvfyuxULFp2PmoNkMkJ+fnDozfp2T9rG9HkNglfDFJw2lY6oY2j/
	 dXYDujYCu3ff5MlAMzzR9Aduw6913FvxkN8QRUTiIvOtEj71h8tBEg/WXbsBOmqD8B+CO
	 A9kO/PC7c9MoiRQk7jQSZssI0IqSqSgWcPhuTmX1dBZTLUBNM7sysjyT6lCwj2XftIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ST3TiZBV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDECD606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDECD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ST3TiZBV
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89d6bd67045so315662b3a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793359303; cv=none;
        d=google.com; s=arc-20260327;
        b=PMHL6ujFuSV72Jb7WPiDGKDuJNaHJ/dttOGOLgRTNgER/hsAGiOJChzuGxuDPW5kUZ
         WXI8SSR6/r0lPgCyumu0MxgiEu0evT+9ztOH2EdFiZjlnD0QUnc0pCTM7ADnKaGey2Ci
         8L8QvwA6wKHW5Sim271x+IUP0GURkmM0MnYMIlMfFxDnBX5RgBy6+PFINbHkMpL9REnz
         Ei+WZ8YeQMCO7hNZhw0o0SWzQ8xE0v8mTwwKlEiJ2cuQVnNCA379jvV7MfMdxofaMDgg
         EeF5Q4bSbNDo1DgdxmJ61KWBdEGpXHFu96pEqOHM1u3umbPb7g5/OKCs207vfPKRcwAl
         9IoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        fh=I1jthumICffGKJ9RrF0gewpfj5Jicfs64rfEV/RPTSU=;
        b=YM5O/tazduYInSKhur4oITGs+KMtO9LXxZEykpwCh/nsN82jqNxIF+ylgUhjr3XHIS
         p4S8xMsuS1dtd80j794Lc69pZ5vXzbSv53MSdJ6bt+nHIdMGLLvPyt2kFyi4QOlf95iK
         IPwgGs5O7TERHlsLzvqxuWUgCnLpmsJZD8ZDKCerTaUK+rpz0uwrqcIMquq9MY9EA6Yp
         /yJDu/K7mhLbErTXOGhnes+wQ5cf9bD3wb1RiuXp5iV0GC9V2oNqiXSblt6Vtzlw2b7g
         2KsFLOzNOmmq+s+dMnkfeEjMHTFoOcKPmqAiIAA8SMt0PEhnD506RPKDbumGwY4ft/ep
         LuXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793359303; x=1793964103; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        b=ST3TiZBVYOQ3EPnlZadMfv/II96obcR45eIj4UK4HcNzxNShEHyAS48R1hFH9o81Ph
         fMSni7TQWL8TVQn+JDrv/h+B6WRS3LQxQmJw+x7/UvSKJLllNHaZ2fZdMQA9XnW3RfnP
         AkgYYS4DHVlrogob8pY8CpohjE57tGcT1fC43Z2aBVQz1HrSkL78ZNG+wZKjyuZ7Orv9
         OZhK/agd8JhQvpGY3XDAJd5+w9oJ36a5Nz/ZPW/8+mvXH/3Q60U2Ft/0yTqfk6cslCOm
         OWJ3QWJX60qysCjeRDBKSizqo1I5ARjWy4KwmvLsDtGFW4//80z9TNjKMPS0yog8YjXg
         JDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359303; x=1793964103;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        b=0SD2AN8ND8qRjrNoqH7D8fs85snevOsxsnwZP7l4I7FmasZV+ZT4AcTXw6xE+UHMI5
         CE3pE0SABoQ1K02izg2qyt7Qrit/e5qF9wBmVm2bdyd8Y0oTRt4M8YsMt7LAImaOBlSq
         gfGt7iKZirP8LPKBCyjr53T0LTnUYHAyeiDXT5F5LcOj62MLTyLm0xaIXFpsgjLDjpQs
         BK0lzBK7F/aNPvziOYKy/ZEqI9bMFvqAzN4GbLVY+gHxTcOV06s7rjLjsdWGiM8TMMyk
         GwNnrF2C0oBwV5R0qIa5Tsc1zFPLSkySHSzHmEQmbeQsi8Vty4hjEDZzf9eFCBfM7kTn
         Psug==
X-Forwarded-Encrypted: i=1; AKwUvBwSwSrcPk9diQt/nPG1cb+dPFUvWU2PvydZG/D9XACzs6UFO89EgwBFKsq8k3gHKeKzsfZAYy5px9dW@vger.kernel.org
X-Gm-Message-State: AFq9FYKx2tE/KSsacODK+93BtNcRDacM5CeVwAqGRnXOyAJKrN0c9TEk
	Kd/A9Ow/T/dLsRvOkYpKiNF+3F2tpLAil3iBsAozd20m+VFuORudCPK2SgsI2jN7giohXpUUfzv
	ww9OcAQrKn+G+teoz6gVj31FnbwUQvbtBW2+T+uBcrA==
X-Gm-Gg: AYBFou3tuij52RUa7i4jMtCR9Vrz9x+AZyxFSjX3Rz76qrQQrfYIUO3RuijsjkuSdcb
	MZE1R/9Jwdk7hMJD84bJ07B9/1pst6kY/Y8VFZJI2+JCg2aNQlOyRYxbMF9No9YMUnomQFLKmMn
	a4iDeORiYh3cQaj8fjkNcIXRaWRL/b0Mz2NRaTJ0w0jrv1cZLtdG3a0UqaeW0SmRbOshPVP+M1t
	8ynpOG+VsXs6m/kFAzkxTAyDk/yfi9J56LzRkTsNZB0jY4yWjF3T9v5UGVVZVmReDbQa1gRwvH2
	4eOmf/Nl/qSmVA3oFHfT1Zb7RdqQc140jgxP2caogsywYn1mBMAuTiX0U79DZACY6tughHbe+Yl
	1192HO+YC7IPncMXV/kYlSxgRUra6tnUCb4Uk
X-Received: by 2002:a05:6a00:12dc:b0:8a0:18bd:ddb0 with SMTP id
 d2e1a72fcca58-8a9bf71b34fmr1264612b3a.26.1793359302995; Fri, 30 Oct 2026
 04:21:42 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-4-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-4-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:21:32 +0000
X-Gm-Features: AclHuK_sZpu_OHKEsqb49igvHOjsFenvWY6XU2UJTZwHMq2AAjoVYXumXoLt9p0
Message-ID: <CAPj87rN1rzjDMPvVJytwmvHGipCCuYOyX3abTRqYp4Vq5PyrYQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/15] drm/rockchip: vop2: Send pending event when
 atomic_enable() fails
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

Hi Cristian,

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> vop2_crtc_atomic_flush() stashes the CRTC completion event in vp->event
> and relies on the frame start interrupt (VP_INT_FS_FIELD) to deliver it
> later via drm_crtc_send_vblank_event().  Since atomic_enable() runs
> before atomic_flush(), bailing on an error path makes it skip
> drm_crtc_vblank_on() and leave the video port disabled.  atomic_flush()
> still traps the event in vp->event, but since the port never scans out,
> the frame start interrupt does not fire and the event is not delivered.
> Userspace waiting for the flip completion then blocks indefinitely.
>
> Note the event cannot be flushed from atomic_disable(), as userspace
> waits for the completion before committing the next state, so the
> disable does not arrive and draining it there would deadlock.
>
> Use the newly added vp->enabled flag to detect this in atomic_flush()
> and send the event immediately when the port did not come up, rather
> than deferring it to an interrupt that will never occur.  This also
> avoids the spurious drm_crtc_vblank_get() WARN previously hit on the
> failed enable path, where the vblank is not on.

I really don't know how I feel about this one.

atomic_enable() is not supposed to fail at all, hence returning void.
(Obviously, there are scenarios where it will fail, which Sashiko
keeps 'helpfully' pointing out ...)

I don't like how this just papers over the issue. It turns an eventual
WARN on vblank timeout - which surfaces the issue - into a silent
false-success. Userspace just sees commit completion requests arrive
as soon as it's posted the commit, so it keeps on going on and
everyone's happy. Having the flips time out is a messy splat of WARNs,
but at least that messy splat points at the exact issues, rather than
the screen just going black and userspace blithely trying to continue
on.

Cheers,
Daniel
