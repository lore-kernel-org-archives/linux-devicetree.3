Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D113DEFF9
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125865; cv=pass; b=mtgdQRM63G7vGxqOTtUFiGHA96kzNaakNReRT/ayo6pxMqxaoYLw0dBnhegmPwLc9HJ4+kRHPVG/yzUun6vZcOuYCXZjB08GS+Fkr1T2Tlq5lan2YTXC6ZYRBDlfxYJyXz14PqhcLmLzfCb8ndFfh2F7QXlLam+KQCFholOV1f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125865; c=relaxed/simple;
	bh=MUZx4Y9OyelgL3hyVBr4k6AAzEQS/l7Wd93ZjmObqWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eS3/QS3YIekQMtNjQa8Vfn//GCuTtj2A0LniMGkfIJboFntWjX7xKMV8Ffyu67AFdlP/5lHMAGEknEw9hULZDbo/y0CZMyJOqa/F5ZyA8IEH5+AG2ivMyWvaFeGX9BAU6EKB47jbuma+IE1Mb1YEauItuECjq54sih04uBQ66/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTxuec0E; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTxuec0E"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-60591ade110so245700137.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775125863; cv=none;
        d=google.com; s=arc-20240605;
        b=dHpDT86gf7TWFWNuMcQ/zxxAaWoKcQT9mN6W4yQ4mYzH7mx+bwVmA+p2DF/x31ahHX
         EGAiL8/ncq/zez7vlGUDHKMbzuVEolsGavqRFzRh12/E6iQcLz6sIFSGT5ZJrxTw1w3+
         hg8zM6hfP7tASgleGxyQumD70xC2XtfkBmmPFwVZ954rXFLwiRBQuzLZuiKWCOSW//zf
         q7gJSbfTZocgHlze4SpD6AGmbclNxzWL7eZyYGJ4VhYCpK2xrVNF5iIInGkMi1mA6/VH
         qLJxiThgYRN2jYRcFKRugy6yhfWYGD8l0Rjq9Du/FNFLHDsTIj6oFUuZMrpB9wRXe3be
         /voA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        fh=6HGwfqRfgWYe75VK5kB5Hft/nBG6QpDxCWUZ7Juh7Ew=;
        b=KeTCojgCVg6T9CYSTl1RaYsmcX3R8FR2DZjn9rjz+1tKAdvFluh+OM69xCVg/gFYTQ
         peo3Uim0DtoX97zV/fWngZaukt3gzwldaDwxzaI8211sil/mqFY2svZriH/KWU+Ux4pm
         RQECoH0+tz7IS/mJhFoQqPP65+Upmp0PMAjCpAjW61jxNdDC2jMV4gkCmezzuoIFALhq
         KI37icrHKNoaZ8sG5/HspbyKdhnnOjb6/X//HNGR7ViUK00L3uWLW7TZhEJhl/YA1OZQ
         slGhuxb9VK92BfMy8uvJgJ6SFqg/ZqxoEZVgIFM7uRErWX4IxjkqaTmnHJ/07bhAHRbX
         FnOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775125863; x=1775730663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        b=UTxuec0EMljOElkQdGAzDus6SYqvMppVh9GQZVaCS9Vy8i/LrsHJMDQrYO9CBPBiY4
         4n3tgBvjxhz/jP2KybP1b4APUcm900XPsGEld37rYe8hJZc2XKHInjZcFm/r9NS2IIzS
         EgFnCSJqwqBjpEGebQmNhnCiKcAtULdOja8UQ8MaV0GYygeaTwgwMpaswyE0fL+IWQCc
         Q1qH/i2pcy3MiS8IQY64gMPkxBvjuNw2aBq705zgWD9/Bh43bArg9KYKOhGRFqYAB1GK
         xDIWNZ/chFP8Ep6TevUE1zSYZTcivEbdBZgh39hINlW3g68r2wDb5oWPg7Ac7KAF31x0
         SFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125863; x=1775730663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        b=hb6N4V0SzRmPWj6rQrW0p07ChEmNPlwaiojmuB3ZbVrUQP7Lq9CJAxtiZPE7cKRGOM
         1sGWVAmNcy1cvKuSP9xNbTOmy1vFaQqhwuyufrM7s+qxnbOy2cin4vOB6iC9uTCuHSND
         TkcP1qb0YmPNX5lDVVQcVPcLefwAdK1bXslv112TleeYWsCr5SeZsn2YtqPpGE+9Lz5y
         0vTKE3bXMRz/KG/0KpSLYWa4n1ei0cRTdH4JUrgwI6P3SkTX7py2uOYb1COeLMp53BmK
         Sxf7WnBGes/bfR/LWQ5INJ/2kvJil/SwEGpiJs1hAgLwmrq8/DTvQNIzGnNz4tJ/29Zd
         +2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUKilcUXYbaqWfjHKcz0u+jgAG3KSrTrn54dmLE8I9xUmPoEt4je/t/K6/hQEb74d4hkuphIlDEb1T6@vger.kernel.org
