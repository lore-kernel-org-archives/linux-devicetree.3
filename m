Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D032E06EF
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784991064; cv=pass; b=mNL5vMwp9ayidSxZ6e9qkn4FHYZJNwm7VGBj5vDFXn2KRPE1twA/LpvAhMCouAywaTRi70gZacCKyMW8gX8afbg8shPZcfZUQ41gsm1dEraMdpgCuKEFqvn6MOLYh0lWCDqmBOf6oQHNjSSgKon0uwCeSVqdrlJ6d1Ikk7sGUFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784991064; c=relaxed/simple;
	bh=szwjKwTuz+yNKvdBSprSzOYxNaUpFRKs+Hx1+fytJsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RrGoiXlduwynK5ihRkN08sih6GR0uE+I2SDdB4HbuOxDzBDbSUZBz7a3NQy8eRjWomJZzlmrDAmIKa4YA9BAyMPQHgnY6gFInGaI1bbkNJWHQrxC5Tf6RepQf4ir3bwr4vyeKLpYen01OrzadlpabHR+lzHpD5zJkn8nFEtKqXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=D6mkLxNr; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="D6mkLxNr"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6689f36ae56so1570052d50.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 07:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784991061; cv=none;
        d=google.com; s=arc-20260327;
        b=DXdcZ/crkeKXgyzSEZPxfDAWhu6iG5YyvEmgDd1G2WTSKJxRrXWqJ9voJHIO7N8WZB
         OSLC8jy2MP2tEUWgmYNusJ/pj1jbv7A+iX/98FAgI+Kli+PMAxdT/TgK2B/bWFjahUCc
         /ldsQQtw1T8ATWazCl4VQHEpTa3PV8A5jb9Xz9kleree2FpH2zq1OBkwTSQaJ3R38ySR
         H0r+Gopim3DRGbc4dyIyuALog2RGZFdRNgmL3e/8pbX63Hq5CZZ7OPACCfFu4a2DjpMB
         45hm74oHeRehhZ8GyjeZvz+drM4Ya/9VmQ1atViXRbHpxmVOiPar2YcruMGyFgyUQMTD
         72Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        fh=Eb85HIDbBz/wKUiotmu7Ylw9KvXqzJD28ZlwI1ACKWs=;
        b=fwTLLxyiqHYsJPWfIBCrmLBbost+YAwhVNk6SxsZenkLqPlO1iTROWtbs2cP/6Y7la
         t/9gFJkw0OwtFlDZf+6KGO+YQiYOLsg/mEMRDsA3HgyN3dhz3fuU7MHKBLv+8WF6v+Gx
         /HdiepyO+NTgeo7TYJ8HdZOa75/Gd4rKS8Jexqm8LPO2n4OEOWgk87eCVhsiF8gNbRUx
         dInRTzOoCS++JYAxkBM/wnoBOWW5CKf9XCco9VA1NBxzuKuIeCo+Mr8rgeCqcRqfsGrY
         fm/VStmdii3QboIOVwGC9ROQ+QEUbOEys167Iq79rdd2qgSoxKsdb7QnDoaFUno1KhE2
         jBWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784991061; x=1785595861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        b=D6mkLxNrMx7ZOuG9IBzlKwQ4jOU/JZaA/PBfJMrnB45cwUpt+qt4XnZJaSX3a15Ngw
         S8wf+BNtyllzw0gBCA1EYavRJXAQp1qTcv94PDbD2Yx/VSkId2TEzUjsLZryQFT68O5n
         0RcCb3NkGLm15MBQtgh0daaHHxaZ1EA5QuD1uvSR91S6QjeHzXUm0LpgKNwR227HnCiY
         CGlOaFYksokO//0F+GBiEIdbX9NEz+NWcws874+skagAuslTowv93OyeVMgXPGWLuLnS
         81kB2VJOzMWWtK6bHIDJGCs6mc5mjM5OFMQppfRkyqWDGSBfG/OOeQ7TZvZvY0crITTV
         rd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784991061; x=1785595861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        b=LMZ7/nLMVT1kTz26b1zGUJOCURxm78OHea3uZnBJc2jm/3qNeK0Lcz/D0KC9SOyc+F
         rcRh9OK6H6M2Q/LJTIrzL+84Bb/49xF/vF18Fv1oAPsQIpC5c6bX9k7dI+XK0/4XOluI
         BX2ca+Zy3MQS+fGqMjhCtOfpdmhoFNtXlM+CyQl842ZzzBbv8n0bmnTALcjs8B5DzXWo
         ZRNqrjSdaOGpOFGcwE1BJYCiR3yA9N/cTAsYPsXxkIXwDGvl/4p3B9XefnkT+cJH5m+t
         +Reb/KANGIx+frSTH9KL75Q15esHH4Hq/wRD6ttd9bd1YewHBWQT3bBaG0u3g9kWlEb8
         XZLA==
