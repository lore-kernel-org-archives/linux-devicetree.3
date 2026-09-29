Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3878344D91
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677021; cv=pass; b=QQmQX+1C4io2fp5BJ/kc0wIJU14f59ailo62WDlKk9r7EKv3et13MBWrtf2gUjoYdU1WoDJiOit0pIYykM56LZlB/pMGPKqHiPb0rA7fKTLGbhNdvJibmPFrF+rhULvErW0C84aenUWlrfiXal84JzY6xUFL7dnq+E9BeqNwR0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677021; c=relaxed/simple;
	bh=/pURnOfPd01iygyLUjpNk9X+T4L0SeXg5/g8Qb1SX8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwlxwpZTIM48kxaCgsKDjD9lQsdg2mGK12TUxPPA0Tdlx17N9O7YAd7R/2yahsGqSBCM3BertA1O/Qka2DMNK4Pg3MZDFfIsFFhrGtIADvUPh79WhHtZ1wSksqgc5t37u+BhYSy8kznXiprtVfek9Drv8rTL7IHBkujxKgY/P00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpepKC9i; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpepKC9i"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb6b726b5so686951a12.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676999; cv=none;
        d=google.com; s=arc-20260327;
        b=WeGcrmA6SnUkOyFZc6sDTmkNnJ1ZeNp26DKwKpoU10JL3o2WRsB5h3qyzLc9+e20qK
         XrVxkHRf5oS5ljElj5+kvM5roxIiVTPaPZqh89ofJzICJYWxSlQm5rEsVopo2ja+i3jI
         Jx0421w2vr9fnAIuZRKrbZqJL3p7eY5M0jPd9XAyQ9uMi2w2/iTij14pKIzdvyxqEK/3
         wXPcT1CbiLVx8h4Y4uyjsOJFM+hCeiGilYurRdqNltqM230tkuJxxC58h8KvqPkWOI0K
         NrnnvElbtCyU5Fv75gkM0q91XZuhyxM4Zmsy1oK5o6wMRIL+q9cF2RBT7kFTbqkXssOj
         hE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        fh=wtjMJL6jBq1yXKYyXcmad/5eoBz0GxRycc6r1iRcWP0=;
        b=l8pSsF2F04YOkVrpiJEilVnaCXfoeuUxv2t6nkuUpem88IlVQDrzTky3C52k6eehGJ
         CwVTyAjOYUkzSy/IyuqIpnBi4wTQmpE74smkgNZf7g1v8MS122A4tRDOl5a126ry5/Re
         VhY/xLwvOWlbEnRzS7jPQ5/z8wbqO6X/SWtFmkxi9KSMOX/st5D4+1a2XlS+ZFeIszXW
         Bl4bM9G4fVWaj2Lxae2Cex779nCtTcklXMNrFAIVd4+Qk5ZiTYZybUachG5J3mD22Gkg
         Rfsa85E2FeWIH61QYRMHOzw/7oJgiseUWOWxXF5k1/6yttuLZJx5d+qgeOZqlDgYEJlB
         w7vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676999; x=1791281799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=wpepKC9ikfKPC9p4CqWROnwComFJNLSxxEXrD7zPrVfvREDbmv3nlsz74LOc9vR6sx
         HgbesHRr1pF2xm3sZQbVhNX7NPp1QdwIJDe78id4bX212RhMbFkP+dX6Io/kLHSMct2M
         50wcgkFmIirIqSUQtWfLjK2/X8NGPjPcU59gc55ztm4vH2ty7WS9CKkIPnTUp8k6y7VT
         F5ozxPCBXrfwvIr+jMS1b2CSWto+90GHhuvzIpUCif8r+p4SE14qkDXtYHvAylxNLu0V
         vZjITdskf6Z7GLtW5V+9bFhDCmlpo4u7DQygL2u8XbUEGj3NACCd73nCKB1oLsYSC+UD
         hhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676999; x=1791281799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=q4UzvJDVvaXv0TfM9N1biej/ZQh7U90T8+yrgW3E5Q8udPENbpvsetEQXa0w0+T4JQ
         7Hv36huLzkObvXrOEYGeJeS2M4JUB+8DGjipIAZFGKdFTODn8yS3oj3TtTfhnLo7HUT+
         u1LZ/M9Ga0Exuz3rwngO9BUb59PoDp6bgVhpISEjdQGmE8RRd1ac7YMUjUSkIFJSywRY
         mlL/qkvD+cGjR/kQqC3cq963nDIoBY0GaoxVap8dbRVfbRFevH6M08j8VV7bSGtNcN5S
         5j1rHuOetgXkU+gSo2izUy5acJkIgj9NbCbnWPFtUTdOIlPdZF8rkcxaIK5yKJKYmKDg
         +z4g==
