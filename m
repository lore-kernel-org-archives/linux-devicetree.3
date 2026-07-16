Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9333D647C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240745; cv=none; b=LAcguuPLNaQp6Nu0+lScZazEeW3tkUv+kx7VZnTihxfoG4dTvgSwVAJRQDyqi29PDeoIW7WR1tY0D6FdZO91lFokkFmzixTAWUc9GVFnvskA/l5UfUef0heG4B7hudZd8T57fTa27GgSJooemYEZHrKz31zha+fBtGuIniqJjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240745; c=relaxed/simple;
	bh=HYT89RawmmfsAb7e1+1QSfqswIp/WGL73lEA1fxR5Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avKGYliFRl0Gn128ovtvSHFdp6AR40Y8C136BOyYmlcCboZX2NbK5mM1LJTiLAm5jlEY5zbUw90Sz5+++o+tJJosQmJ2uYuBkftacqvuDAZ29ql0djYeJtKhN5AZCPASMA2W0wvCW46T1tqOjopFRWxa9/khIDqdujw1kg6XOO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1DvQPBE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1DvQPBE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc6dd436c6so47573805ad.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240743; x=1784845543; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWloTcZIy9sIdRlodwyddcufvKR4RH37/mjop1hr3+I=;
        b=L1DvQPBE7dQy/cw8z+uxTp/+C48FAtNxVtY+4XjhksmovLIw4aypZARva9OeQV1Gf8
         6d9NHUFhb4bEd4TTbAsu0lzXFnTVSVm+/kEsQgF9eZw37Xyu5AgFLs879RRLnWGUEAgE
         Jim7tHoUfmpnNSdaxdFOK6mJ3aH0YPliWAP9ZxOWl0oxDP/T2w5YiIyitGAY10slfMlb
         DzMLKB6S0SpIKDXhnun3tQYqg3qNr4GYC36/crdq1g45VVL3UGgkUW8/pLP32DuJXj3U
         +IpMsleDN//intDoKGcEFFLnAQsuprIxjsxVw1DvfNJgTaYV/Ad49e4hutZHRHQ5q1LE
         6kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240743; x=1784845543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UWloTcZIy9sIdRlodwyddcufvKR4RH37/mjop1hr3+I=;
        b=Xl3TiBk3CpwygOJS8k7Tg/9cZU0/SYZObNuqZtiqtGAvRFtguYOxJwFon8btwAtiAe
         Wc+S2K0rTF4wePemFyjKsz5+HYIzSnjvka02umJhUcm0LhmLLDRBti6sbo9TfYsfNK9L
         97wJSVZaCO4aGgVP5QAsvGp/zfiSzg0qKG2qoKK6KXSmOYPYtJI8UhjGs+Md2OCo49Fj
         WUWy/K94dIvCMH4hfGjrqDGW3OhH32Ueq2vOuKeVtDvGvWlFbDMiuYllgm4cOk1lS2LY
         3w8AbvEgu6Rztzp689ILHs+gQ0p2vVxblpj6c9GugrgyoRz/XEU2v9zOAUVcD0Fz3QO7
         QDGA==
X-Forwarded-Encrypted: i=1; AHgh+Rol9dOsM53Pqnq60f+2SeS3s7lo1t4PDXbqHCeiA3GrysE6BRxX5tyyx65nvKbGmplKKh24Vuj9ADLL@vger.kernel.org
X-Gm-Message-State: AOJu0YyXVQ61fLZ6HeOOftoZP3qdAO07Ipl6NKnnGSd6/VjG9bJDUubC
	1LRrH5KlHW7Etj1j5XAcvcQ1CcxI4UH1LeiPOTQz1RP7HoP27pgseHYr
X-Gm-Gg: AfdE7clNRDOhvVUnJjjQNpSK3nVeLfeo6t0gSsOUgHga6xNwasYDGh3JKjTEOvihUK4
	zo0mZC5mgHcYRD70F4LhoCSnSGBO+XPpVDoj8GrzL5+O+mJT7Yvz9V+2w8/sKm7F3ciAScMidvA
	yXh24GuKHEScQMWG4XGIiqzyS2Vd+8mni7PQoRXiY287h/oBFahbY313PfUigZ+NkOf+fhRHr3E
	K2wUxIkj+YXD04dWbytbAOcE8vtugJNLWi5SAZWRch4EtVEcpz2TKqyiXryfaxVGnfy9TPitJMG
	qF1Ub1oGfRgPBhDXtEfcymB1AK4ezOY2sMQvNH7KhcqblcELzklko3+F4pYk4cQ7aqqLX9O8STm
	i2IjlIHLvFw3gl75/vkVqW2FC90qegnpFToSw+aZSqq76eigPvHbLrQ==
X-Received: by 2002:a05:6a20:2446:b0:3c3:9eca:aee0 with SMTP id adf61e73a8af0-3c3a5d428a4mr1081625637.48.1784240743152;
        Thu, 16 Jul 2026 15:25:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd403a7f7sm13722999c88.0.2026.07.16.15.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:25:42 -0700 (PDT)
Date: Fri, 17 Jul 2026 06:24:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Message-ID: <allaAnK4nfRSkacc@inochi.infowork>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
 <alRmA-X4xbQ9zPFn@inochi.infowork>
 <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>

On Mon, Jul 13, 2026 at 10:04:09AM -0500, Anirudh Srinivasan wrote:
> Hi Inochi,
> 
> On Sun, Jul 12, 2026 at 11:19 PM Inochi Amaoto <inochiama@gmail.com> wrote:
> >
> > On Sun, Jul 12, 2026 at 11:13:07PM -0500, Anirudh Srinivasan wrote:
> > > Hi Inochi,
> > >
> > > On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> > > > Add all PCIe device node for Spacemit K3.
> > > >
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
> > > >  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
> > > >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
> > > >  3 files changed, 266 insertions(+)
> > > >
> > >
> > > I see some warnings printed during probe
> > >
> > > [   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=-22
> > >
> > > [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
> > >
> >
> > This is an expected error because the driver does not support INTx
> > but the hardware claims it supports. Since the vendor does not want
> > to support it, so there is no way for the upstreamer to add this.
> 
> Are you saying that the hardware advertises support for INTx, but
> spacemit hasn't provided a driver that uses it?
> 
> Is there a way to let the driver know to not try setting up legacy
> interrupts then? It seems like it's trying to do that now, and failing
> to find interrupts node in the DT.
> 

IIRC it is hard to do this, this is more like a quirk for the spacemit
PCIe controllers.

Regards,
Inochi

> >
> > > I see that all the 3 rc nodes are missing an interrupts node and an
> > > interrupt parent (saplic). The vendor DT seems to have this. Not sure if
> > > this is related.
> > >
> > > The 10G ethernet probes fine, but the wifi card fails to probe. Seems
> > > like the card is trying to request 32 bit DMA addresses and we're
> > > failing cause we have 64 bit memory only.
> > > The vendor kernel seems to have a patch to enable 36 bit DMA in
> > > the rtw89 driver. That'll probably fix this.
> > >
> >
> > This warning is also found on my test, it is not related to
> > the PCIe driver, but a lack of the RTL phy driver. :(
> >
> > You may also noticed a bad performance on this 10G ethernet,
> > it is caused by the single queue used by the RTL driver.
> > IIRC, even 9800 X3D can not achieve the max speed.
> 
> I don't have the ability to test the 10G NIC unfortunately :(
> 
> Regards
> Anirudh Srinivasan
> 
> >
> > Regards,
> > Inochi
> >
