Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D104A49AC
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215765; cv=none; b=goDLDeM43nJjaHZgzc7SEyN0O2qGOQkHeudg+IHISCjgx1jtRhUW5C0k9LpS3pHtdYdqQrmAO/Hqi3ido8cEjr4GjdRw6rBtN84QRuZMPFqmi0BfPSmXVykVAMtZ4wtgPIK5If+W4EGDeSO5vgcQRbn0/RzpZ9uJ+kk+Lnh7mOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215765; c=relaxed/simple;
	bh=vdpsJ3hZNyAcL4ng7ir9nttQMH7WO6n1mJsbI2s3ZfQ=;
	h=From:MIME-Version:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=by71TLKCTKGu1yZ8UQ6U0ewqI0pzURpESepsASvUQMJNiKHXk65EnlrYcEGg2bePbDEDA0E4Yo1wYUC4U0EVwtrgp3LWnMwzBB6VJQMvoEPWUxYfeGBRyK7Qu5+zwFFSsIq5akgovWhftknk/weTAPjhMvM/xgIwUsi0ohMOIcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=ossystems.com.br; dkim=pass (2048-bit key) header.d=ossystems.com.br header.i=@ossystems.com.br header.b=phhP112C; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ossystems.com.br header.i=@ossystems.com.br header.b="phhP112C"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7bec5112765so1468786137.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1791215763; x=1791820563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=;
        b=phhP112CL4/frIKxoSymCZU/rxHU8+5u3DMQnopTiqZe6U0SYFSdAS09jdFhK6JyPi
         TMd5L/utwziTOBq7/nfDkYmTaWmugk3CpWTnS9gaAkfNIAMox8C9Nllo0G6RxPVaFPII
         8HW4Ys6nCDHwI/fh4vOE4dRz98WKyBw/uErHDBaV87+MS5ozHu/H0syJoj1BltjJKFho
         tzM2MpGfX/gsbS1WnMDLiwu4hFuywI8PxMrhdempfzbhBVYUZPWydCqwkICfDASFxyDY
         9C37NIGtWc4tj5dt3HJTIIy4FGFpDIuVaBT0ZbXOYKUJhn+ZUVhWuHwtsznJiBZE6o7e
         8o2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215763; x=1791820563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=;
        b=mc2T5I31zz581H25hpWrdpYltVhQgl7PCwRa+0EOn0K9faWnNXEH+057w/pZgWSCsP
         P9U+pAEjL0bHp7A/iM3vXexeln7UOdhP/8DS/X2UkHShYBYcuI5Ijaeuvdw/fiFkSHrZ
         9nl+/iNd83vr5F6lGlJ/LTVysrKJ6YzRqUIcDPQIrKemiJFvmV1FvZr5za+qHbGHG/NV
         NZSgoDbjI2dffohrDWtf2YAAMu4EXdtXGRISLcGqe8tKlZuhahJKT/wIQbYfIb33YsSC
         yZjapSD2vN7z21dnWnzIPK6wXvA6Mwo64/l2JhZ15a8C3dEOqHOdFw0jQjf/os84Q+g+
         gp4g==
X-Forwarded-Encrypted: i=1; AKwUvByWvqXdOBqo2VYsVN7hCMxBvlxwmDu1k9oKR1NvA3SMP1bhlPNFNKcRvcMG0sZ4PdKj6aseVDOcMmue@vger.kernel.org
X-Gm-Message-State: AFq9FYJNxlDaj6lR5QXJG4ApfMzLS0oytFtu4uZvSrF+hfuHgUKq8K7a
	YLfbSnSwa/bbTTKg2UqBuK3xOelR8Pv0qRzdOahEegSJjjxf/kccu6dTDQZo4iXxYpEriajFPKO
	v0fKd2jw=
