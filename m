Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE743E49C3
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093046; cv=pass; b=BbeDzDPPmqNC/4Y2T5mUMGSsGGar5bLZVg3eVIASUyF8sg/6eTkxDj03qNhu8SvVpA+rd1dQkGQonE762JZCWgU0c7mxc9HwpYMPJdeAj6qhUnXbUA1fIE6MH0ad+O567g94TfcMxXZi0RITDP9H5vBPFd+pyFGhq+mojpB35bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093046; c=relaxed/simple;
	bh=KEdmrWiumUeXB4OLzOXyqvUSq3Q91QBd/CBRfrkSmnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvcqBAS6iJfrCs8jArgyYUe3VvZOyliwCnalZnhj52uW6OK2IC+Q55Ia5desMvXTVNWIwgy2BG3TeFaAfx8bI5TUVlSi4qQMT5q9XrUlyHpkI5Etqc0GCzPi6jk+VUxrPsjo9UnrZjH+bKf6I1k6bda+wdhYEm3z862Gd0r8C38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqOz28pp; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqOz28pp"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e50968489so4168570d50.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790093040; cv=none;
        d=google.com; s=arc-20260327;
        b=p6jr5sDc5nMR2QVPe73a5qeoFlMSt2kQ2zyrdwu05rUCftl5gG4CXelBiXN9QF1brY
         NCnANlVnmJPSRkOne/Ecrh8XOI5JdbTlTUMX8GCWmQnpOIKjx3JUeMOFpT1pJIgGdv/Z
         R0gly/yWB9P9i/OX9axRHQkAZkQhWdWNhs1rnG8JvHDq7Hsf/IFXLmOPjc7lPxRDAiw6
         uBbzL4Y+FJlMGrcsa2R4P/SFFejvEoNkgBohOE5Xi2sfXKUTL6ENqTpSlOQTViUOYYf5
         fNPQu9Pzh3BKNMPG0HAf3Yen5CSd7SOGFEdRGIwZdnrrSdcxSrI6Nh7GxJY9ZYhdoNW9
         3k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        fh=bGJLfPBkJtiD7Pqt7cRRDGuctLU94n/2vIoLFHvaEBs=;
        b=PkwFO50fYlOvaMPh7fsVglBkr7EVocOZx4fKUFPWArjIbiSv3GM1EbIHHqMCH1rGB7
         0DMJmnW4733Um2pCxvIOMiu5JAnEK5jy2GZsMeBvFq8rBZb7YCQZslX+kcb+1Ti60oT5
         y+d27x5Wlj2TlTWUzfQH5Ka4eRJPHeFHbZ20PQ9idiAbB8kssi7J2/TgEWNOySY2LlHV
         mfITNAKQVNxVo1Z0Jt3tRwwforv8G1T+pFCCW1rPU1lYragzbFjGz11ChsGmOmjW5mEQ
         yyGoGeDR73EGBzhOKZKlSu3WGC9NxXQyLpQ+I0rTZcIWCV5vvjzYkgUsPXXRCaNFSY06
         ZKUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790093040; x=1790697840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        b=iqOz28ppYUN7gvnN6YWZ2z718+SxoSgwkvhoHjXKrD/DAIj7yV6jheqrqEfgsw2ezg
         vq7REODx6AO8c4TzANyFIGp1a7vN3f7D1IItZASS2nCOBZdcf/Qzqu5t1jxaB5vBS4Db
         l7mx3K12iu7wgwKR78KyMutgkQZgUqbsxsKeeG5rYrQ0OC8r636TbIkSAV4d3NTHoG5s
         TmFZLHncCucnmJ7HS5hnDFOcpowiTNj5N3heHIrAL8+7AE5xfn1EM7Uz9KCyElWCNjID
         4GV/G0Ufw5HrMn3MkMKCcvDGwa3z7WA172A0dm/Qy/lDuHfNf4CnTG18C6DxMw6acfTU
         OFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093040; x=1790697840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        b=oKFhtFitb2yfYuTtrx34cl3eT0MvGvFbF2WVs2+rAdUzvlHzGyjRw8Ttw8lSNguIMc
         eWGPVtO1PEho8svFGU1K79wQV0lxOd6i2GVeLwH3bywU3jC31jUNxdjycXRiFxU1OrXC
         fo9N65OygAV76kcKyOeiws9Qa9YQvHLH5TdQg4UeUADrACd5HMktCabk5oz7wUrnqzrU
         rlpj2QPiC73AqDped0ShcL4upvMkkmm6L2WT4fDoUF+YNENeXYs4cKoIv1pckE6TJNZU
         skwY18LhpDpMJ/s1kMrHbX7BTlNSNLfg/M+uBksD8mwFM/oKFByve0DBL0lhN9nJI9q8
         yY9g==
