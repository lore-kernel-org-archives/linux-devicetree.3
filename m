Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D4437A488
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010848; cv=pass; b=Xcz10FZnTSfbq3bdL30zg07uSuyqW2RWp0rk1eohkV68AgaQzvPorGh9m4x0t1F/70bsVyjbw2qHAhOxgCu3lbcKWw8eS6xDm/2fmeI8m0WA98DP2uy97ygSmAdbcmbPaQLQGA3xbpzEe3lUKywI9vhMx5j0aSMoNndvq/Isgbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010848; c=relaxed/simple;
	bh=SQQvHJDR4N2zN8m1faM8ZV3aU2WZpjICcmUzTDU83P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDRg2QJo82jA3x4+RXbXi2LBWwdr/yFukKmmTwn6YPhDSmB81l5FYB/iSHFyBjl8YD88uzvT/wcLlUR/BNMKg2zyBk0nzPBXwxaCBCj3c40cotPDhB5nuGiMU9TymVhraxnF2qwJznLoEc5uywu1NSNBq2+rL8e3ffAhAvXtl88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=CqJin4JL; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="CqJin4JL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso1631408f8f.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784010844; cv=none;
        d=google.com; s=arc-20260327;
        b=CF3R4V8RTAXrmdA1cR2xneUfc7zq7UUPWTXVc6bZ5HXEwg7D3ctw1byjc0xQ0Qy/+M
         nS78ms2+3raqrKjfgKLpcunDpo+IpnEUWcq8aVFhP4n3hUIZp3yVsrmGeZ9YElmsR2v+
         lnF2exWbrx9TV9/VvGJWH6+IqN2Rh/cSf5BL2Cjuc7FLkL2V+17hHgk3304YRNfawrac
         +TA/tKiGLojvzqeXCdgCGXZNAGulwpSGv5IUmjDjDKdge1Ua9V6TVhFi5TSl+jUlC73L
         aJZACxcwWKQrqr0IVt3OblWMOEcOdW0z6hmVXZlhYqK50c2/V2rw6PgHWbA/ZmvLI52K
         AbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W9FrfG9Gw4/z5mtWnR84x/YK0xjKM0uXdEh4ByObXig=;
        fh=ASLBD0c7iNko+1TzHZSxEwfV8+sD4uO5yKQnjY31IjY=;
        b=YOQeuZAaO5ELnLcxnXXgy5OogYEW/TzH8a09Ncf5xrJaCTb+U9KhqByTiYhRZgpnRi
         p5kSCAXhJGK5kI1Ox6DLOokqAab7VbYhSWn50uxr/YxJC+lFMnss9cSobMmxxV/PfPFy
         uqnrUALQB5Z/Ku5P/hJuQvwFvQLQUF/p+vwyjhCznkerLzzLiTtg5fsEWmNBt+K6fCiM
         5YDJniqYrUWE8vX2VNPuiOTMVxLzhsb83Kuw85+lb4GN4qDHMig0fFG55/ysFfI96f47
         Z4fgYwIXn5IlGYbpdNYqSLuP68l2wZCBoQcp+eTOBOVoClI0Q8jSPgPTALu69w9TC4SC
         EtTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784010844; x=1784615644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9FrfG9Gw4/z5mtWnR84x/YK0xjKM0uXdEh4ByObXig=;
        b=CqJin4JL7vzZ4VJeP5HucHG9CU4mHtJN3YmTOoPoSlQrgoFxGeY6vkDRVpc8aJMfWM
         sI7r+tzlLq323FaQb9bh2MPXUxiphBv+XqrgZKQXYE7YNUY456B6EZtiOxBp7eKuTrZ7
         UFJjG110LQLndIUBTKXQ7bYCkMdBDuOHlK2+8AeQiTnFbvI1aCJcHKW7KboPH2FM73E3
         Fn3je1Q36OFpyqErmaw2fn9S2uWb2o4Ew00f91SZejJBprvgBgbMZcI7srfYjQrvdmbM
         ZaF7eKrbxDW5VW67/O7xDiI25yzhP7rGB34LNuehiQe5wI/a1fzWTXd1BWqyW1EqTr1P
         Injw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010844; x=1784615644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9FrfG9Gw4/z5mtWnR84x/YK0xjKM0uXdEh4ByObXig=;
        b=C8J7SxgRd3+TbJnKjEbOdjuNmxF1RUeU3P6ks87OD1+y7/AJg+RDFsaKTfj3HOQGRX
         D7oxE7W7lvZKgKa38/4UuDwRy2OS3i+DewQGoVr6Ho5H93pGlwb5yZx6O8i7JdBNd5OV
         QRRidZ/K/S17zqwOWuJiCrWseW0ydSWyx7x1S5WPM5m27l/yOUUc6pxTdL8j4C0vUQF9
         H+b+8mQONRkOoTD//MalRwpKUYTBhvhQCqMu1u64babRMtZCwLCN7JKoQp8XjzZyei+D
         Zw+uoikHVa27tnNJPBqsrVNY9vh+z7fFQQOSu0W8pUwoOPWQjLavzQSE6EwnJr7JSCHo
         MiUw==
