Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6993D389E1F
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 22:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775168057; cv=none; b=MIBg7cDwoavS9ePdvpzDi0vDOe+Y4f9ch2AFey8zwcOBZQ/Bd3zBSenlb09yKbF7Qy9AJJA+P3ZjZQFszWsSNhNjVlGSwPeGhsuUzbHqu6DyufAUga+ZIwHECDJCeRor+cYWqx5LfoowKmUx1XVoqaV5Jkao9V4X1fUjpnLmGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775168057; c=relaxed/simple;
	bh=fB8Hj7kJM5mSf18WSQyY6XbK44fgKlgfzeYX1184pYs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHIShcgvlmFy1vjfnwwEdN0NE/tSrfuzx1OUSesx6IEuQNn0BEWyzJBGvhpkquX2ZXPzBQloRIJ0hLz1cvS5DZ+Z/dxjlExOthUFM3/2quObNpbc66Yd0F6hdIunduM/eZI65d06Rb+ZRU4qLEwEfcHaKpzav32zfU9wzv8Xzmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Pzc7FSlG; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Pzc7FSlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775168049; x=1775427249;
	bh=jCVxWp1Wa9DZrYLVZygaJiD6PPNzR/XYIA5bc1ilxoM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Pzc7FSlGncSn9+Dho8TL2mFejNm7yEwhSU4bclcihtXJ2Gx93GiFeFzBaSK14l873
	 6KtRMy0nq3+1+Yjmo7JxqUYDkJ+8ioPozIP2Hev2evIW6GTtToDvL10iXrsF8bUPh7
	 eRqHP00lcNvOmQryJy/rNNV57xa9iGFaeHL+QWSf5ecn/hIgzhrC7zZ8mpJ6NFy4wN
	 YpRKLNCx8GU60GSG4Cok55wGjAys+fuUqtu7q52pznSO34jDea7xsFqe4s4cXWjbia
	 ohSGhfFMlHdWBpLMU28p4SGGxueb2fJbcaK8AnyiPRVZ4Y4QDifU7GFJTvTeSHfDdv
	 eWpRgKqi7/eVg==
Date: Thu, 02 Apr 2026 22:14:03 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/msm/adreno: add Adreno 810 GPU support
Message-ID: <hvcBm15eFRX0ZonD34zzneuD50ceOzKGo1pE8LkQrQL1qEb4t0pEA4ankxEViVr7lwghJeGOoYp2ub8Ti2idrIzMfBXHBqnXejwukigxz9s=@pm.me>
In-Reply-To: <6da36e75-effb-4e3e-a2f9-c0f3ebdbcc21@oss.qualcomm.com>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me> <20260331-adreno-810-v1-5-725801dbb12b@pm.me> <6da36e75-effb-4e3e-a2f9-c0f3ebdbcc21@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 3bbaf83d1f497f4183e13864bd345040f061a6ef
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, April 1st, 2026 at 6:15 AM, Konrad Dybcio <konrad.dybcio@oss.=
qualcomm.com> wrote:

>=20
> I may be on an older tag or something, but:
>=20
> $ diff /tmp/downstream.txt /tmp/upstream.txt
> 24a25
> > { GEN7_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> 27,28c28,29
> < { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> < { GEN8_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
> ---
> > { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> > { GEN8_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> 31,32c32
> < /* Disable write slow pointer in data phase queue */
> < { GEN8_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
> ---
> > { GEN8_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
>=20
>=20
> > +};
> > +
> > +static const u32 a810_protect_regs[] =3D {
>=20
> $ diff /tmp/downstream.txt /tmp/upstream.txt
>=20
> < A6XX_PROTECT_NORDWR(0x0ae00, 0x0),
> < A6XX_PROTECT_NORDWR(0x0ae02, 0x4),
> ---
> > A6XX_PROTECT_NORDWR(0x0ae00, 0x6),
>=20
> -> the difference is that
>=20
> SP_DBG_ECO_CNTL and SP_ADDR_MODE_CNTL are not protected
>=20
> that might have been a part of the ^ difference

Going back for v2 and making sure this is 1:1 to GRAPHICS.LA.14.0.r5-03100-=
lanai.0, I
think I was going back and forth between my own downstream from the OEM,
GRAPHICS.LA.14.0.r5 and GRAPHICS.LA.15.0.r1.

GRAPHICS.LA.15.0.r1 has gen8_3_0 support, but I'm not sure if there are any
devices that actually ship with it on that branch. Seemed to be fairly out
of sync from LA.14.

>=20
> Also it may be that the better name for this table is a830_protect_regs[]

Can you elaborate on this? The only names I know this GPU by are "a810" and
"gen8_3_0".

>=20
>=20
> The other tables, I'm lost. Akhil, please take a look.
>=20
>=20
> Konrad

Thanks,
Alex
>=20
> 