X-Forwarded-Encrypted: i=1; AKwUvByXg89YVMfxxGuirt0zYJGLOO3efLOPQ54jLywH183rMO5w7w2GChROGQQ2SPNG2OWN6+0nCBuNL67y@vger.kernel.org
X-Gm-Message-State: AFq9FYID1pq0FEiF0HoK1o0KgjuGUDBIJ8nKuD3WubxL3XOO1UwJ/PnT
	I+/pNAZGX364TsA3OtmqUIJEO88sA3rioJ3quqQ7AKchmOJYl8S5xrcZeSfnjbl2Jfdsq3HgZqX
	3BdYAvBNpsbalHcbD7H5G1kEzrMDbNxHFsS/GjyKlCw==
X-Gm-Gg: AYBFou0r3hpxo3gLCEU8ApnFzvKlc1DWHIkVgaO3NjJQ+2+vfUgEK26/452v+TxRGf1
	Qda+7cNy3bTVD3nKKv7nhk5QFceMwSMHKevfxZUt4BGvukiy4oRtaD4CGqepaa/atAR5BtPPA0o
	/02SuO+1KRdqlXMf/K+tb8oQk11oRD+SfM9B4jAHUmcplWEsRuZomJFOb3PFWJXdZFiLTlx0282
	JfRQErPQgRKkCPvFUXCfQDG+a1iiEx8qZEH8BYN9pZmR/Fexza++FKbwnssUmHm+t+vNxJG9E1+
	EXPS/E1QGqeSyyyJSFnKpPfwkc+qskmnkwZjAapA+EZY3FaYB1vSyhP0EhkyFp3Tfvq9+qUPyba
	kUBI/6uMCAeyOxOGttZE8jQs=
X-Received: by 2002:a05:6402:c212:b0:6aa:e589:87de with SMTP id
 4fb4d7f45d1cf-6aae5898986mr6832193a12.20.1790676998743; Tue, 29 Sep 2026
 03:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
 <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
In-Reply-To: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:16:27 +0100
X-Gm-Features: AclHuK9G694Ra3CWigev-SgKIG1dKrfnmFi4vSCyiq_Xo-NTi_Nls6PiXAbko7k
Message-ID: <CADrjBPrErWJR_01+Qhuw6mu0Kpe8-tvBMjci=rBO13RaSqnfZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof,

On Tue, 29 Sept 2026 at 11:09, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Krysztof,
>
> On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> > >
> > > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> > >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> > >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> > >> 10 Pro XL) phones.
> > >>
> > >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> > >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> > >> entirely in-house Google designed SoC.
> > >>
> > >> [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> > >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> > >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> > >
> >
> > This introduces new warnings:
> >
> > /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> > Warning (avoid_unnecessary_addr_size):
> > /soc@0/interrupt-controller@5880000: unnecessary
> > #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> > or "ranges" property
> >
> > https://krzk.eu/#/builders/28/builds/845
> >
> > Probably you wanted address-cells=0?

Yes, it should be:

#address-cells = <0>;

and no size-cells line

How would you like to handle it? Shall I send a v5, or would you
prefer to fix it up locally since you already applied it?

Peter.
