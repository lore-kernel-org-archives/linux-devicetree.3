Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6EB3890E5
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225792; cv=pass; b=H1By2sPtZdKL2qRkxz0b3L90CK7MQt/MsBZc+CBgGu39GrMQLe88Pd6z/iuaCwQkU7WFohUKpcxEgoCQQG0Ga0LvsMnEoXw6RdaPchjJiPY6FJidWp8zBTMXMeHi+NDwSKO1lxFS8QgN+5LEdkuvCU7MMauFoJz1RjSk7pW/h1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225792; c=relaxed/simple;
	bh=/9IPBABBlUmX6oVvFKAFFIYxh2fd35YOKdzr67DM7kY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYtesSUMsXU4knp88mMOvaCi6y8kHzeaCsyERG1sG1Dyo/+dWBxZcmAGK95u5gFcr/5R24DrgVDq/BK7DC4jYFKfOPwL1bwVpiPv9gy69ZYX9nLsqnkH4vNZ0uBNsWUPevoEANy4e7DHP8Wg11O4GcuBdskpAqIdqqcIsJajEY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl5A7P7e; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl5A7P7e"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso1995010a12.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225789; cv=none;
        d=google.com; s=arc-20240605;
        b=gqt6SaW/Y4NN9RRkiSJJ2J49EKYBjagY0VUGgIYZXYnxTy089QUilO4t2wlhPpFiEt
         rQgDq6JnWf3iTLs7bdleRCDaPKf9khJchPD2qlP2wpJSSWI2aHZ4muRs/zlN+/nHrk7p
         fW2MaK8hMfj/ovGbxU24gIE46c3gtiRMYOSgQ1/qHEq2lWuw+Upj0+EGSUcvEjyrq8Z8
         9je43xwEytKW4CtPk2pbhJObZ+s1xhz16XVJS3IaIsN3h3GNWXfSiM8mmmiO8evBPgjD
         F3/mdG6QmNpD3k//GLFVIqEJ/hdSdE/mF0YG9ER6TjF95RLbeKz+T4nTj9mOLt67LoHg
         1eLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        fh=x8gI1c+8CTNrMoIpxn+1mGWOEXF6gnzHRgVJrH9vOeg=;
        b=Ti/U7K60BRSqZyU/EeDUsd/wETkw72/e0WpJSqpm84tOhGgU4ZnbnyEHdYK3TFdeGx
         oCtOeDw06mHE4B5W7qWrJ4U0EdS/cTxofZ4pk9icDkhwFDHZNAZyTXUiBcZWL/2OJ1vG
         Enu6hMFJjb27DxZOO3ESRkIqA97XzkEgna82+QaQNf371wMrRSausPh8P/IYPGawMaIA
         imAblmmcbfsdFIhabvTYL0TmgLX0xH21Md05mUqD71vjBaZ2XxrhiPCUkbBhGx+baEou
         rHJHiVVURyQEm4zxY7BloBmJtl49R1EWWyo6Xi/fooIeLcS2VagDQozadHmy10EieSQl
         2Afg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225789; x=1778830589; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        b=nl5A7P7e1vNrQjkvCG8UTLFKtYT0rYgEa2fvHDihYXl4h9affbvgqjqjoSxSxRmDSd
         6Uq/s6MkKVulPmjbxEJt+ZeBvCMJ+NVK52G8bSQkrvbSObiPWqpPkOG7whG6OnNOImy5
         URQXgeJFUIsRjLvUx3NAW/TaRC3aaWXA601dSe89JiyURaNdSPn/tDeyHXE+FiOsTTeC
         h0RTYevhTQXbKq0YBctLbVn2puyjgTXD36MECeLGnLF3czJIbAVnTMKC/ep2hip77PpY
         eV/k9icF1SREE4rOssfCEF39tewsx4dXo3aIm9dHqg+vQYV+0Rw/I3u5msIoG1EtZSVP
         JXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225789; x=1778830589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        b=MQ3cK7GfEK/+Bowzrbu4zAgYKjDLYOW0K6+lSC0irpLEqbR+v3kHWENUtekk+aI1u6
         IhqRW8xaC5BAyWz8cwUHJFlklffOIvELMWqpJROyCmAcNbuB6GPScdT8qNHt+DSyOkl8
         x6td8os2zkjDfFDYSDQj3Yp+Nq5G9jOW9WQ3hJbTjZvPglRuWeD+NQUGAGKxGpG9T/l0
         LE0HVhUBQvMo5u0q5N043bT9zO9+8f27/xEF60C6kB7TakkTj8Xt3I83gv8/sdpziufR
         XyoW9LboQilFg43buXk6Bs2zzBNL/KQCQp4I4Fl26/u4SfBjS98yyPeSkx2K/Vizo7BV
         /Wyw==
