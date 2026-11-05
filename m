Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793881495;
	b=UdB39XYFb6Rx3m52l3m+oKp/w5O69qZt5h9rwfnbJ3nofs+HGQ4rN2dpVCbFHJyH2BFl
	 1d1Rt27J3Me+ksrtOewR5oPdFvRcmeqYNSiq1gfDaSMSUtKM94tKRq5+hOwc8ebM/EiVZ
	 64G7fNWRk3BSm6LP49WW/1+VlsHTwvev3rVxjtRQDDh6SOE2LZJwxEFYQtM+UUBTFPNna
	 l6J23yJUUrcExo8D8UKWZx8LyoAt6gmYB1brkbhHKZjELv5KdaaAf9dGO2Ul0EkzmXpLW
	 AXzRMUeoHYMbs3ClmKGFIsYtPpA1P1+Kix/tQBWIuk27ZR+XRsVZEG+wjdj0Q5ZO8mQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
	b=x0N/ZQ3HWfkIK/bS7vVDsHBX8uOTtwm3pAcLEqLFfjrBiOMWjjgpau1tQx0H7RPK1kh1
	 uvNcIQ6UmlAR1Szhjd8E1OdA0ry7XdaaGsSy4rRunSLlynxfu01lmgvY4XuMeFWy9Lzeg
	 vZ4Td7zxnrvzKgc66YaEH5Q45+2JjIt22DQSGvmFH3jGrxkBP6uaQLSE2Q2wVpIouYOhU
	 o6mX8D5z+7nb23p+A1SYtNfF/6IGNJgKaOHZnf2tKFAJq+1/2rwQia01Pdq844Rwi2fcH
	 YeAh/PNVVws2v4eTQEjcS8+8NsRY8zce1xgMrkKk6DNgWwSgs/42Shd0dEfjsh+mjZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=kcBMmvpX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A543606A32F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A543606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=kcBMmvpX
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso906929a12.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:24:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881493; cv=none;
        d=google.com; s=arc-20260327;
        b=spsc9GqEsyoIso7ZYIahE0X0fM8zLHnwLZRanwddBpqCHwBiT90WSI087BBS1DIihx
         KFXX8snKaYFOQ4430EOpT7gEvH7GB2FBL3RzrrKJ3gS4sp0osF6R3BQgVSNu9g5ZMi0O
         T9ObaefnUN2PXFhH+SvWNZKQScfFzhFyDgbff5HJFO/AmU4vRoa8fBuvsXegA1qqbXPg
         5txy9Gdou4Rz6mGVOsqcIx69h3ciqh1oG4rv2U9GyZHVkvnWY8NVRmp7YJJ3Pi+uOL9x
         N8kNzyZmGrcSTXrXahpMrIPqqXUGUZPMwRElBjDy08q+CnNlBxmJmXr7YRdofnOdNtWK
         n5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        fh=I437v5sIlIjB8OLv/9R0FgCSVIFxqtySjL3JzwSlJLU=;
        b=ei+8DO5NSai5VV+t7bfAlZmVbecci+GJDnlUL/Av7YnAuGoIfajgpmy/2+9h0nPXE2
         PWFTUwiqUV8zC7OWCbctoAfhBqTPK1N7Y0gvxirYlX7qfNQfK6cxWFztbjyPolfX1h+P
         Xi+xWSbuNoWurZeqzWHXwi8w/O+0c2/29ptAUjkcx6ox6CPJnGeyv4nRoZIrd0huPGzx
         9MQnRwhrNIqzXbcqOVVsepChSiIUtmsqNp4GC4ezQ3hpdWZP1CTRCmjMTtT2wVRjKxxf
         ESw7TnQ1yMfi6X0I5jmGxEs13xwTY8YVDDfUc3ASGBMOM//2JAcQEGXnmyYYe36Qx+yB
         GE1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881493; x=1794486293; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        b=kcBMmvpXYv2CWWcYZ4Nq744oUcWjgh2I4EUGHa8dPAHmWxKBhzjwmkt9Omecb0hAzc
         ClsaOEubYRmaJAatC5fC4D9IHjJ1uhFO7Cce1aPtD+8RmgcPCDEvWckJL+R6ivDXfsuD
         RJtLn8e4sr59EZOrDAQX5lOmkVigUfATO6/o4gSrfEqCjvY5rrKOfVR2qOrXWO4fVmz7
         IJ6AnH23E4VNebOyOtuhl8mCo3AC/ETkEKr4UOaJqME4un78XRkPQbxOPXbbE0kgIUqe
         LAoIR6hVXczaAdGdRG1oOCZBoXm5pwZZvJgqFMA/XlaufVVhrixKhMHmstWrUpybBEv7
         VAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881493; x=1794486293;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        b=I/2Xza0wxfhQ3dHwtOZ+IPxM3GjgPcnM/02RFUUKsiZeBUnNOKQ4PpWgt1rFK8+4Io
         4tpaw4J/elKENis/neh27Od+JW24L02YDqWZc54imrnry+vIZ6XyFUqzMJzuMNAeU3rN
         cV5fhzLkC0OlVgMcpbGj7e71dm0HGzeJP0+OYLsdMVci1fdm1yjxV+nCLR2TTAqmWFZF
         GZfTKNxDXy+AaF6VAgDY2LtL309v5N914OOJvxRYxI+OrLoHP1nwXozdZAE1nrsd3yJR
         gvYwxidrRAHVhLzBG2Dbvyoleet+REXUlUooDKd1SARJboZFTGzmObHIbdSja9Zv0VMF
         zyfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXzqcxUF3KckdSgd2VKolognBaIdHkCoRBewW9DGmaz7P2JLQLgRvi5cO2B61AQfqkV5ZyOQqiA4BE@vger.kernel.org
