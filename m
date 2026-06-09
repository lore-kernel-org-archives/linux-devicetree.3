Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD7425CF9
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012928; cv=pass; b=Cx4UHIPkEqVf8ECiUzEO6Goznll9QKB78QaRy5hdD0v1+SBYTOTZXQOOZArqEntcemx6LxVUY2PfKoXt8ul64M0tQdRbE9s0ohJCMjDFTSqHbN60AhiIkx+zDxVdsCcxwRl6CSFtOIezM1UemhPmgBz9eYRnAy0erM7Z+oZ/Vls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012928; c=relaxed/simple;
	bh=fCYirjuwrDR66B9tbkORA630qnGzVI5sfSpUkGX5FM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pIgzKWhAjw4tiIHnMn2IDfHCZ4JDdLo+jjW8MX4MRbJGmWHleLm2taKV3sjTcIt9YIz/wZ1BnvKHKhmcPInZazeP9GxPWcKHp3MfhiiHV7Ym9TNdK10DmKvanWRUuGehoAHS8frzA62ozYKfqzV6qOFrE/NgKk/SRSXzrREBslQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBrb0qld; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q96/HNmi; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBrb0qld";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q96/HNmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781012925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=;
	b=IBrb0qldEJTwDhLZNbMahlSumZlhTDlq8edkGSSb4T1h5kJA+7ccWH72iuImHWFzDmuXOt
	aHWsR5q/dJYK7guUEK/roustkNUQAe13l7gFjlL23h6qcMAbIqSgvRfwucI3v9qd0oOfFx
	S0kNTikmRRSvspn8rgWEhUPMUvNyQCc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-cenblqI-NnmZK35YVwaHzA-1; Tue, 09 Jun 2026 09:48:38 -0400
X-MC-Unique: cenblqI-NnmZK35YVwaHzA-1
X-Mimecast-MFC-AGG-ID: cenblqI-NnmZK35YVwaHzA_1781012917
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-396a8df57dbso3805541fa.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781012917; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/b3J54yA5GbKSIeaHs5mHLlGJVigfFuFq9f36ibHW5aA2dXuMhz/n1Cd0jI/ynoLB
         ibGINIlsPwJiTyGiAXS5nOWGMyb3PahA/r11+MXZ6ejr+LSaNKaWxTLa9xEhNteECgFE
         mSU4rydJ3TVdKZ2d01rbgy0srVUPoBOkoqGkkpS87RDDGHDbFB/6eMqMMvO3LTm+/5a4
         duEDlabaOc21U25Jid4HmfdlG6S8SVJDOsBG4tmRsK+1VVsJDq7BCaRgezX7YT6PS1dV
         hmhCkG/8AaE5prOrEspEWmdF3JdLVwz2KT0CMzSSOsEam0NMjThYwjWoTsCdXPxL2PMC
         6DGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=;
        fh=3C54ibw+6/WqkUg/3DyohhWuNzWpFvicjjpJMatWPHI=;
        b=B35aVyguWHsKzTRPbju++wNNNjJQZVx7WuQK58GlwAP7Mywld5SnxlcEvxIZfhAC3E
         n8+SH9oGfNJBmR9aN3Z8bIzL2NUJSM3i8TephCFgLN/DAMuMe4X1WfhaEvDyrHbpsmGd
         UwfmGy45VdxO58RISDBzoSBxmwHTFzbY/9mCXG4ynl7W34nbL9wxIy6magVdTYOsp5yI
         nGd2EdQxp3VGgBGqQ7b9Pe8N2g8UP2tx5GH7diG/lo9T3UyaEjdA+ePxgycn4pCSO04a
         RXdRgIzicvXtpoh65dKbqqUyQhEADzjzyE3rO1DDk8kIioealFFc2OYwIjWp7ZCI8je5
         hIHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781012917; x=1781617717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=;
        b=Q96/HNmifmuqBgw+xvOzsybbgQsbA0sz4T1YZigg0s27iBrgAGnuOlEa0yJ2gqYM9R
         sIv9AlYPgi8CV1HrvzRTq26/SIHcLvQXFLgfwYHpZW9hQu716eVkXb1Zwgbje+Rja5A3
         kkCDo7dtv6/mskURUVQfTRQKC/EuVizKhuGoJ2ka0LuPFKN2BuYfAnfE26Iyo13C1VVz
         K70Y2wm0qpXigdxp6WCHeTD2W4ei/MiVLdtKfEBGwUkjeB8mJEeuFXzP1eVyoqSLzWKZ
         6XMahIEF9dL+avwOMGegi2n+AedcL1HdewvE7ACd2g179UYiDXd06j8T4yxc5XST2Nmt
         Bc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012917; x=1781617717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=;
        b=hrAS5XSF7dwSyq7cK/mZDOF+nfEE+Ju3lL8YonOqBUQcf00Qalk8P/38A8enJQ7T7p
         fSZNbUxmpSv8eNjpvTK6FvwPOgz4bCfnZ2SEggWX2x9zxHVxc3H+Vffu1x2Do6Q/vh8X
         afu/JjQGMDhkxug6HCh6XKN0vG2Buwh/YXNppH9m3LHwxAYCkcVkqQWYR6e4yDe4snpZ
         PgTeUgnQQiJxevG5sEMuk9RB7mIfWvybd5NDf6p/Hh4piyHiII8HLa6o6ISeuA5hNAPy
         WEEfMSICsrY46nOeZ7m0rv362Kndq816ZGRnB44g7mVMIC7H64ckA9J3P+x9ALP+Vs86
         suwA==
