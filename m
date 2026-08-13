Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D782F7F13
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 04:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786595648; cv=pass; b=T2usL5U1/FL5NZDz9cayZrc/wNd3/PokCax+t+V7WaEtLknRif+WQ+RjIMpFaanOm6UXusvdXe+UxaoRnA6Dqbg02xHt1ydeiOsvMx6bTxxxXTTD8kqicfqiVtIes21nPXxQxJcZjyqnK4SpWFZynizeu1XkX94/Is8ev2G8mNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786595648; c=relaxed/simple;
	bh=LWt9GMlkQ5SKTKoLjtBj5Z7tRqHhXQnrfKMH2pIVYjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8au8sGcMxBgIn7XNdXVRuzWUPas/9swirQq9GLh3HOoQwKrwAI7/p1EH2lcgDhsCS6Ep0+MSOp3SOaqSpdyIWVnJqYuVcpXcq1178+FQh2xVCzeVnzm4+Gu4jB0/DMEkSWAyrwz+HBisjyAXCYfWJeAST7cWbGPJagL4Wy2KAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULZPFBsA; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULZPFBsA"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69edc72e513so274656a12.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 21:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786595645; cv=none;
        d=google.com; s=arc-20260327;
        b=IPTsYy7noVXJioxLdZMHDrS+8Ej1SH0f/bIkKmmFxKRyfy6KBXiSjgsoCs1TM1bovV
         YzURniRvGb7aX7ULtZzKktgl5+G2PZGXysnEzKIZ5ZO9DX6AgVGH7dkDxSM4yzv8CyD9
         IcxQ0/GaiGZm8vThQivmwY+slRkdAGjNn6PNDMqlh4DwqtE2IR072cqqf3sjASNwgotr
         0thGeEKdbnuW23X6o0NowF+tgBW0+mZXqgEve4MTy0kysmAJRfi5+Pzhmrd05FcVxV/Q
         YIKl5GK5QpUGw6n29bNIMVm4i+SJZmiudHqwLX8z+v97PverkGL6fBadDOOhIUZsKiPZ
         wVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LWt9GMlkQ5SKTKoLjtBj5Z7tRqHhXQnrfKMH2pIVYjs=;
        fh=tR33Ih/WYI+y7DM27j49rz3N6jV5lwRXZz4BbOkiyn4=;
        b=PDhOHqM8yqpcAPzUspjvDNXAfttCw2i94qkeLqHhOEkVh5q+VVgWxqpzfBv7NflitS
         G/IOJROQCo80QrwkvHVfeG8HaM5pEnvq1kNg5UkdQEko6DcHA+DX8GKAGOFovYsjzMFP
         EnaBhvwlLuBJmWDuZqvNhsNpWdNwQuJcWsukWYR+KzJU7yDzr99+vKwhNhQCY8NBSwZc
         XorePgNxQ3Ec3jXlN6MFkSnOc1Zlqxfd2igsqoynjfU8JK4rYWfl/BTUGtQQHoDAITKT
         0AVYm+bHa4mtWQG3nnInE/YczLlYTcVd8PFG3J03GWKu2eQB4oQa19+Qg/GE9YbfqXU3
         p8jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786595645; x=1787200445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWt9GMlkQ5SKTKoLjtBj5Z7tRqHhXQnrfKMH2pIVYjs=;
        b=ULZPFBsAy17Gr7W80/B+L4r8JUGZKehE8V3VYm+sP0Z0J24sbS61qR5i2HOuZZ52UW
         b7hSzOyMX/XfnYYem9Eb066eAtZGSFTfQTJ8r+w24+cpMsLaCWcp07Wl1sAigtPxRDgH
         Nn/ZwjkvrkNp1v1MkVoIAaH9yIIAiIwoHlOg1y+kFZYemSfWQ3lA0ny1vCA7iy1R0mqi
         84vvd2j5lkG7YeZ5YobAx+cBhFWewF8I7fYiXfJ7IuwyaJ4h5Hb12rKPcjXUH8oIGkTM
         7EUb4TqPS/h1SMCs7KOE8kKZCrMKDs+LQY++NXoCV7s7LG3xpH8AZYa7er/V0R5qd70C
         DaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786595645; x=1787200445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWt9GMlkQ5SKTKoLjtBj5Z7tRqHhXQnrfKMH2pIVYjs=;
        b=afTb+MFLrs1aEv0vFHrZhYyyGQ99SxeJuwRxAgUo0a6Pd+yoJ3haabxUseIBRRa3zI
         nRqzifo755F4Pn2ZOVFuSs/aiO9ecXy4EYHBUNeGyf/Syl5IaVevDrVcmxwCmlhwpPGf
         WTbbg9+6imXmNJEdsNxpnKJjOkebsJad6mKmFfNxO9+ATVwsQIFMJbyT0UTxXhk6K4sW
         OlwUsEaZRKSmcLGXZtKeKtOvZBoMjD7jorQE55QS5zosDRicYeTOjqMnMZS6fyoIFF+X
         F1O6V5fmb6b68JV1PJ0eMSABLp7MGt1fGWXHer1Y8XVarjZ3HEPOkAwKNW/yYN3antk0
         X08g==
