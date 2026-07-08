Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1242640926C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530060; cv=pass; b=FBzUS/HgdyseP/9q8Lq9vJlrPVvTuAeV63bfd5qT7dk/cSWdN8C9EPWuExSIJ1cOBLBC0MJzvUnpSfoUiXLeH3wEGJbyfh+Hb3pVKNg8VTqAiF1bIb+xBV+IW0V9m4ALibagu863mS+XHWTCp7wFcff2g/Zp4yQAcBED6MskphU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530060; c=relaxed/simple;
	bh=W8eIEWNV4Lg1AgsxOXc2g7AdcwmqqBy/84fiSqtrQbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXrhmAxsboZHJToeuX/r5kFZ9VirpxuR1Zm7rlDO6vsG/UWM8xnN/qcVsvyhQcgWR112PqR3F2ea/USOdH7SKpIJ/50PvIg7c4ZJJ/eCpENxQukz4IS8GmgNr2phtKqgt2Rm6OBEgFVPTw/0I/+MjeAGsdtpFAyt562inscqrVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvbt3azm; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvbt3azm"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8b49639fbaso2745a12.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783530058; cv=none;
        d=google.com; s=arc-20260327;
        b=THkkHRL5ckJlVTdCghBqiEzvHqk93srZ7byp+FnQ133QDFJvl9CayRPVfmQ8zKevzc
         faBC2BXiSkXuRrkU9zh9d6/DGdPQGSgvIntbEs3+igRxc7p/Ho2MeYsKbFkwoM6UhnsO
         M2g2sijxNEAvuozr/2k2/44GOaTnsmSegmnzNMqO/TO+gUKoqNVJEz7jr7ZfJlhNkY0u
         J5rpEqPRgX9qyoL44Yhg8nw2GYonlJMMXYB4RyqAREXgQ+28KFlpGUyDP991xD5SJlUH
         JFF9amoO6mmMwlnDKbAcdE6klG3vl5TZKFDRztuZL8abCh3uL/JoOIWCqlOF7ZoGP1mB
         Vn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJgq1hdSaEnlg7KPyw8iDLSOCyB+KQFBg4rjGDDZ4Uc=;
        fh=39t3Q/ZSVFWpYTGr+4XqjkUIzwmDZf6RJqlpqVIkq+0=;
        b=Kk6ja2pnuNF6LQew633fVCkR0yGZHPOwoKxYSghwdvv9K7cC8oN5Q1l9Ga0BPj7yRA
         6olXvZRma5RuC5Y2Q622mHiZXNaN9QOsZu2vyrkWwK7V8CRMVuYg7TkzQjMghqUDuEif
         7vatFfE+dgIQ42boLfNcV+TQRGkYQhpXbnk/qr6j98/rUG5BHpYmlInB7Flc+S8tPrLs
         +WlsgwOu/+P+hKukGUenNdpm1v1EeNKY4jVJMwtx+Vm0ZM8puqvq7D65V2e+Gw5r4rGB
         JZaXIHJ2+1pX91HhNsFymHDsdibHKV1gV8Xj4Z15bcGoajTReNlXRwGn8KuicxAo6V/F
         xhew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530058; x=1784134858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJgq1hdSaEnlg7KPyw8iDLSOCyB+KQFBg4rjGDDZ4Uc=;
        b=kvbt3azmZ5aMC9FsfAUtqbXHdavnx1KpX2Evj36WfNCst+T83jQUgzIRzcDthpm7ko
         Wl+wiFo0vxQoW6g0y4vCPiuxM9Unls/A3ZPq3rY2cSAbbWkFfIAY0AzHJF/PJU6oS/WA
         Ex091txRMDV4JJG0s5gzr15/+AR9n+EA4B7L4EAlCCa9i74BM2ApX3MkzHRtk3ukbOAC
         Eu1RtKH6Ao6prcx/aWYAQcIMAFjso0FC5zAnMkkXpx+7klWfkJTbJ1J6vCV+sfvGy3+6
         0zdXb6rW03Dw7x2XdJoi43id8Zt5clxDFA+CihB9Opry4p4+nIIqhB6pWp1rPe7+yIze
         CdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530058; x=1784134858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJgq1hdSaEnlg7KPyw8iDLSOCyB+KQFBg4rjGDDZ4Uc=;
        b=R85beG/eEsI/RYzFYJ/D1RA+x476hMqosJ2jMwMZrN729c0OZXx1Idw2snW89zUIZY
         l2efmB1twuxxJIjPBS2wFvIMQlzkLYf1dkovz0KTUSBP8utJgfeLunjjyg57FAETB8AU
         Z92j8Uxu4Z7ycqvz6GpRVSA/vRXPPdi/KEggkytgfSDecv+3PF7+6bGPyh1NbRgNARbj
         gCoB5weGtaAcbpHouVE7NHRIIxF4WEoeRATrRgV4W0sKd3XdT/g+O24Dwa8k0jIqUcyd
         knsSHjjeA5WMK73Mk1ADbxnqI2k+JrbPlU0SgBB8MqjT/vEH1hgq+dRJZsn8BiHE8qLF
         VKHw==
