Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66AD3815E1
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225804; cv=pass; b=JbTER6fxjPtNTMAZkN1QXUsbriJl1RT8+VoQ5Oub9vCl/EbEhLKT4slkLmg0JapDe46v07Sn9EYDn3Rh1l3SwuczDGfVgU31Exi5aqkMwM3S9NPR3q7VqVrfRqd8ZXyUYrLeY/BuMuSXd3gF70j/4weX732QZzlgK9LGszhK0nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225804; c=relaxed/simple;
	bh=B/MI03HFz5SSbkX8vKW3+B8Ef0T3tywZD9naDKW3hp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IK99Eb4f3VagUJPNWpJy5KRUMoO93frVs+YERPWdZxvH5pG1xTmJzAov17N7HjBCcqUUwChIScXSoif6vCD1SyvO2PSUoE7XcwCET5Hq2yvnzgskEnB5cYt3TXaV/nQUx/oE8LNYmNe9ZwPa5pAnpayZMwshGgduHMtDJuFeH2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcnGlpeB; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcnGlpeB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso3176244a12.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225801; cv=none;
        d=google.com; s=arc-20240605;
        b=DxZahz9kirczLunTS+lIFTZvXAuXRxTT3ZeHI8yaiqpxsHTXa6XMkPpZcOQ9LWl3Ck
         ZO2UvoQGBwlWkWr84moeFNTPX/SsiY5px/Ysqz74A0ZNwnl2JJekexfRXROi58T9hBhf
         FK4GslSua5Awqo/MGfiVb52homQw17DQfbNIWoH3jOmczK5SI4QtQNmFv6vM+P72YRoW
         KRaE/tVgIK5LS+qxkY3Sl48ct4ki9AqBglV/ynote4FfQzZS5FAh8tRwOG/MIKWvQlqR
         H/VXEO++e4ePb4IMrF15MqdX6dJ7Hv2UU/ygs0oJsaSI/b3Br/MLe7bQpipuknKLYx/N
         5Ltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        fh=CPSS/t4pUG1Z9B8tgEiAGJ/79dEZMQ/m7C6Dt4WAR/c=;
        b=J91awaP5au7mSXBDTnNeFNnFyLFhtCdgblbPwsiPhJB1JGOjZiMdbsEhkHXWOfWSmP
         J9IBLKzOp4wdSLzIjWSlRGZw5eIWklc7LC+tXPWCOD2V8nVRP546MPDqz2whAR/VxrYd
         qgzB5VzggCZ9P4i6YrC057X4ApP39s+vk0hmmM2wHYzFhOm2Ja4ttNoN9E9EzAvfXWdq
         rbZNe64AYFIONG/j8pMBN1F6M30iO9a/7DaDH4VehM/V+J7uLi5WD3ux+JJfs77ET10s
         8kdmbb2cBgVECNXcUXLj5/lJCh8xGTd9MUEZy1TXzTu3s9YMPX4o1cy6DPySV3uFAMbW
         20Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225801; x=1778830601; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        b=pcnGlpeBqMcVrF7Tc6NWnrnX83E/a3JdNIvPSWbV5y99rpJfhOWMaKDnZ5+lkyUR23
         +fVZoF+cnxUhxMbyWa4d1jzXFPSyTsPpzvmNhPQ7iAWiz77isx0t8CAsot/O3kh3MTt0
         bTEAZyhE/qxnNIDOxK5e18eNlw4Oe/n3/bobhBtzWxm7RPESBPX7T/Gti2d+9Wbz6vFy
         72yXfvA+4QATtqhR6v90bqcmVeO4lGxTGCgm7HXdpBoayyE2P7iCGwE/mFyA869bt4Rl
         tapl8A1E7wZx9ownxG43WXTR2IiYMSiOoTovCfOaILWoRiEUdqYSZqP15XJtNg0Y/8Jw
         f5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225801; x=1778830601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        b=sSn+hMz4hn9cMG9ul8uCKLwNIZCs+iwwqhiSiYJz+zEDITCqg/2PYEh779U7l1vk4+
         cAQCrce7Bn3uxWjVRENy7dv52tkuz1d0a57JZ6WOhQQ/1R7c9zlihSoAd+LmjJ3rB6pF
         88HxHcAqirRcE+jwCrKmoQ4zBPFKku7CIjJ597Bb5J2SIcZg6SkPEGXCwZiRPcEcQTOL
         VSggKrfHJdtaDkFP2S7CoQsmE8t3VCKbWflm3OFFzQBP3N9BD5ITHgoGhZszE+NJPaq0
         SloEbLkWWz090VmDmH2g6n6iGK1rVmOjLgxKBEMN1VuEe2pdYXjLL4ds7krZ7RJdHXup
         KpGA==
