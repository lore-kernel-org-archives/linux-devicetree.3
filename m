Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C443C3BE4
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493238; cv=pass; b=f04CuVdQFTPIIJ1i2e3V88/66nJgSNTTZHgM2LJhooXKwXNzeURM7T6ip+bMZPGmmUR/pbLxf8WcgWoLSTwiMyHNWPAFiwDEb8tf0lV82r2GFP8Wd9bgRBA3uhG6UMybmPjvLrRFstAlFkJHQGQQWg3fe66lprKMlYYb+aSFbO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493238; c=relaxed/simple;
	bh=OftHF98utKe1fDefYZB9XhEpzmYB4opOcaHJtqbq5xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkaSi10GYFNg0LZHEguK1sa9SjXwK1md+pHldm+G4MhLiEqPHILu1G3t5BsUbNAaaMOEZCzvxUHF7Cv9dNHJVIAI7TbUP1l4giM402Is6Bk+/lnx4XmFo3E8DbXRdk65U96jRSNn7Ppd+p2bkh2Y57JfXBd0kv10Zcjw1F60ueg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksI/B/zz; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksI/B/zz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd01481e592so78614766b.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778493232; cv=none;
        d=google.com; s=arc-20240605;
        b=ef+4viPuvnibAaI4y7f3C++lTWjBcIPbjr5ijla+pkbNqOhrrNJZBPE88QWBjQgn0u
         tMVtxxrtOM3OAeMXSCIhIPU1J9riJUCiPr+gorjCHS1eGgVqUqOLfc2lsGD92oTDxEM9
         RuY5mJblrS+oeTdKhGj2BbrzC6sLMiLjlc26WR9YYvRLhlE2iSvOI31VPGKKAM6cVfYY
         9H2EJPGvrl/PDfDjiER2aibsnSkxv3vShVR7/g7dtZFc/BRF1limtrRUjJ5B4dIsuo5c
         ZnT1u7IM1G8iDwse+IB7BaXC7nusUeWHK2uC8BYivNG7ZKqcWYZLiZ/uq1SvdDD0B318
         12fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        fh=JSIn6a4avly3m6UkC5h8auBxt+r5OsSzbxpkRbC+xnY=;
        b=guEGLmyTQQRjEdgpwDG8HxI18SsQ9HrYFsvNs91+Zc6hxJKGJzPGrx4w/lHWafRypR
         An7tKsD6qEvA53LemJ3EOFawzdDbGpqKJN0vPdOi1R3vpySd9kAWfmH5fpi1lg2xSOO/
         3PbiLqChtj6PmbAAVHaPk3pHNxQZ7niZoynaQRG6cqsD1OEv02a2xSNRhsd6cpzehfRs
         cSvxv+4w0lfyvoIydUdFDyWZh1r8402o3LPThmx90UN3zkgo4CMIoAZlKa5dOon3i7ai
         1k/FczI2CHqXfSdgGpgmcLhud8WFY2DzCJiqwP7Wybj2P5BaMJ3nCDsohhCULPmkmhw+
         Iguw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778493232; x=1779098032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        b=ksI/B/zz9SYrgVu7SoO0qSRzkIJ6P7OoCwBULoN/CIQw1uW0J14I9Lpboy+pI1XWnj
         sR4iev5q12VOIumENS1B8nd6AfSr7Irc8p6zHfyAxR4ioI+MwIYso4gZs8qUsK6SIcIO
         G4ju/WOgFIXZTN2frl+WoXibUFC24zP/gCV9j7jYVAUuieyz23HpUdT8FXqitO6ynv5Q
         g8XjrY65pJaKDrlRl9TW8mzU5Izfp5iF4BIgDmBW+YMGn4C/5Oz+0qEScFXxyYkPFJBa
         LZVodgJTAA4c/2OuglSS0c3m8W9CyxOMgjIwiZ266FQG9SDXOKIfzJPTxF7J1rWaF8lb
         xT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493232; x=1779098032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        b=cuQBVE7wC3FgI5wE5N7bje49CNMpy2+hNGLG03wXsBI3M+JG9yS8n2PRjmELAOIsnw
         w7OU29xPBgPhoy7R10T+/oLoswrfsVU7+D0Dhbi9rdhVov4O5xAIX25sweys+AQ1Tdxr
         evs97n4RuMgWHtTt9xf90MPMGjSmSRiPEUogBHEfthryUmdf1zlivUS0mZiBYgnZVO+8
         /JnLpy80u5XwBGUobUul09ShxH+iTn58Ng/EHHlb+zyRwlVHu/AzSvDYHDgpgnOPVef9
         J2EIRZG5DMR528vhU90x4Vez8mRoylBrBSx9iI5dYWNZNFhdo742CyCj4MFD1FhrEhWP
         D7Tw==
