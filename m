Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED9123C4F3
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113662; cv=pass; b=sp0x+slmdFBm43cmB1FDCPii7ajjdVQZbj4IOlRDwokQ6BgxsI/IwigjBXBbl6lNYuHVJtiFcRT4gZGRGpFXMyKfzQmAGZLUFddZLErN0onL+96MDrxC/FLro4xZfaiBrP/ahOZZhjGzQMBm5hEnRXSuD3rhZ/RkEJXTAgrxDcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113662; c=relaxed/simple;
	bh=5qDpVkMt4wmJAuvajXr0K3vaIjTuOXwvJrhqj7SsGUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SiP0gwAz1s3StvXtWIDxwN7w7TlCoNP4di9nDb29AOsboHXIOepjeufUfQbC68BczsF3NiFS7xFn2y/gU6DOGswxSLh8RO72zYY2Xtt8iBDn3MvLvxbmaXjxEscFdxwuYRJhOY856DD9UlIhtSxcVTGQio/LFAN51pzNDAnlQO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i6QG2BYX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEfglShx; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i6QG2BYX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEfglShx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779113659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
	b=i6QG2BYXKj09OPLAk3GnVux+ExBCGks4czXI+zrCTICAPPNl2O0GRZoetW2lsWe1GbKU22
	mNLmFVMYvIHF2V+npB/e9qzhiIwtWg1lc5glBOfZcGFPuA0NXx4b/Ihz98rozgvRA/oGlZ
	sMnPNWSKRjoHp5sS+I5mCSZ8eMj/log=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-SaBVOYefNSGxsPlrNeIdZg-1; Mon, 18 May 2026 10:14:18 -0400
X-MC-Unique: SaBVOYefNSGxsPlrNeIdZg-1
X-Mimecast-MFC-AGG-ID: SaBVOYefNSGxsPlrNeIdZg_1779113657
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5a870f93c99so207039e87.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779113656; cv=none;
        d=google.com; s=arc-20240605;
        b=GESRSy1bDsh+L9My95BCJGQtModFuAyVltQkId16Ndbhqv+RhXW3d+oUoKlcEF14p+
         cSM9n9rbuMSy5H93MaSveGC1cVCLvx1+17ewEB7yVbxunVav7rcqc5jF41D4JzZUuYLE
         k4rRdqiNSNtgqQPMvPbXL1DPUmpPObVNUnKuW8ZYIqSeFe0g53MmGWaArkfVEZFmZGPe
         woVrd7w6jS/urP27V5gbH+liMjDMBqhsRWZmQO88Wjf/YJjsgvuQic7Jwt3y4sxZstW1
         8OL9CDt7lMyRPa/NScODQV+oTU7On1WOOxIBioWIBsaZXiOCwepVvfWPSvGdsw+zfGDq
         RjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
        fh=xvfpVrfA3YivsCqF6UhwE1x16Rv8WiMMWpolqBHjmrk=;
        b=JtiQW2WqZ4eOkpWNImJuECkFyepiCjki2Dk8vjiQzGDzKLGKoCMpbaYJX9JbGJtgdi
         hwHX5Jv6EKpR3sR5VFTzLZhVKOrCN6R8D0MX2Q+s1JDr0qJknKLL7/5LYaQ84vctacHm
         +wvYw8dzITwC4p4TD883zqTPK8U5gAqxylPDOGrTNzc9mBCNeFMH0kgAmMH+lBM6uv3t
         ABu/0/kkekyIMrDgLv5/gpckn+CC8E+VTnD9FeQcpl9v1UMr7EjwBe4RcLnF4KBIjSNH
         kfA4FvL1urjGSDP2O7cm1zOxnf4o592Ay/fc1MOv13RgxUGAt36/VqgB+FVEWn3Qbacf
         nvNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779113656; x=1779718456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
        b=JEfglShxs5yibxIFv6/U19ifYzbXJu1Yd2BQV36kyFt/CBsUG/2wuOTz0C/h8TWSWq
         lA0JN50rELueXLBK637lK56wBfhJdeUjk1j7moM/16fwAyLRRA8pSdFo05VrBaCJpeLD
         7BvNvjhkng11lJG06TgZ/Me/vyBwOAzoOv6vwANalpyj8HxxuWEytpuFKpTQ3xDuaaYf
         EhXQlXNXGhicpWhlEDCZ74YpPN0qfsHPJU65rGjsrwiNllM+sn6q4I2FJb8DnL5QhMWK
         fQakRPvS/mTuCD31oXyalhIEHgFcNYm7JAhiDIxBt0dWS1nmfYpRANM02nVGFn0jDOgB
         gRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113656; x=1779718456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
        b=RLd69d0mwZcqT6nTsKtS/Hz9rRuOsCfU8YcKYeLPEJGTYntJhBGP20aiBW9CzQ6wA/
         NgkFFj+kpMDA6vgdnla+o0DgxMx/JKJaerl8DkKEg8XUPWZaG3CkXmbZdECIQCivaVUM
         wsTnOR1f4mln1uzPpJjzfjaDDGX6A0mGxiTq301UZBtBeOjoGvFgYUbySIburx6Ulyeu
         huIhhYNf5tdB4XJANI61kJmA9gu/dL3AP4W4a1IYWHpRjMvX7yVtV0uZW+23ghjFSuEU
         xtenoq9y7k87+mt4PQTghBYIIsg2kJ71FPqy7YHyVleIgxs+vvgpys3UelAtToIx4HgP
         twoA==