X-Forwarded-Encrypted: i=1; AHgh+RoegXtyFRte8nMn/43fI5KHteMA3rFNcuFlKOJxU28eJIxn+gIT4dwNrJlwfdt+8yJiB5lrqAChByZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVCQ8S7xnHqw+VIc/Ow+ZSyavwUZUFlZM+Yo1ydBFxoLA0zW3
	rSb2AOyLDsntdA7gDobExScr7yvU1/ANqgZjPkAPqsRzPgPhULYht5cgBxVTzolFUqQ0gtS6udI
	8OKthd73ncRCLUKTjfS8vtxVwQxjwRd0=
X-Gm-Gg: AR+sD12+dp7qjSTOq27xn1ahLIyFwj4jf7RCmQQ1JlOrpkf/3mkG7LW6zQjfwdWudtT
	2Tlu6sH9/UOMdZLx8AW6IFy8RzGJPubLrwnSGMZwReAk5JgJWlFiJ5otjc/VNtwADn1nGVbK8s7
	9SceQOAqkZjMu+7yu7Cj/hMMP+5f0dC+4IrHoaR0vZ7tLHAnWGHgzbxcJMZhIsXCxPkWLeKhb6x
	YZXIo4jZi1bu7HX0NTaAR+cbva6zVBMd/S4RkPccxnX4dz2rlrRILSdNfKfcQgep7mjWDGquB77
	ktDnlhsdQF9UzZ4yVWNfjQKBtZC3sp0u6VdXoyw/cZI=
X-Received: by 2002:a05:6402:4285:b0:6a1:f95b:8cfa with SMTP id
 4fb4d7f45d1cf-6a38057b8e7mr588108a12.1.1786595643974; Wed, 12 Aug 2026
 21:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com> <20260812-refreshing-rampant-gecko-b38ef9@quoll>
 <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com> <an0FMnDSWbud8hPc@venus>
In-Reply-To: <an0FMnDSWbud8hPc@venus>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Thu, 13 Aug 2026 12:33:52 +0800
X-Gm-Features: AUfX_mwIpoDBN6_Xma1YlUJtYi1wlkbDTU_6WkCYu-2CI0nPqWhdFEDAcDuwlbU
Message-ID: <CAPwA33+7k7HMC7ezwH+MGn64iRHT6tVNK55t6gaC0nkkqWoE4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Thanks for the review.

> Your new binding is lacking too. If you select <&mipidcphy0 PHY_TYPE_CSI>
> you defined the direction of the PHY, but will it operate in C-PHY or in
> D-PHY mode?

You are right, and I am sorry - this is a regression I introduced in v3.

v2 already described these as two separate cells: the first selected the
electrical layer, and the second selected the direction. Michael Riesch
suggested using the generic PHY_TYPE_DSI/PHY_TYPE_CSI constants for the
second cell instead of the Rockchip-private RK_DCPHY_DIR_* constants [1],
and Vinod Koul agreed [2].

In v3, while making that change, I also mistakenly collapsed the two cells
into one. That is what lost the electrical-layer information you pointed
out.

For v4, I will go back to the v2 layout and only rename the second cell.
This keeps the two dimensions separate, with each cell describing one
thing:

/* MIPI DSI host - the transmitter */
phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;

/* MIPI CSI-2 host - the receiver */
phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;

The same applies to C-PHY, so the binding can express all four combinations
without any further changes:

phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_DSI>;
phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_CSI>;

The driver accepts all four combinations at phy_get() time and returns
-EOPNOTSUPP from power_on() for the C-PHY combinations, as it did before
this series. Boards that only wire up the transmitter keep
'#phy-cells =3D <1>', so the existing in-tree device trees remain unaffecte=
d.

Before sending v4, I will go through the code and commit messages again,
so that the reasoning above is captured in the commits themselves rather
than only in this thread. I will also re-test the series on the board.

Best regards,
Jason

[1] https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabor=
a.com
[2] https://lore.kernel.org/r/anSuxfeitSqmSHNr@vaman

