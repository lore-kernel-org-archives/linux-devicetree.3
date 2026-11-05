Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889249;
	b=QvO5rew47hqYHaJoSTOC5RQQnzVYDg2seBNXkOyALiI/AbNJ9W56gtYU5aPK42jD2/PE
	 i6zXCpT8WJETXi4SzOIs/doJUKbZfyn+vQ0VTd6o/kjv6imajJpyTiAFNZ12BbBqTyK4q
	 QsuCLAdwq7yjeBAYAAn1AsxgJk9Wt8zlwEAeMcdv/EeDLh71NyL4c3w3Cfz6N67n4s6MO
	 lPU5u2qvfJZ0kNplOV2R1Wr96VYJZUKPBK5kwO89gKzhLKpdjt3tD/CllOSo128LzTCWF
	 tfI5+dmupZcsiFWsDRbbzWq2otWZs8R74UGdtyUFIpzF6yp2WNqUFPQnOTt60dF8lGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
	b=JB7my9k7uoYro6FWkKDTwh/1Gxf/rKhZVMViUNVUOnEG3J18HBuguZFT/Xuq+2dWim2Y
	 v5L32Gi5YcjSL4PehMU9znWs8G4q4bPo4pM/iph3COarM4DuGq+Ca7No/Xxg8A5fuDzgR
	 3looiPZsl8SRDyKppLMuFjgy7ygAckruy468RAj51XxAJRCE42uOofdbyUHJsd06kpP9Z
	 Bfv17ZFkZgIYPTsqbgZIWhQR48bWmsqC4a0MA6HKb7+0Qy5nI+lhwsE0/mDZ1epjJc1DA
	 W4CkuPyeOGBoF+Fao4Pw5FmWu04lleONuFmiR+okIi1Nmuj7uHQmKfT2fTPuPFJVEdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=hZn452jv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F1606A32F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 025F1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=hZn452jv
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1326736a91.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889248; cv=none;
        d=google.com; s=arc-20260327;
        b=GBi/yKJ6I7ZJhBt6HY/5EQb95Wt9XS05RxQ8BgKkysthpgmjJbY+II9RGp1Rv6s5aB
         CEtyLjZfczDkl3XE9f0MuwTYD8FMtr4nRUaNzDYtZcsm6j0QXczIIeeKk11KL5/rekGm
         0AxlWdcw2sI4/RPCl8pWjPq4H1VVJEKFXfJAoHVBFJ5QiZxBIAj+YiTdz0SJl2WzQX1v
         vKmBeGealiEwRJeOc0Cc7eAlwMb3TnPEbEJBIha8Sdd/7n3srByBUYljCpfAErH+Q8Y7
         QaZsNM8V3PTYFQNJgHHd/+EVyLvy136DzwWah7k2SSgfj2Sv5FrPTLsfQJr9SSznK1bZ
         f7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        fh=Mlt0YVHoidf+k8L5pGqzwW1CY/2OGcQ92VHsLNu1utU=;
        b=lBPEI+Ob03Fw6TgMm+bpibdfbRERz5QDulVH3ZcpSHLvtTld6HOpnRgAN8QmgNQH1U
         1M1v4hHGbgGEr+kmt3vszPfc9norWzTjWqxThcdwPN7vl5ItmgcPB++BqCpW5MOg6UuJ
         rPUPYspjXeCX0UJbPuO59NKIf2qC0DiTlnInsLz0WUJNunDm5OeABFxs2+4tcQsAKJBF
         lHxLfcv++Np6+uLI83q+TE26MZwWJ6V2br+DsGpSrHIhckyIUD2FuDKpCYrfkL0bDjRI
         jIGHakH6Nr6UcpGKab8EIDEUZNLwuqKSa8Q8z6DT29vkWJco72zGgTJmgpdHExJN5LhW
         dILw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889248; x=1794494048; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        b=hZn452jvEIQ6KXYQe6zz7/XEhlWEeO1EUuU3NlegSbQEq6BhDga8GKLHcqlBGo4jjy
         IvPJAVwJMzuTkngSG3BF6HmOv0WDodbZjI+Bhfv0+2ebD+t3JpUfff7b3RnvUhh0Zg7K
         TYPchv3GUX9FOP3c8mkdX/BvAqSZrqclbtEqG1Qoh849HSc7mBUrktiU5XO4ebYu16ZK
         Ud1rQznrE7F9xpQkbIHFShDNloXf8z4f6tPQW0NzMFKskvA44eadQL/9mAQW3HfuZRHr
         QTgDIgZUq2nxaOgk0gbnaLmpAfjk4FCa2PqIMnrgQW07YBpAUUBsvlNRVfik6KXzkXWn
         gcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889248; x=1794494048;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        b=YpiyA4QoDUOGXCfp9u893SepAMWNKKl3apmH8ydjDoCsn8UjLTiMeUWFdngXni+gzO
         tkjmfBfR5mGP+rxdqgSfxGDlUmR1cMYTC40C22eCO3FyT9TynKF+vxo8bwNRqCuv62kU
         /aS3MNCBzwRWMUmBR88le6aAS4dXYxa5uL31XRLPZZd0jT3SSiLyugRL6Skyy5yP8Ftf
         v6yXpAcW5FzshRYhIUxM+tD/qIfsiv/bUp2s1tnwnt2eAF0by1UR1gZb1lnqW6HaswMI
         0uWYWG0FhXi42Pk93RGYOtUpHGJNdFPCT2KfqVjmYn9uRY8F9Xht+0ED4SpY70mLC2lv
         mLew==