X-Forwarded-Encrypted: i=1; AKwUvBxDUhvOPbCK7K0rfPbrhKyZVOcLptIPEXaJyBQm3kW6xPPjAYWuARIdkz2TomsS3r0zbgXxFIpYFOKM@vger.kernel.org
X-Gm-Message-State: AFuF++nbBNAK73wUFKPPnsmyuieLzXrAVNW2rI2R2bC9dIiN+0BMSWM4
	uMJ4OzHyS/pHG/D7mRMKduiezyfRaKM9nD+Dw/maL9H6uctbYa3/d1mHn6gngE97VEWU5aFJmkM
	kLtongVkPmaUw8tBXNtPqCtGUyz3ncX+7csjn
X-Gm-Gg: AYBFou1Fn12roCrqevN1pbf2z2yKzsUylETpJXYQRVK6d0VlLhEgj3Rm8VU9CUxCvF7
	sV2N/Mmg2B+YocV5XNdN71bQJ232oEyILCpeegfHVgKMHZ2M/xlc/OVxhL8LGbAhkTRMp5AulfK
	uygBtO+Arn+CJNmKh+WmM7ilL1NPb7Sz9SQlOMLT9b/ZIX2BzCkFAq6p/AEbcoGlxbgp6/RmZVp
	aIgZxbanDZ+B9sCzM63fWzDJL1d3XYnsWHOA/ctKhCau94VDQnCZvJzyg9Vifx+IKd29F5RklFr
	WPAr7ZMQrlNkxMjsGW5HQFKUj8wa6OCRRdy6pJaoxDPLLBG4rL9m06SQBBfE48QNhkwE
X-Received: by 2002:a05:690e:1249:b0:671:502f:dd32 with SMTP id
 956f58d0204a3-6717fd6b6a6mr5447023d50.53.1790093039560; Tue, 22 Sep 2026
 09:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
 <179008369971.83584.9572254757332285883.b4-review@b4>
In-Reply-To: <179008369971.83584.9572254757332285883.b4-review@b4>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 22 Sep 2026 21:33:48 +0530
X-Gm-Features: AcwNN1Vb40B7-CxaHaopn8HdM12Pklcn_b9p8jPV7ixD3IPvviwFvarSvM72SF0
Message-ID: <CAMFFDGhNg7ogv0NYXe5Vga0Tf+XD85n80=MOwa6FgSX7q9D0ew@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thank you for the review.

I have successfully rebuilt the B650D4U DTB using multi_v7_defconfig,
with CONFIG_ARCH_ASPEED=3Dy and CONFIG_MACH_ASPEED_G6=3Dy.

I'll correct the GPIOP indentation and retain the review trailers if
another revision is needed.

Thanks,
Prasanth

On Tue, Sep 22, 2026 at 6:58=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> > Add the device tree for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > Describe the BMC memory, SPI NOR flash layout, UART console,
> > GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> > connected to an RTL8211F Ethernet PHY.
> >
> > Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> >
> > Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> >
>
> *snip*
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 000000000000..a4e384588a54
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
>
> *snip*
>
> > +&gpio0 {
> > +     gpio-line-names =3D
> > +             /* A0-A7 */     "","","","","","","","",
> > +             /* B0-B7 */     "","","","","","","","",
> > +             /* C0-C7 */     "","","","","","","","",
> > +             /* D0-D7 */     "","","","","","","","",
> > +             /* E0-E7 */     "","","","","","","","",
> > +             /* F0-F7 */     "","","","","","","","",
> > +             /* G0-G7 */     "","","","","","","","",
> > +             /* H0-H7 */     "","","","","","","","",
> > +             /* I0-I7 */     "","","","","","","","",
> > +             /* J0-J7 */     "","","","","","","","",
> > +             /* K0-K7 */     "","","","","","","","",
> > +             /* L0-L7 */     "","","","","","","","",
> > +             /* M0-M7 */     "","","","","","","","",
> > +             /* N0-N7 */     "","","","","","","","",
> > +             /* O0-O7 */     "","","","","","","","",
> > +             /* P0-P7 */     "button-reset-n","control-reset-n",
> > +             "button-power-n","control-power-n",
> > +             "button-nmi-n","control-nmi-n",
> > +             "","",
>
> Nit: indentation.
>
> Other than that:
>
> Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
>
> --
> Tan Siewert <tan.siewert@9elements.com>