X-Forwarded-Encrypted: i=1; AFNElJ/TCbwFrm5VW1BVPxomkAMqBX0dym1hurgvC+xs7LVBFHVdH9NIxo9/LbDchYXJGb099gndtIsK6Qx0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy03QJJF8WAwP5/g61XFlNsPhQ7kSMSyvKnf4625nqGTGKLgdEv
	kbA9pNYJmhuaACudOw93jZdWI0CxfDkH3rAO1dBV5hyl607w10nooCJPHs0TCxKn5xH6K95QFRr
	rXkfssNZiTUZxRWEtNNg6r3OTdYZvHZkQ9aFgwpQpsgeXQJsDCttReaiAsxKEUoV4H9RGKUxQ4e
	E4HmwvISTdXk+pPuxK/2BSa8Jp1MRxvzQpN9Rk2Q==
X-Gm-Gg: Acq92OGcy8JeFVlmRxzM3HUjCaOA7IdHueCUY1KxBOSQOwh/pjKf+R87CT3akmdTLIc
	qiALp/PsEPtvZtKNFqu02xk4QkOSuhEGFr0KZz86M3a1Jjo8lpC+ZpfymQgfeAY840g6Bu324R9
	f9NHGJTTWjPCBJY9LH+qS/ClyJE8OhjiUey7ksBC/Y/GsSSK7itT1S23EaKIDHcyAGag/PD5i+D
	EljubedATn4ZZaY
X-Received: by 2002:a2e:ad12:0:b0:396:8d4f:573d with SMTP id 38308e7fff4ca-396d0870a2fmr26107361fa.4.1781012916518;
        Tue, 09 Jun 2026 06:48:36 -0700 (PDT)
X-Received: by 2002:a2e:ad12:0:b0:396:8d4f:573d with SMTP id
 38308e7fff4ca-396d0870a2fmr26107251fa.4.1781012915884; Tue, 09 Jun 2026
 06:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 9 Jun 2026 15:48:24 +0200
X-Gm-Features: AVVi8CeBgvu_FxTeu_WpMekXBVDp5tn5JH9vmX9Kfgdgwq-5WsR-GNlc1P-phzU
Message-ID: <CALE0LRufn_ZRtscVxoZkHdNFdjWpyBeRkeongDRE8NGmPCskJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] add USB PHY node and USB OTG pinctrl support to
 S32G2/S32G3 SoCs
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 20, 2026 at 5:10=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
> - Add the usbphynop node for S32G SoC based boards
> - Add the usbotg pinctrl support for S32G SoC based boards
>
> v2 -> v1:
> - use hyphenated naming for USB OTG pin groups
> - replace deprecated 'fsl,usbphy' with 'phys'
> - move 'usbphynop' node to the SoC-level dtsi
>
> Khristine Andreea Barbulescu (1):
>   arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
>
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  7 ++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  7 ++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 46 ++++++++++++++++++-
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 46 ++++++++++++++++++-
>  4 files changed, 102 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>

I tested the bindings on my S32G-VNP-RDB3 board by connecting
different devices (mass storage, mouse and
keyboard) in host mode and got them working, so

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

[   32.957280] usbcore: registered new interface driver usbhid
[   32.957285] usbhid: USB HID core driver
[   39.683065] usb_phy_generic usbphynop: dummy supplies not allowed
for exclusive requests (id=3Dvbus)
[   39.945747] imx_usb 44064000.usb: No over current polarity defined
[   39.999412] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 7.01
[   39.999422] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[   39.999429] usb usb1: Product: EHCI Host Controller
[   39.999435] usb usb1: Manufacturer: Linux 7.1.0-rc4+ ehci_hcd
[   39.999440] usb usb1: SerialNumber: ci_hdrc.0
[   40.575296] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[   40.747558] usb 1-1: New USB device found, idVendor=3D0781,
idProduct=3D5567, bcdDevice=3D 1.00
[   40.747578] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   40.747585] usb 1-1: Product: Cruzer Blade
[   40.747591] usb 1-1: Manufacturer: SanDisk
[   40.747596] usb 1-1: SerialNumber: 4C530001310712110235

# cat /sys/kernel/debug/ulpi/ci_hdrc.0.ulpi/regs
Vendor ID Low                24
Vendor ID High               04
Product ID Low               09
Product ID High              00
Function Control             40
Interface Control            08
OTG Control                  27
USB Interrupt Enable Rising  1f
USB Interrupt Enable Falling 1f
USB Interrupt Status         04
USB Interrupt Latch          0c
Debug                        00
Scratch Register             00
Carkit Control               00
Carkit Interrupt Delay       00
Carkit Interrupt Enable      00
Carkit Interrupt Status      00
Carkit Interrupt Latch       00
Carkit Pulse Control         00
Transmit Positive Width      00
Transmit Negative Width      00
Receive Polarity Recovery    00

# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 0781:5567 SanDisk Corp. Cruzer Blade

Cheers,
  Enric

