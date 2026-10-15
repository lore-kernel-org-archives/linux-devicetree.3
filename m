Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A73C1D73
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076522; cv=pass; b=p4f2iJRyNLtFe1X1QnOCe/80J5jtToF/bumMtaEfN8mpO0nb5pL3T3dUNPwMtJezFU/EqMp1wyj3RmBEwtktWWNVZD0Yd52NAxr8EOnTnD8o6zQF7v1f6oz+Tl9MVudEScZ2YBkSXjADpN4qIvS5kYPA7rTuQDC/reSAZjwYO6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076522; c=relaxed/simple;
	bh=bNojCwSPIlR/KkOgGy6v/7yjRMePElwktJq6dhAQ7/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acOjvFZE4LWofdSOKoesIvSBlRSR7VXkiIoZQZNv9y/AbecvuGOBA2kZaYB9S8Tq25lJcEqJc3kAimBxyH+609r2F3/hnIYFJ6Wl2V7iMKS7VXy8xK33r1yceK6EoEA9mUmOAqr7TBGTmBqNOVVOLMeGThajIYSTgFXEyxRHXrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euu4aJ0J; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euu4aJ0J"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1421065a91.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076521; cv=none;
        d=google.com; s=arc-20260327;
        b=p53dJ14UAqIiHPrBdMcGiUORlrDCZ5+deLKfRBjYEa8jAiICMVFmYRUaFC0pKQPsY5
         z7W917WPGbiYa0WS01A0lJGJBwKwtjFvOk6t6pOzXKaiiAKaBmg/mWeKshKsd0acRDZv
         +ZMZunzxFJd7xVwDIS2qHvmzN5HiBMEcsbd7U81Aai1eJbW6yf3b7iGwVs3KGVKLvhL1
         w0OpAsKk5bIwRG9rqwFPLxr20AIvhgf5DkqfJyHvvPfuMH9GLpaq9eSg1y7fmT5unDDt
         ueiHpdZEP5J/UImfG6daOBMG/CC6um9sdF2QAX+3czy7D0IKUwKZgDgVrzqL20i+JlyM
         v1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNojCwSPIlR/KkOgGy6v/7yjRMePElwktJq6dhAQ7/A=;
        fh=pPgvc4oQrmeKmK29MRoz1dDNHgxnMy0VZuhTDx5aKPw=;
        b=eKEaTGcsFTuZ52ywsdH8i9xPSparHGvu38vSOYPcC7DtvnKn3zWOwXnXAMHnmnUYco
         u3mv49zg7TMqQsfg1kYo6rCqw3/Inve/0XsqlvwV1doJ+spVVCOMbMw+gEUur9V3ZHxF
         rqba/iz8UZrTf2afvcP0g6AQ93vyVVtRIYGZobS/gAj+OOVLIbv8u7F8WuFVhh3qdV25
         HllBJX+1R52+TKNlUMmQoBNjG+KKngvkYjXmLCJ4Q+jpzj+4N7HjtRNgJcB4Rmx4+sNw
         bMhjZJvE+dHcMnBXM1N2d4E0t8rKejVHgq8noDKbpnvk+LF7E+iTwSQa0ewErdzVkeMo
         lOJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792076521; x=1792681321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNojCwSPIlR/KkOgGy6v/7yjRMePElwktJq6dhAQ7/A=;
        b=euu4aJ0JA+Js6Yl9Mqc8WYMP2Cqk604YiZ6P6Hx/dUhE5hdyZ1S40agvaoAliPAJBa
         HLXl+S21EcHAG3vr5ahE73p/0sLUytr5sJDuHZeEyhfSZNgBTQN3wlBHGsFUh5RuW5pt
         bBtR6JES7wG2DDrxAlpFynp/mra93fi28TNgIwcvmM1qal0BJCMHJDY7u32JxGA1JUty
         yHX2oOgr+x//ag6Vw36JCLLFBYI5u+OiuHiqHFt3hb3bBCPEVah7ZGaCS6mGquBjylJn
         xeJWSLryV0QY6E71cgJdUH411AEEeh5Kw3CaOYknNsVwoElD2oTPmJSafMvWCHYnZZOY
         4efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076521; x=1792681321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNojCwSPIlR/KkOgGy6v/7yjRMePElwktJq6dhAQ7/A=;
        b=wuNhwqUU9ktIQQf4hSkI5ckGzCYOydJ2wXGQTgOMOfsWfwhsLfapPx7HoBQgp5xZ8r
         OxDBg1JtNx26DVrgKx/fyC6zwOu7uPbuSyi56ZoUu/7do5LHUi7FzN/kyuddoa04MMb9
         YOJV29/R3M8B5aiLMpmxSHAS5CGP2yqszVLC25WIj/ZNMUqk27Ba5PEZpViFAqjHID6Z
         +hAGuRVLcyNgrM3dkV52s0y58fQnUFpNHcH35tspJ35JeZYyUDqkOa+pQWuigKJQ4vGP
         Kg8R60YnF/cV5098pzj8X1PvZLHI6y4GPQO1QekUGVDhxWEqhzucPbKpW7h1rpdSntWI
         P0YA==
