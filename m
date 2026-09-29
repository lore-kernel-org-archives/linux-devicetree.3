Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1BA37DE8D
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718940; cv=none; b=JvSlERtbTnNqPQB30lisPxd6G817t3TLg/GaSbypwwPDtIGLP9Nk0BBHKWzlDSlnw7FjCt/dZyV/3RlHk9lhooSuYh8cL0DmsQWiohRi4AAGGgfpZv8nFsLrip9ZUn0NORWF70IHCcO10D1jg6MzGlAerWvzAsMB6J15RzrVy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718940; c=relaxed/simple;
	bh=+sYhXmxhg4HTmGDotTlYf1XN/80V34F0G6WxzZ8U+pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCmXqem/1ix1j45ul8AUZbttRZ1MZTeh0egY4Mm7tbTtopdUaiL3An0KGs6pDG20sy1GACqKgcaH2AFsUIcn2ce3F20SmYlpCHe8z/OtI6m1dTvKjPnBzTsS5R2IBT6S+gQWI3nOVwiWjViQXskTyf9Kdc5Jgy3yKPzqidWM0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QW8xiWrS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QW8xiWrS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3591F008A2
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718938;
	bh=1z3g8uO8esjL15niBFprIu3tR1dbGidMoV9Pvac7pvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QW8xiWrSFtSEtFMM6SrWrY/dNJi6s6JFc1yOypboboiiUOBgwagPlTjEy2MVNrHrE
	 u1Xo4HoksZCS5V+MB9UoKJj8lQUJfO4zYuDfFYp5+ypmlYjqzXkRUJ5cN3Y8oxDf6P
	 /+APvPott0EFX9qKhaTvvqQm5OcTd/uLHfC1rwKKOknKPbZXJl45ktfe3nvpKS6Oy1
	 lR2D3t7BOITDNxWFyBSCaTD5hCM8pkPXFioNDSadm0UZ4SjTSDgVOVri6XxXBPUELA
	 uE0f2CVCxg62/vFE/EWmHRNW8FtG0XxBbMUWqvwGU7kHWO3RSf2PE0UqE+6kVloSAm
	 OZ1r4CHe6ODbw==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a9edfc851so611665966b.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:55:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByouUyHUNEXBpLa7lR4WnyzshIp44KQeJjHwfH/6g8Iwo13rt4F03aFtRiqmiUYPgA2emPYlnwnl+L6@vger.kernel.org
X-Gm-Message-State: AFuF++ktpXrNv+95humDWIVg0YB0c3VB2HyJmb41PN+Im9T9TWZlbFTD
	cYfI8sW8MB9MaS1FGW8mwug8puK8RGYiaPWVD+LWcOmccgJg7Im/Di4Dkz4TVtuOXtagBzzzmR9
	T/vO1BpobVGWzQJedW4gCr/oPsVN2Vg==
X-Received: by 2002:a17:907:6d14:b0:c2d:c414:904a with SMTP id
 a640c23a62f3a-c2e15e9addbmr58187966b.17.1790718936887; Tue, 29 Sep 2026
 14:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902124018.606544-1-marex@nabladev.com>
In-Reply-To: <20260902124018.606544-1-marex@nabladev.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Sep 2026 16:55:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKDniU3VYaOuF-OA2_JmOaKEtdOtxGAtyJfFCLnT=LjSw@mail.gmail.com>
X-Gm-Features: AclHuK-k3vl-Wx1oL4KqfwQ_ykCOdKhQDjWBszDB17DIngfFFXqkn-ItikX0PVg
Message-ID: <CAL_JsqKDniU3VYaOuF-OA2_JmOaKEtdOtxGAtyJfFCLnT=LjSw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 7:40=E2=80=AFAM Marek Vasut <marex@nabladev.com> wro=
te:
>
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
> address/size cells.

ST folks,

Can you please pick this up. It is introducing warnings due to .dts
changes you already picked up:

      8 syscon@44230000 (st,stm32mp25-syscfg): '#address-cells',
'#size-cells', 'phy@2400', 'phy@2800' do not match any of the regexes:
'^pinctrl-[0-9]+$'
      2 syscon@44230000 (st,stm32mp23-syscfg): '#address-cells',
'#size-cells', 'phy@2400', 'phy@2800' do not match any of the regexes:
'^pinctrl-[0-9]+$'


Rob
