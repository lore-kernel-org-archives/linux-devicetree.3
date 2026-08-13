Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B87375F69
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610452; cv=pass; b=T6w0cyZSNQ0R8Z3AaCrNI9hYXZJqAtzXY6k9ZT+q6+Pral49TKdm9uB76sDhm4yckD4N73/GT5Xy07GsirZ7Kkf8EOx2UZFY+kH3fq16eDoel6ufGHzWxQoOagbkdRzvxKO6s86h+R5ShQtzYRRcxqWIXau7KuEDeYo6uLJbca4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610452; c=relaxed/simple;
	bh=TClEoJsq0ggVTCXaYTDr62G718iMq9uV18dUpEwxTBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnqC/aVDKVPB/EeaqcGOh/EGLmc5+Tik1aTnzmu6yHW2ZFYBDeW+MF2JpBY2CnRT99Fzsi7u9zkvy9Ty/GrML8YpXiYGYwuHpln+Qz6uk1tseJnA43zRGetnz1TzU52zw5T6tuJ/W2to+dKmaVTxvxhwNDJWzXbru7tqObXu7dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUHg1ddm; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUHg1ddm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a18b91fb1fso334638a12.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786610449; cv=none;
        d=google.com; s=arc-20260327;
        b=e7FG2bbIJG54KkZQHo9rYXIdvgSSMrgzebpbZUnNKNoO9vZ2tlpKOwTyEYFlOjrwu6
         EhYsB5A+db9yPSbSB1LHh5BIOCafS+ROjfE1LfEgLf/7hcWfgBWdfxrCNEEeHGGZvRxs
         XBoK/8qyLc+v20cs0MNdnS0b6HBh55v83/crif5Uk5dhuZZmAOtqXYU9wfoIsw8d9zBs
         pUnWgpNDgZgirxazLoyXgjoaBmMkYuKx2PQ9SdIXlBxPKxLRv8g0PUsyF9iXhgrFAQoa
         z8TanBl/PZ2+D+C2HZXCld9Z2OVwBUNrAS3Fv0z3cUtuL+6QG4gtiJdgYAFqRppARPLx
         1I+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TClEoJsq0ggVTCXaYTDr62G718iMq9uV18dUpEwxTBg=;
        fh=EXEnoQFprd8QaoHfTtHCI8YPYneAEe5zQBeaFT6qyyM=;
        b=GrJ1V2ZvXgRofgVPTNeH7cikmmYqXS+ozK92MLBEmL+v24TDigWYP9Y84Gnby0BAnR
         qQ4fCFHY3E4CbUty+zXqOx38ncphyqaLBMUEAWaBlngfYjStcoeddwmPspgyHpPsMcRa
         4vTRlOwKJ7Ila/O10VtEOEzwefendZjc+HA4w4lfd8+nEoVJJOx55rcIpC2PU6YuLfLD
         DUw3ehs7tZNAkysFJQF0Znug0/ROWG50Lw+pO0f6RcoDKF9/VyWruMJnkdTALSkbyQD9
         LGIGX/intYz0ZgfVU0p/axzKEPLwEyulcJi8GBUlHQR0/flnHcdQpXp5Sp/naINqA8Ya
         hrmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610449; x=1787215249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TClEoJsq0ggVTCXaYTDr62G718iMq9uV18dUpEwxTBg=;
        b=BUHg1ddmiUpZgVVoRID/lvNflb9CPCuefphIVqUZFcQLLrWoUpkLc/lidjjEeFlcXm
         Pe7my45eLMDEymgL6flnAFqNGjznWffGbk/sunGj5MJE5+8XCoBsi+FduZmjSsxcnl/j
         c/UcvmyBXXk8SxGQS8hA5XFcvDNWSvcPJ2v2xptDz70M595Nh+bD4KL56hzfYBENkcR7
         E5LDZ78qQGbU7LgonIAqsojC5S7OBwt11B5m0Mt97i/ciRa5bdEXRypmkucNYA9a4rXa
         POZujlcHpd1HScdmV1vyZfqmAzkFvemigmKufP5NotAJdkuun09kmbQ1EsJxdwzTWHmr
         78zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610449; x=1787215249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TClEoJsq0ggVTCXaYTDr62G718iMq9uV18dUpEwxTBg=;
        b=MfEK1uvrH5mrXGV7nQ5ivsDAO7wxyCVVUfp7yAfFWNYcbgjkbQ3/SL7okg6jIB8mmV
         X+tZkOXbzzkjjLNUGYtNiBmVmuUP8G9UktOxmpfNIf1qJNUMstLRBSWojQTRHiYhPSSG
         MW4KXlFLGZdYtgP9faKdYMDhFej/Ad4r7FBK+abszBgt1c9zBLx4mbrEMBr6JaZXcFVi
         H5D/EMLYuyJKuXuiuohm5Am86ewa88VO4YeClDwxfk0RlfY6Q/xWWQgrVwN0WzlZ+MHe
         9grmJvyAWHJfI/0M4H5wfxSI2mOA7foQXwEEaEdBjSI8hU0HIibF0tb/RIfodAeorp8G
         o3Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rq6GExCAiNQUijSEEnEJBC4ErWttSHO7lXEQIzM8G2X+/IpIpriv6JdM93ndEeP/5J8DjklF3eHQ1HF@vger.kernel.org
