Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7097241A791
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160446; cv=pass; b=cxtqo6lS2DbpcBAGmlKej0nIZWepz7x8V6H6awTGp0uCXK75aqFnXDuLSCyGP2YxlQa6s3kGPVSfbsDDufEp6daz90dBC6/YSrW0iGroMU4FB8B/LvANadRdmVpIS4X+EMCyyAzB+THDE1CEeC0Nb2IPnnNtrOz9sgLswpg4lrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160446; c=relaxed/simple;
	bh=fQJyxDv643pqDMxn0ByaDWbHqZIiq7Rg1W4GA2fAA2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uda1la21B5SLMBQbYcSyfoR20A9Ge08cJ/RhjlhjR3/tCkdHAU90lTElDKA6U78gGHjbJ1gVXBNOVQduyEL/59pxVNkiY6PQOAsq+JzmLfoT9cnIidcvqFLx1zFOIhRDUmoDV+QKJwGGiyvACFQcba6tClO3YWdsmr55VkdsFDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=CPP6ZbNg; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="CPP6ZbNg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso20432655e9.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785160443; cv=none;
        d=google.com; s=arc-20260327;
        b=lHNhPIGyzI4YXW7qYLH4AwTmF4pRl1S9k/Q6GkmkozAkdXmd9ciqsHCpM+7/PRvaos
         NSiOxobCT/vBl/Lbug4AYxZTRKywvLrmKnr0P5B8eHv/1+tEOFSGjlKOQywuwTHIN9WV
         7nDuFwt2GcL5WTZGk1dJb9mT6s+ls6yV3qwgirinsIweaz9D44MGwps93FbAGdNFZRJ6
         0CE/sukFkoUn2AlCgTnJsruThnoGZtzUrOtalEttJ9TjT/JoFUlgEPjCIJXNZ3v4C+KI
         cRkqwjU7CblgPS4Y9GwdcmTC3IOTrjFimCQzsZ8htTtXKXKZ+8wn76ESa/ueXdqrt+rW
         I0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LkTARaNCDvTrxIcriRua7Id7ovFdqPl8CcOFZ930Vas=;
        fh=QW64oKRIftlFqgrpIJSSKBnkm0cIzGGuh9Tiwjy00c0=;
        b=Dtq1ErAR2wjx88BRXncPgSab/KAbQglYFZk+5VT8DwtR6/+r5JPkj72/hXpe8dSSEb
         8t9KyhIV+aviEeJ7jzan6FYXxEIwlHSB27NK6ACR/qpxXRefb7DjUkg8Ee+7NdSXCNlh
         6B71EmEkll9zVnxpsiBdRQyZUz85RwwHPQKDjoYBQjFcz1/z9RWWzN1DNNToM9uv7fat
         5bxoy7q6ENesWRyrpYyDGoN9STECqL/WCMZUpiffyaVUnjXsARHvK6HR21WZmYs4xaoy
         qQb8pXwTCJ+n55Tq2R3Jk4so0oywCBjbZDk7lHyPr962DssNqUgDk0hynuzJEET1Rkki
         oXDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785160443; x=1785765243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkTARaNCDvTrxIcriRua7Id7ovFdqPl8CcOFZ930Vas=;
        b=CPP6ZbNg6HDlf1OkpPivvEKY+RXI7VgWumYaxtrQrajy5k9EvuixeX9E91Ay7RsOAt
         ewpJq5nGCpUp1oCpEtMI7UDS3+g/zILvyeui24WHpxW1Z3q/x4POy/Kmu4glTINbMzBx
         n0eQbmP9cPrVH2xzKXRlYSC+6R517ZLZQqQ9ZCLjyB6IlWEDq5TKaXC4SNLOT6KIJbo2
         g3erZ7a06GX24K2zEFeLv9z6lpKacD6wx4GgE2XcgJlk7NTPAEftLJ0y3/zgSQtUni6U
         4hLK5iLqB1N/4JrDJOZNglLVmdsW9Ks66Qa/cgnAyNjGbq0nySjDSMQal4rD+XFCY8Lz
         nR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160443; x=1785765243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkTARaNCDvTrxIcriRua7Id7ovFdqPl8CcOFZ930Vas=;
        b=kc8vM4DbjL8zNB+HiJ5hHsa3JMICRnrJr+IFjP5EUuDQCLSDcj3b/G8aBjSOOfuQVO
         8/HMk4XgvXY9VPzxqJVjzSGdkLAr3dv3N60DK2O1Ejtxuy0ETNUWLGzVE7rFSBSrdC+2
         GSsKzAEznNwyLdb25iPrhZKhnMC/tb8j/wS6OjchnaYozqfAg8jVKAIzw/RuoyXiMDjo
         kY4oJh70IZnNzXn7lVxKBkmcDcAtkZSOP4dvabQrCtQxauG1sTltjaOopn2I22g3uC1G
         xoX6191Io05mTLvXgUWvgUdLHyyWgC0XuVSlWQVv/46uSO6++cExnmWx4ssrSyK/eofu
         ggOg==
X-Forwarded-Encrypted: i=1; AHgh+RqvlCfpd/0Px5JzaOJnIoZUX0JPij+aV766YHsASpKpUNkOz0AMYKGscRKY1Rx9DR9JShZHkZeAh9Ed@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69UyP6wNM/yeZvjMVubJurB1eO+WsKIBJ/iznAI2NPXTjiBqo
	wTyzuShhwaS6dsbdFjAXz1wRJqSZE+iiw6T92ITbr2aMg+h4V8Hlo4IpQXM0PEAvG/jVGvASh3b
	kkcYYxkDylTOQO5oAYes0BME7XjoqQmEoGJwzTZx1lP2JKTNvXpHHWIgqXg==