X-Forwarded-Encrypted: i=1; AFNElJ/0ZHv9f+yErTb5Z5wjbQNeJYYmQjpzrq3yNkH07VblF0Ib6p3q6tXQ9HnQGuXWSFRtzI6LyICi8/lb@vger.kernel.org
X-Gm-Message-State: AOJu0YwGP32DN6LirfVSl1is70isMQi21Zv4HK1feduxtg3eAIf6Y+Nn
	6wbqog4WOk43g6+Ldrq6sK25qvMzEMsEKuWpI3Ig9rB3Dlvdk8mf6PvWCsW43yfyDyqTdQk7Yks
	x0FklTrz5Jdm5iHY6HBQTXrADSgkTNug=
X-Gm-Gg: AeBDieusefho34PG1wW3cYqNuYGWjjWUmYvbAP4uEELa1r8TPv+DWBqE6NNYIGC2LbF
	8plKq6GO1LEJ9Iz+6blhgaV47gsgT+EKZrxCCu8rlnEO+Uu20oDiYesSvu+6bSVloJWIGUIodTt
	95H2h3wu2XmCrqkcSs5B5Lwwe1USX6OBWHCTainEKDu8j4+jLm/qN40geDRC59wwytDz0/fHB20
	frtcJwMiqNKMzICF42+4XqTCAHD5fLaUPe5xxUI4/LCaCoe8nf8DdD9VlO/fcqHoGMhwQLsdPBz
	dGKTm1kUjL6LIto=
X-Received: by 2002:a17:907:3cc7:b0:bc4:aafa:65cf with SMTP id
 a640c23a62f3a-bc56c92bfc1mr713084366b.16.1778225787261; Fri, 08 May 2026
 00:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org>
In-Reply-To: <20260507024524-GKA3579608@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:06:07 +0530
X-Gm-Features: AVHnY4KAmj7VrysTgYaoh89w72UBvUEf0oATrqx17Po5ftzAdn9p97hUDfjyrYc
Message-ID: <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>, Chukun Pan <amadeus@jmu.edu.cn>
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

Thanks for your review comments.

On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anand,
>
> On 10:48 Sat 02 May     , Anand Moon wrote:
> > Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> > DC input. As per the schematics, vcc5v0_sys is the input power source
> > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> > to correctly reference vcc5v0_sys as their parent (vin-supply).
> >
> > Cc: Han Gao <gaohan@iscas.ac.cn>
> > Cc: Ze Huang <huang.ze@linux.dev>
> > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 5790d927b93d..9727ecdd9f6b 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> >               regulator-always-on;
> >       };
> >
> > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> This will fall into the catogery of "non-controllable & serve no devices"
> see similar comment for 'reg_dc_in' which raised by Krzysztof
>
> https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/
>
> or should I ask, what's the real problem if regulator has no vin-supply?

If the device tree is not configured with the correct power source it
will affect performance.

> Any probe failure or something bad happen? (besides /sys/../regulator_summay)

Not really; the regulator summary just confirms the PMIC used the
correct power source.
with te device ip blocks.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
(page 24)

Please check the shematics VCC5V0_SYS page 4
VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS

Please check the shematics VCC5V0_SYS page 24
VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
which is enabled by USB3_PWREN (gpio pin)>

Plese check power tree page 4
USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source

So, this series tries to fix the vin source for USB 3.0 and PCIe nodes.

Thanks
-Anand
>
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc5v0_sys";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-boot-on;
> > +             regulator-always-on;
> > +             vin-supply = <&reg_dc_in>;
> > +     };
> > +
> >       reg_vcc_4v: regulator-vcc-4v {
> >               compatible = "regulator-fixed";
> >               regulator-name = "vcc_4v";
> > @@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> >               regulator-always-on;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >               gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> >       };
> > @@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
> >               regulator-name = "USB30_HUB";
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >               gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> >       };
> > --
> > 2.50.1
> >
>
> --
> Yixun Lan (dlan)
