Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02253DFC6D
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234845; cv=pass; b=tT6xNIEQ2x6bqtOs/bkyChH2VUmHABnRHxd+hU9NLvG5A36HKlTGhXSLvtMQ/wwAL+QLizjLcC0ugSITeXSVEHoiFd0HI1IcyBhKeFHZRWMlGQVzd44rsVsv+k9B1pJE6PNZ5VYi4qxQadGaVjfTa9fS1NOhyZ7jYwy2a//A1sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234845; c=relaxed/simple;
	bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mpx8TDzQNXHki36w5zIjN7HDlU07GGxhxRo1biE574ktoeUBZ5P/O8+yqdcgZvsYJoImVj/NCgfIl+j/gvxWXSomEQHvhcmgQkU6kHbtFcdYz4Rk1v6OvP8TDUc47f/iW1wUWlbuGPOjbzqySfB6rF+lGA1eWHTc3SDEsUWBA64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLu7YO1s; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLu7YO1s"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c1971f5efc3so132993966b.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 14:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791234840; cv=none;
        d=google.com; s=arc-20260327;
        b=S28QG/mauFOKWS2DkUHbjcaH+Z4xShXz3NQIWAI1LmIPYmCpWZlGNVFeMccbxbsSro
         TcimydzzvFZO773LNlHBZM5nRdATB1o9JvgJSr3DsR8fFaU9KRk6YBqv/6g0rfZVWxms
         jIrVUsujeHPXoHEjgQuNXbEhAwLCsCrMp/Tii0lDmQR+mutPTnYtwuBgMjZ8xVk+/IbY
         LjZQzYjBBkfDSBfGMu9NLq8N91v2kzXh97WKBZ1KXQinLsz/jkQoc2VsGnvzZtAkilnm
         XI1tpJzh1iSg4CsKt68IZoc5hEn7s7WEAjWtopt0PaAirWTi/C9RGBqDUX6TgEiTtkJi
         nFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        fh=rcblsJqMTVgIjguT7oc/n9Mzj2FFZHR8zN6iIUarA6Q=;
        b=g280dBD04suc4wejUaSPPlt5qm+9LuRPgeX+4EKbHZdToAuMCgQtS0K6RN8aubVYA/
         OqzJCN3mHuGNLowRAzI16C8tXkpyU8/R1rZ3ySZaBKJZU292BMe8cUwPcRI1c92xUsQh
         mGR+8NjczzV19nIGPyFVzTU3IfV54oCC11mKFk4ewLNijOPtR85FDKEE/wnd2lT+OYr8
         z/cWY8bN8A28yawPvKd/OiHSKNq8JCi+BibDc7/+TMsTee80fdo3ZI+x2Ek/VW5dY+6Z
         I1w9L5isBR8xyJa5LTcRrzXyHt6V0ujV+06nSqUMYX3GeOXDrcByTcCKYHT0xd2sw7iy
         cZ7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791234840; x=1791839640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        b=lLu7YO1slAZEk+Wl6hSffZxM6Snh1lZSsi+WQAaXaQP1v5bvYdKtKSYhsF25BnML4U
         HcAmNaR1PG9wcCytglUyreRWS7KO/AQPpJ7F9m9KzqPlnUqdYVvy2gRRLgQ2BIZl03K8
         xb9tmKEGvtt8s3ek77sLxtrQ7aINnKfHP0ZyIfCvUU8nQZHqAMo6SVbKZMkI7qKXCZik
         27/FLQ6WRy15QyDVTGHvsnjOdlYnpjD5DIJb3MjNJAUU5+imo662ezsCPYAzL2qWrAtY
         i8pw5jFnjpiDUwQDMWI+OXVq/Ui0SOLBkBll3qYBsMJJ61hCONI1cQM8TJCPUXJcJl2N
         rpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234840; x=1791839640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        b=nbS8fz/R2GlRB+OKMRS/7WRFoRP20o+40sU4MaDxrL0xliV2Pgp62TvF9X9+E11zsV
         jyUJcXpk5g/SZFzvaOXDxFIFKnUtySJttO4V/cytTSpqEKTP4fXA/Kjk+zBUpSUYAEmd
         Rfe7ouVN34skG8tXpWeviDjz2mbEhOjwwnWm2Cfio1CoeEb17pQJzzi6DxQvAwMaP8Zl
         huVoUzCZoOeuclrq+fYTWyDf8HUutUCCeoIh6kl7ApJw4s0chw91V87MY3kz4SllJtlT
         56h5KZPVWooaKMFdU2fhasWRirAJjv3+RnTkYjfSRsK0LA84idU7FApXkOu74TyRUQv9
         Lm7w==
X-Forwarded-Encrypted: i=1; AKwUvBx+z0qz9AEHf0yEelrgQn+xAmmoCfWHlUF4q56pqKA6DJnQD2eHy9wWXy8sc2V7hCXqEvtYziYgSNMF@vger.kernel.org
X-Gm-Message-State: AFuF++nbydgRZSTbsqxrVXdRVVT2h+ymGlXg3lKOiKy8ZxbDxpbHHV4f
	CnO4nyCYS7iEp47jwIuOAKjMX5IfOfjVGrKV/iK0WBur8xhIUySkBB31wNX4YNQhY3KF/1kSUlT
	QeL3tFIHyamUkOigIrlm33wyiocfvCuU=
X-Gm-Gg: AYBFou1+BecqhmMTyYSczuvKAACzlb0j6U4AoYh99n3+dtfJIul8qICi5Y0AffX2UoD
	xqWVVWlr4mrLvWSkI1cEe272d+HHW3fp2qGs4lIPk0BlGB89BhRt3UsFJVlvBRAk9lqWImtDUI/
	UsfnxdOb9nTgGC+m4zwzen2vbmmo60zo1U0z+3B44ugd+d3f5Dp+taieuTgRBlrovsbHWZ2hQDU
	AAcPRBJPY82utYiTI//rb/BkZL5cpfHgS96ekHcM8nDE0pEtGrxNTGq/oIeR1LgQrYXVu78c/np
	A1Jp4UzkYYDxAnKgtZGTI94hEwzniE7FmIr+AkX6+ZGn2Cs+QoAaTjsIyw==
X-Received: by 2002:a17:907:940e:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c2e4b2bc542mr1047723566b.47.1791234840255; Mon, 05 Oct 2026
 14:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20261005135833.37376f20@kernel.org>
In-Reply-To: <20261005135833.37376f20@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 05:13:49 +0800
X-Gm-Features: AclHuK96Q0r6tDkOyMFxRRlJTRgYT5CZFZq3doTRuVETMpVpnBIKbah20Qfa8QQ
Message-ID: <CALj3r0jgyhtmwSR03nZm4UJZ7dw6Y16X9N6-ASq9puY40zeBfA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
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
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 04:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Someone marked this as changes requested. Not sure who and why.
> I was waiting for an ack from DT maintainers.
> If it wasn't you, either, maybe repost to re-queue this for review?

Hi Jakub,

Thanks for the review.

Regarding the "changes requested" state: I'm not sure who set it, and I
couldn't find any specific review comment explaining it. If it was
accidental, I'm happy to repost the series to re-queue it for review.
Please let me know if a repost is what you'd prefer.

- Coia
