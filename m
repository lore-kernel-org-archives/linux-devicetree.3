Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C63655CC
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765366; cv=pass; b=G3z+5YMexZ2AspN6jqkw7yx9e1ckHojgNbzIQXn2Bw1aLsEKmsBSxUDCZrogiFfvaHIGfjjlbKZouPrg87Tk/bcCV7q713H/Szcx6jADF1WoUaRTc/5v1j2+CMyLOHRpq/uw3gfXliJBft0Gw/FMylq3KV2XRylyH05rRfnrsxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765366; c=relaxed/simple;
	bh=PIULD2sfSK88keFpIH5V5f8s/UfnOznWi0dgeAPq4gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy++1qCroA4ffnxu1wjHgWN4xC8ivfWKozdtlcCKxW7idCrx/6rxM+qbx/2SXYDb67cq8OU0+cnJKZjhsVWJcdcXlWFkxvPpt2fPwveLK5XekDFP79+/0KtkaJC6FMqr0aNEO434q3+Xn4/cvBbNZKxICe7dSpio1efRtDe9JpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E05CsRpE; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E05CsRpE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso4256375e9.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787765350; cv=none;
        d=google.com; s=arc-20260327;
        b=LFz7MwMrWX2EtqZjJmgMFZH3sUNFFqeTLfYFmlMNyN74Rff7kxs4c7Qd2ARgPskuCO
         58Y274apfojlrTB06yhFgIJFfG/f1l+FFUIKJTN/luOSI2BnRCqHNxi9UhwDb5O1cEcT
         VbtM9aorMZo3VukJw0/vhZkRYILsoMci3Nhe2rxfv0HQseO+94pQfaggMb43PfS1URys
         LJOW9KuYO500c9zgDpr/3BWsWdVOXgMxCBUZ/jBiR76z2KIN0g6RvLE+lanWOA16QevD
         IWRn3XviWnRur6/mVPMbhJcIYHsWOjEYCfkpOKfiDZ859+OgRTqw7imgTS1riztwWRxw
         N2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        fh=WaHooJrqsWG7NOSHryMMyzIWtkrutjeUKsVfYO29bfg=;
        b=QJappxOLcXmySqres9SiYcyTHNm7igGH1K9zEXw6GMDGFJvK24l5vxRPrY7RUVx1WC
         FTT5UVAfsH6Ec48xHTbXDhcNqQiw7Py6pgHY+E2Yg/rLqKHb3tJWLq5Ga4Q559GydjfR
         /aGHOoAZQEVoiH2cki6M1VdMVzrqZnEeV0vKbyXI8VK2ag1Fz/Kc6B/QdPJqJHi8F21g
         IBUJXWeiS0TW0tT10RG4SypmQv8t1GDX6MqCYM0q5akeSoK+h3hElxLJFzE0yu2uBlxK
         v/1GIXcVPyOMmXrMjpEE117Q/rL9TPpdNuApxVNAdTKUnw4+UAbSRGfShFCaf7cYmtSo
         /cFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787765350; x=1788370150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        b=E05CsRpE02vTA5otmhUKSb0EWvky69+A+daxwQjuLewClNxTHdCzxP0AbZkpfPl56U
         Rgmtdi9UZDJrX4i+jALLAePZpRHUtuhBAASzJFpuuXQ8HoFAJH7W4pwFpZp02EeGzqfc
         XmFmpx+PAYWaIx09oXhE5U7beVbTqb4+Csa+sCo+C7LgXo6LByAAitmlSVNSLcvNEamI
         lKe3bzxaM6RxbZdbqJHaFLFIpaBDVZC27QjAGnV3f7HxuFlXPHmpZ2Gvp0VYjFFh9qFH
         UIVWgLyNrYq/ifJDDjDpgcisIN/EpvHipKcW2cwZ4O2JSu6pI+5Gpsl/rIBbmrUqnBJ3
         C3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765350; x=1788370150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXN0egExQUN8IBSJ2IqvNwpvhI9gdkWCNjlrCbNq1Z8=;
        b=eQ3ZdG3ROcT8IwbKeV+N5CCBJ+qxIl4biaOfNaq/pjy1cJl6V03foyg98/9+8g8VAa
         vfBu0I/slnsW9nqH/D5T9Ryzh04M7nmoAib77TBC3a/M6GLBzbmrpH96SYf8wuoVGQd6
         gcy3HBCEitimMQwr+22hj2muyABFsdC/p1wcbfDkPn4ZpHIAPbcmRTCeLUs2EBnenDxS
         egkqzQdayg0GG/cmlBVjN2XWi23nnKF5ODqHhOCopjeOS2GyFttTqT1EcPzesTgnoLts
         +372bVTJQN8Cn54Zi7bZTUFsDpTfhwjCNX+fCaziXQJXQSEleRLcpdE5bTr5RaadF754
         Ypmw==