X-Forwarded-Encrypted: i=1; AFNElJ/27vhmjjzHvdxP5L2xu2Rg0fRxOWWpnXSgT/6HThIwSZXwuNYU8ebik1iva1wAWY5QvVSgsAn7SWiL@vger.kernel.org
X-Gm-Message-State: AOJu0YySK8MlmyRzAZzNb73cJzYHtsMj9YitLZ6s0ysMBeG7lncTK7c5
	wqwn/gYBHYDCNihjgQAOL8kgokry2lfI8jPooGSGm3y4OHRl2h8C5wmwrqkIoZ+8PBMDf4+LM6W
	xiHZZnNMYA2FsXdG+uyFHr0aWg7JPuzI=
X-Gm-Gg: Acq92OEyGFLIK/7wgcdxIzfA61SKh/sgi8fHuLcuRtNKepaee229+6Q/Z6oRUXeC1dt
	0PIH50RgJaMlcUgiP+FdIoVIJITkJbhJ2MeiULJVpZo1posSBWTH7RZngp5zisV0FuPlex7ZPWA
	GPE0J0NWvTV9wtCzil7oRQJwxatBl0/Kap/ae8DbfCJfHtB5KK8aJcc0SNK4psz/Dnn0KOq0AaU
	WXyZNEu9BtjIsUOA0rkUvmCZKwVmgNbqE3EByAUJ3a1OWujbnt1l/J8hzFv5PpSGOGqX4XTcIZ7
	6XOqlKYA3P3aqYEZ7xMb7nJ1Pw==
X-Received: by 2002:a17:907:970d:b0:bcf:1d87:11be with SMTP id
 a640c23a62f3a-bcf1d871b7dmr249140166b.19.1778493231921; Mon, 11 May 2026
 02:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org> <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
 <20260509121802-GKB3601591@kernel.org> <CANAwSgQNgXKitogbhQFcQaTTFtJ2sfxHehOCPdHH51S0a5wcSg@mail.gmail.com>
 <20260511065338-GKA3624147@kernel.org>
In-Reply-To: <20260511065338-GKA3624147@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 11 May 2026 15:23:35 +0530
X-Gm-Features: AVHnY4KbnlDceZWMAiIkuvkcFalGLhmIPDWMJqWZnt6VcLlOiYENy77kljjTReU
Message-ID: <CANAwSgTXo_ZO5DhK5BwLvCFXqsJ0dwmXeA6o-TebW-A87Y8+-g@mail.gmail.com>
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

On Mon, 11 May 2026 at 12:23, Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anand,
>
> On 20:48 Sat 09 May     , Anand Moon wrote:
> > Hi Yixun,
> >
> > On Sat, 9 May 2026 at 17:48, Yixun Lan <dlan@kernel.org> wrote:
> > >
> > > Hi Anand,
> > >
> > > On 13:06 Fri 08 May     , Anand Moon wrote:
> > > > Hi Yixun,
> > > >
> > > > Thanks for your review comments.
> > > >
> > > > On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
> > > > >
> > > > > Hi Anand,
> > > > >
> > > > > On 10:48 Sat 02 May     , Anand Moon wrote:
> > > > > > Define the system 5V fixed regulator (vcc5v0_sys) supplied by t=
he
> > > > > > DC input. As per the schematics, vcc5v0_sys is the input power =
source
> > > > > > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulato=
rs
> > > > > > to correctly reference vcc5v0_sys as their parent (vin-supply).
> > > > > >
> > > > > > Cc: Han Gao <gaohan@iscas.ac.cn>
> > > > > > Cc: Ze Huang <huang.ze@linux.dev>
> > > > > > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > > > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > > > ---
> > > > > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 +++++++++=
+++
> > > > > >  1 file changed, 12 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/=
arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > > index 5790d927b93d..9727ecdd9f6b 100644
> > > > > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> > > > > >               regulator-always-on;
> > > > > >       };
> > > > > >
> > > > > > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> > > > > This will fall into the catogery of "non-controllable & serve no =
devices"
> > > > > see similar comment for 'reg_dc_in' which raised by Krzysztof
> > > > >
> > > > > https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@=
kernel.org/
> > > > >
> > > > > or should I ask, what's the real problem if regulator has no vin-=
supply?
> > > >
> > > > If the device tree is not configured with the correct power source =
it
> > > > will affect performance.
> > > >
> > > Please elaborate, or provide enough evidence to prove this, because t=
he
> > > conclusion you gave here contradicts with what Krzysztof pointed out
> > I don=E2=80=99t have the schematic for that board, so I skipped replyin=
g.
> >
> No, you didn't answer my question, I was asking why "affect performance",
> and you just gave me the opposite conclusion
>
I tried to justify my changes according to the schematic I understood.

