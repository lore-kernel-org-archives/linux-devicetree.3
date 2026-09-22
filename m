Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AAF535FCA
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079009; cv=pass; b=EKXbFc4xHytLfAL0yjfZFWLkwvgTsLvISE4HoFE/y49ipILRymRlM5+5JF715Qe7SJyNu40F6ILPv3flPGaki+r26lwLi0DxbfQhMIEqPSt5CMWhcjDsHy8e1HtPD6qbs0jWTUS7Kmw/yDTRtM3tY61i+cUO9vI3VHDyU3QHG3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079009; c=relaxed/simple;
	bh=EEicGhaPn1nMCsQoVuKYMwhQ6GyzIikHfbYLcTzbN20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJymipOiPb1D/Xu+Zok0IUrPhvpZao5kTUDgFHpChtbXpfjWb9mgSbtl3HyGSSUF5L3idBXLHOi3ee3sdxLUjpVHY978IMag6nlUFq1167gSyEnNfo9N9VRvCY/kb9WNRUUTW1QjS9382tiPGUqLkbH1yEhy2SNlqSYttMtCiKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=dlsCwRIm; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="dlsCwRIm"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso2986489b3a.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:10:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079007; cv=none;
        d=google.com; s=arc-20260327;
        b=CNpnMau1mc+NRUW/eS3/vTcFalWvvTeTKHSLK9frckwIFt2ssqcumgUXq4MKEG/yqu
         pV66JDiqrYuEZ+u/OmMXxE/FXnMqgeDBL9Ua0J6+y+pMb7CrtBPPdndrX3bjVkwxHL6B
         A/oXJUyepw6rWZyRvO6jc1O+Pb8OiOEjloGnCG+tvKUT66vyFs/iCKXOydk8VF6mUrGW
         BucJEk3fQHQiXiGgbxrRzNaohDYzBDpdSSZ4wVDKhT0E8pAZPz3jq2LSRSQE9Fmt7/Fd
         1kT0sWNSF27SxaA9dSh+h/5Et+CQeR32SNtAtXCXNAUarsoU0MCLThFiT5Ufctzgsvuh
         pqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        fh=a2+vvexjYa5fs3cG8APnx3xdvupdu/lET2MRdVfLkC4=;
        b=a0VxE9prkr9JEscpaHZIRlpDeAgaJr84f8fBVFwjon1llUF9vw1+IdQUzhFW5ddJtU
         RmilkWAHQD+Zrm1ozrJFOmU/SZgH5T5i+8x49Vm/61FnvtG0ZsFRbi3OavHoSKaYhz3k
         4dXB543mAaKP5XtBK6f1Zcq/hpZChI88nGVx7gm8HvzoDraWrd1ysx3f60XQw/UsuFSV
         2toHvb4Hh8Mw5D4Yy8XwDxZITCP/G8E2xJd68QPV3ccWjvhWBKwlxGalEZ1TfoiOTddL
         kGE8T8Jp7TPnA0Ym0FCOj/IQbwuzRvXaiQ264Nf1EI993pZHLO9ckaqPNTFw+jNA09la
         +thg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790079007; x=1790683807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        b=dlsCwRIm4HVRezPlXgMjqL2pwFl3y7jEdYHkWisPlod+xjNJOXLjGgx/ai7bwzBAp0
         4S/E3YvWDP2zUQqrq3yOsIQeU5RwYHMwL8Q5ZpPNoSntHmAGNX+vcHz1CyJ+iU/4QTY9
         QP0DIWJ+CFIpazkjDeUCbJdiTNi43nM8h2xxvR12JmftguwKzG4WRc4m4cb4MsmL8X6Z
         zFSGwDcOeuUNlGfdWN1wCSKmJHk0+tnRnfId7s0EnZCAJHEqu9iflxD/D8k2q/nTe5XA
         QFUR8YG/YIh4ZVXTP+rjpgLEE8nY6EZGEMOngbUIpk2dU1CB905tM6h1tBS4v54QJ2Dh
         gIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079007; x=1790683807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        b=QoIDUT6bXXZe0zXKvGUO6B9zoQx5HSUKlcMe3xYLrZj3Ku/zVW0L851bMUxFTD4R5s
         LOe7vHkZGN3pQXKmZ1ckUkRTqMacU7nVr7AXIvscy1RajyR2BwifNMpgcV8Vsyl0GZIE
         g/U8aTIlH/+FGBNa33cTyVG7kCCg3XBv+QmY7PFNx2zUoSClgX8bsw3itzo53gM/gc+z
         wUYDWrOmlpvnJXm1pwUhvi8CPtBAoXyB70VqQjQc1fwAIWP8M12KGIRotrRs0nTj3dCr
         WZnNPG/k1ZdBSVyVZTTH2zU9XSrWx5f1HBEMEQHscflvq/4iXRGZ8+rlOkxpA97I7zfK
         RCaw==
