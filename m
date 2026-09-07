Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F954CA779
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795042; cv=pass; b=l349Xg2PiYG/a1D/+iyyGfeOVpqytX5BQoadOVXc1cOy7MeI7LfJOKMbtD0aGQ81NQpDeckTg0qNLqylW+g3RBBtBqWNQYD6WLVrK1RNxGoLD0U3viWqr1WEnsQRMU1H4tI0GngDE6O2m0/GDPSHOVleukl30imBZsTuzYS3WGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795042; c=relaxed/simple;
	bh=lGFXfZ5XuVaxMLWoh6ArrdyCudpeux6klfmVJa5bp1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT8sM0SgFmUZ10DCGAMWy4/RRXNg/m9mKr8WsBFFufGj8UuHoQjYzKMUYEj1WExydDAsFiSTcBl4YDYEHoKMnrwNOfKjPQgdq7VwerH5cqY12E0yEZpLXbXP9Z85ojE7jWYWSfAiGHuyKmZATlzPKZ4o21zeCX+Ipb8ZATweQsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LITXYh8/; arc=pass smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LITXYh8/"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-c169ae1cb26so809116866b.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788795038; cv=none;
        d=google.com; s=arc-20260327;
        b=jyxSb30hUJEWRza9BODnXB05S9AhVJ2QP6UrGFNySOynudzFyiRexcTu8gla335bgd
         xBbTCaeWSv69AAzgaHDaXZ62F1vwgTWo6zUm80ZoTdiN7rrmG8k0EyMVF/oeIzVzYpzE
         xFC+ovqEU0+sNj+/ygoH0ugamgEfLeadx6UMBJnHTTBdZJR7BUnGFRSjOFUKEq7ZoN5I
         ZSd0Y17kqnq9/lHCirpV8J9G/7xMQT+TR+ggE3ITTepKXm3jKg8dNLf+VZI9buCYGIZl
         KnPdQI1eOdDNeS9fbqEDsK7CHbTazzSDF6tQWbMAbP0TA6x1oG9+cP4kxrqSPd45LiaT
         paKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        fh=9PBftpEixGjOSv9hVqMQ+6unZ6gtNZkRRNwYbWuJXag=;
        b=oF1+1j8Asl4rwucA/HXAH0EEimW66elU6VoqIdlbr/anhrprDQ5i2nVb+kRiqf1hoL
         /6J3QhNSPaAbpl4916DDhp6S9zc6ruaOD8O0qs8LdQszzYskpBvGun8E/qXi5uWS6MZU
         /d0/XfI7e1zAd3EIvC+DhOjoc9wMQY2iQQMCnMkKuvf3DEfnlqScilgO/0VRcGyFo0Bm
         grZ2DA0CubxkaiLU061f6uFrR/2Y1vUAmM7LuA7ACbW3p3UCeBvtLq0Cr+c6dNfgWveR
         wjtuw947QIJmpBg4dXz/vd1jdk+ctl2IK4FYi6/8/JvO4R+x9Svxkzdr6qPz6gvhTw9a
         xn5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795038; x=1789399838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        b=LITXYh8/g5jBcACk8ww7y7kP8DUvXMLpAXWQoH+pL7Z9JsrTxmZFKSH5qXMLtfVQAS
         xdvBiptnO/LVjT8ugblS40pN5QMnkqGbixzUP03hWZ7fJTJNYuHpyNBrcBegG207Mc1w
         y4kT5xuusKl/KWJdXuL3FVSshc+iJiXpL/evtAVxtdIqRwRLfWBd54MP0tYr51b0GTdw
         Cb3PSKavDX5ylT4SEeB+lGjdkEqBrSIsSQUWttcGvxbIUlR0hUB8LQ7lY0dTKrqTtXcB
         BVfCNesZgJWGrWrNLE1uZCD6nvS6Ir3oqwMr0VmEBs86Y7yvRBh9V3ejAY0VnmKt8mkZ
         oJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795038; x=1789399838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        b=FH3xrXh4xj5aeBdSF507lYgFFi+WzaLJDj5PF08/uYhktBf2Xr6oZlMsLl5KgxJxEZ
         SXdf9jZwwB7iM/4fQ+A6aBQk+Sh07Unwi8l7gst3r3TXV4+eb4lfXGNMmdmhOpj1Z0Vh
         4mJ1xSGcB4LlAAbMFaGv17rGKC2BDgXSudM20dS2UhR2Ns9Gr/U3epxInLOpV8CAldU1
         pI988H/XSEbE8BHToqaUyKmJ0rZKntLPPp4CaXdyu0ZT0Skl/uvd7sLyJqmeHnsG97On
         YVZ5j0DVhOVuvfXMwe4fL2f9RKoR0lUDzVk7Z65XMBsaYvK44BIkIkRpVWbnnUAxFvdR
         YA0A==
X-Forwarded-Encrypted: i=1; AKwUvBwXJIMKTbdYdajUByXct6Mk3pN9nuQXt+7Ky5un7oQ2j2UKGid7uvDvMFkONEPrFel1rrWDgA/LV/N2@vger.kernel.org
X-Gm-Message-State: AFuF++mEO9zSY1mbGl3NT9/xr6w2erc/MD/jHV5Q08i4C7+IfWMG/SDC
	Ni+BWdnNNMbLgFBBFFK0r1sSPaIXiCP4v92nGPDiTs606yTAZWRr92bo1mM2IS/cpS5HvuSbhpv
	v/tsuWYBYN+M/DGUEML+nGYjIfoVMrhU=
X-Gm-Gg: AYBFou171xAC+CYDNVNAzrpby4zbZ0xXheUhnx71YhLV9EE0SlvJskqLearUufawCTC
	P9WJGde2KaG1a52Sm3bfsKJwztBpfXa6bzoEZRM/BZHN8Tf4z7GVFLWJan2LqBlGhdRTnqVbejI
	/wvcvrNmRqDRkT+/42Z+EYFlwPwVSI8l6ZoIP3VpvymxajOr1Pg5wqN1BIOLAafllCi+LkZQBwA
	jaTKT4kcxw2FXQwwVcVij4JWmhqGRqzSg/zDZA1KhHitWkMgrUqAhMnwYa+llIDjMLKbsC0A4IM
	M7gJ7VaMmefVAnIkmAsjMWbvl4pI9X/LXxeQGHpS1HLxdVd3w0pv5NTUIw==
X-Received: by 2002:a17:907:ea8c:b0:c25:4d9e:bb28 with SMTP id
 a640c23a62f3a-c25efb68285mr1154227766b.3.1788795038010; Mon, 07 Sep 2026
 08:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260905130002.554a167a@kernel.org>
In-Reply-To: <20260905130002.554a167a@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 7 Sep 2026 23:30:26 +0800
X-Gm-Features: AcwNN1Vvl2lnQu7OUmDQrL2TMEu35axYNEauRYInB38b5Eog8jJzDQ2t3ClFiz0
Message-ID: <CALj3r0grty9-s5FoXN-SHOrLkVoWgW+Ot5nHs=1wYzxV3hbC-g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 00/10] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=886=E6=97=A5=
=E5=91=A8=E6=97=A5 04:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue,  1 Sep 2026 23:01:00 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Not sure if this was already reported but FTR this series
> breaks allmodconfig build
> --
> pw-bot: cr

Yes, it will be resolved in today v4
