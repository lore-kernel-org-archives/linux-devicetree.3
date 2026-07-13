Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689DD39185C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929331; cv=pass; b=keajhJPXAWrWPkUYUQ9qj+kJ0Sg5vPpdk/Sf1RTg6julc6EwCyRh5hMbTTU3LUpPkUu2eWzi9soaNGp87Z/Ee41K8/qlro/qmyCpCz27V0+CKhS5UiUqGOxwwWmj+KRCG2eQHty9/ss72uJon/Fe+EKxE88iIiQQSpZmyhIKJ8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929331; c=relaxed/simple;
	bh=JVPH6qILVx/Sj/Wk9yZM9Tm+aoGUiD76+wqbBlmwRNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gy5HlPvSE6QfX+R6k9M/N/STX2sPNiKAsiEG2pSsLRTsK+1yfxsoNJaV7GAo4QgepsryLfkXXJ/NvGoAl8vWrSzoYrcxT/USbLZPOSqBzdqAmBHqgwI5lgeW/Ont5uEXa8i9V8nNtvHcoA9TAx/NWDj8TiUx0BQwBcq+gXnzmNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itzj6bZE; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itzj6bZE"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2396383a91.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783929330; cv=none;
        d=google.com; s=arc-20260327;
        b=LZsmuE2lQSOBoYBKPX2IW6W7A0IUERNFANwhWmiBURRQAGd22ZlrgN3DeNJj5Iffwu
         3UUDJKaUWF6e8H9Vn5xekaIfR2bGK02kk40JG6XrDrwTqyqPykOJ+bduD5n9AtUue0hW
         CEZowpahTBbz7VaNZgybvky0/CCLs1WdUBSUVGLF9FVHcMxzvFz0Z0jUDF6NODgs6qVn
         mjtXSSFx5GYpWkNnxR5nXcaenxJPn16Y1AsDd6eEiweEnqdGtmmWEYel8F7S+bm9HiaG
         xRvbKz20gWr8Ukk0xIeDOCgevN1pqgYXhAiW4lVJpYTW6UO/w3dQwxqLcRCyOU28is3o
         Ibpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QovoZqY4xt6ZAxVQ0BWNZ2UDIC+LHZmnMzcr9SfOYAc=;
        fh=FZfFoXRIpEojqsso/daNbQ1ZRQflBI7j/Hqx1ITIpoE=;
        b=MHls8M4QNrnuOrzzX59tEIwSDwFTaYMCF/ALDE4MWiaNPifkTKzKMbnAIYcw9gWMIJ
         D7kx+OnsWmOLhRD6tk8oTlt+HFDEAeTM5wihBxUuCvLexQs5JyBxf48tTmAHrgQ/dhEc
         QEVcxuWnQCbELEewlufDUKxzfyKomYyp+hfNeRpMS2z501gOpXjUztJr4Oa6BhygMuuU
         se3sLyN5eu0MvdrNlk8cJfKA8kagM8a+DTY9OTRY1jYBYP9F7f9wk95hvtgu3THtDbn4
         utH2nXqrv77sMOpqgoZC42gXQBuIf3Kfm2qxBcA5NODviq8S3NnIWe0xLXvBlDsAylJc
         DChw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783929330; x=1784534130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QovoZqY4xt6ZAxVQ0BWNZ2UDIC+LHZmnMzcr9SfOYAc=;
        b=itzj6bZEMm6GH2PdLcpYBIr8qQHeqFZLNuuUMEIzfV5dpFoPBrP6LCENm4QqcV2Smx
         7528E3SVP4iFxaaV/I3bXl7+W7/txc75vont1AxXVTj9i3z12dAwsjMS/80BdylJ3im1
         LzAe3F4KCK0STWomSCJtk4P6oO6YvNlmheAgN3Ej+a2/i1R3TZyK/dyTYzqWkXGcYfml
         AQh9nUEmYRLXTI7P63VnycyqdnslSdmpex+ZZ/s/t8RM6doB1llZvw4A6w4KHgHfN99e
         LxFAtpI4EcxoqXyFxDLn5XQ7ZShbtPy5T5blsLtWYZARHjoScV9mxn/qVQQyTQbUP/aO
         CSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929330; x=1784534130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QovoZqY4xt6ZAxVQ0BWNZ2UDIC+LHZmnMzcr9SfOYAc=;
        b=elm84g5cV/oa0+M28V0S91427mozJkdR8bAg8PfCAMeLbVD/0rrW0C5lKeM+J56CL+
         MgNsWHcReiJ8S4hyLzzFivemOizBLKbsH2TWCjtGJPvhorr0UsfvB8a6ViDF924UXdVd
         kAbF/oYLijvBeygXBBQXA5+AiHKHaLW36lVm//pZEh9g4fqxx5m01olrqEkBmgiSVKc1
         8wB2MD7KZQjs2OGZse1H3SOvrmqdShyyPlqkcZRPoQx+SgZQj7ce8STKwwh03b+iga1p
         zH8NEx8J1y+LuntTRz6TUcu4RX0m0n7H9QmM1jfiX3S1cGS/wbXovu+6/EP9C+6iv/GF
         3imA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9uanL6GyzbIpqjlzdFU1l6c25pyCWiKMvizkDneiekY8hQomEA8YY4v9P959G0lm7Z65AhbH4s6ep@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6tJwcuMDbE7CEPVTVGDkgzRpIB27VGsItapmj50tiSKNhoV5F
	Lb0LZ2ydbUrR8UV8xtZgyVVsHGU5uJk9kIGmXRh2WhkSoMbWY9+ECo1V4rD8gtyv1I2bXaFKtCL
	U2aUIAuSaJA//IwfLSiAHyNK07uIOLTDejlFE2Kw=
