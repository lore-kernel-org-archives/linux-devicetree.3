Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC98E469828
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851971; cv=pass; b=E8QhC0ivo+frpNvhGxpVdmQ516VfP5lwr5tzgCzwZo4NsO1JJHApL5GjZgpftXbbVTyw+eyehXG8pc61QrwDpjYBxCzlmdowvNOpsGTcpQSZPZyGciSYrXrc88i45AmzRrGHrcqp7lumZcP1XAFcCGGkcdBUv9XXUrpmB0L5aAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851971; c=relaxed/simple;
	bh=89EaKRTuttPUHq+sVPSA7Zb6zcbSC6P4w6uUi6dNSdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPevoCkeuLO9S/NYg9q/GbJm3lC04p2Di5uo0HbckFOhARhI/+f/O8Cw0kfZeORMzVXuZqQId64ckri2/hccKEpKXhas/cu1ZutaHcVEQjy4u7dF9qgmQDyQQ8kO/Jopephw5X2hSGD6cImvLbt/Xu6c6lMu+5JgX1ibQEjRBvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNmMWIa3; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNmMWIa3"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so6919837a12.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785851968; cv=none;
        d=google.com; s=arc-20260327;
        b=PWz46ud/g+JGr6Qz8ak7pfJH5TltV+o5yONMR6Pz8GsOtHUZ82yiVokCJDgv0dM9gT
         2TQYorqqh7Dcraknq6DWDJlFLdKlmajfVOFqdBoYRdQDbvgMZTlFnlyadzV1Jx/qVDEC
         oKTzorbQ9bINtcqn7GawVN+y/jfSB/zTCty0u2oHXt8uljO0nGJg0Qds0MtEuvWt4mT3
         QplYVAFnEtwhYhbcBiaWW6RQe7TwAciY1RtpbdyNejhDs2L2dTJjKd/swPfq+0O0FbB7
         n4bjadCrzG4PVy0jl/ulISkaKIhRtMJWXsg3B55hZqW+shOjr+njy/svvM3HNN1FJTGM
         n0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=89EaKRTuttPUHq+sVPSA7Zb6zcbSC6P4w6uUi6dNSdA=;
        fh=ttIbdpbVoe/piaoDXhv8sq8iSco7JngjyV+VWGsGln4=;
        b=rLNm8antrVlms67dSTVHk8rvulZeywrHC+VQXOmn4pYRUs94XzTbZ1jt8g+39b1DFo
         gmiSDK14FbUTKhMlbBiSAGyKeXXNOhZDmnW5ToSFJNZy1glAN+dlJC6GnWrVcdTqKRAw
         sgKHG/42E38ZikPCN2ARSNntoew4+joxFUg3AAY1+6Vkspjro5B/euB9jQBiCGF6Vw67
         fVhPRhi9ysWxNXBDOpW3m7BfyC9HR3+9kh2S8xNVX/jhbJ7q+QyDa9+CCfgRYy2s5LE4
         71+zFt1Km5OQVt+BAIk8Vw/zmA5RwVMtlOGrSZNNhyaqR8mNWpKWI8awNbQIJ0GJRwcM
         5/EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851968; x=1786456768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89EaKRTuttPUHq+sVPSA7Zb6zcbSC6P4w6uUi6dNSdA=;
        b=RNmMWIa3L6sneRH94TfPlrX2UC7x8/2gIqDI5sO06LWhB12FcRtrMNryDnPdHEmg4L
         oDmnPwyyd2IyHI3CeAM7OIDzL+a9PSObzNpN0LrVkRzvUAO3hCyc1vArBQVFVrDm9nZL
         gWU300NVvjlpuvF+nyY4sY0qR2BpUW4438JIpvk9i5ZDSUC6EaM7ffLQHL6B10Qpsl0A
         2/P8RtCQ5Fl0MYKw2b8EZUif0bIwpIsCGwxunpxOVL+f/BXhHXeHtdQmCf6nLtGIXbiR
         Qd7FYh2PnPE2Nl5G+ADYIMYBTNKBci1NT8A8miUQJB88ffgYi5ND00swQ+KBOgdYOeov
         CQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851968; x=1786456768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89EaKRTuttPUHq+sVPSA7Zb6zcbSC6P4w6uUi6dNSdA=;
        b=lnS8SXz7nkIt7tOLQxuqk6oSAiJSSUQ1woy5lYkrPpKziwEAfwiXWkn3jazcocZb31
         mfUpv4p/xP5Q/bJdTfjbplP9V7N42N8xq28I/0GK55jkjtVl/VWD10eyoVIJ5jVVt943
         2cfXtNzvIAcBGVC8FXe4HOWTUQPmw5maR+R7zSr+sOv/AkitZ0qgyhrdSS8uWUwMh7ZH
         3IiaLOe1SBwcBhXuS3YqahqP2SFmSLNiUZvKplXImufKryEsNlxiM1rdijHEs1YVRo+6
         O6fxWscwgpN/jxZU13yicTVMXP4ukvD2P1NhZV4QrJ4ztJvM6JrijtT8rzewulVoPN0/
         eOBw==
