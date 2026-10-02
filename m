Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DB32D0C92
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 15:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953352; cv=pass; b=nyRP1WzxBEgwzOlTjWasBch4t3PDiGukUFKWtauTznB6biWwTVeyUhfbJGbRwnvG+tzzLhWZIuuZXf7dO6RUsAhYlFwWJtInGg/yNDoBEx0w9xlAGoR0G5zcuAHCu86GmuazhhYWhG9WtO7869nY11F5ALd22GgN5K3G0U4Bn/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953352; c=relaxed/simple;
	bh=wUHlRGgabvd/IDc5AahAdhZqyb4TNA1+nSGNQQVi8DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYxCuBlmpTD7YrSKpLRvD77cntBlSPSDp9jg9bhCEis24mdr2nZmmywiGC+gsmTm0CLvx2RWNMkfbKZJp0oKAO+7tASC8Bm7+3iGHH2hdMTUzbv1dBmsSxhFyGtVcm+ED7sH8PG4TaRptGKoS7cKR8VOjLa8FeRJNLADe3SfazQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oI5JEaOY; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oI5JEaOY"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso1098466b.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 08:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790953348; cv=none;
        d=google.com; s=arc-20260327;
        b=XVJjZ9uIkvaNYlWjlGFpaFgDk3zy1Dzkatb4RDe/DunhnzRinpfuXMs6wR8CjhYD/U
         JsT7ngPxwjUVBV/msqaYUBa1LsHHtuZOpWR6IK9n209MjBTHrXRA9xcccZg84EftgTA0
         mNQLqkOOqNzg2konKLKbAM4+3p/mPdvxdvCIkW4kHPzcYEfM5IAmXWi2YG64LG/YwS8S
         6AOFG4pVsnEIdt94Yqa/yLy6ybs7jVezCdT85tTDJzdOjdVTYcvEUXT6a9Y8YuAMa93S
         fMb2ECLS73nI3ZDyvcYnVEaLuS4bYRFUvLpIITRVhYUS9JzTBRa++sEWNkBnIaEVm/32
         EJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SihQBaFSJZg5WqgvJRRoz+8MQZezDgv4EBMwrc0TG1A=;
        fh=ypQoHkO0VupQWa5Xem9ECKjP2q6sRzXW+Yfi0Ov8hCk=;
        b=A4rN72qiSjKd3Aq16pKDQMxOM8DoDPfGB+YmW2AZFILFa8zZq7RjX4Si9ULlvqFbIw
         jhy/0z5HZZwk4tgTeRhRBaNjnh1cKL07qAjnP881z8UrVHAvvVxwMXC2FYcLJzW19YZH
         enrYUeoUAtDuM26hI5MzMXZ+CTzbHZrYX5kqNsYDawHha+igbq9W+HvhUe3YvAFgxtxx
         03N0w35vIRVRjx7cyRH8lzsGl5y9GpWU0ZG8unCrlbKlKOdBX2WDKb0fdDVnWBq6dutE
         227tACrydWAk0rvRG/pDxux1DXUyIB0usKom1OPnY5/dwgmEo32AZWDRy7m62iNdQ3O6
         lcXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790953348; x=1791558148; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SihQBaFSJZg5WqgvJRRoz+8MQZezDgv4EBMwrc0TG1A=;
        b=oI5JEaOYVpNqXqi3RHMRrNeLkMinI0GB3v4IVn1FcaHhTY9xxAXG+xkBf0cg6RJXGa
         jJOTUcJA1OCPv1HHRbxecCc00gltY9BotipZGWr6wBI7jTU1PGr1GuxktePogRduh4Es
         gJl2B2AUOY7vpQXKqnO7ElZ59lIpnZjbAnAF0CMARUYnEqgQnOXAoQkW/UGLgnT61Mu5
         EcZe0Ot6hXr/8GihgenPYv3Qmr1rksKgLgnSMtZRQzeaAMMoX2XEpXqu5/O4QfeTEvvO
         y7M/eqttl2LbvNwbBYoXKvnv86gbF8QsKqRqYtRen0oDlqgcX6M+G18vXIK5/baMPJb2
         t+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953348; x=1791558148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SihQBaFSJZg5WqgvJRRoz+8MQZezDgv4EBMwrc0TG1A=;
        b=W7iJjTwi53LitktawE4+ZwclO3j7UpnHKTCYDQCif2pNy0jWt1goJ5c0yPguT3/NQQ
         QQH7mKsXCT5IcVmZv0DBE8hMTNjmggcgAV7iBPG+LpQXSBjHwrR9bmyouLgWoYSXXvlK
         c72K8gpr6VKA6YGC6mU7nGIfC9wIYCkyDmQambSa8rWLEM4hb6INVLNiSKLY7EgBov5N
         DULMyuRjfOxdzo0UHvvpXs9iHvVHeDFqOAPX/0MMBHVCDyx7pVJEsag7Zv1c/zoywc/G
         lm4m0l+6mG7newNGBAFmK5tLZTl7ADRqOJdpzzaZu0PFS/aV5/RFBINKG7ywr93RgzpK
         nVcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzishKH0L4DzKQxOgfCvT1lliVwR1eXs57zXc+czMBJn3h+1d3bHrirSATTfO8FBimJrNMfYccELVzh@vger.kernel.org
