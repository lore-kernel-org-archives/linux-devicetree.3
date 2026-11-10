Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336100;
	b=XCgV2kokIOrr9rX1nahSie2eSx6jXqQ4822VPLzUB1z/jwcRYD36OZKqvS0MayHi5GXc
	 dSFq9aSiZQ3b/seqAWFDVWJMnyg0Uoc6SdVvRBrm1AVh7Q3p92ixIoTD0O7jGA4CTlt1M
	 RuGSMK7isiYQGbAA8io+XUVU2S/uibb/AFxar6zuJBDrtr/QIMO9LWEC3hNjPDCM59Vv9
	 mjj6UwwXSRWfHOBPNlSFLuoFNB0L1XhzSrTc7H/8XLKIUGUcUVJowdkQtP7DidaA1c3Kj
	 y9x5EXrbeCWG9f3g6aUYRUYWr56o8yLyvgiWCKSHNqPAHopJXOR3XObcECyvL9yDSlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
	b=USaybj9qK1O/CFHmDz6xv8iFLobSvyiJE7+CiSZiXpdC1GWdC8m94jdrTpAvlRvPjdXU
	 q6sgPmz/h28r9sj9dnpzFZomVAB1TAzKLnDHoQgogzSY+XWqQejazzwbW81a+AwbQYxDx
	 IWqdkiKBIE+uVKnJqhCjhYZLkjqiZLW60KC8itzxFQ76De8n13BYz48NxOTYa7+9BpooF
	 8e8kqO+ZWeM1zj1vQeXUfyPJ3snfxAiaRKL27lzvIrEqLPgU8g+UBHdjm05t/OdtOAZZ0
	 aZVKQi2YKGx8VYFAjDVoWVOuBrm5NV3y7PiJuChKMPPAADB9E382G3nsQyf2rM8cdWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+oRdJKn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D8606C6D1
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 18:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850D8606C6D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+oRdJKn
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so1333406e87.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336099; cv=none;
        d=google.com; s=arc-20260327;
        b=ogr06rKLx2rg6ntq8DRAVg83ge2y2TVfklcRsLa5Yi8f5dupnDqrJY90brFkhZjKjN
         6oayy0+5uEcYKhuZuzRb/zepq4d2TyMMQFdN2I65j9Gc8nKW9AbEqEQVpVeQLzKlpVKM
         TC5ALnqmAMfOuyLCb3lsv+gY7/0eiCX6HTWbC/aPS4l6CDaRwTntGJ6sSqjzDFPYZs/R
         LXliWCRzllBsuV6BewsGZ9mqZ1zJe3iRhA1b7rv1gXLwgJqNv6vAsQzwnJ37+IqpDZJj
         aHslL4UmvWcmj78woupm6AnnobsCGIqNjHlUvNyk/U3AfqXTaXYcs3OWV/k0C3v0xIT3
         LIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        fh=x2KXPPJJgGLis6pxKGeyNdxOQkWwH2IC20bbMRbA4MI=;
        b=mU4VfiEWahfVQve6O/+339iFNPII62Wv7CjWtp8OdQTJVc6rX9wu9/g8FzxdJ8/S1u
         IJmnT2XFjfKdLmmMBAg5pdfcPYJ63+6KzdwskjkFgGYHoc6+kMRj5lPuhw37oRC92XCO
         /SIP37MWWR1pElZFclCu7jkzD6fRiq11aY8tVmA/yWU460PHi+8+dQmeRg+shccKX0sn
         /ful0tEgHY+WQ5kjW+JTp7DgsFee/5+R0vrP/gafJIPq5VCUErw/oUZRbKArR2HEMw7i
         FsmGGEMTcqgCETg6yfouOwYXstvVHssgzyXh9QHGbq031o+IWpBPTMityP++P/LWIifz
         /RoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336099; x=1794940899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        b=W+oRdJKnzbnhAx23a797Cs166q8KUYecssliDZThq98kl1vc+IUDIXLauH9mazRliL
         abW/QptM9Zg9AyZOLB29dX32hVHoRQ0BLoeIgdiZzEOGxupAkZo6CmYu5naphLS+2HyW
         6FBo0tus+fFHBkQgrrlOi+RUWXyCO8yiTxEICP3VKlOWvHa57/Fpjb4H7r6FT+aNuyOw
         gpCzIWd9KXnkYJ+lZc+3YlxNyQTsQKh2f3Je73aG4X17XOYKvBOdSGyWnY3hmdPV+Bnu
         nI2qzsecjRQdrAVH/jAQEFUauzgkPNN5Dw5qKaQp8HrfCeAuJNWwUHHOJ4CStk7SE5Nk
         Af6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336099; x=1794940899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        b=c31BJoJD3cNpPCcooiDL+ED35jTiEtfzysYnhXs/hXgTm/pHXpnQa9Xh+gfCXZxdha
         4pMCJEZB05nMflkrkBdOqIgE18G0rN1jNsqiFT1/ZVxvbWURz8AbzMz0NuZZTTyAnAG8
         kcooTeQIK2lp48glbjmjDw9yRHSA5WSABvYHhGIMKWgqVs26Y7ue/gM2Z74MIeMPJYKQ
         MUJvMlVZV27Jau5vHewDOFnBzuG0Y0nrbXov9shNpYYug3EayaWKi/2Z5wezq1KC13vI
         82WNpW9wEkpErpmGVAZ8MbsZM+00vveWrdwFNHxFXqAG9+v0H9V92ZQeswNA7guHdsSA
         VF/A==