X-Forwarded-Encrypted: i=1; AFNElJ/wT2NMMdpZUKghOlLxEnPuocgJ/7xXwtiiK/IrPBibm050+hmM5qW07ajlZoczxqHq/UdbFcYCSttY@vger.kernel.org
X-Gm-Message-State: AOJu0YwQhFRS8nQuSd/vUGNalGEwRfsznOoL01u0BV9P1/2WFsNmBHWE
	KNrO781C3q99Fs2HdmAZSiu9cDdbntp9g6WseX9RvoozMVgw10OurHLwjLQj+Fn6qPX+cpm+7Dr
	BPyecSW/xEfkVQZloZD0LVPyB5T1j+7Hhit/YTbg/EVk4WGEFoT2U1hOpunzVHiwc0K/GPp7kkQ
	s2yYxBiAw5MEs4mIQlTWe1j5ogZbDDbFfgHTDbtQ==
X-Gm-Gg: Acq92OGx6i3vzH+qSqhmyRaPK5bqt7sYzbdC0cbT68J4p4YJSSVOeRcP4gp3l0QOxDW
	GxHzbJtHGivQlT/aPBtXrej4hWkv3NmOjlKA7Bqq2u2O970dw+LJBNhsZ7Iw/I/VXMu82+NICXS
	0n7GmC3c+1npP4qj5kNee4Y52VJiq1deEfTDBeREzhH0OQOh3n8s/oulCtmSh5iEk5QHjeoi0oo
	c3nLQ==
X-Received: by 2002:a05:651c:410e:b0:38f:f6a2:a61d with SMTP id 38308e7fff4ca-39561f2f883mr11802461fa.4.1779113656340;
        Mon, 18 May 2026 07:14:16 -0700 (PDT)
X-Received: by 2002:a05:651c:410e:b0:38f:f6a2:a61d with SMTP id
 38308e7fff4ca-39561f2f883mr11802281fa.4.1779113655655; Mon, 18 May 2026
 07:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com> <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
In-Reply-To: <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 18 May 2026 16:14:02 +0200
X-Gm-Features: AVHnY4JRP0kGP-z42K5FI0qcb3gAysvgY6dzw7kUR8X3jOVZKVkXLna2nVCi7XY
Message-ID: <CALE0LRuahJy2EKa7YUukGRq1w9iws6kDvjZ7o33ahJUGc2JSsw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Add DMA support for LINFlexD UART driver
To: Jared Kangas <jkangas@redhat.com>
Cc: Larisa Grigore <larisa.grigore@oss.nxp.com>, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com, 
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, s32@nxp.com, 
	imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Any chance these series can be considered? They still apply on top of
the mainline kernel.

On Fri, Feb 27, 2026 at 3:03=E2=80=AFPM Jared Kangas <jkangas@redhat.com> w=
rote:
>
> Hi Larisa,
>
> On Mon, Feb 16, 2026 at 04:01:52PM +0100, Larisa Grigore wrote:
> > This patchset enhances the LINFlexD UART driver and its device tree bin=
dings to
> > support DMA transfers, configurable clock inputs, dynamic baudrate chan=
ges, and
> > termios features. It also includes a series of fixes and improvements t=
o ensure
> > reliable operation across various modes and configurations.
> >
> > The changes added can be summarized as follows:
> > 1. Fixes with respect to FIFO handling, locking, interrupt related regi=
sters and
> > INITM mode transition.
>
> Tested this series with the default devicetree configuration by booting
> the board to a login prompt about 200 times. Without the series applied,
> I was seeing a bug roughly every 30-50 boots where the kernel would
> would hang in linflex_console_putchar() waiting for DTFTFF. In my tests
> with the series applied, I didn't see any regressions and the bug no
> longer appeared. Thanks for the fix!
>
> Tested-by: Jared Kangas <jkangas@redhat.com> # S32G3, interrupt-driven
>

FWIW I also reproduced the issue Jared faced. Current state of the
LinFLEX serial driver in mainline seems a bit buggy and I can confirm
that these fix the problem.

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

> > 2. Removal of the earlycon workaround, as proper FIFO handling and INIT=
M
> > transitions now ensure stable behavior.
> > 3. Support for configurable stop bits and dynamic baudrate changes base=
d on
> > clock inputs and termios settings.
> > 4. Optional DMA support for RX and TX paths, preventing character loss =
during
> > high-throughput operations like copy-paste. Cyclic DMA is used for RX t=
o avoid
> > gaps between transactions.
> >
> > Larisa Grigore (8):
> >   serial: linflexuart: Clean SLEEP bit in LINCR1 after suspend
> >   serial: linflexuart: Check FIFO full before writing
> >   serial: linflexuart: Correctly clear UARTSR in buffer mode
> >   serial: linflexuart: Update RXEN/TXEN outside INITM mode
> >   serial: linflexuart: Ensure FIFO is empty when entering INITM
> >   serial: linflexuart: Revert earlycon workaround
> >   serial: linflexuart: Add support for configurable stop bits
> >   serial: linflexuart: Add DMA support
> >
> > Radu Pirea (5):
> >   serial: linflexuart: Fix locking in set_termios
> >   dt-bindings: serial: fsl-linflexuart: add clock input properties
> >   dt-bindings: serial: fsl-linflexuart: add dma properties
> >   serial: linflexuart: Add support for changing baudrate
> >   serial: linflexuart: Avoid stopping DMA during receive operations
> >
> >  .../bindings/serial/fsl,s32-linflexuart.yaml  |  31 +
> >  drivers/tty/serial/fsl_linflexuart.c          | 972 +++++++++++++++---
> >  2 files changed, 846 insertions(+), 157 deletions(-)
> >
> > --
> > 2.47.0
> >
>

