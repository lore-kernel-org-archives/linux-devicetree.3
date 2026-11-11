Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794395893;
	b=3tD6vJL3UHwkK7tAspBKXf4UnK2nvE0P49C2D6JZEo1LwJk1cNNpVw9V26xQhsNWos9+
	 ySa5qNJb+v6A/L3C+aBeJE4GjFcJDTDjTTsFo21JHBNPfqd3S/+IS+CC3PcePWhSUX8Ke
	 IN0e/YjmUxScb1f3HurVdvvYerg716SGTpqMXZflY2WvAVKE7BSe5AyLQJyoCVCNWnluo
	 kSkpGyQN7gJWQ4h1KMotFUk+uuPxNvQxYA2boAoi7QjlS9fp9la/xcakQDjK9nRrMbv6Y
	 Jmjfpm4vBIqgpp7HlpCkJfxCl1sG3hrKFFJvfdyh6poe3T9ANQQsDcRSjcnU+vMwLgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r1oyng5HmTkXJYBOjO4xwXQ4nKo/fyLrx6V7oMlvY/A=;
	b=5psE31nDVmDpXSEYTJDeVihVhlQPWczGm9vTSvgkNFfbqTgOjUFCzlg7P8G4UUULVQ18
	 2uuIsWr5Rid3Wdqp1AzhuRS9NIWnBCY/3go8YoMkcxV2Z2KPoKPCyOzyJyMRCVjGDuBO3
	 QNSIh0TI9pkbAwO1msgfF0CX/CxJ36JXT79qkXGwDoJI7Zsg48ORTjwcy9qIVkp6pSaNQ
	 72fWgLu8o6iLdev/fdnBCEiBjepPeEB/yjN6JutVZ5q+ypvus238NT/VBsbCHlBlzUJv5
	 t1lI2WOJ1rLSRMvWPlGydbxQP0sroZMXbZ4JQ8ZFjMhgImwsLYXm106FN5plDI04TEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1dKiKMF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC82606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC82606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1dKiKMF
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f8cdd30beso5257535eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395892; cv=none;
        d=google.com; s=arc-20260327;
        b=KXeV/6A636dfRmc6Lcghq+vX+FbQKEeiH1tGxLjN/WT0ziHvDA3i2lc1oPnVOlr5uH
         KpNapIC4iPdV3goIlrJZgvjwRdMS9YnrYljQpw5qFpORgE05Tf1BoigLhBu5LYC60vpL
         pKTOrilxtBIwHfc0k7NzcQIlKhFpC6lX7/dcIo+MlGXhsgrsgPghCyvLl+j7ln3JW+3U
         ZmYr5Vz9PdCGoYhREJyqyp3WjBuVWyXGJU+45pnV4rdXPWNgv5Gn5xogVKfubPedv1mu
         pbcCJwL1lM/gXb6as4MJdtzCy/72S66UjfJq+Dt0+/E8Tq1hfToHEA0XYptnoDYooyUC
         qo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r1oyng5HmTkXJYBOjO4xwXQ4nKo/fyLrx6V7oMlvY/A=;
        fh=i78u0FIDPWzgxRZHg0uMC7NDJPjLI0fFQKpONriRQ3E=;
        b=Rfcaf1T8UMe2O9krHmRsiw9fybUHboeBPyMXXVT4iknQb95bRw+AhpMT6lR/l5Vgmh
         f/WdnTTkyAGckRBhgnZKW2hy+bZpmt2tcfhwilhdegp86liAoSZ5RC69S1t6MRpaYh8o
         TMersBHrWPeFwNgkAid4vZeV6CKBBWmFxnaok/x+fE44nemIREfSECTEtdKC7VAlULtK
         wodreih50enX7mXBUlk0CAc+ZQ2xgsNWxTqbKyGgqYwSUijlzMKr51W+FSMT0390Z3Xw
         NuTBnk3GjYmhjny4rnO1Z0VjVkCSHo+/AYBuKRo1Fq9jU4UO2lH4Fcjn8TdDjLNLG9DB
         9QPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395892; x=1795000692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1oyng5HmTkXJYBOjO4xwXQ4nKo/fyLrx6V7oMlvY/A=;
        b=F1dKiKMF4VJajRFj0nHNImoDhIUp8W9AWsqwjUNVel+BFQjyDQmyuTVu/c4p+Nr2QE
         7GUJznGwWgwagJDi+zaKjBM2+70O7Z17rGubc1sag41BoblWWRgDyB8IYE54sC9joJFh
         fsu55pggmsU8lE6RGjMwRFWbKkT1QYx2wetE4yKjWffmSRYfD2ekBOwW1ZeKnPykNnCC
         4K/Dwrjd45d170g1jscSUYj+wI6H26nwwYP1yX/PkIYSw8wsiuEDYez3uO4tNEYjr7mR
         rbGxhKiq5f/Y/Kjom2fy1knuvLGAvdVS7+Mh03iimoiLj78422wBEurEl3iOKv61qrUk
         T3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395892; x=1795000692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1oyng5HmTkXJYBOjO4xwXQ4nKo/fyLrx6V7oMlvY/A=;
        b=Qm+TwLu4btk10ZKFo7QHLVadYNAK09vS39NY8bNkklJFG5tQJdvaDi2XB3AhYcNB6s
         EHtXmciZYZTeTqlR0KFEHhL7cMUkK47xi31eSwWjzHmcKq9oyhqs/SN1CWgsS1M0Ujjb
         WTp++txgMky+2ZeVEZ8isW+9SXB80z+0marzShHjn5RQ+B3Ih9XLWPMwXrKzirawNK0n
         KjisU2TPG8ve6XckrnhMZKixK2WEFb5t9mBM7jxyJHxDoKqt/tIzlboFCzSpqHr2c2WJ
         ORXaWCOC2/oDmdgmQjsNhrUNN82aU9NjBG2XxzL1EKwMZME9O+FtsCX79mLaIjxuqjE/
         2D7A==