X-Gm-Message-State: AFuF++njIb8DdcFJpBEGHbaw3t0KzZYewJdvwhW3TxLQ2ImmheLIzY2l
	/SfPWRKtoamRR6jz+ce62bx8D72BQONMNEXYWUxflhCSiVpWjVsQn7YmIMQYdd3VZkFiAzfDBE2
	jk/dWlrhXBLWhfKJFE9pzeNIfTz002C0=
X-Gm-Gg: AYBFou3uoS8SHWNSEh9jtJp9TqDI5J5pS40bKaBx9rEYReDGofv00rJpCTs5oQddFGL
	q3Y/BLMfONv+5h3HBUGJKw1ZgTg76TJyHWmiX1WEvo9BCoQ60baKQjE2q6X0sqZwXuZGIZ1QVqN
	zrUgtugTUZft+QVC+B3nBnaYmAjCWX/4isvPnSIfXXw0UbSjJqcpkoCB1r+hOjm1JbcisLDw3Ds
	Bd2NbeqdNtPwcsqtrRZjZBQfgoLSlZkelbmwuPtR5VHbYa6ehldDlWY2bII2yqUc/mzxqjIUXP0
	VBrq8jCvK+f4CfoE264mZdaSRCewqTqzAeeYubHyYqGjgrcgK4rvLp+ylwi0eqYALCk=
X-Received: by 2002:a17:907:3f1b:b0:c24:e1e9:69c with SMTP id
 a640c23a62f3a-c2e4a6bae9fmr245232966b.0.1790953348274; Fri, 02 Oct 2026
 08:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002102419.830595-1-sander.speetjens@gmail.com>
 <20261002102419.830595-4-sander.speetjens@gmail.com> <e49fdbd1-dbe9-4c06-9797-492db689d894@gmx.net>