X-Gm-Message-State: AOJu0YxT3HU596/UxDr419GPyvCvjimSCugGm+4YQ1D7fHR7bHZlLzrG
	U/mCo1gt77kzNNUkxM+B7wmWf1odcgobRdCq0UOGeZX7+zsii/WJz+XojYDXtLLu7QlKbL9MZP1
	iDW+J7/4cFKP09UXFHgl6t4yBBG4gvIE=
X-Gm-Gg: AR+sD132JsmkNZzr/ms4e2bSoRnr0TmUZUgYDVGpUEW1M83haDXN/MBWJ1fzBeUpjWz
	+Fg7mms0ZSjD2qYeAV2kCTMwXrrANe0z08VhED+PyQ4drd02xsjtdbLvVGqcnt9P5rSdYSgLRZO
	0oY1OYzt5PMeaL7YCsK4A7I9XfnbxIA7cIyMDTesczEp+tOz+uIG/h2s4v3wO7pwabBH8MSbZny
	iLkNrPWw5J1aC2iS1WGlIUjUg4oIVEmiEWsu++jMYjOtZc4ktxtebl/nkx/nQ/buwmMVRt6rKH4
	wnfoKig244jqKL3oqb9Sngzz9TEud9VbxYUYxeIh3x0D35RMQPICIg==
X-Received: by 2002:a05:6402:1f86:b0:6a0:19c8:f9c0 with SMTP id
 4fb4d7f45d1cf-6a381bd91aamr837533a12.4.1786610448674; Thu, 13 Aug 2026
 01:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com> <20260812-refreshing-rampant-gecko-b38ef9@quoll>
 <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com>
 <an0FMnDSWbud8hPc@venus> <CAPwA33+7k7HMC7ezwH+MGn64iRHT6tVNK55t6gaC0nkkqWoE4w@mail.gmail.com>
 <20260813-imposing-cunning-raven-fcad40@quoll>
In-Reply-To: <20260813-imposing-cunning-raven-fcad40@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Thu, 13 Aug 2026 16:40:37 +0800
X-Gm-Features: AUfX_mye9jktuvnjIqJR--jOE-SjnI1mJ-tyZFHa_AmY4WZ5Toj9QFewcV4UoB8
Message-ID: <CAPwA33L-x=H+FU6-c9A8uKqhKbsfxcAJaaG49rUfnjvWk0f5mA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am sorry about this. Since It's my first time to commit patch to the
kernel, I want to make sure my code and reply is correct,
so I actually paste my reply to AI before I send, let AI to rewrite my
words. I will fix my approach, and make sure V4 and afterward work
is worth to review.

Best regards,
Jason

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8813=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:59=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Aug 13, 2026 at 12:33:52PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 wro=
te:
> > Hi Sebastian,
> >
> > Thanks for the review.
> >
> > > Your new binding is lacking too. If you select <&mipidcphy0 PHY_TYPE_=
CSI>
> > > you defined the direction of the PHY, but will it operate in C-PHY or=
 in
> > > D-PHY mode?
> >
> > You are right, and I am sorry - this is a regression I introduced in v3=
.
> >
> > v2 already described these as two separate cells: the first selected th=
e
> > electrical layer, and the second selected the direction. Michael Riesch
> > suggested using the generic PHY_TYPE_DSI/PHY_TYPE_CSI constants for the
> > second cell instead of the Rockchip-private RK_DCPHY_DIR_* constants [1=
],
> > and Vinod Koul agreed [2].
> >
> > In v3, while making that change, I also mistakenly collapsed the two ce=
lls
> > into one. That is what lost the electrical-layer information you pointe=
d
> > out.
> >
> > For v4, I will go back to the v2 layout and only rename the second cell=
.
> > This keeps the two dimensions separate, with each cell describing one
> > thing:
> >
> > /* MIPI DSI host - the transmitter */
> > phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;
> >
> > /* MIPI CSI-2 host - the receiver */
> > phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;
> >
> > The same applies to C-PHY, so the binding can express all four combinat=
ions
> > without any further changes:
> >
> > phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_DSI>;
> > phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_CSI>;
> >
> > The driver accepts all four combinations at phy_get() time and returns
> > -EOPNOTSUPP from power_on() for the C-PHY combinations, as it did befor=
e
> > this series. Boards that only wire up the transmitter keep
> > '#phy-cells =3D <1>', so the existing in-tree device trees remain unaff=
ected.
> >
> > Before sending v4, I will go through the code and commit messages again=
,
> > so that the reasoning above is captured in the commits themselves rathe=
r
> > than only in this thread. I will also re-test the series on the board.
>
> What is with this practice (third posting I see this week) of pasting
> as reply prompts/tasks for AI?
>
> All this is just wrong approach and your patches will be ignored if you
> act as a proxy and keep playing with us that way.
>
> Best regards,
> Krzysztof
>
