Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A40D36920C
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491595; cv=none; b=O4bEH476coHs67VUt5QzNz/x0foqtyp0bc9zi1URCGMwCStxh8fi6/B6mRTO6mDWOj5yXPQ9X8Zl0mnjeZq7Q31XA+ERXS2vVIvm2imRw+ALEz+tfy7HF26sZBFSVLUH/af4SGf9y80OmM9CFIEe2zD2kcrvqi2mht5rYhRrpKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491595; c=relaxed/simple;
	bh=HXfSaKwaFzTSBH/qZwISRTV4/1uglxwps3LuuKmtlng=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSUko4/AaNQvLudUuGRbCMoMBt9xcnvS8rozElGgQjw+hcskbOt/jLMwsRPIMnZtZu+FPeKgfEHLuHTSfDnK7m7Jv5GoET0bSmejyCmW6BWdgdhBxOOvjt4W2/upanTH/4wr4xmsDJKDJUBruWCc1R228E1H8p9GPYzprx6YtKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=H6Pc63oZ; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="H6Pc63oZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780491590; x=1780750790;
	bh=zaaajWuNCVDgD6MaHUWpYX4Z16zlBDOLHGoI+iLmK4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H6Pc63oZGiw72tBc4X5vHQpakGJw0+nvEF3vWWSM7YbvXJ0yGcLrf7zPoZ8dv5g0B
	 4ki/0IplEAb47MTZbZ0ILEEzBLXMkHPVetgy9rl8TOjksvjUMaKAV3zezbo3N69uC5
	 tsvGGIARrLzRt0Gj9GGJqKQWKkqvKOCazOWfKCytn+zsu7yXNemRXyS7VSKD2omg2F
	 L7gu4X0PMyhiMFMe4krPaEV+c2BWKC5UB03dHiNHiYKzUqsjg8uQp9RaROAM38mycv
	 0nKDVhBlhPdRoVmXXTH7wXQTddllrauFeA/xoj4UI6hnQRkXZJ95RwvJ3vmDnl/snK
	 V7iP7/Pz8jdKA==
Date: Wed, 03 Jun 2026 12:59:44 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Message-ID: <4Fnu-d1cqR09ASN7DZABvKUO9mibDR3sRDoETHQpnOhzFTdtp-QIjy61Xed2OMB4Ddw96NGv7a4pmLNFXQESxWfNCLv9xQfyeWqAi_IdGNc=@pm.me>
In-Reply-To: <hs5roqpupi7svf4pyylvseqx44s6jcwnb4he36psoijjeeizbl@aq3b7k3xffxn>
References: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me> <hs5roqpupi7svf4pyylvseqx44s6jcwnb4he36psoijjeeizbl@aq3b7k3xffxn>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fa33e3313ed6f1df4429c7e69f106ae27453999f
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, June 3rd, 2026 at 8:54 AM, Dmitry Baryshkov <dmitry.baryshkov=
@oss.qualcomm.com> wrote:

> On Wed, Jun 03, 2026 at 12:41:34PM +0000, Alexander Koskovich wrote:
> > The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
> > and gives a warning. The 'interconnects' property is also missing from
> > the binding.
> >
> > Dropping the nodes here and will just submit panel binding & driver for
> > use with MSM DRM.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  .../boot/dts/qcom/milos-nothing-asteroids.dts      | 38 --------------=
--------
> >  1 file changed, 38 deletions(-)
> >
> > @@ -131,15 +107,6 @@ ramoops@81f20000 {
> >  =09=09=09mem-type =3D <2>;
> >  =09=09=09pmsg-size =3D <0x200000>;
> >  =09=09};
> > -
> > -=09=09/*
> > -=09=09 * ABL is powering down display and controller if this node is
> > -=09=09 * not named exactly "splash_region".
> > -=09=09 */
>=20
> You might want to keep this node.

I have it dropped in my working tree and works fine with MSM DRM,
unless you're thinking of keeping it for out of tree simplefb users?

>=20
> > -=09=09splash_region@e3940000 {
> > -=09=09=09reg =3D <0x0 0xe3940000 0x0 0x2b00000>;
> > -=09=09=09no-map;
> > -=09=09};
> >  =09};
> >  };
> >
> > @@ -507,11 +474,6 @@ vreg_l12f: ldo12 {
> >  =09};
> >  };
> >
> > -&dispcc {
> > -=09/* Disable for now so simple-framebuffer continues working */
> > -=09status =3D "disabled";
> > -};
> > -
> >  &gcc {
> >  =09protected-clocks =3D <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>=
,
> >  =09=09=09   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
> >
> > ---
> > base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
> > change-id: 20260603-asteroids-drop-simplefb-0aeb1d1bbadb
> >
> > Best regards,
> > --
> > Alexander Koskovich <akoskovich@pm.me>
> >
> >
>=20
> --
> With best wishes
> Dmitry
>=20

Thanks,
Alex