Sebastian Reichel <sebastian.reichel@collabora.com> =E6=96=BC 2026=E5=B9=B4=
8=E6=9C=8813=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:03=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Hi,
>
> On Wed, Aug 12, 2026 at 08:24:11PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 wro=
te:
> > Thanks for the review.
> >
> > > I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> > > Isn't DPHY implying it is DSI?
> >
> > I see your point, and I did not explain this clearly enough in the prev=
ious
> > version.
> >
> > D-PHY only describes the electrical layer, and both MIPI DSI and MIPI C=
SI-2
> > can run on top of it. A CSI-2 receiver's PHY is a D-PHY just as much as=
 a
> > DSI transmitter's is, so PHY_TYPE_DPHY alone does not tell us which one=
 the
> > consumer is asking for.
> >
> > That is the problem here. The RK3588 DC-PHY exposes both a transmitter =
and
> > a receiver from a single PHY block, which can be used by two independen=
t
> > consumers at the same time. This is not a theoretical concern: on this
> > board a DSI panel is scanning out while the same PHY receives CSI-2 fra=
mes
> > from a camera. With only the electrical layer to identify the PHY, both
> > consumers would end up with the same phandle cell:
> >
> > dsi@fde20000 {
> > phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the TX */
> > };
> >
> > csi2@fdd10000 {
> > phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the RX */
> > };
> >
> > There is then nothing in .of_xlate() to distinguish the two requests.
> >
> > I will make this clearer in the v4 commit message and include the examp=
le
> > above so that the reasoning is easier to follow.
> >
> > For context, v2 described the direction with a Rockchip-private
> > RK_DCPHY_DIR_* enum. Michael Riesch suggested using generic constants
> > instead [1], and Vinod agreed [2].
> >
> > [1] https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@coll=
abora.com
> > [2] https://lore.kernel.org/r/anSuxfeitSqmSHNr@vaman
>
> Your new binding is lacking too. If you select <&mipidcphy0 PHY_TYPE_CSI>
> you defined the direction of the PHY, but will it operate in C-PHY or in
> D-PHY mode?
>
> Greetings,
>
> -- Sebastian
>
> > > Your tag goes the last.
> >
> > Sure, I will fix this in v4. The Signed-off-by tag will come last, and =
I
> > will check the whole series again.
> >
> > > Two simple defines needed Claude.
> >
> > Yes, I agree that these two defines themselves are simple and do not re=
ally
> > need AI assistance.
> >
> > I added the Assisted-by tag because I used AI during the development of=
 the
> > series as a whole, including cross-checking the code, writing additiona=
l
> > test cases, and looking up the relevant sections of the TRM. (I checked=
 the
> > corresponding sections in the TRM myself, reviewed the test cases, and
> > re-ran them on the hardware before sending the series.)
> >
> > I also checked the current mainline guidance in
> > Documentation/process/submitting-patches.rst and
> > Documentation/process/coding-assistants.rst. Since I was not sure how m=
uch
> > AI involvement should warrant tagging individual patches, I chose to ma=
rk
> > the whole series consistently.
> >
> > That said, I am happy to drop the tag from this patch in v4 if you pref=
er -
> > I wrote these two lines myself.
> >
> > Thanks,
> > Jason
> >
> >
> > Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=88=
12=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:51=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Mon, Aug 10, 2026 at 08:10:09PM +0800, Jason Yang wrote:
> > > > MIPI D-PHY and C-PHY blocks are increasingly direction-agnostic: th=
e
> > > > same PHY IP can drive a MIPI DSI display or receive from a MIPI CSI=
-2
> > > > camera, and combo blocks like the Samsung IP on RK3588 expose both
> > > > directions to independent consumers at the same time. A binding tha=
t
> > > > needs to tell the two consumers apart has nothing generic to reach
> > > > for: most constants in this header name a protocol (PHY_TYPE_USB3,
> > > > PHY_TYPE_DP, ...), while the MIPI entries name only the electrical
> > > > layer.
> > > >
> > > > Add PHY_TYPE_DSI and PHY_TYPE_CSI to select a PHY by the MIPI
> > > > protocol it speaks, which also implies the direction. They do not
> > > > replace PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice
> > > > where the cell selects the electrical layer. First user is the
> > > > Rockchip RK3588 MIPI DC-PHY binding.
> > >
> > > I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> > > Isn't DPHY implying it is DSI?
> > >
> > > >
> > > > Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> > > > Signed-off-by: Jason Yang <jason98166@gmail.com>
> > >
> > > Your tag goes the last.
> > >
> > > > Assisted-by: Claude:claude-fable-5
> > >
> > > Two simple defines needed Claude. Great, that probably makes AI
> > > conglomerates very happy that we do not type even two lines anymore a=
nd
> > > need their resource-hungry data centers to do that for us.
> > >
> > > Best regards,
> > > Krzysztof
> > >
> >