X-Gm-Message-State: AOJu0YxqONmiqQoJOpssSLQBXd+ps8Qx/LCFLWrgH/gwebdkGjcgrBL8
	lr8Lbk08iri3oDC1o3O762/XRxeQIYwkcJZpZPCSDV+yMVvfGPvzfyCpPMcnaCP72YU1U50GUcV
	9MhhEw0uIkNtqHHSz6nSXQ6XT+aJzwx0=
X-Gm-Gg: ATEYQzx+hZuh5cw+RaKYQgpBuGcI7IKsO8qAkhGLzbS0gb5RxGRX7+eruRuKUowUQrB
	8Q3OBHWS8NNx+LIi/k+lwd6bXRFs2jlypxzDL7j9ehER9YJ4/flGi180NSE3tJtqmuieSVsEYMP
	1eRJPHiFJXDXlmOqzeZyic3kH+pWdm/aFCmmpfsleMt980HvjDiOMOvKeTVFamJqZaXvGYxaSPk
	pPB+2lDG+rCb+cBcB+LwZQZrdhZrfQD3JcdaDIJxzwrRkEbGvZGZwH0IRF3OKZtphwr5JE/IkO7
	xutQn5pkXF3NhsrIUopklMLeDm9LIl3olU1i3Go=
X-Received: by 2002:a05:6102:5343:b0:605:17b8:16db with SMTP id
 ada2fe7eead31-605681ba7d8mr2632044137.25.1775125862274; Thu, 02 Apr 2026
 03:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331171248.973014-1-gaohan@iscas.ac.cn> <20260331171248.973014-3-gaohan@iscas.ac.cn>
 <MA5PR01MB12500707BE1C6E11EC3F4B94FFE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB12500707BE1C6E11EC3F4B94FFE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Thu, 2 Apr 2026 18:30:49 +0800
X-Gm-Features: AQROBzCGzBaggmtPSR3_A5qLKsf5xg9SqM3fnlQMsletNH9S6oyqQ5RfqOQtIhM
Message-ID: <CAAT7Ki_BkfYCN_AJtksOEopU2r0iYPybuEQfm+pMLpsm8+EJkA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zixian Zeng <sycamoremoon376@gmail.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 4:44=E2=80=AFPM Chen Wang <unicorn_wang@outlook.com>=
 wrote:
>
>
> On 4/1/2026 1:12 AM, Han Gao wrote:
> > SG2042's PCIe root complexes are cache-coherent with the CPU. Mark all
> > four PCIe controller nodes (pcie_rc0 through pcie_rc3) as dma-coherent
> > so the kernel uses coherent DMA mappings instead of non-coherent bounce
> > buffering.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/d=
ts/sophgo/sg2042.dtsi
> > index 9fddf3f0b3b9..3af770549742 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > @@ -417,6 +417,7 @@ pcie_rc0: pcie@7060000000 {
> >                       vendor-id =3D <0x1f1c>;
> >                       device-id =3D <0x2042>;
> >                       cdns,no-bar-match-nbits =3D <48>;
> > +                     dma-coherent;
> >                       msi-parent =3D <&msi>;
> >                       status =3D "disabled";
> >               };
> > @@ -439,6 +440,7 @@ pcie_rc1: pcie@7060800000 {
> >                       vendor-id =3D <0x1f1c>;
> >                       device-id =3D <0x2042>;
> >                       cdns,no-bar-match-nbits =3D <48>;
> > +                     dma-coherent;
> >                       msi-parent =3D <&msi>;
> >                       status =3D "disabled";
> >               };
> > @@ -461,6 +463,7 @@ pcie_rc2: pcie@7062000000 {
> >                       vendor-id =3D <0x1f1c>;
> >                       device-id =3D <0x2042>;
> >                       cdns,no-bar-match-nbits =3D <48>;
> > +                     dma-coherent;
> >                       msi-parent =3D <&msi>;
> >                       status =3D "disabled";
> >               };
> > @@ -483,6 +486,7 @@ pcie_rc3: pcie@7062800000 {
> >                       vendor-id =3D <0x1f1c>;
> >                       device-id =3D <0x2042>;
> >                       cdns,no-bar-match-nbits =3D <48>;
> > +                     dma-coherent;
> >                       msi-parent =3D <&msi>;
> >                       status =3D "disabled";
> >               };
> For binding changes, LGTM. But I have a question regarding this change
> in dtsi.
>
>  From your patch description, I understand that enabling the
> `dma-coherent` attribute requires upgrading the firmware `fip.bin`. If a
> user only updates the kernel (which is relatively easy) but forgets or
> doesn't know how to upgrade the firmware, enabling `coherent` might
> cause the kernel to skip all explicit cache maintenance operations.
> Could this pose a subtle risk?
>
> Wouldn't it be safer to leave the upstream unchanged in dtsi and allow
> users to add the `dma-coherent` attribute themselves after they upgrade
> the firmware?

In the firmware, fip.bin and devicetree are distributed together.
So matching issues are unlikely.

>
> I would greatly appreciate your guidance.
>
> Thanks,
>
> Chen
>
>

Thanks,
Han