X-Forwarded-Encrypted: i=1; AHgh+Rp06IoR71ezihe+5V2twdV8WbNEsYRNoyDq8wsUXSxIDYKg4H01mAJYtdwn2kXXuM+m49jiZAAd+elT@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJ8lM0HaMIlD8pt3wDJCkDDeb+ckINwROClQqz6nD4fZ37mQZ
	bA3diX6xKLx4SPxNT2Uvf3eptl4VF1oBuHq6u2NXmSFt4z9rT4ZjRwh5qX1ZOL5cTIREN2v4oxS
	HY6wefXgCBmzVTIbgAd0K3X+vfJTK5Gc=
X-Gm-Gg: AR+sD11YN53lwfpTssEmGNpQ06NDuNjpBhy6LnTjKF9tY8yjbmPcjmbRBEFKBloQvLW
	gbzAxWick4K/rE+bOMrqKfFbpxU6wwr7qHVdsedmjsiQvi5lUqfMTyYU8VGnCQ+ZLSfcqGQM0it
	jUoJ9PrOC1lausFcEUIl/ZK94OZGoEFheyQ8ow4u5bBmmRjHvrUYern1vdHUsdST/tzWlz+0OYI
	5N4m6CNb9J/OSYeEekSqZOMyqb48e2CEkLK5rfd37vdEha/JdGzyBnk4K3qQWDNwBHrvsZzasJj
	YtCcQ3RaJBIgg9tX6kq+9vOgKVCz22H3MAAYik71H0dk
X-Received: by 2002:a05:6402:3209:b0:69f:fa13:ed3 with SMTP id
 4fb4d7f45d1cf-6a0a7cbcff7mr13543404a12.16.1785851967781; Tue, 04 Aug 2026
 06:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros> <6rbjbj74zh.fsf@pengutronix.de>
 <CAEUXW=EHD1Y1zHQWE=jFhONM5Hg6TTc_uPYHgp-GS-4YWYJN3A@mail.gmail.com> <6r5x1q78yz.fsf@pengutronix.de>
In-Reply-To: <6r5x1q78yz.fsf@pengutronix.de>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Tue, 4 Aug 2026 17:59:15 +0200
X-Gm-Features: AUfX_mz3aSa6-cw2PyoYrLLjsrQMGpXNCxHpupxxxAIGNK-kmxelTU9OoI4pMZ8
Message-ID: <CAEUXW=FxgN9Zj-1eR2MdxMTyyKTMTUSYHpkcCpuvZKnGYJ-zTA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 4 ago 2026 a las 7:25, Ulrich =C3=96lmann
(<u.oelmann@pengutronix.de>) escribi=C3=B3:
> I think the issue is broader than upstream submissions. Once such a
> device tree is shipped as part of a GPL kernel in a product, the GPL
> obligations already apply to that distribution. Therefore, the licensing
> implications of embedding a proprietary logo are not limited to upstream
> acceptance, they also affect downstream product distributions.

Point taken, thanks for spelling it out. I am not qualified to argue the
legal side and will not try to, but I follow the reasoning.

In practice it reinforces the reserved memory path, which is the one we
ship: there the device tree carries only a phandle and the placement,
and the image stays a separate file with its own licensing, handled like
any other asset in the product.

Max
