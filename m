Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE253AD509
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772763; cv=none; b=CQTDug5piO2R1/1x/LMlo/LkSfvW6uduMrNYbElJDB4anJf/6xDpUfhenalGO6ArrSzz/ysXjXIAXDgZMMdes6t2hcxDz5MmL3qLgVy/M5bHJ5KC478dwKSgjsEERefD4qgH88LnaCfwGMQqaJo8zwuUCkSmOib/8iP2zbKZddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772763; c=relaxed/simple;
	bh=cU7qgRD5CUyt/AWPHXyeCIOc15QbXFU+izYH4D83l8o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LI/oxwycs3BXoqxEcn8C5vlJbFcELRt6griWnEi9g02YV9sUYeM7RktXtBfV74uNvAL7YJm9SzSU+9WKG+yi+xlbzXLqIITD1KpbTI890nMn/lxnIr6O9l5BSmzhT9C9/IEaFgHFxYuz796FAEJ9pmf1ONrSm1mrT7zBZJiTWts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com; spf=pass smtp.mailfrom=samcday.com; dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b=bmTkq/o2; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samcday.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b="bmTkq/o2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samcday.com;
	s=protonmail3; t=1782772750; x=1783031950;
	bh=1y2XH8sLrCpaIzF11qEPLRUqGQW/1UdCBmWGxHDyMA8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bmTkq/o2RzQCYrqi5GenIbdRda1/UF8plhnxN6K9AAecwF+LfoD54DBxfC8xUha5H
	 akYFIDoRxajrGrxfvU8S6+FauwrdWCK9AlqeKK0R2Kjo9Wz8SpFkgXVUQBBAypXLdQ
	 sKyfOW5YYHaOepAXclP64yxLUh+heqj6WCmE8lVQamuCx2J4YwEuCXSkwZm+y3/V1j
	 UT2uAR32FM4Te7gYpbXWMAr2DsWwwOR42i9Q+7FZLbv0Rcxou6wOD9ndKr3Fke7RcR
	 k84/GrU7fbb6EI/z1QGx6nE8nrBqwf8JYIi8ycoT4DgW5xAacYX/io4kkZEhQnhY2p
	 hcSb0yukIHO2A==
Date: Mon, 29 Jun 2026 22:39:00 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Sam Day <me@samcday.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to simplefb
Message-ID: <r8tz7rKt6U-PclpxY-kaU-FgoxyZlZI1h-xRvonHnZFGl83UPA0T_sgF9ZNkSeRNlObH2HHdns2CF-XB1Gvj3foNLFfg-zVhNghcp-Ygl8E=@samcday.com>
In-Reply-To: <92735f0d-9672-4f99-8cb5-28dd78eeeb8e@oss.qualcomm.com>
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com> <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com> <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com> <92735f0d-9672-4f99-8cb5-28dd78eeeb8e@oss.qualcomm.com>
Feedback-ID: 25366008:user:proton
X-Pm-Message-ID: b67eea3511ea3bbd2bd6f388eb0142ca2fc779f6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Konrad,

On Tuesday, 30 June 2026 at 12:24 AM, Konrad Dybcio <konrad.dybcio@oss.qual=
comm.com> wrote:

> On 6/20/26 1:15 AM, Sam Day wrote:
> > Hello Konrad,
> >
> > On Saturday, 20 June 2026 at 1:11 AM, Konrad Dybcio <konrad.dybcio@oss.=
qualcomm.com> wrote:
> >
> >> On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
> >>> From: Sam Day <me@samcday.com>
> >>>
> >>> These regulators are marked regulator-boot-on, but that doesn't
> >>> guarantee they'll stay alive as long as the simplefb does. Adding the
> >>> explicit supplies ensures that booting with MDSS disabled doesn't
> >>> switch the panel off 30 seconds after boot.
> >>
> >> Why would you boot without MDSS if you want the panel to function?
> >
> > For my particular use-case [1] I'm trying to avoid taking over the disp=
lay
> > hardware entirely, and use simplefb until kexecing into the real kernel=
. In
> > this case the user might halt in a pre-boot menu UI for a while.
> >
> > I can also imagine this being similarly useful for "recovery kernel" us=
e-cases
> > where again, it may not be desirable to assume control of MDSS/MDP/DSI =
blocks.
> >
> > [1]: https://github.com/samcday/pocketboot
>=20
> Can you handle this by adding a panel =3D <&display_panel> property
> under simplefb, pointing to the display panel defined in the same
> file?

No, that won't work because display_panel is a child of mdss_dsi0, which is
a child of mdss. So if those nodes are disabled (which is what I'm trying t=
o
achieve), fw_devlink will defer probing simplefb.

BR,
-Sam

>=20
> Konrad
> 