X-Gm-Gg: AR+sD132ql9wc+mv8P0ar3lkDiw8mg6GSFUb7BtHXjChS1KmZaradd+Xk3Ev3i99kyF
	Q2PzordEFHYX7z4mBrp0//6zDdOpgPVEF+WIKXqiwA+jVr7yNA9oFs8WdWIsq8+4gVMwV1Orkcj
	U39HmHvR2NAWM8JXpXOvh5FJ7ZXpXYY8UHOLOKQ3vyQUOS3oTaujkweACP1fbxhjLX4LgGP7cGp
	ySdUj/EjNSjQpgvECqlKYqJAfkr9D5LtGqfEeIybh+yM1cOTC2JDSKu5o7quPXKQFBndg3DPpnC
	aKxec8myU8z3FZQBtZ1PWnwSVQlVNzvRsngdk65PtYn2+hTHgfqhoEnd8V9NbgS2AdsRWzBrldM
	LghiM
X-Received: by 2002:a05:600c:a12:b0:493:eccb:8cb2 with SMTP id
 5b1f17b1804b1-496b57297b8mr114877045e9.30.1785160442437; Mon, 27 Jul 2026
 06:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727084003.1951324-1-anup.patel@oss.qualcomm.com> <71fd5b46-4388-4106-aee9-b4510069975f@arm.com>
In-Reply-To: <71fd5b46-4388-4106-aee9-b4510069975f@arm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Jul 2026 19:23:50 +0530
X-Gm-Features: AUfX_my4QjrER3hRFjzxXael861bKnyaiQylY-XLFhSCxIc_XNnqTG1sq5MogY4
Message-ID: <CAAhSdy2cDHO2w8VX34WV1kBxHQ6N0H0Ra_r6aDKK86250nWFSA@mail.gmail.com>
Subject: Re: [PATCH v2] driver core: platform: Setup device MSI domain just
 before driver probe
To: Robin Murphy <robin.murphy@arm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Saket Dumbre <saket.dumbre@intel.com>, Rahul Pathak <rahul@summations.net>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, iommu@lists.linux.dev, 
	acpica-devel@lists.linux.dev, Sunil V L <sunilvl@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 5:46=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 27/07/2026 9:40 am, Anup Patel wrote:
> > On RISC-V, the MSI controller (aka RISC-V IMSIC) is probed as a regular
> > platform device and MSI client drivers are always probed after the MSI
> > controller driver using fw_devlink. Unfortunately, this is not sufficie=
nt
> > to ensure device MSI domain is set for MSI client devices before driver
> > probe because OF framework sets device MSI domain at the time of platfo=
rm
> > device creation whereas ACPI framework expects arch specific code to se=
t
> > the device MSI domain at the time of platform device creation.
> >
> > Currently, to address the problem of device MSI domain being not set
> > correctly, various RISC-V MSI client drivers explicitly set device
> > MSI domain in the driver probe function using below code pattern:
> >
> >       /*
> >        * The device MSI domain for platform devices on RISC-V architect=
ure
> >        * is only available after the MSI controller driver is probed so=
,
> >        * explicitly configure here.
> >        */
> >       if (!dev_get_msi_domain(dev)) {
> >               /*
> >                * The device MSI domain for OF devices is only set at th=
e
> >                * time of populating/creating OF device. If the device M=
SI
> >                * domain is discovered later after the OF device is crea=
ted
> >                * then we need to set it explicitly before using any pla=
tform
> >                * MSI functions.
> >                */
> >               if (is_of_node(fwnode)) {
> >                       of_msi_configure(dev, dev_of_node(dev));
> >               } else if (is_acpi_device_node(fwnode)) {
> >                       struct irq_domain *msi_domain;
> >                       msi_domain =3D irq_find_matching_fwnode(imsic_acp=
i_get_fwnode(dev),
> >                                                             DOMAIN_BUS_=
PLATFORM_MSI);
> >                       dev_set_msi_domain(dev, msi_domain);
> >               }
> >
> >               if (!dev_get_msi_domain(dev))
> >                       return -EPROBE_DEFER;
>
> I stand by my previous comment that relying on ACPI initcall order and
> assuming fw_devlink is enabled doesn't really seem robust enough to
> justify dropping proper handling of this case, especially if pretending
> it's a generic interface.

I think you still fail to understand the root-cause of the msi_domain not
being set correctly in the struct device. There is no issue with the probe
order (or probe deferral) rather the issue is msi_domain being set very
early by OF / ACPI framework at the time of device creation when there
is no MSI domain registered.

Let's take the case of OF based platform devices with RISC-V:

1) The OF framework set the msi_domain at the time of platform
    device creation but unfortunately the RISC-V MSI controller
    driver is also a platform device (aka RISC-V IMSIC driver) which
    is probed much latter hence the msi_domain for all OF platform
    devices is set to NULL.
    (Refer call path,  of_platform_device_create_pdata() ->
of_msi_configure() -> dev_set_msi_domain()

2) The fw_devlink based probe ordering in the Linux DD framework
    ensures that RISC-V MSI controller driver is probed before the
    MSI client drivers (such as RISC-V APLIC MSI driver, RISC-V
    system MSI driver, etc) but still when these MSI client drivers
    are probed the msi_domain remains NULL for the platform device
    of MSI client.

3) Due to #1 and #2 above, the MSI client driver have to explicitlly
    call of_msi_configure() on RISC-V because no one updates the
    msi_domain of all platform devices after RISC-V MSI controller
    registers a MSI irqdomain.

This patch eliminates the #3 above by calling of_msi_configure()
right before probing the OF platform device.

Regards,
Anup
