Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9001A3AE706
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358215; cv=pass; b=mUjCC2zJPRnq3nyCW9zP5bp0Hp9xF3dmf+Wh8sXvXISfs+MrJol7N/ZQz0OAx/Rj7zhpuPXg785zoVtanYGBiFGfqNquOdxvAZFL9n6dfxtFykxfUoLg7Tjo31iPL02VXnqpRJCRZJ2teW1Cuq1gNZgI7AJmzIqr/POWnnH6ea8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358215; c=relaxed/simple;
	bh=EoJjq+T7VyGPNATN8SO5bqxvJfuZRwCFmI4lyyJXJ0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BF4L9YSL/STIFM6dve6STR/X+7tuXrQwg7BBo/mO+D95UGLYzBk19A7JnNYeZQYLFGeVn5xF51TFyF5r90Vp40tex+sJjseEVjU86kvmjkOT2I5ejtBNRi006TY5WY02Ly4aRaqFkFhUPfyghnKfsCOpT9KtYj7jYrgxgVBjcaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=WBYhzMr4; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="WBYhzMr4"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fd4531020so953650f8f.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786358212; cv=none;
        d=google.com; s=arc-20260327;
        b=mKG9XBH63PL2h+zEcJWcZXKrNgNeVkAdqMngViv7Y5t08eFdaKsW6fgZD+KMq7XzYI
         yBuGi1tq+xJYowDmoWbhd6pNy3hrR9dC1HjkZGjWXE+QJS1DmS6RSpgkHzZWCpt3k6gR
         0nY2tmieql9Qx9Inx6XsmN24RHNX1ALAQKJ6WLWL6Tc8XjHN55BQ3zdI4+O522urd8KQ
         ypL+Vr9Ztolb5XTlrewzd19HQf3pusxkeoX1taH4QT2n+0QtTCVJGiSYhoN/x+l2kycW
         TkbOx5naPYPfyiMMX7G2Pn3YZhlyweGQw+l+NgeD/cH7+1nuncL6kTwGRtxq87EaNX1R
         osyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        fh=KzTV1+QnpQyG9PBOhxwFSn0IXVZRiJY/q9l+wKhkuyE=;
        b=nqiVhekhBVROaPNYOVeZY+DwOIal3/4vBoItjKlIJ7SXrHM8nQpjfwq/XhDxH/fm0a
         j1Ti9PGg+sxcOiIr4s4UHNB17W7TfFBr8AsOn7GjXNrSlGrxnvcPv60FTGlDDL6McMor
         5aLQwTu6PGsbKF7Xh9fIIEWjIRa74hTAPq74g+mrLE3iBIJhA7Poh8/9NiNqwGFPGDEo
         +0lDJ8+PcigRXnDlpFYLZFcWNIFs5lzD+VSUjZiwo+2x9oU2vfdtzjdRU6uPb5NUXask
         xfRVTIpFKm3tgwAy05QbvTaTJj9cDcFDirhKq4bVXDehUwpXHS/pc/VWce0gtv/BsKeP
         rOhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786358212; x=1786963012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        b=WBYhzMr4Cf+6KEWTSh3811AVodQnmLtOhN/fXj7ACc5pC4j3KNdC9Q9nfSyO89paK+
         EVsFDZpuwLSzi/JjV4jcVkadqxYf3WrIFbAjE64nqj6Y9nWMt4OQGtPTXnXRn02e4BLg
         3JuXEXqorbjU6OrFdhbzOdSqfA2ncm4cSap0ij3kBHiE0ypSzPm4YX4LSS3OYj5AXTWe
         eE4bH54u7VqtNddKi8nmHBWHTvw6GRppBYdMI6sk97sb/Toqd4swPPvhMGvlNDbuWf2X
         x/dhcYQiPcm9g9pRlGFqnU2bqhx+b1a9qlj32VOZ/HDYfCXWwPkja55oQIMEqe3uDsgA
         0Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358212; x=1786963012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        b=W0EAxM8G7ulB8N2G+yvJ3INbq/rAiSUoovRCBnuz3TFbRnekpYkVzezyhm8KchnjGJ
         rnbmS24C/c2OlhEx+X2ZX2t9UECGLpP1Re9FQ/fZ0HXUQPEb0T4U2lhnSmJbhfmKguJ4
         8Bgonb39EQ2rEsOc0LrB3q3JPizWwLISkYsKh42I3NoUQPICBI8471DKC5pOjCmkK7jr
         9AtbcRZvycTkDkbYq36X4xPeTmKIWJ4U5h0CTfTVcbuugq0EEqmXN6O6YzDaBbPKecaN
         DnGzEs6g290wqtt70ICi2fH9O5TBvorIiBvAz15k+xaoQur+YTrMkVc3A/kPx8nKhLSg
         hetg==