X-Forwarded-Encrypted: i=1; AL+hErHf2f25lmjsL9o4CHKTxQbZExDqri+j3UECpFX+D7FJ9Gvp/1WdnFjNYb+ij09S/qstJEAPNb3q9rKH@vger.kernel.org
X-Gm-Message-State: APuU4Z/hLmZnlVJDpjEiWowV7eOm3H3nL8PkzGZtvRBCsUEMHSZvO/mg
	AEB7bNiqLE1NhUsXpNmRNZBPnvDbXMg5piJE6fAk+4IKe8yY2kSTofw3KUYk7clmwjUrln7RM7Q
	IZ3NS5GKUtSMrkSblfMLksbOrpuc41Bw=
X-Gm-Gg: AYBFou3mFpEoAMRxT6RuzEIkgP4PKVNvJCdvRng+qHz6rS8aK8LeCyPFxzlAOC1+CDX
	KeMzurUGl+b1Is2+HHejbNa3JNFyGdkgxGhPmW6YgwNfp51tRilhnC5ectSV1Y3S0QGCwld9BTd
	XUjgqt4VFdHBR6mUGdSbj/u27X0J6YSv8hI/j32qA5vmlBrerF5NnqZkb1jCXBAnmNLeB/gA/Li
	9MJ2FJl6eOvlNzeAHW5tce6Ah5+wh084w1HRAjGiryz1nXOA7OzV04Mipe29KdZR+G6cS5v0R3f
	fk53L01ZuOE4A9xob6T7E9hhwzMIi3dp5XxXrqtU4+KSztziztft08WNeKBBP2pYnykWq2gbM/g
	gZI03cVrKrpahmqO7rJayOXK3WHrvqQQuTs5X6fPIc4MPQPKLC/2dSbRi/IRwmI4+uv3FHrTbK8
	qHvbIYjbO5s7HdooRzzbxDX3MaEsq9dg==
X-Received: by 2002:a05:7300:d942:b0:375:50d9:474e with SMTP id
 5a478bee46e88-3768366a40amr2582746eec.4.1794395891501; Wed, 11 Nov 2026
 03:18:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Nov 2026 13:18:00 +0200