X-Forwarded-Encrypted: i=1; AHgh+RqX0NG94JxRL5bC3gqiCOXOYNCD4QNY6Hb43lmome8dcba4mNyn8jW6hKT3VrVI3gz85frpqwY5lX3Y@vger.kernel.org
X-Gm-Message-State: AFuF++kUAHV7/hnmK09D3XBMRDJHqhgtqKHS5ZEaY4rAG205S8ZK5Tdm
	cIiMVRSb022Udwu9JixDMDXp/DRnXMS/IMbQqg0WThSON+mlSLtIPLPzbzLj7l4iwPTAOt93Nrx
	gAXr/zoJU4Fn6cisTO3axpTjgJqgZSl0=
X-Gm-Gg: AR+sD121OlP5Q8L79daDjQt2AEzXcO9UY70/EMB8G0Rbo5ClnNj6kkeITm7iq5ciXOk
	PQXNiIG5+GaLi7yP0aAiVlAQmSLhzDSgRnC2izYxdGdQkUPgwd2vD2UC49ifLc/9xoYbBCGybFA
	IModtkSm7xOWduordDNvBnYlfSH5ZMsBmmaidPjQe95MzTCJYsKBwfLuxyEGDtwLOIG/uKViLy8
	x1W4wBKr7j2KAuP6mOq7OGc6r2slfq2/NYtuDHS0vYScKcgMWr1q+fIRLj3OMprbWX7v5ABfcb3
	iKi8sICifKT4mrieGBTcujJO0qqYfTbGw7YDf+ekhB8Rxg9YcZHAwcgaP3kVWfhb4Qbc80DB0Vc
	5o0CuDFW2QPKd8OpFQlKJokmPEAkW0CGclGPU7NcU8UNeWEGQ4BWGDxjJuAHtokyhqw==
X-Received: by 2002:a05:600c:1552:b0:490:e5c1:b8bf with SMTP id
 5b1f17b1804b1-499dc822d91mr79612305e9.13.1787765349355; Wed, 26 Aug 2026
 10:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
In-Reply-To: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Aug 2026 18:28:43 +0100
X-Gm-Features: AcwNN1XTZI4bYMbcU-2XeKqWyg1OIm4BXC0WXAgrgMa6hG5Leq-MAga-Sg1fRPY
Message-ID: <CA+V-a8vWaxPyhyBF3wHKrTj0WnimyjxmU7HCD+aD_BazZGdOgg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Geert,

On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> > from being modified through the MTD partition interface.
> >
> > The corresponding boot partitions on XSPI0 are already marked
> > read-only.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -825,11 +825,13 @@ partitions {
> >                         partition@0 {
> >                                 label =3D "bl2-1";
> >                                 reg =3D <0x00000000 0x00060000>;
> > +                               read-only;
> >                         };
> >
> >                         partition@60000 {
> >                                 label =3D "fip-1";
> >                                 reg =3D <0x00060000 0x007a0000>;
> > +                               read-only;
> >                         };
> >
> >                         partition@800000 {
>
> Makes sense. However, what is the recommended interface to update
> the bootloader in these partitions?
>
The BSP supports updates via the flashwriter tool; there is no
recommended way as such. Are you hinting to allow this to be done via
Linux?

Cheers,
Prabhakar


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
