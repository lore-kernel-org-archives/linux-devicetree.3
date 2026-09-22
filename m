Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318A6550DA5
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083600; cv=pass; b=UC27b+NStT+axyIPE0rTiap19nKVD/M9+t1yreaUAIhJiX6UkdhQtNjBlqHtwaVQhL/oUDG0swN49O828LGP1cbQudgwn2EDeKvu4PiWHEwZ0Nmm8jyFwr6vdjNeEEZJqrcE3+SM9S2CSquZAkGKlPJd1O/1RliRYOqCjrzYj9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083600; c=relaxed/simple;
	bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/YLQ0fyx5U7RxJpSTRdH98qrgX/gAMbSY0eK5GAhHUUxFh6/6Etc2pcY+3W9zy4KZApRV844W7K8n0IrFCFtA4I3kvLaxLqF57FQB3TTS2eqlrwvflfGn58Vcd7I7E6yp++MavrdYt+X3av8N/+7Cf4Ej6v0bFw9/Uih1uKQOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7QG8UfG; arc=pass smtp.client-ip=74.125.228.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7QG8UfG"
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c2950c25486so346237266b.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083596; cv=none;
        d=google.com; s=arc-20260327;
        b=mxoKtxsoqa6yENPdMvKOdmDWj2kGH0gcFdWWQDoXudABKDzXf7AEGiVkmJeByF40ge
         47pWR393SalBuQCAngjP8oPDqG/wqXlTxongNAD+4XvCtAkSoXWsyeEDGbaO2jFpA2Sb
         +Yb4qgpyqWfjlqjUVn3MP7cwgSahg4F65aN/lt0Z0YgUnZ4V4wS0M2wPsfJXjfnrIrYU
         g7mjqfR4gNBpCp4OrvlOxU/XGfotLC0wZR3/XBRz37jf4gkn5WBG/seaBS0TEKDkavmH
         +VJ1cxRy0kCGMO9bGLYxaiaQ1FA3rju1y4dtHm7DzHdqgQYM7jpOd5zYaFNXmPyxcxDi
         SBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        fh=3fnBxH0hRGkKrAGYPGnuTE+bc3WpNeO7S4+3ehHWFcw=;
        b=fV2BDn9u/fQX6wwzWSW8kgPxyJzhXpE6SiiCXM7gbFxjgmeF27l5A8VL/DPa6larfp
         4GQ0uzjsXy8DapifqHJSOQU2UvpzIz0p6MMgZAo0EMSuROpuF8MvgkHErDF+R290FIOV
         yvI6iw4KEA1yd+x+YV7JGsYD1OctMXgeoKzu0TgmXsUxwooXwfPCQyQYp1MWgfNQOxNn
         DWMrlxWhLr+6O7lGP3YN0GnmTdlXxChN71voo9JgmTETkpdugUcsjrlf7UnPSkhs4Qrj
         vLwX+cVIfSTuFqzgqzWR5SrD3xm/9Pqv2agpCYd4rHVirvAzTq58uRj5EXe3zXGSxwtk
         WTIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083596; x=1790688396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        b=k7QG8UfGL/xP5ISOf4kC+7AALJAldDYhkiDW+EjNQKPVre7w3pFTtuQx+F+/KMLY+B
         YQmhjQkIYSLCNZ1JXYpF9virZ98xE1C/ssWGcowtGqjvaPoLhucfgT53NF68R6LqfkR2
         nUcDirZ3oSzhh5OOSp1WrpuA5v9W1BB4FhLutTyYulsKBFPQKlxNoBNncxDSnAwE0g8I
         epzOsk4jHMYeYjTrgSOqjCbUOiXAIHVrs/Mne5wM2BpEPM9Lu4Ab/vUJGhKJDdndxiTm
         4GdLNe48KukkU+J5NHIAhpHK7spOdXzUrbNJo8Rje2uNNTU3sdmbD7Gqvx5pfc64tw5y
         hSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083596; x=1790688396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        b=EbDOLsIlJfjtqth5Vz1i5fPdSUvXtVhnm4jYb4Y8/w/iPzZ8JeOJwWjS6Yz4QeQw1F
         lPcuSOLRtLs/Rbgk3R6oxKfpJpfolc87lwcbIp6vZca8xSuduJh3O20vxEKpwZ9Zf/dk
         qpoU3eXD52AVl0VgA5/DrbvU0wO7CV2wA8ZLisiYRbO6TLfpYZcRMAerCuRWZ6iZdPFu
         ErANooicAaH0nvE4CMu5gfxGPrXJBBApqRRYm0Vb7Infm84KYGhd8JOieayK7dqeVIRM
         OmA3k4FRUmQGZct8Ba54I+GnQQhUaUEBOExLzFcO9ZIa2ivIeHbjFoHI1gn16yUcnMOI
         akZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOeRKQp/HoQ1wrXNRBaa5qQ8wvJHlHXrW5unuEc5BibNP29RsbRhr0++qjqaHZBpk658fL0M8eglyY@vger.kernel.org