X-Gm-Features: AclHuK-O2dC4RAUcsZW-78NPaZ5DVC69K9fHpFDz6S6p3zKh72SRrQsMpZxuDAU
Message-ID: <CAPVz0n0-jBU3jnDsA4FmAkiF22Bqba=87_VRU3P1H2dzHHbteA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port optional
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Selvaraj <jo@jsfamily.in>, Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Cristian Cozzolino <cristian_ci@protonmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Ryan Brue <ryanbrue.dev@gmail.com>, 
	Nickolay Goppen <setotau@mainlining.org>, Robert Chiras <robert.chiras@nxp.com>, 
	Alexander Koskovich <akoskovich@pm.me>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Morgan <macromorgan@hotmail.com>, Barnabas Czeman <barnabas.czeman@mainlining.org>, 
	Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>, 
	Arpit Saini <arpit.saini@oss.qualcomm.com>, Michael Walle <mwalle@kernel.org>, 
	Ritesh Kumar <quic_riteshk@quicinc.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Danila Tikhonov <danila@mainlining.org>, Jens Reidel <adrian@travitia.xyz>, 
	Michael Srba <Michael.Srba@seznam.cz>, Shawn Guo <shawn.guo@linaro.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Alexander Baransky <sanyapilot496@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Romain TISSERAND <romain.tisserand@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 11 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
3 Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> DSI panels can be placed under DSI bus directly and many Linux DRM
> drivers will work fine with it: mipi_dsi_host_register() adds device for
> such panel and DRM driver does not use OF graph to configure lanes.  The
> affected here Linux panel drivers do not use OF graph, either.
>
> Requiring graph port for such panels is tying the binding to one
> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
> requires the port.  The port is not needed for the hardware to operate
> and for some of the Linux drivers, so it should be optional.
>
> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Remaining one Ilitek is fixed in:
> https://lore.kernel.org/all/20261109160706.2272332-2-romain.tisserand@gma=
il.com/
> ---
>  .../devicetree/bindings/display/panel/anbernic,td4310.yaml       | 1 -
>  Documentation/devicetree/bindings/display/panel/boe,td4320.yaml  | 1 -
>  .../devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml      | 1 -
>  Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml | 1 -
>  .../devicetree/bindings/display/panel/elida,kd35t133.yaml        | 1 -
>  .../bindings/display/panel/feiyang,fy07024di26a30d.yaml          | 1 -
>  .../devicetree/bindings/display/panel/himax,hx83112a.yaml        | 1 -
>  .../devicetree/bindings/display/panel/himax,hx83112b.yaml        | 1 -
>  .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 -
>  .../devicetree/bindings/display/panel/ilitek,ili7807s.yaml       | 1 -
>  .../devicetree/bindings/display/panel/ilitek,ili9805.yaml        | 1 -
>  .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml       | 1 -
>  Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml  | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt35532.yaml       | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt36672a.yaml      | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt36672e.yaml      | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt37801.yaml       | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt51021.yaml       | 1 -
>  .../devicetree/bindings/display/panel/raydium,rm67191.yaml       | 1 -
>  .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
>  .../devicetree/bindings/display/panel/raydium,rm69220.yaml       | 1 -
>  .../devicetree/bindings/display/panel/raydium,rm692e5.yaml       | 1 -
>  .../devicetree/bindings/display/panel/renesas,r61307.yaml        | 1 -
>  .../devicetree/bindings/display/panel/renesas,r69328.yaml        | 1 -
>  .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml        | 1 -
>  .../devicetree/bindings/display/panel/samsung,ams581vf01.yaml    | 1 -
>  .../devicetree/bindings/display/panel/samsung,ams639rq08.yaml    | 1 -
>  .../bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml       | 1 -
>  .../devicetree/bindings/display/panel/samsung,sofef01-m.yaml     | 1 -
>  .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml       | 1 -
>  .../bindings/display/panel/sony,tulip-truly-nt35521.yaml         | 1 -
>  .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml | 1 -
>  .../devicetree/bindings/display/panel/synaptics,r63353.yaml      | 1 -
>  .../devicetree/bindings/display/panel/visionox,g2647fb105.yaml   | 1 -
>  .../devicetree/bindings/display/panel/visionox,r66451.yaml       | 1 -
>  .../devicetree/bindings/display/panel/visionox,rm69299.yaml      | 1 -
>  .../devicetree/bindings/display/panel/visionox,rm692e5.yaml      | 1 -
>  .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml     | 1 -
>  .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml    | 1 -
>  39 files changed, 39 deletions(-)
>

Thanks!

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # for renesas
r61307 and r69328