> Let me elaborate, the reg_vcc5v0_sys is a regulator that has no software
> or GPIO control, so no need software control from the kernel/driver persp=
ective,
> which also mean it will be automatically enabled from hardware perspectiv=
e
> once the board power up - "non-controllable" in Krzysztof's reply
>
> the reg_vcc5v0_sys currently only serve as vin for other regulator which
> is not a device (e.g not USB, PCIe, eMMC..) - "serve no devices" in
> Krzysztof's reply..
>
Many development boards follow a similar regulator structure, with
fixed regulators assigned to USB, PCIe, and other internal subsystems.
This design is consistent with the semantics diagram, so I=E2=80=99m not
introducing anything new.
> and by introducing reg_vcc5v0_sys, kernel driver need to do additional
> work to go through probe procedure and register the regulator device,
> consumer depend on it need to wait, this will hurt performance, slow
> down system boot and even consume more memory..
>
No, it simply defines the power hierarchy to ensure that each device receiv=
es
the appropriate power source.

> By dropping reg_vcc5v0_sys, it will result as a stripped power source
> tree, this is only downside I can see, but doesn't really hurt..
>
No issue. If my changes are breaking your development board, please drop th=
is.

> > Please refer to the POWER TREE diagram, which provides a clear
> > visualization of the power sources.
> >
> > This board accepts two primary power sources: a 12=E2=80=AFV DC input a=
nd USB
> > Type=E2=80=91C power.
> > From the schematic=E2=80=99s power tree (page=E2=80=AF4):
> >
> > Type=E2=80=91C =E2=86=92 DC_IN=E2=86=92 SY8386J (Uxxx) =E2=86=92 PI PMI=
C
> >
> > According to the block diagram, the SY8386J regulator IC is
> > responsible for generating the VCC5V0_SYS rail  VCC4V0_SYS (see page
> > 13).
> >
> > USBVBUS =E2=86=92 SY8386J =E2=86=92 VCC5V0_SYS
> > USBVBUS =E2=86=92 SY8386J =E2=86=92 VCC4V0_SYS
> >
> > USBVBUS ( TypeC port) --> DC_IN--> 12V
> >
> > In this design, the SY8386J operates as a step=E2=80=91down converter, =
supplying
> > both VCC4V0_SYS and VCC5V0_SYS rails and P! PMIC.
> >
> > SY8386 is a high-efficiency synchronous step-down DC/DC regulator
> > capable of delivering up to 6A with wide input voltage support and mult=
iple
> > protection features.
> > Datasheet [1] https://datasheet4u.com/download_new.php?id=3D1604744
> so right, SY8386 is a passive device which need no software control,
> non-controllable..
>
Not all regulators are software-controlled.
If the K1 P1 power management IC provides 5=E2=80=AFV rails, these can be
utilized to supply internal peripherals
> >
> > I have tried to elaborate as clearly as I can.
> > >
> > > > > Any probe failure or something bad happen? (besides /sys/../regul=
ator_summay)
> > > >
> > > > Not really; the regulator summary just confirms the PMIC used the
> > > > correct power source.
> > > > with te device ip blocks.
> > > >
> > > then I see it's unnecessary to add this
> > >
> > > > Bananapi F3 schematics.
> > > > [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyy=
lv/view
> > > > (page 24)
> > > >
> > > > Please check the shematics VCC5V0_SYS page 4
> > > > VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS
> > > >
> > > > Please check the shematics VCC5V0_SYS page 24
> > > > VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
> > > > which is enabled by USB3_PWREN (gpio pin)>
> > > >
> > > > Plese check power tree page 4
> > > > USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> > > >
> > > > So, this series tries to fix the vin source for USB 3.0 and PCIe no=
des.
> > > >
> > > This is not what I ask..
> > Opps, I tried, but I wasn=E2=80=99t able to clearly elaborate on how th=
e power sources
> > are distributed across the various peripherals.
>
> Hope I make it clear this time..
I tried to elaborate, but wasn=E2=80=99t successful.
>
> --
> Yixun Lan (dlan)
Thanks
-Anand