X-Forwarded-Encrypted: i=1; AHgh+RqtUf5iRIHtmY0ghCsFfLFXOaobKjh6O1UkiS8W8y7iF3kwwsEuxctlgyblg8B62uNw6p5sbrL8x58o@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNfxXJhMbNswHUlU0xnu2qUOLviZ5CblClXb4FE2Zb5+3W8jZ
	/yAkT3msimpQB88u7ruxC1muIEYTW0kJpLqrienMeUoZcKoe6XAXIAldTeAvAuGgzl0zo3ZW00t
	1AWicM1WA4sW80O/S9rMnLLJ1GXbdIYjj/nYG
X-Gm-Gg: AfdE7cksgzexjXjkNBxbQpJ+lkybu7LzFmyFCDSyDBeCdX6g3OENEQWdAFTiIccz1Xv
	hEoG58+DHZ9yCFMSaO/R3NQ6JPLPU6psQtGeYtYIBqRFTGRIykJcYC/C4R8l/EXsvRr5eGPTPNt
	YLotSi6hwnXfY7WyopjOYd8sUFVz22OqLZXQ9UOWNdJpc1ILyTQ6fuvROm0aEitPsXjMdRQ9XnF
	HPPtXGNsplAZGlmz6v8bd7WWx1m9nOgu/C0XBxEowdOMZ5renI8/mSm1fT6JCPPznMxjAWyFA==
X-Received: by 2002:a53:d018:0:b0:664:6d12:1f3b with SMTP id
 956f58d0204a3-6679effc4ddmr2385788d50.3.1783529587276; Wed, 08 Jul 2026
 09:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708125352.1915040-1-tmaimon77@gmail.com> <20260708125352.1915040-4-tmaimon77@gmail.com>
 <20260708131101.C23C91F000E9@smtp.kernel.org>
In-Reply-To: <20260708131101.C23C91F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 8 Jul 2026 19:52:56 +0300
X-Gm-Features: AVVi8Cf-_oFSXa-fC1UcIDHKMC-4yKp0muJRAjtuMlVILRwIEOgf0oM1ZZqblkQ
Message-ID: <CAP6Zq1iY9GEo6YQEk9CcFKW-PiVUxd-hKJyjMGuhH494hh91yQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 at 16:11, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The `fiu0`, `fiu1`, and `fiu3` SPI flash controllers omit the =
required `memory` mapping region.
No, it is explained in the dt-binding
  Alias convention:
    The '/aliases' node should define:
      For NPCM7xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux;
      For NPCM8xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux; fiu3=3D&fiu1;