X-Forwarded-Encrypted: i=1; AKwUvBwNRHJzCPmHoJq7mPc8nejnqL2ajBmnDS7pfikNGikA84+SKg/w1J4hAKwNdq/PMdjqbp3GTOuQotPq@vger.kernel.org
X-Gm-Message-State: APuU4Z9yuGG45yh7sLgWUmoWWAGH1geLA9kYcCy7NA0EWy4kXIc77U9+
	ovOrgabMO4s+PwguaNXJuLTHnU5Gp83BU0NXLic+m22lYrtNoUOSIw+3FcrKyM9FzBdpzU25zqL
	cUGDWJtWDdkWQQ5M8ShfmU7eNkBBDrOQEJ4/KAGNDlw==
X-Gm-Gg: AYBFou3PzGi5DoYm9e1YkKjgCTyweaGuO/Hb1mdkQVuTLZt98vzif8itXm311iH7hZk
	cSFubwc3MdxwlG0K/XiT2mozpDgDsDWQcVni0BwLDXwjpciSsfaAtqr4OX/TwbXoOLWF5LRfupu
	VSlaoudykm/rQDLx155WvdzsZxO2XbFC2W2hW+qvcTjU9FWeR/iR415q/jKSsHs0E8QimrauvT2
	+U6W/BWuwt1uw7ArH1Ivm1ebeU8B58cXRbOixX/lADUKzTsx4DwsgUIKcn/URsLr1k9jGKkFi72
	I+aUiGZh/9/Ut9fZLb1yaF3Ww7x/H1VdYCwsxFKT+BbT2PS44xT5g2BGvSUhgGG1lXkC3BqfYQW
	r1cIg3m79NldZC0qfHovxocOyJMynS1l38nGRisA+Lzd6mzayza1CKRAD1A==
X-Received: by 2002:a17:90b:4cd2:b0:3a8:a1f6:3b32 with SMTP id
 98e67ed59e1d1-3ae89772b3dmr14182837a91.38.1793889248197; Thu, 05 Nov 2026
 06:34:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com> <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
 <7b86ca7f-fe7f-492a-bf88-0ac7afee3963@collabora.com>
In-Reply-To: <7b86ca7f-fe7f-492a-bf88-0ac7afee3963@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:33:54 +0000
X-Gm-Features: AclHuK_cuDuuWPdBNDPf4-o5prQpG_rTSQHgkH5hHnp_VrKYmgc4urnB9GsSVjA
Message-ID: <CAPj87rMWa0wyopX6D2dUSYLXUYS9wvzVUFeKUh8coTxtF+Jf6w@mail.gmail.com>
Subject: Re: [PATCH v6 08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
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
	linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 5 Nov 2026 at 12:56, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 11/5/26 2:18 PM, Daniel Stone wrote:
> > I'm confused ... if we have switched to the PHY for dclk, then a mode
> > switch wants us to come back to the CRU source, don't we need to
> > reparent to dclk_src?
>
> This is actually done in vop2_crtc_atomic_disable():
>
>     if (vp->dclk_src)
>         clk_set_parent(vp->dclk, vp->dclk_src);
>
> Mostly to ensure the PHY related resources are released when not in use, e.g.
> after unplugging the display.

Right you are, sorry I missed that one.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