X-Forwarded-Encrypted: i=1; AHgh+RpYA9k7NvhJUGQI7yIQa1Wgkz723lnN5SNS4127VQXB7GhxaDuUjErg2q5CTS1w5s9wVedxFBPcbK2F@vger.kernel.org
X-Gm-Message-State: AOJu0YxzcOHWFUx6G+GphFD6qL16tCQOTZeXMbpBQ3husBv5XoIV4L/s
	h6GrbaPVhXv8Yk70YApD1H7Lv52sx+mLY71uKMY+Z1eR1EOeeuWPKorVTqP+UoCtPYWR9ZJApYV
	Kx72lORs81XmL0rmf2vI0w0seKxCAMVIdtScgp2fzWg==
X-Gm-Gg: AfdE7clVOWMIQDVpAC42c3nYAiNvTx6wv0Kb0fE59Z9J+szLE/wNz+ywumujte77TSe
	X9BQph6tPpFADG2KhB3UE+adm0DqImNUmuIBNBaYrwKdAc6AmqKpC8a+4fkS8SbgrpqqCfbYtTg
	+rZs/nfCvL+kQ+u9ktfzByKwqCpMZRHM/Rhtrk0PZ3rAwZntIzY94UnUYrmiDXwa6kHVC0taZ/A
	ttgzDhrVIJEyq9c6xbl1R8KoOhbMMuhk6YuVRk88C9U9+wrFTVctSFc3G0TwVoyQDkHgY9wNr09
	1Pd30uCs1brX+y6vx4VC99vGVt2BmogD5QYOK6MoUnpeRtJVBvKOSc1mlg==
X-Received: by 2002:a05:6000:40ca:b0:43b:498f:dceb with SMTP id
 ffacd0b85a97d-47f488488a5mr1165528f8f.9.1784010844468; Mon, 13 Jul 2026
 23:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
 <1af9eb75-fcab-4541-8ba7-ec620546f031@kernel.org>
In-Reply-To: <1af9eb75-fcab-4541-8ba7-ec620546f031@kernel.org>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 08:33:53 +0200
X-Gm-Features: AUfX_mwqF2s0XWJlIYVM5Zbx0O-qqVqJE0SWnGYK8fsSsk4VE3pkV1cTIOFg11A
Message-ID: <CAFi2wKZRVbmCwprkxGZoxib8BrFd9kDS3H2cDmykEorB5S7Xrw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
To: Jiri Slaby <jirislaby@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Thu, 9 Jul 2026 at 07:17, Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 08. 07. 26, 17:35, Gr=C3=A9goire Layet wrote:
> ...
> > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > @@ -32,6 +32,26 @@
> >   #define ASPEED_VUART_DEFAULT_SIRQ   4
> >   #define ASPEED_VUART_DEFAULT_SIRQ_POLARITY  IRQ_TYPE_LEVEL_LOW
> >
> > +#define ASPEED_SCU_SILICON_REVISION_ID                       0x04
> > +#define AST2600A3_REVISION_ID                                0x0503030=
3
> > +
> > +#define ASPEED_SCUC24                        0xC24
> > +#define  ASPEED_SCUC24_MSI_ROUTING_MASK                      GENMASK(1=
1, 10)
> > +#define  ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1          (0x2 << 1=
0)
>
> So is this
> FIELD_PREP(ASPEED_SCUC24_MSI_ROUTING_MASK, 2)
> ?

Yes, replaced

>
> > +#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN          BIT(18)
> > +#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN                    B=
IT(17)
>
> Perhaps switch the two (to be in asc order)? And define 14 as _RESERVED
> as well?

Acknowledged. I have also removed the comment afterwards.

> > +#define ASPEED_SCU_PCIE_CONF_CTRL    0xC20
>
> Hmm, should these go before 0xC24?

Yes

Thanks for the feedback, I have made the changes for the next revision.

Regards,
Gr=C3=A9goire
