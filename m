Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940053911AD
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853135; cv=none; b=OtilYDi7vRk6WmkhCTNQZqOxwlXr3gaA4q4x7iyuEZAxuL0XO2Q8MpuVIGWft58pSnB+qJZZIJWsi96mWzwaOqHOzKQsjShViDBWXmctljlzPMs+JdwOC8r4gDp/A/PAU7zQ3FRJK1nYrVnfAS3/7BLj94JG3XWpqjDUgEYVAkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853135; c=relaxed/simple;
	bh=6Zc6vX1bU73eq1imPj+MTEbo+7J7RWbcsZWKEYMmjQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG2sPI6EHwsKSOOfImc63hFk3IGZYFrgnlRBYI53W+/oeAU5iLx3sF3sNV/QX1j1YgHUbzYYrRNJa5ubSdhhf39bXafU+9/6c287inve2okggAS/aDfHY2F5WYrwXwVzL3JpO+KJV1QPdx6YnCnbWXyOSoQAVh3jXBjPq5/1aUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73720e58dafso2910604137.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853132; x=1789457932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FJoKkivoTNtHINOjagJJ4U0TVNQrepQ/joiDIuSwkg=;
        b=H5SxAxIJUIBPt3jeJFt99XPJXSOPVJpurt5yLG7uzVVC5unYk+RMxjcHpjA8Z3ZnE2
         STL16VN9vOOtBWI5LVgoiRbs+nZtQ6R+AWzRKS5JFQXOARg2X48kR7ms8S47p/BEXWys
         6FXq61/lejAJJY6f8m9HxOhzJMTwQMN1b2xNBkUEBcqwvLYX8X7N9/e72A8g0XfxJ6z4
         VXPRccCLocrtnpD9Rxkh3vU0d07bEizc8rwzuFw7aZ2prHk8u1bD92WcDdr+zxGkRepB
         zZ0UMamfjo/+f78rXajD3L3/Zxz1xiyGIgKcaPUbwoAebsLUJVzw7c6a6Iu6jlZPNM+6
         /x0Q==
X-Forwarded-Encrypted: i=1; AKwUvByqvDc12iwSb2alO1hrQ0Mf7iAcuHGYecVfryexSHgyyPauf0p+2pzd4kPqdZJG2pf7GuJZV/cekuM3@vger.kernel.org
X-Gm-Message-State: AFuF++lJewBFz9ObhIsNLlC2hqW9GWjooDyPPx/ID77kf+A6GVpHyrql
	iD0fM6U1dlUW+qhA4tBiOP84HXrx7Q2wJXPDXChq8rHtA7GcjYLTDE1ABC0jsX/M
X-Gm-Gg: AYBFou0NwA/MzAdLXNH5HUKv9XT2X5bRM7YwCNbbbn0mEozQ6/24pxqGTBdQCbToM/r
	LtandrZb/roTfz683wJMO1cHv7EYNkO6k394gn1QqV/KpnE6NE3VTaTDr9eAhhNfDpT+9PL0UFf
	ngruIoepisy/Izk/CuocV67FAvBEau332ViOlbR7v5Oi2LL+j3ZjOPk78zRWOlgECmZMFNNKHMG
	DGLUOrbKrd0mr0hy6LORnWY+5XAEj/kaw3c89hZrV5yGWE83icEBC080FJKz99Y/Vbui+gzllcc
	37ZvCEyK91zywnFrC3ZQyAZyMSbYl07tLvOCvpUg7ipSa8IInzEcinZnloJadPg2nwNJ/tNKrDa
	YWzKWk6s28pkiCyl49faYXVj28xjO01TqNwfFgFIunYG439D/yUh41N5dFlW6DI1M6f8MLm3KeI
	3mV7UJ6WWONxPntaTbNkM1w8/k5IAbdhkiCEaLF3Bk6gxlSWCdODY4/gMsEkMjAlXCfVAVStoHK
	0s/gY2PTsptOKnV64KtSA9KDA==
X-Received: by 2002:a05:6102:5126:b0:785:5a17:739b with SMTP id ada2fe7eead31-78a4a4944femr12002730137.0.1788853132434;
        Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76aaasm8106729137.3.2026.09.08.00.38.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73720e58dafso2910598137.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfEFfONXPlb+L3O07etxP3+F4H+zk9LmDhM4mL3g1Q/LecINoesBWn+qGU7CaqWHUpzSbWWfyozqP8@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id
 ada2fe7eead31-78a4a6e7023mr12540904137.3.1788853131839; Tue, 08 Sep 2026
 00:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
 <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
In-Reply-To: <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 09:38:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFwTQkdWZ0M2fWE3JCKT9fJ52roWBec8FK-=bm=BoWrg@mail.gmail.com>
X-Gm-Features: AcwNN1W_wiXo_u_6vCxRFTrWJy-fQIHFj_Po8KOr7IuAmZBSsWV3hZnj2lA4-7s
Message-ID: <CAMuHMdVFwTQkdWZ0M2fWE3JCKT9fJ52roWBec8FK-=bm=BoWrg@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Sept 2026 at 20:46, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Aug 25, 2026 at 3:57=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > The dual-channel TCAN1046V-Q1 CAN Transceiver on the RZ/G3E SMARC EVK i=
s
> > currently modelled as two TCAN1042 instances.  Improve hardware
> > description by describing the actual transceiver.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only due to lack of hardware.
> >
> > At least the TI AM68 SK DTS should be updated, too.
> > There may be others ("git grep -wc ti,tcan1042 | grep -v :1$").
> > ---
> >  .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 25 +++++++++++--------
> >  .../boot/dts/renesas/renesas-smarc2.dtsi      | 13 +++-------
> >  2 files changed, 17 insertions(+), 21 deletions(-)
> >
> Apart from the sysfs file name changes everything works as expected.
>
> Old path                                               New path
> /sys/class/phy/phy-can-phy0.0            /sys/class/phy/phy-can-phy.0
> /sys/class/phy/phy-can-phy1.1            /sys/class/phy/phy-can-phy.1
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