In-Reply-To: <e49fdbd1-dbe9-4c06-9797-492db689d894@gmx.net>
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Fri, 2 Oct 2026 17:02:16 +0200
X-Gm-Features: AclHuK_lgAI88pm0RGCZ7CEgCgYo2LUQXG34CtS9xvBXG_tenjLpNr6v_B2O4bA
Message-ID: <CAAOJLPES726fWp_6SUaE-S7wGVzG+msEL7RRL2uYbzW7OWbvcQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] rtc: Add Raspberry Pi 5 RTC driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi stefan,
I was thinking of making the raspberrypi.c firmware a speparate patch,
what would you think of this?
Because it overlays with another patch
(https://lore.kernel.org/linux-arm-kernel/20260919034840.28593-2-triet.hoang.dev@gmail.com/)

Kind regards


On Fri, 2 Oct 2026 at 15:58, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hello Sander,
>
> Am 02.10.26 um 12:24 schrieb Sander Speetjens:
> > Upstreaming the downstream Raspberry Pi 5 RTC driver.
> > This driver supports the custom DA9091,
> > which is accessed through the firmware mailbox.
> >
> > Based on code originally written by Jonathan Bell <jonathan@raspberrypi.com>
> > and Dom Cobley <popcornmix@gmail.com>
> >
> > Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> in general this patch looks good except a few nits, maybe wait for
> Alexandre's feedback.
> After fixing the nits you can add my:
>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> > V9 -> V10:
> > - Fix sign-off-by
> > - Change enum to defines
> > - Change comment in firmware
> >
> > V8 -> V9:
> > - Fix whitespace in Kconfig
> > - Move RTC regs to firmware header
> > - Add a warn when getting the min or max charging values fails
> > - Remove the unused return value of set charge voltage
> >
> > V7 -> V8:
> > - Fix whitespacing errors
> > - Use of_machine_is_compatible instead of strncmp
> >
> > V6 -> V7:
> > - Move from u32 array to struct
> > - Fix encapsulation as mentioned by sashiko-bot
> >
> > V5 -> V6:
> > - Add MODULE_ALIAS, as mentioned by sashiko-bot
> > - Encapsulate the mailbox data in le32_to_cpu or cpu_to_le32, as
> >    mentioned by sashiko-bot. For good practice
> >
> > V4 -> V5: No changes
> >
> > V3 -> V4:
> > - Fix Kconfig depends that disallows having Raspberrypi
> > firmware built as a module while the rtc driver is built in
> > - Remove sysfs
> > - Add limits from firmware properties and check in rpi_rtc_set_charge_voltage
> >
> > V2 -> V3:
> > - Move platform check to firmware and abort before registering
> > a platform device if on another platform
> > - Add a dependency on the Raspberry Pi firmware to Kconfig
> > - Check return value of devm_device_init_wakeup
> > - Fix property name
> >
> > V1 -> V2:
> > Instead of the original driver, which was directly bound to the device tree.
> > This driver is bound to the Raspberry Pi firmware device by creating
> > a child device in the firmware driver probe function.
> > The child device is then bound to this driver,
> > which uses the firmware mailbox to access the RTC.
> >
> > A couple of minor changes have been made to the driver since it was originally written, including:
> > - Checking if the model is a Raspberry Pi 5, as the RTC is only present on that model.
> > - Using the new devm_rpi_firmware_get() and devm_init_wakeup() helper to get the firmware device and avoid leaking memory.
> > - Using millivolts instead of microvolts for the trickle charge voltage, to match the RTC standard.
> > - Instead of setting the trickle charge voltage to 0 to disable trickle charging, the property is now optional. If the property is not present, trickle charging is disabled, per the RTC standard.
> > - Renaming the driver dt match compatible to "raspberrypi,firmware-rtc" to match the other firmware bindings.
> > - Renaming the driver name to "raspberrypi-rtc" to match the other firmware drivers.
> >
> >   drivers/firmware/raspberrypi.c             |  24 ++
> >   drivers/rtc/Kconfig                        |  12 +
> >   drivers/rtc/Makefile                       |   1 +
> >   drivers/rtc/rtc-raspberrypi.c              | 276 +++++++++++++++++++++
> >   include/soc/bcm2835/raspberrypi-firmware.h |   2 +
> >   5 files changed, 315 insertions(+)
> >   create mode 100644 drivers/rtc/rtc-raspberrypi.c
> >
> > diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> > index 0aa322e9a2e7..f8c83c25eccc 100644
> > --- a/drivers/firmware/raspberrypi.c
> > +++ b/drivers/firmware/raspberrypi.c
> > @@ -24,6 +24,7 @@
> >
> >   static struct platform_device *rpi_hwmon;
> >   static struct platform_device *rpi_clk;
> > +static struct platform_device *rpi_rtc;
> >
> >   struct rpi_firmware {
> >       struct mbox_client cl;
> > @@ -231,6 +232,26 @@ static void rpi_register_clk_driver(struct device *dev)
> >                                               -1, NULL, 0);
> >   }
> >
> > +static void rpi_register_rtc_driver(struct device *dev)
> > +{
> > +     struct device_node *firmware;
> > +
> > +     // Check if our model of Raspberry Pi board is from the 5th gen
> > +     // as the RTC is only present on that model.
> > +     if (!of_machine_is_compatible("brcm,bcm2712"))
> > +             return;
> > +
> > +     firmware = of_get_compatible_child(dev->of_node,
> > +                                        "raspberrypi,firmware-rtc");
> > +     if (firmware) {
> > +             of_node_put(firmware);
> > +             return;
> > +     }
> > +
> > +     rpi_rtc = platform_device_register_data(dev, "raspberrypi-rtc",
> > +                                             -1, NULL, 0);
> > +}
> > +
> >   unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
> >   {
> >       struct rpi_firmware_clk_rate_request msg =
> > @@ -305,6 +326,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
> >       rpi_firmware_print_firmware_revision(fw);
> >       rpi_register_hwmon_driver(dev, fw);
> >       rpi_register_clk_driver(dev);
> > +     rpi_register_rtc_driver(dev);
> >
> >       return 0;
> >   }
> > @@ -327,6 +349,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
> >       rpi_hwmon = NULL;
> >       platform_device_unregister(rpi_clk);
> >       rpi_clk = NULL;
> > +     platform_device_unregister(rpi_rtc);
> > +     rpi_rtc = NULL;
> >
> >       rpi_firmware_put(fw);
> >   }
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 05b9233b9418..6dae4c069be2 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -1999,6 +1999,18 @@ config RTC_DRV_R7301
> >          This driver can also be built as a module. If so, the module
> >          will be called rtc-r7301.
> >
> > +config RTC_DRV_RPI
> > +     tristate "Raspberry Pi RTC"
> > +     depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> > +     depends on ARCH_BRCMSTB || COMPILE_TEST
> > +     default ARCH_BRCMSTB
> > +     help
> > +             If you say yes here you get support for the RTC found on
> > +             Raspberry Pi devices.
> > +
> > +             This driver can also be built as a module. If so, the module
> > +             will be called rtc-raspberrypi.
> Sorry for my misleading wording. I meant in this case 1 tab and align
> the rest with spaces just like the other.
> ...
> > diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> > index 975bef529854..e13994d8281c 100644
> > --- a/include/soc/bcm2835/raspberrypi-firmware.h
> > +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> > @@ -75,6 +75,8 @@ enum rpi_firmware_property_tag {
> >       RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
> >       RPI_FIRMWARE_GET_CLOCK_MEASURED =                     0x00030047,
> >       RPI_FIRMWARE_NOTIFY_REBOOT =                          0x00030048,
> > +     RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
> > +     RPI_FIRMWARE_SET_RTC_REG =                            0x00038087,
> Please try to keep the value order. I know it's already messed up,
> Gregor Herburger send a patch which already address the existing order
> ("firmware: raspberrypi: reorder rpi_firmware_property_tag enum").
>
> Best regards
> >       RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
> >       RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
> >       RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
>