X-Gm-Gg: AfdE7cn1X02zbmT7Xvtux9KC8hnOUjZDVXLxTzET4Y8zpUd5PCL4eYF0fHBIvMFKgv9
	7sNDLkqWZ8gdSVZJ2eZGVtHiMX0JkcvI1ughPeulYkG0Ur8LQWaApiR5JOo7q7SMkghGgu+orvm
	ERoFXrwr2vx57ASMgZuxn7hXkWA656wsElPnAXeGsqnzQ7Q77n10cQ8K7/YWETT46A8IFCMngBs
	ukk/LV853EeosXMyA9DQpdVCY9VPS51OM3z9u1x4Edwp3eN6h9h2WsveHi87jKdIzQG188YPPI0
	UklcWZjdFFr+0uK8x6vYTIRcgCQu/r0CR2wmS+691eb+F0CEXiyemA==
X-Received: by 2002:a17:90b:1dcf:b0:38e:673:5d18 with SMTP id
 98e67ed59e1d1-38e06735ef7mr1259924a91.36.1783929329714; Mon, 13 Jul 2026
 00:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-8-422675a65402@gmail.com> <b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz>
 <CAPSPb=t=jZke2pEinPvJ4mbxKMF3hSqMfx3GMjEUT6N2FEyygg@mail.gmail.com> <50a8a36a-e7dc-43ec-80ce-904e6e7fbd3f@kwiboo.se>
In-Reply-To: <50a8a36a-e7dc-43ec-80ce-904e6e7fbd3f@kwiboo.se>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Mon, 13 Jul 2026 09:55:18 +0200
X-Gm-Features: AVVi8CetW3-cEGywGS5tE1DvejPk5LFrS4NRovmzWMSPfCpXGd_mo2vU_Ad0Vvw
Message-ID: <CAPSPb=s0Rsvj8b6MLfrza-CVK5U3jF60fEb2yjsro=x4Tyz2qw@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	diederik@cknow-tech.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Jul 2026 at 20:22, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> Hi Joachim,
>
> On 7/12/2026 8:00 PM, Joachim Eastwood wrote:
> > Hi Jonas,
> >
> > On Sat, 11 Jul 2026 at 01:24, Jonas Karlman <jonas@kwiboo.xyz> wrote:
> >>
> >> Hi Joachim,
> >>
> >> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> >>> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >>>
> >>> Since the NPU is hooked up on these the always-on isn't needed anymore.
> >>>
> >>> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
> >>>  1 file changed, 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> >>> index bcb2f5d63a61..463cfeddf270 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> >>> @@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
> >>>               regulator-max-microvolt = <950000>;
> >>>               regulator-ramp-delay = <2300>;
> >>>               regulator-boot-on;
> >>
> >> Why is boot-on kept?, NPU is likely not needed until OS has started.
> >
> > I am not really sure.
> > Looking at the other rk3588(s) boards, they also kept the boot-on parameter
> > when the always-on was removed.
>
> Ahh, those board should likely also drop the boot-on prop. There should
> really not be any need to force the PMIC to enable this regulator from
> firmware. If it was left intentionally for other boards, maybe there is
> a bug in software that need to be fixed.
>
> >
> >> With PD domain-supply the regulator should be enabled automatically, or
> >> is there some other issue that requires boot firmware to enable this
> >> regulator before OS is started?
> >
> > Maybe some Rockchip people can enlighten us?
> >
> > I haven't had the time to actually test the NPU. I'll try to test it next week.
> > So this patch is based on similar changes done to other RK3588 boards.
>
> Yes, please drop the boot-on prop and test :-)

boot-on doesn't seems to matter on my NanoPi M6. My short test code for the
NPU runs either way. Note that I am running edk2-rk3588 bootloader.

Setting up the enviroment for running stuff on the NPU was less painful
than I feared. Using Mesa teflon and python-tflite-runtime.

I will repost the entire patch set later today.
Thanks for all the feedback so far.


best regards,
Joachim Eastwood