X-Forwarded-Encrypted: i=1; AHgh+RrEt7OTFfT8O6huRPTCQ4HE4xfKpkPR7ytIhb360MCX49Vg7Pbc7P0NVI9nhbVLvYMJUUNi8Xe/Dn4V@vger.kernel.org
X-Gm-Message-State: AOJu0YzsQ1a5W3Kf7t2MbvNqpu4o4hlFv6C9XjHfvU8UGg4cMaXq7kDo
	TCmFwFrkcd94IMNPKdJaqlzT1mWVXert9w8uGrb3ldQ+lBdUiLUrNrC5zR35wZb4pTl4qLgLg1t
	892C7hzeoY08jGeIPWASTDoQdVnBLFlOcs6j4rJJB1Q==
X-Gm-Gg: AR+sD10EXQGih5SaNwueD2amTX5yTmPfmLMc81v3seXgplZyQONBJ7ivp3b7rcJtHV4
	FVvfzbbLenmsOv3d1au13FU4K/XNmW5QohsUPhiaknU+nDPdogKR+v77flzcxPuiRD3rJsa9bgR
	+D95YuoCQf4d/6Y4nPA6lh9JV6aKNk+Lc+TAn3FKLmtDqeMt6A6VK+5v4DUlTVFjxyJGeuoEgme
	hcjPfjGh/zKBJDRB00v4t26S2FgDNM5x4DpWdcnIehhValLk/kzNwv+EH4xHzJJTeB2IwTAxbuK
	QOX0N8DfYQvwVjxqxSEHdNYgL2FvVk4KlzJMTLXkCEb3T1TKdtdtSVxosXoN0AKvpaTdNRT/P7B
	BeSFgQP816EZnJ6s5NUekYZ1YR2D9FQ==
X-Received: by 2002:adf:e012:0:20b0:47f:959f:f69c with SMTP id
 ffacd0b85a97d-481455ce280mr1198921f8f.7.1786358211845; Mon, 10 Aug 2026
 03:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
 <178609182923.193353.7287772568467157519.b4-review@b4>
In-Reply-To: <178609182923.193353.7287772568467157519.b4-review@b4>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Mon, 10 Aug 2026 12:36:39 +0200
X-Gm-Features: AUfX_mzXwFrJ-NjND3MQzEP6QwRNrCstHPVctQ1cLuVCmYnxx742CiD2MW3y8Ss
Message-ID: <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device driver
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	=?UTF-8?Q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +
> > +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev,
> > +                                          struct aspeed_pci_bmc_dev *p=
ci_bmc_dev)
> > +{
> > +     resource_size_t bar =3D pci_resource_start(pdev, 1);
> > +     struct plat_serial8250_port *port;
> > +     u16 vuart_ioport;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ASPEED_BMC_VUART; i++) {
> > +             port =3D &pci_bmc_dev->uart[i];
> > +
> > +             /* ASPEED BMC device shift addresses by 2 to the left */
> > +             vuart_ioport =3D vuart_port_addr[i] << 2;
> > +
> > +             port->mapbase =3D bar + vuart_ioport;
> > +             port->uartclk =3D 115200 * 16;
> > +             port->irq =3D pci_irq_vector(pdev, vuart_msi_index[i]);
> > +             port->iotype =3D UPIO_MEM32;
> > +             port->type =3D PORT_16550A;
> > +             port->flags |=3D (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXE=
D_TYPE);
> > +             port->regshift =3D 2;
> > +     }
> > +
> > +     pci_bmc_dev->cell =3D (struct mfd_cell) {
> > +             .name           =3D "serial8250",
> > +             .platform_data  =3D pci_bmc_dev->uart,
> > +             .pdata_size     =3D sizeof(pci_bmc_dev->uart),
> > +     };
>
> In the commit message you're describing that the MFD driver will be used =
for
> setting up MSI interrupts:
> > It doesn't bind the whole PCIe resource to allow each sub-driver to bin=
d the
> > needed addresses.
>
> But you're adding the UART devices here which now means that the core dri=
ver is
> doing more than MSI interrupt init.

I might have misunderstood but this is creating the UART device by
using the 'serial8250' driver.

> the core driver is doing more than MSI interrupt init.

Yes, as the core driver should add the devices with the right drivers.
I will add this in the commit message.

> Suggestion from my side would be to have an array of `mfd_cell` where you=
 define
> which devices are part of the MFD,

There is already such an array, it is a one element array as only the
VUART is done.
'struct mfd_cell cell; ' will become an real array when KCS will be
added afterwards.

This is not an 2 cell array for the 2 VUART as the 'serial8250'
manages the two VUART on its own.
From what I have researched, this was the way to add UART devices from
an MFD driver.

> and your VUART lives in another driver.
> See `ls2k-bmc-core` for example.

The UART already lives in another driver: the 'serial8250' driver.

Regards,
Gr=C3=A9goire