X-Forwarded-Encrypted: i=1; AFNElJ/7kMU1h4RUclAuilS4dwGq9RqH1ctGizcby+60yHhtVoG8+mJfNqJ+HiNRUxy7gXiemsTQrErkwenw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1LG7oW/OXD4ETtMG+6Zur/wEuYT4SUTnz4OfQo+oR5y73pvgJ
	KVi1x4/GMuK1g8LHhBfUyHJX/cpDUPY+gGlrnJJYulAxPlhFgTBhEtgAG1pHLnMlGprCD/7U2vA
	PyxBa1DI12hdpHxGQIKUHyyF/hlAfpZo=
X-Gm-Gg: Acq92OEBE9Gif7gQ9TOSj2z0DatOswE6U6eP0bcpU0ge5g/FqCBbQ55P/Zjg9Y137Ti
	FmMN+m8d5aSxfQmJblhYrJ7qp7r4XsO5NTr5YXqVkgtJb68Ph3sSPL9yG2qZVUAgBUgUoP8Tqdy
	cIKHsG+a6eR0S7xuI0Z+DUSuAU9drndY3Mn2c0GY5EQvPx6exZNAAsT9nTichmDVehSTlPFf+Eq
	BOab8a+Hl1YNVkJcsEgi0FBzASx+Fc4dyGhYG+h+j0fU/Cp5qGC5Zc1M9BfdVtjsrmsxZC5w9t7
	wTcd
X-Received: by 2002:a05:6402:321e:b0:67e:43a8:7b82 with SMTP id
 4fb4d7f45d1cf-67e43a87cb9mr2854983a12.26.1778225800798; Fri, 08 May 2026
 00:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502051906.8160-3-linux.amoon@gmail.com> <20260507064050.1881348-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260507064050.1881348-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:06:22 +0530
X-Gm-Features: AVHnY4K-9ASo3Mc0vrsENtDNPwVrAYJ43tcUlhhO5e_b02Orqs4pqqj-5Q78Vqk
Message-ID: <CANAwSgSP8W8QH26-X-mdNBtncDAbHR9CtYRO0F+rjmxKfhDt9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB
 regulator on onboard usb and label
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chukun,

Thanks for your review comments.

On Thu, 7 May 2026 at 12:10, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> > @@ -366,7 +366,7 @@ &usb_dwc3 {
> >       hub_2_0: hub@1 {
> >               compatible = "usb2109,2817";
> >               reg = <0x1>;
> > -             vdd-supply = <&usb3_hub_5v>;
> > +             vdd-supply = <&reg_5v_vbus>;
> >               peer-hub = <&hub_3_0>;
> >               reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >       };
> > @@ -374,7 +374,7 @@ hub_2_0: hub@1 {
> >       hub_3_0: hub@2 {
> >               compatible = "usb2109,817";
> >               reg = <0x2>;
> > -             vdd-supply = <&usb3_hub_5v>;
> > +             vdd-supply = <&reg_5v_vbus>;
> >               peer-hub = <&hub_2_0>;
> >               reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >       };
>
> This is incorrect. The hub is powered by vcc5v0_hub. According
> to the schematic, 5v_vbus provides the VBUS for the USB3 ports.

As per the schematics USB3_PWREN (GPIO97) pin is used to power the
USB hub ports 5V_VBUS, please check this again.

VCC5V0_SYS -> USB3_PWREN -> 5V_VBUS

5V_VBUS is used to power all the USB3_TypeA_Dual ports.

Thanks
-Anand
