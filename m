Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9DA37E2E7
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782773474; cv=none; b=T+aVK+qIQdE6RYX17W3Fb/ErElVs1b0Y/I0bHeyBFLFGjBZ4JQL8tQAZ3uiKRDkzTEEvfQHI0nvgQcQ8pGiKZhC90CHePNO999P2toYCh/PazXnGzrcAtyL/Eh+O7Ks0l7iiO9+aAGAhHBWZyH4PhC1h/ss+7Dvnr6iN6L8Op4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782773474; c=relaxed/simple;
	bh=tkwBxMmSOT+KuOoFJZXGBNC5ucNjMDsj4Q95vZ+uw88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEdAQQZrOIo0Fdcp+8VA/eBeWSvHQ2Efw2a38SE+lfZ2p99oIVH9eCckGiVECWqdS9wcXSzEBjn73Svi39Xr6pdsGOa47jg9Ohrx27tKWEQWTdUn490zEnfkG3VlXS6WLAwQ6+TkjTbPRl1NOI++xvYayCT9sQbncSSnxRHUsFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com; spf=pass smtp.mailfrom=samcday.com; dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b=Vv3i6Ntx; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samcday.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b="Vv3i6Ntx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samcday.com;
	s=protonmail3; t=1782773464; x=1783032664;
	bh=tkwBxMmSOT+KuOoFJZXGBNC5ucNjMDsj4Q95vZ+uw88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vv3i6NtxaOqMSjW2NkoeAKCW9cZQJz1TDfCJldhBDm19VibhfR14R1VTuOHlhfyFF
	 D7DytWEySjVmYRCjX9u3a5Rwmdq20elYki254gAy3iO4pJsbRaY9wF2xYkv10F/YOn
	 CNNLWiNyDh7kHYsJM8sIEmrumAg+kfPqUVduRy1osb84CTqGYX5jyMtw9LL69LH2D7
	 X+QHqFg8jMaZQoNASVh/6yxzid0stHP5MKpmyUJ4uvNyxM7y6qHnQDYLrUePQc9ATF
	 8+2bNhxaCGcyofdEDibi5tyfQC6nPQd5Bz1oGlQKB1NPn70t0pJ7v1jBb2+OuYKZ4z
	 M/YrTbvc81l3Q==
Date: Mon, 29 Jun 2026 22:51:01 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Sam Day <me@samcday.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to simplefb
Message-ID: <6MmdbjsuzuidbfnSBPTziatRh-MvvYkxzODIjsq8bXLfdTs-DzdUHnwdKwSaxueLHWI3nKUEzU-rzwTdlAGbegYrjKf_IeLk-bynAUkxVOA=@samcday.com>
In-Reply-To: <r8tz7rKt6U-PclpxY-kaU-FgoxyZlZI1h-xRvonHnZFGl83UPA0T_sgF9ZNkSeRNlObH2HHdns2CF-XB1Gvj3foNLFfg-zVhNghcp-Ygl8E=@samcday.com>
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com> <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com> <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com> <92735f0d-9672-4f99-8cb5-28dd78eeeb8e@oss.qualcomm.com> <r8tz7rKt6U-PclpxY-kaU-FgoxyZlZI1h-xRvonHnZFGl83UPA0T_sgF9ZNkSeRNlObH2HHdns2CF-XB1Gvj3foNLFfg-zVhNghcp-Ygl8E=@samcday.com>
Feedback-ID: 25366008:user:proton
X-Pm-Message-ID: 8ee9728fa354808ebf4ed353ca1355c001f0f962
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Tuesday, 30 June 2026 at 8:39 AM, Sam Day <me@samcday.com> wrote:

> Hey Konrad,
>=20
> On Tuesday, 30 June 2026 at 12:24 AM, Konrad Dybcio <konrad.dybcio@oss.qu=
alcomm.com> wrote:
>=20
> > On 6/20/26 1:15 AM, Sam Day wrote:
> > > Hello Konrad,
> > >
> > > On Saturday, 20 June 2026 at 1:11 AM, Konrad Dybcio <konrad.dybcio@os=
s.qualcomm.com> wrote:
> > >
> > >> On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
> > >>> From: Sam Day <me@samcday.com>
> > >>>
> > >>> These regulators are marked regulator-boot-on, but that doesn't
> > >>> guarantee they'll stay alive as long as the simplefb does. Adding t=
he
> > >>> explicit supplies ensures that booting with MDSS disabled doesn't
> > >>> switch the panel off 30 seconds after boot.
> > >>
> > >> Why would you boot without MDSS if you want the panel to function?
> > >
> > > For my particular use-case [1] I'm trying to avoid taking over the di=
splay
> > > hardware entirely, and use simplefb until kexecing into the real kern=
el. In
> > > this case the user might halt in a pre-boot menu UI for a while.
> > >
> > > I can also imagine this being similarly useful for "recovery kernel" =
use-cases
> > > where again, it may not be desirable to assume control of MDSS/MDP/DS=
I blocks.
> > >
> > > [1]: https://github.com/samcday/pocketboot
> >
> > Can you handle this by adding a panel =3D <&display_panel> property
> > under simplefb, pointing to the display panel defined in the same
> > file?
>=20
> No, that won't work because display_panel is a child of mdss_dsi0, which =
is
> a child of mdss. So if those nodes are disabled (which is what I'm trying=
 to
> achieve), fw_devlink will defer probing simplefb.

I apologize for spamming you with false assertions! I just realized that
fw_devlink won't step in and enforce such probe deferral unless the propert=
y
explicitly ends with -supply.

However, I tried your suggestion and confirm that the LCD_VCI_3V + VDDI_POC
regulators are still turned off by regulator_init_complete_work(). Since I'=
ve
already embarrassed myself once today I'm not going to attempt to speculate=
 as
to why :)

Cheers,
-Sam

>=20
> BR,
> -Sam
>=20
> >
> > Konrad
> >
