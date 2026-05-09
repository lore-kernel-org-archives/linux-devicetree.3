Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A866619067C
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778339945; cv=pass; b=QHOMr+l0NOLuzCI1CN4Y8gXxU/3wDHpwYNZUTLqr8QTae8pNjWoy+CodRvbWFOYvPIjDjtCee4It5KEbjsolQxTvQkiaPZy3rd6oSTZjCG6Mqk4UPdTr0DI0NXLXmgh35/g/kmTgUNWOx2e4rIq22TavWItKVFRShbK+VQhYiUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778339945; c=relaxed/simple;
	bh=DrWy0y7NveVkzYd9hPpSEEvdYt2saIyWubWUA0UpiTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YY3aHRzUMblb2a/Tyw+AuVZPd0TqxzbtLHEfcnS6hJGPnOEUWrc66r+BN+0T3s9rTUxy/TFkXk8IQYE/mjX48LXYleeo2ZQnEZNGiRaIWMdttLJThVVCQdxWPlH7hBg844a8vHQhj8Jth8HCwZ41ykyr0j/KRo43xnP3np5XJRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r55oQZDO; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r55oQZDO"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so4971852a12.3
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 08:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778339941; cv=none;
        d=google.com; s=arc-20240605;
        b=EocDOVB0q0MMuN58FFi+jzFkPp3qpBKBuT2aSL2PUQPy8qDseY9PcVYGVULvwpo/rt
         NyCVMDVoZLExEeXqhjCVkbSVJ7XLGuGPrvNwpxCg9OavxJWlG/BiR/b06UKqsnG6XbS1
         1BzJZVJ0IIs15ODgQLW4fTp6zcevSO0EgPwnBfHm0sz+s54lZYBviJ7Tdsi/0l8nrAcR
         IUK/8QYCJns7sfNulLPlR9LbPu+XXEVzYP5f0EogSsLtix+yAskMmlpuyBVXdktaP4GP
         Pu9WJ9hY3g4iEH+nGOlVJQmbBqru7Niv499fls0jSS+dSNntrzZeOT7DUzUoBp9im8YR
         qs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        fh=IwFJdSTL007C8slDtVIgpyPsuqkCfvu0jgFCpHlJsEI=;
        b=UVIzug59ohv3vUcrsUmjsMc3QdQqUYjKkh5qaXapNL6+A107xZED4GeFKlOYyam2n6
         wx5xb9Wv+GFRCoR8nYna5GZZzLxEZitT/t8XJWmL07ieivB60tKRY0GTMYWo0gLZ2Q3d
         WDyazWg3WoF/zsHlcbB6c4IZJltQY6+wSMmxetxINKfgcsGJIEUotshoFCFRfXFv1D2B
         AVw67PmEC9y8rNBthQAVffoAjZjCaSUE8HZyfEQDgX4aV4xuzAEGt3rrcF97T9LGtsCX
         6MF5uHaAOSnU7jfdHN+86JJnKZwos1bJ0f9ZBuMwEO4Eivv/6Eun4Lhn6u3AbddRUY1R
         XCXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778339941; x=1778944741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        b=r55oQZDOsRqK4ZkGHQzksyIU0QjD8GnvrtXQmqFARq/KIk6uc+u6TiaNAwwFhOebrQ
         fXqmGtLBL7xYggyy3vNzj805FMO1Z8ms+Fk0yHIuxCBUGo5U7OzbVtJPYg9tsMsrs1RA
         pO0HWSgE6k5Sf8cFkS01QPItv/wwcwk5pDfiVXpf0jnIPxxzy9YeVit3gendq7ezK5N0
         w3GZ2MKk1XkCVpf/659+gUfas88dIagIcThM0FcmeedSUXbkCEM07bj7XH6lsTox3dPE
         wcsewg/zMFWkz24Sp662hm8sA/MwKagDm/8F0HK5yqRZfmjfcKZ61li525Q6oN9vb6x5
         1rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778339941; x=1778944741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        b=tIQ8KqCV1ka5bLCnXhVB9CxS13FQS13+rmL4biIackQSkGdARxBLgeDbic+pfbLHl4
         GIsWkrPTF/HYEBxVlVT8Y4RV14SIitjOdinqVhUit/g8PQqV8iAIgHDGJmt+a/7ySSjB
         Bzj6x9OnHt0B17nZMfHx8dQTdR186HQkwOSWHEzhnCUCfG0CCyrUNUk9TAKB7qunJfui
         gIbTxJJ00Du23UzC56D8UDANoAr1BMFFVTcnanIpot4oOUp3AADhpFtJUOquLvhJ4VKp
         Ink2iMKb0fOYK1SrnZkcppL5PFGSbTzM5wO4+jQ4njzNrDe6PXNE26iBX8oGoz6E5NAH
         M8TA==
X-Forwarded-Encrypted: i=1; AFNElJ9ll3rdU5jyZ/1EuOBlJKQkzktept7twisMNB8N0PzPaDFP49OwkSYEzy5K+tIUVz0pCqz5ma6xhb2P@vger.kernel.org
X-Gm-Message-State: AOJu0YywnVoUKZhE/FD4md0D5zR5tHZ+ksoylHBOt28xqNBCGuPUhVvS
	XZ7OFrJcWU02/f/gtW1FJ/uW3c9ezowuVe74wAIoNbGBZKv/OcPig/QEjvzjhCdWvTGodCrnQYg
	KvEe7IEN6PEVHYGAt6rCxaOhK34nPJdht4njs