X-Gm-Message-State: AFuF++nU0xee+j5tlkbadflSfRWM6jTdXZ5lqSp7/Skl2msQzX7PXPP+
	yoDiIu10Zdlx+CJ+iVzOBFC6Si0Lkrm4gYUOCHgQRY7odyHMsAUF9xM5qLNlawAfb4xwl5OZqjF
	HJxKGDTt4lIaJn4vC2pfaBSGrD+bb/Ac=
X-Gm-Gg: AYBFou0+w9GHmzZxKNZPs155HVeX1RZ0vLgNu4aCqwadjGQodt9DjiKFrD520HAvgUm
	tMQsMWsz3lkJ8q5Er15yiKh82IoCwU9+Vwm1wnPFbLBtA9gSSGjeNB0JfucSSfugiGMh7UBpL/z
	P8luhl2BujmN1g06TJDo8xrPQgodqoSNVWZpIecgscFC8JgFF7MNTctuoS/Abz6rXfdWjIL23Jp
	gu3NOBNcD2ldMpLMyjbDA2cATOZB1pOln3sYUA3MSL12ZHU34LotrDrP7I0gfBqJFi20nHk+fny
	It+if13+q5EexAp6DReB10PIaWGy0IJP6+PGv6+lbgj+q1lnZtObQKFuVg==
X-Received: by 2002:a17:907:962a:b0:c25:6c9a:88bc with SMTP id
 a640c23a62f3a-c2a156ed781mr1064393666b.19.1790083595818; Tue, 22 Sep 2026
 06:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
In-Reply-To: <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 22 Sep 2026 21:26:23 +0800
X-Gm-Features: AcwNN1Ur2tt8b16s6pIVEQsDoiyvx1gOYWr_ba3DyTwWp74e1eP8TDNhMjUzs84
Message-ID: <CALj3r0gyfggFP-T+yXM2P=ooyQMk0AUfnpxtArk5ioU+wMNrxw@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8822=E6=97=A5=E5=91=A8=E4=BA=8C 20:50=E5=86=99=E9=81=93=EF=BC=9A
>
> I'm attending a Rust training until thursday, I'll see if I can squeeze i=
n some
> time to re-test on mvpp2 :(
>
> There're a few series pending for rockchip and S32 on stmmac that deal wi=
th
> PCS support and their PCS handle. It would be nice to have some stmmac gl=
ue
> maintainers that are using complex PCS to help with maintainance or at le=
ast
> testing, maybe Coia can help with the tests ?
>
> Maxime

Hi Maxime,

Thanks for thinking of me. I should be upfront about where I am though.

My focus this cycle is landing the RK3568 XPCS glue before the next
merge window so it lands in the next LTS, and so downstreams like
OpenWrt and ImmortalWrt don't have to carry a backport.

On testing Christian's series: my current glue goes from
ethernet-pcs-mii@N up to the XPCS platform device and hands the virtual
MDIO bus to xpcs_create_mdiodev(). Christian's series changes how the
PCS is looked up, so testing it now would mean restructuring the
Rockchip glue and rewriting the binding, and I can't fit that into this
cycle on top of the initial merge.

Once my glue is in and the lookup story has settled, I'll be glad to
rebase and test =E2=80=94 and convert to xlate if that turns out to be the
direction. I'd like to use xlate long-term, the timing just doesn't
work for this window.

On maintenance: I'm a student and fairly new to this, so I can't take
on the PCS subsystem as a whole. What I can commit to is helping where
I have the bandwidth: testing when I can, and sharing some of the load
on the XPCS glue layer (pcs-xpcs-plat and the platform glue drivers),
plus a bit of pcs-xpcs work. If there are stmmac glue maintainers who
can help cover the rest, that would be very welcome.

Thanks,
Coia