X-Gm-Gg: AYBFou0jiLAfeS8sjJoJiLBJNcGvAELIWNnj+OlJcrFqrNhSvz4cQ3qZtzibXMVQDtF
	Z6AjyIPh+DnNwIZdatGXqq8iQfZx0UBxyBbDFmbnO/5mWlu4K5IGczQ84NqaOcldan4TKUsFj+E
	9thSMCxw2zCwNKbKTU+aicIqMIK1TnF/6PV+7Sv2OPkZiR1am4b8ZSVidD3MnoH6EC72Sa8uQik
	1kKnpdigoyKd5tUxgrhhvNVfUlaaJSISnRdE4HRWEo+jbB1vgwkw0ODP/DcTOQlrRZgiazUaqW4
	FIZCfQytAxvCALKmVtj6hCs/HQhdk2VudboERoJ1RFOf5V2RROt2fEWB9c0NXok0acG4UOSsj7/
	CnkS/XdIv7zZaIN6ipH+00TWhocOzYNBaUuIA3J8ifUnbHuV5w4zXkYX9QVpqjAkstkYp+pX+pk
	E+ThtB1Ezf2Z8rp0XSFZKHT1sWwsIjO8Dy4Mf4tPltSMajuv+0md40cOr/XETys3gJRyLPdanpv
	XtJhY8akyu8DKlFkr3iqFeCvgXlE4R1qQOHKm3nXLxW7cuGExsp
X-Received: by 2002:a05:6102:1626:b0:7a8:15b9:dd34 with SMTP id ada2fe7eead31-7c2427e142amr2516377137.2.1791215762829;
        Mon, 05 Oct 2026 08:56:02 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98c844d9dc3sm967719241.11.2026.10.05.08.56.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 08:56:02 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98c786605e7so714224241.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx4URwLPGtNyZG4azYBKpuwaUgzqzsplkLrskCk2roZqyJv6GABM4CvOAcOdg3qZ3vGrPo5maP3OCEl@vger.kernel.org
X-Received: by 2002:a05:6102:50a1:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7c32f13da5fmr1970603137.3.1791215410224; Mon, 05 Oct 2026
 08:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003012534.418820-3-otavio@ossystems.com.br>
 <20261003012534.418820-5-otavio@ossystems.com.br> <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
In-Reply-To: <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
Date: Mon, 5 Oct 2026 12:49:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
X-Gm-Features: AclHuK9M-oP6_gI2ooGV7CYgI6qML-uXhAEOVd9YWl1vJlrxk84aNQ57MoMLtgc
Message-ID: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks for the review.

Em seg., 5 de out. de 2026 =C3=A0s 06:02, Andre Przywara
<andre.przywara@arm.com> escreveu:
>
> Hi Otavio,
>
> thanks for sending the patch!
>
> On 10/3/26 03:25, Otavio Salvador wrote:
> > Without the calibration cell, the THS driver leaves the sensor
> > calibration registers at their reset value (0x800) and the reported
> > temperatures drift from the real die temperature by a chip-dependent
> > offset.
> >
> > Add the SID node at 0x01c1b000 and wire the thermal sensor to its
> > factory calibration at eFuse offset 0x40, one 16-bit word for each of
> > the two sensors.
> >
> > The R40 user manual gives the size of the thermal sensor key (32 bits)
> > but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
> > but that word is zero on all the boards checked. On an A40i running the
> > Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
> > eFuse word at 0x40 (0x08780875), which confirms the location.
>
> So in some U-Boot BSP sources on github I see
> arch/arm/include/asm/arch-sun8iw11p1/sid.h putting the sensor at 0x34
> (like the H3 or A64).
> Can you check the values there? I see that Tina-Linux puts them at 0x40,
> as you reported, and it's probably more reliable there than in the
> U-Boot sources, but it's worth double checking.
>
> The rest looks alright (checked the manual and how the compatible string
> is handled in the driver), so if you can confirm that it's 0x40:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Yes, I checked 0x34. The BPI U-Boot sid.h for sun8iw11p1 puts the
thermal key there, but that word is zero on every A40i I dumped: three
boards on mainline with this patch, and the Boardcon board on its
vendor kernel. 0x48 is zero too. Only 0x40 holds two plausible 12-bit
values:

  board 1: 0x08780875 (vendor kernel, THS_0_1_CDATA =3D 0x08780875)
  board 2: 0x082d0822
  board 3: 0x083d0838

The value differs per board, and on the vendor kernel THS_0_1_CDATA
holds exactly the word at 0x40. With this patch, CDATA on boards 2 and
3 also matches their word at 0x40. So 0x40 it is, matching Tina Linux.

I also compared the MMIO window at SID + 0x200 with the register-based
readout (the H3 method) across several boots. All 64 words matched, so
the R40 doesn't seem to have the H3 readout problem.

Best regards,
Otavio

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854