X-Gm-Gg: Acq92OFesNFe208w1IxTNTV1a3dHdUsYYNs8CrsWDjWxl1ewQrfN6AVAIRA0a5k+Vvk
	L6UhQYAzyesgc3UF7aBDN9VoN5a/9RdBwywT1IMFUnvePBrr93GK6myy8LJw7blCX7ca4XIIYqa
	WqGpjvRxkg370E98t+Xw+8wlI8yWeKZ11/8ClQNuL4g6SCTnujL0pSXwsMCVIc+5JsUHQ/IISdc
	6IHiB9GVOWcLmFBZjJFqjYREYyiT1NMHoY5ieX1Zt3T9xB9m2Hv8SEgUFoS1cHCC9z7sudT3Xt8
	A5se
X-Received: by 2002:a05:6402:510f:b0:66f:8fbc:c73e with SMTP id
 4fb4d7f45d1cf-67d63d8b785mr8680905a12.9.1778339940657; Sat, 09 May 2026
 08:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org> <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
 <20260509121802-GKB3601591@kernel.org>
In-Reply-To: <20260509121802-GKB3601591@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 9 May 2026 20:48:43 +0530
X-Gm-Features: AVHnY4LyUVJYkL_oLwoNQx2o6mh_XMStte74J_KAFvL20bhQMAlNuMI_2ORcHgg
Message-ID: <CANAwSgQNgXKitogbhQFcQaTTFtJ2sfxHehOCPdHH51S0a5wcSg@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Sat, 9 May 2026 at 17:48, Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anand,
>
> On 13:06 Fri 08 May     , Anand Moon wrote:
> > Hi Yixun,
> >
> > Thanks for your review comments.
> >
> > On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
> > >
> > > Hi Anand,
> > >
> > > On 10:48 Sat 02 May     , Anand Moon wrote:
> > > > Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> > > > DC input. As per the schematics, vcc5v0_sys is the input power sour=
ce
> > > > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> > > > to correctly reference vcc5v0_sys as their parent (vin-supply).
> > > >
> > > > Cc: Han Gao <gaohan@iscas.ac.cn>
> > > > Cc: Ze Huang <huang.ze@linux.dev>
> > > > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch=
/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > index 5790d927b93d..9727ecdd9f6b 100644
> > > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> > > >               regulator-always-on;
> > > >       };
> > > >
> > > > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> > > This will fall into the catogery of "non-controllable & serve no devi=
ces"
> > > see similar comment for 'reg_dc_in' which raised by Krzysztof
> > >
> > > https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kern=
el.org/
> > >
> > > or should I ask, what's the real problem if regulator has no vin-supp=
ly?
> >
> > If the device tree is not configured with the correct power source it
> > will affect performance.
> >
> Please elaborate, or provide enough evidence to prove this, because the
> conclusion you gave here contradicts with what Krzysztof pointed out
I don=E2=80=99t have the schematic for that board, so I skipped replying.

Please refer to the POWER TREE diagram, which provides a clear
visualization of the power sources.

This board accepts two primary power sources: a 12=E2=80=AFV DC input and U=
SB
Type=E2=80=91C power.
From the schematic=E2=80=99s power tree (page=E2=80=AF4):

Type=E2=80=91C =E2=86=92 DC_IN=E2=86=92 SY8386J (Uxxx) =E2=86=92 PI PMIC

According to the block diagram, the SY8386J regulator IC is
responsible for generating the VCC5V0_SYS rail  VCC4V0_SYS (see page
13).

USBVBUS =E2=86=92 SY8386J =E2=86=92 VCC5V0_SYS
USBVBUS =E2=86=92 SY8386J =E2=86=92 VCC4V0_SYS

USBVBUS ( TypeC port) --> DC_IN--> 12V

In this design, the SY8386J operates as a step=E2=80=91down converter, supp=
lying
both VCC4V0_SYS and VCC5V0_SYS rails and P! PMIC.

SY8386 is a high-efficiency synchronous step-down DC/DC regulator
capable of delivering up to 6A with wide input voltage support and multiple
protection features.
Datasheet [1] https://datasheet4u.com/download_new.php?id=3D1604744

I have tried to elaborate as clearly as I can.
>
> > > Any probe failure or something bad happen? (besides /sys/../regulator=
_summay)
> >
> > Not really; the regulator summary just confirms the PMIC used the
> > correct power source.
> > with te device ip blocks.
> >
> then I see it's unnecessary to add this
>
> > Bananapi F3 schematics.
> > [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/v=
iew
> > (page 24)
> >
> > Please check the shematics VCC5V0_SYS page 4
> > VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS
> >
> > Please check the shematics VCC5V0_SYS page 24
> > VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
> > which is enabled by USB3_PWREN (gpio pin)>
> >
> > Plese check power tree page 4
> > USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> >
> > So, this series tries to fix the vin source for USB 3.0 and PCIe nodes.
> >
> This is not what I ask..
Opps, I tried, but I wasn=E2=80=99t able to clearly elaborate on how the po=
wer sources
are distributed across the various peripherals.
>
> --
> Yixun Lan (dlan)
Thanks
-Anand
