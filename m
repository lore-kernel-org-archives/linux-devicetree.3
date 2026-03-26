Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598323A3E98
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503806; cv=none; b=rPL31anDxng/BJs1pgoY23nupNHOoXPhSje7ZnFNK+j7Xyo88tRAGoUNtPLuUT+vgXW3gXfTyV2reIUmnVaE1IaUYNjAScWRqrWZuzLAddlTAyJHjvhPcS4IEeK2QSOTKOEYqyzxH5grZ1gD4GfRHB1XcSEF5QRMMNURBOrxuwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503806; c=relaxed/simple;
	bh=s27fcGErMBzKxY6t96v5alAOcgMfI4+l2mcmFG7QKYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAEY0hDUWPuRRZC1B92D37dui/FbdmEXEDqmd8WqpkorZoESR8Wh0NmgSeOd+4ykvG8hUxiNpUyhUMIFPtuYKAo3VXR/VzyAucWw2KBs/eOk35ogt7Kpo6R8zl4bILagBTfY9mk68dMGPKgSA6kQdAX5bMwKq10sBU5Yypfl8SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j9VIybWW; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j9VIybWW"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-829781b2b01so360906b3a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774503804; x=1775108604; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=;
        b=j9VIybWWMartLF4E6u3VULN362czlBOTKyMl0iyYmmoAGbIhvg3XMOa6JDr0RwEPfv
         0s8bBNttKoQKhSHOwxycdbFzFsjM8f4Qcx+/rh0wlb2A2z2EFLB7wyAFHpMid1CKZCF3
         ODrhVtSkmB2Jc+j7xaCNZFM9E3NOxLvsHVvls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503804; x=1775108604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=;
        b=nNqBEI8dXssRDvSY2E3t/5Y18TJZZuZr9/QGKJsIq9yHtBu+hcdmYg0KgTDVzJtoZc
         +lbgWLGsY4VR8yH6Nlh1YE+w3HflKzHG92tTeCbXDz5ZacvXMyoi3WE5KWExsFPftzbB
         257/f9sVNJn+AjfSegR2F3GGBHnzF8s299ZlcmzdFNM1MXx2vAV5o/BroggJRUL9NxEO
         42NBVaAXesH/9KoS8ltnW3xdWj2e8iDoQrpPJVDQrxPL/h2Aqa03LvOW/zZOX39+eAQz
         HaK7RRJnRZCFNI7H6R+TvzBClEt71Ayl7+1CU2rlnLvbAABJxwn/uVhHVsl1FecLflDg
         8pnA==
X-Forwarded-Encrypted: i=1; AJvYcCXlZGxfd08U+hhRsDtCoZAO2R+MhxjlCRkDcGQx9uSYN9RwjwAY23H9tdoWSzVtHiEIyel33vmFXseN@vger.kernel.org
X-Gm-Message-State: AOJu0YwwfZd/u71cXc8V3vYhCDbSeWycQ8A+gmPtp/53of8LsuuwUzdh
	s6cB8msO4GTbtuMDzwCBgSI5ovc/rimxIlEQN1zeKHUY4t5KR1TRzrsPrA9H29Xm4A==
X-Gm-Gg: ATEYQzyYsFRzWwAtmN5t98dbMXaLwiRqCadeYTtSK+lKj+uyUvgzHra7pCvgqddaGT8
	GmPNHDR3YI4TZq9OfIWudz71/GmnG3jbRyGZbnFxuvT5rJDd+pcuZ5n5HKaMVvjdLmT01FvxO69
	m05V/hoeRyaEPjl5F1IyPR7WEZQO8VG+a4T8ENWC4ZngC2CqILli4wrUOW1P2FwDMkH40IrfLzM
	F/bvQ2Y3Qen82xEzmrseZwtlMI3qam941MZQmPiZwexUb5SRxieKJC8/2YFgkK16Zm+inE+DfQY
	+3kwH6BDcI3Atcb/db8Of3MhCxflLfEYsMTyPlru6srENjl35WQZXGRk80zdAd/Y4shjsHsVA+8
	BWaaGPxOgkMZHKuJLCKniUdpqD75OUC069ibnUykE1uEjHAvyhfyOBcHY8Ou7bJVDSQSqwSY84Z
	7Jp/TonUx5sEA0UEHTGa10TdyCi0eieE4xrpy1oM74TJlFLP3sJHi+O78=