X-Forwarded-Encrypted: i=1; AKwUvBz6RC3l4hlV5MZNsqvDjY4Z9erhlgNleSBJHVLhJMf8h3BDWtWutghNe+6rUPDPmJ6X9SRYmecHzwHh@vger.kernel.org
X-Gm-Message-State: AFq9FYLaezYlB0EfT9FCxsdSL/mb+nEri2MSwtJpqdjQJtzsGkO++V9n
	abC/Us4tcg4TJ0h7WRq7TodCoIhybXTHai4qbRvIJI/VIaf/B7v6NoXPiDTeBptuXCmsqWXghtF
	6t0I9b6KfoqyvVOkV+7chNgCZwoocRto=
X-Gm-Gg: AYBFou2DEWbgs0dfPOf1uXbMsJuoT5HK+48qH+0WN+OyY+q0h60lKm4D/dlhQxjIZpJ
	dbkSA07GN4gm42D1fjez9DTmzN6xNjiWTG0Muzc2Hyxr8KNzIUknH6neye+8omox87hDFN21bSV
	hPXSyqSvF3j8w8Q4ruiTMmDwFTZF1GLIkuE+wEL5PfQ6vlQz5/YNY0SL2kOIV6RN+lYrFrLnHwG
	yS2DTYFkBIUHVk1JbCOCMDyVp4KykXus5xQUmP9oI649sCuuE9+UhlXn03ZcrAJzfjK9gvcPHSu
	M/5D7nxBBL6zZnhaCUGqKx/3I0DyvhmoelEPOyAZZCQXdri+wHxBsvCrhM5W6ZoD7xOaq3lcbox
	9tBrxLtA3dRZWQsi6z2qkOwG2Qt6f7sHpoRIDnnuoCKayVG6Smd6VbCKy+Q2rGHGoInaR
X-Received: by 2002:a17:90b:4d0b:b0:3ab:1285:dfd6 with SMTP id
 98e67ed59e1d1-3ac6f2952e2mr5293396a91.38.1792076520686; Thu, 15 Oct 2026
 08:02:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-1-e713f71eb4d3@gmail.com> <d7db7de5-4972-4dd0-85a3-e310dcabc41e@rock-chips.com>
In-Reply-To: <d7db7de5-4972-4dd0-85a3-e310dcabc41e@rock-chips.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Thu, 15 Oct 2026 17:01:48 +0200
X-Gm-Features: AclHuK_kT3T7rBZ4r_lp0uxm1snQeoydsZmEkfjppf8MxTDec8cdMHuYYUHsJEU
Message-ID: <CAPSPb=vTtNfm8oJu1p5znaW=Z2argekQgmXdVAo2OWD_33A-+g@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max voltage
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

On Thu, 15 Oct 2026 at 04:26, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Hi Joachim,
>
> =E5=9C=A8 2026/10/15 =E6=98=9F=E6=9C=9F=E5=9B=9B 0:33, Joachim Eastwood v=
ia B4 Relay =E5=86=99=E9=81=93:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > This regulator is only a simple power switch and cannot change the
> > output voltage.
> >
>
> It would be better if you could put the schematicinto the cover letter
> so folks could check it easily.

Will do.

> https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.PDF
>
> Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

Thanks for the reviews.


best regards,
Joachim Eastwood
