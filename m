Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7A835B649
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013250; cv=none; b=hhhkgdb/sZo0M/KBIEsqwtU+NIdqO6wAWKFxguMqel0ri1+KdnFwnJSqC7VAhfk7Jvl+RWB8AKSTjC388+6f/grvVGOUa52tosAjR42ft+8WuHL/qbSMR1DI5X6cPM3c1VZpE2CLYZowiDFSHyzPhBLTkM74fjt2yaCx2z6UBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013250; c=relaxed/simple;
	bh=hPjbsKLyqV83oL2QS75IvKJ3APLZq8Ze2ke8fdqV9C0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jxx6Ja2poW+Wi6b+7Bz2rotZ6WVWCn+8+FdQAW36zehsldd9+I9OqAV3ur1kekjGTycq5p7bGc2jZci3iOpnENxYYKQzAJfM9VmZQUyZ8cZbB9FIrUjBFEeeBmseEYsF0Aya0+Yzg1k1Z7fd1C/ahDOkJD+sw/3AWqiDlLkTtzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso4580531241.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 23:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777013248; x=1777618048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu0q45d2E7oLscYVPbeGMb4gT2YaXOimO9bdtwCxdfg=;
        b=iJ/VinXWafUwpmQNhI4wYLgH+7i4tncoTl/YnYAcetwdbkAmftlU8HfJrIcmkyisN4
         wD7PeTOnJiW49AV/ioWAbeLceOcmEL/o+CAdEcIlLrz4LdaM9aDGwAbVC7zRj1T6PuEC
         azDURHwosgZxXPE2mGA+nvopTKcoP6Id4yQtwSUDvcmZYtTZffXkVrH3YfR/krhtXNds
         lVT/0QLTAkELDva6CANRN6qkORrjytOJQwLTdC8t0Z/R51bbWR6v21CozmLbm1LSzaAr
         d9n/ECZmHRDFPAy6nEdX5cCl6c7PB6+ubaCfnH4QEOoCJoGh02vPF4hF42RhyDdL1+fn
         3Hyw==
X-Forwarded-Encrypted: i=1; AFNElJ/1VRycdrbLBSUkZgL7u0c+diu9RqJppWw4vKA/VsKtVAl1nD4N5HwevXiwCCdS7bCFWQgRMNIz+gET@vger.kernel.org
X-Gm-Message-State: AOJu0YwnfmnsTNLl7wH80ClL1mzNwQtJ5UPU3E5ag35Kst9eDI+XITIR
	1Zyn6anpvGESGNF3rmwzwPQ4mP9xRxlCVXC4MmRHFkzlRNylVYxAKFuP5JbZaJRZSME=
X-Gm-Gg: AeBDievwf6VTDBhiOvPg/erj4k9fAYUGGBef/bpD9HWmNVS0P5JxMn4oMqABH4UbucS
	Zc8Q8iuOJiYK6hlM/2Bn7gv9/XFsVMnEBnkM+YQQ3+tjkPFp+RuJ06+wcL2CXH9eNBfMhSfTj3f
	eVL9vFAQM+vOLr9S3Yz8l8uKuSUunvab4X+HbfozsKntm3PciM2edCJ4GXlFDt4U3OxO3H5pPGc
	MMkdvtdTOrSfpKE8EsfiS2G471RcwS1Wvk0f3kNb30xbviYZj2GtdHPVNc7mMhlVt7+/e3UWVF2
	4F0dZ7lPTGn3LRkzqxbkfmJU9zCqTsWDHhQ/QnQUIFMjIRwmDTlouymX/ICk2JZ4YMS20gZMwuo
	IBRHHDMkmdAT6qzNnwPTrKve8J3v9d5tilkU8kI+XZvEXW9PHLRiHKaPDFqfNhHEBRdgUFhaYSp
	++M1pSRU0Uom7J7JMMd1RTiOoX1Iz2oYTuZpetFANtXGihek2Xnv5GjpuwCIyuCkpom/ooxhPFR
	U8=
X-Received: by 2002:a05:6102:689c:b0:611:c543:8fff with SMTP id ada2fe7eead31-616f4643b36mr17107287137.4.1777013248389;
        Thu, 23 Apr 2026 23:47:28 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890bc746bsm11101363241.8.2026.04.23.23.47.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:47:27 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56e91f17a99so4869114e0c.3
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 23:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//UBoWK5fDVbkP2jf7rWIg9c57ziJKCM0TZsdlpFnJp8BMUCWp0F+PIZ7OGrgYRKZo3Ekl1QjgO8Yc@vger.kernel.org
X-Received: by 2002:a05:6122:3a0b:b0:56b:7d4d:4d11 with SMTP id
 71dfb90a1353d-56fa5808124mr16742384e0c.1.1777013246536; Thu, 23 Apr 2026
 23:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402131020.143123-1-biju.das.jz@bp.renesas.com>
 <20260402131020.143123-2-biju.das.jz@bp.renesas.com> <177628854701.543173.16954025159083410550.robh@kernel.org>
 <TY3PR01MB1134691789E55E415E315658C862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134691789E55E415E315658C862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 08:47:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWh3gRhr7V632Mjn-feMrC8j8v8UvaywUtsEFFrKLjZ8A@mail.gmail.com>
X-Gm-Features: AQROBzC_m7I4rDcckretBHhnhJcFIfI0ico-cqvyKrDaP8xZGRyxWrRj0fSwhbA
Message-ID: <CAMuHMdWh3gRhr7V632Mjn-feMrC8j8v8UvaywUtsEFFrKLjZ8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 24 Apr 2026 at 08:29, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Rob Herring (Arm) <robh@kernel.org>
> > On Thu, 02 Apr 2026 14:10:16 +0100, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible
> > > with the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v1->v2:
> > >  * Collected tag
> > > ---
> > >  .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> >
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> FYI, this patch is superseded based on Krzysztof's comment to avoid
> flexible dma names for single DMA and the patch hit on [1]

Sorry, I don't understand.  The patch LGTM and is already applied?

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260423&id=5277c291968d87c6a093f50ef489df9d52cb3ca9

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