X-Forwarded-Encrypted: i=1; AL+hErEBuEK518pycX2PJLThjgruj3sSYzP2yb08k0O3BFTYGR0GhMB/D3PKhLM772doBnCFdHMGTHXdKrRA@vger.kernel.org
X-Gm-Message-State: APuU4Z/p22QjBlNbBGB0PgJj9jmdLi7Vx27CaKtPXcq+CnZ9/g3adPAD
	wLrX0KarrfqJH6YvODj155j0MNuvL6iE0W9iiePpYiiojTX1pNfxzm5Ndx3hicxgrns0S56EPQj
	UmRI06eIMGbGzdMk5CzGVWXKAc/CQ+Rw=
X-Gm-Gg: AYBFou1AkbojyEoI4pX96zRuO3Goap66QOK6bhMEIqkeBxXZrwc6BXlGjMijFurqcmd
	Xkyn4aBxEk+Qh4x6W420ZtTKGZbbrN587XI90rXyDC5OUjWnvXLY70y9hkFRNhBiZvlTbK4Vtp3
	0+ttjPnLFly3XBgLcn1slPCMGGPHLgaRw/u5odHOHxTNgIOLUHXnXOiLQNjm6YEpQkadBe73nJK
	jHiFUpB5aGreBO77SG3euFyEnHKdm1irDjflVhmjL+HAxDHrIhgn7gcBgsV3XXZu1x020qCiq7l
	8oFb72uuJYn55msPNz7uZIBUWjUYR8+VFxSp2fhkhD63NJvSYdKjgylnJFAynBs8Ag2baEkhPYD
	fzmj3/j/G6ioG/mvkLX+JQhCiUkrKt1RmoOLpRrOuSzvSfamwkPYf5yJrXd7CglBi9VUP/fR/eo
	rc3A4Ier+ncwf/bANiVVJ59VKGig==
X-Received: by 2002:a05:6512:2506:b0:5c1:5b62:8bc8 with SMTP id
 2adb3069b0e04-5c15b628e54mr429046e87.35.1794336098639; Tue, 10 Nov 2026
 10:41:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110150546.1535950-1-lukma@nabladev.com>
In-Reply-To: <20261110150546.1535950-1-lukma@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 15:41:27 -0300
X-Gm-Features: AclHuK-B10Ha5eqEFsmLjifrfjCOeHNDcssKsSt9aMG-Ic6xnxgK7qKCRscUdio
Message-ID: <CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: Add device tree definition for
 Cloos CBASE with i.MX8MM
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Tue, Nov 10, 2026 at 12:06=E2=80=AFPM Lukasz Majewski <lukma@nabladev.co=
m> wrote:
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQM=
L
> module.
>
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
>  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 577 ++++++++++++++++++

You also need to document the board in
Documentation/devicetree/bindings/arm/fsl.yaml

Make sure you run 'make dtbs_check' and that your patch does not
introduce any warnings.
