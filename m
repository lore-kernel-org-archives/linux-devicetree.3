Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4EC4FDE4B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676617; cv=pass; b=T3BrMyV6ZmhpGcEpGcoY42iCQLkZS+75L1I9O3XHj4sMW0FoVTOKWBDk66sbhPAXdeBiGvu6YsBzp8OS5sa75iUyAR5W2gNeSx34VVCxYX7/zQqCWdjyUjDAmtId/oZ4mh23P6m3zbEUqF7WFiGB0H1mCBHAw6oXmyY0XuDUgKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676617; c=relaxed/simple;
	bh=ugqhqlW2+gdWnYyVA2uZcdO8IYtwk8wf07W/RuYSe7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah9Es286bM48+2fceyq7Ge60VpNHU2tZZvg+NJFhSQ+C40kaA+4WwUGx56sUH8yrY1/PwRab7hzLq88W3YKdMvnyPSWvDc4SsVTrKTZ8HEkAkKZOF1ApJuJFDaZ8k3+/uXUX9/+4JWRPQkZYek3bC8i9bWr18hre6aj4VEzXPyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLfFruuz; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLfFruuz"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso7022424a12.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676598; cv=none;
        d=google.com; s=arc-20260327;
        b=sQ+dY2R1Ie9lOifj+qZMMBn2KiloxM/p/S1bRgrmZb/BKx92xbyV0UpTb+AaDrJsn/
         iLaO7x65E8kvHeUBQRBBk6pZ/BY0/kX8dkSCNBGwkoj6NYdA8m4i8m3gmDF5nEQ9dB+d
         mKk2NAf1A/iKwbjAMVIsrKeCpBdI0z/7M1wSTC4jpVTA+Do6dKoBmcuI9FKGwe4m+9wJ
         OYI7HM9MqiC4FZrK2WE3GNa2PqkoUS9sP3W7xxZ3obz7kh5h0gcUGiZxD58qwkaLWJ6l
         Ty19b1XRg3t2mXJ8wSWNLLr3SeW7bnNjVfHWejU1guso7P48d/7jC3Io0xZN5EKSSWVz
         uimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        fh=GD1dwS46hg0zYIsXfNqG8QSKrAlGDbwqxGiTcIqar1U=;
        b=AtrgC3nSGwiEicjqkc+X8SKV78vQR0ryHimJ70ZcEbYFgLgk+tYACbuic5p6EdLyfA
         +ca+KIrf+bFm6OjTEnChobcvUkX9ekSwuScvAfjWdwnD9EXeGN5dc1/XznrOqKLz3ip/
         7OR1iWEQxaAz+nkV2WmT49uCW0Waq+GBItjl0gRPBqaVjw9SBMUwTlIejiU7obNcd1pO
         LnGqM5GwQA9wtloKSbsqESRpar5b7H2SvCSCVjdpkoL4IdzPDzqWohe2BVIwwl4P+qCR
         pVogavtc+/N6ylIuyymc7Ycmw5LMNKZSBXUM4/9gObE0c+Rtnz3rqPhrvg6g6Vg55Iab
         azQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676598; x=1791281398; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        b=eLfFruuzSD6VK94I1ZOgecR5WuCkwCewUnqYwsZjijOYG6HQFD3oaRXZNY0rj7ALsm
         LryYr0dwh1IQar9qi4TPHR11HNDoG8myw+R3WOYYZCWsoZ3NMCVeY6cbAeVFfpfYBp/Y
         eqWmMP4MoUFMm1aJnepVHf+OXMIUap7E6Xz+CJwwlcTYt+oeEDPErANA+ryssPHYlJPN
         DFtDmaleI3Z75Ob5ndQtSvFnoAgQJwh1oFid4CRAsDF/9kGJTgJX7QYM+xSfm6HixnCe
         +BCT+knQ6pUGb8dcr36lqfoq1EVJC1hvfam2udhpMUvrPQnAsDC+q3x0MtRGyjH50P99
         diQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676598; x=1791281398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        b=XbUkqsIY3pI0Z3LTA/gez2cyuKLCo3P5RGL0MJTOm2XggMs/zI4d5x3fAlGq8OYmsj
         22cWL1TXPnXut10tyjo6cgwyLgPfhAofqn+U/qzSLAxZKjVaNmbE1r7eWNoFBDpM9n9B
         b+MeHOens+g+vUzYUOLfnONHmgkkpvAu3xxGbvkSYT8a822/8BMvS6RkkcWjBpPUY5aN
         yrJ7FUalCBlLviKAeqDx6aEOTE7L7BLLxPgdLIaXdEenOLyvLi7YSMVZ9wkGt/1jBMkI
         ybgH3Tx1Hi35G6HrkVDJW2mficXttGdcJeBFYDYg8Z7QfMkKWezTBXncn9fb+mRoWDbX
         cw0A==
X-Forwarded-Encrypted: i=1; AKwUvBz2aUDeh6ufvihGT3qT+st8V6iwI4DL7cCxCcgHlEOnKIHvHVcHcJj5JJ+lHdWGxqryvqzdSEL0d58F@vger.kernel.org
X-Gm-Message-State: AFq9FYL0ky3gau+HHnf2zuWwrc1cbJKZ1s/dyMMCZP2tqiOjQk8rTUac
	vZmBYxfXovT8zMFm7n6/DrYwmLiDn84lCcNU59Pm6bO6R7pkd9AMCi6Vmxb1gSi+skPTEsnwCwp
	bri4AdZo6R6erq2JCrX5y02Ja3sGaIhe7annaN8bc9w==
X-Gm-Gg: AYBFou3MtQmrlIwCxAX3hJfLJ7jWFLz77iYaU5deZG4HepDDtEDOqNVMlkUHX7l3pXD
	iCdfBfy5SImr8aymT1lo3BZ4h4U88I0Y/VeefMOxZrsESW9fGvLcr3SpB6Oqi7C39Xlof4qGO4M
	4GPk/VABCn8pyRPNuyy+GdmJ1uvls6fA/Dz54bj0kUwqOA2xg+uSldEjIh5bHnC1f1GngElfjdy
	lWFznwrXrswe8jyunewnZc5FLsJ4tn1RjDptVP1C4GT8PP4dVGYuAZlo7j6+UYwpentrgtiXo/r
	Kja87A91brwJeb2xtrUe91VT8BTPS8UgnOhZpRrXnYhK3m4VU/v3zb+qyyV4vR7S2/tdM9Xcnnp
	qk7dBzwq3F8sGKkmI7JdWKks=
X-Received: by 2002:a05:6402:3059:b0:6aa:9f53:221b with SMTP id
 4fb4d7f45d1cf-6aac8ecf650mr10133940a12.4.1790676598186; Tue, 29 Sep 2026
 03:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
In-Reply-To: <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:09:45 +0100
X-Gm-Features: AclHuK9WRHV7MmouzYCiFz5qe8OcNiIlPS3cNCTz_rrKcfw59IxyOBRtgpvUaFE
Message-ID: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
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

On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> >
> > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> >> 10 Pro XL) phones.
> >>
> >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> >> entirely in-house Google designed SoC.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> >
>
> This introduces new warnings:
>
> /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> Warning (avoid_unnecessary_addr_size):
> /soc@0/interrupt-controller@5880000: unnecessary
> #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> or "ranges" property
>
> https://krzk.eu/#/builders/28/builds/845
>
> Probably you wanted address-cells=0?

Urgh, that must have happened because I removed "ranges". Let me take
a look and get back to you.

Peter