X-Forwarded-Encrypted: i=1; AHgh+RqMXGAicWXijg/peL7ynrNQZWJx4I7R2HoJLN/BcigRT6vPmJ+VsEgwsoFqyu1Njz6TMvY1SZdIp16u@vger.kernel.org
X-Gm-Message-State: AOJu0YzrcUJjIr7vkYYBE2REOSg7Opt4U0o0fMr9uv6K071qQuJeSkYB
	tJ+IVbKbEDeBDFD+HeEqdad6ynW0k006xUr3ydGZBsGSN40PhG1DETyeZC+cuV+4CMU47GDTZ5d
	CpDopcQvPRZxLLbQHbDN5TFGqwB77sxfGHI4NXgZRKBisy+G4X3gylXo=
X-Gm-Gg: AR+sD100F/Fv7DIgDyPXabkd0xmyI31VqT6gAPQwcUFRCWMBQAcKe61BiqLlzJT3sLo
	570Tn8xYwEiiqx7OIL65MlxDiZ2JfvVgaBBq5IPWia+fc5FY8iPFGOW/El+fgUw4MTJBuY/FrW4
	VGAUR4SHdDNT2wAqqjSKNRbcuSCOF9LpFmersqGaPS5FxMnZZCtDx6hn/iZfZ9iy8xwAFbnpA3Z
	MoM12OPCPFdawpnlhlrs+WVXi9edzRzEe1g72CByPQEHCz0vsLUTJ6V0y6zH6xWrJt9/zmAWs6C
	P7VD9Kwyzjf+JAtpja7JvvKCkTMmIejNtmerWGZKYyraAsWW1ZU=
X-Received: by 2002:a53:acd0:0:10b0:668:98b:dc54 with SMTP id
 956f58d0204a3-668c7a3fc07mr491029d50.41.1784991060853; Sat, 25 Jul 2026
 07:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org> <7x3b4sttnc4oxkuvxmpkihfi76lkapjcigo7khgcgfytvol7w2@v5ykuyrk2z3m>
 <20260725091824-GKA77545@kernel.org>
In-Reply-To: <20260725091824-GKA77545@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 25 Jul 2026 09:50:50 -0500
X-Gm-Features: AUfX_mxi8h9KJVu9G6xUZkOpr4TATQAXRS0gOluTWc4FpB0HNeql-4Yjcvl9SVk
Message-ID: <CAEev2e8z3cJn+ALoqu=ZoozpTJ6vO_eTgiDrSjC4nOC1XK57FA@mail.gmail.com>
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller driver
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Sat, Jul 25, 2026 at 4:18=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anirudh,
>
> On 15:16 Sun 12 Jul     , Anirudh Srinivasan wrote:
> > On Thu, Jul 02, 2026 at 02:31:36AM +0000, Yixun Lan wrote:
> > > SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Control=
ler
> > > which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 a=
nd
> > > M-PHY v3.0 standard.
> > >
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  drivers/ufs/host/Kconfig        |  12 +
> > >  drivers/ufs/host/Makefile       |   1 +
> > >  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++=
++++++++++
> > >  drivers/ufs/host/ufs-spacemit.h |  90 ++++
> > >  4 files changed, 1034 insertions(+)
> > >
> > > diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> > > index ff170c0b6da0..4f53b7f7688f 100644
> > > --- a/drivers/ufs/host/Kconfig
> > > +++ b/drivers/ufs/host/Kconfig
> > > @@ -132,6 +132,18 @@ config SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
> > >     bool
> > >     default y if SCSI_UFS_EXYNOS && SCSI_UFS_CRYPTO
> > >
> > > +config SCSI_UFS_SPACEMIT
> > > +   tristate "SpacemiT UFS controller driver"
> > > +   depends on SCSI_UFSHCD_PLATFORM && ARCH_SPACEMIT
> >
> > Can you add SCSI_UFSHCD_PLATFORM and SCSI_UFS_SPACEMIT as modules to
> > riscv defconfig (or just add the former and add a default y if
> > ARCH_SPACEMIT in this Kconfig entry). This will let defconfig kernels
> > to boot with persistant rootfs on these devices.
> >
> Ok, will consider adding one entry to riscv defconfig, but this should be
> handled in another separate patch, for making it as module or built-in dr=
iver,
> I'm incline to choose latter one, but would be glad to hear different opi=
nion

Module sounds good.

> --
> Yixun Lan (dlan)