X-Gm-Message-State: APuU4Z9zHvk3IvnJSkG/F22tOtV+3yiH4bJmBhfCCFFx2XkQ7tzn1+8E
	N4ceVcsgn40Stmh4Q4l34JDZCjin5ciBHL1vqtGQ+k6MeLKp8dSR0Ib2ryGpvyxXmG5sHqmlr4F
	v9om/V9wont+OjPdeX1Pnt4y5raOJ6I+OX0bbgLD3ng==
X-Gm-Gg: AYBFou2pwFtJcpqW/tT7cXspgmdsv0B5rOtqDjKhcIVYmlcumBDPLmNbcopJq66qa/B
	zFe9vo5X3bkmf1JeKcpv4GYWOIW7+F0gDzoxtyhLAdDx/HGNKr3ED04wVkUZ3QdKfhouHwi04E0
	uBKJOIhjxYJja37c8qcqPjOAOMUqq6A+nmE6MYXnLhSocwrQRw3dSlLKC6dnpK2uZjkaiEYp54e
	WFZeTAVQEFj5XY0wfpNN9amK71WrI2111CWuj/KSPbJnBc/5LrbHHlmIEwtdUdxJk8YRIUiJVVc
	EBM+ueFPaPHTO8AazUdycPBP0SgIY9K99T+6uw0fWKUbs23NSzCgWy3jvjMGNqcZnoUfmeeQn46
	H/ZxmBGYFCNIosinj6GSglxcZP6ed4vZNhO2/
X-Received: by 2002:a17:90b:5485:b0:3ad:c482:ae9a with SMTP id
 98e67ed59e1d1-3ae8957cc71mr15827995a91.1.1793881493387; Thu, 05 Nov 2026
 04:24:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-4-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-4-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:24:41 +0000
X-Gm-Features: AclHuK9ClbYY9N6f31xMjtm_H95iii7gcZZZTGs_rA5ccUrhMgtzVapBrsI3_h4
Message-ID: <CAPj87rOgPMc4_nvVj+aHK7qUEQBXCMa4OUHHC=GyYzr2Ls_Wag@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] drm/rockchip: vop2: Balance state on
 atomic_enable() error paths
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
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> vop2_crtc_atomic_enable() prepares vp->dclk and, for the first CRTC,
> calls vop2_enable(), incrementing the shared vop2->enable_count before
> programming VOP2 registers.  Two later failure points return early with
> only vop2_unlock(), leaking the dclk prepare, the enable_count
> increment, and the core clocks / PM runtime reference from
> vop2_enable().
>
> Since the disable path decrements enable_count unconditionally, the
> leaked increment skews the count, causing an underflow or premature
> shutdown of core clocks and PM runtime while another CRTC is active.
>
> Moreover, cleaning up on the enable error paths alone is insufficient.
> A CRTC whose atomic_enable() bailed is still committed as active, so
> vop2_crtc_atomic_disable() still runs its full teardown, releasing the
> same dclk prepare and enable_count a second time, thus underflowing both
> counts and, where vop2_enable() ran, touching VOP registers with core
> clocks gated.
>
> Fix this by reverting exactly what was set up on failure, and track the
> per-VP bring-up state so atomic_disable() skips teardown when
> atomic_enable() never completed.  Additionally, ensure any further
> hardware programming is also skipped within the affected RPM commit
> tail, i.e. in the callbacks gated by drm_atomic_helper_commit_planes():
> vop2_crtc_atomic_begin(), vop2_plane_atomic_update{update|disable}() and
> vop2_crtc_atomic_flush().

This one is:
Acked-by: Daniel Stone <daniels@collabora.com>

I don't think it's the world's most complete fix which covers every
corner case, but on the other hand, building out the tracking
infrastructure to do that, for cases which will almost never occur in
practice, is going to make the driver pretty unmaintainable. This is
pretty much as far as I think it makes sense to go.

Cheers,
Daniel