X-Forwarded-Encrypted: i=1; AKwUvByrNjjz1ljuMM6GZYShQoxCaP5f5p9WDBETd9RJic4G3uwUbKtSu8fGdQ4lUVdjxdmp9ChxM0i/hRb3@vger.kernel.org
X-Gm-Message-State: AFuF++lHPUZcFRuXrGQSi6MqyNkOF3lQIiTgdWfmgHm8BtBoXm26F9MI
	h+PJAEhLMUn+LcRIoQmas1utIJ0xu42lddpNaTAbbgrREZSLQi5cvRwUsBoFnhNC+PLQ1SsPVAS
	vUxC7pvVtSu2vXUjsMBKSX+gXPC275V2j38nq1dI40g==
X-Gm-Gg: AYBFou0DhtQSYNB9ZLXpHcn2obVlBJUCybJWCrWifA9qVvBo0IidbN+sKctjZjAsp1F
	QG/InGFw2y52KYs53/hHSlWbJqM9EyDnNUkbV91lklEm3795/8N3Yo2TfGajF6E3JDYM70OpT0r
	MbGF504bapMhQfHVZgbHx5d9b1Rc6AyUVoLsH/RmV5HzjKCGLYhZw4l/G2PkTKw6Vh0Q8Gfpudb
	emTYGQd1EcOkA2+oxwj66hCgRmBGdGZQSp5ne/TKI6ao6OWw1EnozTb/YvHa6iCL1zYkyyD8nK9
	vB2XH3MlSMVGMdWS0K0bijasabuwSou/0rpdED9Hs146Zi1KrOG3crCZ5s0+rt08d3KGfApssYM
	xZnJM33KeobNNBPsebT1yJDrHT175JNh0lJs=
X-Received: by 2002:a05:6a00:3a25:b0:878:34d7:69a1 with SMTP id
 d2e1a72fcca58-87c8472a93dmr1072253b3a.49.1790079006604; Tue, 22 Sep 2026
 05:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-4-robert.marko@sartura.hr> <2d7a6e8b-029a-4b9e-b7d4-8b7e96ea6aa0@intel.com>
In-Reply-To: <2d7a6e8b-029a-4b9e-b7d4-8b7e96ea6aa0@intel.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 22 Sep 2026 14:09:55 +0200
X-Gm-Features: AcwNN1WXi_VCQa282Ypqp9POkhX7gCRsmqb0WReRGFy-rkyIzQdlxyeytRee81g
Message-ID: <CA+HBbNHz4_HTMHPv8wPGq_6UP+S_RbfcToAt6W_GN57aB5hG1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mmc: sdhci-of-at91: add LAN969x support
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, aubin.constans@microchip.com, ehristev@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:42=E2=80=AFPM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 07/09/2026 16:25, Robert Marko wrote:
> > LAN969x uses the same internally generated base clock layout as SAM9X60=
,
> > but its SDMMC controller stops responding when runtime PM gates its clo=
cks.
> > Software resets then fail to complete and the internal SDHCI clock neve=
r
> > stabilises, causing subsequent I/O requests to time out.
>
> Is this a known issue of the SoC?  Is there perhaps a hardware reset
> for the controller that would bring it back to life?

Hi Adrian,
It seems like the controller was reused from SAMA7G5, which shares the
same behaviour.
Unfortunately, there is no HW reset for the controller.

>
> Does that mean unbind and rebind of the device from the driver
> also does not work?

It works as long as we avoid disabling the clocks.

Regards,
Robert

>
> >
> > Add LAN969x-specific SoC data using the SAM9X60 clock layout and select=
 the
> > option to leave its clocks enabled across runtime suspend.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >
> >  drivers/mmc/host/sdhci-of-at91.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-=
of-at91.c
> > index b7e2a89da348..e7affca8da25 100644
> > --- a/drivers/mmc/host/sdhci-of-at91.c
> > +++ b/drivers/mmc/host/sdhci-of-at91.c
> > @@ -158,9 +158,17 @@ static const struct sdhci_at91_soc_data soc_data_s=
am9x60 =3D {
> >       .divider_for_baseclk =3D 2,
> >  };
> >
> > +static const struct sdhci_at91_soc_data soc_data_lan969x =3D {
> > +     .pdata =3D &sdhci_sama5d2_pdata,
> > +     .baseclk_is_generated_internally =3D true,
>
> Should be a comment here explaining the issue that needs
> keep_clks_on =3D true
>
> > +     .keep_clks_on =3D true,
> > +     .divider_for_baseclk =3D 2,
> > +};
> > +
> >  static const struct of_device_id sdhci_at91_dt_match[] =3D {
> >       { .compatible =3D "atmel,sama5d2-sdhci", .data =3D &soc_data_sama=
5d2 },
> >       { .compatible =3D "microchip,sam9x60-sdhci", .data =3D &soc_data_=
sam9x60 },
> > +     { .compatible =3D "microchip,lan9691-sdhci", .data =3D &soc_data_=
lan969x },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