X-Received: by 2002:a05:6a00:1ac7:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82c6dfb1e09mr6141757b3a.30.1774503803653;
        Wed, 25 Mar 2026 22:43:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d5d89b5sm1411849b3a.41.2026.03.25.22.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:43:23 -0700 (PDT)
Date: Thu, 26 Mar 2026 13:43:16 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
Message-ID: <20260326054316.GB910813@google.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-10-l.scorcia@gmail.com>
 <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
 <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
 <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>

On Wed, Mar 18, 2026 at 06:22:42PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/03/26 14:54, Chen-Yu Tsai ha scritto:
> > On Wed, Mar 18, 2026 at 8:39 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> > > > From: Val Packett <val@packett.cool>
> > > > 
> > > > Add the dts to be included by all boards using the MT6392 PMIC.
> > > > 
> > > > Signed-off-by: Val Packett <val@packett.cool>
> > > > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > > > ---
> > > >    arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
> > > >    1 file changed, 141 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > new file mode 100644
> > > > index 000000000000..fbf6f671524c
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > @@ -0,0 +1,141 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (c) 2019 MediaTek Inc.
> > > > + * Copyright (c) 2024 Val Packett <val@packett.cool>
> > > > + */
> > > > +
> > > > +#include <dt-bindings/input/input.h>
> > > > +
> > > > +&pwrap {
> > > > +     pmic: pmic {
> > > > +             compatible = "mediatek,mt6392", "mediatek,mt6323";
> > > > +             interrupt-controller;
> > > > +             #interrupt-cells = <2>;
> > > > +
> > > > +             keys {
> > > > +                     compatible = "mediatek,mt6392-keys";
> > > > +
> > > > +                     key-power {
> > > > +                             linux,keycodes = <KEY_POWER>;
> > > > +                             wakeup-source;
> > > > +                     };
> > > > +
> > > > +                     key-home {
> > > > +                             linux,keycodes = <KEY_HOME>;
> > > > +                             wakeup-source;
> > > > +                     };
> > > > +             };
> > > > +
> > > > +             pio6392: pinctrl {
> > > > +                     compatible = "mediatek,mt6392-pinctrl";
> > > > +
> > > > +                     gpio-controller;
> > > > +                     #gpio-cells = <2>;
> > > > +             };
> > > > +
> > > > +             rtc {
> > > > +                     compatible = "mediatek,mt6392-rtc",
> > > > +                             "mediatek,mt6323-rtc";
> > > > +             };
> > > > +
> > > > +             regulators {
> > > > +                     compatible = "mediatek,mt6392-regulator";
> > > > +
> > > > +                     mt6392_vproc_reg: buck_vproc {
> > > 
> > > s/buck//g
> > > 
> > > Also, no min/max voltages?!
> > 
> > We really shouldn't set min/max voltages in the PMIC dtsi file.
> > 
> > The min/max voltages are supposed to be the intersection of the
> > consumers acceptable operating ranges. The min/max of the regulator
> > itself is already implied by the model / compatible.
> > 
> 
> Your point is fair, but it's also true that some of the regulators are not
> really meant to ever output anything different than what they are supposed
> to, though, with slight variations being possible... I guess the best option
> here is to leave declaring voltages to board DTs instead, which is sensible
> in the end.
> 
> Okay, agreed. Let's go with no voltages.
> 
> Reminder for myself: there's a bunch of PMIC devicetrees to cleanup in here...

And to be honest, even the default names are not needed. They are again
implied by the compatible, and even the regulator's own node name.

So either we could have a whole bunch of empty regulator nodes with
labels for easy reference, or just have the upper level "regulators"
wrapper node with a "mt63??_regulators" label for board dts files
to reference and add the _used_ regulators to.

If you agree, I can do the cleanup work.

ChenYu
