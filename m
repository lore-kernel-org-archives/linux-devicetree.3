Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D913B52FA
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644108; cv=pass; b=ZWZV9qFvMlcPc/ERWaWRLzYgbtTDKhEDHSNTRrSUy7EW8Izg65cbaQxohUwqv6/0oDE/HhVSB1zEstjEiZ9M9nhEK9sfVFXhjvRtFGLyTcMxU9vG411iTvBtxrMTZZPq+h6jcaXACHndz/BgovGRnkrN00jdTmHpjJfUxQfWuyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644108; c=relaxed/simple;
	bh=YY4c3fuxkLuFGf6aCJIhwRJsbabPmDF632rTozVCubo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hI7uRdiDAvwoW1E0lBYLqAhmbS4fcMBc0GQW2nRoaR9yHXhilJUDvXoQdRZDH4JPRnihw11RfOePYXgIGuSkrCbo8lRgYG15IzRI1qBI6b3fia7TQfA063AFCbAqJpnQd9LZrlt7x7BuLjY46RT6e5f/NSsO4MySPUfKHavNgnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE4Jbtaf; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE4Jbtaf"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38df27b25e3so32218271fa.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 03:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775644103; cv=none;
        d=google.com; s=arc-20240605;
        b=SMb3Q5KfhCfY97J8Nh7UzHbfzBoPqBMR/kAcDXnpggJAk7pwaUIxqmsxwlXbhf2vRH
         V98EDXIM/GXlTvWQL6vHrUy7N9j7Tmwbo7zn5GFa8Uu61sxSOzZGe8hUbL+lzGkZkCYO
         etZwWCr4yvKceIT60SNPLGrXpkAfp9/2Srg0fWPtygl3kMIE/Ei9asmKmyRwQu7u5G7X
         HvsbPVgarnqrHfaWBnR+AsuSYRe9m2aDdCYnULAKzEFZXEg6e+JTxBEBPdPaJ8WwQREB
         IGbTIuIDCinITpwchkw8HIjD2Hg+u/HUwNJCaSiAPV6jV5MJzUtO5zUBVUd2f2WIopxd
         26Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YY4c3fuxkLuFGf6aCJIhwRJsbabPmDF632rTozVCubo=;
        fh=usFzzxW5Y1VxlOZqQrdBOyYr3XOwPdDLhOjCZLIYrpc=;
        b=igP1QrkYZxYKGZCBSGM4eqolzCexx0V3PRjHaclov4jJYoFF8YGjsCgA/6zFOZ2Gz+
         /1okdyl8Ar7adgFVgpSHbcJEQG1go6CSYXNiYBz9+qX9MFgEcpcBelVG4CwHLR/rCLhT
         HSF2zmqkXI9dOAPWPIIzaFVluvv/j3NgkAi+R5/hgwkq5uVeWUbllAbC/bPIDu+lnS0D
         sdq7R8Iw4ZR5wwG3cCaFwc62JezE65PFbyC0XDNc7DvjnSR65xDRrN7oz/hrKkgIyi3Q
         uCmrdj8KVR7e6ntd4KW6jdLPhGWmj7Xdt6aWvAgnrrztOpilwthdS754rRAMQ4w/Ezms
         CcLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775644103; x=1776248903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YY4c3fuxkLuFGf6aCJIhwRJsbabPmDF632rTozVCubo=;
        b=UE4JbtafbAyGKQmN65pp5tdqxhn9aiXEJyipSPDmLfDC86LRIuj49oqni8ZqJNdeGK
         G8OAXGnS5GIGjTeSilXD5I0omT2g/jraHJ/PUar9auox1GT55dS6OXlce5K3CzfXmeOE
         wIIjawz6Kyhq6LiSeov8JOb4WKQoj0J1P1gGZ3sqp+xkNKIZ7dEU8KZjaU8m6Sxgq00S
         7+pBoiAgogKMm6nNRhOlD6Q9bs0tCuGig8EZDs/Bd8nEyVMKnvmOwAA/DVwg+TGxAtdy
         g2ndwJ1u33blga9e+ysU26xRn9wPmaLyIbNePhLfIeT0kpW1IsVkmLE9LiExibeqQYUu
         NkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644103; x=1776248903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YY4c3fuxkLuFGf6aCJIhwRJsbabPmDF632rTozVCubo=;
        b=UW1tGbIDNm2pvpKd3xueaKWeTr42aWi2Bhk5dUviqK+5KGoUqgjs8eSBPb9tkxGRGr
         3EfD3NeOImbzs/xwQClytpZqLOpdv1koFRpeQcUp2SvaKyB+dbZbA+6FbbMkH6KnQ7AI
         AQhvbJtuGG57B+Q1mIJ9Nch3KXW7SgFc7y//o1vO2AHWSqqxHZvnF5DfC7tBz7MGaldX
         UgQoFIwLROh7BVQU1sqqqqoP29Zg/zDDbIMXI//FdOCoovi8YuzJlHIrsiu2qF5HFyds
         0bmH1AZLoFHkR0UdS/DfjGrSFjy64kNccOGWwPksUPtPZgW2U57eGl9LxsN43Y5N1S8T
         lx5w==