> - [Low] The `pspi` (Peripheral SPI) controller is added but not documente=
d in the commit message.
Will be changed in V8
>
> Pre-existing issues:
> - [High] The IRQ name passed to `devm_request_irq` is allocated on the st=
ack, leading to a dangling pointer in the IRQ subsystem.
> - [High] The fan ISR calculates the module index using virtual IRQ number=
s, leading to an out-of-bounds array access and memory corruption.
> - [High] The USB device controller driver fails to save the allocated `ci=
_hdrc` pointer, causing a deterministic NULL pointer dereference on device =
removal.
> - [High] The EDAC driver frees its main control structure on the probe er=
ror path while a device-managed interrupt is still registered and active.
> --
>
> --- Patch [3]: [PATCH v7 3/4] arm64: dts: nuvoton: npcm845: Add periphera=
l nodes ---
> commit f606ce99eafc7d4c8e2d67d9d5119b1c25593a16
> Author: Tomer Maimon <tmaimon77@gmail.com>
> Subject: arm64: dts: nuvoton: npcm845: Add peripheral nodes
>
> This commit extends the NPCM845 SoC DTSI by adding peripheral controller =
nodes
> needed by the evaluation board and downstream platforms. It adds nodes fo=
r
> Ethernet, USB, MMC, FIU, memory controller, RNG, ADC, PWM/FAN, I2C, and t=
he
> OP-TEE firmware.
>
> > Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
> > by the evaluation board and downstream platforms. Add the Ethernet MACs=
,
> > USB device controllers and PHY, MMC controller, FIU controllers, memory
> > controller, RNG, ADC, PWM/FAN controller, and I2C buses. Also add the
> > OP-TEE firmware node needed to describe these blocks.
>
> [Severity: Low]
> The pspi (Peripheral SPI) controller node is added by this patch, but it
> isn't mentioned in the commit message. Should it be included in this summ=
ary?
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 0e5feabf2d718..7608dcf5489c4 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> [ ... ]
> > +             mc: memory-controller@f0824000 {
> > +                     compatible =3D "nuvoton,npcm845-memory-controller=
";
> > +                     reg =3D <0x0 0xf0824000 0x0 0x1000>;
> > +                     interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
>
> [Severity: High]
> This is a pre-existing issue, but adding this memory controller node expo=
ses
> a vulnerability in the EDAC driver (drivers/edac/npcm_edac.c).
>
> In drivers/edac/npcm_edac.c:setup_irq(), a devres-managed interrupt is
> registered and the hardware is unmasked:
>
>     ret =3D devm_request_irq(&pdev->dev, irq, edac_ecc_isr, 0,
>                            dev_name(&pdev->dev), mci);
>     ...
>     regmap_write(npcm_regmap, pdata->ctl_int_mask_master,
>                  pdata->int_mask_master_non_ecc_mask);
>
> If edac_mc_add_mc() fails later in edac_probe(), the code jumps to the er=
ror
> path and frees the main control structure:
>
> free_edac_mc:
>     edac_mc_free(mci);
>     return rc;
>
> Since the interrupt remains registered and active until devres teardown,
> could the hardware assert an ECC interrupt during this window, causing
> edac_ecc_isr() to dereference the freed mci pointer?
Yes, should be changed
>
> [ ... ]
> > +             udc0: usb@f0830000 {
> > +                     compatible =3D "nuvoton,npcm845-udc", "nuvoton,np=
cm750-udc";
> > +                     reg =3D <0x0 0xf0830000 0x0 0x1000
> > +                            0x0 0xfffeb000 0x0 0x800>;
> > +                     interrupts =3D <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&clk NPCM8XX_CLK_SU>;
> > +                     clock-names =3D "clk_usb_bridge";
> > +
> > +                     phys =3D <&udc0_phy>;
> > +                     phy_type =3D "utmi_wide";
> > +                     dr_mode =3D "peripheral";
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: High]
> This isn't a bug introduced by this patch, but adding these USB controlle=
r
> nodes exposes an issue in drivers/usb/chipidea/ci_hdrc_npcm.c.
>
> In drivers/usb/chipidea/ci_hdrc_npcm.c:npcm_udc_probe(), plat_ci is
> successfully returned but never assigned to ci->ci:
>
>     plat_ci =3D ci_hdrc_add_device(dev, pdev->resource, pdev->num_resourc=
es,
>                                  &ci->pdata);
>     if (IS_ERR(plat_ci)) { ... }
>
> When the device is removed, npcm_udc_remove() passes the uninitialized ci=
->ci
> pointer to ci_hdrc_remove_device(), which immediately dereferences it.
>
> Could this lead to a NULL pointer dereference during device unbind?
>
> [ ... ]
> > +             fiu0: spi@fb000000 {
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xfb000000 0x0 0x1000>;
> > +                     reg-names =3D "control";
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPI0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             fiu1: spi@fb002000 {
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xfb002000 0x0 0x1000>;
> > +                     reg-names =3D "control";
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPI1>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&spi1_pins>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             fiu3: spi@c0000000 {
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xc0000000 0x0 0x1000>;
> > +                     reg-names =3D "control";
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPI3>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&spi3_pins>;
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: Medium]
> Do these FIU controller nodes need a 'memory' mapping region?
>
> Without the 'memory' register range, the SPI driver might fail to use
> memory-mapped direct reads and drop to UMA (manual) mode, degrading
> performance. The fiux node below includes it, but fiu0, fiu1, and fiu3
> do not.
>
> [ ... ]
> > +                     pwm_fan:pwm-fan-controller@103000 {
> > +                             compatible =3D "nuvoton,npcm845-pwm-fan";
> > +                             reg =3D <0x103000 0x3000>,
> > +                                     <0x180000 0x8000>;
> > +                             reg-names =3D "pwm", "fan";
> > +                             clocks =3D  <&clk NPCM8XX_CLK_APB3>,
> > +                                     <&clk NPCM8XX_CLK_APB4>;
> > +                             clock-names =3D "pwm","fan";
> > +                             interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL=
_HIGH>,
> > +                                             <GIC_SPI 97 IRQ_TYPE_LEVE=
L_HIGH>,
> > +                                             <GIC_SPI 98 IRQ_TYPE_LEVE=
L_HIGH>,
> > +                                             <GIC_SPI 99 IRQ_TYPE_LEVE=
L_HIGH>,
> > +                                             <GIC_SPI 100 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                                             <GIC_SPI 101 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                                             <GIC_SPI 102 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                                             <GIC_SPI 103 IRQ_TYPE_LEV=
EL_HIGH>;
> [ ... ]
> > +                             status =3D "disabled";
> > +                     };
>
> [Severity: High]
> This isn't a bug introduced by this patch, but enabling this PWM/FAN
> controller node triggers a dangling pointer bug in
> drivers/hwmon/npcm750-pwm-fan.c.
>
> In drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_pwm_fan_probe(), the IRQ name =
is
> allocated on the stack:
>
>     char name[20];
>     ...
>     sprintf(name, "NPCM7XX-FAN-MD%d", i);
>     ret =3D devm_request_irq(dev, data->fan_irq[i], npcm7xx_fan_isr, 0, n=
ame,
>                            (void *)data);
>
> Since devm_request_irq() stores the name pointer in the IRQ descriptor, t=
he
> stack frame destruction upon probe return leaves a dangling pointer.
>
> Could this cause a use-after-free or panic when userspace reads
> /proc/interrupts?
>
> [Severity: High]
> This is also a pre-existing issue, but there is another bug in
> drivers/hwmon/npcm750-pwm-fan.c that this node exposes.
>
> In drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_fan_isr(), the module index is
> derived by subtracting the first virtual IRQ from the incoming virtual IR=
Q:
>
>     module =3D irq - data->fan_irq[0];
>     spin_lock_irqsave(&data->fan_lock[module], flags);
>
> Because the kernel's irqdomain does not guarantee that virtual IRQs are
> contiguous or allocated in order, could this subtraction result in an
> out-of-bounds array access and memory corruption when acquiring the spinl=
ock?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708125352.19=
15040-1-tmaimon77@gmail.com?part=3D3

Thanks,

Tomer