X-Forwarded-Encrypted: i=1; AJvYcCXL7VvhWcqd9rcCTJdSO76SyN8QlrVWfMTXZlkmmw4Q2/+oSx9Jh411xpoMNOVXCYcte447dV5x7ovB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy40GAC2QxNAUI0d0vFEpyUNISzdqM9Fvax8Z5vfu0dQifMrzAN
	cYTrgXqbzdBf98fPh/oPfFSoN7mVO2wwf8R8JQltON4dsgOkKQh+4vJxBtJrl9xcLCFj4vMdDHF
	S5zfhpHHMPx7qqmVO24ABC0rOwqW91dk=
X-Gm-Gg: AeBDiesr+NK9RhWYjGvtM+EreEkADcmgHmvz3HGtWxYd6IFIBy0Mad4AE0fQwOXvv4q
	8ZEu5uJEQkvyS6D6ow50Zh/eh08U2neHqTGmowLWfq9RhZ7vYibWwU01G1nUGtaMjFFLsMAEpS1
	rXqJbbN1h6aJQkpfcctHNYA7kSiWQGOrzrB10hHb+Fmm/wup2UzJJ3t59wHI//wonUm4iPbOoi1
	XJYP8WWqYYAQqPVsXvSGz5BnfzsHASUWnjjl+ncfnoG2XJxlS0wz2Oju/IbK2nk8NJkbkuF7VeY
	RkTTBwiktWcBrp2CouHAKq7nF7/QcRBMbxR56z+RaJ3K7MxYLDr0N5OpEAmiv21hQ0GJZw==
X-Received: by 2002:a05:6512:3b8f:b0:5a2:a13e:9082 with SMTP id
 2adb3069b0e04-5a33758cb31mr7239647e87.35.1775644103036; Wed, 08 Apr 2026
 03:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310002040.417424-1-festevam@gmail.com> <85660b25-a936-44f0-95b2-3c90d559efc3@roeck-us.net>
In-Reply-To: <85660b25-a936-44f0-95b2-3c90d559efc3@roeck-us.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Apr 2026 07:28:10 -0300
X-Gm-Features: AQROBzCFLMKdn6_DPxMBZZudNOsitB-tdvZTVJRufurYW4e2dSJ5lAU_ylDmUrc
Message-ID: <CAOMZO5DFWYUPN9sPzBr-W7fy8ZbrXP7u1sx=HrmUAQVCLrsdjQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: watchdog: rockchip: Add RV1103B compatible
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heiko@sntech.de, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Mon, Mar 16, 2026 at 11:14=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 3/9/26 17:20, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@nabladev.com>
> >
> > The RV1103B watchdog is compatible with the existing DesignWare Watchdo=
g
> > binding. Add the rockchip,rv1103b-wdt compatible string.
> >
> > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Could you please apply this one?
